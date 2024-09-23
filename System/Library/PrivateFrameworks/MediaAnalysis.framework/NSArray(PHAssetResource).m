@implementation NSArray(PHAssetResource)

- (id)vcp_resourceWithType:()PHAssetResource
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v11) == a3)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)vcp_isOriginalLocal
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "vcp_originalResource");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "vcp_isLocallyAvailable");

  return v2;
}

- (uint64_t)vcp_hasLocalPhoto:()PHAssetResource
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "vcp_isDecodable", (_QWORD)v11)
          && objc_msgSend(v8, "vcp_isPhotoResourceUsable:", a3)
          && (objc_msgSend(v8, "vcp_isLocallyAvailable") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (uint64_t)vcp_hasLocalMovie:()PHAssetResource
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "vcp_isMovie", (_QWORD)v11)
          && objc_msgSend(v8, "vcp_isVideoResourceUsable:", a3)
          && (objc_msgSend(v8, "vcp_isLocallyAvailable") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (uint64_t)vcp_hasLocalAdjustments
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (_QWORD)v7) == 7)
        {
          v2 = objc_msgSend(v5, "vcp_isLocallyAvailable");
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)vcp_hasLocalSlowmo:()PHAssetResource
{
  uint64_t result;

  if ((a3 & 1) == 0 && (objc_msgSend(a1, "vcp_isOriginalLocal") & 1) != 0)
    return 1;
  result = objc_msgSend(a1, "vcp_hasLocalMovie:", a3);
  if ((_DWORD)result)
    return objc_msgSend(a1, "vcp_hasLocalAdjustments");
  return result;
}

- (uint64_t)vcp_thumbnailResource
{
  return objc_msgSend(a1, "vcp_resourceWithType:", 102);
}

- (id)vcp_smallResourceMeetingCriteria:()PHAssetResource
{
  unsigned int (**v4)(id, void *);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = a1;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v4[2](v4, v10))
        {
          if (!v6
            || (objc_msgSend(v10, "vcp_size", (_QWORD)v19),
                v12 = v11,
                v14 = v13,
                objc_msgSend(v6, "vcp_size"),
                v12 * v14 < v15 * v16))
          {
            v17 = v10;

            v6 = v17;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v6;
}

- (uint64_t)vcp_smallMovieDerivativeResource
{
  return objc_msgSend(a1, "vcp_smallResourceMeetingCriteria:", &__block_literal_global_153);
}

- (id)vcp_originalResource
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (_QWORD)v8) == 2 || objc_msgSend(v5, "type") == 1)
        {
          v6 = v5;
          goto LABEL_13;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v6 = 0;
      if (v2)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)vcp_originalVideoResource
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v5, "type", (_QWORD)v8) == 2 || objc_msgSend(v5, "type") == 9)
        {
          v6 = v5;
          goto LABEL_13;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v6 = 0;
      if (v2)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)vcp_adjustmentsResource
{
  id v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = a1;
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "type", (_QWORD)v7) == 7)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)mad_computeSyncResource
{
  id v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = a1;
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "type", (_QWORD)v7) == 112)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)vcp_localPhotoResourcesSorted:()PHAssetResource
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isPhoto", (_QWORD)v12)
          && objc_msgSend(v10, "vcp_isPhotoResourceUsable:", a3)
          && objc_msgSend(v10, "vcp_isLocallyAvailable"))
        {
          objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_photoResourcesSorted:()PHAssetResource
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isPhoto", (_QWORD)v12)
          && objc_msgSend(v10, "vcp_isPhotoResourceUsable:", a3))
        {
          objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_localMovieResourcesSorted:()PHAssetResource
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isMovie", (_QWORD)v12)
          && objc_msgSend(v10, "vcp_isVideoResourceUsable:", a3)
          && objc_msgSend(v10, "vcp_isLocallyAvailable"))
        {
          objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_movieResourcesSorted:()PHAssetResource
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "vcp_isMovie", (_QWORD)v12)
          && objc_msgSend(v10, "vcp_isVideoResourceUsable:", a3))
        {
          objc_msgSend(v5, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "vcp_sortBySize");
  return v5;
}

- (id)vcp_avAsset:()PHAssetResource
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "vcp_localMovieResourcesSorted:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(v1, "reverseObjectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v4)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "vcp_avAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (float)vcp_getFpsRate
{
  float v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;

  v2 = 1.0;
  if (objc_msgSend(a1, "vcp_hasLocalAdjustments"))
  {
    objc_msgSend(a1, "vcp_adjustmentsResource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "privateFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75310]), "initWithURL:", v4);
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "hasSlowMotionAdjustments") & 1) != 0)
    {
      objc_msgSend(v6, "slowMotionRate");
      v2 = v7;
    }

  }
  return v2;
}

- (id)vcp_highResImageResourcesForAsset:()PHAssetResource
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasAdjustments") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "vcp_isSyndicationLibrary") ^ 1;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = a1;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "vcp_isPhoto", (_QWORD)v16) & 1) != 0
          && objc_msgSend(v12, "type") != 13
          && objc_msgSend(v12, "type") != 8)
        {
          if (objc_msgSend(v12, "type") == 1)
            v13 = v5;
          else
            v13 = 1;
          if (v13 == 1 && (objc_msgSend(v12, "analysisType") == 2 || objc_msgSend(v12, "analysisType") == 1))
            objc_msgSend(v7, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CD1440], "vcp_ascendingSizeComparator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingComparator:", v14);

  return v7;
}

@end
