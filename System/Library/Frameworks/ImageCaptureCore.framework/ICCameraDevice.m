@implementation ICCameraDevice

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("mediaFiles")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___ICCameraDevice;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)uuidStringFromFileProviderIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __CFString *v8;
  UInt8 byte15;
  UInt8 v10;
  UInt8 v11;
  UInt8 v12;
  UInt8 v13;
  UInt8 v14;
  UInt8 v15;
  UInt8 v16;
  UInt8 byte7;
  UInt8 v18;
  UInt8 v19;
  UInt8 v20;
  UInt8 v21;
  UInt8 v22;
  UInt8 v23;
  UInt8 v24;
  int v25;
  const __CFAllocator *v26;
  const __CFUUID *v27;
  const __CFUUID *v28;
  unint64_t v30;
  UInt8 byte6[8];
  uint64_t v32;
  _QWORD __src[3];

  __src[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  __src[0] = 0;
  __src[1] = 0;
  v30 = 0;
  if (!v3)
    goto LABEL_10;
  v5 = objc_msgSend(v3, "smallestEncoding");
  objc_msgSend(v4, "length");
  v6 = objc_msgSend(v4, "length") - 16;
  objc_msgSend(v4, "length");
  v7 = objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 16, &v30, v5, 1, v6, 16, 0);
  v8 = 0;
  if (v7)
  {
    byte15 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    byte7 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    *(_QWORD *)byte6 = 0;
    v32 = 0;
    if (v30 >= 0x10)
      v25 = 0;
    else
      v25 = 16 - v30;
    if (v25 <= 15)
    {
      memcpy(&byte6[v25], __src, (15 - v25) + 1);
      v24 = byte6[0];
      v23 = byte6[1];
      v22 = byte6[2];
      v21 = byte6[3];
      v20 = byte6[4];
      v19 = byte6[5];
      v18 = byte6[6];
      byte7 = byte6[7];
      v16 = v32;
      v15 = BYTE1(v32);
      v14 = BYTE2(v32);
      v13 = BYTE3(v32);
      v12 = BYTE4(v32);
      v11 = BYTE5(v32);
      v10 = BYTE6(v32);
      byte15 = HIBYTE(v32);
    }
    v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v27 = CFUUIDCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v24, v23, v22, v21, v20, v19, v18, byte7, v16, v15, v14, v13, v12, v11, v10, byte15);
    if (v27)
    {
      v28 = v27;
      v8 = (__CFString *)CFUUIDCreateString(v26, v27);
      CFRelease(v28);
      goto LABEL_11;
    }
LABEL_10:
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)relateLegacyMedia:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__ICCameraDevice_relateLegacyMedia___block_invoke;
  v10[3] = &unk_1E70C7CE8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("universalFilesCount"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("newMedia"));
  return v5;
}

void __36__ICCameraDevice_relateLegacyMedia___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "count");
  uFiles = 0u;
  *(_OWORD *)&qword_1EF235668 = 0u;
  xmmword_1EF235678 = 0u;
  unk_1EF235688 = 0u;
  xmmword_1EF235698 = 0u;
  if (v4 < 2)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
    goto LABEL_38;
  }
  v5 = 0;
  v6 = v4 - 1;
  do
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isJPEG") & 1) != 0 || objc_msgSend(v7, "isHEIC"))
    {
      if ((_QWORD)uFiles)
        goto LABEL_8;
      *(_QWORD *)&uFiles = v7;
    }
    else
    {
      if (objc_msgSend(v7, "isNonRawImage"))
        goto LABEL_8;
      if (objc_msgSend(v7, "isRaw"))
      {
        *((_QWORD *)&uFiles + 1) = v7;
        goto LABEL_9;
      }
      if (objc_msgSend(v7, "isMovie"))
      {
        if (!qword_1EF235668)
        {
          qword_1EF235668 = (uint64_t)v7;
          goto LABEL_9;
        }
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
        goto LABEL_9;
      }
      if (objc_msgSend(v7, "isAudio"))
      {
        qword_1EF235670 = (uint64_t)v7;
      }
      else
      {
        v9 = (char *)&uFiles + 8 * v5++;
        *((_QWORD *)v9 + 4) = v7;
      }
    }
LABEL_9:

    v8 = v6-- != 0;
  }
  while (v8 && v5 < 10);
  v11 = (id)uFiles;
  v12 = *((id *)&uFiles + 1);
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      objc_msgSend(v11, "setPairedRawImage:", v12);
      v14 = 2;
      v15 = v13;
    }
    else
    {
      v15 = 0;
      v14 = 2;
    }
    do
    {
LABEL_32:
      if (*((_QWORD *)&uFiles + v14))
        objc_msgSend(v11, "addSidecarFile:");
      v8 = v14++ >= 7;
    }
    while (!v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

    }
  }
  else
  {
    if (v12)
    {
      v15 = 0;
      v14 = 2;
      v11 = v12;
      goto LABEL_32;
    }
    v16 = (id)qword_1EF235668;
    if (v16)
    {
      v11 = v16;
      v15 = 0;
      v14 = 3;
      goto LABEL_32;
    }
    v17 = (id)qword_1EF235670;
    v15 = 0;
    if (v17)
    {
      v11 = v17;
      v14 = 4;
      goto LABEL_32;
    }
    v11 = 0;
  }
LABEL_38:

}

- (id)relateGroupedMedia:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  ICCameraDevice *v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __37__ICCameraDevice_relateGroupedMedia___block_invoke;
  v14 = &unk_1E70C7D10;
  v15 = self;
  v16 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count", v11, v12, v13, v14, v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("universalFilesCount"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("newMedia"));
  return v6;
}

void __37__ICCameraDevice_relateGroupedMedia___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  int v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v10 = 0;
  uFiles = 0u;
  *(_OWORD *)&qword_1EF235668 = 0u;
  xmmword_1EF235678 = 0u;
  unk_1EF235688 = 0u;
  xmmword_1EF235698 = 0u;
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "universalFamily"))
        objc_msgSend(*(id *)(a1 + 32), "grindMedia:index:file:", &uFiles, &v10, v7);

      --v6;
    }
    while (v6 != -1);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "blendMedia:ofLength:withMedia:ofLength:", &uFiles, v8, &uFiles, v8);
  if (v10 >= 1)
  {
    for (i = 0; i < v10; ++i)
    {
      if ((objc_msgSend(*((id *)&uFiles + i), "isSidecar") & 1) == 0
        && (objc_msgSend(*((id *)&uFiles + i), "isDataUniversal") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *((_QWORD *)&uFiles + i));
      }
    }
  }

}

- (id)ownerMedia:(id)a3 withMedia:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isImage") && objc_msgSend(v6, "isMovie"))
  {
    v7 = v5;
    objc_msgSend(v7, "addSidecarFile:", v6);
    v8 = v6;
  }
  else
  {
    if (!objc_msgSend(v5, "isMovie") || !objc_msgSend(v6, "isImage"))
    {
      v7 = 0;
      goto LABEL_9;
    }
    v7 = v6;
    objc_msgSend(v7, "addSidecarFile:", v5);
    v8 = v5;
  }
  objc_msgSend(v8, "flagAsSidecar");
LABEL_9:

  return v7;
}

- (int64_t)stitchMedia:(id)a3 withMedia:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "objectID");
  if (v8 != objc_msgSend(v7, "objectID"))
  {
    if (objc_msgSend(v6, "isImage") && objc_msgSend(v7, "isMovie")
      || ((objc_msgSend(v6, "isMovie") & 1) != 0 || objc_msgSend(v6, "isImage"))
      && objc_msgSend(v7, "isDataUniversal"))
    {
      objc_msgSend(v6, "addSidecarFile:", v7);
      objc_msgSend(v7, "flagAsSidecar");
    }
    else if ((objc_msgSend(v7, "isImage") && (objc_msgSend(v6, "isImage") & 1) != 0
            || objc_msgSend(v7, "isMovie") && objc_msgSend(v6, "isMovie"))
           && (objc_msgSend(v7, "isOriginal") && (objc_msgSend(v6, "isConverted") & 1) != 0
            || objc_msgSend(v6, "isOriginal") && objc_msgSend(v7, "isConverted")))
    {
      objc_msgSend(v7, "setTwinID:", objc_msgSend(v6, "objectID"));
      objc_msgSend(v6, "setTwinID:", objc_msgSend(v7, "objectID"));
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v20 = v6;
      objc_msgSend(v6, "sidecarFiles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12);
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v7, "sidecarFiles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v23;
              do
              {
                v18 = 0;
                do
                {
                  if (*(_QWORD *)v23 != v17)
                    objc_enumerationMutation(v14);
                  -[ICCameraDevice stitchMedia:withMedia:](self, "stitchMedia:withMedia:", v13, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18++));
                }
                while (v16 != v18);
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v16);
            }

            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v10);
      }

      v6 = v20;
    }
  }

  return 0;
}

- (void)blendMedia:(id)a3[10] ofLength:(int)a4 withMedia:(id)a5[10] ofLength:(int)a6
{
  uint64_t v8;
  uint64_t v9;
  id *v10;
  id v11;
  void *v12;
  size_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  id v18;
  int v19;
  uint64_t v20;

  if (a4 >= 1)
  {
    v8 = 0;
    v20 = a4;
    do
    {
      v9 = a6;
      v10 = a5;
      if (a6 >= 1)
      {
        do
        {
          v11 = a3[v8];
          objc_msgSend(v11, "mediaBase");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          objc_msgSend(*v10, "mediaBase");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15 == v13)
          {
            objc_msgSend(v11, "mediaBase");
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v17 = (const char *)objc_msgSend(v16, "UTF8String");
            objc_msgSend(*v10, "mediaBase");
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v19 = strncmp(v17, (const char *)objc_msgSend(v18, "UTF8String"), v13);

            if (!v19)
              -[ICCameraDevice stitchMedia:withMedia:](self, "stitchMedia:withMedia:", v11, *v10);
          }

          ++v10;
          --v9;
        }
        while (v9);
      }
      ++v8;
    }
    while (v8 != v20);
  }
}

- (void)grindMedia:(id)a3[10] index:(int *)a4 file:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  id v17;
  int v18;
  void *v19;
  id v20;

  v8 = a5;
  v9 = *a4;
  if ((int)v9 < 1)
  {
LABEL_7:
    a3[v9] = v8;
    ++*a4;
  }
  else
  {
    v10 = 0;
    v20 = v8;
    while (1)
    {
      objc_msgSend(v8, "mediaBase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      objc_msgSend(a3[v10], "mediaBase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14 == v12)
      {
        objc_msgSend(a3[v10], "mediaBase");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = (const char *)objc_msgSend(v15, "UTF8String");
        objc_msgSend(v20, "mediaBase");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v18 = strncmp(v16, (const char *)objc_msgSend(v17, "UTF8String"), v12);

        if (!v18)
        {
          -[ICCameraDevice ownerMedia:withMedia:](self, "ownerMedia:withMedia:", a3[v10], v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            break;
        }
      }
      ++v10;
      v9 = *a4;
      v8 = v20;
      if (v10 >= v9)
        goto LABEL_7;
    }
    a3[v10] = v19;

    v8 = v20;
  }

}

