@implementation CFXClip

- (CFXClip)init
{
  CFXClip *v2;
  CFXClip *v3;
  NSString *uuid;
  JFXMediaItem *mediaItem;
  NSMutableArray *filters;
  NSMutableArray *overlays;
  NSMutableArray *animojis;
  PVTransformAnimation *transformAnimation;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CFXClip;
  v2 = -[CFXClip init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    uuid = v2->_uuid;
    v2->_uuid = 0;

    *(_QWORD *)&v3->_presentationTime = 0;
    v3->_mediaStartOffset = 0;
    mediaItem = v3->_mediaItem;
    v3->_mediaItem = 0;

    filters = v3->_filters;
    v3->_filters = 0;

    overlays = v3->_overlays;
    v3->_overlays = 0;

    animojis = v3->_animojis;
    v3->_animojis = 0;

    transformAnimation = v3->_transformAnimation;
    v3->_transformAnimation = 0;

    v3->_transformInitialStartOffset = 0;
  }
  return v3;
}

- (CFXClip)initWithMediaItem:(id)a3
{
  id v5;
  CFXClip *v6;
  void *v7;
  uint64_t v8;
  NSString *uuid;

  v5 = a3;
  v6 = -[CFXClip init](self, "init");
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v8;

    objc_storeStrong((id *)&v6->_mediaItem, a3);
  }

  return v6;
}

- (id)stringForMediaType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("What MediaType ? please update stringForMediaType if you added new type");
  else
    return off_24EE58CA0[a3];
}

- (id)cfx_clipType
{
  return -[CFXClip stringForMediaType:](self, "stringForMediaType:", -[CFXClip mediaType](self, "mediaType"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *uuid;
  uint64_t presentationTime;
  uint64_t duration;
  void *v8;
  uint64_t mediaStartOffset;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CFXClip *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v54.receiver = self;
  v54.super_class = (Class)CFXClip;
  -[CFXClip description](&v54, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  uuid = self->_uuid;
  presentationTime = self->_presentationTime;
  duration = self->_duration;
  -[CFXClip cfx_clipType](self, "cfx_clipType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mediaStartOffset = self->_mediaStartOffset;
  -[CFXClip metadataURL](self, "metadataURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\r\tuuid: %@\r\tpresentationTime: %d\r\tduration: %d\r\tMediaType: %@\r\tmediaStartOffset: %d\r\tmetadata url: %@\r\tMedia: %@"), uuid, presentationTime, duration, v8, mediaStartOffset, v10, self->_mediaItem);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v41 = self;
  -[CFXClip filters](self, "filters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v51;
    do
    {
      v17 = 0;
      v18 = v12;
      do
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v13);
        v19 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v17), "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("\r\t%@"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingString:", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v17;
        v18 = v12;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v15);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[CFXClip overlays](v41, "overlays");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v47;
    do
    {
      v26 = 0;
      v27 = v12;
      do
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v22);
        v28 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v26), "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("\r\t%@"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAppendingString:", v30);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v26;
        v27 = v12;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v24);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[CFXClip animojis](v41, "animojis");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      v35 = 0;
      v36 = v12;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v37 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v35), "description");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("\r\t%@"), v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringByAppendingString:", v39);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v35;
        v36 = v12;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v33);
  }

  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v7;

  *(_DWORD *)(v5 + 8) = self->_presentationTime;
  *(_DWORD *)(v5 + 12) = self->_duration;
  *(_DWORD *)(v5 + 16) = self->_mediaStartOffset;
  v9 = -[JFXMediaItem copyWithZone:](self->_mediaItem, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  objc_storeStrong((id *)(v5 + 40), self->_metadataURL);
  v11 = -[NSMutableArray mutableDeepCopy](self->_filters, "mutableDeepCopy");
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[NSMutableArray mutableDeepCopy](self->_overlays, "mutableDeepCopy");
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = -[NSMutableArray mutableDeepCopy](self->_animojis, "mutableDeepCopy");
  v16 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v15;

  v17 = -[NSData copy](self->_originalAnimojiDataRepresentation, "copy");
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  *(_QWORD *)(v5 + 56) = self->_originalAnimojiVersionNumber;
  if (self->_transformAnimation)
  {
    v19 = objc_alloc(MEMORY[0x24BE790C8]);
    -[PVTransformAnimation animationData](self->_transformAnimation, "animationData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    v22 = objc_msgSend(v19, "initWithAnimation:", v21);
    v23 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v22;

    *(_DWORD *)(v5 + 20) = self->_transformInitialStartOffset;
    -[PVTransformAnimation aspectRatio](self->_transformAnimation, "aspectRatio");
    objc_msgSend(*(id *)(v5 + 64), "setAspectRatio:");
  }
  else
  {
    v24 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = 0;

    *(_DWORD *)(v5 + 20) = 0;
  }
  JFXLog_DebugClip();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXClip uuid](self, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412546;
    v30 = v26;
    v31 = 2112;
    v32 = v27;
    _os_log_impl(&dword_2269A9000, v25, OS_LOG_TYPE_DEFAULT, "[CFXClip copyWithZone:] %@ -> %@", (uint8_t *)&v29, 0x16u);

  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  CFXClip *v4;
  CFXClip *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CFXClip *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CFXClip uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXClip uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uuid, "hash");
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugClip();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXClip uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "[CFXClip dealloc] %@", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)CFXClip;
  -[CFXClip dealloc](&v5, sel_dealloc);
}

