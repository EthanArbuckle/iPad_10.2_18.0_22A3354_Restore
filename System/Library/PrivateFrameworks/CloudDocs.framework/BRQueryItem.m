@implementation BRQueryItem

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[43];
  _QWORD v26[44];

  v26[43] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2 = *MEMORY[0x1E0CB2DE0];
    v25[0] = *MEMORY[0x1E0CB2DE8];
    v25[1] = v2;
    v26[0] = &__block_literal_global_15;
    v26[1] = &__block_literal_global_44;
    v3 = *MEMORY[0x1E0CB2E08];
    v25[2] = *MEMORY[0x1E0CB2DF0];
    v25[3] = v3;
    v26[2] = &__block_literal_global_45;
    v26[3] = &__block_literal_global_46;
    v4 = *MEMORY[0x1E0CB2E18];
    v25[4] = *MEMORY[0x1E0CB2E10];
    v25[5] = v4;
    v26[4] = &__block_literal_global_47;
    v26[5] = &__block_literal_global_48_0;
    v5 = *MEMORY[0x1E0CB2E28];
    v25[6] = *MEMORY[0x1E0CB2E20];
    v25[7] = v5;
    v26[6] = &__block_literal_global_49;
    v26[7] = &__block_literal_global_50;
    v6 = *MEMORY[0x1E0CB2E00];
    v25[8] = *MEMORY[0x1E0CB2DD8];
    v25[9] = v6;
    v26[8] = &__block_literal_global_51;
    v26[9] = &__block_literal_global_52;
    v7 = *MEMORY[0x1E0CB2EB8];
    v25[10] = *MEMORY[0x1E0CB2DF8];
    v25[11] = v7;
    v26[10] = &__block_literal_global_53_0;
    v26[11] = &__block_literal_global_54;
    v8 = *MEMORY[0x1E0CB2EC0];
    v25[12] = *MEMORY[0x1E0CB2EA8];
    v25[13] = v8;
    v26[12] = &__block_literal_global_56;
    v26[13] = &__block_literal_global_57;
    v9 = *MEMORY[0x1E0CB2EF0];
    v25[14] = *MEMORY[0x1E0CB2EC8];
    v25[15] = v9;
    v26[14] = &__block_literal_global_58_0;
    v26[15] = &__block_literal_global_59;
    v10 = *MEMORY[0x1E0CB2EE0];
    v25[16] = *MEMORY[0x1E0CB2E90];
    v25[17] = v10;
    v26[16] = &__block_literal_global_60;
    v26[17] = &__block_literal_global_61;
    v11 = *MEMORY[0x1E0CB2E88];
    v25[18] = *MEMORY[0x1E0CB2EE8];
    v25[19] = v11;
    v26[18] = &__block_literal_global_62;
    v26[19] = &__block_literal_global_63_0;
    v12 = *MEMORY[0x1E0CB2F08];
    v25[20] = *MEMORY[0x1E0CB2EF8];
    v25[21] = v12;
    v26[20] = &__block_literal_global_64;
    v26[21] = &__block_literal_global_65;
    v13 = *MEMORY[0x1E0CB2E80];
    v25[22] = *MEMORY[0x1E0CB2ED0];
    v25[23] = v13;
    v26[22] = &__block_literal_global_66;
    v26[23] = &__block_literal_global_67;
    v14 = *MEMORY[0x1E0CB2ED8];
    v25[24] = *MEMORY[0x1E0CB2F00];
    v25[25] = v14;
    v26[24] = &__block_literal_global_68_0;
    v26[25] = &__block_literal_global_69;
    v15 = *MEMORY[0x1E0CB2F28];
    v25[26] = *MEMORY[0x1E0CB2F30];
    v25[27] = v15;
    v26[26] = &__block_literal_global_70;
    v26[27] = &__block_literal_global_71;
    v25[28] = *MEMORY[0x1E0CB2F20];
    v25[29] = CFSTR("NSMetadataUbiquitousSharedItemLastEditorNameKey");
    v26[28] = &__block_literal_global_72_0;
    v26[29] = &__block_literal_global_73;
    v16 = *MEMORY[0x1E0CB2F38];
    v25[30] = CFSTR("NSMetadataUbiquitousSharedItemLastEditorNameComponentsKey");
    v25[31] = v16;
    v26[30] = &__block_literal_global_74;
    v26[31] = &__block_literal_global_75_0;
    v17 = *MEMORY[0x1E0CB2F50];
    v25[32] = *MEMORY[0x1E0CB2F10];
    v25[33] = v17;
    v26[32] = &__block_literal_global_76;
    v26[33] = &__block_literal_global_77;
    v25[34] = *MEMORY[0x1E0CB2F18];
    v25[35] = CFSTR("BRURLTagNamesKey");
    v26[34] = &__block_literal_global_78;
    v26[35] = &__block_literal_global_79;
    v25[36] = CFSTR("BRMetadataItemFileObjectIdentifierKey");
    v25[37] = CFSTR("BRMetadataItemParentFileIDKey");
    v26[36] = &__block_literal_global_80;
    v26[37] = &__block_literal_global_81;
    v25[38] = CFSTR("BRMetadataUbiquitousItemDownloadingSizeKey");
    v25[39] = CFSTR("BRMetadataUbiquitousItemUploadingSizeKey");
    v26[38] = &__block_literal_global_82;
    v26[39] = &__block_literal_global_83;
    v25[40] = CFSTR("BRModifiedSinceSharedKey");
    v25[41] = CFSTR("BRMetadataIsTopLevelSharedItemKey");
    v26[40] = &__block_literal_global_84;
    v26[41] = &__block_literal_global_85;
    v25[42] = CFSTR("BRMetadataCreatorNameComponentsKey");
    v26[42] = &__block_literal_global_86;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 43);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)_getterMap;
    _getterMap = v18;

    objc_msgSend((id)_getterMap, "keyEnumerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)_allKeys;
    _allKeys = v21;

    objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", _allKeys);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)_sharedKeySet;
    _sharedKeySet = v23;

  }
}

id __25__BRQueryItem_initialize__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  id v13;

  objc_msgSend(a2, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C99AD0];
  v12 = 0;
  v13 = 0;
  v4 = objc_msgSend(v2, "getPromisedItemResourceValue:forKey:error:", &v13, v3, &v12);
  v5 = v13;
  v6 = v12;
  v7 = v6;
  if (v4)
  {
    v8 = v5;
  }
  else
  {
    NSLog((NSString *)CFSTR("unable to get %@ property for %@: %@\n"), v3, v2, v6);
    v8 = 0;
  }

  if (v8)
  {
    v9 = (void *)_UTTypeCopyPedigreeSet();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __25__BRQueryItem_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  return _getContentTypeValue(a2, 1);
}

id __25__BRQueryItem_initialize__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "isDirectory") ^ 1;
  objc_msgSend(v2, "logicalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "br_displayFilenameWithExtensionHidden:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logicalName");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "size");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_6()
{
  return MEMORY[0x1E0C9AAB0];
}

uint64_t __25__BRQueryItem_initialize__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appLibraryID");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "creationDate");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentModificationDate");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isConflicted"));
}

id __25__BRQueryItem_initialize__block_invoke_13(uint64_t a1, void *a2)
{
  unsigned int v2;

  v2 = objc_msgSend(a2, "br_downloadStatus") - 1;
  if (v2 > 2)
    return 0;
  else
    return **((id **)&unk_1E3DA6128 + (__int16)v2);
}

id __25__BRQueryItem_initialize__block_invoke_14(uint64_t a1, void *a2)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(a2, "br_downloadStatus");
  v3 = (void *)MEMORY[0x1E0C9AAB0];
  if (v2 == 1)
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    return v3;
  else
    return 0;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_15(uint64_t a1, void *a2)
{
  return _getIsDownloading(a2);
}

id __25__BRQueryItem_initialize__block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v2 = a2;
  if (objc_msgSend(v2, "isDirectory"))
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("inflight"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("downloaded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedLongLongValue");

    objc_msgSend(v2, "attributeForKey:", CFSTR("needsDownload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    if (objc_msgSend(v3, "downloadTotalSize") > v7)
      v7 = objc_msgSend(v3, "downloadTotalSize");
    if (!(v7 + v5))
    {
      v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)(objc_msgSend(v3, "downloadCompletedSize") + v5) * 100.0 / (double)(v7 + v5));
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v10 = v8;
    goto LABEL_15;
  }
  v9 = objc_msgSend(v2, "br_downloadStatus");
  if (v9)
  {
    if (v9 != 3)
    {
      objc_msgSend(v2, "attributeForKey:", CFSTR("dl%"));
      v11 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v11;
      v12 = &unk_1E3DC2B50;
      if (v11)
        v12 = (void *)v11;
      v8 = v12;
      goto LABEL_14;
    }
    v10 = &unk_1E3DC2B40;
  }
  else
  {
    v10 = 0;
  }
LABEL_16:

  return v10;
}

