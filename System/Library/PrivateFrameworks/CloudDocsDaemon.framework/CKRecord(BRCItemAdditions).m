@implementation CKRecord(BRCItemAdditions)

- (uint64_t)brc_isInterestingRecordForSyncDown
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;

  objc_msgSend(a1, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordsToIgnoreOnSyncDown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(v2, "isEqualToString:", CFSTR("structure")))
  {
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR("content")))
    {
      v9 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C94A20]);
      goto LABEL_16;
    }
    v8 = CFSTR("documentContent/");
LABEL_14:
    v9 = objc_msgSend(v4, "hasPrefix:", v8);
LABEL_16:
    v7 = v9;
    goto LABEL_17;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("documentStructure/")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("directory/")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("alias/")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("shareAlias/")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("symlink/")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("finderBookmark/")) & 1) == 0
    && (objc_msgSend(v4, "hasPrefix:", CFSTR("directory/appDocuments_")) & 1) == 0)
  {
    v8 = CFSTR("directory/appData_");
    goto LABEL_14;
  }
LABEL_2:
  v7 = 1;
LABEL_17:

  return v7;
}

- (uint64_t)brc_isInterestingRecordForSave
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!objc_msgSend(a1, "brc_isInterestingRecordForSyncDown"))
    return 0;
  objc_msgSend(a1, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "brc_isAppLibraryRootRecordID") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "brc_isZoneRootRecordID") ^ 1;

  }
  return v3;
}

