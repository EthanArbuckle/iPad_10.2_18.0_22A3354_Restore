@implementation EMFQueryResultSorter

+ (id)sortResults:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4 sortType:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a3;
  v8 = v7;
  if (a5 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_sortResults_clusterGenderVariantsTogether:withLocaleData:", v7, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v9 = v7;
  if (!a5)
  {
    objc_msgSend((id)objc_opt_class(), "_sortResults_default:withLocaleData:", v7, a4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v10;

  }
  return v9;
}

+ (int64_t)compareEmojiTokenGenderInclusiveFirst:(id)a3 withOtherToken:(id)a4
{
  return _compareEmojiTokensUsingGenderInclusiveSortCollation(a3, a4);
}

+ (id)_sortResults_default:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  return (id)objc_msgSend(a3, "sortedArrayUsingFunction:context:", _compareEmojiStringsUsingDefaultSortCollation, a4);
}

+ (id)_sortResults_clusterGenderVariantsTogether:(id)a3 withLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EMFEmojiStringGenderVariantFactory *v12;
  int Gender;
  int v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  EMFEmojiStringGenderVariantFactory *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v41;
    *(_QWORD *)&v7 = 138543618;
    v30 = v7;
    v31 = *(_QWORD *)v41;
    do
    {
      v10 = 0;
      v32 = v8;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v10);
        if ((objc_msgSend(v5, "containsObject:", v11, v30) & 1) == 0)
        {
          v12 = (EMFEmojiStringGenderVariantFactory *)CEMEmojiTokenCreateWithString();
          Gender = CEMEmojiTokenGetGender();
          if (Gender)
          {
            v14 = Gender;
            v33 = v10;
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            for (i = 0; i != 4; ++i)
            {
              v17 = kEMFEmojiGenderInclusiveSortCollation[i];
              if ((_DWORD)v17 == v14)
              {
                objc_msgSend(v15, "addObject:", v12);
                v18 = v12;
              }
              else
              {
                v18 = -[EMFEmojiStringGenderVariantFactory initWithSourceString:gender:]([EMFEmojiStringGenderVariantFactory alloc], "initWithSourceString:gender:", v11, v17);
                -[EMFEmojiStringGenderVariantFactory stringForGenderVariant:](v18, "stringForGenderVariant:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(obj, "containsObject:", v19))
                {
                  v20 = CEMEmojiTokenCreateWithString();
                  if (v20)
                  {
                    v21 = v20;
                    objc_msgSend(v15, "addObject:", v20);
                  }
                  else
                  {
                    emf_logging_get_default_log();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v30;
                      v46 = 0;
                      v47 = 1026;
                      v48 = v17;
                      _os_log_error_impl(&dword_1B3DE1000, v21, OS_LOG_TYPE_ERROR, "EMFQueryResultSorter: Failed to find a CoreEmoji entry for '%{public}@' (variantGender: %{public}d", buf, 0x12u);
                    }
                  }

                }
              }

            }
            objc_msgSend(v15, "sortUsingFunction:context:", _compareEmojiTokensUsingDefaultSortCollation, a4);
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v22 = v15;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v37 != v25)
                    objc_enumerationMutation(v22);
                  CEMEmojiTokenGetString();
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v27);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v24);
            }

            v9 = v31;
            v8 = v32;
            v10 = v33;
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11);
            if (v12)
              CFRelease(v12);
          }
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v8);
  }

  v28 = (void *)objc_msgSend(v5, "copy");
  return v28;
}

@end