+ (id)defaultClip
{
  CFXClip *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(CFXClip);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXClip setUuid:](v2, "setUuid:", v4);

  return v2;
}

+ (void)cfx_createVideoClipWithLocalURL:(id)a3 effectStack:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  +[CFXClip defaultClip](CFXClip, "defaultClip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__CFXClip_cfx_createVideoClipWithLocalURL_effectStack_completionHandler___block_invoke;
  v14[3] = &unk_24EE58BE0;
  v15 = v10;
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v10;
  +[JFXVideoMediaItem videoMediaItemWithLocalURL:delegate:completionHandler:](JFXVideoMediaItem, "videoMediaItemWithLocalURL:delegate:completionHandler:", v9, 0, v14);

}

void __73__CFXClip_cfx_createVideoClipWithLocalURL_effectStack_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "setMediaItem:", a2);
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDuration:", objc_msgSend(v6, "durationAt30fps"));

  objc_msgSend(*(id *)(a1 + 32), "addEffectStack:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)cfx_createStillClipPreviewWithLocalURL:(id)a3 maximumImageDimension:(unint64_t)a4 effectStack:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  v14 = v13;
  if (a4)
  {
    objc_msgSend(v13, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("proxyImage.jpg"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    objc_msgSend(a1, "cfx_writeProxyImageToURL:fromImageAtURL:maximumImageDimension:outColorSpace:", v16, v14, a4, &v27);
    a4 = (unint64_t)v27;

  }
  else
  {
    v16 = v13;
  }
  +[CFXClip defaultClip](CFXClip, "defaultClip");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __102__CFXClip_cfx_createStillClipPreviewWithLocalURL_maximumImageDimension_effectStack_completionHandler___block_invoke;
  v22[3] = &unk_24EE58C08;
  v23 = (id)a4;
  v24 = v17;
  v25 = v11;
  v26 = v12;
  v18 = v12;
  v19 = v11;
  v20 = v17;
  v21 = (id)a4;
  +[JFXStillMediaItem stillMediaItemWithLocalURL:delegate:completionHandler:](JFXStillMediaItem, "stillMediaItemWithLocalURL:delegate:completionHandler:", v16, 0, v22);

}

void __102__CFXClip_cfx_createStillClipPreviewWithLocalURL_maximumImageDimension_effectStack_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v6, "setImageColorSpace:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setMediaItem:", v6);

  objc_msgSend(*(id *)(a1 + 40), "setDuration:", 1);
  objc_msgSend(*(id *)(a1 + 40), "addEffectStack:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (BOOL)cfx_writeProxyImageToURL:(id)a3 fromImageAtURL:(id)a4 maximumImageDimension:(unint64_t)a5 outColorSpace:(id *)a6
{
  const __CFURL *v9;
  CGImageSource *v10;
  CGImageSource *v11;
  CGImage *ImageAtIndex;
  CGImage *v13;
  CGColorSpaceRef ColorSpace;
  id v15;
  const CGImageMetadata *v16;
  CGImageDestinationRef v17;
  CGImageDestination *v18;
  uint64_t v19;
  void *v20;
  const __CFDictionary *v21;
  BOOL v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v9 = (const __CFURL *)a3;
  v10 = CGImageSourceCreateWithURL((CFURLRef)a4, 0);
  if (!v10)
    goto LABEL_10;
  v11 = v10;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, 0);
  if (!ImageAtIndex)
  {
    CFRelease(v11);
LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
  v13 = ImageAtIndex;
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  if (ColorSpace)
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromCGColorSpace:", ColorSpace);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a6 = v15;

  }
  v16 = CGImageSourceCopyMetadataAtIndex(v11, 0, 0);
  v17 = CGImageDestinationCreateWithURL(v9, (CFStringRef)*MEMORY[0x24BDB1C28], 1uLL, 0);
  if (!v17)
  {
    v22 = 0;
    if (!v16)
      goto LABEL_8;
    goto LABEL_7;
  }
  v18 = v17;
  v19 = *MEMORY[0x24BDD9218];
  v24[0] = *MEMORY[0x24BDD9220];
  v24[1] = v19;
  v25[0] = &unk_24EE9C130;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CGImageDestinationAddImageAndMetadata(v18, v13, v16, v21);
  v22 = CGImageDestinationFinalize(v18);
  CFRelease(v18);

  if (v16)
LABEL_7:
    CFRelease(v16);
LABEL_8:
  CGImageRelease(v13);
  CFRelease(v11);
LABEL_11:

  return v22;
}

+ (void)createClipWithLocalURL:(id)a3 effectStack:(id)a4 isVideo:(BOOL)a5 maximumImageDimension:(unint64_t)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v11;
  void *v12;
  id *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v11 = a7;
  v12 = v11;
  if (v8)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke;
    v16[3] = &unk_24EE58C30;
    v13 = &v17;
    v17 = v11;
    +[CFXClip cfx_createVideoClipWithLocalURL:effectStack:completionHandler:](CFXClip, "cfx_createVideoClipWithLocalURL:effectStack:completionHandler:", a3, a4, v16);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke_2;
    v14[3] = &unk_24EE58C30;
    v13 = &v15;
    v15 = v11;
    +[CFXClip cfx_createStillClipPreviewWithLocalURL:maximumImageDimension:effectStack:completionHandler:](CFXClip, "cfx_createStillClipPreviewWithLocalURL:maximumImageDimension:effectStack:completionHandler:", a3, a6, a4, v14);
  }

}

