@implementation CNContactFetchRequestEffectiveKeyExtender

+ (id)extendRequestedKeys:(id)a3 shouldUnifyResults:(BOOL)a4 sortOrder:(int64_t)a5
{
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString **v12;
  __CFString **v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v7);
  +[CNContact alwaysFetchedKeys](CNContact, "alwaysFetchedKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  v11 = objc_msgSend(v7, "_cn_any:", &__block_literal_global_126);
  if (v5)
  {
    objc_msgSend(v8, "addObject:", CFSTR("linkIdentifier"));
    objc_msgSend(v8, "addObject:", CFSTR("preferredForName"));
    if (v11)
    {
      objc_msgSend(v8, "addObject:", CFSTR("sharedPhotoDisplayPreference"));
      v12 = CNContactPreferredForImageKey;
      v13 = CNContactisUsingSharedPhotoKey;
LABEL_6:
      objc_msgSend(v8, "addObject:", *v13);
      objc_msgSend(v8, "addObject:", *v12);
    }
  }
  else if (v11)
  {
    v12 = CNContactisUsingSharedPhotoKey;
    v13 = CNContactSharedPhotoDisplayPreferenceKey;
    goto LABEL_6;
  }
  return v8;
}

uint64_t __94__CNContactFetchRequestEffectiveKeyExtender_extendRequestedKeys_shouldUnifyResults_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

    }
    else
    {
      v11 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE191798);

      if (!v11)
      {
        v7 = 0;
        goto LABEL_12;
      }
    }
    +[CN allImageDataPropertyKeys](CN, "allImageDataPropertyKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_cn_requiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "intersectsKeyVector:", v5);

    if ((v6 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      +[CN allWallpaperPropertyKeys](CN, "allWallpaperPropertyKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_cn_requiredKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "intersectsKeyVector:", v9);

    }
  }
  else
  {
    v7 = 0;
    v4 = v2;
  }

LABEL_12:
  return v7;
}

@end
