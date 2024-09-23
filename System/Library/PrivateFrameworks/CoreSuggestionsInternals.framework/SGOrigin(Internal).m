@implementation SGOrigin(Internal)

- (void)addDetailsFromOriginatingGenericEntity:()Internal
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "title");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (int)*MEMORY[0x1E0D199E0];
    v7 = *(void **)(a1 + v6);
    *(_QWORD *)(a1 + v6) = v5;

    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "creationTimestamp");
    v10 = v9;

    objc_msgSend(v8, "dateWithTimeIntervalSince1970:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (int)*MEMORY[0x1E0D199B8];
    v13 = *(void **)(a1 + v12);
    *(_QWORD *)(a1 + v12) = v11;

  }
}

- (void)addDetailsFromParticipantsOfEntity:()Internal
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a3, "author");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (int)*MEMORY[0x1E0D199C0];
    v6 = *(void **)(a1 + v5);
    *(_QWORD *)(a1 + v5) = v4;

  }
}

- (void)addDetailsFromOriginatingMessageEntity:()Internal
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "addDetailsFromOriginatingGenericEntity:", v4);
    objc_msgSend(a1, "addDetailsFromParticipantsOfEntity:", v4);

  }
}

- (void)addDetailsFromOriginatingContactEntity:()Internal
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(a1, "addDetailsFromOriginatingGenericEntity:", v4);
    v5 = (int)*MEMORY[0x1E0D199A8];
    v6 = *(void **)&a1[v5];
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(v9, "title");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = *(void **)&a1[v5];
    *(_QWORD *)&a1[v5] = v7;

    v4 = v9;
  }

}

- (void)addDetailsFromOriginatingCalendarEntity:()Internal
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "addDetailsFromOriginatingGenericEntity:", v4);
    objc_msgSend(a1, "addDetailsFromParticipantsOfEntity:", v4);

  }
}

- (void)addDetailsFromOriginatingInteractionEntity:()Internal
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "addDetailsFromOriginatingGenericEntity:", v4);
    objc_msgSend(v4, "duplicateKey");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "interactionKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleId");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (int)*MEMORY[0x1E0D199A0];
    v8 = *(void **)&a1[v7];
    *(_QWORD *)&a1[v7] = v6;

  }
}

- (void)addSnippetIfNotExistsFromContentOfEntity:()Internal
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (int)*MEMORY[0x1E0D199A8];
    if (!*(_QWORD *)(a1 + v6))
    {
      objc_msgSend(v4, "content");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && (unint64_t)objc_msgSend(v7, "length") > 0x7D0)
      {
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "substringToIndex:", 1999);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v12;
        v23[1] = CFSTR("…");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_pas_proxyStringByConcatenatingStrings:", v13);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v10);
      }
      else
      {
        v9 = v8;
      }

      v14 = *(void **)(a1 + v6);
      *(_QWORD *)(a1 + v6) = v9;

      if (objc_msgSend(*(id *)(a1 + v6), "_pas_retainsConmingledBackingStore"))
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", *(_QWORD *)(a1 + v6));
        v16 = *(void **)(a1 + v6);
        *(_QWORD *)(a1 + v6) = v15;

      }
      v17 = (_QWORD *)(a1 + (int)*MEMORY[0x1E0D199B0]);
      *v17 = objc_msgSend(v5, "contentRangeOfInterest");
      v17[1] = v18;
      objc_msgSend(v5, "operatingSystemVersion");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (int)*MEMORY[0x1E0D199D0];
      v21 = *(void **)(a1 + v20);
      *(_QWORD *)(a1 + v20) = v19;

      v22 = objc_msgSend(MEMORY[0x1E0D198F0], "showOperatingSystemVersionInSnippets");
      *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D199D8]) = v22;
    }
  }

}