uint64_t __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__CFXClip_createClipWithLocalURL_effectStack_isVideo_maximumImageDimension_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)createCaptureClip
{
  CFXClip *v2;
  JTCaptureMediaItem *v3;
  CFXClip *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = [CFXClip alloc];
  v3 = objc_alloc_init(JTCaptureMediaItem);
  v4 = -[CFXClip initWithMediaItem:](v2, "initWithMediaItem:", v3);

  JFXLog_DebugClip();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXClip uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "[CFXClip createCaptureClip] %@", (uint8_t *)&v8, 0xCu);

  }
  return v4;
}

- (BOOL)isAssetUnavailable
{
  return -[CFXClip cfx_isAssetMissing](self, "cfx_isAssetMissing")
      || -[CFXClip cfx_isAssetInTrash](self, "cfx_isAssetInTrash");
}

- (BOOL)cfx_isAssetMissing
{
  void *v2;
  BOOL v3;

  -[CFXClip mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaState") == 2;

  return v3;
}

- (BOOL)cfx_isAssetInTrash
{
  void *v2;
  BOOL v3;

  -[CFXClip mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaState") == 3;

  return v3;
}

- (void)updateTransformPresentationTimeRange
{
  void *v3;
  int v4;
  int32_t v5;
  int presentationTime;
  PVTransformAnimation *transformAnimation;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTimeRange v17;
  CMTimeRange range1;
  CMTimeRange range2;
  CMTime duration;
  CMTime start;
  CMTimeRange v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_transformAnimation)
  {
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "timeScale");

    v5 = v4 ? v4 : 30;
    presentationTime = self->_presentationTime;
    memset(&v22, 0, sizeof(v22));
    CMTimeMake(&start, -[CFXClip transformInitialStartOffset](self, "transformInitialStartOffset")+ presentationTime- -[CFXClip mediaStartOffset](self, "mediaStartOffset"), v5);
    CMTimeMake(&duration, self->_duration, v5);
    CMTimeRangeMake(&v22, &start, &duration);
    transformAnimation = self->_transformAnimation;
    if (transformAnimation)
      -[PVTransformAnimation presentationTimeRange](transformAnimation, "presentationTimeRange");
    else
      memset(&range2, 0, sizeof(range2));
    range1 = v22;
    if (!CMTimeRangeEqual(&range1, &range2))
    {
      v17 = v22;
      -[PVTransformAnimation setPresentationTimeRange:](self->_transformAnimation, "setPresentationTimeRange:", &v17);
      -[CFXClip effectsOfType:](self, "effectsOfType:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setTransformAnimation:", self->_transformAnimation);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
        }
        while (v10);
      }

    }
  }
}