- (id)relateMedia:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  __CFString *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICCameraDevice legacyDevice](self, "legacyDevice"))
    v5 = CFSTR("mediaBase");
  else
    v5 = CFSTR("relatedUUID");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", v5, 1);
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)*MEMORY[0x1E0CEC4F0];
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UTI");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (!v14)
        break;
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
    }
    while (objc_msgSend(v9, "count"));
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = (void *)objc_msgSend(v9, "copyGroupIntoDictionary:", &__block_literal_global_7);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __30__ICCameraDevice_relateMedia___block_invoke_2;
  v22[3] = &unk_1E70C7D10;
  v23 = (__CFString *)v5;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v22);
  if (-[ICCameraDevice legacyDevice](self, "legacyDevice"))
    -[ICCameraDevice relateLegacyMedia:](self, "relateLegacyMedia:", v17);
  else
    -[ICCameraDevice relateGroupedMedia:](self, "relateGroupedMedia:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraDevice addCapability:](self, "addCapability:", CFSTR("ICCameraDeviceSupportsHEIF"));
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("newMedia"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __30__ICCameraDevice_relateMedia___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForKey:", CFSTR("parentID"));
}

void __30__ICCameraDevice_relateMedia___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__ICCameraDevice_relateMedia___block_invoke_3;
  v12[3] = &unk_1E70C7D58;
  v13 = *(id *)(a1 + 32);
  v7 = objc_msgSend(a3, "copyGroupIntoDictionary:", v12);
  if (v7)
  {
    v8 = (void *)v7;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __30__ICCameraDevice_relateMedia___block_invoke_4;
    v9[3] = &unk_1E70C7D80;
    v10 = *(id *)(a1 + 40);
    v11 = v5;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

uint64_t __30__ICCameraDevice_relateMedia___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
}

void __30__ICCameraDevice_relateMedia___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%d%@"), objc_msgSend(v6, "intValue"), v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v9);
}

- (void)setIsAccessRestrictedAppleDevice:(BOOL)a3
{
  ICCameraDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_accessRestrictedAppleDevice = a3;
  objc_sync_exit(obj);

}

