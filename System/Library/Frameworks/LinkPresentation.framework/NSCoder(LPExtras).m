@implementation NSCoder(LPExtras)

- (id)_lp_strictlyDecodeNSDataForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeNSStringForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeNSAttributedStringForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeLPARAssetForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(CFSTR("LPARAssetAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeArrayOfLPARAssetsForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(CFSTR("LPARAssetAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeLPImageForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(CFSTR("LPImageAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeArrayOfLPImagesForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(CFSTR("LPImageAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeLPVideoForKey:()LPExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, NSClassFromString(CFSTR("LPVideoAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lp_strictlyDecodeObjectOfClass:()LPExtras forKey:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", a3, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (id)_lp_strictlyDecodeObjectOfClasses:()LPExtras forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v9;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)_lp_strictlyDecodeTopLevelObjectOfClass:()LPExtras forKey:error:
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", a3, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeTopLevelObjectOfClasses:forKey:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (id)_lp_strictlyDecodeTopLevelObjectOfClasses:()LPExtras forKey:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "setByAddingObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeTopLevelObjectOfClasses:forKey:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v11;
          goto LABEL_11;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)_lp_strictlyDecodeArrayOfObjectsOfClass:()LPExtras forKey:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", a3, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          continue;
        break;
      }
    }

    v16 = v12;
  }
  else
  {
LABEL_13:
    v16 = 0;
  }

  return v16;
}

- (id)_lp_strictlyDecodeArrayOfObjectsOfClasses:()LPExtras forKey:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v11, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v12, "count"))
  {
LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v29;
    while (1)
    {
      v15 = 0;
LABEL_6:
      if (*(_QWORD *)v29 != v14)
        objc_enumerationMutation(obj);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (!v17)
        break;
      v18 = *(_QWORD *)v25;
LABEL_10:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v16);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v17)
            goto LABEL_10;
          goto LABEL_20;
        }
      }

      if (++v15 != v13)
        goto LABEL_6;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (!v13)
        goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_19:

  v20 = obj;
LABEL_22:

  return v20;
}

- (id)_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:()LPExtras andObjectsOfClass:forKey:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", a3, a4, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__NSCoder_LPExtras___lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass_andObjectsOfClass_forKey___block_invoke;
    v16[3] = &unk_1E44A9EB0;
    v16[5] = a3;
    v16[6] = a4;
    v16[4] = &v17;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);
    if (*((_BYTE *)v18 + 24))
      v14 = 0;
    else
      v14 = v13;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_lp_encodeObjectIfNotNil:()LPExtras forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

- (void)_lp_encodeStringIfNotNil:()LPExtras forKey:
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v8, "classForCoder"), "isEqual:", objc_opt_class()) & 1) == 0)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v8);

      v8 = (id)v7;
    }
    objc_msgSend(a1, "encodeObject:forKey:", v8, v6);
  }
  else
  {
    v8 = 0;
  }

}

- (void)_lp_encodeArrayIfNotEmpty:()LPExtras forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "count"))
    objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

- (void)_lp_encodeURLIfNotNilOrLocalFile:()LPExtras forKey:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && (!objc_msgSend(v8, "isFileURL") || objc_msgSend(a1, "_lp_coderType") == 1))
  {
    urlByRemovingTrackingInformation(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

  }
}

- (void)_lp_encodeColorIfNotNil:()LPExtras forKey:
{
  id v6;
  id v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v18 = 0.0;
    v19 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    if ((objc_msgSend(v6, "getRed:green:blue:alpha:", &v19, &v18, &v17, &v16) & 1) != 0)
    {
      objc_msgSend(a1, "encodeBool:forKey:", 1, v7);
      v8 = v19;
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".red"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeDouble:forKey:", v9, v8);

      v10 = v18;
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".green"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeDouble:forKey:", v11, v10);

      v12 = v17;
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".blue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeDouble:forKey:", v13, v12);

      v14 = v16;
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".alpha"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeDouble:forKey:", v15, v14);

    }
  }

}

- (id)_lp_strictlyDecodeColorForKey:()LPExtras
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  if ((objc_msgSend(a1, "decodeBoolForKey:", v4) & 1) != 0)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".red"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeDoubleForKey:", v5);
    v7 = v6;

    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".green"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeDoubleForKey:", v8);
    v10 = v9;

    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".blue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeDoubleForKey:", v11);
    v13 = v12;

    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".alpha"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeDoubleForKey:", v14);
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v7, v10, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (uint64_t)_lp_coderType
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_getAssociatedObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)_lp_setCoderType:()LPExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_coderType, v2, (void *)1);

}

- (uint64_t)_lp_coderOptions
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_getAssociatedObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)_lp_setCoderOptions:()LPExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel__lp_coderOptions, v2, (void *)1);

}

@end
