@implementation MUImageReader

- (id)readArchivedModelDataFromImageData:(id)a3
{
  CGDataProviderRef v4;
  CGDataProviderRef v5;
  void *v6;

  v4 = CGDataProviderCreateWithCFData((CFDataRef)a3);
  if (v4)
  {
    v5 = v4;
    -[MUImageReader _readAnnotationsFromDataProvider:](self, "_readAnnotationsFromDataProvider:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)readArchivedModelDataFromImageURL:(id)a3
{
  CGDataProviderRef v4;
  CGDataProviderRef v5;
  void *v6;

  v4 = CGDataProviderCreateWithURL((CFURLRef)a3);
  if (v4)
  {
    v5 = v4;
    -[MUImageReader _readAnnotationsFromDataProvider:](self, "_readAnnotationsFromDataProvider:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)readAnnotationsFromArchivedModelData:(id)a3 toController:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  objc_msgSend(a4, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "populateFromArchivedPageModelControllers:", v5);

  return v7;
}

- (id)_readAnnotationsFromDataProvider:(CGDataProvider *)a3
{
  CGImageSource *v4;
  CGImageSource *v5;
  CGImageMetadataRef v6;
  CGImageMetadataRef v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = CGImageSourceCreateWithDataProvider(a3, 0);
  if (v4)
  {
    v5 = v4;
    v6 = CGImageSourceCopyMetadataAtIndex(v4, 0, 0);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:enc_model"), kMetadataPrefixAnnotationKit);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImageReader _readDataFromTagAtPath:inMetadata:](self, "_readDataFromTagAtPath:inMetadata:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUPayloadEncryption sharedInstance](MUPayloadEncryption, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decryptData:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        NSLog(CFSTR("Did not find enc_model, attempting to read unencrypted model"));
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:model"), kMetadataPrefixAnnotationKit);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUImageReader _readDataFromTagAtPath:inMetadata:](self, "_readDataFromTagAtPath:inMetadata:", v12, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      CFRelease(v7);

    }
    else
    {
      v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)readBaseImageFromData:(id)a3 baseWasValid:(BOOL *)a4
{
  const __CFData *v6;
  CGDataProviderRef v7;
  CGDataProviderRef v8;
  void *v9;

  v6 = (const __CFData *)a3;
  v7 = CGDataProviderCreateWithCFData(v6);
  if (v7)
  {
    v8 = v7;
    -[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:](self, "_readBaseImageFromDataProvider:providerSource:baseWasValid:", v7, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)readBaseImageFromImageAtURL:(id)a3 baseWasValid:(BOOL *)a4
{
  const __CFURL *v6;
  CGDataProviderRef v7;
  CGDataProviderRef v8;
  void *v9;

  v6 = (const __CFURL *)a3;
  v7 = CGDataProviderCreateWithURL(v6);
  if (v7)
  {
    v8 = v7;
    -[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:](self, "_readBaseImageFromDataProvider:providerSource:baseWasValid:", v7, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_readBaseImageFromDataProvider:(CGDataProvider *)a3 providerSource:(id)a4 baseWasValid:(BOOL *)a5
{
  CGImageSource *v8;
  CGImageSource *v9;
  CGImageMetadataRef v10;
  CGImageMetadataRef v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFData *v15;
  void *v16;
  CGImageSource *v17;
  CGImageSource *v18;
  CGImageRef ImageAtIndex;
  __CFData *v20;
  const __CFString *Type;
  CGImageDestination *v22;
  CGImageMetadataRef v23;
  const CGImageMetadata *v24;
  CGImageMetadata *MutableCopy;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  const __CFDictionary *v30;
  __CFData *v31;
  CFDataRef v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = CGImageSourceCreateWithDataProvider(a3, 0);
  v9 = v8;
  if (v8)
  {
    v10 = CGImageSourceCopyMetadataAtIndex(v8, 0, 0);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:enc_base_image"), kMetadataPrefixAnnotationKit);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImageReader _readDataFromTagAtPath:inMetadata:](self, "_readDataFromTagAtPath:inMetadata:", v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUPayloadEncryption sharedInstance](MUPayloadEncryption, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "decryptData:", v13);
      v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        NSLog(CFSTR("Did not find enc_base_image, attempting to read base_image"));
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:base_image"), kMetadataPrefixAnnotationKit);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUImageReader _readDataFromTagAtPath:inMetadata:](self, "_readDataFromTagAtPath:inMetadata:", v16, v11);
        v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      }
      CFRelease(v11);

      if (v15)
      {
        v17 = CGImageSourceCreateWithData(v15, 0);
        if (v17)
        {
          v18 = v17;
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v17, 0, 0);
          if (ImageAtIndex)
          {
            CFRelease(ImageAtIndex);
            CFRelease(v18);
            NSLog(CFSTR("%s found valid base image."), "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
            if (a5)
              *a5 = 1;
            goto LABEL_23;
          }
          CFRelease(v18);
        }
        if (a5)
          *a5 = 0;
        objc_msgSend(MEMORY[0x24BDBCEC8], "data");
        v20 = (__CFData *)objc_claimAutoreleasedReturnValue();
        Type = CGImageSourceGetType(v9);
        v22 = CGImageDestinationCreateWithData(v20, Type, 1uLL, 0);
        v23 = CGImageSourceCopyMetadataAtIndex(v9, 0, 0);
        if (v23)
        {
          v24 = v23;
          NSLog(CFSTR("%s: Base image metadata was invalid. Removing base image and annotation model metadata."), "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
          MutableCopy = CGImageMetadataCreateMutableCopy(v24);
          CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, 0);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:enc_model"), kMetadataPrefixAnnotationKit);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v26);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:model"), kMetadataPrefixAnnotationKit);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v27);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:enc_base_image"), kMetadataPrefixAnnotationKit);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v28);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:base_image"), kMetadataPrefixAnnotationKit);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v29);
          v34 = *MEMORY[0x24BDD9230];
          v35[0] = MutableCopy;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
          v30 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGImageDestinationCopyImageSource(v22, v9, v30, 0);
          v31 = v20;

          if (MutableCopy)
            CFRelease(MutableCopy);

          CFRelease(v24);
          v15 = v31;
          if (!v22)
            goto LABEL_22;
        }
        else
        {
          NSLog(CFSTR("%s: Base image metadata present but invalid. Returning passed-in image data."), "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
          v33 = CGDataProviderCopyData(a3);

          v15 = v33;
          if (!v22)
            goto LABEL_22;
        }
        CFRelease(v22);
LABEL_22:

LABEL_23:
        CFRelease(v9);
        return v15;
      }
    }
  }
  NSLog(CFSTR("%s: Base image does not contain metadata. Returning passed-in image data."), "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
  v15 = CGDataProviderCopyData(a3);
  if (a5)
    *a5 = 0;
  if (v9)
    goto LABEL_23;
  return v15;
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  const __CFData *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  const CGImageMetadata *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = (const __CFData *)a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (-[__CFData length](v4, "length"))
  {
    v5 = CGImageSourceCreateWithData(v4, 0);
    v6 = v5;
    if (v5)
    {
      v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
      if (v7)
      {
        objc_msgSend(a1, "_privateImageMetadataDescriptors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __41__MUImageReader_hasPrivateImageMetadata___block_invoke;
        v12[3] = &unk_24E5D3FD8;
        v9 = v8;
        v13 = v9;
        v14 = &v15;
        CGImageMetadataEnumerateTagsUsingBlock(v7, 0, 0, v12);
        CFRelease(v7);

      }
      CFRelease(v6);
    }
  }
  v10 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __41__MUImageReader_hasPrivateImageMetadata___block_invoke(uint64_t a1, int a2, CGImageMetadataTagRef tag)
{
  CFStringRef v5;
  CFStringRef v6;
  void *v7;
  CFStringRef v8;
  CFStringRef v9;
  int v10;
  uint64_t v11;

  v5 = CGImageMetadataTagCopyPrefix(tag);
  if (!v5)
    return 1;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = CGImageMetadataTagCopyName(tag)) != 0)
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "containsObject:", v8);
    if (v10)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v11 = v10 ^ 1u;
    CFRelease(v9);
  }
  else
  {
    v11 = 1;
  }
  CFRelease(v6);

  return v11;
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  const __CFData *v4;
  const __CFData *v5;
  CGImageSource *v6;
  __CFData *v7;
  CGImageSource *v8;
  CGImageMetadataRef v9;
  const CGImageMetadata *v10;
  void *v11;
  CGMutableImageMetadataRef MutableCopy;
  CGMutableImageMetadataRef v13;
  __CFData *v14;
  const __CFString *Type;
  size_t Count;
  CGImageDestination *v17;
  void *v18;
  const __CFDictionary *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, const __CFString *, CGImageMetadataTagRef);
  void *v24;
  id v25;
  uint64_t *v26;
  CGMutableImageMetadataRef v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = (const __CFData *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = CGImageSourceCreateWithData(v4, 0);
    v7 = v5;
    if (v6)
    {
      v8 = v6;
      v9 = CGImageSourceCopyMetadataAtIndex(v6, 0, 0);
      v7 = v5;
      if (v9)
      {
        v10 = v9;
        objc_msgSend(a1, "_privateImageMetadataDescriptors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        MutableCopy = CGImageMetadataCreateMutableCopy(v10);
        v7 = v5;
        if (MutableCopy)
        {
          v13 = MutableCopy;
          v28 = 0;
          v29 = &v28;
          v30 = 0x2020000000;
          v31 = 0;
          v21 = MEMORY[0x24BDAC760];
          v22 = 3221225472;
          v23 = __44__MUImageReader_cleanImageMetadataFromData___block_invoke;
          v24 = &unk_24E5D4000;
          v26 = &v28;
          v27 = MutableCopy;
          v25 = v11;
          CGImageMetadataEnumerateTagsUsingBlock(v10, 0, 0, &v21);
          v7 = v5;
          if (*((_BYTE *)v29 + 24))
          {
            objc_msgSend(MEMORY[0x24BDBCEC8], "data", v21, v22, v23, v24);
            v14 = (__CFData *)objc_claimAutoreleasedReturnValue();
            Type = CGImageSourceGetType(v8);
            Count = CGImageSourceGetCount(v8);
            v17 = CGImageDestinationCreateWithData(v14, Type, Count, 0);
            v7 = v5;
            if (v17)
            {
              v18 = (void *)*MEMORY[0x24BDD9230];
              values = v13;
              keys[0] = v18;
              v19 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
              v7 = v5;
              if (v19)
              {
                v7 = v5;
                if (CGImageDestinationCopyImageSource(v17, v8, v19, 0))
                {
                  v7 = v14;

                }
                CFRelease(v19);
              }
              CFRelease(v17);
            }

          }
          CFRelease(v13);

          _Block_object_dispose(&v28, 8);
        }
        CFRelease(v10);

      }
      CFRelease(v8);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __44__MUImageReader_cleanImageMetadataFromData___block_invoke(uint64_t a1, const __CFString *a2, CGImageMetadataTagRef tag)
{
  CFStringRef v6;
  CFStringRef v7;
  void *v8;
  CFStringRef v9;
  CFStringRef v10;

  v6 = CGImageMetadataTagCopyPrefix(tag);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = CGImageMetadataTagCopyName(tag);
      if (v9)
      {
        v10 = v9;
        if (objc_msgSend(v8, "containsObject:", v9))
        {
          CGImageMetadataRemoveTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 48), 0, a2);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        CFRelease(v10);
      }
    }
    CFRelease(v7);

  }
  return 1;
}

- (id)_readDataFromTagAtPath:(id)a3 inMetadata:(CGImageMetadata *)a4
{
  CGImageMetadataTag *v4;
  CGImageMetadataTag *v5;
  CFTypeRef v6;
  void *v7;
  CFTypeID v8;
  objc_class *v9;
  id v10;
  void *v11;

  v4 = CGImageMetadataCopyTagWithPath(a4, 0, (CFStringRef)a3);
  if (v4)
  {
    v5 = v4;
    v6 = CGImageMetadataTagCopyValue(v4);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        v9 = (objc_class *)MEMORY[0x24BDBCE50];
        v10 = v7;
        v11 = (void *)objc_msgSend([v9 alloc], "initWithBase64EncodedString:options:", v10, 0);

      }
      else
      {
        v11 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)_privateImageMetadataDescriptors
{
  return &unk_24E5E0608;
}

+ (id)imageDescriptionFromSourceContent:(id)a3
{
  const __CFURL *v3;
  CGDataProvider *v4;
  CGDataProvider *v5;
  CGImageSourceRef v6;
  CGImageSourceRef v7;
  uint64_t (*v8)(CGImageSourceRef, CFErrorRef *);
  void *v9;
  __CFString *v10;
  CFErrorRef err;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v3 = (const __CFURL *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CGDataProviderCreateWithURL(v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      v9 = 0;
      goto LABEL_19;
    }
    v4 = CGDataProviderCreateWithCFData(v3);
  }
  v5 = v4;
  if (!v4)
    goto LABEL_13;
  v6 = CGImageSourceCreateWithDataProvider(v4, 0);
  if (v6)
  {
    v7 = v6;
    err = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v8 = (uint64_t (*)(CGImageSourceRef, CFErrorRef *))getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr;
    v17 = getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr;
    if (!getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_block_invoke;
      v13[3] = &unk_24E5D4028;
      v13[4] = &v14;
      __getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_block_invoke((uint64_t)v13);
      v8 = (uint64_t (*)(CGImageSourceRef, CFErrorRef *))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v8)
      +[MUImageReader imageDescriptionFromSourceContent:].cold.1();
    v9 = (void *)v8(v7, &err);
    if (err)
    {
      v10 = (__CFString *)CFErrorCopyDescription(err);
      if (-[__CFString length](v10, "length"))
        NSLog(CFSTR("%s: %@"), "+[MUImageReader imageDescriptionFromSourceContent:]", v10);
      else
        NSLog(CFSTR("%s: Error reading image source"), "+[MUImageReader imageDescriptionFromSourceContent:]");
      CFRelease(err);

    }
    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v5);
LABEL_19:

  return v9;
}

+ (void)imageDescriptionFromSourceContent:.cold.1()
{
  dlerror();
  abort_report_np();
  AKLog();
}

@end