- (id)brc_oplockMergeEtag
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pluginFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("br_oplockMergeEtag"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)brc_updateDroppedReason
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pluginFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("br_updateDropped"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)brc_safeToGetURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  objc_msgSend(a1, "brc_sharedRootDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "containerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(a1, "brc_sharedRootExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D10F00], "iWorkShareableExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v7, "containsObject:", v4))
  {
    objc_msgSend(a1, "baseToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)brc_lastModifiedUserRecordNameWithCurrentUserRecordName:()BRCItemAdditions personNameComponents:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  uint64_t v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("lastEditorName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  objc_opt_class();
  v11 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v31 = v10;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("user"));

  if (v13)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ckUserId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ckUserId"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v6))
      {
        v16 = v11;
        v11 = (id)*MEMORY[0x1E0C94730];
      }
      else
      {
        if (!a4)
          goto LABEL_12;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) == 0)
          goto LABEL_12;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("last"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v29 = objc_opt_isKindOfClass();

        if ((v29 & 1) != 0)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("last"));
          v30 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("first"));
        v23 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v24 = (void *)v23;
        LOBYTE(v23) = objc_opt_isKindOfClass();

        if ((v23 & 1) != 0)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("first"));
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = 0;
        }
        if (v25 | v30)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0CB3850]);
          objc_msgSend(v26, "setFamilyName:", v30);
          objc_msgSend(v26, "setGivenName:", v25);
          v27 = objc_retainAutorelease(v26);
          *a4 = v27;

        }
      }
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(a1, "recordID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v28;
        v35 = 2112;
        v36 = v9;
        v37 = 2112;
        v38 = v16;
        _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid lastEditorDeviceName on %@: %@%@", buf, 0x20u);

      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
LABEL_12:
  v10 = v31;
LABEL_13:

  if (!v11)
  {
LABEL_14:
    objc_msgSend(a1, "lastModifiedUserRecordID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordName");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (uint64_t)brc_currentUserOwnsLastEditorDeviceWithSessionContext:()BRCItemAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "cachedCurrentUserRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C94730]);

  return v6;
}

- (id)brc_lastEditorDeviceName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  NSObject *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("lastEditorName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("device"));

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(a1, "recordID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v11;
      _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid lastEditorDeviceName on %@: %@%@", buf, 0x20u);

    }
  }
  v6 = 0;
LABEL_10:

  if (!v6)
  {
LABEL_11:
    objc_msgSend(a1, "modifiedByDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)sqliteBind:()BRCItemAdditions index:
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

+ (id)rootDirectoryRecordForZoneID:()BRCItemAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(CFSTR("directory/"), "stringByAppendingString:", CFSTR("root"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v4, v3);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("structure"), v5);
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("encryptedBasename"));

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("basehash"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", time(0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("birthtime"));

  objc_msgSend(v6, "serializeSystemFields:", 0);
  return v6;
}

+ (id)rootAppLibraryRecordForAppLibraryID:()BRCItemAdditions zoneID:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "isDesktopMangledID") & 1) != 0
    || (objc_msgSend(v5, "isDocumentsMangledID") & 1) != 0
    || objc_msgSend(v5, "isShared"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[CKRecord(BRCItemAdditions) rootAppLibraryRecordForAppLibraryID:zoneID:].cold.1();

    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "appLibraryOrZoneName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("~"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("_Data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibraryOrZoneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("directory/appData_"), "stringByAppendingString:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v24, v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("structure"), v16);
    objc_msgSend(CFSTR("directory/"), "stringByAppendingString:", CFSTR("root"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v17, v6);
    v19 = objc_alloc(MEMORY[0x1E0C950C0]);
    v20 = (void *)objc_msgSend(v19, "initWithRecordID:action:", v18, *MEMORY[0x1E0C94A40]);
    objc_msgSend(v9, "encryptedValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("encryptedBasename"));

    objc_msgSend(v13, "brc_SHA256");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("basehash"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", time(0));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("birthtime"));

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("parent"));
    objc_msgSend(v9, "serializeSystemFields:", 0);

  }
  return v9;
}

+ (id)desiredKeysWithMask:()BRCItemAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[26];

  v26[25] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&desiredKeysWithMask__lock);
  v4 = (void *)desiredKeysWithMask__cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&desiredKeysWithMask__lock);
  if (v6)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    v26[0] = CFSTR("encryptedBasename");
    v26[1] = CFSTR("bounceNo");
    v26[2] = CFSTR("extension");
    v26[3] = CFSTR("parent");
    v26[4] = CFSTR("target");
    v26[5] = CFSTR("exactBirthtime");
    v26[6] = CFSTR("birthtime");
    v26[7] = CFSTR("lastOpenTime");
    v26[8] = CFSTR("favoriteRank");
    v26[9] = CFSTR("hiddenExt");
    v26[10] = CFSTR("executable");
    v26[11] = CFSTR("writable");
    v26[12] = CFSTR("exactMtime");
    v26[13] = CFSTR("mtime");
    v26[14] = CFSTR("finderTags");
    v26[15] = CFSTR("restorePath");
    v26[16] = CFSTR("restoreParent");
    v26[17] = CFSTR("targetPath");
    v26[18] = CFSTR("ftags");
    v26[19] = CFSTR("exactSize");
    v26[20] = CFSTR("size");
    v26[21] = CFSTR("shareReference");
    v7 = *MEMORY[0x1E0C94A88];
    v26[22] = CFSTR("countMetrics");
    v26[23] = v7;
    v26[24] = *MEMORY[0x1E0C94A80];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
  if ((a3 & 0xC) != 0)
  {
    v25[0] = CFSTR("fileContent");
    v25[1] = CFSTR("bookmarkContent");
    v25[2] = CFSTR("pkgSignature");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  if ((a3 & 4) != 0)
  {
    v24[0] = CFSTR("pkgContent");
    v24[1] = CFSTR("pkgManifest");
    v24[2] = CFSTR("pkgXattrs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v18);

    if ((a3 & 8) == 0)
    {
LABEL_8:
      if ((a3 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_19;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_8;
  }
  v23[0] = CFSTR("ignorePkgExtension");
  v23[1] = CFSTR("lastEditorName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v19);

  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  v22[0] = CFSTR("thumb1024");
  v22[1] = CFSTR("thumbQLMetadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v20);

  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0)
      goto LABEL_11;
LABEL_21:
    objc_msgSend(v6, "addObject:", CFSTR("basehash"));
    if ((a3 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  objc_msgSend(v6, "addObject:", CFSTR("xattr"));
  objc_msgSend(v6, "addObject:", CFSTR("xattrSignature"));
  if ((a3 & 0x40) != 0)
    goto LABEL_21;
LABEL_11:
  if ((a3 & 0x80) != 0)
  {
LABEL_12:
    v10 = *MEMORY[0x1E0C94B50];
    v21[0] = *MEMORY[0x1E0C94B58];
    v21[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)&desiredKeysWithMask__lock);
  v12 = (void *)desiredKeysWithMask__cache;
  if (!desiredKeysWithMask__cache)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = (void *)desiredKeysWithMask__cache;
    desiredKeysWithMask__cache = (uint64_t)v13;

    v12 = (void *)desiredKeysWithMask__cache;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v15);

  os_unfair_lock_unlock((os_unfair_lock_t)&desiredKeysWithMask__lock);
LABEL_16:
  v16 = v6;

  return v16;
}

- (uint64_t)sanitizeShortTokenFields
{
  objc_msgSend(a1, "setBaseToken:", 0);
  objc_msgSend(a1, "setRoutingKey:", 0);
  return objc_msgSend(a1, "setMutableEncryptedPublicSharingKeyData:", 0);
}

+ (uint64_t)_validateCKObject:()BRCItemAdditions enhancedDrivePrivacyEnabled:
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "assetTransferOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "useMMCSEncryptionV2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v9, "supportsEnhancedDrivePrivacy");

      v10 = (v8 | ~a4) & (v7 | v8 ^ 1);
    }
    else
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[CKRecord(BRCItemAdditions) _validateCKObject:enhancedDrivePrivacyEnabled:].cold.1();

      v10 = 0;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (uint64_t)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  __int128 v51;
  id v52;
  void *v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _QWORD v66[2];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _QWORD v76[10];

  v76[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D10E88]);
  objc_msgSend(a1, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "initWithRecordZoneID:", v8);

  v54 = (void *)v9;
  objc_msgSend(v5, "clientZoneByMangledID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "enhancedDrivePrivacyEnabled");

  v76[0] = CFSTR("xattr");
  v76[1] = CFSTR("pkgManifest");
  v76[2] = CFSTR("fileContent");
  v76[3] = CFSTR("bookmarkContent");
  v76[4] = CFSTR("thumb1024");
  v76[5] = CFSTR("pkgContent");
  v76[6] = CFSTR("pkgXattrs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v62;
    *(_QWORD *)&v14 = 138412546;
    v51 = v14;
    v52 = v5;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v17);
      v19 = (void *)MEMORY[0x1E0C95048];
      objc_msgSend(a1, "objectForKeyedSubscript:", v18, v51);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = objc_msgSend(v19, "_validateCKObject:enhancedDrivePrivacyEnabled:", v20, v11);

      if ((v19 & 1) == 0)
        break;
      if ((_DWORD)v11)
      {
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("xattr")) & 1) == 0)
        {
          objc_msgSend(a1, "objectForKeyedSubscript:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v18, "isEqualToString:", CFSTR("pkgContent"));
            objc_msgSend(a1, "objectForKeyedSubscript:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "boundaryKey");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v55, "containsObject:", v23) & 1) == 0)
            {
              if (objc_msgSend(v55, "count"))
              {
                brc_bread_crumbs();
                v24 = (char *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = v51;
                  v68 = v18;
                  v69 = 2112;
                  v70 = v24;
                  _os_log_fault_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has different boundary key then other assets in the record!%@", buf, 0x16u);
                }

                v5 = v52;
              }
              else
              {
                objc_msgSend(v55, "addObject:", v23);
              }
            }

          }
        }
      }
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = "";
      v37 = " not";
      if (!(_DWORD)v11)
        v37 = "";
      *(_DWORD *)buf = 138413058;
      v68 = v18;
      v69 = 2080;
      v70 = v37;
      if (!(_DWORD)v11)
        v36 = "n't";
      v71 = 2080;
      v72 = v36;
      v73 = 2112;
      v74 = v34;
      _os_log_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is%s in mmcsV2 when it should%s be%@", buf, 0x2Au);
    }

    if (a4)
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(a1, "objectForKeyedSubscript:", v18);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "brc_errorInvalidParameter:value:", v18, v32);
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v26 = obj;
      goto LABEL_53;
    }
    v33 = 0;
    v26 = obj;
    goto LABEL_35;
  }