id __25__BRQueryItem_initialize__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "isDownloading")
    && objc_msgSend(v2, "br_downloadStatus") != 3
    && objc_msgSend(v2, "isNetworkOffline"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4355, 0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("dlErr"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v2 = a2;
  v3 = objc_msgSend(v2, "br_uploadStatus");
  if (v3 >= 4)
  {
    brc_bread_crumbs((uint64_t)"_getIsUploaded", 381);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __25__BRQueryItem_initialize__block_invoke_18_cold_1();

    v4 = 0;
  }
  else
  {
    v4 = qword_1E3DA6140[(__int16)v3];
  }

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_19(uint64_t a1, void *a2)
{
  return _getIsUploading(a2);
}

uint64_t __25__BRQueryItem_initialize__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDownloadRequested");
}

id __25__BRQueryItem_initialize__block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  double v16;

  v2 = a2;
  if (objc_msgSend(v2, "isDirectory"))
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("inflight"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeForKey:", CFSTR("uploaded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedLongLongValue");

    objc_msgSend(v2, "attributeForKey:", CFSTR("needsUpload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v2, "attributeForKey:", CFSTR("needsSyncUp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    if (v7 < objc_msgSend(v3, "uploadTotalSize"))
      v7 = objc_msgSend(v3, "uploadTotalSize");
    v10 = v7 + v5;
    if (v10 || !v9)
    {
      if (v10)
        v13 = (double)(unint64_t)(objc_msgSend(v3, "uploadCompletedSize") + v5) / (double)v10;
      else
        v13 = 1.0;
      if (v9)
        v13 = v13 * 0.95;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 * 100.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v12 = objc_msgSend(v2, "br_uploadStatus");
    if (v12)
    {
      if (v12 == 3)
      {
        v11 = &unk_1E3DC2B40;
      }
      else if (v12 == 2)
      {
        v11 = &unk_1E3DC2B60;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v2, "attributeForKey:", CFSTR("ul%"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(v14, "numberWithDouble:", v16 * 0.95);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

id __25__BRQueryItem_initialize__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "br_uploadStatus") == 3 || !objc_msgSend(v2, "isNetworkOffline"))
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("ulErr"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4355, 0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_23(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isBRAlias"));
}

uint64_t __25__BRQueryItem_initialize__block_invoke_24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containerDisplayName");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localRepresentationURL");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_26(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isShared"));
}

id __25__BRQueryItem_initialize__block_invoke_27(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "attributeForKey:", CFSTR("owner-components"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_formattedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributeForKey:", CFSTR("owner-components"));
}

uint64_t __25__BRQueryItem_initialize__block_invoke_29(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributeForKey:", CFSTR("last-editor-components"));
}

id __25__BRQueryItem_initialize__block_invoke_30(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "attributeForKey:", CFSTR("last-editor-components"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_formattedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributeForKey:", CFSTR("last-editor-components"));
}

id __25__BRQueryItem_initialize__block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id *v4;
  void *v5;
  NSObject *v6;

  v2 = a2;
  v3 = 0;
  switch(objc_msgSend(v2, "br_shareOptions"))
  {
    case 0u:
      break;
    case 1u:
    case 3u:
      v4 = (id *)MEMORY[0x1E0CB2F40];
      goto LABEL_4;
    case 2u:
    case 4u:
      v4 = (id *)MEMORY[0x1E0CB2F48];
LABEL_4:
      v3 = *v4;
      break;
    default:
      brc_bread_crumbs((uint64_t)"_getSharePermissions", 465);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __25__BRQueryItem_initialize__block_invoke_32_cold_1();

      v3 = 0;
      break;
  }

  return v3;
}

id __25__BRQueryItem_initialize__block_invoke_33(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id *v4;
  void *v5;
  NSObject *v6;

  v2 = a2;
  v3 = 0;
  switch(objc_msgSend(v2, "br_shareOptions"))
  {
    case 0u:
      break;
    case 1u:
    case 2u:
    case 4u:
      v4 = (id *)MEMORY[0x1E0CB2F48];
      goto LABEL_7;
    case 3u:
      v4 = (id *)MEMORY[0x1E0CB2F40];
LABEL_7:
      v3 = *v4;
      break;
    default:
      brc_bread_crumbs((uint64_t)"_getSharedItemCurrentUserPermissions", 486);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __25__BRQueryItem_initialize__block_invoke_32_cold_1();

      v3 = 0;
      break;
  }

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_34(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharedItemRole");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_35(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sharedItemRole");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_36(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributeForKey:", CFSTR("tags"));
}

uint64_t __25__BRQueryItem_initialize__block_invoke_37(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fileObjectID");
}

uint64_t __25__BRQueryItem_initialize__block_invoke_38(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "parentFileID");
}

id __25__BRQueryItem_initialize__block_invoke_39(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = a2;
  _getIsDownloading(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(v2, "attributeForKey:", CFSTR("needsDownload"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongLongValue");

    objc_msgSend(v2, "attributeForKey:", CFSTR("downloaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8 + v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __25__BRQueryItem_initialize__block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = a2;
  _getIsUploading(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    if (objc_msgSend(v2, "isDirectory"))
    {
      objc_msgSend(v2, "attributeForKey:", CFSTR("needsUpload"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedLongLongValue");

      objc_msgSend(v2, "attributeForKey:", CFSTR("uploaded"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedLongLongValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8 + v6);
    }
    else
    {
      objc_msgSend(v2, "size");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __25__BRQueryItem_initialize__block_invoke_41(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isShared") && objc_msgSend(v2, "isDocument"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "editedSinceShared"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __25__BRQueryItem_initialize__block_invoke_42(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isTopLevelSharedItem"));
}

uint64_t __25__BRQueryItem_initialize__block_invoke_43(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributeForKey:", CFSTR("creator-components"));
}

- (id)containerIDIfDesktopOrDocuments
{
  void *v3;
  void *v4;
  void *v5;

  if (-[BRQueryItem isDirectory](self, "isDirectory"))
  {
    -[BRQueryItem logicalName](self, "logicalName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Desktop")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("Documents")))
    {
      -[BRQueryItem url](self, "url");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "br_containerIDIfIsDocumentsContainerURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)localizedFileNameIfDesktopOrDocuments
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[BRQueryItem containerIDIfDesktopOrDocuments](self, "containerIDIfDesktopOrDocuments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_7;
  if (!objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Desktop")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Documents")))
    {
      +[BRContainer localizedNameForDocumentsContainer](BRContainer, "localizedNameForDocumentsContainer");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  +[BRContainer localizedNameForDesktopContainer](BRContainer, "localizedNameForDesktopContainer");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

- (BOOL)fp_isContainer
{
  return 0;
}

- (BOOL)fp_isContainerPristine
{
  return 0;
}

- (NSString)fp_cloudContainerIdentifier
{
  return 0;
}

- (NSString)itemIdentifier
{
  return -[BRFileObjectID asString](self->_fileObjectID, "asString");
}

- (BOOL)_isFPFSItem
{
  return -[BRFileObjectID isFpfsItem](self->_fileObjectID, "isFpfsItem");
}

- (NSString)parentItemIdentifier
{
  id *v3;
  BRFileObjectID *parentFileObjectID;
  id v5;

  if (-[BRQueryItem _isFPFSItem](self, "_isFPFSItem"))
  {
    if (-[BRQueryItem isTrashed](self, "isTrashed"))
    {
      v3 = (id *)MEMORY[0x1E0CAABC8];
LABEL_9:
      v5 = *v3;
      return (NSString *)v5;
    }
  }
  else if (-[BRQueryItem isTopLevel](self, "isTopLevel") || -[BRQueryItem isTrashed](self, "isTrashed"))
  {
    goto LABEL_8;
  }
  parentFileObjectID = self->_parentFileObjectID;
  if (!parentFileObjectID)
  {
LABEL_8:
    v3 = (id *)MEMORY[0x1E0CAABA8];
    goto LABEL_9;
  }
  -[BRFileObjectID asString](parentFileObjectID, "asString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  return (NSString *)v5;
}

- (NSFileProviderItemVersion)itemVersion
{
  id v3;
  void *v4;

  if (BRIsFPFSEnabled(self, a2))
  {
    v3 = objc_alloc(MEMORY[0x1E0CAAD08]);
    v4 = (void *)objc_msgSend(v3, "initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:", self->_contentVersion, self->_equivalentContentVersions, self->_structureVersion, MEMORY[0x1E0C9AA60], self->_lastEditorDeviceName);
  }
  else
  {
    v4 = 0;
  }
  return (NSFileProviderItemVersion *)v4;
}

- (NSString)filename
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BRQueryItem localizedFileNameIfDesktopOrDocuments](self, "localizedFileNameIfDesktopOrDocuments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2E08]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BRQueryItem localizedFileNameIfDesktopOrDocuments](self, "localizedFileNameIfDesktopOrDocuments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2DF0]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)typeIdentifier
{
  return (NSString *)_getContentTypeValue(self, 0);
}

- (NSNumber)documentSize
{
  BRQueryItem *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[BRQueryItem attributeForName:](v2, "attributeForName:", *MEMORY[0x1E0CB2E10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (BOOL)isHidden
{
  void *v3;
  unint64_t v4;

  -[BRQueryItem logicalName](self, "logicalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR(".")) & 1) != 0)
    LOBYTE(v4) = 1;
  else
    v4 = ((unint64_t)LODWORD(self->_flags.value) >> 26) & 1;

  return v4;
}

- (BOOL)_isInSharedZone
{
  int v2;
  BOOL v4;

  v2 = (*(_DWORD *)&self->_flags.var0 >> 11) & 7;
  if ((v2 - 3) < 2)
    return 1;
  if (v2)
    v4 = 1;
  else
    v4 = self->_shareRootFileObjectID == 0;
  return !v4;
}

- (NSDictionary)userInfo
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BRFileObjectID *shareRootFileObjectID;
  void *v11;
  void *v12;
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
  void *v23;
  NSObject *v24;
  void *v25;
  NSDictionary *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_new();
  v5 = (void *)v3;
  if (self->_zoneRowID && self->_parentZoneRowID)
  {
    if (BRIsFPFSEnabled(v3, v4))
    {
      -[BRQueryItem url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "br_isInTrash");

      if (v7)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_appLibraryID, CFSTR("palid"));
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_zoneRowID, CFSTR("zid"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_parentZoneRowID, CFSTR("pzid"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_DWORD *)&self->_flags.var0 & 0x3800) != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("s"));

    if ((*(_DWORD *)&self->_flags.var0 & 0x3800) == 0x1800)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ro"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BRQueryItem isUploaded](self, "isUploaded"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("up"));

    }
    shareRootFileObjectID = self->_shareRootFileObjectID;
    if (shareRootFileObjectID)
    {
      -[BRFileObjectID asString](shareRootFileObjectID, "asString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("sr"));

    }
    if (-[BRQueryItem isDirectory](self, "isDirectory"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_DWORD *)&self->_flags.var0 & 0xC00000) != 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("cs"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (*(_DWORD *)&self->_flags.var0 >> 23) & 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("csbm"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (*(_DWORD *)&self->_flags.var0 >> 22) & 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("cstm"));

    }
    if (-[BRQueryItem _isInSharedZone](self, "_isInSharedZone"))
      v15 = &unk_1E3DC2A98;
    else
      v15 = &unk_1E3DC2AB0;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("isz"));
    if (-[BRQueryItem _isSharedFolderSubItem](self, "_isSharedFolderSubItem")
      && !-[BRQueryItem editedSinceShared](self, "editedSinceShared"))
    {
      -[BRQueryItem attributeForKey:](self, "attributeForKey:", CFSTR("creator-components"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("crnc"));

    }
    if (-[BRQueryItem isPackage](self, "isPackage"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_size, CFSTR("pkg_size"));
  }
  -[BRQueryItem attributeForKey:](self, "attributeForKey:", CFSTR("quota-available"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setCountStyle:", 3);
    objc_msgSend(v18, "stringFromByteCount:", objc_msgSend(v17, "longLongValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setNumberStyle:", 1);
    objc_msgSend(v18, "setIncludesUnit:", 0);
    objc_msgSend(v18, "stringFromByteCount:", objc_msgSend(v17, "longLongValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberFromString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && v22)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("q"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("qn"));
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItem userInfo]", 799);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v28 = 138413058;
        v29 = v17;
        v30 = 2112;
        v31 = v19;
        v32 = 2112;
        v33 = v22;
        v34 = 2112;
        v35 = v23;
        _os_log_error_impl(&dword_19CBF0000, v24, (os_log_type_t)0x90u, "[ERROR] Couldn't format quota %@ (%@, %@)%@", (uint8_t *)&v28, 0x2Au);
      }

    }
  }
  if (-[BRQueryItem editedSinceShared](self, "editedSinceShared"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E3DC2A98, CFSTR("ess"));
  if (objc_msgSend(v5, "count"))
    v25 = v5;
  else
    v25 = 0;
  v26 = v25;

  return v26;
}

- (NSArray)decorations
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;

  v3 = (void *)objc_opt_new();
  -[BRQueryItem attributeForKey:](self, "attributeForKey:", CFSTR("quota-available"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "addObject:", CFSTR("Quota"));
  if (-[BRQueryItem _isSharedFolderSubItem](self, "_isSharedFolderSubItem")
    && !-[BRQueryItem editedSinceShared](self, "editedSinceShared"))
  {
    -[BRQueryItem attributeForKey:](self, "attributeForKey:", CFSTR("created-by-user"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
      v7 = CFSTR("AddedByMe");
    else
      v7 = CFSTR("AddedByOther");
    objc_msgSend(v3, "addObject:", v7);
  }
  return (NSArray *)v3;
}

- (unint64_t)capabilities
{
  int v3;
  uint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int value;
  unint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v3 = BRIsFPFSEnabled(self, a2);
  if (-[BRFileObjectID isRootContainerItem](self->_fileObjectID, "isRootContainerItem"))
    v4 = 1;
  else
    v4 = 61;
  -[BRQueryItem isDirectory](self, "isDirectory");
  if (!-[BRFileObjectID isRootContainerItem](self->_fileObjectID, "isRootContainerItem")
    && (*(_DWORD *)&self->_flags.var0 & 0x20000) != 0)
  {
    if (!-[BRQueryItem isDirectory](self, "isDirectory") || (*(_DWORD *)&self->_flags.var0 & 0x3800) == 0x1800)
    {
      if ((*(_DWORD *)&self->_flags.var0 & 0x80000) == 0)
        v4 |= 2uLL;
    }
    else
    {
      v4 |= 2uLL;
    }
  }
  v5 = -[BRQueryItem isBRAlias](self, "isBRAlias");
  v6 = v4 & 0xFFFFFFFFFFFFFFEFLL;
  if (v5)
    v7 = v4 & 0xFFFFFFFFFFFFFFEFLL;
  else
    v7 = v4;
  value = self->_flags.value;
  v9 = v7;
  if (((value >> 11) & 7) - 3 <= 1)
  {
    v9 = v6;
    if ((value & 0x3800) == 0x1800)
    {
      v10 = -[BRQueryItem _isSharedFolderSubItem](self, "_isSharedFolderSubItem");
      v11 = -19;
      if (v10)
        v11 = -63;
      v9 = v11 & v7;
    }
  }
  if ((v3 & 1) == 0)
  {
    if (-[BRQueryItem isEvictable](self, "isEvictable"))
      v9 |= 0x40uLL;
    if (-[BRQueryItem isDirectory](self, "isDirectory"))
      v9 |= *MEMORY[0x1E0CAAB98];
  }
  if (((LODWORD(self->_flags.value) | ((unint64_t)BYTE4(self->_flags.value) << 32)) & 0x100000000) != 0)
    goto LABEL_30;
  -[BRQueryItem parentItemIdentifier](self, "parentItemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CAABA8]) & 1) != 0)
  {
    -[BRQueryItem filename](self, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("Desktop")))
    {

LABEL_30:
      v9 &= 0xFFFFFFFFFFFFFF63;
      goto LABEL_31;
    }
    -[BRQueryItem filename](self, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Documents"));

    if (v15)
      goto LABEL_30;
  }
  else
  {

  }
LABEL_31:
  if (v3 && ((LODWORD(self->_flags.value) | ((unint64_t)BYTE4(self->_flags.value) << 32)) & 0x200000000) != 0)
    v9 |= *MEMORY[0x1E0CAAB90];
  return v9;
}

- (unint64_t)fileSystemFlags
{
  BRQueryItem *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t value_low;
  unint64_t v6;

  v2 = self;
  objc_sync_enter(v2);
  if (!-[BRFileObjectID isRootContainerItem](v2->_fileObjectID, "isRootContainerItem")
    && ((*(_DWORD *)&v2->_flags.var0 & 0x20000) != 0
     || (-[BRQueryItem isDirectory](v2, "isDirectory") || -[BRQueryItem isPackage](v2, "isPackage"))
     && (-[BRQueryItem capabilities](v2, "capabilities") & 4) != 0))
  {
    v3 = 6;
  }
  else
  {
    v3 = 2;
  }
  v4 = BYTE4(v2->_flags.value);
  value_low = LODWORD(v2->_flags.value);
  if (-[BRQueryItem isHidden](v2, "isHidden"))
    v6 = v3 | ((value_low | (unint64_t)(v4 << 32)) >> 18) & 1 | ((value_low | (unint64_t)(v4 << 32)) >> 10) & 0x10 | 8;
  else
    v6 = v3 | ((value_low | (unint64_t)(v4 << 32)) >> 18) & 1 | ((value_low | (unint64_t)(v4 << 32)) >> 10) & 0x10;
  objc_sync_exit(v2);

  return v6;
}

- (NSDictionary)extendedAttributes
{
  return self->_xattrs;
}

- (NSArray)conflictingVersions
{
  return self->_conflictingVersions;
}

- (NSString)symlinkTargetPath
{
  return self->_symlinkTargetPath;
}

- (int64_t)contentPolicy
{
  return self->_contentPolicy;
}

- (NSNumber)childItemCount
{
  return self->_childItemCount;
}

- (id)fileSize
{
  return -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2E10]);
}

- (NSDate)creationDate
{
  BRQueryItem *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSNumber unsignedLongLongValue](v2->_btime, "unsignedLongLongValue");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSDate *)v4;
}

- (NSDate)contentModificationDate
{
  BRQueryItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSNumber unsignedLongLongValue](v2->_mtime, "unsignedLongLongValue");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[BRQueryItem isDirectory](v2, "isDirectory"))
    {
      v5 = 0;
      goto LABEL_6;
    }
    -[BRQueryItem creationDate](v2, "creationDate");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_6:
  objc_sync_exit(v2);

  return (NSDate *)v5;
}

- (BOOL)isDownloaded
{
  void *v2;
  char v3;

  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2EB0]) ^ 1;

  return v3;
}

- (BOOL)isDownloading
{
  void *v2;
  char v3;

  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isMostRecentVersionDownloaded
{
  void *v2;
  char v3;

  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2E98]);

  return v3;
}

- (BOOL)isUploaded
{
  void *v2;
  char v3;

  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isUploading
{
  void *v2;
  char v3;

  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSError)uploadingError
{
  return (NSError *)-[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2F08]);
}

- (id)downloadingStatus
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C99AF0];
  v4 = *MEMORY[0x1E0CB2EB0];
  v10[0] = *MEMORY[0x1E0CB2E98];
  v10[1] = v4;
  v5 = *MEMORY[0x1E0C99B08];
  v11[0] = v3;
  v11[1] = v5;
  v10[2] = *MEMORY[0x1E0CB2EA0];
  v11[2] = *MEMORY[0x1E0C99AF8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSError)downloadingError
{
  return (NSError *)-[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2E90]);
}

- (NSNumber)hasUnresolvedConflicts
{
  return (NSNumber *)-[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2EB8]);
}

- (BOOL)isShared
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_DWORD *)&v2->_flags.var0 & 0x3800) != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTopLevelSharedItem
{
  _BOOL4 v3;

  v3 = -[BRQueryItem isShared](self, "isShared");
  if (v3)
    LOBYTE(v3) = !-[BRQueryItem _isSharedFolderSubItem](self, "_isSharedFolderSubItem");
  return v3;
}

- (BOOL)_isSharedFolderSubItem
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 21) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSharedByCurrentUser
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2F18]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB2F60];
  v9[0] = *MEMORY[0x1E0CB2F58];
  v9[1] = v3;
  v5 = *MEMORY[0x1E0C99BA0];
  v10[0] = *MEMORY[0x1E0C99B98];
  v4 = v10[0];
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v4);

  return v4;
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  void *v3;
  BOOL v4;

  if (-[BRQueryItem isShared](self, "isShared") && !-[BRQueryItem editedSinceShared](self, "editedSinceShared"))
    return 0;
  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2F20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)owner
{
  void *v2;
  void *v3;
  void *v4;

  -[BRQueryItem ownerNameComponents](self, "ownerNameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "br_formattedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSPersonNameComponents)ownerNameComponents
{
  return (NSPersonNameComponents *)-[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2F28]);
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  void *v3;

  if (-[BRQueryItem editedSinceShared](self, "editedSinceShared"))
  {
    -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2F20]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

- (NSString)sharingPermissions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[BRQueryItem attributeForName:](self, "attributeForName:", *MEMORY[0x1E0CB2F38]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB2F48];
  v9[0] = *MEMORY[0x1E0CB2F40];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0C99B88];
  v10[0] = *MEMORY[0x1E0C99B80];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)collaborationIdentifier
{
  BRQueryItem *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_collaborationIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)fromRelativePath
{
  return ((unint64_t)LODWORD(self->_flags.value) >> 29) & 1;
}

- (NSURL)url
{
  BRQueryItem *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_url;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)containerDisplayName
{
  BRQueryItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BRMangledID *v6;
  void *v7;
  BRMangledID *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRFileObjectID isRootContainerItem](v2->_fileObjectID, "isRootContainerItem");
  if ((_DWORD)v3 && (BRIsFPFSEnabled(v3, v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = [BRMangledID alloc];
    -[BRQueryItem appLibraryID](v2, "appLibraryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BRMangledID initWithAppLibraryName:](v6, "initWithAppLibraryName:", v7);

    +[BRContainerCache containerCache](BRContainerCache, "containerCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerByID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItem containerDisplayName]", 1175);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        -[BRQueryItem url](v2, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v14;
        v17 = 2112;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_log_fault_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_FAULT, "[CRIT] containerDisplayName is nil %@, %@%@", (uint8_t *)&v15, 0x20u);

      }
    }

  }
  objc_sync_exit(v2);

  return (NSString *)v5;
}

- (NSURL)localRepresentationURL
{
  BRQueryItem *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_localRepresentationURL;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)diffs
{
  BRQueryItem *v2;
  unsigned __int16 diffs;

  v2 = self;
  objc_sync_enter(v2);
  diffs = v2->_diffs;
  objc_sync_exit(v2);

  return diffs;
}

- (BRFileObjectID)fileObjectID
{
  BRQueryItem *v2;
  BRFileObjectID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fileObjectID;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)parentPath
{
  BRQueryItem *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_parentPath;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)logicalName
{
  BRQueryItem *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_logicalName;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)physicalName
{
  BRQueryItem *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_physicalName;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)appLibraryID
{
  BRQueryItem *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_appLibraryID;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTopLevel
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 27) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)size
{
  BRQueryItem *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_size;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)mtime
{
  BRQueryItem *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_mtime;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)btime
{
  BRQueryItem *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_btime;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)lastUsedTime
{
  BRQueryItem *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastUsedTime;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastUsedDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[BRQueryItem lastUsedTime](self, "lastUsedTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSData)tagData
{
  void *v2;
  void *v3;
  void *v4;

  -[BRQueryItem attributeForName:](self, "attributeForName:", CFSTR("BRURLTagNamesKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "br_transform:", &__block_literal_global_140);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    FPGetTagsDataForTags();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSData *)v4;
}

id __22__BRQueryItem_tagData__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CAACD0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithLabel:color:", v3, 0);

  return v4;
}

- (NSNumber)favoriteRank
{
  BRQueryItem *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_favoriteRank;
  objc_sync_exit(v2);

  return v3;
}

- (NSData)versionIdentifier
{
  BRQueryItem *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSNumber unsignedLongValue](v2->_mtime, "unsignedLongValue");
  v11 = v3;
  -[BRQueryItem size](v2, "size");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  if (v5 > 0x100000)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v11, 8);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[BRQueryItem isDownloaded](v2, "isDownloaded");
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9, 9);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_sync_exit(v2);

  return (NSData *)v7;
}

- (BOOL)isNetworkOffline
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 25) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsNetworkOffline:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  unint64_t v5;
  BRQueryItem *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = 0x2000000;
  if (!v3)
    v4 = 0;
  v5 = *(_DWORD *)&obj->_flags.var0 & 0xFDFFFFFF | ((unint64_t)BYTE4(obj->_flags.value) << 32);
  *(_DWORD *)&obj->_flags.var0 = *(_DWORD *)&obj->_flags.var0 & 0xFDFFFFFF | v4;
  BYTE4(obj->_flags.value) = BYTE4(v5);
  objc_sync_exit(obj);

}

- (id)parentFileID
{
  void *v3;
  NSObject *v4;
  void *v5;
  BRQueryItem *v6;

  if (BRIsFPFSEnabled(self, a2))
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItem parentFileID]", 1339);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRQueryItem parentFileID].cold.1();

    v5 = 0;
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    -[BRFileObjectID folderID](v6->_parentFileObjectID, "folderID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

  }
  return v5;
}

