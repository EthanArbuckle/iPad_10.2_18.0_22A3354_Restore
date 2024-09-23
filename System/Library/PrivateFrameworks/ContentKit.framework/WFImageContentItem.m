@implementation WFImageContentItem

- (WFImageContentItem)initWithCoder:(id)a3
{
  id v4;
  WFImageContentItem *v5;
  void *v6;
  uint64_t v7;
  WFFileType *preferredFileType;
  void *v9;
  WFImageContentItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFImageContentItem;
  v5 = -[WFContentItem initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(CFSTR("WFImageContentItem"), "stringByAppendingString:", CFSTR("preferredFileType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    preferredFileType = v5->_preferredFileType;
    v5->_preferredFileType = (WFFileType *)v7;

    objc_msgSend(CFSTR("WFImageContentItem"), "stringByAppendingString:", CFSTR("isScreenshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isScreenshot = objc_msgSend(v4, "decodeBoolForKey:", v9);
    v10 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFImageContentItem;
  -[WFContentItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(CFSTR("WFImageContentItem"), "stringByAppendingString:", CFSTR("preferredFileType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredFileType, v5);
  if (self->_isScreenshot)
  {
    objc_msgSend(CFSTR("WFImageContentItem"), "stringByAppendingString:", CFSTR("isScreenshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeBool:forKey:", 1, v6);

  }
}

- (id)metadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)size
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[WFImageContentItem isObjectBacked](self, "isObjectBacked"))
  {
    -[WFImageContentItem image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeInPixels");
  }
  else
  {
    -[WFImageContentItem metadata](self, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WFImageSizeFromMetadata(v3);
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)dateTaken
{
  void *v2;
  void *v3;

  -[WFImageContentItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFImageDateTakenFromMetadata(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)make
{
  void *v2;
  void *v3;

  -[WFImageContentItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFImageMakeFromMetadata(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)model
{
  void *v2;
  void *v3;

  -[WFImageContentItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFImageModelFromMetadata(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)width
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFImageContentItem size](self, "size");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)height
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFImageContentItem size](self, "size");
  return (id)objc_msgSend(v2, "numberWithDouble:", v3);
}

- (CLLocation)location
{
  void *v2;
  void *v3;

  -[WFImageContentItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFImageLocationTakenFromMetadata(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLLocation *)v3;
}

- (id)orientation
{
  void *v3;
  int v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  if (-[WFImageContentItem isObjectBacked](self, "isObjectBacked"))
  {
    -[WFImageContentItem image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "orientation");
  }
  else
  {
    -[WFImageContentItem metadata](self, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = WFImageOrientationFromMetadata(v3);
  }
  v5 = v4;

  WFImageStringFromOrientation(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_24C4E3948;
  v8 = v6;

  return v8;
}

- (BOOL)isScreenshot
{
  void *v3;

  if (self->_isScreenshot)
    return 1;
  v3 = (void *)MEMORY[0x24BEC14E0];
  -[WFImageContentItem size](self, "size");
  return objc_msgSend(v3, "imageSizeIndicatesScreenshot:");
}

- (BOOL)isObjectBacked
{
  void *v2;
  char isKindOfClass;

  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (WFImage)image
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFImage *)v6;
}

- (id)imageFile
{
  void *v3;
  void *v4;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)generateImageFileForType:(id)a3 includingMetadata:(BOOL)a4 compressionQuality:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  CGImageDestination *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  CGImageSource *v35;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (!v10 || objc_msgSend(v10, "isEqualToUTType:", *MEMORY[0x24BDF8410]))
  {
    -[WFImageContentItem preferredFileType](self, "preferredFileType");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v12;
  }
  if (-[WFImageContentItem isObjectBacked](self, "isObjectBacked"))
  {
    v13 = *MEMORY[0x24BDF83D8];
    if (objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF83D8]))
    {
      if (-[WFImageContentItem imageIsAnimated](self, "imageIsAnimated"))
      {
        -[WFImageContentItem image](self, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UIImage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        WFUIImageAnimatedGIFRepresentationAndOptions(v15, 0, a6, 0.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentItem name](self, "name");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

        goto LABEL_24;
      }
    }
  }
  objc_msgSend((id)objc_opt_class(), "imageTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v10);

  if (v21)
  {
    -[WFContentItem name](self, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v22, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v17, 1, v10, v23);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "utType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = CGImageDestinationCreateWithURL((CFURLRef)v17, v25, 1uLL, 0);

    if (v26)
    {
      v27 = -[WFImageContentItem isObjectBacked](self, "isObjectBacked");
      v28 = (void *)objc_opt_new();
      v29 = v28;
      if (v8)
      {
        -[WFImageContentItem metadata](self, "metadata");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addEntriesFromDictionary:", v30);

      }
      else if (!v27)
      {
        v31 = *MEMORY[0x24BDBD430];
        objc_msgSend(v28, "setObject:forKey:", *MEMORY[0x24BDBD430], *MEMORY[0x24BDD96E8]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9598]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9668]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9470]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD96B0]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9648]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD95D0]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD96D8]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD92C8]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9678]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9680]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9278]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9360]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD93E8]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9690]);
        objc_msgSend(v29, "setObject:forKey:", v31, *MEMORY[0x24BDD9670]);
      }
      if (v11)
        objc_msgSend(v29, "setObject:forKey:", v11, *MEMORY[0x24BDD9220]);
      if (v27)
      {
        -[WFImageContentItem image](self, "image");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v32, "orientation"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v33, *MEMORY[0x24BDD9698]);

        CGImageDestinationAddImage(v26, (CGImageRef)objc_msgSend(v32, "CGImage"), (CFDictionaryRef)v29);
      }
      else
      {
        -[WFImageContentItem imageFile](self, "imageFile");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = WFImageSourceCreateFromFile(v34, 0);

        if (v35)
        {
          CGImageDestinationAddImageFromSource(v26, v35, 0, (CFDictionaryRef)v29);
          CFRelease(v35);
        }
      }
      CGImageDestinationFinalize(v26);
      CFRelease(v26);
      v18 = v18;

      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    goto LABEL_23;
  }
  v19 = 0;