LABEL_19:

  v66[0] = CFSTR("mtime");
  v66[1] = CFSTR("birthtime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v11)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "timestampRoundingAmount");

    if (v28 > 0x3B)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v32 = v26;
      v41 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v58 != v43)
              objc_enumerationMutation(v32);
            objc_msgSend(a1, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v45, "unsignedLongLongValue") % (unint64_t)v28)
            {
              brc_bread_crumbs();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
                -[CKRecord(BRCItemAdditions) validateEnhancedDrivePrivacyFieldsWithSession:error:].cold.2();

              if (a4)
              {
                v48 = (void *)MEMORY[0x1E0CB35C8];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "brc_errorInvalidParameter:value:", CFSTR("rounding amount"), v49);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              v33 = 0;
              goto LABEL_52;
            }

          }
          v42 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          v33 = 1;
          if (v42)
            continue;
          break;
        }
      }
      else
      {
        v33 = 1;
      }
LABEL_52:
      v26 = v32;
      goto LABEL_53;
    }
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[CKRecord(BRCItemAdditions) validateEnhancedDrivePrivacyFieldsWithSession:error:].cold.1();

    if (a4)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "brc_errorInvalidParameter:value:", CFSTR("rounding amount"), v32);
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
      v39 = v54;
      v40 = v55;

      goto LABEL_54;
    }
    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
LABEL_35:
  v39 = v54;
  v40 = v55;
LABEL_54:

  return v33;
}

- (void)brc_fillWithChildBasehashSalt:()BRCItemAdditions
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsEnhancedDrivePrivacy");

  if (v13 && v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "brc_generateBogusKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v13, "isEqualToData:", v6);

    if (v7)
    {
      objc_msgSend(a1, "pluginFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(a1, "pluginFields");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

      }
      else
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      }

      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("br_bougusSaltingKey"));
      objc_msgSend(a1, "setPluginFields:", v10);

    }
    objc_msgSend(a1, "encryptedValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("childBasehashSalt"));

    objc_msgSend(v13, "brc_truncatedSHA256");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v12, CFSTR("childBasehashSaltValidationKey"));

  }
}

+ (void)rootAppLibraryRecordForAppLibraryID:()BRCItemAdditions zoneID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: rootAppLibraryRecordForAppLibraryID: should not be called with a bogus app library id %@%@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)_validateCKObject:()BRCItemAdditions enhancedDrivePrivacyEnabled:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: CKObject of unexpected type - %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Rounding amount should be at least 1 minute%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)validateEnhancedDrivePrivacyFieldsWithSession:()BRCItemAdditions error:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: %@ is not rounded the correct amount%@", v1);
  OUTLINED_FUNCTION_2();
}

@end
