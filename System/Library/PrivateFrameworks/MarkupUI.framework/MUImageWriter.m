@implementation MUImageWriter

- (BOOL)writeUsingBaseImage:(id)a3 withAnnotationsFromController:(id)a4 asImageOfType:(id)a5 toConsumer:(CGDataConsumer *)a6 embedSourceImageAndAnnotationsAsMetadata:(BOOL)a7 encryptPrivateMetadata:(BOOL)a8 error:(id *)a9
{
  _BOOL4 v9;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  CGImageSourceRef v17;
  const __CFDictionary *v18;
  CFDictionaryRef v19;
  const CGImageMetadata *v20;
  const CGImageMetadata *v21;
  _BOOL4 v22;
  CGImageMetadata *Mutable;
  CGImage *ImageAtIndex;
  const __CFDictionary *v25;
  __CFString *v26;
  void *v27;
  unint64_t Width;
  unint64_t Height;
  BOOL IsInfinite;
  double v31;
  double v32;
  void *v33;
  BOOL v34;
  double y;
  double x;
  CGImage *Image;
  BOOL v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  CGColorSpace *ColorSpace;
  _BOOL4 v59;
  _BOOL4 v60;
  CGColorSpaceRef v61;
  CGColorSpace *v62;
  size_t AlignedBytesPerRow;
  CGContext *v64;
  CGContext *v65;
  CGFloat v66;
  CGFloat v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  CGFloat v74;
  CGFloat v75;
  CGImageDestination *v76;
  void *v77;
  void *v78;
  void *v79;
  CGImageMetadataTag *v80;
  __CFString *v81;
  __CFString *v82;
  CGImageMetadataTagRef v83;
  __CFString *v84;
  __CFData *v85;
  const __CFString *v86;
  CGImageDestination *v87;
  CGImageDestinationRef v88;
  __CFString *v89;
  void *v90;
  __CFData *v91;
  void *v92;
  CGImageMetadataTag *v93;
  void *v94;
  uint64_t (*v95)(CGImageMetadata *, void *, CFErrorRef *);
  __CFString *v96;
  char v97;
  MUImageWriter *v99;
  _BOOL4 v100;
  _BOOL4 v102;
  void *context;
  void *contexta;
  __CFString *v105;
  void *v106;
  const __CFDictionary *options;
  __CFString *type;
  void *v109;
  __CFString *name;
  void *v111;
  CGImageSource *isrc;
  void *v113;
  void *v114;
  CFErrorRef v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  CFErrorRef err;
  CFErrorRef v121[5];
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  void *v125;
  _BYTE v126[128];
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD v130[3];
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v9 = a8;
  v102 = a7;
  v130[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  type = (__CFString *)a5;
  v15 = CFSTR("base_image");
  v100 = v9;
  if (v9)
  {
    v15 = CFSTR("enc_base_image");
    v16 = CFSTR("enc_model");
  }
  else
  {
    v16 = CFSTR("model");
  }
  v105 = v15;
  name = v16;
  v113 = v14;
  objc_msgSend(v14, "commitEditing");
  objc_opt_class();
  v106 = v13;
  v99 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ImageAtIndex = (CGImage *)objc_msgSend(objc_retainAutorelease(v13), "CGImage");
      CGImageRetain(ImageAtIndex);
      v102 = 0;
      isrc = 0;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = CGImageSourceCreateWithURL((CFURLRef)v13, 0);
    if (v17)
      goto LABEL_8;
    goto LABEL_11;
  }
  v17 = CGImageSourceCreateWithData((CFDataRef)v13, 0);
  if (!v17)
  {
LABEL_11:
    isrc = 0;
    ImageAtIndex = 0;
LABEL_13:
    options = 0;
    v22 = 0;
LABEL_16:
    Mutable = CGImageMetadataCreateMutable();
    goto LABEL_17;
  }
LABEL_8:
  isrc = v17;
  v129 = *MEMORY[0x24BDD9770];
  v130[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v130, &v129, 1);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v19 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, v18);
  options = (const __CFDictionary *)-[__CFDictionary muDeepMutableCopy](v19, "muDeepMutableCopy");

  v20 = CGImageSourceCopyMetadataAtIndex(isrc, 0, 0);
  v21 = v20;
  v22 = v20 != 0;
  if (v20)
  {
    Mutable = CGImageMetadataCreateMutableCopy(v20);
    CFRelease(v21);
  }
  else
  {
    Mutable = 0;
  }
  v127 = *MEMORY[0x24BDD97D0];
  v128 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
  v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(isrc, 0, v25);

  if (!Mutable)
    goto LABEL_16;