- (BRFileObjectID)parentFileObjectID
{
  BRQueryItem *v2;
  BRFileObjectID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_parentFileObjectID;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)br_downloadStatus
{
  BRQueryItem *v2;
  int var0;

  v2 = self;
  objc_sync_enter(v2);
  var0 = (int)v2->_flags.var0;
  objc_sync_exit(v2);

  return var0 & 3;
}

- (unsigned)br_uploadStatus
{
  BRQueryItem *v2;
  int v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (LOWORD(v2->_flags.value) >> 2) & 3;
  objc_sync_exit(v2);

  return v3;
}

- (unsigned)br_shareOptions
{
  BRQueryItem *v2;
  unsigned int v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_DWORD *)&v2->_flags.var0 >> 11) & 7;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isInTransfer
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_flags.var0.kind)
    v3 = (~*(_DWORD *)&v2->_flags.var0 & 0x30) != 0 && (~*(_DWORD *)&v2->_flags.var0 & 0xFLL) != 0;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isConflicted
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 6) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isLive
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_DWORD *)&v2->_flags.var0 & 0x30) == 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDead
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_DWORD *)&v2->_flags.var0 & 0x30) == 16;
  objc_sync_exit(v2);

  return v3;
}

- (void)markDead
{
  unint64_t v2;
  BRQueryItem *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFFDF | ((unint64_t)BYTE4(obj->_flags.value) << 32);
  *(_DWORD *)&obj->_flags.var0 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFFCF | 0x10;
  BYTE4(obj->_flags.value) = BYTE4(v2);
  objc_sync_exit(obj);

}

- (void)clearDiffs
{
  BRQueryItem *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_diffs = 0;
  objc_sync_exit(obj);

}

- (BOOL)isPreCrash
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 7) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)setIsPreCrash:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  unint64_t v5;
  BRQueryItem *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = 128;
  if (!v3)
    v4 = 0;
  v5 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFF7F | ((unint64_t)BYTE4(obj->_flags.value) << 32);
  *(_DWORD *)&obj->_flags.var0 = *(_DWORD *)&obj->_flags.var0 & 0xFFFFFF7F | v4;
  BYTE4(obj->_flags.value) = BYTE4(v5);
  objc_sync_exit(obj);

}

- (BOOL)isDownloadActive
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 9) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (NSNumber)isDownloadRequested
{
  BRQueryItem *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (LOWORD(v2->_flags.value) >> 10) & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (BOOL)isUploadActive
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 8) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDirectory
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_flags.var0.kind == 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPackage
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_flags.var0.kind == 2;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSymlink
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_flags.var0.kind == 4;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isFinderBookmark
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_flags.var0.kind == 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDocument
{
  BRQueryItem *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_flags.var0.kind - 1 < 2;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isBRAlias
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 15) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)editedSinceShared
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 24) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTrashed
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 16) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEvictable
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 28) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isHiddenExt
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = ((unint64_t)LODWORD(v2->_flags.value) >> 14) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (id)sharedItemRole
{
  BRQueryItem *v2;
  unint64_t v3;
  id v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (((unint64_t)LODWORD(v2->_flags.value) >> 11) & 7) - 1;
  if (v3 > 3)
    v4 = 0;
  else
    v4 = **((id **)&unk_1E3DA6160 + v3);
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  if ((self->_logicalHandle & 0x8000000000000000) == 0)
    sandbox_extension_release();
  if ((self->_physicalHandle & 0x8000000000000000) == 0)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)BRQueryItem;
  -[BRQueryItem dealloc](&v3, sel_dealloc);
}