- (BOOL)isAccessRestrictedAppleDevice
{
  ICCameraDevice *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[ICDevice isAppleDevice](v2, "isAppleDevice"))
    v3 = !-[ICDevice hasOpenSession](v2, "hasOpenSession") || v2->_accessRestrictedAppleDevice;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateAccessRestriction
{
  char v3;
  char v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD block[5];
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[ICDevice isAppleDevice](self, "isAppleDevice")
    && (self->_devAccessRestriction != 8
     || -[ICCameraDevice notifyDelegateRestrictionChanged](self, "notifyDelegateRestrictionChanged")))
  {
    v3 = -[ICCameraDevice devAccessRestriction](self, "devAccessRestriction");
    v4 = -[ICCameraDevice devAccessRestriction](self, "devAccessRestriction");
    v5 = -[ICCameraDevice devAccessRestriction](self, "devAccessRestriction");
    v6 = -[ICCameraDevice devAccessRestriction](self, "devAccessRestriction");
    -[ICDevice delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((v3 & 8) != 0 || (v4 & 6) == 6 || (v5 & 3) == 3 || (v6 & 5) == 5)
      {
        -[ICCameraDevice setDevAccessRestriction:](self, "setDevAccessRestriction:", 8);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __41__ICCameraDevice_updateAccessRestriction__block_invoke;
        v26[3] = &unk_1E70C7198;
        v26[4] = self;
        ICPerformBlockOnMainThread(v26);
      }
      else
      {
        -[ICDevice delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        __ICOSLogCreate();
        -[ICDevice name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "length") >= 0x15)
        {
          objc_msgSend(v11, "substringWithRange:", 0, 18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⛔️ Notifying Access Restricted: %@"), v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_retainAutorelease(v11);
          v17 = v15;
          *(_DWORD *)buf = 136446466;
          v28 = objc_msgSend(v16, "UTF8String");
          v29 = 2114;
          v30 = v14;
          _os_log_impl(&dword_1B98FC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        -[ICCameraDevice setDevAccessRestriction:](self, "setDevAccessRestriction:", 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__ICCameraDevice_updateAccessRestriction__block_invoke_103;
        block[3] = &unk_1E70C7198;
        block[4] = self;
        ICPerformBlockOnMainThread(block);

      }
    }
    else
    {
      -[ICCameraDevice setNotifyDelegateRestrictionChanged:](self, "setNotifyDelegateRestrictionChanged:", 1);
      __ICOSLogCreate();
      -[ICDevice name](self, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v18, "length") >= 0x15)
      {
        objc_msgSend(v18, "substringWithRange:", 0, 18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingString:", CFSTR(".."));
        v20 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🟡 Queueing Access Restriction Changed: (delegate is nil)"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_retainAutorelease(v18);
        v24 = v22;
        *(_DWORD *)buf = 136446466;
        v28 = objc_msgSend(v23, "UTF8String");
        v29 = 2114;
        v30 = v21;
        _os_log_impl(&dword_1B98FC000, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
}

void __41__ICCameraDevice_updateAccessRestriction__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  __ICOSLogCreate();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x15)
  {
    objc_msgSend(v5, "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("✅ Notifying Access Unrestricted: %@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v5);
    v11 = v9;
    *(_DWORD *)buf = 136446466;
    v14 = objc_msgSend(v10, "UTF8String");
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isAccessRestrictedAppleDevice"));
  objc_msgSend(*(id *)(a1 + 32), "setIsAccessRestrictedAppleDevice:", 0);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isAccessRestrictedAppleDevice"));
  objc_msgSend(*(id *)(a1 + 32), "updateLockedErrorStatus");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "performSelector:withObject:", sel_cameraDeviceDidRemoveAccessRestriction_, *(_QWORD *)(a1 + 32));

}

void __41__ICCameraDevice_updateAccessRestriction__block_invoke_103(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isAccessRestrictedAppleDevice"));
  objc_msgSend(*(id *)(a1 + 32), "setIsAccessRestrictedAppleDevice:", 1);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isAccessRestrictedAppleDevice"));
  objc_msgSend(*(id *)(a1 + 32), "updateLockedErrorStatus");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "performSelector:withObject:", sel_cameraDeviceDidEnableAccessRestriction_, *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (void)setAccessRestriction:(unint64_t)a3
{
  unint64_t devAccessRestriction;

  if (-[ICDevice isAppleDevice](self, "isAppleDevice")
    && (a3 & ~-[ICCameraDevice devAccessRestriction](self, "devAccessRestriction")) != 0)
  {
    devAccessRestriction = self->_devAccessRestriction;
    if (devAccessRestriction != 8)
    {
      self->_devAccessRestriction = devAccessRestriction | a3;
      -[ICCameraDevice updateAccessRestriction](self, "updateAccessRestriction");
    }
  }
}

- (id)remoteCamera
{
  NSXPCConnection *devConnection;
  _QWORD v4[5];

  devConnection = self->_devConnection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__ICCameraDevice_remoteCamera__block_invoke;
  v4[3] = &unk_1E70C7150;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](devConnection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __30__ICCameraDevice_remoteCamera__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a2)
  {
    v3 = a2;
    __ICOSLogCreate();
    v4 = CFSTR("remoteCamera");
    if ((unint64_t)objc_msgSend(CFSTR("remoteCamera"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("remoteCamera"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - %@"), v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __30__ICCameraDevice_remoteCamera__block_invoke_cold_1(v4, v9);

  }
}

- (id)remoteCameraWithFailureBlock:(id)a3
{
  id v4;
  NSXPCConnection *devConnection;
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  devConnection = self->_devConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ICCameraDevice_remoteCameraWithFailureBlock___block_invoke;
  v10[3] = &unk_1E70C7DA8;
  v10[4] = self;
  v6 = (void (**)(_QWORD))v4;
  v11 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](devConnection, "remoteObjectProxyWithErrorHandler:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && !v7)
    v6[2](v6);

  return v8;
}

void __47__ICCameraDevice_remoteCameraWithFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    __ICOSLogCreate();
    v4 = CFSTR("remoteCamera");
    if ((unint64_t)objc_msgSend(CFSTR("remoteCamera"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("remoteCamera"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - %@"), v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __30__ICCameraDevice_remoteCamera__block_invoke_cold_1(v4, v9);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (void)executeConnectionFailureBlock
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id devConnectionFailureBlock;

  -[ICCameraDevice devConnectionFailureBlock](self, "devConnectionFailureBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __ICOSLogCreate();
    v4 = CFSTR("failureBlock");
    if ((unint64_t)objc_msgSend(CFSTR("failureBlock"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("failureBlock"), "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[ICDevice name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - Failure block was called due to a connection failure."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __30__ICCameraDevice_remoteCamera__block_invoke_cold_1(v4, v9);

    (*((void (**)(void))self->_devConnectionFailureBlock + 2))();
    devConnectionFailureBlock = self->_devConnectionFailureBlock;
    self->_devConnectionFailureBlock = 0;

  }
}

- (ICMediaPresentation)mediaPresentation
{
  return self->_devMediaPresentation;
}

- (void)setMediaPresentation:(ICMediaPresentation)mediaPresentation
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;

  -[ICDevice capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", CFSTR("ICCameraDeviceSupportsHEIF")))
    v6 = -[ICDevice hasOpenSession](self, "hasOpenSession");
  else
    v6 = 0;

  if (mediaPresentation - 1 > 1)
  {
    __ICOSLogCreate();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Camera device does not support changing the media presentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      -[ICCameraDevice setMediaPresentation:].cold.1((uint64_t)v7, v8);

  }
  else if (self->_devMediaPresentation != mediaPresentation)
  {
    -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaPresentation"));
    self->_devMediaPresentation = mediaPresentation;
    -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaPresentation"));
    if (v6)
      -[ICCameraDevice updateMediaPresentation](self, "updateMediaPresentation");
  }
}

- (BOOL)updateMediaPresentation
{
  return 1;
}

- (void)resetAccessRestriction
{
  if (-[ICDevice isAppleDevice](self, "isAppleDevice"))
  {
    -[ICCameraDevice setDevAccessRestriction:](self, "setDevAccessRestriction:", 0);
    if (-[ICDevice hasOpenSession](self, "hasOpenSession"))
      -[ICCameraDevice updateAccessRestriction](self, "updateAccessRestriction");
  }
}

- (BOOL)isEnumeratingContent
{
  -[ICCameraDevice updateEnumeratingErrorStatus](self, "updateEnumeratingErrorStatus");
  return self->_isEnumeratingContent;
}

- (NSString)buildVersion
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceClass
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DeviceClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceColor
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DeviceColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceEnclosureColor
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DeviceEnclosureColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)devicePairedState
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DevicePairedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)ICCameraDevice;
  -[ICDevice description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCameraDevice timeOffset](self, "timeOffset");
  objc_msgSend(v5, "appendFormat:", CFSTR("  timeOffset                    : %f\n"), v6);
  objc_msgSend(v5, "appendFormat:", CFSTR("  hasConfigurableWiFiInterface  : %s\n"), "N/A");
  v7 = -[ICCameraDevice isAccessRestrictedAppleDevice](self, "isAccessRestrictedAppleDevice");
  v8 = "NO";
  if (v7)
    v8 = "YES";
  objc_msgSend(v5, "appendFormat:", CFSTR("  isAccessRestrictedAppleDevice : %s\n"), v8);
  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  return v5;
}

- (OS_dispatch_queue)deviceNotificationQueue
{
  return self->_devNotificationQueue;
}

- (OS_dispatch_queue)deviceCommandQueue
{
  return self->_devCommandQueue;
}

- (OS_dispatch_queue)deviceWriteQueue
{
  return self->_devWriteQueue;
}

- (BOOL)iCloudPhotosEnabled
{
  return self->_iCloudPhotosEnabled;
}

- (void)setICloudPhotosEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("iCloudPhotosEnabled"));
  self->_iCloudPhotosEnabled = v3;
  if (v3)
    -[ICDevice removeCapability:](self, "removeCapability:", CFSTR("ICCameraDeviceCanDeleteOneFile"));
  -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("iCloudPhotosEnabled"));
  -[ICCameraDevice setLocked:](self, "setLocked:", v3);
}

- (unint64_t)iCloudPhotosOptimizeStorageState
{
  return self->_iCloudPhotosOptimizeStorageState;
}

- (void)setICloudPhotosOptimizeStorageState:(unint64_t)a3
{
  -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("iCloudPhotosOptimizeStorageState"));
  self->_iCloudPhotosOptimizeStorageState = a3;
  -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("iCloudPhotosOptimizeStorageState"));
}

- (void)addCapability:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[ICCameraDevice iCloudPhotosEnabled](self, "iCloudPhotosEnabled")
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("ICCameraDeviceCanDeleteOneFile")) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)ICCameraDevice;
    -[ICDevice addCapability:](&v5, sel_addCapability_, v4);
  }

}

- (unint64_t)countOfObjects
{
  void *v2;
  unint64_t v3;

  -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaItemCount");

  return v3;
}

- (NSUInteger)contentCatalogPercentCompleted
{
  return self->_devContentCatalogPercentCompleted;
}

- (void)updateMediaFilesCount:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ICANumberOfPreflightObjectsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    if (v6 != -[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __40__ICCameraDevice_updateMediaFilesCount___block_invoke;
      v7[3] = &unk_1E70C7DD0;
      v7[4] = self;
      v7[5] = v6;
      ICPerformBlockOnMainThread(v7);
    }
  }

}

uint64_t __40__ICCameraDevice_updateMediaFilesCount___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("preflightCountOfObjects"));
  objc_msgSend(*(id *)(a1 + 32), "setPreflightCountOfObjects:", *(_QWORD *)(a1 + 40));
  __ICOSLogCreate();
  v2 = CFSTR("                ◺◺◺◺");
  if ((unint64_t)objc_msgSend(CFSTR("                ◺◺◺◺"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("                ◺◺◺◺"), "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preflighted: %ld"), objc_msgSend(*(id *)(a1 + 32), "preflightCountOfObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v2);
    v7 = v5;
    *(_DWORD *)buf = 136446466;
    v10 = -[__CFString UTF8String](v6, "UTF8String");
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1B98FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("preflightCountOfObjects"));
  return objc_msgSend(*(id *)(a1 + 32), "updateContentCatalogPercentCompleted");
}

- (void)updateContentCatalogPercentCompleted
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double v6;

  if (-[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects") != -1
    && !-[ICCameraDevice containsRestrictedStorage](self, "containsRestrictedStorage"))
  {
    if (-[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects")
      || -[ICCameraDevice isAccessRestrictedAppleDevice](self, "isAccessRestrictedAppleDevice"))
    {
      if (-[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects") < 1
        || !-[ICCameraDevice countOfObjects](self, "countOfObjects"))
      {
        -[ICCameraDevice contentCatalogPercentCompleted](self, "contentCatalogPercentCompleted");
        return;
      }
      v3 = -[ICCameraDevice countOfObjects](self, "countOfObjects");
      v4 = -[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects");
      v5 = -[ICCameraDevice countOfObjects](self, "countOfObjects");
      if (v3 <= v4)
      {
        v6 = (double)v5 * 100.0 / (double)-[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects");
LABEL_13:
        if (v6 > (double)-[ICCameraDevice contentCatalogPercentCompleted](self, "contentCatalogPercentCompleted"))
          -[ICCameraDevice setContentCatalogPercentCompleted:](self, "setContentCatalogPercentCompleted:", (unint64_t)v6);
        return;
      }
      -[ICCameraDevice setPreflightCountOfObjects:](self, "setPreflightCountOfObjects:", v5);
    }
    v6 = 100.0;
    goto LABEL_13;
  }
}

- (void)setContentCatalogPercentCompleted:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((a3 != 100 || -[ICDevice ready](self, "ready"))
    && self->_devContentCatalogPercentCompleted != 100
    && !-[ICCameraDevice containsRestrictedStorage](self, "containsRestrictedStorage"))
  {
    -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contentCatalogPercentCompleted"));
    self->_devContentCatalogPercentCompleted = a3;
    -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contentCatalogPercentCompleted"));
    __ICOSLogCreate();
    -[ICDevice name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x15)
    {
      objc_msgSend(v5, "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(Enumerated:%lu/Preflighted:%ld)"), -[ICCameraDevice countOfObjects](self, "countOfObjects"), -[ICCameraDevice preflightCountOfObjects](self, "preflightCountOfObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v5);
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      v24 = objc_msgSend(v10, "UTF8String");
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    if (-[ICDevice ready](self, "ready")
      && -[ICCameraDevice contentCatalogPercentCompleted](self, "contentCatalogPercentCompleted") == 100)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__ICCameraDevice_setContentCatalogPercentCompleted___block_invoke;
      block[3] = &unk_1E70C7198;
      block[4] = self;
      ICPerformBlockOnMainThread(block);
    }
    else
    {
      __ICOSLogCreate();
      -[ICDevice name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "length") >= 0x15)
      {
        objc_msgSend(v12, "substringWithRange:", 0, 18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", CFSTR(".."));
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }
      v15 = (void *)MEMORY[0x1E0CB3940];
      if (-[ICDevice ready](self, "ready"))
        v16 = "YES";
      else
        v16 = "NO";
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Ready: %s, Percent:%lu%%"), v16, -[ICCameraDevice contentCatalogPercentCompleted](self, "contentCatalogPercentCompleted"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_retainAutorelease(v12);
        v20 = v18;
        v21 = objc_msgSend(v19, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v24 = v21;
        v25 = 2114;
        v26 = v17;
        _os_log_impl(&dword_1B98FC000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
}

void __52__ICCameraDevice_setContentCatalogPercentCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "performSelector:withObject:withObject:", sel_deviceDidBecomeReadyWithCompleteContentCatalog_, *(_QWORD *)(a1 + 32), 0);
  __ICOSLogCreate();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x15)
  {
    objc_msgSend(v3, "substringWithRange:", 0, 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "devMediaFiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("💯 Content Catalog Complete: %lu"), objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v3);
    v11 = v9;
    *(_DWORD *)buf = 136446466;
    v21 = objc_msgSend(v10, "UTF8String");
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "previouslyIndexed"))
  {
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "length") >= 0x15)
    {
      objc_msgSend(v12, "substringWithRange:", 0, 18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", CFSTR(".."));
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  Previously Indexed: %5lu"), objc_msgSend(*(id *)(a1 + 32), "previouslyIndexed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v12);
      v18 = v16;
      v19 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v21 = v19;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1B98FC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)a3;
  if (a3)
  {
    -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItemWithHandle:inTypes:", v3, &unk_1E70DC6B0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)a3;
  if (a3)
  {
    -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItemWithHandle:inTypes:", v3, &unk_1E70DC6C8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)requestOpenSession
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v3 = CFSTR("openSession");
  if ((unint64_t)objc_msgSend(CFSTR("openSession"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("openSession"), "substringWithRange:", 0, 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("requestOpenSession: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v3);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v13 = -[__CFString UTF8String](v9, "UTF8String");
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__ICCameraDevice_requestOpenSession__block_invoke;
  v11[3] = &unk_1E70C7150;
  v11[4] = self;
  -[ICCameraDevice requestOpenSessionWithOptions:completion:](self, "requestOpenSessionWithOptions:completion:", MEMORY[0x1E0C9AA70], v11);
}

void __36__ICCameraDevice_requestOpenSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICCameraDevice_requestOpenSession__block_invoke_2;
  block[3] = &unk_1E70C7630;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v4;
  ICPerformBlockOnMainThread(block);

}

uint64_t __36__ICCameraDevice_requestOpenSession__block_invoke_2(uint64_t *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend((id)a1[4], "performSelector:withObject:withObject:", sel_device_didOpenSessionWithError_, a1[5], a1[6]);
  }
  if (a1[6])
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)a1[4], "performSelector:withObject:withObject:", sel_device_didEncounterError_, a1[5], a1[6]);
  }
  return result;
}

- (void)requestOpenSessionWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICEnumerationChronologicalOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_enumerationOrder = (int)objc_msgSend(v8, "intValue");

  }
  if (-[ICDevice hasOpenSession](self, "hasOpenSession"))
  {
    v7[2](v7, 0);
  }
  else if (-[ICDevice hasOpenSession](self, "hasOpenSession") || -[ICCameraDevice beingEjected](self, "beingEjected"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9927, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v9);

  }
  else
  {
    -[ICDevice setSessionState:](self, "setSessionState:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke;
    v10[3] = &unk_1E70C7680;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[ICCameraDevice dispatchAsyncForOperationType:block:](self, "dispatchAsyncForOperationType:block:", 0, v10);

  }
}

void __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setDevContentCatalogPercentCompleted:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "addEntriesFromDictionary:");
  objc_msgSend(*(id *)(a1 + 32), "deviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke_2;
  v6[3] = &unk_1E70C7DF8;
  v6[4] = v5;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "openSession:withOptions:completion:", v5, v3, v6);

}

void __59__ICCameraDevice_requestOpenSessionWithOptions_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("errCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5 == -21347)
  {
    ICMakeLocalizedErrorWithCodeAndString(-21347, CFSTR("ICReturnConnectionSessionAlreadyOpen"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    if (v5 == -9943)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      ICLocalizedString(CFSTR("ICReturnDeviceUnlockRequest"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2D50]);
      if (objc_msgSend(*(id *)(a1 + 32), "devAccessRestriction") == 8)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9943, v6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v5, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSessionState:", -1);
    }
    v11 = (void *)v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
    v11 = 0;
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v14 = v11;
    (*(void (**)(void))(v12 + 16))();
    v11 = v14;
  }

}

- (void)requestEnumerateContentWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  ICCameraDevice *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICEnumerationChronologicalOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_enumerationOrder = (int)objc_msgSend(v8, "intValue");

  }
  if (-[ICDevice hasOpenSession](self, "hasOpenSession"))
  {
    if (-[ICCameraDevice beingEjected](self, "beingEjected"))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = -9922;
    }
    else
    {
      if (!self->_devContentCatalogPercentCompleted)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke;
        v12[3] = &unk_1E70C7680;
        v13 = v6;
        v14 = self;
        v15 = v7;
        -[ICCameraDevice dispatchAsyncForOperationType:block:](self, "dispatchAsyncForOperationType:block:", 0, v12);

        goto LABEL_10;
      }
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = -9954;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -9958;
  }
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v7 + 2))(v7, v11);

LABEL_10:
}

void __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v2, "addEntriesFromDictionary:");
  objc_msgSend(*(id *)(a1 + 40), "deviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke_2;
  v6[3] = &unk_1E70C7E20;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateContent:withOptions:completion:", v5, v3, v6);

}

uint64_t __64__ICCameraDevice_requestEnumerateContentWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMediaItemToIndex:", v4);

}

- (void)removeCameraFolderFromIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMediaItemFromIndex:", v4);

}

- (void)addCameraFileToIndex:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMediaItemToIndex:", v4);

}

