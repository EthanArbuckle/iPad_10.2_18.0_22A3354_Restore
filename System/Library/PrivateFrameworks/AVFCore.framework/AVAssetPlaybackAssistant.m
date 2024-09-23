@implementation AVAssetPlaybackAssistant

- (AVAssetPlaybackAssistant)initWithAsset:(id)a3
{
  AVAssetPlaybackAssistant *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetPlaybackAssistant;
  v4 = -[AVAssetPlaybackAssistant init](&v6, sel_init);
  if (v4)
    v4->_asset = (AVAsset *)a3;
  return v4;
}

+ (AVAssetPlaybackAssistant)assetPlaybackAssistantWithAsset:(AVAsset *)asset
{
  return -[AVAssetPlaybackAssistant initWithAsset:]([AVAssetPlaybackAssistant alloc], "initWithAsset:", asset);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetPlaybackAssistant;
  -[AVAssetPlaybackAssistant dealloc](&v3, sel_dealloc);
}

- (id)_playbackConfigurationOptions
{
  int v3;
  int v4;
  CFStringRef i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  int v20;
  uint64_t v21;
  CFPropertyListRef v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  const opaqueCMFormatDescription *v29;
  CFPropertyListRef Extension;
  CFPropertyListRef v31;
  _BOOL4 v33;
  FourCharCode MediaSubType;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  CFPropertyListRef v39;
  CFPropertyListRef v40;
  CFPropertyListRef v41;
  void *v42;
  char v43;
  char v44;
  NSArray *v45;
  NSArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  int v51;
  int v52;
  void *v53;
  void *v54;
  AVAssetPlaybackAssistant *v56;
  NSArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  uint64_t v67;
  id obj;
  char obja;
  id v70;
  id v71;
  CFStringRef v72;
  const __CFString *v73;
  CFStringRef v74;
  const __CFString *v75;
  CFStringRef extensionKey;
  const __CFString *extensionKeya;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v56 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    obj = (id)-[AVAsset variants](self->_asset, "variants");
    v74 = (CFStringRef)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    v3 = 0;
    v4 = 0;
    if (v74)
    {
      v72 = *(CFStringRef *)v99;
      do
      {
        for (i = 0; i != v74; i = (CFStringRef)((char *)i + 1))
        {
          if (*(CFStringRef *)v99 != v72)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "videoAttributes"), "videoLayoutAttributes");
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
          if (v8)
          {
            v9 = v8;
            v70 = v6;
            extensionKey = i;
            v10 = 0;
            v11 = 0;
            v12 = *(_QWORD *)v95;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v95 != v12)
                  objc_enumerationMutation(v7);
                v14 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
                v10 |= objc_msgSend(v14, "stereoViewComponents") == 3;
                v11 |= objc_msgSend(v14, "packingType") == 1852796517;
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
            }
            while (v9);
            if ((v10 & v11 & 1) != 0)
            {
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              v15 = (void *)objc_msgSend((id)objc_msgSend(v70, "videoAttributes"), "codecTypes");
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v91;
                do
                {
                  for (k = 0; k != v17; ++k)
                  {
                    if (*(_QWORD *)v91 != v18)
                      objc_enumerationMutation(v15);
                    if (isSupportedStereoMultiviewCodec(objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * k), "unsignedIntValue")))
                    {
                      v3 = 1;
                      v4 = 1;
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
                }
                while (v17);
              }
            }
            if ((v11 & 1) != 0)
              v20 = v4;
            else
              v20 = 1;
            if (((v3 | v10 ^ 1) & 1) == 0)
              v4 = v20;
            i = extensionKey;
          }
        }
        v74 = (CFStringRef)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
      }
      while (v74);
    }
    v21 = v4 & 1;
  }
  else
  {
    v3 = 0;
    v21 = 0;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v57 = -[AVAsset tracksWithMediaType:](v56->_asset, "tracksWithMediaType:", CFSTR("vide"));
  v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
  if (!v59)
  {
    obja = 0;
    goto LABEL_76;
  }
  obja = 0;
  v58 = *(_QWORD *)v87;
  extensionKeya = (const __CFString *)*MEMORY[0x1E0CA4A38];
  v22 = (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
  v75 = (const __CFString *)*MEMORY[0x1E0CA4A40];
  v73 = (const __CFString *)*MEMORY[0x1E0CA4A80];
  v67 = *MEMORY[0x1E0CA4AB0];
  v62 = *MEMORY[0x1E0CA4AB8];
  v66 = (const __CFString *)*MEMORY[0x1E0CA2208];
  v65 = (const __CFString *)*MEMORY[0x1E0CA2250];
  v64 = (const __CFString *)*MEMORY[0x1E0CA2200];
  v63 = (const __CFString *)*MEMORY[0x1E0CA4A60];
  v61 = *MEMORY[0x1E0CA4AA8];
  do
  {
    v23 = 0;
    do
    {
      if (*(_QWORD *)v87 != v58)
        objc_enumerationMutation(v57);
      v60 = v23;
      v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v23), "formatDescriptions");
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v71 = v24;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v83;
        do
        {
          for (m = 0; m != v26; ++m)
          {
            if (*(_QWORD *)v83 != v27)
              objc_enumerationMutation(v71);
            v29 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v82 + 1) + 8 * m);
            if (v29)
            {
              Extension = CMFormatDescriptionGetExtension(*(CMFormatDescriptionRef *)(*((_QWORD *)&v82 + 1) + 8 * m), extensionKeya);
              v31 = CMFormatDescriptionGetExtension(v29, v75);
              v33 = Extension == v22 && v31 == v22;
              MediaSubType = CMFormatDescriptionGetMediaSubType(v29);
              v35 = (void *)CMFormatDescriptionGetExtension(v29, v73);
              if (v35
                && ((v36 = v35, objc_msgSend(v35, "isEqual:", v67))
                 || (objc_msgSend(v36, "isEqual:", v62) & 1) != 0))
              {
                v21 = v33 | v21;
LABEL_58:
                if ((v3 & 1) == 0)
                {
LABEL_57:
                  v3 = 0;
                  continue;
                }
              }
              else
              {
                if (!isSupportedStereoMultiviewCodec(MediaSubType))
                  goto LABEL_58;
                v37 = FigVideoFormatDescriptionContainsStereoMultiviewVideo() != 0;
                v21 = v37 | v21;
                if (((v37 | v3) & 1) == 0)
                  goto LABEL_57;
              }
              v38 = v21;
              v39 = CMFormatDescriptionGetExtension(v29, v66);
              v40 = CMFormatDescriptionGetExtension(v29, v65);
              v41 = CMFormatDescriptionGetExtension(v29, v64);
              v42 = (void *)CMFormatDescriptionGetExtension(v29, v63);
              if (v42)
                v43 = objc_msgSend(v42, "isEqual:", v61);
              else
                v43 = 1;
              obja = 0;
              if (v33 && v39 && v40)
              {
                if (v41)
                  v44 = v43;
                else
                  v44 = 0;
                obja = v44;
              }
              v21 = v38;
              v3 = 1;
              continue;
            }
          }
          v26 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
        }
        while (v26);
      }
      v23 = v60 + 1;
    }
    while (v60 + 1 != v59);
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
  }
  while (v59);
