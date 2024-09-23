@implementation NSCoder(_BlastDoorLPExtras)

- (id)_bd_lp_strictlyDecodeNSDataForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeNSStringForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeNSAttributedStringForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeLPARAssetForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(CFSTR("_BlastDoorLPARAssetAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeArrayOfLPARAssetsForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(CFSTR("_BlastDoorLPARAssetAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeLPImageForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(CFSTR("_BlastDoorLPImageAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeArrayOfLPImagesForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(CFSTR("_BlastDoorLPImageAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeLPVideoForKey:()_BlastDoorLPExtras
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, NSClassFromString(CFSTR("_BlastDoorLPVideoAttachmentSubstitute")), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_bd_lp_strictlyDecodeObjectOfClass:()_BlastDoorLPExtras forKey:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObjects:", a3, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;

  return v10;
}

- (char)_bd_lp_strictlyDecodeObjectOfClasses:()_BlastDoorLPExtras forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  uint64_t v12;
  char *i;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
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
  v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v9;
          goto LABEL_11;
        }
      }
      v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)_bd_lp_strictlyDecodeTopLevelObjectOfClass:()_BlastDoorLPExtras forKey:error:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a4;
  objc_msgSend(v8, "setWithObjects:", a3, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeTopLevelObjectOfClasses:forKey:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;

  return v12;
}

- (char)_bd_lp_strictlyDecodeTopLevelObjectOfClasses:()_BlastDoorLPExtras forKey:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char *v13;
  uint64_t v14;
  char *i;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
  v13 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v11;
          goto LABEL_11;
        }
      }
      v13 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)_bd_lp_strictlyDecodeArrayOfObjectsOfClass:()_BlastDoorLPExtras forKey:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", a3, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v12 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v11, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_13;
            }
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
          if (v15)
            continue;
          break;
        }
      }

      v12 = v13;
    }
    else
    {
LABEL_13:
      v12 = 0;
    }
  }

  return v12;
}

- (id)_bd_lp_strictlyDecodeArrayOfObjectsOfClasses:()_BlastDoorLPExtras forKey:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  id obj;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v14 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v13, "count"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v13;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        v25 = v7;
        while (1)
        {
          v18 = 0;
LABEL_6:
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(obj);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v19 = v6;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
          if (!v20)
            break;
          v21 = v20;
          v22 = *(_QWORD *)v29;
LABEL_10:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v19);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
              if (v21)
                goto LABEL_10;
              goto LABEL_20;
            }
          }

          if (++v18 != v16)
            goto LABEL_6;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
          v7 = v25;
          if (!v16)
            goto LABEL_19;
        }
LABEL_20:

        v14 = 0;
        v7 = v25;
      }
      else
      {
LABEL_19:

        v14 = obj;
      }
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:()_BlastDoorLPExtras andObjectsOfClass:forKey:
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
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
    v16[2] = __112__NSCoder__BlastDoorLPExtras___bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass_andObjectsOfClass_forKey___block_invoke;
    v16[3] = &unk_1E5CCC350;
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

- (void)_bd_lp_encodeObjectIfNotNil:()_BlastDoorLPExtras forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSCoder(_BlastDoorLPExtras) _bd_lp_encodeObjectIfNotNil:forKey:].cold.1();
    objc_msgSend(a1, "encodeObject:forKey:", v7, v6);
  }

}

- (void)_bd_lp_encodeArrayIfNotEmpty:()_BlastDoorLPExtras forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "count"))
    objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

- (void)_bd_lp_encodeURLIfNotNilOrLocalFile:()_BlastDoorLPExtras forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 && (objc_msgSend(v7, "isFileURL") & 1) == 0)
    objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

- (void)_bd_lp_encodeColorIfNotNil:()_BlastDoorLPExtras forKey:
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(a1, "encodeBool:forKey:", 1, v6);
    objc_msgSend(v7, "r");
    v9 = v8;
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".red"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeDouble:forKey:", v10, v9);

    objc_msgSend(v7, "g");
    v12 = v11;
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".green"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeDouble:forKey:", v13, v12);

    objc_msgSend(v7, "b");
    v15 = v14;
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".blue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeDouble:forKey:", v16, v15);

    objc_msgSend(v7, "a");
    v18 = v17;

    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".alpha"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "encodeDouble:forKey:", v19, v18);
  }
}

- (_BlastDoorLPPlatformColor)_bd_lp_strictlyDecodeColorForKey:()_BlastDoorLPExtras
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
  _BlastDoorLPPlatformColor *v17;

  v4 = a3;
  if (objc_msgSend(a1, "decodeBoolForKey:", v4))
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

    v17 = objc_alloc_init(_BlastDoorLPPlatformColor);
    -[_BlastDoorLPPlatformColor setR:](v17, "setR:", v7);
    -[_BlastDoorLPPlatformColor setG:](v17, "setG:", v10);
    -[_BlastDoorLPPlatformColor setB:](v17, "setB:", v13);
    -[_BlastDoorLPPlatformColor setA:](v17, "setA:", v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_bd_lp_encodeObjectIfNotNil:()_BlastDoorLPExtras forKey:.cold.1()
{
  __assert_rtn("-[NSCoder(_BlastDoorLPExtras) _bd_lp_encodeObjectIfNotNil:forKey:]", "LPNSCoderExtras.m", 209, "![obj isKindOfClass:[NSURL class]]");
}

@end