- (void)setDuration:(int)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[CFXClip updateTransformPresentationTimeRange](self, "updateTransformPresentationTimeRange");
  }
}

- (void)setPresentationTime:(int)a3
{
  if (self->_presentationTime != a3)
  {
    self->_presentationTime = a3;
    -[CFXClip updateTransformPresentationTimeRange](self, "updateTransformPresentationTimeRange");
  }
}

- (BOOL)isAssetLoaded
{
  void *v2;
  BOOL v3;

  -[CFXClip mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaLoadState") == 1;

  return v3;
}

- (BOOL)isStill
{
  return -[CFXClip mediaType](self, "mediaType") == 2;
}

- (BOOL)isVideo
{
  return -[CFXClip mediaType](self, "mediaType") == 1;
}

- (NSMutableArray)filters
{
  NSMutableArray *filters;
  NSMutableArray *v4;
  NSMutableArray *v5;

  filters = self->_filters;
  if (!filters)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_filters;
    self->_filters = v4;

    filters = self->_filters;
  }
  return filters;
}

- (NSMutableArray)overlays
{
  NSMutableArray *overlays;
  NSMutableArray *v4;
  NSMutableArray *v5;

  overlays = self->_overlays;
  if (!overlays)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_overlays;
    self->_overlays = v4;

    overlays = self->_overlays;
  }
  return overlays;
}

- (NSMutableArray)animojis
{
  NSMutableArray *animojis;
  NSMutableArray *v4;
  NSMutableArray *v5;

  animojis = self->_animojis;
  if (!animojis)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_animojis;
    self->_animojis = v4;

    animojis = self->_animojis;
  }
  return animojis;
}