LABEL_24:

  return v19;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  return -[WFImageContentItem generateImageFileForType:includingMetadata:compressionQuality:error:](self, "generateImageFileForType:includingMetadata:compressionQuality:error:", a3, 1, 0, a5);
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "conformsToUTType:", *MEMORY[0x24BDF8498]))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__WFImageContentItem_generateFileRepresentation_options_forType___block_invoke;
    v11[3] = &unk_24C4E2ED8;
    v12 = v7;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v11, v9);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  WFImageContentItem *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  NSStringFromClass(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(CFSTR("UIPrintFormatter"), "isEqualToString:", v10);

  if (v11)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v14[3] = &unk_24C4E2F28;
    v17 = v8;
    v15 = v9;
    v16 = self;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v14, v12);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v13);

  }
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  CGImageSource *v14;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFData *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v8 = a4;
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToClass:", a3);

  if (v10)
  {
    -[WFImageContentItem image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "platformImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    -[WFContentItem name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v12, v13);
    v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    goto LABEL_5;
  }
  if ((Class)objc_opt_class() == a3)
  {
    if (-[WFImageContentItem isObjectBacked](self, "isObjectBacked"))
    {
      +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem objectForClass:](self, "objectForClass:", objc_msgSend(v19, "objectClass"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithPlatformImage:", v11);
      goto LABEL_3;
    }
    -[WFImageContentItem imageFile](self, "imageFile");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v32, "mappedDataWithError:", &v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v41;
    v35 = v34;
    if (v33)
    {
      objc_msgSend(MEMORY[0x24BEC14E0], "imageWithData:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        -[WFContentItem name](self, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v36, v37);
        v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
      *a5 = objc_retainAutorelease(v34);
    }

  }
  else
  {
    if ((Class)objc_opt_class() == a3)
    {
      -[WFImageContentItem preferredFileType](self, "preferredFileType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v20, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0;
      v44 = &v43;
      v45 = 0x2050000000;
      v23 = (void *)getNSTextAttachmentClass_softClass;
      v46 = getNSTextAttachmentClass_softClass;
      if (!getNSTextAttachmentClass_softClass)
      {
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __getNSTextAttachmentClass_block_invoke;
        v42[3] = &unk_24C4E3118;
        v42[4] = &v43;
        __getNSTextAttachmentClass_block_invoke((uint64_t)v42);
        v23 = (void *)v44[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v43, 8);
      v25 = [v24 alloc];
      objc_msgSend(v22, "data");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "wfType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "string");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v25, "initWithData:ofType:", v26, v28);

      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "wfName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v30, v31);
      v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    NSStringFromClass(a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(CFSTR("CLLocation"), "isEqualToString:", v16);

    if (v17)
    {
      -[WFImageContentItem location](self, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[WFContentItem name](self, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v11, v18);
        v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      goto LABEL_4;
    }
    if ((Class)objc_opt_class() != a3)
    {
      v14 = 0;
      goto LABEL_5;
    }
    if (-[WFImageContentItem isObjectBacked](self, "isObjectBacked"))
    {
      -[WFImageContentItem image](self, "image");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "PNGRepresentation");
      v39 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v14 = CGImageSourceCreateWithData(v39, 0);

    }
    else
    {
      -[WFImageContentItem imageFile](self, "imageFile");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = WFImageSourceCreateFromFile(v38, 0);
    }

    if (v14)
    {
      v22 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
      CFRelease(v14);
      if (v22)
      {
        WFLocalizedContentPropertyNameMarker(CFSTR("Metadata"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v22, v40);
        v14 = (CGImageSource *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
LABEL_16:

    }
  }
LABEL_5:

  return v14;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.ilm.openexr-image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFImageContentItem;
    v7 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v9, sel_canGenerateRepresentationForType_, v4);
  }

  return v7;
}

- (BOOL)isContent
{
  return 1;
}

- (BOOL)imageIsAnimated
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  BOOL IsAnimatedGIF;

  if (-[WFImageContentItem isObjectBacked](self, "isObjectBacked"))
  {
    -[WFImageContentItem image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "allowsAnimated"))
    {
      IsAnimatedGIF = 0;
      goto LABEL_8;
    }
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDF83D8];
    v7 = objc_msgSend(v5, "conformsToUTType:", *MEMORY[0x24BDF83D8]);

    if (!v7)
      return 0;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "mappedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v4;
  IsAnimatedGIF = WFImageDataIsAnimatedGIF(v4);

LABEL_8:
  return IsAnimatedGIF;
}

- (void)copyStateToItem:(id)a3
{
  objc_storeStrong((id *)a3 + 7, self->_preferredFileType);
}

- (WFFileType)preferredFileType
{
  WFFileType *preferredFileType;
  void *v5;
  objc_super v6;

  preferredFileType = self->_preferredFileType;
  if (preferredFileType)
    return preferredFileType;
  if (-[WFImageContentItem imageIsAnimated](self, "imageIsAnimated"))
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFImageContentItem;
    -[WFContentItem preferredFileType](&v6, sel_preferredFileType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (WFFileType *)v5;
}

- (WFObjectType)preferredObjectType
{
  return +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
}

- (void)setIsScreenshot:(BOOL)a3
{
  self->_isScreenshot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFileType, 0);
}

void __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (a2)
  {
    +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
    v6[3] = &unk_24C4E0850;
    v5 = *(id *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 40);
    v7 = v5;
    +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v3, 0, v4, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "viewPrintFormatter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v3 + 16))(v3, v5, v4, 0);

}

void __65__WFImageContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "wfName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WFGenerateVideoFromGIF(v5, v3, 1, *(void **)(a1 + 32));

}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  char isKindOfClass;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = objc_alloc(MEMORY[0x24BDBCEE0]);
  v53 = v10;
  objc_msgSend(v10, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);

  v17 = (void *)*MEMORY[0x24BDF8400];
  objc_msgSend((id)*MEMORY[0x24BDF8400], "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "containsObject:", v18);

  if (v19)
  {
    objc_msgSend(v17, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v20);

    objc_msgSend(v17, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v16;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (!v22)
  {
    v36 = 0;
    goto LABEL_31;
  }
  v23 = v22;
  v49 = v11;
  v50 = v13;
  v48 = v12;
  v24 = *(_QWORD *)v55;
  v25 = a1;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v55 != v24)
        objc_enumerationMutation(obj);
      v27 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v27, v48);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ownedTypes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "containsObject:", v28))
      {

      }
      else
      {
        objc_msgSend(v25, "ownedPasteboardTypes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsObject:", v28);

        if (!v31)
          goto LABEL_14;
      }
      objc_msgSend(v53, "objectForKey:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "conformsToType:", v34);

      if (v35)
      {
        v12 = v48;
        v11 = v49;
        v13 = v50;
        objc_msgSend(a1, "itemWithObject:named:attributionSet:cachingIdentifier:", v32, v49, v48, v50);
        v36 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v37 = *MEMORY[0x24BDF8410];
        if (!objc_msgSend(v28, "conformsToUTType:", *MEMORY[0x24BDF8410]))
          goto LABEL_30;
        if ((objc_msgSend(v28, "isEqualToUTType:", v37) & 1) != 0)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", *MEMORY[0x24BEC18A0]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v28, "isEqualToUTType:", v38);

        if ((v39 & 1) != 0)
          goto LABEL_30;
        v28 = v28;
        v40 = (void *)v36[7];
        v36[7] = v28;
LABEL_29:

        v13 = v50;
LABEL_30:

        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v53, "objectForKey:", v27);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "provider");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v11 = v49;
          +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v49, v28);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v48;
          if (objc_msgSend(v40, "writeToURL:atomically:", v45, 0))
          {
            +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v45, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "itemWithFile:attributionSet:cachingIdentifier:", v46, v48, v50);
            v36 = (_QWORD *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v36 = 0;
          }

        }
        else
        {
          v11 = v49;
          +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v40, v28, v49);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v48;
          objc_msgSend(a1, "itemWithFile:attributionSet:cachingIdentifier:", v44, v48, v50);
          v36 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_29;
      }

      v25 = a1;