- (void)removeCameraFileFromIndex:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  os_unfair_lock_t lock;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "addObject:", v4);
      if (objc_msgSend(v4, "twinID"))
      {
        -[ICCameraDevice cameraFileWithObjectID:](self, "cameraFileWithObjectID:", objc_msgSend(v4, "twinID"));
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          objc_msgSend(v5, "addObject:", v6);

        }
      }
      lock = &self->_mediaLock;
      os_unfair_lock_lock(&self->_mediaLock);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = v5;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v22;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
            objc_msgSend(v4, "sidecarFiles", lock);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15 && objc_msgSend(v15, "count"))
            {
              v11 += objc_msgSend(v16, "count");
              -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "removeMediaItemsFromIndex:", v16);

            }
            v11 += objc_msgSend(v14, "universalFamily");
            -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeMediaItemFromIndex:", v14);

            -[ICCameraDevice addNumberOfDownloadableItems:](self, "addNumberOfDownloadableItems:", -v11);
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }

      os_unfair_lock_unlock(lock);
      v5 = v20;
    }
  }

}

- (BOOL)supportsMediaFormatCatalog
{
  void *v3;
  BOOL v4;

  -[ICDevice transportType](self, "transportType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("ICTransportTypeMassStorage")) & 1) == 0
    && -[ICCameraDevice appleRelatedUUIDSupport](self, "appleRelatedUUIDSupport") != 0;

  return v4;
}

- (void)setAppleRelatedUUIDSupport:(unint64_t)a3
{
  if (-[ICCameraDevice appleRelatedUUIDSupport](self, "appleRelatedUUIDSupport") != a3
    && (a3 == 2 || a3 == 1)
    && !-[ICCameraDevice appleRelatedUUIDSupport](self, "appleRelatedUUIDSupport"))
  {
    self->_appleRelatedUUIDSupport = a3;
  }
}

- (unint64_t)appleRelatedUUIDSupport
{
  return self->_appleRelatedUUIDSupport;
}

- (BOOL)legacyDevice
{
  void *v3;
  BOOL v4;

  -[ICDevice transportType](self, "transportType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("ICTransportTypeMassStorage")) & 1) != 0
    || -[ICCameraDevice appleRelatedUUIDSupport](self, "appleRelatedUUIDSupport") != 1;

  return v4;
}

- (void)addItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCameraDevice *v9;

  v4 = a3;
  if (-[ICDevice hasOpenSession](self, "hasOpenSession"))
  {
    if (v4)
    {
      v5 = (void *)objc_msgSend(v4, "count");
      if (v5)
      {
        -[ICCameraDevice relateMedia:](self, "relateMedia:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = 0;
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__ICCameraDevice_addItems___block_invoke;
    v7[3] = &unk_1E70C71C0;
    v8 = v5;
    v9 = self;
    v6 = v5;
    ICPerformBlockOnMainThread(v7);

  }
}

uint64_t __27__ICCameraDevice_addItems___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addMediaFiles:");
  return objc_msgSend(*(id *)(a1 + 40), "updateContentCatalogPercentCompleted");
}

- (NSArray)contents
{
  os_unfair_lock_s *p_mediaLock;
  void *v4;

  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_devContents);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_mediaLock);
  return (NSArray *)v4;
}

- (NSArray)mediaFiles
{
  os_unfair_lock_s *p_mediaLock;
  void *v4;
  void *v5;
  void *v6;

  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  v4 = (void *)MEMORY[0x1E0C99D20];
  -[ICCameraDevice devMediaFiles](self, "devMediaFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_mediaLock);
  return (NSArray *)v6;
}

- (NSArray)filesOfType:(NSString *)fileUTType
{
  NSString *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = fileUTType;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_devContents;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addItemsMatchingType:fromFolder:", v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)addNumberOfDownloadableItems:(int64_t)a3
{
  self->_mediaObjectCount += a3;
}

- (unint64_t)numberOfDownloadableItems
{
  return self->_mediaObjectCount;
}

- (unint64_t)estimatedNumberOfDownloadableItems
{
  return self->_mediaObjectCount;
}

- (BOOL)containsRestrictedStorage
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[ICDevice isAppleDevice](self, "isAppleDevice"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_devContents;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
LABEL_4:
    v8 = 0;
    v6 += v5;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "name", (_QWORD)v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("0xFEEDFACE"));

      if ((v10 & 1) != 0)
        break;
      if (v5 == ++v8)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_4;

        return !v6;
      }
    }
  }

  return 1;
}

- (void)storageAvailable
{
  if (!-[ICCameraDevice containsRestrictedStorage](self, "containsRestrictedStorage"))
    -[ICCameraDevice setAccessRestriction:](self, "setAccessRestriction:", 5);
}

- (BOOL)addMediaFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaFiles"));
    -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contents"));
    -[ICCameraDevice devMediaFiles](self, "devMediaFiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v5);

    -[ICDevice delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();
    v9 = objc_opt_respondsToSelector();
    if (v7 && (v8 & 1) != 0)
    {
      objc_msgSend(v7, "performSelector:withObject:withObject:", sel_cameraDevice_didAddItems_, self, v5);
    }
    else if (v7)
    {
      if (((v9 ^ 1) & 1) == 0)
      {
        v10 = objc_msgSend(v5, "count");
        if (v10)
        {
          v11 = v10;
          for (i = 0; i != v11; ++i)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "performSelector:withObject:withObject:", sel_cameraDevice_didAddItem_, self, v13);

          }
        }
      }
    }
    -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contents"));
    -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaFiles"));

  }
  return 0;
}

- (void)handleStatusNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int isEnumeratingContent;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  _QWORD block[5];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ICDeviceIsReady")))
  {
    -[ICCameraDevice deviceNotificationQueue](self, "deviceNotificationQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__ICCameraDevice_handleStatusNotification___block_invoke;
    block[3] = &unk_1E70C71C0;
    block[4] = self;
    v31 = v4;
    dispatch_async(v6, block);

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ICAppleDeviceUnlocked")))
  {
    __ICOSLogCreate();
    -[ICDevice name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x15)
    {
      objc_msgSend(v7, "substringWithRange:", 0, 18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🔓 Device Is Unlocked"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v7);
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      v33 = objc_msgSend(v12, "UTF8String");
      v34 = 2114;
      v35 = v10;
      _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[ICCameraDevice setAccessRestriction:](self, "setAccessRestriction:", 6);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ICDeviceIsEnumerating")))
  {
    isEnumeratingContent = self->_isEnumeratingContent;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsEnumerating"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (isEnumeratingContent != v16)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsEnumerating"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if (v18)
        -[ICCameraDevice setAccessRestriction:](self, "setAccessRestriction:", 6);
      __ICOSLogCreate();
      -[ICDevice name](self, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v19, "length") >= 0x15)
      {
        objc_msgSend(v19, "substringWithRange:", 0, 18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingString:", CFSTR(".."));
        v21 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v21;
      }
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsEnumerating"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");
      v25 = CFSTR("NO");
      if (v24)
        v25 = CFSTR("YES");
      objc_msgSend(v22, "stringWithFormat:", CFSTR("♻️ Device Is Enumerating: %@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_retainAutorelease(v19);
        v29 = v27;
        *(_DWORD *)buf = 136446466;
        v33 = objc_msgSend(v28, "UTF8String");
        v34 = 2114;
        v35 = v26;
        _os_log_impl(&dword_1B98FC000, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEnumeratingContent"));
      self->_isEnumeratingContent = v18;
      -[ICCameraDevice updateEnumeratingErrorStatus](self, "updateEnumeratingErrorStatus");
      -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEnumeratingContent"));
    }
  }

}

void __43__ICCameraDevice_handleStatusNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICCameraDevice_handleStatusNotification___block_invoke_2;
  block[3] = &unk_1E70C7630;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  ICPerformBlockOnMainThread(block);

}

uint64_t __43__ICCameraDevice_handleStatusNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "ready") & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "hasOpenSession"))
  {
    return objc_msgSend(*(id *)(a1 + 32), "updateMediaFilesCount:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "setReady:", 1);
  __ICOSLogCreate();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "length") >= 0x15)
  {
    objc_msgSend(v2, "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🏁 Device Did Become Ready"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v2);
    v8 = v6;
    v10 = 136446466;
    v11 = objc_msgSend(v7, "UTF8String");
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1B98FC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:", sel_deviceDidBecomeReady_, *(_QWORD *)(a1 + 32));
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateMediaFilesCount:", *(_QWORD *)(a1 + 48));
}

- (void)updateLockedErrorStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ICCameraDevice *v14;
  id v15;

  if (-[ICDevice isAppleDevice](self, "isAppleDevice"))
  {
    -[ICDevice delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICCameraDevice devAccessRestriction](self, "devAccessRestriction") == 8)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB3940];
      ICLocalizedString(CFSTR("ICReturnDeviceUnlockRequest"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDevice name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9943, v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__ICCameraDevice_updateLockedErrorStatus__block_invoke;
    block[3] = &unk_1E70C7630;
    v13 = v3;
    v14 = self;
    v15 = v4;
    v10 = v4;
    v11 = v3;
    ICPerformBlockOnMainThread(block);

  }
}

uint64_t __41__ICCameraDevice_updateLockedErrorStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:withObject:", sel_device_didEncounterError_, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)updateEnumeratingErrorStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  ICCameraDevice *v10;
  id v11;

  if (-[ICDevice isAppleDevice](self, "isAppleDevice")
    && !-[ICCameraDevice isAccessRestrictedAppleDevice](self, "isAccessRestrictedAppleDevice"))
  {
    -[ICDevice delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isEnumeratingContent)
    {
      -[ICDevice name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ICMakeFormattedLocalizedError(-9954, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__ICCameraDevice_updateEnumeratingErrorStatus__block_invoke;
    block[3] = &unk_1E70C7630;
    v9 = v3;
    v10 = self;
    v11 = v5;
    v6 = v5;
    v7 = v3;
    ICPerformBlockOnMainThread(block);

  }
}

uint64_t __46__ICCameraDevice_updateEnumeratingErrorStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:withObject:", sel_device_didEncounterError_, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)removeItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id obj;
  _QWORD block[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        -[ICCameraDevice cameraFileWithObjectID:](self, "cameraFileWithObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "integerValue", v14));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "parentFolder");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = v10;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contents"));
              -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaFiles"));
              objc_msgSend(v11, "deleteItem:", v12);
              -[ICCameraDevice removeCameraFileFromIndex:](self, "removeCameraFileFromIndex:", v12);
              os_unfair_lock_lock(&self->_mediaLock);
              -[NSMutableArray removeObject:](self->_devMediaFiles, "removeObject:", v12);
              os_unfair_lock_unlock(&self->_mediaLock);
              -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contents"));
              -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaFiles"));
            }
            else
            {
              os_unfair_lock_lock(&self->_mediaLock);
              -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contents"));
              -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaFiles"));
              objc_msgSend(v11, "deleteItem:", v12);
              -[ICCameraDevice removeCameraFolderFromIndex:](self, "removeCameraFolderFromIndex:", v12);
              -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contents"));
              -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaFiles"));
              os_unfair_lock_unlock(&self->_mediaLock);
            }
            objc_msgSend(v14, "addObject:", v12);

          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ICCameraDevice_removeItems___block_invoke;
  block[3] = &unk_1E70C71C0;
  block[4] = self;
  v17 = v14;
  v13 = v14;
  ICPerformBlockOnMainThread(block);

}