- (int64_t)mediaType
{
  void *v2;
  int64_t v3;

  -[CFXClip mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  return v3;
}

- (void)setMediaItem:(id)a3
{
  id v5;
  int v6;

  objc_storeStrong((id *)&self->_mediaItem, a3);
  v5 = a3;
  v6 = objc_msgSend(v5, "durationAt30fps");

  self->_duration = v6;
}

- (CGSize)mediaSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[CFXClip mediaType](self, "mediaType") == 2)
  {
    -[CFXClip mediaItem](self, "mediaItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeForQuality:", 0);
  }
  else
  {
    if (-[CFXClip mediaType](self, "mediaType") != 1)
    {
      v6 = *MEMORY[0x24BDBF148];
      v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
      goto LABEL_7;
    }
    -[CFXClip mediaItem](self, "mediaItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "naturalSizeWithTransform");
  }
  v6 = v4;
  v7 = v5;

LABEL_7:
  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)mediaInterfaceOrientationForDisplay
{
  void *v2;
  int64_t v3;

  -[CFXClip mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceOrientationForDisplay");

  return v3;
}

- (void)setMediaInterfaceOrientationForDisplay:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CFXClip mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterfaceOrientationForDisplay:", a3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CFXClip animojis](self, "animojis", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setCaptureInterfaceOrientation:", a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setTransformAnimation:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_transformAnimation, a3);
  v5 = a3;
  -[PVTransformAnimation setAspectRatio:](self->_transformAnimation, "setAspectRatio:", multiplierForAspectRatio(-[CFXClip playableAspectRatio](self, "playableAspectRatio")));

  -[CFXClip updateTransformPresentationTimeRange](self, "updateTransformPresentationTimeRange");
}

- (id)cfx_effectsOfType:(int)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
      v3 = 72;
      break;
    case 7:
      v3 = 88;
      break;
    case 2:
      v3 = 80;
      break;
    default:
      return 0;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)cfx_addEffect:(id)a3
{
  int v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "type");
  switch(v4)
  {
    case 7:
      -[CFXClip animojis](self, "animojis");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v15);

      if ((v9 & 1) == 0)
      {
        if (-[CFXClip mediaInterfaceOrientationForDisplay](self, "mediaInterfaceOrientationForDisplay"))
          v10 = -[CFXClip mediaInterfaceOrientationForDisplay](self, "mediaInterfaceOrientationForDisplay");
        else
          v10 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
        objc_msgSend(v15, "setCaptureInterfaceOrientation:", v10);
        -[CFXClip animojis](self, "animojis");
        v14 = objc_claimAutoreleasedReturnValue();
        v13 = v15;
        v5 = (void *)v14;
        goto LABEL_15;
      }
      break;
    case 2:
      -[CFXClip overlays](self, "overlays");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v15);

      if ((v12 & 1) == 0)
      {
        -[CFXClip overlays](self, "overlays");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      break;
    case 1:
      -[CFXClip filters](self, "filters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v15) & 1) != 0)
      {
LABEL_16:

        break;
      }
      v6 = -[CFXClip mediaType](self, "mediaType");

      if (v6 != 3)
      {
        -[CFXClip filters](self, "filters");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v5 = (void *)v7;
        v13 = v15;
LABEL_15:
        objc_msgSend(v5, "addObject:", v13);
        goto LABEL_16;
      }
      break;
  }

}

- (void)addEffectStack:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __26__CFXClip_addEffectStack___block_invoke;
  v3[3] = &unk_24EE58C58;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __26__CFXClip_addEffectStack___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "cfx_addEffect:", v3);

}

- (void)removeEffect:(id)a3
{
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "type");
  switch(v4)
  {
    case 7:
      -[CFXClip animojis](self, "animojis");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v13);

      if (v9)
      {
        -[CFXClip animojis](self, "animojis");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      break;
    case 2:
      -[CFXClip overlays](self, "overlays");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v13);

      if (v11)
      {
        -[CFXClip overlays](self, "overlays");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      break;
    case 1:
      -[CFXClip filters](self, "filters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v13);

      if (v6)
      {
        -[CFXClip filters](self, "filters");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v12 = v7;
        objc_msgSend(v7, "removeObject:", v13);

      }
      break;
  }

}

- (void)removeAllEffects
{
  uint64_t i;

  for (i = 0; i != 9; ++i)
    -[CFXClip cfx_removeAllEffectsOfType:](self, "cfx_removeAllEffectsOfType:", i);
}