- (BRQueryItem)initWithCoder:(id)a3
{
  id v4;
  BRQueryItem *v5;
  BRQueryItem *v6;
  uint64_t v7;
  NSString *appLibraryID;
  uint64_t v9;
  NSString *logicalName;
  uint64_t v11;
  NSString *physicalName;
  id *p_physicalName;
  uint64_t v14;
  NSString *parentPath;
  uint64_t v16;
  BRFileObjectID *fileObjectID;
  uint64_t v18;
  BRFileObjectID *parentFileObjectID;
  uint64_t v20;
  BRFileObjectID *shareRootFileObjectID;
  uint64_t v22;
  NSNumber *size;
  uint64_t v24;
  NSNumber *mtime;
  uint64_t v26;
  NSNumber *btime;
  uint64_t v28;
  NSNumber *lastUsedTime;
  uint64_t v30;
  NSNumber *favoriteRank;
  uint64_t v32;
  NSNumber *childItemCount;
  void *v34;
  uint64_t v35;
  NSMutableDictionary *attrs;
  uint64_t v37;
  NSNumber *zoneRowID;
  uint64_t v39;
  NSNumber *parentZoneRowID;
  uint64_t v41;
  NSString *collaborationIdentifier;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSArray *conflictingVersions;
  uint64_t v48;
  uint64_t v49;
  int v50;
  char v51;
  uint64_t v52;
  NSData *contentVersion;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSArray *equivalentContentVersions;
  uint64_t v59;
  NSData *structureVersion;
  uint64_t v61;
  NSString *lastEditorDeviceName;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSDictionary *xattrs;
  uint64_t v68;
  NSString *symlinkTargetPath;
  void *v70;
  int kind;
  NSString *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSURL *url;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  NSURL *v82;
  void *v83;
  NSURL *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *localRepresentationURL;
  NSURL *v89;
  NSObject *v91;
  objc_super v92;
  _QWORD v93[3];
  _QWORD v94[2];
  _QWORD v95[3];

  v95[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (initWithCoder__once != -1)
    dispatch_once(&initWithCoder__once, &__block_literal_global_144);
  v92.receiver = self;
  v92.super_class = (Class)BRQueryItem;
  v5 = -[BRQueryItem init](&v92, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_logicalHandle = -1;
    v5->_physicalHandle = -1;
    v5->_flags.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("flags"));
    v6->_diffs = objc_msgSend(v4, "decodeIntForKey:", CFSTR("diffs"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cid"));
    v7 = objc_claimAutoreleasedReturnValue();
    appLibraryID = v6->_appLibraryID;
    v6->_appLibraryID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = objc_claimAutoreleasedReturnValue();
    logicalName = v6->_logicalName;
    v6->_logicalName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fault"));
    v11 = objc_claimAutoreleasedReturnValue();
    p_physicalName = (id *)&v6->_physicalName;
    physicalName = v6->_physicalName;
    v6->_physicalName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parent"));
    v14 = objc_claimAutoreleasedReturnValue();
    parentPath = v6->_parentPath;
    v6->_parentPath = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foid"));
    v16 = objc_claimAutoreleasedReturnValue();
    fileObjectID = v6->_fileObjectID;
    v6->_fileObjectID = (BRFileObjectID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pfoid"));
    v18 = objc_claimAutoreleasedReturnValue();
    parentFileObjectID = v6->_parentFileObjectID;
    v6->_parentFileObjectID = (BRFileObjectID *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sr"));
    v20 = objc_claimAutoreleasedReturnValue();
    shareRootFileObjectID = v6->_shareRootFileObjectID;
    v6->_shareRootFileObjectID = (BRFileObjectID *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v22 = objc_claimAutoreleasedReturnValue();
    size = v6->_size;
    v6->_size = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mtime"));
    v24 = objc_claimAutoreleasedReturnValue();
    mtime = v6->_mtime;
    v6->_mtime = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("btime"));
    v26 = objc_claimAutoreleasedReturnValue();
    btime = v6->_btime;
    v6->_btime = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastusedtime"));
    v28 = objc_claimAutoreleasedReturnValue();
    lastUsedTime = v6->_lastUsedTime;
    v6->_lastUsedTime = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("favoriterank"));
    v30 = objc_claimAutoreleasedReturnValue();
    favoriteRank = v6->_favoriteRank;
    v6->_favoriteRank = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childitemcount"));
    v32 = objc_claimAutoreleasedReturnValue();
    childItemCount = v6->_childItemCount;
    v6->_childItemCount = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__allowedClasses, CFSTR("attrs"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "mutableCopy");
    attrs = v6->_attrs;
    v6->_attrs = (NSMutableDictionary *)v35;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("zrid")));
    v37 = objc_claimAutoreleasedReturnValue();
    zoneRowID = v6->_zoneRowID;
    v6->_zoneRowID = (NSNumber *)v37;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pzrid")));
    v39 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v6->_parentZoneRowID;
    v6->_parentZoneRowID = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collabid"));
    v41 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifier = v6->_collaborationIdentifier;
    v6->_collaborationIdentifier = (NSString *)v41;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setWithArray:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("conflictingversions"));
    v46 = objc_claimAutoreleasedReturnValue();
    conflictingVersions = v6->_conflictingVersions;
    v6->_conflictingVersions = (NSArray *)v46;

    v50 = BRIsFPFSEnabled(v48, v49);
    v51 = v50;
    if (v50)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cver"));
      v52 = objc_claimAutoreleasedReturnValue();
      contentVersion = v6->_contentVersion;
      v6->_contentVersion = (NSData *)v52;

      v54 = (void *)MEMORY[0x1E0C99E60];
      v94[0] = objc_opt_class();
      v94[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setWithArray:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("eqCver"));
      v57 = objc_claimAutoreleasedReturnValue();
      equivalentContentVersions = v6->_equivalentContentVersions;
      v6->_equivalentContentVersions = (NSArray *)v57;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sver"));
      v59 = objc_claimAutoreleasedReturnValue();
      structureVersion = v6->_structureVersion;
      v6->_structureVersion = (NSData *)v59;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastEditorDeviceName"));
      v61 = objc_claimAutoreleasedReturnValue();
      lastEditorDeviceName = v6->_lastEditorDeviceName;
      v6->_lastEditorDeviceName = (NSString *)v61;

      v63 = (void *)MEMORY[0x1E0C99E60];
      v93[0] = objc_opt_class();
      v93[1] = objc_opt_class();
      v93[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setWithArray:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v65, CFSTR("xattrs"));
      v66 = objc_claimAutoreleasedReturnValue();
      xattrs = v6->_xattrs;
      v6->_xattrs = (NSDictionary *)v66;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symlinkTargetPath"));
      v68 = objc_claimAutoreleasedReturnValue();
      symlinkTargetPath = v6->_symlinkTargetPath;
      v6->_symlinkTargetPath = (NSString *)v68;

      v6->_contentPolicy = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("contentPolicy"));
      if (!v6->_parentPath)
      {
LABEL_29:
        if (-[BRQueryItem isBRAlias](v6, "isBRAlias"))
        {
          -[NSMutableDictionary objectForKey:](v6->_attrs, "objectForKey:", CFSTR("alias-path"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v86);
            v87 = objc_claimAutoreleasedReturnValue();
            localRepresentationURL = v6->_localRepresentationURL;
            v6->_localRepresentationURL = (NSURL *)v87;
          }
          else
          {
            if ((v51 & 1) != 0 || -[BRQueryItem isDead](v6, "isDead"))
              goto LABEL_34;
            brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithCoder:]", 1664);
            localRepresentationURL = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v91 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
              -[BRQueryItem initWithCoder:].cold.1();

          }
        }
        else
        {
          v89 = v6->_url;
          v86 = v6->_localRepresentationURL;
          v6->_localRepresentationURL = v89;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else if (!v6->_parentPath)
    {
      if (-[BRQueryItem isDead](v6, "isDead"))
        goto LABEL_29;
      brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithCoder:]", 1656);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        -[BRQueryItem initWithCoder:].cold.1();
      goto LABEL_27;
    }
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v6->_parentPath, 1);
    kind = v6->_flags.var0.kind;
    v72 = v6->_physicalName;
    if (v72 && !-[NSString br_isSideFaultName](v72, "br_isSideFaultName"))
    {
      objc_msgSend(v70, "URLByAppendingPathComponent:isDirectory:", v6->_physicalName, kind == 0);
      v75 = objc_claimAutoreleasedReturnValue();
      url = v6->_url;
      v6->_url = (NSURL *)v75;

      MEMORY[0x1A1AD7DBC](v6->_url, *MEMORY[0x1E0C9B5A0], v6->_logicalName);
LABEL_25:
      if (!-[BRFileObjectID isDocumentID](v6->_fileObjectID, "isDocumentID"))
      {
LABEL_28:

        goto LABEL_29;
      }
      v84 = v6->_url;
      v85 = *MEMORY[0x1E0C9B418];
      -[BRFileObjectID documentID](v6->_fileObjectID, "documentID");
      v77 = objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AD7DBC](v84, v85, v77);
LABEL_27:

      goto LABEL_28;
    }
    if (v6->_logicalName)
    {
      objc_msgSend(v70, "URLByAppendingPathComponent:isDirectory:");
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v6->_url;
      v6->_url = (NSURL *)v73;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithCoder:]", 1634);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
        -[BRQueryItem initWithCoder:].cold.2(&v6->_physicalName);

      if (!objc_msgSend(*p_physicalName, "length"))
        goto LABEL_21;
      -[NSString substringFromIndex:](v6->_physicalName, "substringFromIndex:", 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "brc_stringByDeletingPathExtension");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v70, "URLByAppendingPathComponent:isDirectory:", v74, kind == 0);
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = v6->_url;
      v6->_url = (NSURL *)v81;

    }
LABEL_21:
    if (kind)
    {
      if (*p_physicalName)
      {
        objc_msgSend(v70, "URLByAppendingPathComponent:isDirectory:", *p_physicalName, 0);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        _CFURLPromiseSetPhysicalURL();

      }
      else
      {
        _CFURLPromiseSetPhysicalURL();
      }
    }
    goto LABEL_25;
  }
LABEL_35:

  return v6;
}

void __29__BRQueryItem_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__allowedClasses;
  initWithCoder__allowedClasses = v2;

}

- (void)attachLogicalExtension:(id)a3 physicalExtension:(id)a4
{
  id v6;
  id v7;
  BRQueryItem *v8;
  NSURL *url;
  NSURL **p_url;
  NSURL *v11;
  id v12;
  int active_platform;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSURL *v22;
  NSURL *v23;
  NSURL *v24;
  id v25;
  int v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  p_url = &v8->_url;
  url = v8->_url;
  if (!v6 || !url)
    goto LABEL_21;
  v11 = url;
  v12 = v6;
  active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) != 2 && active_platform != 1 && active_platform != 11)
  {
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    goto LABEL_20;
  }
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
LABEL_20:

    MEMORY[0x1A1AD7D20](*p_url, v12);
    goto LABEL_21;
  }
  if (objc_msgSend(v12, "length"))
  {
    v14 = objc_retainAutorelease(v12);
    objc_msgSend(v14, "bytes");
    v15 = sandbox_extension_consume();
    if (v15 < 0)
    {
      v18 = *__error();
      brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v14;
        v40 = 1024;
        v41 = v18;
        v42 = 2112;
        v43 = v19;
        _os_log_error_impl(&dword_19CBF0000, v20, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
      }

      *__error() = v18;
    }
    else
    {
      if (v8->_logicalHandle < 0)
      {
        brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.3();
      }
      else
      {
        sandbox_extension_release();
        brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.2();
      }

      v8->_logicalHandle = v15;
    }
    goto LABEL_20;
  }

LABEL_21:
  if (v7 && *p_url)
  {
    v21 = _CFURLPromiseCopyPhysicalURL();
    v22 = (NSURL *)v21;
    if (v21)
    {
      v23 = *p_url;
      if ((NSURL *)v21 == *p_url)
      {
        brc_bread_crumbs((uint64_t)"-[BRQueryItem attachLogicalExtension:physicalExtension:]", 1711);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.4();

        v23 = *p_url;
      }
      if (v22 == v23)
        goto LABEL_48;
      v24 = v22;
      v25 = v7;
      v26 = dyld_get_active_platform();
      if ((v26 & 0xFFFFFFFB) == 2 || v26 == 1 || v26 == 11)
      {
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          if (!objc_msgSend(v25, "length"))
          {

LABEL_48:
            CFRelease(v22);
            goto LABEL_49;
          }
          v29 = objc_retainAutorelease(v25);
          objc_msgSend(v29, "bytes");
          v30 = sandbox_extension_consume();
          if (v30 < 0)
          {
            v33 = *__error();
            brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              v39 = v29;
              v40 = 1024;
              v41 = v33;
              v42 = 2112;
              v43 = v34;
              _os_log_error_impl(&dword_19CBF0000, v35, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
            }

            *__error() = v33;
          }
          else
          {
            if (v8->_physicalHandle < 0)
            {
              brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              brc_notifications_log();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.3();
            }
            else
            {
              sandbox_extension_release();
              brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              brc_notifications_log();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.2();
            }

            v8->_physicalHandle = v30;
          }
        }
      }
      else
      {
        syslog(5, "Unknown platform linking against CloudDocs framework %d", v26);
      }

      MEMORY[0x1A1AD7D20](v24, v25);
      goto LABEL_48;
    }
    brc_bread_crumbs((uint64_t)"-[BRQueryItem attachLogicalExtension:physicalExtension:]", 1719);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.1(&v8->_url);

  }
LABEL_49:
  objc_sync_exit(v8);

}