LABEL_17:
  err = 0;
  CGImageMetadataRegisterNamespaceForPrefix(Mutable, kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, &err);
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixAnnotationKit, name);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CGImageMetadataRemoveTagWithPath(Mutable, 0, v26);

  }
  objc_msgSend(v113, "modelController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pageModelControllers");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v114, "count") >= 2)
    NSLog(CFSTR("[pageModelControllers count] == 1, %s: Writing of multi-page images not yet supported."), "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
  if (!ImageAtIndex)
  {
    NSLog(CFSTR("%s: Failed to create a CGImageRef given input: %@"), "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]", v106);
    Image = 0;
    ImageAtIndex = 0;
    v38 = 0;
    goto LABEL_114;
  }
  objc_msgSend(v114, "firstObject");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "annotations");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v109, "count"))
  {
    Image = CGImageRetain(ImageAtIndex);
    goto LABEL_71;
  }
  Width = CGImageGetWidth(ImageAtIndex);
  Height = CGImageGetHeight(ImageAtIndex);
  objc_msgSend(v111, "cropAnnotation");
  context = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "appliedCropRect");
  IsInfinite = CGRectIsInfinite(v131);
  v31 = (double)Width;
  v32 = (double)Height;
  v33 = context;
  if (context)
    v34 = 0;
  else
    v34 = IsInfinite;
  if (v34)
  {
    y = 0.0;
    x = 0.0;
  }
  else
  {
    if (context)
    {
      v39 = (void *)objc_msgSend(v109, "mutableCopy");
      objc_msgSend(v39, "removeObject:", context);

      v33 = context;
    }
    else
    {
      v39 = v109;
    }
    v40 = 0.0;
    v41 = (double)Height;
    v42 = (double)Width;
    v43 = 0.0;
    if (!IsInfinite)
    {
      objc_msgSend(v111, "appliedCropRect");
      v43 = v44;
      v40 = v45;
      v42 = v46;
      v33 = context;
    }
    if (v33)
    {
      objc_msgSend(v33, "rectangle");
      v48 = v47;
      objc_msgSend(context, "rectangle");
      v50 = v49;
      objc_msgSend(context, "rectangle");
      v42 = v51;
      objc_msgSend(context, "rectangle");
      v43 = v43 + v48;
      v40 = v40 + v50;
    }
    v136.origin.x = 0.0;
    v136.origin.y = 0.0;
    v52 = v43;
    v53 = v40;
    v54 = v42;
    v136.size.width = (double)Width;
    v136.size.height = (double)Height;
    v132 = CGRectIntersection(*(CGRect *)(&v41 - 3), v136);
    x = v132.origin.x;
    y = v132.origin.y;
    v55 = v132.size.width;
    v56 = v132.size.height;
    v57 = CGRectGetWidth(v132);
    v133.origin.x = x;
    v133.origin.y = y;
    v133.size.width = v55;
    v133.size.height = v56;
    Width = (unint64_t)v57;
    Height = (unint64_t)CGRectGetHeight(v133);
    v109 = v39;
  }
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  v59 = CGColorSpaceUsesExtendedRange(ColorSpace) || CGColorSpaceUsesITUR_2100TF(ColorSpace);
  if (MUGlowHDREnabled_onceToken != -1)
    dispatch_once(&MUGlowHDREnabled_onceToken, &__block_literal_global_3);
  if (MUGlowHDREnabled__glowHDREnabled)
    v60 = v59;
  else
    v60 = 0;
  if (v60)
  {
    v61 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  }
  else
  {
    if (ColorSpace && CGColorSpaceSupportsOutput(ColorSpace) && CGColorSpaceGetNumberOfComponents(ColorSpace) == 3)
    {
      v62 = 0;
      goto LABEL_54;
    }
    v61 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  }
  v62 = v61;
  ColorSpace = v61;
