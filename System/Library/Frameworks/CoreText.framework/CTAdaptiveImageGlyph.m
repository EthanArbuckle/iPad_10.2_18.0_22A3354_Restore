@implementation CTAdaptiveImageGlyph

+ (BOOL)prefersTextAttachment
{
  if (qword_1ECDE7DF8 != -1)
    dispatch_once(&qword_1ECDE7DF8, &__block_literal_global_7);
  return _MergedGlobals_32;
}

void __45__CTAdaptiveImageGlyph_prefersTextAttachment__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("_NSAdaptiveImageGlyphPrefersTextAttachment"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
    v1 = objc_msgSend(v2, "BOOLValue");
  else
    v1 = dyld_program_sdk_at_least() ^ 1;
  _MergedGlobals_32 = v1;

}

+ (void)setPrefersTextAttachment:(BOOL)a3
{
  if (_MergedGlobals_32 != a3)
  {
    _MergedGlobals_32 = a3;
    +[__CTAdaptiveImageGlyphStorage flushInstanceCache](__CTAdaptiveImageGlyphStorage, "flushInstanceCache");
  }
}

+ (BOOL)prefersEmojiImageTextAttachment
{
  if (qword_1ECDE7E00 != -1)
    dispatch_once(&qword_1ECDE7E00, &__block_literal_global_53);
  return byte_1ECDE7DF1;
}

void __55__CTAdaptiveImageGlyph_prefersEmojiImageTextAttachment__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECDE7DF1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("_NSAdaptiveImageGlyphPrefersEmojiImageTextAttachment"));

}

+ (void)setPrefersEmojiImageTextAttachment:(BOOL)a3
{
  if (byte_1ECDE7DF1 != a3)
  {
    byte_1ECDE7DF1 = a3;
    +[__CTAdaptiveImageGlyphStorage flushInstanceCache](__CTAdaptiveImageGlyphStorage, "flushInstanceCache");
  }
}

+ (void)flushInstanceCache
{
  +[__CTAdaptiveImageGlyphStorage flushInstanceCache](__CTAdaptiveImageGlyphStorage, "flushInstanceCache");
}

+ (UTType)contentType
{
  return (UTType *)(id)*MEMORY[0x1E0CEC508];
}