- (void)encodeWithCoder:(id)a3
{
  BRQueryItem *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v7, "encodeInt64:forKey:", v4->_flags.value, CFSTR("flags"));
  objc_msgSend(v7, "encodeInt:forKey:", v4->_diffs, CFSTR("diffs"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_appLibraryID, CFSTR("cid"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_logicalName, CFSTR("name"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_physicalName, CFSTR("fault"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_parentPath, CFSTR("parent"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_fileObjectID, CFSTR("foid"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_parentFileObjectID, CFSTR("pfoid"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_shareRootFileObjectID, CFSTR("sr"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_size, CFSTR("size"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_mtime, CFSTR("mtime"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_btime, CFSTR("btime"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_lastUsedTime, CFSTR("lastusedtime"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_favoriteRank, CFSTR("favoriterank"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_childItemCount, CFSTR("childitemcount"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_attrs, CFSTR("attrs"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[NSNumber longLongValue](v4->_zoneRowID, "longLongValue"), CFSTR("zrid"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[NSNumber longLongValue](v4->_parentZoneRowID, "longLongValue"), CFSTR("pzrid"));
  v5 = objc_msgSend(v7, "encodeObject:forKey:", v4->_collaborationIdentifier, CFSTR("collabid"));
  if (BRIsFPFSEnabled(v5, v6))
  {
    objc_msgSend(v7, "encodeObject:forKey:", v4->_contentVersion, CFSTR("cver"));
    objc_msgSend(v7, "encodeObject:forKey:", v4->_equivalentContentVersions, CFSTR("eqCver"));
    objc_msgSend(v7, "encodeObject:forKey:", v4->_structureVersion, CFSTR("sver"));
    objc_msgSend(v7, "encodeObject:forKey:", v4->_lastEditorDeviceName, CFSTR("lastEditorDeviceName"));
    objc_msgSend(v7, "encodeObject:forKey:", v4->_xattrs, CFSTR("xattrs"));
    objc_msgSend(v7, "encodeObject:forKey:", v4->_conflictingVersions, CFSTR("conflictingversions"));
    objc_msgSend(v7, "encodeObject:forKey:", v4->_symlinkTargetPath, CFSTR("symlinkTargetPath"));
    objc_msgSend(v7, "encodeInt:forKey:", LODWORD(v4->_contentPolicy), CFSTR("contentPolicy"));
  }
  objc_sync_exit(v4);

}

- (BRQueryItem)initWithQueryItem:(id)a3
{
  id v4;
  BRQueryItem *v5;
  id v6;
  uint64_t v7;
  NSMutableDictionary *attrs;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRQueryItem;
  v5 = -[BRQueryItem init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_sync_enter(v6);
    v5->_logicalHandle = -1;
    v5->_physicalHandle = -1;
    v5->_flags.value = *((_QWORD *)v6 + 30);
    v5->_diffs = *((_WORD *)v6 + 132);
    objc_storeStrong((id *)&v5->_appLibraryID, *((id *)v6 + 1));
    objc_storeStrong((id *)&v5->_logicalName, *((id *)v6 + 3));
    objc_storeStrong((id *)&v5->_physicalName, *((id *)v6 + 4));
    objc_storeStrong((id *)&v5->_parentPath, *((id *)v6 + 2));
    objc_storeStrong((id *)&v5->_fileObjectID, *((id *)v6 + 6));
    objc_storeStrong((id *)&v5->_parentFileObjectID, *((id *)v6 + 7));
    objc_storeStrong((id *)&v5->_shareRootFileObjectID, *((id *)v6 + 8));
    objc_storeStrong((id *)&v5->_size, *((id *)v6 + 9));
    objc_storeStrong((id *)&v5->_mtime, *((id *)v6 + 10));
    objc_storeStrong((id *)&v5->_btime, *((id *)v6 + 11));
    objc_storeStrong((id *)&v5->_lastUsedTime, *((id *)v6 + 12));
    objc_storeStrong((id *)&v5->_favoriteRank, *((id *)v6 + 13));
    objc_storeStrong((id *)&v5->_childItemCount, *((id *)v6 + 14));
    v7 = objc_msgSend(*((id *)v6 + 27), "mutableCopy");
    attrs = v5->_attrs;
    v5->_attrs = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v5->_url, *((id *)v6 + 15));
    objc_storeStrong((id *)&v5->_localRepresentationURL, *((id *)v6 + 16));
    objc_storeStrong((id *)&v5->_zoneRowID, *((id *)v6 + 18));
    objc_storeStrong((id *)&v5->_parentZoneRowID, *((id *)v6 + 17));
    objc_storeStrong((id *)&v5->_collaborationIdentifier, *((id *)v6 + 19));
    if (BRIsFPFSEnabled(v9, v10))
    {
      objc_storeStrong((id *)&v5->_contentVersion, *((id *)v6 + 21));
      objc_storeStrong((id *)&v5->_equivalentContentVersions, *((id *)v6 + 22));
      objc_storeStrong((id *)&v5->_structureVersion, *((id *)v6 + 23));
      objc_storeStrong((id *)&v5->_lastEditorDeviceName, *((id *)v6 + 26));
      objc_storeStrong((id *)&v5->_xattrs, *((id *)v6 + 28));
      objc_storeStrong((id *)&v5->_conflictingVersions, *((id *)v6 + 24));
      objc_storeStrong((id *)&v5->_symlinkTargetPath, *((id *)v6 + 20));
      v5->_contentPolicy = *((_QWORD *)v6 + 25);
    }
    objc_sync_exit(v6);

  }
  return v5;
}

- (BRQueryItem)initWithFPItem:(id)a3
{
  id v4;
  unsigned int *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  BRQueryItem *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  NSObject *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  unint64_t v60;
  void *v61;
  int v62;
  unint64_t v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  int v67;
  unsigned int *v68;
  int v69;
  unint64_t v70;
  void *v71;
  int v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  int v77;
  BOOL v78;
  int v79;
  int v80;
  unint64_t v81;
  void *v82;
  void *v83;
  int v84;
  int v85;
  unint64_t v86;
  void *v87;
  int v88;
  int v89;
  unint64_t v90;
  uint64_t v91;
  void *v92;
  int v94;
  void *v95;
  NSObject *v96;
  objc_super v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  id v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v97.receiver = self;
    v97.super_class = (Class)BRQueryItem;
    v5 = -[BRQueryItem init](&v97, sel_init);
    if (!v5)
    {
LABEL_71:
      self = v5;
      v16 = self;
      goto LABEL_72;
    }
    objc_msgSend(v4, "fileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v6;

    objc_storeStrong((id *)v5 + 16, *((id *)v5 + 15));
    objc_msgSend(v4, "filename");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v8;

    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pkg_size"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v4, "documentSize");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v13;

    if ((objc_msgSend(*((id *)v5 + 15), "br_isInTrash") & 1) != 0)
      objc_msgSend(v10, "objectForKey:", CFSTR("palid"));
    else
      objc_msgSend(*((id *)v5 + 15), "br_containerID");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v18;

    objc_msgSend(v4, "providerItemIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRFileObjectID fileObjectIDWithString:](BRFileObjectID, "fileObjectIDWithString:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v21;

    objc_msgSend(v4, "itemID");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v5 + 34);
    *((_QWORD *)v5 + 34) = v23;

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSince1970");
    objc_msgSend(v25, "numberWithDouble:");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v27;

    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "contentModificationDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSince1970");
    objc_msgSend(v29, "numberWithDouble:");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v31;

    objc_msgSend(v4, "contentType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isFolder") & 1) != 0)
    {
      v34 = 0;
    }
    else if ((objc_msgSend(v4, "isPackage") & 1) != 0)
    {
      v34 = 2;
    }
    else if ((objc_msgSend(v33, "br_isSymbolicLinkType") & 1) != 0)
    {
      v34 = 4;
    }
    else if ((objc_msgSend(v33, "br_isAliasFileType") & 1) != 0)
    {
      v34 = 3;
    }
    else
    {
      if ((objc_msgSend(v33, "br_isFileType") & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithFPItem:]", 1849);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v99 = v33;
          v100 = 2112;
          v101 = v4;
          v102 = 2112;
          v103 = v35;
          _os_log_fault_impl(&dword_19CBF0000, v36, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't initialize _flags.kind from the content type %@ for %@%@", buf, 0x20u);
        }

      }
      v34 = 1;
    }
    *((_BYTE *)v5 + 245) = v34;
    if (objc_msgSend(v4, "isMostRecentVersionDownloaded"))
    {
      v5[60] |= 3u;
    }
    else
    {
      if (objc_msgSend(v4, "isDownloaded"))
        v37 = v5[60] & 0xFFFFFFFC | 2;
      else
        v37 = v5[60] & 0xFFFFFFFC | 1;
      *((_BYTE *)v5 + 244) = *((_BYTE *)v5 + 244);
      v5[60] = v37;
    }
    objc_msgSend(v4, "downloadingError");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "downloadingError");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttribute:forKey:", v39, CFSTR("dlErr"));

    }
    objc_msgSend(v4, "uploadingError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "uploadingError");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttribute:forKey:", v41, CFSTR("ulErr"));

    }
    objc_msgSend(v4, "downloadingProgress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      v44 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v42, "fractionCompleted");
      objc_msgSend(v44, "numberWithDouble:", v45 * 100.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttribute:forKey:", v46, CFSTR("dl%"));

    }
    objc_msgSend(v4, "uploadingProgress");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      v49 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v47, "fractionCompleted");
      objc_msgSend(v49, "numberWithDouble:", v50 * 100.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttribute:forKey:", v51, CFSTR("ul%"));

    }
    if (objc_msgSend(v4, "isUploaded"))
    {
      v5[60] |= 0xCu;
    }
    else
    {
      v52 = objc_msgSend(v4, "isUploading");
      v53 = v5[60];
      v54 = v53 & 0xFFFFFFFFFFFFFFF3 | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
      if (v52)
      {
        *((_BYTE *)v5 + 244) = BYTE4(v54);
        v5[60] = v53 & 0xFFFFFFF3 | 4;
      }
      else
      {
        v5[60] = v53 & 0xFFFFFFF3;
        *((_BYTE *)v5 + 244) = BYTE4(v54);
      }
    }
    objc_msgSend(v4, "tags");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56)
    {
      objc_msgSend(v4, "tags");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "br_transform:", &__block_literal_global_208);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttribute:forKey:", v58, CFSTR("tags"));

    }
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE43A040) & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithFPItem:]", 1899);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
        -[BRQueryItem initWithFPItem:].cold.1();

    }
    v59 = v4;
    v60 = v5[60] & 0xFFFF7FFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] &= ~0x8000u;
    *((_BYTE *)v5 + 244) = BYTE4(v60);
    objc_msgSend(v59, "isDownloadRequested");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "unsignedShortValue") || (objc_msgSend(v59, "isDownloading") & 1) != 0)
    {
      v62 = 1024;
    }
    else
    {
      v94 = objc_msgSend(v59, "isDownloaded");
      v62 = 1024;
      if (!v94)
        v62 = 0;
    }
    v63 = v5[60] & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] = v5[60] & 0xFFFFFBFF | v62;
    *((_BYTE *)v5 + 244) = BYTE4(v63);

    if ((objc_msgSend(v59, "isDownloading") & 1) != 0)
    {
      objc_msgSend(v59, "downloadingProgress");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v5[60] & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
      v5[60] = v5[60] & 0xFFFFFDFF | ((v64 != 0) << 9);
      *((_BYTE *)v5 + 244) = BYTE4(v65);

    }
    else
    {
      v66 = v5[60] & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
      v5[60] &= ~0x200u;
      *((_BYTE *)v5 + 244) = BYTE4(v66);
    }
    v67 = objc_msgSend(v59, "isUploading");
    v68 = v5 + 60;
    v69 = 256;
    if (!v67)
      v69 = 0;
    v70 = v5[60] & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    *v68 = v5[60] & 0xFFFFFEFF | v69;
    *((_BYTE *)v5 + 244) = BYTE4(v70);
    objc_msgSend(v59, "conflictingVersions");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "count") != 0;
    v73 = v5[60] & 0xFFFFFFBF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    *v68 = *v68 & 0xFFFFFFBF | (v72 << 6);
    *((_BYTE *)v5 + 244) = BYTE4(v73);

    v74 = *v68;
    v75 = v74 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    *v68 = v74 & 0xFFFFC7FF;
    *((_BYTE *)v5 + 244) = BYTE4(v75);
    objc_msgSend(v59, "sharingPermissions");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "isShared"))
    {
      v77 = objc_msgSend(v59, "isSharedByCurrentUser");
      if (objc_msgSend(v76, "isEqual:", *MEMORY[0x1E0C99B80]))
      {
        v78 = v77 == 0;
        v79 = 6144;
        v80 = 2048;
LABEL_60:
        if (!v78)
          v79 = v80;
        v81 = v5[60] & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
        v5[60] = v5[60] & 0xFFFFC7FF | v79;
        *((_BYTE *)v5 + 244) = BYTE4(v81);
        goto LABEL_63;
      }
      if (objc_msgSend(v76, "isEqual:", *MEMORY[0x1E0C99B88]))
      {
        v78 = v77 == 0;
        v79 = 0x2000;
        v80 = 4096;
        goto LABEL_60;
      }
    }