LABEL_54:
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v64 = CGBitmapContextCreate(0, Width, Height, 8uLL, AlignedBytesPerRow, ColorSpace, 2u);
  v65 = v64;
  if (v64)
  {
    CGContextTranslateCTM(v64, -x, -y);
    v134.origin.x = 0.0;
    v134.origin.y = 0.0;
    v134.size.width = v31;
    v134.size.height = v32;
    CGContextDrawImage(v65, v134, ImageAtIndex);
    CGImageRelease(ImageAtIndex);
    CGContextScaleCTM(v65, 1.0, 1.0);
    CGContextSaveGState(v65);
    if (!IsInfinite)
    {
      objc_msgSend(v111, "appliedCropRect");
      CGContextTranslateCTM(v65, v66, v67);
    }
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v68 = v109;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
    if (v69)
    {
      v70 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v117 != v70)
            objc_enumerationMutation(v68);
          v72 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          v73 = (void *)MEMORY[0x2207DC428]();
          CGContextSaveGState(v65);
          objc_msgSend(v72, "integralDrawingBounds");
          v74 = v135.origin.x;
          v75 = v135.origin.y;
          if (!CGRectIsInfinite(v135))
            CGContextTranslateCTM(v65, v74, v75);
          objc_msgSend(MEMORY[0x24BE03A30], "renderAnnotation:inContext:", v72, v65);
          CGContextRestoreGState(v65);
          objc_autoreleasePoolPop(v73);
        }
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
      }
      while (v69);
    }

    CGContextRestoreGState(v65);
    Image = CGBitmapContextCreateImage(v65);
    CGContextRelease(v65);
    ImageAtIndex = 0;
    if (!v62)
      goto LABEL_70;
    goto LABEL_69;
  }
  NSLog(CFSTR("CGBitmapContextCreate failed. Unable to draw annotations to image."));
  Image = CGImageRetain(ImageAtIndex);
  if (v62)
LABEL_69:
    CGColorSpaceRelease(v62);
LABEL_70:

