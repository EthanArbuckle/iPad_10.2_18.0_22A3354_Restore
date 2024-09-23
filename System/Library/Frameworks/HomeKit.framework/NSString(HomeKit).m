@implementation NSString(HomeKit)

- (id)hm_generateSHA1
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hm_generateSHA1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)stringByTransformingFirstWordUsingBlock:()HomeKit
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v24 = &unk_19B4AF1F1;
  v25 = xmmword_19B44D020;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__56794;
  v19 = __Block_byref_object_dispose__56795;
  v20 = 0;
  v5 = objc_msgSend(a1, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__NSString_HomeKit__stringByTransformingFirstWordUsingBlock___block_invoke;
  v11[3] = &unk_1E3AB6140;
  v13 = &v21;
  v14 = &v15;
  v6 = v4;
  v12 = v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 3, v11);
  v7 = v22[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v7, v22[5], v16[5]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (uint64_t)stringByCapitalizingFirstWord
{
  return objc_msgSend(a1, "stringByTransformingFirstWordUsingBlock:", &__block_literal_global_56793);
}

- (id)hm_truncatedDisplayableVersionString
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if ((unint64_t)objc_msgSend(a1, "length") > 0x40)
  {
    v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", 0, 64);
    objc_msgSend(a1, "substringWithRange:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") <= 0x40)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", 63);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)hm_truncatedNameString
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  if (HMMaxLengthForNaming__hmf_once_t5 != -1)
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
  v2 = HMMaxLengthForNaming__hmf_once_v6;
  if (HMMaxLengthForNaming__hmf_once_v6 && objc_msgSend(a1, "length") > v2)
  {
    v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", 0, v2);
    objc_msgSend(a1, "substringWithRange:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") <= v2)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", v2 - 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    v7 = a1;
  }
  return v7;
}

- (uint64_t)hm_containsAnyTextCheckingTypeInTypes:()HomeKit
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", a3, &v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v45;
  objc_msgSend(v5, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "resultType") & a3) != 0)
        {
          v12 = 1;
          v13 = v7;
          goto LABEL_33;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v9)
        continue;
      break;
    }
  }

  if ((a3 & 0x800) != 0)
  {
    v30 = v6;
    v31 = v5;
    v14 = &unk_1E3B303E0;
    v15 = (void *)objc_msgSend(a1, "copy");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(&unk_1E3B303E0, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        v20 = 0;
        v21 = v15;
        do
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v22 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v20);
          objc_msgSend(&unk_1E3B303E0, "objectForKeyedSubscript:", v22, v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", v22, v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          ++v20;
          v21 = v15;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v18);
    }

    if ((objc_msgSend(a1, "isEqualToString:", v15) & 1) != 0)
    {
      v12 = 0;
      v6 = v30;
      v5 = v31;
    }
    else
    {
      v36 = v30;
      objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2048, &v36);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v36;

      objc_msgSend(v5, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v7 = v24;
      v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v33 != v27)
              objc_enumerationMutation(v7);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "resultType", v30) & 0x800) != 0)
            {
              v12 = 1;
              goto LABEL_31;
            }
          }
          v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
          if (v26)
            continue;
          break;
        }
      }
      v12 = 0;
LABEL_31:

    }
    v13 = v7;

    v7 = &unk_1E3B303E0;
LABEL_33:

    v7 = v13;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
