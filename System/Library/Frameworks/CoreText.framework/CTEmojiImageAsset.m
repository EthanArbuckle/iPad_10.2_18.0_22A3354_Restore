@implementation CTEmojiImageAsset

- (CTEmojiImageAsset)initWithContentIdentifier:(id)a3 shortDescription:(id)a4 strikeImages:(id)a5
{
  id v9;
  id v10;
  id v11;
  CTEmojiImageAsset *v12;
  CTEmojiImageAsset *v13;
  CTEmojiImageAsset *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CTEmojiImageAsset.m"), 61, CFSTR("Invalid identifier %@"), v9);

  }
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CTEmojiImageAsset.m"), 62, CFSTR("Invalid description %@"), v10);

  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CTEmojiImageAsset.m"), 63, CFSTR("Empty images"));

  }
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length") && objc_msgSend(v11, "count"))
  {
    v19.receiver = self;
    v19.super_class = (Class)CTEmojiImageAsset;
    v12 = -[CTEmojiImageAsset init](&v19, sel_init);
    v13 = v12;
    if (v12)
    {
      -[CTEmojiImageAsset setContentIdentifier:](v12, "setContentIdentifier:", v9);
      -[CTEmojiImageAsset setShortDescription:](v13, "setShortDescription:", v10);
      -[CTEmojiImageAsset setStrikes:](v13, "setStrikes:", v11);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_TFFDictionaryWithEmojiInfoAndAlignmentInset:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  height = a3.height;
  width = a3.width;
  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0CBD098];
  -[CTEmojiImageAsset contentIdentifier](self, "contentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = *MEMORY[0x1E0CBD0A8];
  -[CTEmojiImageAsset shortDescription](self, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CBD0D8];
  v15[1] = v7;
  v15[2] = CFSTR("Apple TextKit Emoji");
  v9 = *MEMORY[0x1E0CBD0F0];
  v14[2] = v8;
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  v14[4] = *MEMORY[0x1E0CBD100];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_imagePropertiesForImage:(CGImage *)a3 withAlignmentInset:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  _QWORD v17[2];

  height = a4.height;
  width = a4.width;
  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0CBCBD0];
  -[CTEmojiImageAsset contentIdentifier](self, "contentIdentifier", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0CBCB50];
  v15[0] = v8;
  v10 = *MEMORY[0x1E0CBD090];
  v14[0] = v9;
  v14[1] = v10;
  -[CTEmojiImageAsset _TFFDictionaryWithEmojiInfoAndAlignmentInset:](self, "_TFFDictionaryWithEmojiInfoAndAlignmentInset:", width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_attachmentProperties
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CBD090];
  -[CTEmojiImageAsset _TFFDictionaryWithEmojiInfoAndAlignmentInset:](self, "_TFFDictionaryWithEmojiInfoAndAlignmentInset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_finalizeImageData
{
  CTEmojiImageAsset *v2;
  void *v3;
  __CFData *v4;
  const __CFDictionary *v5;
  void *v6;
  size_t v7;
  CGImageDestination *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[CTEmojiImageAsset heicData](v2, "heicData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (__CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0x80000);
    -[CTEmojiImageAsset _attachmentProperties](v2, "_attachmentProperties");
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    -[CTEmojiImageAsset strikes](v2, "strikes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = CGImageDestinationCreateWithData(v4, CFSTR("public.heic"), v7, MEMORY[0x1E0C9AA70]);

    if (v8)
    {
      v18 = v5;
      CGImageDestinationSetProperties(v8, v5);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[CTEmojiImageAsset strikes](v2, "strikes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
            v15 = (void *)MEMORY[0x186DC070C]();
            v16 = objc_msgSend(v14, "cgImage");
            objc_msgSend(v14, "alignmentInset");
            -[CTEmojiImageAsset _imagePropertiesForImage:withAlignmentInset:](v2, "_imagePropertiesForImage:withAlignmentInset:", v16);
            v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            CGImageDestinationAddImage(v8, (CGImageRef)objc_msgSend(v14, "cgImage"), v17);

            objc_autoreleasePoolPop(v15);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      if (CGImageDestinationFinalize(v8))
        -[CTEmojiImageAsset setHeicData:](v2, "setHeicData:", v4);
      CFRelease(v8);

    }
    else
    {

    }
  }
  objc_sync_exit(v2);

}

- (id)imageData
{
  -[CTEmojiImageAsset _finalizeImageData](self, "_finalizeImageData");
  return -[CTEmojiImageAsset heicData](self, "heicData");
}

- (id)preferredFilenameForData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CTEmojiImageAsset contentIdentifier](self, "contentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.heic"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CTEmojiImageAsset contentIdentifier](self, "contentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentIdentifier:", v5);

  -[CTEmojiImageAsset shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortDescription:", v6);

  -[CTEmojiImageAsset strikes](self, "strikes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrikes:", v7);

  -[CTEmojiImageAsset heicData](self, "heicData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeicData:", v8);

  return v4;
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)shortDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShortDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)heicData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeicData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)strikes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStrikes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->strikes, 0);
  objc_storeStrong((id *)&self->heicData, 0);
  objc_storeStrong((id *)&self->shortDescription, 0);
  objc_storeStrong((id *)&self->contentIdentifier, 0);
}

@end