LABEL_71:
  v76 = CGImageDestinationCreateWithDataConsumer(a6, type, 1uLL, 0);
  if (v76)
  {
    if (!v102)
    {
LABEL_98:
      objc_msgSend(v113, "modifiedImageDescription");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v94)
      {
        v115 = 0;
        v122 = 0;
        v123 = &v122;
        v124 = 0x2020000000;
        v95 = (uint64_t (*)(CGImageMetadata *, void *, CFErrorRef *))getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
        v125 = getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
        if (!getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr)
        {
          v121[0] = (CFErrorRef)MEMORY[0x24BDAC760];
          v121[1] = (CFErrorRef)3221225472;
          v121[2] = (CFErrorRef)__getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke;
          v121[3] = (CFErrorRef)&unk_24E5D4028;
          v121[4] = (CFErrorRef)&v122;
          __getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke((uint64_t)v121);
          v95 = (uint64_t (*)(CGImageMetadata *, void *, CFErrorRef *))v123[3];
        }
        _Block_object_dispose(&v122, 8);
        if (!v95)
          +[MUImageReader imageDescriptionFromSourceContent:].cold.1();
        if ((v95(Mutable, v94, &v115) & 1) == 0)
        {
          if (v115)
          {
            v96 = (__CFString *)CFErrorCopyDescription(v115);
            CFRelease(v115);
          }
          else
          {
            v96 = 0;
          }
          if (-[__CFString length](v96, "length"))
            NSLog(CFSTR("%s: %@"), "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]", v96);
          else
            NSLog(CFSTR("%s: Error setting image description into metadata"), "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");

        }
      }
      CGImageDestinationAddImageAndMetadata(v76, Image, Mutable, options);
      v38 = CGImageDestinationFinalize(v76);
      if (!v38)
        NSLog(CFSTR("%s: CGImageDestinationFinalize failed."), "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
      CFRelease(v76);

      goto LABEL_113;
    }
    v77 = (void *)MEMORY[0x2207DC428]();
    -[MUImageWriter encodedModelFromAnnotationsController:encrypt:](v99, "encodedModelFromAnnotationsController:encrypt:", v113, v100);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "base64EncodedStringWithOptions:", 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = CGImageMetadataTagCreate(kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, name, kCGImageMetadataTypeString, v79);
    if (v80)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixAnnotationKit, name);
      v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CGImageMetadataSetTagWithPath(Mutable, 0, v81, v80);
      CFRelease(v80);

    }
    objc_autoreleasePoolPop(v77);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixAnnotationKit, v105);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v83 = CGImageMetadataCopyTagWithPath(Mutable, 0, v82);
    if (v83)
    {
      CFRelease(v83);
      v84 = v82;
LABEL_97:

      goto LABEL_98;
    }
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v85 = (__CFData *)objc_claimAutoreleasedReturnValue();
    if (isrc)
    {
      v86 = CGImageSourceGetType(isrc);
      v87 = CGImageDestinationCreateWithData(v85, v86, 1uLL, 0);
      v88 = v87;
      if (v87)
      {
        v121[0] = 0;
        if (CGImageDestinationCopyImageSource(v87, isrc, 0, v121))
          goto LABEL_84;
        NSLog(CFSTR("CGImageDestinationCopyImageSource failed with error: %@"), v121[0]);
        CFRelease(v88);
      }
      else
      {
        NSLog(CFSTR("CGImageDestinationCreateWithData failed for baseImageSourceRef"));
      }
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
      v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v88 = CGImageDestinationCreateWithData(v85, v89, 1uLL, 0);

      if (v88)
      {
        CGImageDestinationAddImage(v88, ImageAtIndex, 0);
        if (ImageAtIndex)
        {
LABEL_84:
          CFRelease(v88);
          contexta = (void *)MEMORY[0x2207DC428]();
          if (v100)
          {
            +[MUPayloadEncryption sharedInstance](MUPayloadEncryption, "sharedInstance");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "encryptData:", v85);
            v91 = (__CFData *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v91 = v85;
          }
          if (v91)
          {
            -[__CFData base64EncodedStringWithOptions:](v91, "base64EncodedStringWithOptions:", 0);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = CGImageMetadataTagCreate(kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, v105, kCGImageMetadataTypeString, v92);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixAnnotationKit, v105);
            v84 = (__CFString *)objc_claimAutoreleasedReturnValue();

            CGImageMetadataSetTagWithPath(Mutable, 0, v84, v93);
            CFRelease(v93);

          }
          else
          {
            v84 = v82;
          }

          objc_autoreleasePoolPop(contexta);
          goto LABEL_96;
        }
        NSLog(CFSTR("CGImageDestinationAddImage failed: no baseCGImage"));
        CFRelease(v88);
      }
      else
      {
        NSLog(CFSTR("CGImageDestinationCreateWithData failed for UTTypeJPEG"));
      }
    }
    NSLog(CFSTR("Didn't write base image as metadata, because it failed to be written to baseImageDestRef."));
    v84 = v82;
LABEL_96:

    goto LABEL_97;
  }
  NSLog(CFSTR("%s: Failed to create CGImageDestinationRef."), "-[MUImageWriter writeUsingBaseImage:withAnnotationsFromController:asImageOfType:toConsumer:embedSourceImageAndAnnotationsAsMetadata:encryptPrivateMetadata:error:]");
  v38 = 0;
LABEL_113:

LABEL_114:
  if (isrc)
    CFRelease(isrc);
  if (ImageAtIndex)
    CFRelease(ImageAtIndex);
  if (Image)
    CFRelease(Image);
  if (Mutable)
    CFRelease(Mutable);
  if (a9)
    v97 = v38;
  else
    v97 = 1;
  if ((v97 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v38;
}

- (id)encodedModelFromAnnotationsController:(id)a3 encrypt:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "commitEditing");
  objc_msgSend(v5, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "archivedPageModelControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[MUPayloadEncryption sharedInstance](MUPayloadEncryption, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptData:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

@end
