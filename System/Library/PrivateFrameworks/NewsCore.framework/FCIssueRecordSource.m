@implementation FCIssueRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C5A0;
}

- (id)recordType
{
  return CFSTR("Issue");
}

- (int)pbRecordType
{
  return 10;
}

- (id)alwaysLocalizedKeys
{
  if (qword_1ED0F7D68 != -1)
    dispatch_once(&qword_1ED0F7D68, &__block_literal_global_4);
  return (id)qword_1ED0F7D60;
}

- (id)localizableKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)nonLocalizableKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  if (qword_1ED0F7D58 != -1)
    dispatch_once(&qword_1ED0F7D58, block);
  return (id)_MergedGlobals_138;
}

- (unint64_t)storeVersion
{
  return 15;
}

- (id)storeFilename
{
  return CFSTR("issue-record-source");
}

void __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "addObject:", CFSTR("allArticleIDs"));
  objc_msgSend(v3, "addObject:", CFSTR("allowedStorefrontIDs"));
  objc_msgSend(v3, "addObject:", CFSTR("blockedStorefrontIDs"));
  objc_msgSend(v3, "addObject:", CFSTR("channelTagID"));
  objc_msgSend(v3, "addObject:", CFSTR("coverArticleID"));
  objc_msgSend(v3, "addObject:", CFSTR("coverAspectRatio"));
  objc_msgSend(v3, "addObject:", CFSTR("coverImage"));
  objc_msgSend(v3, "addObject:", CFSTR("coverPrimaryColor"));
  objc_msgSend(v3, "addObject:", CFSTR("coverBackgroundColor"));
  objc_msgSend(v3, "addObject:", CFSTR("coverTextColor"));
  objc_msgSend(v3, "addObject:", CFSTR("coverAccentColor"));
  objc_msgSend(v3, "addObject:", CFSTR("description"));
  objc_msgSend(v3, "addObject:", CFSTR("edition"));
  objc_msgSend(v3, "addObject:", CFSTR("halfLife"));
  objc_msgSend(v3, "addObject:", CFSTR("isDraft"));
  objc_msgSend(v3, "addObject:", CFSTR("isPaid"));
  objc_msgSend(v3, "addObject:", CFSTR("minNewsVersion"));
  objc_msgSend(v3, "addObject:", CFSTR("layeredCover"));
  objc_msgSend(v3, "addObject:", CFSTR("layeredCoverAspectRatio"));
  objc_msgSend(v3, "addObject:", CFSTR("layeredCoverPrimaryColor"));
  objc_msgSend(v3, "addObject:", CFSTR("metadataAssetEncrypted"));
  objc_msgSend(v3, "addObject:", CFSTR("notificationDescription"));
  objc_msgSend(v3, "addObject:", CFSTR("pdfResourceArchive"));
  objc_msgSend(v3, "addObject:", CFSTR("publishDate"));
  objc_msgSend(v3, "addObject:", CFSTR("title"));
  objc_msgSend(v3, "addObject:", CFSTR("topicTagIDs"));
  objc_msgSend(v3, "addObject:", CFSTR("type"));
  objc_msgSend(v3, "addObject:", CFSTR("sortDate"));
  if (objc_msgSend((id)objc_opt_class(), "_useTaggedImages"))
  {
    objc_msgSend(CFSTR("coverImage"), "stringByAppendingString:", CFSTR("2"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v2);

  }
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 20000000;
}

void __42__FCIssueRecordSource_alwaysLocalizedKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("scores"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7D60;
  qword_1ED0F7D60 = v0;

}

