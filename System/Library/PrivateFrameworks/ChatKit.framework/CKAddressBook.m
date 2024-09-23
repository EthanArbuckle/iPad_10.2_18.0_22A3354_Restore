@implementation CKAddressBook

+ (id)contactImageCache
{
  if (contactImageCache_once != -1)
    dispatch_once(&contactImageCache_once, &__block_literal_global_249);
  return (id)contactImageCache_cache;
}

void __34__CKAddressBook_contactImageCache__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = CKDefaultCacheLimit();
  CKCreateNSCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)contactImageCache_cache;
  contactImageCache_cache = v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", contactImageCache_cache, sel_removeAllObjects, *MEMORY[0x1E0D373C8], 0);

}

+ (id)contactImageOfDiameter:(double)a3 forID:(id)a4 monogramStyle:(int64_t)a5 tintMonogramText:(BOOL)a6
{
  return (id)objc_msgSend(a1, "contactImageOfDiameter:forID:monogramStyle:tintMonogramText:customFont:", a4, a5, a6, 0, a3);
}

+ (id)contactImageOfDiameter:(double)a3 forID:(id)a4 monogramStyle:(int64_t)a5 tintMonogramText:(BOOL)a6 customFont:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v24;
  _QWORD v25[3];
  _BOOL8 v26;
  _QWORD v27[2];

  v8 = a6;
  v27[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  *(double *)v25 = a3;
  v25[1] = objc_msgSend(v12, "intValue");
  v25[2] = a5;
  v26 = v8;
  *(_DWORD *)((char *)&v26 + 1) = v13 != 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v25, "{?=diqBB}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactImageCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97518], "descriptorForRequiredKeysIncludingImage:", 1);
    v24 = a5;
    v18 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchCNContactForHandleID:withKeys:", v12, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v21)
      || (objc_msgSend(a1, "monogrammerWithDiameter:style:useAppTintColor:customFont:", v24, v18, v13, a3),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v22, "monogramForContact:", v21),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          !v16))
    {
      objc_msgSend(a1, "placeholderContactImageOfDiameter:monogramStyle:tintMonogramText:", v24, v18, a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "setObject:forKey:", v16, v14);

  }
  return v16;
}

+ (id)placeholderContactImageOfDiameter:(double)a3 monogramStyle:(int64_t)a4 tintMonogramText:(BOOL)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "monogrammerWithDiameter:style:useAppTintColor:customFont:", a4, a5, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "silhouetteMonogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)transcriptContactImageOfDiameter:(double)a3 forID:(id)a4
{
  return (id)objc_msgSend(a1, "contactImageOfDiameter:forID:monogramStyle:tintMonogramText:", a4, 0, 0, a3);
}

+ (id)locationSharingContactImageOfDiameter:(double)a3 forID:(id)a4 useCustomFont:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 42.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(a1, "contactImageOfDiameter:forID:monogramStyle:tintMonogramText:customFont:", v8, 1, 1, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)monogrammerProvider
{
  return +[_CKAddressBookMonogrammerProvider sharedInstance](_CKAddressBookMonogrammerProvider, "sharedInstance");
}

+ (void)flushMonogrammers
{
  id v3;

  pthread_mutex_lock(&__CKAddressBook_MonogrammersMutex);
  pthread_mutex_unlock(&__CKAddressBook_MonogrammersMutex);
  objc_msgSend(a1, "contactImageCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

+ (id)monogrammerWithDiameter:(double)a3 style:(int64_t)a4 useAppTintColor:(BOOL)a5 customFont:(id)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _BOOL8 v19;

  v6 = a5;
  v10 = a6;
  pthread_mutex_lock(&__CKAddressBook_MonogrammersMutex);
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  *(double *)v18 = a3;
  v18[1] = a4;
  v19 = v6;
  *(_DWORD *)((char *)&v19 + 1) = v10 != 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v18, "{?=dqBB}");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(a1, "monogrammerProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "monogrammerForStyle:diameter:", a4, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "theme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appTintColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "monogramsWithTint:", v16);

    }
    if (v10)
      objc_msgSend(v12, "setFont:", v10);
    objc_msgSend(0, "setObject:forKey:", v12, v11);
  }
  pthread_mutex_unlock(&__CKAddressBook_MonogrammersMutex);

  return v12;
}

@end