- (void)addRecipientDetailsFromOriginatingMessageEntity:()Internal entity:store:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id *v24;
  __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D197F0];
  v11 = a3;
  objc_msgSend(v10, "isSent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "hasTag:", v12);

  objc_msgSend(MEMORY[0x1E0D197F0], "isSent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "hasTag:", v14);

  *(_BYTE *)(a1 + (int)*MEMORY[0x1E0D199C8]) = v13;
  if (v13 && (v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D19920], "recordIdWithInternalEntityId:", objc_msgSend(v8, "groupId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadEntityByRecordId:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "title");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "duplicateKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pseudoContactKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identityKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v9;
    if (objc_msgSend(v21, "type") == 1)
    {
      v22 = (void *)v18;
      objc_msgSend(v21, "emailAddress");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = (id *)MEMORY[0x1E0C966A8];
    }
    else if (objc_msgSend(v21, "type") == 3)
    {
      v22 = (void *)v18;
      objc_msgSend(v21, "phone");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = (id *)MEMORY[0x1E0C967C0];
    }
    else
    {
      v22 = (void *)v18;
      if (objc_msgSend(v21, "type") != 5)
      {
        v23 = &stru_1E7DB83A8;
        v25 = &stru_1E7DB83A8;
        goto LABEL_10;
      }
      objc_msgSend(v21, "socialProfile");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = (id *)MEMORY[0x1E0C96868];
    }
    v25 = (__CFString *)*v24;
LABEL_10:
    v26 = objc_alloc(MEMORY[0x1E0CA6B10]);
    v34[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithDisplayName:handles:handleIdentifier:", v22, v27, v25);

    v33 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (int)*MEMORY[0x1E0D199E8];
    v31 = *(void **)(a1 + v30);
    *(_QWORD *)(a1 + v30) = v29;

    v9 = v32;
  }

}

+ (uint64_t)originTypeForEntityType:()Internal
{
  uint64_t result;
  void *v7;

  result = 4;
  switch(a3)
  {
    case 13:
      return result;
    case 14:
    case 15:
      goto LABEL_6;
    case 16:
      result = 5;
      break;
    case 17:
      result = 6;
      break;
    case 18:
      result = 7;
      break;
    default:
      if (a3 == 1)
      {
        result = 3;
      }
      else if (a3 == 5)
      {
        result = 1;
      }
      else
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 44, CFSTR("Unknown entity type %u"), a3);

        result = 0;
      }
      break;
  }
  return result;
}

+ (id)originForDuplicateKey:()Internal sourceKey:store:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v8 = a3;
  v9 = a5;
  switch(objc_msgSend(v8, "entityType"))
  {
    case 1:
    case 5:
    case 13:
    case 16:
    case 18:
      objc_msgSend(v9, "loadEntityByKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "originForDuplicateKey:entity:parent:store:", v8, v11, 0, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
    case 6:
    case 7:
    case 8:
    case 15:
    case 19:
    case 20:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      objc_msgSend(v8, "parentKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 71, CFSTR("Extracted data must have a parent."));

      }
      objc_msgSend(v9, "loadEntityByKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parentKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loadEntityByKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "originForDuplicateKey:entity:parent:store:", v8, v11, v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 21:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "duplicateKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entityType");
      SGEntityTypeDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 102, CFSTR("Unsupported type: %@"), v17);

      goto LABEL_7;
    case 4:
      objc_msgSend(v8, "parentKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend(v9, "mostRecentParentKeyForDuplicateKey:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 78, CFSTR("Pseudo contacts must be derived from at least one parent entity"));

          v19 = 0;
        }
      }
      objc_msgSend(v9, "loadEntityByKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loadEntityByKey:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "originForDuplicateKey:entity:parent:store:", v8, v11, v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
LABEL_9:

      break;
    case 17:
      objc_msgSend(MEMORY[0x1E0D198C8], "originWithType:sourceKey:externalKey:fromForwardedMessage:", 6, &stru_1E7DB83A8, &stru_1E7DB83A8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_7:
      v14 = 0;
      break;
  }

  return v14;
}

+ (id)originForDuplicateKey:()Internal entity:parent:store:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  switch(objc_msgSend(v11, "entityType"))
  {
    case 1:
      v30 = (void *)MEMORY[0x1E0D198C8];
      objc_msgSend(v12, "sourceKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "curatedEventKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "externalId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "originWithType:sourceKey:externalKey:fromForwardedMessage:", 3, v31, v33, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "addDetailsFromOriginatingCalendarEntity:", v12);
      goto LABEL_27;
    case 2:
    case 6:
    case 7:
    case 8:
    case 15:
    case 19:
    case 20:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v83 = v12;
      v15 = v14;
      objc_msgSend(v11, "parentKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 143, CFSTR("Extracted data must have a parent."));

      }
      v17 = (void *)MEMORY[0x1E0D198C8];
      v18 = objc_msgSend(a1, "originTypeForEntityType:", objc_msgSend(v16, "entityType"));
      objc_msgSend(v16, "messageKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "originWithType:sourceKey:externalKey:fromForwardedMessage:", v18, v20, v22, objc_msgSend(v13, "isFromForwardedMessage"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "addDetailsFromOriginatingMessageEntity:", v13);
      objc_msgSend(v11, "entityType");
      v14 = v15;
      v12 = v83;
      if (SGEntityTypeIsContactDetail())
        objc_msgSend(v23, "addRecipientDetailsFromOriginatingMessageEntity:entity:store:", v13, v83, v15);
      objc_msgSend(v83, "duplicateKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "entityType");

      objc_msgSend(v23, "addSnippetIfNotExistsFromContentOfEntity:", v83);
      if (v25 == 2)
        objc_msgSend(v23, "addSnippetIfNotExistsFromContentOfEntity:", v13);
      v26 = v23;

      goto LABEL_28;
    case 3:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 21:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "duplicateKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "entityType");
      SGEntityTypeDescription();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 241, CFSTR("Unsupported type: %@"), v29);

      goto LABEL_10;
    case 4:
      objc_msgSend(v11, "parentKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 167, CFSTR("Pseudo contacts must be derived from at least one parent entity"));

      }
      v82 = v11;
      if (objc_msgSend(v34, "entityType") == 5 || objc_msgSend(v34, "entityType") == 13)
      {
        v35 = (void *)MEMORY[0x1E0D198C8];
        v36 = objc_msgSend(a1, "originTypeForEntityType:", objc_msgSend(v34, "entityType"));
        objc_msgSend(v34, "messageKey");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "source");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "messageKey");
        v39 = v34;
        v40 = v13;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "uniqueIdentifier");
        v42 = v14;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "originWithType:sourceKey:externalKey:fromForwardedMessage:", v36, v38, v43, objc_msgSend(v40, "isFromForwardedMessage"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v42;
        v13 = v40;
        v34 = v39;

        objc_msgSend(v44, "addDetailsFromOriginatingMessageEntity:", v13);
        objc_msgSend(v44, "addSnippetIfNotExistsFromContentOfEntity:", v12);
        v45 = v44;
        v46 = v13;
LABEL_17:
        objc_msgSend(v45, "addSnippetIfNotExistsFromContentOfEntity:", v46);
LABEL_18:
        v26 = v44;

        v11 = v82;
        goto LABEL_28;
      }
      if (objc_msgSend(v34, "entityType") == 1)
      {
        v55 = (void *)MEMORY[0x1E0D198C8];
        objc_msgSend(v12, "sourceKey");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "curatedEventKey");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "externalId");
        v58 = v12;
        v59 = v13;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "originWithType:sourceKey:externalKey:fromForwardedMessage:", 3, v56, v60, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v59;
        v12 = v58;

        objc_msgSend(v44, "addDetailsFromOriginatingCalendarEntity:", v13);
        v45 = v44;
        v46 = v58;
        goto LABEL_17;
      }
      if (objc_msgSend(v34, "entityType") == 16)
      {
        v61 = (void *)MEMORY[0x1E0D198C8];
        objc_msgSend(v34, "interactionKey");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "bundleId");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "interactionKey");
        v64 = v34;
        v65 = v12;
        v66 = v13;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "personHandle");
        v68 = v14;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "originWithType:sourceKey:externalKey:fromForwardedMessage:", 5, v63, v69, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v68;
        v13 = v66;
        v12 = v65;
        v34 = v64;

        objc_msgSend(v44, "addDetailsFromOriginatingInteractionEntity:", v13);
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "entityType");
      SGEntityTypeDescription();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGOrigin+Internal.m"), 195, CFSTR("Dunno how to handle a pseudo contact with a parent entity type: %@"), v71);