LABEL_76:
  v45 = -[AVAsset metadata](v56->_asset, "metadata");
  if (-[NSArray count](v45, "count"))
  {
    v46 = +[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v45, CFSTR("mdta/com.apple.private.content-type"));
    if (-[NSArray count](v46, "count")
      && (v80 = 0u,
          v81 = 0u,
          v78 = 0u,
          v79 = 0u,
          (v47 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v78, v102, 16)) != 0))
    {
      v48 = v47;
      v49 = *(_QWORD *)v79;
      while (2)
      {
        for (n = 0; n != v48; ++n)
        {
          if (*(_QWORD *)v79 != v49)
            objc_enumerationMutation(v46);
          if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * n), "stringValue"), "isEqualToString:", CFSTR("Fully Immersive")) & 1) != 0)
          {
            v51 = 1;
            goto LABEL_90;
          }
        }
        v48 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
        v51 = 0;
        if (v48)
          continue;
        break;
      }
    }
    else
    {
      v51 = 0;
    }
LABEL_90:
    if (-[NSArray count](+[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v45, CFSTR("mdta/com.apple.quicktime.aime-data")), "count"))
    {
      v52 = 1;
    }
    else
    {
      v52 = v51;
    }
  }
  else
  {
    v52 = 0;
  }
  v53 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = v53;
  if ((v21 & 1) == 0)
  {
    if ((v3 & 1) == 0)
      goto LABEL_95;
LABEL_101:
    objc_msgSend(v54, "addObject:", CFSTR("AVAssetPlaybackConfigurationOptionStereoMultiviewVideo"));
    if (!v52)
      goto LABEL_97;
LABEL_96:
    objc_msgSend(v54, "addObject:", CFSTR("AVAssetPlaybackConfigurationOptionAppleImmersiveVideo"));
    goto LABEL_97;
  }
  objc_msgSend(v53, "addObject:", CFSTR("AVAssetPlaybackConfigurationOptionStereoVideo"));
  if ((v3 & 1) != 0)
    goto LABEL_101;
LABEL_95:
  if (v52)
    goto LABEL_96;
LABEL_97:
  if ((obja & 1) != 0)
    objc_msgSend(v54, "addObject:", CFSTR("AVAssetPlaybackConfigurationOptionSpatialVideo"));
  return v54;
}

- (void)loadPlaybackConfigurationOptionsWithCompletionHandler:(void *)completionHandler
{
  AVAsset *asset;
  _QWORD v4[6];

  asset = self->_asset;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__AVAssetPlaybackAssistant_loadPlaybackConfigurationOptionsWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E3032448;
  v4[4] = self;
  v4[5] = completionHandler;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E3093B20, v4);
}

uint64_t __82__AVAssetPlaybackAssistant_loadPlaybackConfigurationOptionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_playbackConfigurationOptions"));
}

@end