- (CTAdaptiveImageGlyph)initWithImageContent:(id)a3
{
  id v4;
  CTAdaptiveImageGlyph *v5;
  uint64_t v6;
  __CTAdaptiveImageGlyphStorage *storage;
  CTAdaptiveImageGlyph *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTAdaptiveImageGlyph;
  v5 = -[CTAdaptiveImageGlyph init](&v10, sel_init);
  if (v5
    && (+[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:imageContent:](__CTAdaptiveImageGlyphStorage, "adaptiveImageGlyphStorageWithContentIdentifier:imageContent:", 0, v4), v6 = objc_claimAutoreleasedReturnValue(), storage = v5->_storage, v5->_storage = (__CTAdaptiveImageGlyphStorage *)v6, storage, v5->_storage))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_initWithContentIdentifier:(id)a3
{
  id v4;
  CTAdaptiveImageGlyph *v5;
  uint64_t v6;
  __CTAdaptiveImageGlyphStorage *storage;
  CTAdaptiveImageGlyph *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTAdaptiveImageGlyph;
  v5 = -[CTAdaptiveImageGlyph init](&v10, sel_init);
  if (v5
    && (+[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:imageContent:](__CTAdaptiveImageGlyphStorage, "adaptiveImageGlyphStorageWithContentIdentifier:imageContent:", v4, 0), v6 = objc_claimAutoreleasedReturnValue(), storage = v5->_storage, v5->_storage = (__CTAdaptiveImageGlyphStorage *)v6, storage, v5->_storage))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CTAdaptiveImageGlyph)initWithFileWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  CTAdaptiveImageGlyph *v11;
  CTAdaptiveImageGlyph *v12;

  v4 = a3;
  objc_msgSend(v4, "preferredFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CTAdaptiveImageGlyph contentType](CTAdaptiveImageGlyph, "contentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
    {
      v12 = 0;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v4, "regularFileContents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[CTAdaptiveImageGlyph initWithImageContent:](self, "initWithImageContent:", v10);
      if (v11)
      {
        self = v11;
        v12 = self;
LABEL_10:

        goto LABEL_11;
      }
      self = 0;
    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (NSData)imageContent
{
  return -[__CTAdaptiveImageGlyphStorage imageContent](self->_storage, "imageContent");
}

- (NSString)contentIdentifier
{
  return -[__CTAdaptiveImageGlyphStorage contentIdentifier](self->_storage, "contentIdentifier");
}

- (NSString)contentDescription
{
  return -[__CTAdaptiveImageGlyphStorage imageDescription](self->_storage, "imageDescription");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTAdaptiveImageGlyph *v4;
  void *v5;
  CTAdaptiveImageGlyph *v6;

  v4 = [CTAdaptiveImageGlyph alloc];
  -[__CTAdaptiveImageGlyphStorage contentIdentifier](self->_storage, "contentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CTAdaptiveImageGlyph initWithContentIdentifier:](v4, "initWithContentIdentifier:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "allowsKeyedCoding"))
  {
    -[__CTAdaptiveImageGlyphStorage contentIdentifier](self->_storage, "contentIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("NS.contentIdentifier"));

    -[__CTAdaptiveImageGlyphStorage imageContent](self->_storage, "imageContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("NS.imageContent"));

  }
}

- (CTAdaptiveImageGlyph)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  __CTAdaptiveImageGlyphStorage *v6;
  void *v7;
  CTAdaptiveImageGlyph *v8;
  __CTAdaptiveImageGlyphStorage *storage;
  CTAdaptiveImageGlyph *v10;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.contentIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (+[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:imageContent:](__CTAdaptiveImageGlyphStorage, "adaptiveImageGlyphStorageWithContentIdentifier:imageContent:", v5, 0), (v6 = (__CTAdaptiveImageGlyphStorage *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.imageContent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[__CTAdaptiveImageGlyphStorage adaptiveImageGlyphStorageWithContentIdentifier:imageContent:](__CTAdaptiveImageGlyphStorage, "adaptiveImageGlyphStorageWithContentIdentifier:imageContent:", 0, v7);
      v6 = (__CTAdaptiveImageGlyphStorage *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_8;
    }
    v12.receiver = self;
    v12.super_class = (Class)CTAdaptiveImageGlyph;
    v8 = -[CTAdaptiveImageGlyph init](&v12, sel_init);
    self = v8;
    if (v8)
    {
      storage = v8->_storage;
      v8->_storage = v6;

      self = self;
      v10 = self;
    }
    else
    {
LABEL_8:

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)strikes
{
  return (NSArray *)__CTEmojiImageSourceCopyImageStrikes(-[__CTAdaptiveImageGlyphStorage imageSourceRef](self->_storage, "imageSourceRef"));
}

- (CGSize)_imageSizeForProposedSize:(CGSize)a3 scaleFactor:(double)a4
{
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C9D820];
  __CTEmojiImageSourceGetImageIndex(-[__CTAdaptiveImageGlyphStorage imageSourceRef](self->_storage, "imageSourceRef"), (uint64_t)&v6, 0, a3.width, a3.height, 1.0);
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_nominalTextAttachmentCreatingIfNeededUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  __CTAdaptiveImageGlyphStorage *v5;
  void *v6;

  v4 = (void (**)(_QWORD))a3;
  v5 = self->_storage;
  objc_sync_enter(v5);
  -[__CTAdaptiveImageGlyphStorage _nominalTextAttachment](self->_storage, "_nominalTextAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CTAdaptiveImageGlyphStorage _setNominalTextAttachment:](self->_storage, "_setNominalTextAttachment:", v6);
  }
  objc_sync_exit(v5);

  return v6;
}

- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  double height;
  double width;
  CGImageSource *v12;
  size_t ImageIndex;
  id v14;
  CGImage *v15;
  CGImageRef ImageAtIndex;
  CGImageRef v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  id v23;

  height = a3.height;
  width = a3.width;
  v12 = -[__CTAdaptiveImageGlyphStorage imageSourceRef](self->_storage, "imageSourceRef");
  v23 = 0;
  ImageIndex = __CTEmojiImageSourceGetImageIndex(v12, (uint64_t)a6, (uint64_t)&v23, width, height, a4);
  v14 = v23;
  v15 = 0;
  if (ImageIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(-[__CTAdaptiveImageGlyphStorage imageSourceRef](self->_storage, "imageSourceRef"), ImageIndex, 0);
    if (ImageAtIndex)
    {
      v17 = ImageAtIndex;
      if (a5)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("__NSEmojiImagePropertyKeyOrigin"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "pointValue");
        }
        else
        {
          v20 = *MEMORY[0x1E0C9D538];
          v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        }
        a5->x = v20;
        a5->y = v21;

      }
      v15 = (CGImage *)CFAutorelease(v17);
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[CTAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3, a3, a4);
}

+ (BOOL)_readsAdaptiveImageGlyphFromDocumentFormats
{
  if (+[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::onceToken != -1)
    dispatch_once(&+[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::onceToken, &__block_literal_global_65);
  return +[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::_readsAdaptiveImageGlyphFromDocumentFormats;
}

void __67__CTAdaptiveImageGlyph__readsAdaptiveImageGlyphFromDocumentFormats__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("_NSReadsEmojiImageTextAttachmentFromDocumentFormats"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    if (objc_msgSend(v0, "BOOLValue"))
      v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("_NSAdaptiveImageGlyphDisableUnarchivingFromDocumentFormats")) ^ 1;
    else
      v2 = 0;
    +[CTAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats]::_readsAdaptiveImageGlyphFromDocumentFormats = v2;
  }

}

- (id)_fileWrapperForAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  objc_msgSend((id)objc_opt_class(), "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFilenameExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CTAdaptiveImageGlyph contentIdentifier](self, "contentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("AdaptiveImageGlyph-"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "stringByAppendingPathExtension:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = objc_alloc(MEMORY[0x1E0CB3650]);
  -[__CTAdaptiveImageGlyphStorage _RTFDImageData](self->_storage, "_RTFDImageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initRegularFileWithContents:", v10);

  objc_msgSend(v11, "setPreferredFilename:", v7);
  return v11;
}

- (NSFileWrapper)_fallbackFileWrapper
{
  void *v2;
  void *v3;

  -[__CTAdaptiveImageGlyphStorage _fallbackImageData](self->_storage, "_fallbackImageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", v2);
    objc_msgSend(v3, "setPreferredFilename:", CFSTR("Attachment.png"));
  }
  else
  {
    v3 = 0;
  }

  return (NSFileWrapper *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