void __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__FCIssueRecordSource_nonLocalizableKeys__block_invoke_2;
  v3[3] = &unk_1E463AA30;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_138;
  _MergedGlobals_138 = v1;

}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v6;
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D626F0]);
  objc_msgSend(v8, "setBase:", v7);
  objc_msgSend(v6, "objectForKey:", CFSTR("allArticleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setAllArticleIDs:", v10);

  objc_msgSend(v6, "objectForKey:", CFSTR("allowedStorefrontIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v8, "setAllowedStorefrontIDs:", v12);

  objc_msgSend(v6, "objectForKey:", CFSTR("blockedStorefrontIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v8, "setBlockedStorefrontIDs:", v14);

  objc_msgSend(v6, "objectForKey:", CFSTR("channelTagID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setChannelTagID:", v15);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("coverArticleID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;
  objc_msgSend(v8, "setCoverArticleID:", v18);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("coverAspectRatio"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;
  objc_msgSend(v21, "doubleValue");
  objc_msgSend(v8, "setCoverAspectRatio:");

  objc_msgSend((id)objc_opt_class(), "_URLStringForCoverImageKey:inRecord:", CFSTR("coverImage"), v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoverImageURL:", v22);

  objc_msgSend(v6, "objectForKey:", CFSTR("coverPrimaryColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoverPrimaryColor:", v23);

  objc_msgSend(v6, "objectForKey:", CFSTR("coverBackgroundColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoverBackgroundColor:", v24);

  objc_msgSend(v6, "objectForKey:", CFSTR("coverTextColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoverTextColor:", v25);

  objc_msgSend(v6, "objectForKey:", CFSTR("coverAccentColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoverAccentColor:", v26);

  objc_msgSend(v6, "objectForKey:", CFSTR("edition"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEdition:", v27);

  objc_msgSend(v6, "objectForKey:", CFSTR("halfLife"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHalfLifeMilliseconds:", objc_msgSend(v28, "unsignedLongLongValue"));

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("isDraft"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;
  objc_msgSend(v8, "setIsDraft:", objc_msgSend(v31, "BOOLValue"));

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("isPaid"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
  }
  else
  {
    v33 = 0;
  }
  v34 = v33;
  objc_msgSend(v8, "setIsPaid:", objc_msgSend(v34, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("description"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIssueDescription:", v35);

  objc_msgSend(v6, "objectForKey:", CFSTR("minNewsVersion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v36));

  objc_msgSend(v6, "objectForKey:", CFSTR("layeredCover"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayeredCover:", v37);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("layeredCoverAspectRatio"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
  }
  else
  {
    v39 = 0;
  }
  v40 = v39;
  objc_msgSend(v40, "doubleValue");
  objc_msgSend(v8, "setLayeredCoverAspectRatio:");

  objc_msgSend(v6, "objectForKey:", CFSTR("layeredCoverPrimaryColor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayeredCoverPrimaryColor:", v41);

  objc_msgSend(v6, "objectForKey:", CFSTR("notificationDescription"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationDescription:", v42);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("pdfResourceArchive"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v43;
    else
      v44 = 0;
  }
  else
  {
    v44 = 0;
  }
  v45 = v44;
  objc_msgSend(v8, "setPdfResourceArchiveURL:", v45);

  objc_msgSend(v6, "objectForKey:", CFSTR("publishDate"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "pbDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPublishDate:", v47);

  objc_msgSend(v6, "objectForKey:", CFSTR("title"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v48);

  objc_msgSend(v6, "objectForKey:", CFSTR("topicTagIDs"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTopicTagIDs:", v49);

  objc_msgSend(v6, "objectForKey:", CFSTR("sortDate"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "pbDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDate:", v51);

  objc_msgSend(v6, "objectForKey:", CFSTR("type"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("flint")) & 1) != 0)
  {
    v53 = 1;
  }
  else
  {
    if (!objc_msgSend(v52, "isEqualToString:", CFSTR("pdf")))
      goto LABEL_36;
    v53 = 2;
  }
  objc_msgSend(v8, "setType:", v53);
LABEL_36:
  if (objc_msgSend(v8, "type") == 2)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("metadataAssetEncrypted"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
    }
    else
    {
      v55 = 0;
    }
    v57 = v55;

    if (v57)
      objc_msgSend(v8, "setMetadataURL:", v57);
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCRecordFieldURLProtocol URLForRecordID:fieldName:](FCRecordFieldURLProtocol, "URLForRecordID:fieldName:", v56, CFSTR("metadataAsset"));
    v57 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "absoluteString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMetadataURL:", v58);

  }
  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("scores"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    v63 = v61;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("scores"));
    v63 = (id)objc_claimAutoreleasedReturnValue();
  }
  v64 = v63;

  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D625C8]), "initWithData:", v64);
  objc_msgSend(v8, "setScores:", v65);

  return v8;
}

+ (id)_URLStringForCoverImageKey:(id)a3 inRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "_useTaggedImages") & 1) != 0)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = v10;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v11 = v14;

      v10 = 0;
    }

  }
  else
  {
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v8;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v11 = v12;
  }

  return v11;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 2000000;
}

@end