void __30__ICCameraDevice_removeItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  char v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "count");
  v3 = v6;
  if (v2)
    v4 = v6 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = objc_opt_respondsToSelector();
    v3 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "performSelector:withObject:withObject:", sel_cameraDevice_didRemoveItems_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v3 = v6;
    }
  }

}

- (void)requestCloseSession
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__ICCameraDevice_requestCloseSession__block_invoke;
  v2[3] = &unk_1E70C7150;
  v2[4] = self;
  -[ICCameraDevice requestCloseSessionWithOptions:completion:](self, "requestCloseSessionWithOptions:completion:", 0, v2);
}

void __37__ICCameraDevice_requestCloseSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ICCameraDevice_requestCloseSession__block_invoke_2;
  v5[3] = &unk_1E70C71C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  ICPerformBlockOnMainThread(v5);

}

void __37__ICCameraDevice_requestCloseSession__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "performSelector:withObject:withObject:", sel_device_didCloseSessionWithError_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

- (void)requestCloseSessionWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  ICCameraDevice *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[ICDevice sessionState](self, "sessionState") == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke;
    v9[3] = &unk_1E70C7680;
    v10 = v6;
    v11 = self;
    v12 = v7;
    -[ICCameraDevice dispatchAsyncForOperationType:block:](self, "dispatchAsyncForOperationType:block:", 1, v9);

  }
  else
  {
    ICMakeLocalizedError(-9958);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v8);

  }
}

void __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v2, "addEntriesFromDictionary:");
  objc_msgSend(*(id *)(a1 + 40), "deviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke_2;
  v6[3] = &unk_1E70C7DF8;
  v5 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  objc_msgSend(v4, "closeSession:withOptions:completion:", v7, v3, v6);

}

void __60__ICCameraDevice_requestCloseSessionWithOptions_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("errCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v5, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasOpenSession"));
  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", -1);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("hasOpenSession"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("contents"));
  objc_msgSend(*(id *)(a1 + 32), "devContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("contents"));
  objc_msgSend(*(id *)(a1 + 32), "lockMedia");
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("mediaFiles"));
  objc_msgSend(*(id *)(a1 + 32), "devMediaFiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("mediaFiles"));
  objc_msgSend(*(id *)(a1 + 32), "unlockMedia");
  objc_msgSend(*(id *)(a1 + 32), "lockMedia");
  objc_msgSend(*(id *)(a1 + 32), "indexedMediaSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllItems");

  objc_msgSend(*(id *)(a1 + 32), "resetAccessRestriction");
  objc_msgSend(*(id *)(a1 + 32), "setDevContentCatalogPercentCompleted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPreflightCountOfObjects:", -1);
  objc_msgSend(*(id *)(a1 + 32), "setMediaObjectCount:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPreviouslyIndexed:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReady:", 0);
  objc_msgSend(*(id *)(a1 + 32), "unlockMedia");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = (void *)v11;
  if (v9)
  {
    (*(void (**)(void))(v9 + 16))();
    v10 = (void *)v11;
  }

}

- (void)lockMedia
{
  os_unfair_lock_lock(&self->_mediaLock);
}

- (void)unlockMedia
{
  os_unfair_lock_unlock(&self->_mediaLock);
}

- (void)handlePtpEvent:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[ICDevice delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICCameraDevice ptpEventHandler](self, "ptpEventHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICCameraDevice ptpEventHandler](self, "ptpEventHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v6)[2](v6, v7);

    }
    else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "performSelector:withObject:withObject:", sel_cameraDevice_didReceivePTPEvent_, self, v7);
    }
  }

}

- (void)setPtpEventHandler:(void *)ptpEventHandler
{
  void *v4;
  id v5;
  id v6;

  v6 = ptpEventHandler;
  if (v6)
  {
    -[ICCameraDevice setPtpEventForwarding:](self, "setPtpEventForwarding:", 1);
    v4 = (void *)MEMORY[0x1BCCC74B4](v6);
    v5 = self->_ptpEventHandler;
    self->_ptpEventHandler = v4;
  }
  else
  {
    v5 = self->_ptpEventHandler;
    self->_ptpEventHandler = 0;
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICCameraDevice;
  -[ICDevice setDelegate:](&v5, sel_setDelegate_, v4);
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICCameraDevice setPtpEventForwarding:](self, "setPtpEventForwarding:", 1);
    if (-[ICCameraDevice notifyDelegateRestrictionChanged](self, "notifyDelegateRestrictionChanged"))
      -[ICCameraDevice updateAccessRestriction](self, "updateAccessRestriction");
  }

}

- (void)requestSyncClock
{
  id v3;

  if (-[ICDevice hasOpenSession](self, "hasOpenSession"))
  {
    if (-[ICCameraDevice allowsSyncingClock](self, "allowsSyncingClock"))
    {
      -[ICDevice deviceManager](self, "deviceManager");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "syncClock:completion:", self, &__block_literal_global_234);

    }
  }
}

void __34__ICCameraDevice_requestSyncClock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("errCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if ((_DWORD)v6)
  {
    __ICOSLogCreate();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - Sync Clock: %d"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = __ICLogTypeEnabled(2);
    v11 = _gICOSLog;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v9;
        _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
    {
      __34__ICCameraDevice_requestSyncClock__block_invoke_cold_1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }

  }
}

- (void)dispatchAsyncForOperationType:(int64_t)a3 block:(id)a4
{
  void *v5;
  NSObject *devCommandQueue;
  NSObject *v7;
  dispatch_block_t block;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  devCommandQueue = self->_devCommandQueue;
  block = v5;
  if (devCommandQueue)
  {
    dispatch_async(devCommandQueue, v5);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, block);

  }
}

- (void)requestDeleteFiles:(NSArray *)files
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__ICCameraDevice_requestDeleteFiles___block_invoke_2;
  v4[3] = &unk_1E70C7EC8;
  v4[4] = self;
  v3 = -[ICCameraDevice requestDeleteFiles:deleteFailed:completion:](self, "requestDeleteFiles:deleteFailed:completion:", files, &__block_literal_global_238, v4);
}

void __37__ICCameraDevice_requestDeleteFiles___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__ICCameraDevice_requestDeleteFiles___block_invoke_3;
  v6[3] = &unk_1E70C71C0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  ICPerformBlockOnMainThread(v6);

}

void __37__ICCameraDevice_requestDeleteFiles___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "performSelector:withObject:withObject:", sel_cameraDevice_didCompleteDeleteFilesWithError_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSProgress)requestDeleteFiles:(NSArray *)files deleteFailed:(void *)deleteFailed completion:(void *)completion
{
  NSArray *v8;
  void *v9;
  void (**v10)(void *, _QWORD, void *);
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  NSArray *v17;
  void (**v18)(void *, _QWORD, void *);
  id v19;

  v8 = files;
  v9 = deleteFailed;
  v10 = completion;
  if (!-[ICDevice hasOpenSession](self, "hasOpenSession")
    || -[ICCameraDevice beingEjected](self, "beingEjected")
    || -[ICCameraDevice isLocked](self, "isLocked")
    || !-[NSArray count](v8, "count"))
  {
    ICMakeLocalizedError(-9941);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, MEMORY[0x1E0C9AA70], v13);

    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[NSArray count](v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCancellable:", 1);
    objc_msgSend(v11, "setPausable:", 0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke;
    v15[3] = &unk_1E70C7F68;
    v15[4] = self;
    v12 = v11;
    v16 = v12;
    v17 = v8;
    v18 = v10;
    v19 = v9;
    -[ICCameraDevice dispatchAsyncForOperationType:block:](self, "dispatchAsyncForOperationType:block:", 5, v15);

  }
  return (NSProgress *)v12;
}

void __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke(id *a1)
{
  id v2;
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  objc_msgSend(a1[4], "setDeleteProgress:", a1[5]);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  v25 = (id)objc_msgSend(a1[6], "mutableCopy");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__243;
  v22 = __Block_byref_object_dispose__244;
  v23 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_245;
  v9 = &unk_1E70C7F40;
  v10 = a1[5];
  v14 = v24;
  v15 = v28;
  v16 = v26;
  v2 = a1[7];
  v11 = a1[4];
  v12 = v2;
  v13 = a1[8];
  v17 = &v18;
  v3 = (void (**)(_QWORD))MEMORY[0x1BCCC74B4](&v6);
  v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);
  v5 = (void *)v19[5];
  v19[5] = v4;

  v3[2](v3);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v28, 8);
}

void __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_245(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD block[5];
  _QWORD v15[4];
  id v16;
  dispatch_semaphore_t v17;
  id v18;
  __int128 v19;
  uint64_t v20;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0
    || !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("ICDeleteFailed"));
      ICMakeLocalizedError(-9941);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
      objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), CFSTR("ICDeleteSuccessful"));
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
      {
        objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("ICDeleteCanceled"));
        ICMakeLocalizedError(-9942);
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "setDeleteProgress:", 0);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 40), "deviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_2;
    v15[3] = &unk_1E70C7EF0;
    v7 = *(id *)(a1 + 56);
    v17 = v3;
    v18 = v7;
    v19 = *(_OWORD *)(a1 + 72);
    v20 = *(_QWORD *)(a1 + 64);
    v16 = v2;
    v8 = v3;
    v9 = v2;
    objc_msgSend(v4, "deleteFile:fromDevice:completion:", v9, v6, v15);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    dispatch_get_global_queue(25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_252;
    block[3] = &unk_1E70C7F18;
    block[4] = *(_QWORD *)(a1 + 88);
    dispatch_async(v10, block);

  }
}

