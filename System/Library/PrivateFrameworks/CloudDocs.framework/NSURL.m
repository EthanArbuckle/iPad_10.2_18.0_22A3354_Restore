@implementation NSURL

id __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BRMangledID *v9;
  id v11;

  v11 = 0;
  v4 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C9AC50], 0);
  v5 = v11;
  v6 = v5;
  v7 = 0;
  if (v4)
  {
    v8 = objc_msgSend(v5, "unsignedLongLongValue");
    if (v8 == objc_msgSend(*(id *)(a1 + 32), "unsignedLongLongValue"))
    {
      v9 = -[BRMangledID initWithMangledString:]([BRMangledID alloc], "initWithMangledString:", *(_QWORD *)(a1 + 40));
      -[BRMangledID appLibraryOrZoneName](v9, "appLibraryOrZoneName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

void __60__NSURL_BRAdditions__br_isExistWithNonMateralizingIOPolicy___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "fileExistsAtPath:", v2);

}

uint64_t __102__NSURL_BRAdditions___br_isParentOfURL_strictly_withNonMateralizingIOPolicy_ignoreHomeDirectoryCheck___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __52__NSURL_BRFinderTagAdditions__br_setTagNames_error___block_invoke(uint64_t a1, int a2)
{
  id v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (fsetxattr(a2, "com.apple.metadata:_kMDItemUserTags", (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), 0, 0) < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", *__error(), CFSTR("couldn't set %llu-byte xattr %s"), objc_msgSend(v4, "length"), "com.apple.metadata:_kMDItemUserTags");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }

  }
  else if (fremovexattr(a2, "com.apple.metadata:_kMDItemUserTags", 0) < 0 && *__error() != 93)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", *__error(), CFSTR("couldn't remove xattr %s"), "com.apple.metadata:_kMDItemUserTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v5 = 0;
  return v5;
}

void __91__NSURL_BRConflictWinner__br_addFakeConflictLoserFromItemAtURL_lastEditorDeviceName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __47__NSURL_BRAdditions__br_isInLocalHomeDirectory__block_invoke(uint64_t result, uint64_t a2, char a3, char a4, uint64_t a5)
{
  uint64_t v5;

  v5 = result;
  if ((a3 & 1) == 0 && (a4 & 1) == 0)
  {
    result = objc_msgSend(*(id *)(result + 32), "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", a2, a5 != 0);
    a4 = result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = a4;
  return result;
}

void __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(unsigned __int8 *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_2;
    v10[3] = &unk_1E3DA6668;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "getBookmarkData:allowAccessByBundleID:documentID:isDirectory:reply:", v6, v7, v8, v9, v10);

  }
}

uint64_t __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__NSURL_BRAdditions__br_bookmarkableStringForURL_withEtag_onlyAllowItemKnowByServer_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void (*v10)(void);
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = v8;
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v7)
    {
      v9 = 0;
      v11 = v14;
    }
    else
    {

      v12 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(*(id *)(a1 + 32), "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "brc_errorNotInCloud:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    v14 = v11;
  }
  v10();

}

uint64_t __86__NSURL_BRAdditions__br_bookmarkableStringForRemoteOpeningAppWithBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__NSURL_BRAdditions__br_documentURLFromFileObjectID_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v10;
  id v11;
  id v12;

  v10 = *(void **)(a1 + 32);
  v11 = a6;
  _BRPromiseURLCombine(a2, a3, a4, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObjResult:error:", v12, v11);

}

uint64_t __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10;
  id v11;
  id v12;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = a6;
  _BRPromiseURLCombine(a2, a3, a4, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v12, v11);

}

void __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v11 = a6;
  _BRPromiseURLCombine(a2, a3, a4, a5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v11;

}

void __71__NSURL_BRAdditions__br_containerIDsWithExternalReferencesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

uint64_t __80__NSURL_BRAdditions__br_containerIDsWithExternalReferencesTo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__NSURL_BRAdditions__br_pathRelativeToSyncedRootURLForContainerID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "br_pathRelativeToMobileDocuments");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__NSURL_BRAdditions__br_pathRelativeToMobileDocuments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  _BOOL8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = *(void **)(a1 + 32);
  v7 = a5 != 0;
  v8 = a2;
  +[BRDaemonConnection mobileDocumentsURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "mobileDocumentsURLForPersonaID:needsPersonaSwitch:", v8, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_pathRelativeToSyncedRootURL:currentPersonaID:", v12, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __34__NSURL_BRAdditions__br_isInTrash__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("Mobile Documents"), CFSTR(".Trash"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)br_isInTrash_centralizedTrashSubStr;
  br_isInTrash_centralizedTrashSubStr = v0;

}

void __42__NSURL_BRAdditions__br_isInSyncedDesktop__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  +[BRDaemonConnection syncedDesktopURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "syncedDesktopURLForPersonaID:needsPersonaSwitch:", a2, a5 != 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "br_isParentOfURL:strictly:", *(_QWORD *)(a1 + 32), 0);

}

void __44__NSURL_BRAdditions__br_isInSyncedDocuments__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  +[BRDaemonConnection syncedDocumentsURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "syncedDocumentsURLForPersonaID:needsPersonaSwitch:", a2, a5 != 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "br_isParentOfURL:strictly:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __53__NSURL_BRAdditions___br_isInSyncedLocationStrictly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_br_isInSyncedLocationWithCurrentPersonaID:strictly:foundHomeDirectory:adoptionError:", a2, *(unsigned __int8 *)(a1 + 48), a4, a5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __53__NSURL_BRAdditions__br_isInCloudDocsPrivateStorages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  +[BRDaemonConnection cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "br_isParentOfURL:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    +[BRDaemonConnection cloudDocsCachesURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "cloudDocsCachesURLForPersonaID:needsPersonaSwitch:", v9, a5 != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "br_isParentOfURL:", *(_QWORD *)(a1 + 32));

  }
}

void __78__NSURL_BRAdditions__br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  +[BRDaemonConnection cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "cloudDocsAppSupportURLForPersonaID:needsPersonaSwitch:", a2, a5 != 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "URLByAppendingPathComponent:", CFSTR("session"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "URLByAppendingPathComponent:", CFSTR("r"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __36__NSURL_BRAdditions__br_containerID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "br_containerIDWithCurrentPersonaID:needsPersonaSwitch:", a2, a5 != 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[BRDaemonConnection mobileDocumentsURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "mobileDocumentsURLForPersonaID:needsPersonaSwitch:", a2, a5 != 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __43__NSURL_BRAdditions__br_cloudDocsContainer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BRMangledID *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "br_containerIDWithCurrentPersonaID:needsPersonaSwitch:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SharedDocs")) & 1) == 0)
  {
    v5 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", v4);
    +[BRContainerCache containerCacheForPersonaID:](BRContainerCache, "containerCacheForPersonaID:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerByID:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

uint64_t __45__NSURL_BRAdditions__br_setAccessTime_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2 == 0, a2);
}

void __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

uint64_t __46__NSURL_BRAdditions__br_getSyncRootWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("Mobile Documents"));
}

void __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

@end