LABEL_63:
    objc_msgSend(v59, "ownerNameComponents");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v82, CFSTR("owner-components"));

    objc_msgSend(v59, "mostRecentEditorNameComponents");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v83, CFSTR("last-editor-components"));

    if (objc_msgSend(v59, "isShared"))
    {
      v84 = objc_msgSend(v59, "isTopLevelSharedItem");
      v85 = 0x200000;
      if (v84)
        v85 = 0;
    }
    else
    {
      v85 = 0;
    }
    v86 = v5[60] & 0xFFDFFFFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] = v5[60] & 0xFFDFFFFF | v85;
    *((_BYTE *)v5 + 244) = BYTE4(v86);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ess"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "BOOLValue");
    v89 = 0x1000000;
    if (!v88)
      v89 = 0;
    v90 = v5[60] & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)v5 + 244) << 32);
    v5[60] = v5[60] & 0xFEFFFFFF | v89;
    *((_BYTE *)v5 + 244) = BYTE4(v90);

    objc_msgSend(v59, "symlinkTargetPath");
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v91;

    goto LABEL_71;
  }
  brc_bread_crumbs((uint64_t)"-[BRQueryItem initWithFPItem:]", 1816);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = v14;
    _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't build query item with nil FPItem%@", buf, 0xCu);
  }

  v16 = 0;
LABEL_72:

  return v16;
}

uint64_t __30__BRQueryItem_initWithFPItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithQueryItem:", self);
}

- (id)subclassDescription
{
  return 0;
}

- (NSString)description
{
  void *v3;
  BRQueryItem *v4;
  uint64_t v5;
  BRFileObjectID *fileObjectID;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  int var0;
  unint64_t v12;
  int v13;
  void *v14;
  int v15;
  const __CFString *v16;
  const char *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSString *logicalName;
  void *v25;
  NSString *physicalName;
  void *v27;
  unint64_t kind;
  const __CFString *v29;
  NSNumber *size;
  void *v31;
  NSMutableDictionary *attrs;
  id v33;
  NSDictionary *xattrs;
  NSArray *conflictingVersions;
  NSString *symlinkTargetPath;
  void *v37;
  NSString *v38;
  _QWORD v40[4];
  id v41;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_opt_class();
  fileObjectID = v4->_fileObjectID;
  BRQueryItemFieldsPrettyPrint(v4->_diffs);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BRCPrettyPrintEnum(*(_DWORD *)&v4->_flags.var0 & 3, br_download_status_entries);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %@ (%@) dn:%s up:%s"), v5, fileObjectID, v7, v8, BRCPrettyPrintEnum(((unint64_t)LODWORD(v4->_flags.value) >> 2) & 3, br_upload_status_entries));

  if (v4->_url)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" url:"));
    -[NSURL path](v4->_url, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fp_obfuscatedPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v10);

  }
  LOBYTE(var0) = v4->_flags.var0;
  if ((*(_DWORD *)&v4->_flags.var0 & 0x100000) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" roDB"));
    var0 = (int)v4->_flags.var0;
  }
  if ((var0 & 0x40) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" conflicted"));
  if (-[BRQueryItem isHidden](v4, "isHidden"))
    objc_msgSend(v3, "appendString:", CFSTR(" hidden"));
  if (-[BRQueryItem isHiddenExt](v4, "isHiddenExt"))
    objc_msgSend(v3, "appendString:", CFSTR(" h-ext"));
  v12 = (((unint64_t)LODWORD(v4->_flags.value) >> 4) & 3) - 1;
  if (v12 <= 2)
    objc_msgSend(v3, "appendString:", off_1E3DA6180[v12]);
  LOWORD(v13) = v4->_flags.var0;
  if ((*(_DWORD *)&v4->_flags.var0 & 0x8000) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" br-alias"));
    v13 = (int)v4->_flags.var0;
  }
  if ((v13 & 0x200) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" downloading"));
    v13 = (int)v4->_flags.var0;
  }
  if ((v13 & 0x100) != 0)
    objc_msgSend(v3, "appendString:", CFSTR(" uploading"));
  -[BRQueryItem subclassDescription](v4, "subclassDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "appendString:", v14);
  v15 = (LOWORD(v4->_flags.value) >> 11) & 7;
  if (v15)
  {
    switch(v15)
    {
      case 1:
        v16 = CFSTR(" shared-by-me-r");
        goto LABEL_26;
      case 2:
        v16 = CFSTR(" shared-by-me-rw");
LABEL_26:
        objc_msgSend(v3, "appendString:", v16);
        goto LABEL_31;
      case 4:
        v17 = "rw";
        break;
      default:
        v17 = "ro";
        break;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR(" share:%s"), v17);
  }
LABEL_31:
  v18 = (int)v4->_flags.var0;
  if ((v18 & 0x3800) != 0)
  {
    if ((*(_QWORD *)&v18 & 0x200000) != 0)
      v19 = CFSTR(" sh-chd");
    else
      v19 = CFSTR(" sh-top");
    objc_msgSend(v3, "appendString:", v19);
  }
  if (-[BRQueryItem editedSinceShared](v4, "editedSinceShared"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" ess"));
  -[BRQueryItem collaborationIdentifier](v4, "collaborationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[BRQueryItem collaborationIdentifier](v4, "collaborationIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" collabid: %@"), v21);

  }
  -[BRQueryItem attributeForKey:](v4, "attributeForKey:", CFSTR("created-by-user"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (v23)
    objc_msgSend(v3, "appendFormat:", CFSTR(" cbm"));
  if (v4->_appLibraryID)
    objc_msgSend(v3, "appendFormat:", CFSTR(" ct:%@"), v4->_appLibraryID);
  if (v4->_parentPath)
    objc_msgSend(v3, "appendFormat:", CFSTR(" p:'%@'"), v4->_parentPath);
  if (v4->_parentFileObjectID)
    objc_msgSend(v3, "appendFormat:", CFSTR(" pid:%@"), v4->_parentFileObjectID);
  if (v4->_shareRootFileObjectID)
    objc_msgSend(v3, "appendFormat:", CFSTR(" shroot:%@"), v4->_shareRootFileObjectID);
  logicalName = v4->_logicalName;
  if (logicalName)
  {
    -[NSString fp_obfuscatedFilename](logicalName, "fp_obfuscatedFilename");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" n:'%@'"), v25);

  }
  physicalName = v4->_physicalName;
  if (physicalName)
  {
    -[NSString fp_obfuscatedFilename](physicalName, "fp_obfuscatedFilename");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" f:'%@'"), v27);

  }
  kind = (char)v4->_flags.var0.kind;
  if (kind > 4)
    v29 = &stru_1E3DA8AC8;
  else
    v29 = off_1E3DA6198[kind];
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@:%llu"), v29, -[BRFileObjectID rawID](v4->_fileObjectID, "rawID"));
  size = v4->_size;
  if (size)
  {
    BRLocalizedFileSizeDescriptionWithExactCount(-[NSNumber longLongValue](size, "longLongValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" sz:%@"), v31);

  }
  if (!v4->_flags.var0.kind)
    objc_msgSend(v3, "appendFormat:", CFSTR(" ch:%@"), v4->_childItemCount);
  if (v4->_mtime)
    objc_msgSend(v3, "appendFormat:", CFSTR(" mt:%@"), v4->_mtime);
  if (v4->_btime)
    objc_msgSend(v3, "appendFormat:", CFSTR(" bt:%@"), v4->_btime);
  if (v4->_lastUsedTime)
    objc_msgSend(v3, "appendFormat:", CFSTR(" last-open:%@"), v4->_lastUsedTime);
  if (v4->_favoriteRank)
    objc_msgSend(v3, "appendFormat:", CFSTR(" favorite-rank:%@"), v4->_favoriteRank);
  if (v4->_attrs)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" a:{"));
    attrs = v4->_attrs;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __26__BRQueryItem_description__block_invoke;
    v40[3] = &unk_1E3DA6000;
    v33 = v3;
    v41 = v33;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](attrs, "enumerateKeysAndObjectsUsingBlock:", v40);
    objc_msgSend(v33, "replaceCharactersInRange:withString:", objc_msgSend(v33, "length") - 1, 1, CFSTR("}"));

  }
  xattrs = v4->_xattrs;
  if (xattrs && -[NSDictionary count](xattrs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" xattrs"));
  conflictingVersions = v4->_conflictingVersions;
  if (conflictingVersions && -[NSArray count](conflictingVersions, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" conflictingversions"));
  symlinkTargetPath = v4->_symlinkTargetPath;
  if (symlinkTargetPath)
  {
    -[NSString fp_obfuscatedPath](symlinkTargetPath, "fp_obfuscatedPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" symlink-target:%@"), v37);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" content-policy:%ld"), v4->_contentPolicy);
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  objc_sync_exit(v4);
  v38 = v3;

  return v38;
}

uint64_t __26__BRQueryItem_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:%@ "), a2, a3);
}