- (BOOL)cfx_removeAllEffectsOfType:(int)a3
{
  void *v3;
  uint64_t v4;

  -[CFXClip cfx_effectsOfType:](self, "cfx_effectsOfType:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
    objc_msgSend(v3, "removeAllObjects");

  return v4 != 0;
}

- (id)effectsOfType:(int)a3
{
  void *v3;
  void *v4;

  -[CFXClip cfx_effectsOfType:](self, "cfx_effectsOfType:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)effectStack
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CFXClip effectsOfType:](self, "effectsOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[CFXClip effectsOfType:](self, "effectsOfType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[CFXClip effectsOfType:](self, "effectsOfType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (id)effectStackExcludingType:(int)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3 == 1
    || (-[CFXClip effectsOfType:](self, "effectsOfType:", 1),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "addObjectsFromArray:", v6),
        v6,
        a3 != 2))
  {
    -[CFXClip effectsOfType:](self, "effectsOfType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  return v5;
}

- (BOOL)hasPlayableEffectOfType:(int)a3
{
  void *v3;
  uint64_t v4;

  if (a3 == 7)
    -[CFXClip cfx_effectsOfType:](self, "cfx_effectsOfType:");
  else
    -[CFXClip playableEffectsOfType:](self, "playableEffectsOfType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4 != 0;
}

- (int64_t)playableAspectRatio
{
  void *v2;
  double v3;
  double v4;
  unint64_t v5;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameSize");
  v5 = aspectRatioForSize(v3, v4);

  return v5;
}

- (int64_t)playableAspectRatioPreservationMode
{
  return 0;
}

- (CGRect)playableRectInOutputSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = rectWithAspectRatioAndPreservationModeInRectWithSize(-[CFXClip playableAspectRatio](self, "playableAspectRatio"), -[CFXClip playableAspectRatioPreservationMode](self, "playableAspectRatioPreservationMode"), a3.width, a3.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)playableScaleInOutputSize:(CGSize)a3
{
  double height;
  double width;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  v6 = PVViewContentModeFromAspectRatioPreservationMode(-[CFXClip playableAspectRatioPreservationMode](self, "playableAspectRatioPreservationMode"));
  v7 = multiplierForAspectRatio(-[CFXClip playableAspectRatio](self, "playableAspectRatio"));
  v8 = 1.0;
  if (!v6)
    goto LABEL_22;
  if (v7 > -0.0000001)
  {
    v8 = 1.0;
    if (v7 < 0.0000001)
      goto LABEL_22;
  }
  v9 = height * v7;
  if (v6 > 2)
  {
    if (v6 == 3 || v6 == 13)
    {
      v7 = width;
    }
    else if (v6 == 14)
    {
      v7 = height * v7;
    }
    goto LABEL_21;
  }
  if (v6 == 1)
  {
    if (width <= height)
    {
      v10 = height;
      if (v9 < width)
        v10 = width / v7;
    }
    else
    {
      v10 = width / v7;
      if (width / v7 < height)
        v10 = height;
    }
    goto LABEL_20;
  }
  if (v6 == 2)
  {
    v10 = width / v7;
    if (width / v7 > height)
      v10 = height;
LABEL_20:
    v7 = v7 * v10;
  }
LABEL_21:
  v8 = v7 / v9;
LABEL_22:
  if (v8 >= 0.0000001 || v8 <= -0.0000001)
    return v8;
  else
    return 1.0;
}

- (CGRect)rectFromNormalizedPlayableRect:(CGRect)a3 inOutputSize:(CGSize)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CFXClip playableRectInOutputSize:](self, "playableRectInOutputSize:", a4.width, a4.height);
  v9 = x * v8;
  v11 = y * v10;
  v12 = width * v8;
  v13 = height * v10;
  v15 = v14 + v9;
  v17 = v16 + v11;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v17;
  result.origin.x = v15;
  return result;
}

- (CGSize)playableMediaSizeWithTransform
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = -[CFXClip mediaType](self, "mediaType");
  if (v3 == 2)
  {
    -[CFXClip mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeForQuality:", 0);
  }
  else if (v3 == 1)
  {
    -[CFXClip mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "naturalSizeWithTransform");
  }
  else
  {
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameSize");
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int)playableMediaContentMode
{
  void *v2;
  int v3;

  -[CFXClip mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playableMediaContentMode");

  return v3;
}

- (BOOL)shouldRenderVideoAsBlack
{
  return 0;
}

- (BOOL)hasMetadataAsset
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[CFXClip metadataURL](self, "metadataURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if ((v5 & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (JFXMediaReaderCreationAVAssetTrackAttributes)arMetadataReaderAssetTrackAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  JFXMediaReaderCreationAVAssetTrackAttributes *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!-[CFXClip hasMetadataAsset](self, "hasMetadataAsset"))
    return (JFXMediaReaderCreationAVAssetTrackAttributes *)0;
  -[CFXClip metadataURL](self, "metadataURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDB26C8];
  v10 = *MEMORY[0x24BDB21C0];
  v11[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLAssetWithURL:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[JFXVideoWriter META_ARMetadataTrackForAsset:](JFXVideoWriter, "META_ARMetadataTrackForAsset:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[JFXMediaReaderCreationAVAssetTrackAttributes initWithAssetTrack:]([JFXMediaReaderCreationAVAssetTrackAttributes alloc], "initWithAssetTrack:", v7);
  else
    v8 = 0;

  return v8;
}

- (JFXMediaReaderCreationAVAssetTrackAttributes)depthDataReaderAssetTrackAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  JFXMediaReaderCreationAVAssetTrackAttributes *v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (!-[CFXClip hasMetadataAsset](self, "hasMetadataAsset"))
    return (JFXMediaReaderCreationAVAssetTrackAttributes *)0;
  -[CFXClip metadataURL](self, "metadataURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDB26C8];
  v22 = *MEMORY[0x24BDB21C0];
  v23[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLAssetWithURL:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = *MEMORY[0x24BDB1D50];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__CFXClip_depthDataReaderAssetTrackAttributes__block_invoke;
  v13[3] = &unk_24EE58C80;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v6, "loadTracksWithMediaType:completionHandler:", v8, v13);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend((id)v17[5], "count"))
  {
    objc_msgSend((id)v17[5], "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[JFXMediaReaderCreationAVAssetTrackAttributes initWithAssetTrack:]([JFXMediaReaderCreationAVAssetTrackAttributes alloc], "initWithAssetTrack:", v10);

  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __46__CFXClip_depthDataReaderAssetTrackAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (int)presentationTime
{
  return self->_presentationTime;
}

- (int)duration
{
  return self->_duration;
}

- (int)mediaStartOffset
{
  return self->_mediaStartOffset;
}

- (JFXMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMetadataURL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataURL, a3);
}

- (NSData)originalAnimojiDataRepresentation
{
  return self->_originalAnimojiDataRepresentation;
}

- (void)setOriginalAnimojiDataRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_originalAnimojiDataRepresentation, a3);
}

- (unint64_t)originalAnimojiVersionNumber
{
  return self->_originalAnimojiVersionNumber;
}

- (void)setOriginalAnimojiVersionNumber:(unint64_t)a3
{
  self->_originalAnimojiVersionNumber = a3;
}

- (PVTransformAnimation)transformAnimation
{
  return self->_transformAnimation;
}

- (int)transformInitialStartOffset
{
  return self->_transformInitialStartOffset;
}

- (void)setTransformInitialStartOffset:(int)a3
{
  self->_transformInitialStartOffset = a3;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (void)setOverlays:(id)a3
{
  objc_storeStrong((id *)&self->_overlays, a3);
}

- (void)setAnimojis:(id)a3
{
  objc_storeStrong((id *)&self->_animojis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojis, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_transformAnimation, 0);
  objc_storeStrong((id *)&self->_originalAnimojiDataRepresentation, 0);
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