LABEL_14:

    }
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v23)
      continue;
    break;
  }
  v36 = 0;
  v12 = v48;
  v11 = v49;
  v13 = v50;
LABEL_31:

  return v36;
}

+ (id)itemWithImage:(id)a3 named:(id)a4 preferredFileType:(id)a5
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFImageContentItem.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  objc_msgSend(a1, "itemWithObject:named:", v9, v10);
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12[7];
  v12[7] = v11;

  return v12;
}

+ (id)itemWithFile:(id)a3 preferredFileType:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFImageContentItem.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileRepresentation"));

  }
  objc_msgSend(a1, "itemWithFile:", v7);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9[7];
  v9[7] = v8;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)propertyBuilders
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[19];

  v87[17] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarkerWithContext(CFSTR("Album"), (uint64_t)CFSTR("Image Content Item"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_800, v81, objc_opt_class());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "multipleValues:", 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "filterable:", 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "sortable:", 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v77;
  WFLocalizedContentPropertyNameMarker(CFSTR("Width"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("width"), v76, objc_opt_class());
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v75;
  WFLocalizedContentPropertyNameMarker(CFSTR("Height"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("height"), v74, objc_opt_class());
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v73;
  WFLocalizedContentPropertyNameMarker(CFSTR("Date Taken"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("dateTaken"), v72, objc_opt_class());
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "tense:", 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "timeUnits:", 8220);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "comparableUnits:", 8220);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v68;
  WFLocalizedContentPropertyNameMarker(CFSTR("Time Taken"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("dateTaken"), v67, objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "tense:", 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "timeUnits:", 224);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "comparableUnits:", 224);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "gettable:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v62;
  WFLocalizedContentPropertyNameMarker(CFSTR("Media Type"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_69, v61, objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  WFPhotoLibraryPossibleMediaTypes();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "possibleValues:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sortable:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v57;
  WFLocalizedContentPropertyNameMarker(CFSTR("Photo Type"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_70, v56, objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  WFPhotoLibraryPossiblePhotoTypes();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "possibleValues:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "multipleValues:", 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sortable:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v51;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is a Screenshot"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("isScreenshot"), v50, objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not a Screenshot"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "negativeName:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Image (item name)"), CFSTR("Image"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "singularItemName:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v44;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is a Screen Recording"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_79, v43, objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not a Screen Recording"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "negativeName:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Image (item name)"), CFSTR("Image"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "singularItemName:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v37;
  WFLocalizedContentPropertyNameMarker(CFSTR("Location"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  v84 = &v83;
  v85 = 0x2050000000;
  v2 = (void *)getCLLocationClass_softClass_804;
  v86 = getCLLocationClass_softClass_804;
  if (!getCLLocationClass_softClass_804)
  {
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __getCLLocationClass_block_invoke_805;
    v82[3] = &unk_24C4E3118;
    v82[4] = &v83;
    __getCLLocationClass_block_invoke_805((uint64_t)v82);
    v2 = (void *)v84[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v83, 8);
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("location"), v36, v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v35;
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_84, v34, objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeUnits:", 224);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v32;
  WFLocalizedContentPropertyNameMarker(CFSTR("Frame Rate"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_88, v31, objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "irrational:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v29;
  WFLocalizedContentPropertyNameMarker(CFSTR("Orientation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("orientation"), v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  WFImagePossibleOrientationStrings();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "possibleValues:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v87[12] = v25;
  WFLocalizedContentPropertyNameMarker(CFSTR("Camera Make"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("make"), v24, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sortable:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filterable:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v87[13] = v21;
  WFLocalizedContentPropertyNameMarker(CFSTR("Camera Model"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("model"), v20, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortable:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filterable:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87[14] = v17;
  WFLocalizedContentPropertyNameMarker(CFSTR("Metadata Dictionary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("metadata"), v16, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterable:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[15] = v6;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Favorite"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_100, v7, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Favorite"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "negativeName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Image (item name)"), CFSTR("Image"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "singularItemName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v87[16] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 17);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)imageTypes
{
  void *v2;
  void *v3;
  void *v4;
  CFArrayRef v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  v4 = (void *)MEMORY[0x24BEC14A0];
  v5 = CGImageDestinationCopyTypeIdentifiers();
  objc_msgSend(v4, "typesFromStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  return v2;
}

+ (id)ownedTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCEE0];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(a1, "imageTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionOrderedSet:", v7);

  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v9);

  return v5;
}

+ (id)ownedPasteboardTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC18A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Image (singular)"), CFSTR("Image"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Images"), CFSTR("Images"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Images"));
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x24BDBCF00];
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCoercionOptions registerDefaultDisallowedCoercionPath:](WFCoercionOptions, "registerDefaultDisallowedCoercionPath:", v5);

    v6 = (void *)MEMORY[0x24BDBCF00];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "orderedSetWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[WFCoercionOptions registerDefaultDisallowedCoercionPath:](WFCoercionOptions, "registerDefaultDisallowedCoercionPath:", v9);

  }
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, MEMORY[0x24BDBD1C0]);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, MEMORY[0x24BDBD1A8]);
}

void __38__WFImageContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v5 = a4;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Image"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))a4)[2](v5, v6);

}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  CGFloat v12;
  CGFloat v13;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_24C4E0098;
    v11 = v7;
    v12 = width;
    v13 = height;
    -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v10, 0);

  }
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke;
    v7[3] = &unk_24C4E2ED8;
    v8 = v4;
    -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v7, 0);

  }
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke;
    v7[3] = &unk_24C4E2420;
    v8 = v4;
    -[WFContentItem getPreferredFileSize:](self, "getPreferredFileSize:", v7);

  }
  return 1;
}

- (BOOL)loadsListAltTextAsynchronously
{
  return 1;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 1;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

void __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke_2;
  v6[3] = &unk_24C4E00C0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  if (a2)
  {
    objc_msgSend(a2, "wfType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%@ Image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedUppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke_2;
    block[3] = &unk_24C4E00C0;
    v9 = *(id *)(a1 + 32);
    v12 = v8;
    v13 = v9;
    v10 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  CGFloat v27;
  _QWORD v28[4];
  id v29;
  CGFloat v30;
  CGAffineTransform v31;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = WFImageSizeFromFile(v5, 0);
    v9 = v8;
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screenScale");
    v12 = v11;

    CGAffineTransformMakeScale(&v31, v12, v12);
    v13 = *(double *)(a1 + 40);
    v14 = *(double *)(a1 + 48);
    v15 = v14 * v31.c + v31.a * v13;
    v16 = v14 * v31.d + v31.b * v13;
    if (v7 <= v15 && v9 <= v16)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_4;
      block[3] = &unk_24C4E0048;
      v26 = *(id *)(a1 + 32);
      v25 = v5;
      v27 = v12;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v23 = v26;
    }
    else
    {
      v18 = v7 <= v9;
      v19 = round(v7 / v9 * v16);
      v20 = round(v9 / v7 * v15);
      if (v7 > v9)
        v21 = v15;
      else
        v21 = v19;
      if (v18)
        v22 = v16;
      else
        v22 = v20;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_2;
      v28[3] = &unk_24C4E0070;
      v29 = *(id *)(a1 + 32);
      v30 = v12;
      WFAsyncTransformedImageFromImage(v5, 0, 0, v28, v21, v22);
      v23 = v29;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_3;
  block[3] = &unk_24C4E0048;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BEC14E0];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mappedData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithData:scale:", v5, *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  if (v2)
  {
    v5 = (void *)MEMORY[0x24BEC14E0];
    objc_msgSend(v2, "mappedData");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:scale:", v7, *(double *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v6, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }
}

@end