- (NSString)path
{
  BRQueryItem *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSURL path](v2->_url, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (BOOL)isEqualToQueryItem:(id)a3
{
  BRQueryItem *v4;
  BRQueryItem *v5;
  BRQueryItem *v6;
  BRQueryItem *v7;
  _QWORD *v8;
  BRQueryItem *v9;
  BRQueryItem *v10;
  char v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  BRQueryItem *v16;
  BRQueryItem *v17;

  v4 = (BRQueryItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __34__BRQueryItem_isEqualToQueryItem___block_invoke;
    v15 = &unk_1E3DA6028;
    v16 = self;
    v17 = v4;
    v6 = self;
    v7 = v17;
    v8 = v13;
    if (v6 >= v7)
    {
      v9 = v7;
      objc_sync_enter(v9);
      v10 = v6;
    }
    else
    {
      v9 = v6;
      objc_sync_enter(v9);
      v10 = v7;
    }
    objc_sync_enter(v10);
    v11 = v14((uint64_t)v8);
    objc_sync_exit(v10);

    objc_sync_exit(v9);
  }

  return v11;
}

uint64_t __34__BRQueryItem_isEqualToQueryItem___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  uint64_t result;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(v1 + 240) != v2[30])
    return 0;
  v4 = *(void **)(v1 + 8);
  v5 = (void *)v2[1];
  if (v4 != v5)
  {
    if (!v5)
      return 0;
    result = objc_msgSend(v4, "isEqualToString:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v7 = *(void **)(v1 + 16);
  v8 = (void *)v2[2];
  if (v7 != v8)
  {
    if (!v8)
      return 0;
    result = objc_msgSend(v7, "isEqualToString:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v9 = *(void **)(v1 + 24);
  v10 = (void *)v2[3];
  if (v9 != v10)
  {
    if (!v10)
      return 0;
    result = objc_msgSend(v9, "isEqualToString:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v11 = *(void **)(v1 + 32);
  v12 = (void *)v2[4];
  if (v11 != v12)
  {
    if (!v12)
      return 0;
    result = objc_msgSend(v11, "isEqualToString:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v13 = *(void **)(v1 + 48);
  v14 = (void *)v2[6];
  if (v13 != v14)
  {
    if (!v14)
      return 0;
    result = objc_msgSend(v13, "isEqualToFileObjectID:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v15 = *(void **)(v1 + 56);
  v16 = (void *)v2[7];
  if (v15 != v16)
  {
    if (!v16)
      return 0;
    result = objc_msgSend(v15, "isEqualToFileObjectID:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v17 = *(void **)(v1 + 64);
  v18 = (void *)v2[8];
  if (v17 != v18)
  {
    if (!v18)
      return 0;
    result = objc_msgSend(v17, "isEqualToFileObjectID:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v19 = *(void **)(v1 + 72);
  v20 = (void *)v2[9];
  if (v19 != v20)
  {
    if (!v20)
      return 0;
    result = objc_msgSend(v19, "isEqualToNumber:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v21 = *(void **)(v1 + 80);
  v22 = (void *)v2[10];
  if (v21 != v22)
  {
    if (!v22)
      return 0;
    result = objc_msgSend(v21, "isEqualToNumber:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v23 = *(void **)(v1 + 88);
  v24 = (void *)v2[11];
  if (v23 != v24)
  {
    if (!v24)
      return 0;
    result = objc_msgSend(v23, "isEqualToNumber:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v25 = *(void **)(v1 + 96);
  v26 = (void *)v2[12];
  if (v25 != v26)
  {
    if (!v26)
      return 0;
    result = objc_msgSend(v25, "isEqualToNumber:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v27 = *(void **)(v1 + 104);
  v28 = (void *)v2[13];
  if (v27 != v28)
  {
    if (!v28)
      return 0;
    result = objc_msgSend(v27, "isEqualToNumber:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v29 = *(void **)(v1 + 216);
  v30 = (void *)v2[27];
  if (v29 != v30)
  {
    if (!v30)
      return 0;
    result = objc_msgSend(v29, "isEqualToDictionary:");
    if (!(_DWORD)result)
      return result;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
  }
  v31 = *(void **)(v1 + 192);
  v32 = (void *)v2[24];
  if (v31 == v32)
    goto LABEL_58;
  if (!v32)
    return 0;
  result = objc_msgSend(v31, "isEqualToArray:");
  if (!(_DWORD)result)
    return result;
  v1 = *(_QWORD *)(a1 + 32);
LABEL_58:
  v33 = objc_msgSend(*(id *)(v1 + 48), "isFpfsItem");
  v34 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "isFpfsItem");
  if (v33 != (_DWORD)v34)
    return 0;
  if (!BRIsFPFSEnabled(v34, v35))
    return 1;
  v36 = *(_QWORD **)(a1 + 32);
  v37 = *(_QWORD **)(a1 + 40);
  v38 = (void *)v36[21];
  v39 = (void *)v37[21];
  if (v38 != v39)
  {
    if (!v39)
      return 0;
    result = objc_msgSend(v38, "isEqualToData:");
    if (!(_DWORD)result)
      return result;
    v36 = *(_QWORD **)(a1 + 32);
    v37 = *(_QWORD **)(a1 + 40);
  }
  v40 = (void *)v36[23];
  v41 = (void *)v37[23];
  if (v40 != v41)
  {
    if (!v41)
      return 0;
    result = objc_msgSend(v40, "isEqualToData:");
    if (!(_DWORD)result)
      return result;
    v36 = *(_QWORD **)(a1 + 32);
    v37 = *(_QWORD **)(a1 + 40);
  }
  v42 = (void *)v36[26];
  v43 = (void *)v37[26];
  if (v42 != v43)
  {
    if (!v43)
      return 0;
    result = objc_msgSend(v42, "isEqualToString:");
    if (!(_DWORD)result)
      return result;
    v36 = *(_QWORD **)(a1 + 32);
    v37 = *(_QWORD **)(a1 + 40);
  }
  v44 = (void *)v36[28];
  v45 = (void *)v37[28];
  if (v44 != v45)
  {
    if (!v45)
      return 0;
    result = objc_msgSend(v44, "isEqualToDictionary:");
    if (!(_DWORD)result)
      return result;
    v36 = *(_QWORD **)(a1 + 32);
    v37 = *(_QWORD **)(a1 + 40);
  }
  v46 = (void *)v36[20];
  v47 = (void *)v37[20];
  if (v46 == v47)
    return v36[25] == v37[25];
  if (!v47)
    return 0;
  result = objc_msgSend(v46, "isEqualToString:");
  if ((_DWORD)result)
  {
    v36 = *(_QWORD **)(a1 + 32);
    v37 = *(_QWORD **)(a1 + 40);
    return v36[25] == v37[25];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  BRQueryItem *v4;
  BOOL v5;

  v4 = (BRQueryItem *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRQueryItem isEqualToQueryItem:](self, "isEqualToQueryItem:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  BRQueryItem *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BRFileObjectID hash](v2->_fileObjectID, "hash");
  objc_sync_exit(v2);

  return v3;
}

- (void)_mergeAttrs:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BRQueryItem *v8;
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *attrs;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  BRQueryItem *v16;
  id v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  BOOL v22;
  void *v23;
  BRQueryItem *v24;
  id v25;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  BRQueryItem *v31;
  id v32;
  void *v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *v37;
  NSMutableDictionary *v38;
  uint64_t i;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  v46 = xmmword_1E3DA60A8;
  v47 = *(_OWORD *)&off_1E3DA60B8;
  v48 = xmmword_1E3DA60C8;
  v42 = xmmword_1E3DA6068;
  v43 = *(_OWORD *)&off_1E3DA6078;
  v44 = xmmword_1E3DA6088;
  v45 = *(_OWORD *)&off_1E3DA6098;
  v40 = xmmword_1E3DA6048;
  v41 = *(_OWORD *)&off_1E3DA6058;
  do
  {
    v6 = *(void **)((char *)&v40 + v5);
    v7 = (void *)v4[27];
    v8 = self;
    v9 = v6;
    v10 = v7;
    objc_msgSend(v10, "objectForKey:", v9, v40, v41, v42, v43, v44, v45, v46, v47, v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    attrs = self->_attrs;
    if (v11)
    {
      if (!attrs)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v14 = self->_attrs;
        self->_attrs = v13;

        attrs = self->_attrs;
      }
      -[NSMutableDictionary setObject:forKey:](attrs, "setObject:forKey:", v11, v9);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](attrs, "removeObjectForKey:", v9);
    }

    v5 += 8;
  }
  while (v5 != 144);
  v15 = (void *)v4[27];
  v16 = v8;
  v17 = v15;
  objc_msgSend(v17, "objectForKey:", CFSTR("alias-path"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = self->_attrs;
    if (!v19)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v21 = self->_attrs;
      self->_attrs = v20;

      v19 = self->_attrs;
    }
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, CFSTR("alias-path"));
  }

  v22 = -[BRQueryItem isInTransfer](v16, "isInTransfer");
  v23 = (void *)v4[27];
  v24 = v16;
  v25 = v23;
  objc_msgSend(v25, "objectForKey:", CFSTR("dl%"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = self->_attrs;
    if (!v27)
    {
      v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v29 = self->_attrs;
      self->_attrs = v28;

      v27 = self->_attrs;
    }
    -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v26, CFSTR("dl%"));
  }
  else if (!v22)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_attrs, "removeObjectForKey:", CFSTR("dl%"));
  }

  v30 = (void *)v4[27];
  v31 = v24;
  v32 = v30;
  objc_msgSend(v32, "objectForKey:", CFSTR("ul%"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = self->_attrs;
    if (!v34)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = self->_attrs;
      self->_attrs = v35;

      v34 = self->_attrs;
    }
    -[NSMutableDictionary setObject:forKey:](v34, "setObject:forKey:", v33, CFSTR("ul%"));
  }
  else if (!v22)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_attrs, "removeObjectForKey:", CFSTR("ul%"));
  }

  v37 = self->_attrs;
  if (v37 && !-[NSMutableDictionary count](v37, "count"))
  {
    v38 = self->_attrs;
    self->_attrs = 0;

  }
  for (i = 136; i != -8; i -= 8)

}

- (void)_mergeURL:(id)a3
{
  _QWORD *v4;
  NSURL *url;
  NSURL **p_url;
  NSURL *v7;
  NSURL *v9;
  NSURL *v10;
  const void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  const void *v17;
  uint64_t v18;
  NSURL *v19;
  NSURL *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSURL *v25;
  id v26;
  int active_platform;
  id v28;
  uint64_t v29;
  int64_t v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  NSURL *v38;
  id v39;
  int v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  int64_t v45;
  void *v46;
  NSObject *v47;
  int v48;
  void *v49;
  NSObject *v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_url = &self->_url;
  url = self->_url;
  v7 = (NSURL *)v4[15];
  if (url == v7 || v7 == 0)
    goto LABEL_63;
  v9 = url;
  v10 = v7;
  v11 = (const void *)MEMORY[0x1A1AD7D68]();
  if (!v11)
  {
    v12 = MEMORY[0x1A1AD7D68](v9);
    if (!v12)
      goto LABEL_9;
    v11 = (const void *)v12;
    MEMORY[0x1A1AD7D20](v10, v12);
  }
  CFRelease(v11);
LABEL_9:

  v13 = (void *)_CFURLPromiseCopyPhysicalURL();
  v14 = v13;
  if (v13 != (void *)v4[15])
  {
    v15 = (id)_CFURLPromiseCopyPhysicalURL();
    v16 = v13;
    v17 = (const void *)MEMORY[0x1A1AD7D68]();
    if (!v17)
    {
      v18 = MEMORY[0x1A1AD7D68](v15);
      if (!v18)
      {
LABEL_14:

        _CFURLPromiseSetPhysicalURL();
        v14 = (void *)v4[15];

        goto LABEL_15;
      }
      v17 = (const void *)v18;
      MEMORY[0x1A1AD7D20](v16, v18);
    }
    CFRelease(v17);
    goto LABEL_14;
  }
LABEL_15:
  objc_storeStrong((id *)&self->_url, v14);
  v19 = v13;
  if (-[BRFileObjectID isDocumentID](self->_fileObjectID, "isDocumentID"))
  {
    v20 = self->_url;
    v21 = *MEMORY[0x1E0C9B418];
    -[BRFileObjectID documentID](self->_fileObjectID, "documentID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AD7DBC](v20, v21, v22);

  }
  v23 = MEMORY[0x1A1AD7D68](*p_url);
  if (v23)
  {
    v24 = (void *)v23;
    v25 = self->_url;
    v26 = v24;
    active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 11 || active_platform == 1)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0 && objc_msgSend(v26, "length"))
      {
        v28 = objc_retainAutorelease(v26);
        objc_msgSend(v28, "bytes");
        v29 = sandbox_extension_consume();
        if (v29 < 0)
        {
          v33 = *__error();
          brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v52 = v28;
            v53 = 1024;
            v54 = v33;
            v55 = 2112;
            v56 = v34;
            _os_log_error_impl(&dword_19CBF0000, v35, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v33;
        }
        else
        {
          v30 = v29;
          if (self->_logicalHandle < 0)
          {
            brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            brc_notifications_log();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.3();
          }
          else
          {
            sandbox_extension_release();
            brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            brc_notifications_log();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.2();
          }

          self->_logicalHandle = v30;
        }
      }
    }
    else
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    }

    CFRelease(v26);
  }
  if (v19)
  {
    if (v19 == *p_url)
    {
      if ((self->_physicalHandle & 0x8000000000000000) == 0)
      {
        brc_bread_crumbs((uint64_t)"-[BRQueryItem _mergeURL:]", 2318);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[BRQueryItem _mergeURL:].cold.1();

        sandbox_extension_release();
        self->_physicalHandle = -1;
      }
    }
    else
    {
      v36 = MEMORY[0x1A1AD7D68](v19);
      if (v36)
      {
        v37 = (void *)v36;
        v38 = v19;
        v39 = v37;
        v40 = dyld_get_active_platform();
        if ((v40 & 0xFFFFFFFB) == 2 || v40 == 11 || v40 == 1)
        {
          if ((dyld_program_sdk_at_least() & 1) == 0 && objc_msgSend(v39, "length"))
          {
            v43 = objc_retainAutorelease(v39);
            objc_msgSend(v43, "bytes");
            v44 = sandbox_extension_consume();
            if (v44 < 0)
            {
              v48 = *__error();
              brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1690);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(0);
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412802;
                v52 = v43;
                v53 = 1024;
                v54 = v48;
                v55 = 2112;
                v56 = v49;
                _os_log_error_impl(&dword_19CBF0000, v50, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
              }

              *__error() = v48;
            }
            else
            {
              v45 = v44;
              if (self->_physicalHandle < 0)
              {
                brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1686);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                brc_notifications_log();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.3();
              }
              else
              {
                sandbox_extension_release();
                brc_bread_crumbs((uint64_t)"brc_sandbox_replace_extension", 1684);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                brc_notifications_log();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  -[BRQueryItem attachLogicalExtension:physicalExtension:].cold.2();
              }

              self->_physicalHandle = v45;
            }
          }
        }
        else
        {
          syslog(5, "Unknown platform linking against CloudDocs framework %d", v40);
        }

        CFRelease(v39);
      }
    }
  }

LABEL_63:
}

- (id)attributeForKey:(id)a3
{
  id v4;
  BRQueryItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend((id)_getterMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItem attributeForKey:]", 2329);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRQueryItem attributeForKey:].cold.1();

  }
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_attrs, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_sync_exit(v5);
  return v8;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  BRQueryItem *v7;
  NSMutableDictionary *attrs;
  uint64_t v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  attrs = v7->_attrs;
  if (!v11)
  {
    -[NSMutableDictionary removeObjectForKey:](attrs, "removeObjectForKey:", v6);
    v9 = -[NSMutableDictionary count](v7->_attrs, "count");
    if (v9)
      goto LABEL_8;
LABEL_7:
    v10 = v7->_attrs;
    v7->_attrs = (NSMutableDictionary *)v9;

    goto LABEL_8;
  }
  if (!attrs)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, v6, 0);
    goto LABEL_7;
  }
  -[NSMutableDictionary setObject:forKey:](attrs, "setObject:forKey:", v11, v6);
LABEL_8:
  objc_sync_exit(v7);

}

- (BOOL)canMerge:(id)a3
{
  BRQueryItem *v4;
  BRQueryItem *v5;
  BRQueryItem *v6;
  BRQueryItem *v7;
  _QWORD *v8;
  BRQueryItem *v9;
  BRQueryItem *v10;
  char v11;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  BRQueryItem *v16;
  BRQueryItem *v17;

  v4 = (BRQueryItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __24__BRQueryItem_canMerge___block_invoke;
    v15 = &unk_1E3DA6028;
    v16 = self;
    v17 = v4;
    v6 = self;
    v7 = v17;
    v8 = v13;
    if (v6 >= v7)
    {
      v9 = v7;
      objc_sync_enter(v9);
      v10 = v6;
    }
    else
    {
      v9 = v6;
      objc_sync_enter(v9);
      v10 = v7;
    }
    objc_sync_enter(v10);
    v11 = v14((uint64_t)v8);
    objc_sync_exit(v10);

    objc_sync_exit(v9);
  }

  return v11;
}

uint64_t __24__BRQueryItem_canMerge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 == *(void **)(v1 + 8))
    return 1;
  else
    return objc_msgSend(v2, "isEqualToString:");
}

- (void)merge:(id)a3 allowMergingFileObjectIDIfPossible:(BOOL)a4
{
  BRQueryItem *v6;
  BRQueryItem *v7;
  BRQueryItem *v8;
  _QWORD *v9;
  BRQueryItem *v10;
  BRQueryItem *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  BRQueryItem *v17;
  BRQueryItem *v18;
  BOOL v19;

  v6 = (BRQueryItem *)a3;
  if (!v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]", 2370);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRQueryItem merge:allowMergingFileObjectIDIfPossible:].cold.1();

  }
  if (self != v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v15 = __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke;
    v16 = &unk_1E3DA60E0;
    v19 = a4;
    v17 = self;
    v18 = v6;
    v7 = self;
    v8 = v18;
    v9 = v14;
    if (v7 >= v8)
    {
      v10 = v8;
      objc_sync_enter(v10);
      v11 = v7;
    }
    else
    {
      v10 = v7;
      objc_sync_enter(v10);
      v11 = v8;
    }
    objc_sync_enter(v11);
    ((void (*)(_QWORD *))v15)(v9);
    objc_sync_exit(v11);

    objc_sync_exit(v10);
  }

}

uint64_t __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  int v7;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = BRIsFPFSEnabled(a1, a2);
  if (!v3 || !*(_BYTE *)(a1 + 48))
    goto LABEL_12;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 48))
  {
    objc_storeStrong((id *)(v4 + 48), *(id *)(*(_QWORD *)(a1 + 40) + 48));
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(void **)(v4 + 272);
  if (v5 && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272) && objc_msgSend(v5, "isEqual:"))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(a1 + 40) + 48));
  if (*(_BYTE *)(a1 + 48) && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) && !*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2397);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138412290;
      v32 = v27;
      _os_log_impl(&dword_19CBF0000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Both fileObjectIDs are nil, proceeding%@", (uint8_t *)&v31, 0xCu);
    }

  }
  else
  {
LABEL_12:
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isEqualToFileObjectID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48)) & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2399);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v23 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        v31 = 138412802;
        v32 = v23;
        v33 = 2112;
        v34 = v24;
        v35 = 2112;
        v36 = v16;
        _os_log_error_impl(&dword_19CBF0000, v17, (os_log_type_t)0x90u, "[ERROR] failed merging object id %@ with %@%@", (uint8_t *)&v31, 0x20u);
      }

      brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2400);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v25 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
        v31 = 138412802;
        v32 = v25;
        v33 = 2112;
        v34 = v26;
        v35 = 2112;
        v36 = v18;
        _os_log_fault_impl(&dword_19CBF0000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't merge objects with different object ids (%@, %@)%@", (uint8_t *)&v31, 0x20u);
      }

      return 0;
    }
  }
  v6 = (_QWORD *)(a1 + 40);
  v7 = (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 240) >> 20) & 1;
  if (((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 240) >> 20) & 1) != v7 && v7 != 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2405);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke_cold_1(v6);

    return 0;
  }
  brc_bread_crumbs((uint64_t)"-[BRQueryItem merge:allowMergingFileObjectIDIfPossible:]_block_invoke", 2408);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(void **)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    v31 = 138412802;
    v32 = v29;
    v33 = 2112;
    v34 = v30;
    v35 = 2112;
    v36 = v9;
    _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] Merging %@ with %@%@", (uint8_t *)&v31, 0x20u);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240);
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 264) |= *(_WORD *)(*(_QWORD *)(a1 + 40) + 264);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(*(_QWORD *)(a1 + 40) + 8));
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 16);
  if (v12)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v12);
    v11 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "_mergeURL:", v11);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 128);
  if (v14)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v14);
    v13 = *(_QWORD *)(a1 + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(v13 + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(*(_QWORD *)(a1 + 40) + 72));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(*(_QWORD *)(a1 + 40) + 80));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(*(_QWORD *)(a1 + 40) + 88));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(*(_QWORD *)(a1 + 40) + 96));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(*(_QWORD *)(a1 + 40) + 104));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(*(_QWORD *)(a1 + 40) + 112));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(*(_QWORD *)(a1 + 40) + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(*(id *)(a1 + 32), "_mergeAttrs:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(*(_QWORD *)(a1 + 40) + 184));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(*(_QWORD *)(a1 + 40) + 168));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(*(_QWORD *)(a1 + 40) + 176));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(*(_QWORD *)(a1 + 40) + 208));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), *(id *)(*(_QWORD *)(a1 + 40) + 224));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(*(_QWORD *)(a1 + 40) + 192));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(*(_QWORD *)(a1 + 40) + 160));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200);
  }
  return 1;
}