void __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  const __CFString **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("iccameradevice");
  if ((unint64_t)objc_msgSend(CFSTR("iccameradevice"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("iccameradevice"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("delete file reply: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v5);
    v12 = v10;
    *(_DWORD *)buf = 136446466;
    v31 = -[__CFString UTF8String](v11, "UTF8String");
    v32 = 2114;
    v33 = v9;
    _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  if (v14 <= -9923)
  {
    if (v14 == -9942)
    {
      v15 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(a1 + 32);
      v28 = CFSTR("ICDeleteErrorCanceled");
      v29 = v21;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v29;
      v19 = &v28;
      goto LABEL_14;
    }
    if (v14 == -9941)
    {
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      v24 = CFSTR("ICDeleteErrorReadOnly");
      v25 = v16;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v25;
      v19 = &v24;
LABEL_14:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v23);

    }
LABEL_15:
    v20 = *(_QWORD *)(a1 + 56);
    goto LABEL_16;
  }
  if (v14 == -9922)
  {
    v15 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 32);
    v26 = CFSTR("ICDeleteErrorFileMissing");
    v27 = v22;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v27;
    v19 = &v26;
    goto LABEL_14;
  }
  if (v14)
    goto LABEL_15;
  v20 = *(_QWORD *)(a1 + 64);
LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(v20 + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeLastObject");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __61__ICCameraDevice_requestDeleteFiles_deleteFailed_completion___block_invoke_252(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

- (void)requestEject
{
  objc_super v3;
  _QWORD v4[5];

  if (-[ICCameraDevice isEjectable](self, "isEjectable"))
  {
    if (!-[ICCameraDevice beingEjected](self, "beingEjected"))
    {
      -[ICCameraDevice setBeingEjected:](self, "setBeingEjected:", 1);
      v4[1] = 3221225472;
      v4[2] = __30__ICCameraDevice_requestEject__block_invoke;
      v4[3] = &unk_1E70C7150;
      v4[4] = self;
      v3.receiver = self;
      v3.super_class = (Class)ICCameraDevice;
      v4[0] = MEMORY[0x1E0C809B0];
      -[ICDevice requestEjectWithCompletion:](&v3, sel_requestEjectWithCompletion_, v4);
    }
  }
}

uint64_t __30__ICCameraDevice_requestEject__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBeingEjected:", 0);
}

- (void)requestSendPTPCommand:(NSData *)ptpCommand outData:(NSData *)ptpData completion:(void *)completion
{
  void *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = completion;
  if (ptpCommand)
  {
    v9 = ptpData;
    v10 = ptpCommand;
    -[ICDevice deviceManager](self, "deviceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__ICCameraDevice_requestSendPTPCommand_outData_completion___block_invoke;
    v12[3] = &unk_1E70C7930;
    v13 = v8;
    objc_msgSend(v11, "sendDevice:ptpCommand:andPayload:completion:", self, v10, v9, v12);

  }
}

void __59__ICCameraDevice_requestSendPTPCommand_outData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICPTPDataInBuffer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICPTPResponseBuffer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPtpEventForwarding:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x1E0C80C00];
  -[ICDevice deviceManager](self, "deviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8[0] = CFSTR("ICNotificationTypeDeviceForwardPTPEvents");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerDevice:forImageCaptureEventNotifications:", self, v6);
  }
  else
  {
    v7 = CFSTR("ICNotificationTypeDeviceForwardPTPEvents");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterDevice:forImageCaptureEventNotifications:", self, v6);
  }

}

- (void)cancelDelete
{
  void *v3;
  id v4;

  -[ICCameraDevice deleteProgress](self, "deleteProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICCameraDevice deleteProgress](self, "deleteProgress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
}

- (void)requestDownloadFile:(ICCameraFile *)file options:(NSDictionary *)options downloadDelegate:(id)downloadDelegate didDownloadSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  ICCameraFile *v11;
  NSDictionary *v12;
  id v13;
  ICCameraFile *v14;
  id v15;
  NSDictionary *v16;
  id v17;
  _QWORD v18[4];
  NSDictionary *v19;
  id v20;
  ICCameraFile *v21;
  SEL v22;
  void *v23;

  v11 = file;
  v12 = options;
  v13 = downloadDelegate;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke;
  v18[3] = &unk_1E70C7FB8;
  v19 = v12;
  v20 = v13;
  v21 = v11;
  v22 = selector;
  v23 = contextInfo;
  v14 = v11;
  v15 = v13;
  v16 = v12;
  v17 = -[ICCameraFile requestDownloadWithOptions:completion:](v14, "requestDownloadWithOptions:completion:", v16, v18);

}

void __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke_2;
  block[3] = &unk_1E70C7F90;
  v15 = v5;
  v16 = v7;
  v8 = *(id *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v17 = v8;
  v20 = v9;
  v18 = v10;
  v19 = v6;
  v21 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  ICPerformBlockOnMainThread(block);

}

id __95__ICCameraDevice_requestDownloadFile_options_downloadDelegate_didDownloadSelector_contextInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, CFSTR("ICSavedFilename"));
  return objc_msgSend(*(id *)(a1 + 48), *(SEL *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
}

- (void)addFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_mediaLock);
    __ICOSLogCreate();
    -[ICDevice name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x15)
    {
      objc_msgSend(v5, "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "name");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "stringWithFormat:", CFSTR("🗄 Store Added  - %04d - [%8s]"), 1, objc_msgSend(v9, "UTF8String"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v5);
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      v15 = objc_msgSend(v12, "UTF8String");
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](self->_devContents, "addObject:", v4);
    os_unfair_lock_unlock(&self->_mediaLock);
    -[ICCameraDevice addCameraFolderToIndex:](self, "addCameraFolderToIndex:", v4);
    -[ICCameraDevice storageAvailable](self, "storageAvailable");
  }

}

- (void)removeFolder:(id)a3
{
  NSMutableArray *devContents;
  id v5;
  void *v6;

  if (a3)
  {
    devContents = self->_devContents;
    v5 = a3;
    -[NSMutableArray removeObject:](devContents, "removeObject:", v5);
    -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeMediaItemFromIndex:", v5);

    -[ICCameraDevice storageAvailable](self, "storageAvailable");
  }
}

- (void)cancelDownload
{
  void *v3;
  id v4;

  -[ICCameraDevice downloadProgress](self, "downloadProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICCameraDevice downloadProgress](self, "downloadProgress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
}

- (int64_t)cameraFilesContentSizeInBytes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ICCameraDevice indexedMediaSet](self, "indexedMediaSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetForType:", CFSTR("file"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += 5120 + objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "fileSize", (_QWORD)v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGImage)icon
{
  void *v3;
  uint64_t v4;
  void *v5;
  CGImage *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  -[ICDevice systemSymbolName](self, "systemSymbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[ICDevice setSystemSymbolName:](self, "setSystemSymbolName:", CFSTR("camera"));
  -[ICDevice systemSymbolName](self, "systemSymbolName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[ICCameraDevice cameraDeviceIcon](self, "cameraDeviceIcon");

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D3A7F8]);
      objc_msgSend(v7, "setSymbolWeight:", 3);
      objc_msgSend(v7, "setPointSize:", 24.0);
      -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ProductType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D3A838];
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v11, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v12, 1, 1, &v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "imageForDescriptor:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          -[ICCameraDevice setCameraDeviceIcon:](self, "setCameraDeviceIcon:", objc_msgSend(v14, "CGImage"));

      }
      if (!-[ICCameraDevice cameraDeviceIcon](self, "cameraDeviceIcon"))
      {
        v16 = objc_alloc(MEMORY[0x1E0D3A838]);
        -[ICDevice systemSymbolName](self, "systemSymbolName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithSymbolName:bundleURL:", v17, 0);

        objc_msgSend(v18, "imageForDescriptor:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
          -[ICCameraDevice setCameraDeviceIcon:](self, "setCameraDeviceIcon:", objc_msgSend(v19, "CGImage"));

      }
    }
  }
  return -[ICCameraDevice cameraDeviceIcon](self, "cameraDeviceIcon");
}

- (BOOL)setDefaultMediaPresentation:(unint64_t)a3
{
  ICMediaPresentation v5;

  v5 = -[ICCameraDevice mediaPresentation](self, "mediaPresentation");
  if (v5 != a3)
    -[ICCameraDevice setMediaPresentation:](self, "setMediaPresentation:", a3);
  return v5 != a3;
}

- (ICCameraDevice)initWithDictionary:(id)a3
{
  ICCameraDevice *v3;
  ICCameraDevice *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *devNotificationQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *devCommandQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *devWriteQueue;
  ICOrderedMediaSet *v14;
  ICOrderedMediaSet *indexedMediaSet;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICCameraDevice;
  v3 = -[ICDevice initWithDictionary:](&v17, sel_initWithDictionary_, a3);
  v4 = v3;
  if (v3)
  {
    -[ICDevice setProductKind:](v3, "setProductKind:", CFSTR("Camera"));
    -[ICDevice setType:](v4, "setType:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraDevice setDevContents:](v4, "setDevContents:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraDevice setDevMediaFiles:](v4, "setDevMediaFiles:", v6);

    v4->_mediaLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("ICDeviceNotificationQueue", v7);
    devNotificationQueue = v4->_devNotificationQueue;
    v4->_devNotificationQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("ICDeviceCommandQueue", v7);
    devCommandQueue = v4->_devCommandQueue;
    v4->_devCommandQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("ICDeviceWriteQueue", v7);
    devWriteQueue = v4->_devWriteQueue;
    v4->_devWriteQueue = (OS_dispatch_queue *)v12;

    v4->_devContentCatalogPercentCompleted = 0;
    v4->_preflightCountOfObjects = -1;
    v4->_isEnumeratingContent = 0;
    -[ICCameraDevice setDevMediaPresentation:](v4, "setDevMediaPresentation:", 1);
    v14 = -[ICOrderedMediaSet initWithTypes:]([ICOrderedMediaSet alloc], "initWithTypes:", &unk_1E70DC6E0);
    indexedMediaSet = v4->_indexedMediaSet;
    v4->_indexedMediaSet = v14;

    -[ICCameraDevice setAppleRelatedUUIDSupport:](v4, "setAppleRelatedUUIDSupport:", 0);
    -[ICCameraDevice setEnumerationOrder:](v4, "setEnumerationOrder:", 1);
    -[ICDevice setType:](v4, "setType:", -[ICDevice type](v4, "type") | 0x100);
    -[ICCameraDevice resetAccessRestriction](v4, "resetAccessRestriction");
    -[ICCameraDevice addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", v4, CFSTR("ready"), 3, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  -[ICDevice name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x15)
  {
    objc_msgSend(v3, "substringWithRange:", 0, 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" --- Deallocating Device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v3);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v13 = objc_msgSend(v8, "UTF8String");
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[ICCameraDevice removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("ready"));
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)ICCameraDevice;
  -[ICCameraDevice dealloc](&v11, sel_dealloc);
}

- (void)requestReadDataFromFile:(ICCameraFile *)file atOffset:(off_t)offset length:(off_t)length readDelegate:(id)readDelegate didReadDataSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  ICCameraFile *v14;
  id v15;
  SEL v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  ICCameraFile *v22;
  id v23;
  SEL v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  ICCameraFile *v28;
  SEL v29;
  SEL v30;
  void *v31;

  v14 = file;
  v15 = readDelegate;
  v16 = sel_registerName("didReadData:fromFile:error:contextInfo:");
  if (-[ICDevice hasOpenSession](self, "hasOpenSession")
    && (v17 = -[ICCameraDevice beingEjected](self, "beingEjected"), selector)
    && v15
    && v14
    && !v17)
  {
    if (length + offset <= -[ICCameraFile fileSize](v14, "fileSize")
      && !-[ICCameraFile isConverted](v14, "isConverted"))
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke;
      v26[3] = &unk_1E70C8008;
      v27 = v15;
      v29 = v16;
      v30 = selector;
      v28 = v14;
      v31 = contextInfo;
      -[ICCameraFile requestReadDataAtOffset:length:completion:](v28, "requestReadDataAtOffset:length:completion:", offset, length, v26);

      v18 = v27;
LABEL_12:

      goto LABEL_13;
    }
  }
  else if (!v15)
  {
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ICMakeLocalizedError(-9922);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_3;
    v20[3] = &unk_1E70C8030;
    v21 = v15;
    v24 = selector;
    v22 = v14;
    v23 = v19;
    v25 = contextInfo;
    v18 = v19;
    ICPerformBlockOnMainThread(v20);

    goto LABEL_12;
  }
LABEL_13:

}

void __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_2;
  block[3] = &unk_1E70C7FE0;
  v7 = *(id *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  v11 = v7;
  v12 = v5;
  v13 = *(id *)(a1 + 40);
  v14 = v6;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = v6;
  v9 = v5;
  ICPerformBlockOnMainThread(block);

}

uint64_t __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return (uint64_t)objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  }
  return result;
}

id __103__ICCameraDevice_requestReadDataFromFile_atOffset_length_readDelegate_didReadDataSelector_contextInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 56), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
}