LABEL_26:
      v84 = (void *)MEMORY[0x1E0D198C8];
      v72 = objc_msgSend(a1, "originTypeForEntityType:", objc_msgSend(v11, "entityType"));
      objc_msgSend(v11, "messageKey");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "source");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageKey");
      v75 = v13;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "uniqueIdentifier");
      v77 = v14;
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "originWithType:sourceKey:externalKey:fromForwardedMessage:", v72, v74, v78, objc_msgSend(v12, "isFromForwardedMessage"));
      v26 = (id)objc_claimAutoreleasedReturnValue();

      v14 = v77;
      v13 = v75;

      objc_msgSend(v26, "addDetailsFromOriginatingMessageEntity:", v12);
LABEL_27:
      objc_msgSend(v26, "addSnippetIfNotExistsFromContentOfEntity:", v12);
LABEL_28:

      return v26;
    case 5:
    case 13:
    case 18:
      goto LABEL_26;
    case 16:
      v47 = (void *)MEMORY[0x1E0D198C8];
      objc_msgSend(v11, "interactionKey");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bundleId");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "interactionKey");
      v50 = v11;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "personHandle");
      v52 = v12;
      v53 = v13;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "originWithType:sourceKey:externalKey:fromForwardedMessage:", 5, v49, v54, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v53;
      v12 = v52;

      v11 = v50;
      objc_msgSend(v26, "addDetailsFromOriginatingInteractionEntity:", v12);
      goto LABEL_28;
    case 17:
      objc_msgSend(MEMORY[0x1E0D198C8], "originWithType:sourceKey:externalKey:fromForwardedMessage:", 6, &stru_1E7DB83A8, &stru_1E7DB83A8, 0);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    default:
LABEL_10:
      v26 = 0;
      goto LABEL_28;
  }
}

@end