- (void)merge:(id)a3
{
  -[BRQueryItem merge:allowMergingFileObjectIDIfPossible:](self, "merge:allowMergingFileObjectIDIfPossible:", a3, 0);
}

- (void)mergeProgressUpdate:(id)a3
{
  -[BRQueryItem setAttribute:forKey:](self, "setAttribute:forKey:", a3, CFSTR("inflight"));
}

+ (id)askDaemonQueryItemForURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "askDaemonQueryItemForURL:andFakeFSEvent:error:", a3, 0, a4);
}

+ (id)askDaemonQueryItemForURL:(id)a3 andFakeFSEvent:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  BRQueryItem *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[3];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(0, (uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2478, v30);
  brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2478);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v26 = (void *)v30[0];
    objc_msgSend(v7, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v32 = v26;
    v33 = 2112;
    v34 = v27;
    v35 = 2112;
    v36 = v8;
    _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx asking item for url: %@%@", buf, 0x20u);

  }
  if (BRIsFPFSEnabled(v10, v11))
  {
    objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemForURL:error:", v7, a5);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[BRQueryItem initWithFPItem:]([BRQueryItem alloc], "initWithFPItem:", v13);
      brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2488);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:].cold.1();
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2483);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v15;
        _os_log_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't build FPItem%@", buf, 0xCu);
      }
      v14 = 0;
    }

  }
  else
  {
    if (v6)
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "newLegacySyncProxy");

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke;
      v29[3] = &unk_1E3DA6108;
      v19 = v29;
      v13 = v18;
      v29[4] = v13;
      objc_msgSend(v13, "updateItemFromURL:reply:", v7, v29);
    }
    else
    {
      +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "newLegacySyncProxy");

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke_2;
      v28[3] = &unk_1E3DA6108;
      v19 = v28;
      v13 = v21;
      v28[4] = v13;
      objc_msgSend(v13, "getQueryItemForURL:reply:", v7, v28);
    }

    brc_bread_crumbs((uint64_t)"+[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:]", 2507);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "result");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:].cold.2(v24, (uint64_t)v22, buf, v23);
    }

    if (a5)
    {
      objc_msgSend(v13, "error");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "result");
    v14 = (BRQueryItem *)objc_claimAutoreleasedReturnValue();
  }

  __brc_leave_section((uint64_t)v30);
  return v14;
}

uint64_t __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

uint64_t __61__BRQueryItem_askDaemonQueryItemForURL_andFakeFSEvent_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

- (id)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
  objc_storeStrong(&self->_replacement, a3);
}

- (id)attributeForName:(id)a3
{
  id v4;
  BRQueryItem *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend((id)_getterMap, "objectForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, BRQueryItem *))(v6 + 16))(v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRQueryItem attributeForName:]", 2526);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRQueryItem attributeForName:].cold.1();

    v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (id)attributeNames
{
  return (id)_allKeys;
}

- (id)attributesForNames:(id)a3
{
  id v4;
  void *v5;
  BRQueryItem *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", _sharedKeySet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[BRQueryItem attributeForName:](v6, "attributeForName:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  return v5;
}

+ (id)containerItemForContainer:(id)a3 withRepresentativeItem:(id)a4
{
  id v5;
  id v6;
  _BRContainerItem *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_BRContainerItem initWithQueryItem:container:zoneRowID:]([_BRContainerItem alloc], "initWithQueryItem:container:zoneRowID:", v5, v6, 0);

  return v7;
}

+ (id)containerItemForContainer:(id)a3 withRepresentativeItem:(id)a4 zoneRowID:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BRContainerItem *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_BRContainerItem initWithQueryItem:container:zoneRowID:]([_BRContainerItem alloc], "initWithQueryItem:container:zoneRowID:", v8, v9, v7);

  return v10;
}

+ (id)containerItemForContainer:(id)a3 forceScan:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "documentsURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    +[BRQueryItem askDaemonQueryItemForURL:andFakeFSEvent:error:](BRQueryItem, "askDaemonQueryItemForURL:andFakeFSEvent:error:", v8, v4, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (v10)
    {
      brc_bread_crumbs((uint64_t)"+[BRQueryItem containerItemForContainer:forceScan:]", 2579);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        objc_msgSend(v7, "documentsURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = v15;
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        _os_log_error_impl(&dword_19CBF0000, v12, (os_log_type_t)0x90u, "[ERROR] Querying item for URL %@ failed: %@%@", buf, 0x20u);

      }
      v13 = 0;
    }
    else
    {
      objc_msgSend(a1, "containerItemForContainer:withRepresentativeItem:zoneRowID:", v7, v9, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isContentZoneRoot
{
  return (BYTE4(self->_flags.value) >> 2) & 1;
}

- (NSData)contentVersion
{
  return self->_contentVersion;
}

- (NSData)structureVersion
{
  return self->_structureVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsmdqFPItemID, 0);
  objc_storeStrong(&self->_replacement, 0);
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_conflictingVersions, 0);
  objc_storeStrong((id *)&self->_structureVersion, 0);
  objc_storeStrong((id *)&self->_equivalentContentVersions, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_symlinkTargetPath, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_parentZoneRowID, 0);
  objc_storeStrong((id *)&self->_localRepresentationURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_childItemCount, 0);
  objc_storeStrong((id *)&self->_favoriteRank, 0);
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_btime, 0);
  objc_storeStrong((id *)&self->_mtime, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_shareRootFileObjectID, 0);
  objc_storeStrong((id *)&self->_parentFileObjectID, 0);
  objc_storeStrong((id *)&self->_fileObjectID, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_physicalName, 0);
  objc_storeStrong((id *)&self->_logicalName, 0);
  objc_storeStrong((id *)&self->_parentPath, 0);
  objc_storeStrong((id *)&self->_appLibraryID, 0);
}

void __25__BRQueryItem_initialize__block_invoke_18_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: bogus uploading state for %@%@");
  OUTLINED_FUNCTION_1();
}

void __25__BRQueryItem_initialize__block_invoke_32_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: unknown permissions for %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)parentFileID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: BRQueryItem::parentFileID is not implemented in FPFS.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: isFpfs || self.isDead%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(_QWORD *)a1 .cold.2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v1, v2, "[CRIT] UNREACHABLE: No logical name for item. Falling back to physical name if it exists %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)attachLogicalExtension:(_QWORD *)a1 physicalExtension:.cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v1, v2, "[CRIT] UNREACHABLE: there should be a physical URL on url: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)attachLogicalExtension:physicalExtension:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[NOTIF] replaced sandbox extension for %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)attachLogicalExtension:physicalExtension:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[NOTIF] consumed sandbox extension for %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)attachLogicalExtension:physicalExtension:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: physicalURL != (__bridge CFURLRef)_url%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithFPItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: [item conformsToProtocol:@protocol(NSFileProviderItem_Private)]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_mergeURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[NOTIF] released sandbox extension for %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)attributeForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !_getterMap[key]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)merge:allowMergingFileObjectIDIfPossible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: update != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__BRQueryItem_merge_allowMergingFileObjectIDIfPossible___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[NOTIF] Dropping from gather update %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

+ (void)askDaemonQueryItemForURL:andFakeFSEvent:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[NOTIF] returning %@%@");
  OUTLINED_FUNCTION_1();
}

+ (void)askDaemonQueryItemForURL:(uint8_t *)buf andFakeFSEvent:(os_log_t)log error:.cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] returning %@%@", buf, 0x16u);

}

- (void)attributeForName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: getter No getter found for key: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