- (void)dumpPTPPassthruCommand:(id)a3 andData:(id)a4
{
  id v5;
  id v6;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  __CFString *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  __CFString *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  __CFString *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  __CFString *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  __CFString *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  unsigned __int16 v97;
  unsigned int v98;
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v98 = 0;
  v97 = 0;
  objc_msgSend(v5, "getBytes:range:", &v98, 0, 4);
  objc_msgSend(v5, "getBytes:range:", &v97, 6, 2);
  if (v97 != 37142 && v97 != 37203)
  {
    __ICOSLogCreate();
    v8 = CFSTR("--cmd--");
    if ((unint64_t)objc_msgSend(CFSTR("--cmd--"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("--cmd--"), "substringWithRange:", 0, 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("************************"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v100 = v12;
      v101 = 2114;
      v102 = v10;
      _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    __ICOSLogCreate();
    v13 = CFSTR("length");
    if ((unint64_t)objc_msgSend(CFSTR("length"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("length"), "substringWithRange:", 0, 18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", CFSTR(".."));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)_gICOSLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v100 = v17;
      v101 = 2114;
      v102 = v15;
      _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "getBytes:range:", &v97, 4, 2);
    __ICOSLogCreate();
    v18 = CFSTR("type");
    if ((unint64_t)objc_msgSend(CFSTR("type"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("type"), "substringWithRange:", 0, 18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingString:", CFSTR(".."));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v97);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)_gICOSLog;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = -[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v100 = v22;
      v101 = 2114;
      v102 = v20;
      _os_log_impl(&dword_1B98FC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "getBytes:range:", &v97, 6, 2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v97);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __ICOSLogCreate();
    v24 = CFSTR("op");
    if ((unint64_t)objc_msgSend(CFSTR("op"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("op"), "substringWithRange:", 0, 18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingString:", CFSTR(".."));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = objc_retainAutorelease(v23);
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v27, "UTF8String"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)_gICOSLog;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = -[__CFString UTF8String](objc_retainAutorelease(v24), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v100 = v30;
      v101 = 2114;
      v102 = v28;
      _os_log_impl(&dword_1B98FC000, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(v5, "getBytes:range:", &v98, 8, 4);
    __ICOSLogCreate();
    v31 = CFSTR("tid");
    if ((unint64_t)objc_msgSend(CFSTR("tid"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("tid"), "substringWithRange:", 0, 18);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAppendingString:", CFSTR(".."));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)_gICOSLog;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = -[__CFString UTF8String](objc_retainAutorelease(v31), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v100 = v35;
      v101 = 2114;
      v102 = v33;
      _os_log_impl(&dword_1B98FC000, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    if ((unint64_t)objc_msgSend(v5, "length") >= 0x10)
    {
      __ICOSLogCreate();
      v36 = CFSTR("|---------pars--");
      if ((unint64_t)objc_msgSend(CFSTR("|---------pars--"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("|---------pars--"), "substringWithRange:", 0, 18);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringByAppendingString:", CFSTR(".."));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("---------"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (id)_gICOSLog;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = -[__CFString UTF8String](objc_retainAutorelease(v36), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v40;
        v101 = 2114;
        v102 = v38;
        _os_log_impl(&dword_1B98FC000, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      objc_msgSend(v5, "getBytes:range:", &v98, 12, 4);
      __ICOSLogCreate();
      v41 = CFSTR("(p1)");
      if ((unint64_t)objc_msgSend(CFSTR("(p1)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("(p1)"), "substringWithRange:", 0, 18);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringByAppendingString:", CFSTR(".."));
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (id)_gICOSLog;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = -[__CFString UTF8String](objc_retainAutorelease(v41), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v45;
        v101 = 2114;
        v102 = v43;
        _os_log_impl(&dword_1B98FC000, v44, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x14)
    {
      objc_msgSend(v5, "getBytes:range:", &v98, 16, 4);
      __ICOSLogCreate();
      v46 = CFSTR("(p2)");
      if ((unint64_t)objc_msgSend(CFSTR("(p2)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("(p2)"), "substringWithRange:", 0, 18);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringByAppendingString:", CFSTR(".."));
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (id)_gICOSLog;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = -[__CFString UTF8String](objc_retainAutorelease(v46), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v50;
        v101 = 2114;
        v102 = v48;
        _os_log_impl(&dword_1B98FC000, v49, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x18)
    {
      objc_msgSend(v5, "getBytes:range:", &v98, 20, 4);
      __ICOSLogCreate();
      v51 = CFSTR("(p3)");
      if ((unint64_t)objc_msgSend(CFSTR("(p3)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("(p3)"), "substringWithRange:", 0, 18);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringByAppendingString:", CFSTR(".."));
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (id)_gICOSLog;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = -[__CFString UTF8String](objc_retainAutorelease(v51), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v55;
        v101 = 2114;
        v102 = v53;
        _os_log_impl(&dword_1B98FC000, v54, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x1C)
    {
      objc_msgSend(v5, "getBytes:range:", &v98, 24, 4);
      __ICOSLogCreate();
      v56 = CFSTR("(p4)");
      if ((unint64_t)objc_msgSend(CFSTR("(p4)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("(p4)"), "substringWithRange:", 0, 18);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringByAppendingString:", CFSTR(".."));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (id)_gICOSLog;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = -[__CFString UTF8String](objc_retainAutorelease(v56), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v60;
        v101 = 2114;
        v102 = v58;
        _os_log_impl(&dword_1B98FC000, v59, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x20)
    {
      objc_msgSend(v5, "getBytes:range:", &v98, 28, 4);
      __ICOSLogCreate();
      v61 = CFSTR("(p5)");
      if ((unint64_t)objc_msgSend(CFSTR("(p5)"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("(p5)"), "substringWithRange:", 0, 18);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "stringByAppendingString:", CFSTR(".."));
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v98);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (id)_gICOSLog;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = -[__CFString UTF8String](objc_retainAutorelease(v61), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v65;
        v101 = 2114;
        v102 = v63;
        _os_log_impl(&dword_1B98FC000, v64, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    if (v6 && objc_msgSend(v6, "length") == 12)
    {
      __ICOSLogCreate();
      v66 = CFSTR("|---------data--");
      if ((unint64_t)objc_msgSend(CFSTR("|---------data--"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("|---------data--"), "substringWithRange:", 0, 18);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringByAppendingString:", CFSTR(".."));
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("---------"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (id)_gICOSLog;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = -[__CFString UTF8String](objc_retainAutorelease(v66), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v70;
        v101 = 2114;
        v102 = v68;
        _os_log_impl(&dword_1B98FC000, v69, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      v96 = 0;
      objc_msgSend(v6, "getBytes:range:", &v96, 0, 4);
      __ICOSLogCreate();
      v71 = CFSTR("|-->      length");
      if ((unint64_t)objc_msgSend(CFSTR("|-->      length"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("|-->      length"), "substringWithRange:", 0, 18);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "stringByAppendingString:", CFSTR(".."));
        v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v96);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (id)_gICOSLog;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v75 = -[__CFString UTF8String](objc_retainAutorelease(v71), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v75;
        v101 = 2114;
        v102 = v73;
        _os_log_impl(&dword_1B98FC000, v74, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      objc_msgSend(v6, "getBytes:range:", &v96, 4, 4);
      __ICOSLogCreate();
      v76 = CFSTR("|-->  propertyID");
      if ((unint64_t)objc_msgSend(CFSTR("|-->  propertyID"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("|-->  propertyID"), "substringWithRange:", 0, 18);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringByAppendingString:", CFSTR(".."));
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v96);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (id)_gICOSLog;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = -[__CFString UTF8String](objc_retainAutorelease(v76), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v80;
        v101 = 2114;
        v102 = v78;
        _os_log_impl(&dword_1B98FC000, v79, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

      objc_msgSend(v6, "getBytes:range:", &v96, 8, 4);
      __ICOSLogCreate();
      v81 = CFSTR("|--> propertyVal");
      if ((unint64_t)objc_msgSend(CFSTR("|--> propertyVal"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("|--> propertyVal"), "substringWithRange:", 0, 18);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "stringByAppendingString:", CFSTR(".."));
        v81 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%X"), v96);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (id)_gICOSLog;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v85 = -[__CFString UTF8String](objc_retainAutorelease(v81), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v100 = v85;
        v101 = 2114;
        v102 = v83;
        _os_log_impl(&dword_1B98FC000, v84, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    __ICOSLogCreate();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = __ICLogTypeEnabled(2);
    v88 = (id)_gICOSLog;
    v89 = v88;
    if (v87)
    {
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v100 = (uint64_t)v86;
        _os_log_impl(&dword_1B98FC000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      __34__ICCameraDevice_requestSyncClock__block_invoke_cold_1((uint64_t)v86, v89, v90, v91, v92, v93, v94, v95);
    }

  }
}

- (void)requestSendPTPCommand:(NSData *)command outData:(NSData *)data sendCommandDelegate:(id)sendCommandDelegate didSendCommandSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  NSData *v12;
  NSData *v13;
  id v14;
  _BOOL4 v15;
  _QWORD v16[4];
  id v17;
  NSData *v18;
  SEL v19;
  void *v20;

  v12 = command;
  v13 = data;
  v14 = sendCommandDelegate;
  v15 = -[ICDevice hasOpenSession](self, "hasOpenSession");
  if (selector && v14 && v12 && v15)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke;
    v16[3] = &unk_1E70C8058;
    v17 = v14;
    v19 = selector;
    v18 = v12;
    v20 = contextInfo;
    -[ICCameraDevice requestSendPTPCommand:outData:completion:](self, "requestSendPTPCommand:outData:completion:", v18, v13, v16);

  }
}

void __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke_2;
  block[3] = &unk_1E70C7F90;
  v10 = *(id *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = v10;
  v22 = v11;
  v18 = v12;
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v23 = *(_QWORD *)(a1 + 56);
  v13 = v9;
  v14 = v8;
  v15 = v7;
  ICPerformBlockOnMainThread(block);

}

id __103__ICCameraDevice_requestSendPTPCommand_outData_sendCommandDelegate_didSendCommandSelector_contextInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
}

- (NSString)productVersion
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appleSerialNumber
{
  void *v2;
  void *v3;

  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AppleSerialNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)updateAppleProperties:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  int v40;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ICDevice isAppleDevice](self, "isAppleDevice"))
  {
    v17 = 0;
    goto LABEL_47;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobdevProps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v6 = CFSTR("mobdev");
      if ((unint64_t)objc_msgSend(CFSTR("mobdev"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("mobdev"), "substringWithRange:", 0, 18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobdevProps"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_retainAutorelease(v6);
        v13 = v11;
        *(_DWORD *)buf = 136446466;
        v43 = -[__CFString UTF8String](v12, "UTF8String");
        v44 = 2114;
        v45 = v10;
        _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mobdevProps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (-[ICCameraDevice mobdevProperties](self, "mobdevProperties"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "isEqualToDictionary:", v15),
        v15,
        (v16 & 1) == 0))
  {
    -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mobdevProperties"));
    -[ICCameraDevice setMobdevProperties:](self, "setMobdevProperties:", v14);
    -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mobdevProperties"));
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iCloudPhotosEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    if (v19 != -[ICCameraDevice iCloudPhotosEnabled](self, "iCloudPhotosEnabled"))
      -[ICCameraDevice setICloudPhotosEnabled:](self, "setICloudPhotosEnabled:", v19 != 0);
  }
  -[ICCameraDevice mobdevProperties](self, "mobdevProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20
    && (-[ICCameraDevice mobdevProperties](self, "mobdevProperties"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DevicePairedState")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v22))
  {
    if (objc_msgSend(v22, "BOOLValue"))
      v23 = 0;
    else
      v23 = 4;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsPairedWithThisHost"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v23 = 0;
      goto LABEL_28;
    }
    v22 = v24;
    if (objc_msgSend(v24, "BOOLValue"))
      v23 = 4;
    else
      v23 = 0;
  }

LABEL_28:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsEnumerating"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIsPasscodeLocked"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26 && !objc_msgSend(v26, "BOOLValue"))
  {
    v23 |= 2uLL;
LABEL_34:
    -[ICCameraDevice setAccessRestriction:](self, "setAccessRestriction:", v23);
    if (!v25)
      goto LABEL_43;
LABEL_35:
    v28 = objc_msgSend(v25, "BOOLValue");
    if (v28 != -[ICCameraDevice isEnumeratingContent](self, "isEnumeratingContent"))
    {
      __ICOSLogCreate();
      v29 = CFSTR("library");
      if ((unint64_t)objc_msgSend(CFSTR("library"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("library"), "substringWithRange:", 0, 18);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByAppendingString:", CFSTR(".."));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v31 = (void *)MEMORY[0x1E0CB3940];
      v32 = objc_msgSend(v25, "BOOLValue");
      v33 = CFSTR("√ Complete");
      if (v32)
        v33 = CFSTR("- Enumerating");
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_retainAutorelease(v29);
        v37 = v35;
        v38 = -[__CFString UTF8String](v36, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v43 = v38;
        v44 = 2114;
        v45 = v34;
        _os_log_impl(&dword_1B98FC000, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      -[ICCameraDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEnumeratingContent"));
      self->_isEnumeratingContent = objc_msgSend(v25, "BOOLValue");
      -[ICCameraDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEnumeratingContent"));
      v17 = 1;
    }
    goto LABEL_43;
  }
  if (v23)
    goto LABEL_34;
  if (v25)
    goto LABEL_35;
LABEL_43:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceMediaPresentation"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = objc_msgSend(v39, "intValue");
    if (-[ICCameraDevice mediaPresentation](self, "mediaPresentation") != v40)
      -[ICCameraDevice setDefaultMediaPresentation:](self, "setDefaultMediaPresentation:", v40);
  }

LABEL_47:
  return v17;
}

- (void)requestUploadFile:(NSURL *)fileURL options:(NSDictionary *)options uploadDelegate:(id)uploadDelegate didUploadSelector:(SEL)selector contextInfo:(void *)contextInfo
{
  NSURL *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  NSURL *v15;
  SEL v16;
  void *v17;

  v10 = fileURL;
  v11 = uploadDelegate;
  v12 = v11;
  if (v11 && selector)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__ICCameraDevice_requestUploadFile_options_uploadDelegate_didUploadSelector_contextInfo___block_invoke;
    v13[3] = &unk_1E70C8080;
    v14 = v11;
    v16 = selector;
    v15 = v10;
    v17 = contextInfo;
    ICPerformBlockOnMainThread(v13);

  }
}

void __89__ICCameraDevice_requestUploadFile_options_uploadDelegate_didUploadSelector_contextInfo___block_invoke(uint64_t a1)
{
  id v2;

  ICMakeLocalizedError(-9935);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 56));

}

- (void)requestTakePicture
{
  PTPOperationRequestPacket *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (-[ICDevice hasOpenSession](self, "hasOpenSession"))
  {
    if (-[ICCameraDevice tetheredCaptureEnabled](self, "tetheredCaptureEnabled"))
    {
      v3 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:]([PTPOperationRequestPacket alloc], "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:", 4110, 0, 1, 0, 0);
      -[PTPOperationRequestPacket contentForUSB](v3, "contentForUSB");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __36__ICCameraDevice_requestTakePicture__block_invoke;
      v6[3] = &unk_1E70C80A8;
      v6[4] = self;
      -[ICCameraDevice requestSendPTPCommand:outData:completion:](self, "requestSendPTPCommand:outData:completion:", v5, 0, v6);

    }
  }
}

void __36__ICCameraDevice_requestTakePicture__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  PTPOperationResponsePacket *v10;
  PTPOperationResponsePacket *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = -[PTPOperationResponsePacket initWithUSBBuffer:]([PTPOperationResponsePacket alloc], "initWithUSBBuffer:", objc_msgSend(objc_retainAutorelease(v8), "bytes"));
    v11 = v10;
    if (v10 && -[PTPOperationResponsePacket responseCode](v10, "responseCode") == 8193)
    {
      __ICOSLogCreate();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "length") >= 0x15)
      {
        objc_msgSend(v12, "substringWithRange:", 0, 18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", CFSTR(".."));
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Issued a PTP capture event successfully."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_retainAutorelease(v12);
        v18 = v16;
        v19 = 136446466;
        v20 = objc_msgSend(v17, "UTF8String");
        v21 = 2114;
        v22 = v15;
        _os_log_impl(&dword_1B98FC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v19, 0x16u);

      }
    }
  }
  else
  {
    v11 = 0;
  }

}

- (BOOL)isEjectable
{
  return self->_ejectable;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void)setAccessRestrictedAppleDevice:(BOOL)a3
{
  self->_accessRestrictedAppleDevice = a3;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSTimeInterval)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (BOOL)batteryLevelAvailable
{
  return self->_batteryLevelAvailable;
}

- (void)setBatteryLevelAvailable:(BOOL)a3
{
  self->_batteryLevelAvailable = a3;
}

- (NSUInteger)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(unint64_t)a3
{
  self->_batteryLevel = a3;
}

- (BOOL)tetheredCaptureEnabled
{
  return self->_tetheredCaptureEnabled;
}

- (void)ptpEventHandler
{
  return self->_ptpEventHandler;
}

- (BOOL)contentReceived
{
  return self->_contentReceived;
}

- (void)setContentReceived:(BOOL)a3
{
  self->_contentReceived = a3;
}

- (int64_t)preflightCountOfObjects
{
  return self->_preflightCountOfObjects;
}

- (void)setPreflightCountOfObjects:(int64_t)a3
{
  self->_preflightCountOfObjects = a3;
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexedMediaSet, a3);
}

- (NSMutableArray)devContents
{
  return self->_devContents;
}

- (void)setDevContents:(id)a3
{
  objc_storeStrong((id *)&self->_devContents, a3);
}

- (NSMutableArray)devMediaFiles
{
  return self->_devMediaFiles;
}

- (void)setDevMediaFiles:(id)a3
{
  objc_storeStrong((id *)&self->_devMediaFiles, a3);
}

- (unint64_t)devMediaPresentation
{
  return self->_devMediaPresentation;
}

- (void)setDevMediaPresentation:(unint64_t)a3
{
  self->_devMediaPresentation = a3;
}

- (unint64_t)devFailureCount
{
  return self->_devFailureCount;
}

- (void)setDevFailureCount:(unint64_t)a3
{
  self->_devFailureCount = a3;
}

- (NSMutableSet)devCapabilities
{
  return self->_devCapabilities;
}

- (void)setDevCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_devCapabilities, a3);
}

- (unint64_t)devAccessRestriction
{
  return self->_devAccessRestriction;
}

- (void)setDevAccessRestriction:(unint64_t)a3
{
  self->_devAccessRestriction = a3;
}

- (unint64_t)devContentCatalogPercentCompleted
{
  return self->_devContentCatalogPercentCompleted;
}

- (void)setDevContentCatalogPercentCompleted:(unint64_t)a3
{
  self->_devContentCatalogPercentCompleted = a3;
}

- (BOOL)notifyDelegateRestrictionChanged
{
  return self->_notifyDelegateRestrictionChanged;
}

- (void)setNotifyDelegateRestrictionChanged:(BOOL)a3
{
  self->_notifyDelegateRestrictionChanged = a3;
}

- (unint64_t)mediaObjectCount
{
  return self->_mediaObjectCount;
}

- (void)setMediaObjectCount:(unint64_t)a3
{
  self->_mediaObjectCount = a3;
}

- (os_unfair_lock_s)mediaLock
{
  return self->_mediaLock;
}

- (void)setMediaLock:(os_unfair_lock_s)a3
{
  self->_mediaLock = a3;
}

- (BOOL)basicMediaModel
{
  return self->_basicMediaModel;
}

- (void)setBasicMediaModel:(BOOL)a3
{
  self->_basicMediaModel = a3;
}

- (NSString)devProductType
{
  return self->_devProductType;
}

- (void)setDevProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (OS_dispatch_queue)devNotificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 448, 1);
}

- (void)setDevNotificationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (OS_dispatch_queue)devCommandQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 456, 1);
}

- (void)setDevCommandQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (OS_dispatch_queue)devWriteQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 464, 1);
}

- (void)setDevWriteQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSXPCConnection)devConnection
{
  return self->_devConnection;
}

- (void)setDevConnection:(id)a3
{
  objc_storeStrong((id *)&self->_devConnection, a3);
}

- (id)devConnectionFailureBlock
{
  return objc_getProperty(self, a2, 480, 1);
}

- (void)setDevConnectionFailureBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSXPCListenerEndpoint)devEndpoint
{
  return self->_devEndpoint;
}

- (void)setDevEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_devEndpoint, a3);
}

- (unint64_t)deviceAccessRestriction
{
  return self->_deviceAccessRestriction;
}

- (void)setDeviceAccessRestriction:(unint64_t)a3
{
  self->_deviceAccessRestriction = a3;
}

- (CGImage)cameraDeviceIcon
{
  return self->_cameraDeviceIcon;
}

- (void)setCameraDeviceIcon:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (NSMutableDictionary)mobdevProperties
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 512, 1);
}

- (void)setMobdevProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (unint64_t)previouslyIndexed
{
  return self->_previouslyIndexed;
}

- (void)setPreviouslyIndexed:(unint64_t)a3
{
  self->_previouslyIndexed = a3;
}

- (BOOL)allowsSyncingClock
{
  return self->_allowsSyncingClock;
}

- (void)setAllowsSyncingClock:(BOOL)a3
{
  self->_allowsSyncingClock = a3;
}

- (BOOL)beingEjected
{
  return self->_beingEjected;
}

- (void)setBeingEjected:(BOOL)a3
{
  self->_beingEjected = a3;
}

- (int64_t)enumerationOrder
{
  return self->_enumerationOrder;
}

- (void)setEnumerationOrder:(int64_t)a3
{
  self->_enumerationOrder = a3;
}

- (NSProgress)deleteProgress
{
  return self->_deleteProgress;
}

- (void)setDeleteProgress:(id)a3
{
  objc_storeStrong((id *)&self->_deleteProgress, a3);
}

- (NSProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_deleteProgress, 0);
  objc_storeStrong((id *)&self->_mobdevProperties, 0);
  objc_storeStrong((id *)&self->_devEndpoint, 0);
  objc_storeStrong(&self->_devConnectionFailureBlock, 0);
  objc_storeStrong((id *)&self->_devConnection, 0);
  objc_storeStrong((id *)&self->_devWriteQueue, 0);
  objc_storeStrong((id *)&self->_devCommandQueue, 0);
  objc_storeStrong((id *)&self->_devNotificationQueue, 0);
  objc_storeStrong((id *)&self->_devProductType, 0);
  objc_storeStrong((id *)&self->_devCapabilities, 0);
  objc_storeStrong((id *)&self->_devMediaFiles, 0);
  objc_storeStrong((id *)&self->_devContents, 0);
  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
  objc_storeStrong(&self->_ptpEventHandler, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
}

void __30__ICCameraDevice_remoteCamera__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B98FC000, v3, v4, "%{public}20s ! %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setMediaPresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B98FC000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __34__ICCameraDevice_requestSyncClock__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1B98FC000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
