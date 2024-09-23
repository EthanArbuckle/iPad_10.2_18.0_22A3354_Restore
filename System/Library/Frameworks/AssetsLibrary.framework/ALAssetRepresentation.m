@implementation ALAssetRepresentation

- (ALAssetRepresentation)initWithManagedAsset:(id)a3 sidecar:(id)a4 extension:(id)a5 library:(id)a6
{
  ALAssetRepresentation *v10;
  ALAssetRepresentationPrivate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ALAssetRepresentation;
  v10 = -[ALAssetRepresentation init](&v13, sel_init);
  if (v10)
  {
    v11 = -[ALAssetRepresentationPrivate initWithManagedAsset:sidecar:extension:library:]([ALAssetRepresentationPrivate alloc], "initWithManagedAsset:sidecar:extension:library:", a3, a4, a5, a6);
    -[ALAssetRepresentation setInternal:](v10, "setInternal:", v11);

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ALAssetRepresentation setInternal:](self, "setInternal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALAssetRepresentation;
  -[ALAssetRepresentation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ALAssetRepresentation - UTI:%@"), -[ALAssetRepresentation UTI](self, "UTI"));
}

- (BOOL)isValid
{
  return -[ALAssetRepresentationPrivate isValid](-[ALAssetRepresentation internal](self, "internal"), "isValid");
}

- (NSString)UTI
{
  if (-[ALAssetRepresentation isValid](self, "isValid"))
    -[ALAssetRepresentationPrivate extension](-[ALAssetRepresentation internal](self, "internal"), "extension");
  return 0;
}

- (int)_fileDescriptor
{
  NSURL *v3;
  NSURL *v4;
  uint64_t v5;
  int v7;

  if (-[ALAssetRepresentation isValid](self, "isValid")
    && PUTGetCurrentAccess() == 2
    && (v3 = -[ALAssetRepresentation url](self, "url")) != 0)
  {
    v4 = v3;
    v5 = +[ALAssetRepresentationPrivate _fileDescriptorForPersistentURL:](ALAssetRepresentationPrivate, "_fileDescriptorForPersistentURL:", v3);
    v7 = v5;
    if ((_DWORD)v5 == -1)
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72238], "sharedSystemLibraryAssetsdClient", v5), "resourceClient"), "fileDescriptorForAssetURL:withAdjustments:fileExtension:fileDescriptor:error:", v4, 1, 0, &v7, 0);
      LODWORD(v5) = v7;
      if ((v7 & 0x80000000) == 0)
        LODWORD(v5) = +[ALAssetRepresentationPrivate _updateFileDescriptor:forPersistentURL:](ALAssetRepresentationPrivate, "_updateFileDescriptor:forPersistentURL:");
    }
  }
  else
  {
    LODWORD(v5) = -1;
  }
  return v5;
}

- (CGSize)dimensions
{
  __int128 *v3;
  double v4;
  ALAssetRepresentationPrivate *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  float64_t v12;
  double v13;
  float64x2_t v14;
  double v15;
  double v16;
  double v17;
  float64_t v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[7];
  uint64_t v23;
  float64x2_t *v24;
  uint64_t v25;
  const char *v26;
  __int128 v27;
  uint64_t v28;
  float64x2_t *v29;
  uint64_t v30;
  const char *v31;
  __int128 v32;
  _QWORD v33[4];
  CGSize result;

  v3 = (__int128 *)MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v17 = *MEMORY[0x24BDBF148];
  if (-[ALAssetRepresentation isValid](self, "isValid"))
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0x3FF0000000000000;
    v28 = 0;
    v29 = (float64x2_t *)&v28;
    v30 = 0x3010000000;
    v31 = "";
    v32 = *v3;
    v23 = 0;
    v24 = (float64x2_t *)&v23;
    v25 = 0x3010000000;
    v26 = "";
    v27 = v32;
    v5 = -[ALAssetRepresentation internal](self, "internal");
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __35__ALAssetRepresentation_dimensions__block_invoke;
    v22[3] = &unk_24C5ECC30;
    v22[4] = v33;
    v22[5] = &v28;
    v22[6] = &v23;
    -[ALAssetRepresentationPrivate _performBlockAndWait:](v5, "_performBlockAndWait:", v22);
    if (-[ALAssetRepresentationPrivate sidecar](-[ALAssetRepresentation internal](self, "internal"), "sidecar"))
    {
      v7 = v29[2].f64[0];
      v6 = v29[2].f64[1];
      if (v7 != v17 || v6 != v4)
      {
        v9 = v24[2].f64[0];
        v8 = v24[2].f64[1];
        if (v9 != v17 || v8 != v4)
        {
          v10 = v8 == v6 && v9 == v7;
          v20 = 0;
          v21 = 0;
          v19 = 0;
          MEMORY[0x212B9B200](-[ALAssetRepresentation metadata](self, "metadata"), &v21, &v20, &v19);
          objc_msgSend(v21, "intValue");
          if (PLIsRotatedExifOrientation())
          {
            objc_msgSend(v19, "doubleValue");
            v18 = v11;
            objc_msgSend(v20, "doubleValue");
          }
          else
          {
            objc_msgSend(v20, "doubleValue");
            v18 = v13;
            objc_msgSend(v19, "doubleValue");
          }
          v14.f64[0] = v18;
          v14.f64[1] = v12;
          if (!v10)
            v14 = vdivq_f64(v14, vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(v29[2], v24[2]))));
          v4 = v14.f64[1];
          v17 = v14.f64[0];
        }
      }
    }
    else
    {
      v4 = v24[2].f64[1];
      v17 = v24[2].f64[0];
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v33, 8);
  }
  v15 = v17;
  v16 = v4;
  result.height = v16;
  result.width = v15;
  return result;
}

- (uint64_t)size
{
  int v2;
  stat v4;

  v2 = -[ALAssetRepresentation _fileDescriptor](self, "_fileDescriptor");
  if (v2 < 0)
    return 0;
  memset(&v4, 0, sizeof(v4));
  if (fstat(v2, &v4))
    return 0;
  else
    return v4.st_size;
}

- (NSUInteger)getBytes:(uint8_t *)buffer fromOffset:(uint64_t)offset length:(NSUInteger)length error:(NSError *)error
{
  int v10;

  if (!-[ALAssetRepresentation isValid](self, "isValid", buffer, offset, length, error))
    return 0;
  v10 = -[ALAssetRepresentation _fileDescriptor](self, "_fileDescriptor");
  if (v10 < 0)
    return 0;
  else
    return pread(v10, buffer, length, offset);
}

- (id)_imageData
{
  size_t v3;
  size_t v4;
  void *v5;
  id result;
  void *v7;

  v3 = -[ALAssetRepresentation size](self, "size");
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = v3;
  if (_imageDataUsesMap != 1
    || (v5 = mmap(0, v3, 1, 1, -[ALAssetRepresentation _fileDescriptor](self, "_fileDescriptor"), 0),
        v5 == (void *)-1)
    || (result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:deallocator:", v5, v4, &__block_literal_global_17)) == 0)
  {
    v7 = malloc_type_malloc(v4, 0x98345673uLL);
    if (v4 == -[ALAssetRepresentation getBytes:fromOffset:length:error:](self, "getBytes:fromOffset:length:error:", v7, 0, v4, 0))return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v7, v4);
    free(v7);
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "data");
  }
  return result;
}

- (CGImage)CGImageWithOptions:(id)a3 format:(unsigned __int16)a4
{
  void *v5;
  CGImage *v6;
  id v7;
  ALAssetRepresentationPrivate *v9;
  CGImage *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  if (!-[ALAssetRepresentation isValid](self, "isValid", a3))
    return 0;
  if (-[ALAssetRepresentationPrivate _isImage](-[ALAssetRepresentation internal](self, "internal"), "_isImage"))
  {
    if (-[ALAssetRepresentation _imageData](self, "_imageData"))
    {
      -[ALAssetRepresentation filename](self, "filename");
      PLGetSourceTypeHintFromFilename();
      v5 = (void *)PLCreateImageFromDataWithFormat();
      v6 = (CGImage *)objc_msgSend(v5, "CGImage");
      v7 = v5;
      return v6;
    }
    return 0;
  }
  if (!-[ALAssetRepresentationPrivate _isVideo](-[ALAssetRepresentation internal](self, "internal"), "_isVideo"))
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__14;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  v9 = -[ALAssetRepresentation internal](self, "internal");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__ALAssetRepresentation_CGImageWithOptions_format___block_invoke;
  v12[3] = &unk_24C5ECC98;
  v12[4] = &v13;
  -[ALAssetRepresentationPrivate _performBlockAndWait:](v9, "_performBlockAndWait:", v12);
  v10 = (CGImage *)objc_msgSend((id)v14[5], "CGImage");
  v11 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (CGImageRef)CGImageWithOptions:(NSDictionary *)options
{
  return -[ALAssetRepresentation CGImageWithOptions:format:](self, "CGImageWithOptions:format:", options, 9998);
}

- (CGImageRef)fullResolutionImage
{
  return -[ALAssetRepresentation CGImageWithOptions:](self, "CGImageWithOptions:", 0);
}

- (CGImage)zoomableDisplayImage
{
  return -[ALAssetRepresentation _largeDisplayableImageForFormatID:](self, "_largeDisplayableImageForFormatID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72240], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID"));
}

- (CGImageRef)fullScreenImage
{
  return -[ALAssetRepresentation _largeDisplayableImageForFormatID:](self, "_largeDisplayableImageForFormatID:", 4007);
}

- (CGImage)_largeDisplayableImageForFormatID:(unsigned __int16)a3
{
  ALAssetRepresentationPrivate *v4;
  CGImage *v5;
  id v6;
  _QWORD v8[5];
  unsigned __int16 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__15;
  v15 = 0;
  v4 = -[ALAssetRepresentation internal](self, "internal");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ALAssetRepresentation__largeDisplayableImageForFormatID___block_invoke;
  v8[3] = &unk_24C5ECCC0;
  v9 = a3;
  v8[4] = &v10;
  -[ALAssetRepresentationPrivate _performBlockAndWait:](v4, "_performBlockAndWait:", v8);
  v5 = (CGImage *)objc_msgSend((id)v11[5], "CGImage");
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (NSURL)url
{
  ALAssetRepresentationPrivate *v3;
  NSURL *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  if (-[ALAssetRepresentation isValid](self, "isValid"))
  {
    v3 = -[ALAssetRepresentation internal](self, "internal");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __28__ALAssetRepresentation_url__block_invoke;
    v6[3] = &unk_24C5ECC98;
    v6[4] = &v7;
    -[ALAssetRepresentationPrivate _performBlockAndWait:](v3, "_performBlockAndWait:", v6);
  }
  v4 = (NSURL *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSDictionary)metadata
{
  NSDictionary *v3;
  const __CFData *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[ALAssetRepresentation isValid](self, "isValid"))
  {
    if (-[ALAssetRepresentationPrivate _isImage](-[ALAssetRepresentation internal](self, "internal"), "_isImage"))
    {
      -[ALAssetRepresentation setIgnoreRead:](self, "setIgnoreRead:", 1);
      v4 = -[ALAssetRepresentation _imageData](self, "_imageData");
      -[ALAssetRepresentation setIgnoreRead:](self, "setIgnoreRead:", 0);
      if (v4)
      {
        v5 = CGImageSourceCreateWithData(v4, 0);
        if (v5)
        {
          v6 = v5;
          v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
          if (v7)
          {
            v8 = v7;
            -[NSDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v7);
            CFRelease(v8);
          }
          CFRelease(v6);
        }
      }
    }
  }
  return v3;
}

- (ALAssetOrientation)orientation
{
  ALAssetRepresentationPrivate *v2;
  ALAssetOrientation v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = -[ALAssetRepresentation internal](self, "internal");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__ALAssetRepresentation_orientation__block_invoke;
  v5[3] = &unk_24C5ECC98;
  v5[4] = &v6;
  -[ALAssetRepresentationPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (float)scale
{
  return 1.0;
}

- (NSString)filename
{
  ALAssetRepresentationPrivate *v2;
  NSString *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  v2 = -[ALAssetRepresentation internal](self, "internal");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__ALAssetRepresentation_filename__block_invoke;
  v5[3] = &unk_24C5ECC98;
  v5[4] = &v6;
  -[ALAssetRepresentationPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (ALAssetRepresentationPrivate)internal
{
  return (ALAssetRepresentationPrivate *)self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)ignoreRead
{
  return self->_ignoreRead;
}

- (void)setIgnoreRead:(BOOL)a3
{
  self->_ignoreRead = a3;
}

id __33__ALAssetRepresentation_filename__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  uint64_t v7;

  if (a4)
  {
    v5 = a4;
LABEL_6:
    v7 = objc_msgSend(v5, "originalFilename");
    goto LABEL_7;
  }
  if (!+[ALAssetsLibrary _linkedBefore7](ALAssetsLibrary, "_linkedBefore7"))
  {
    v5 = a3;
    goto LABEL_6;
  }
  v7 = objc_msgSend(a3, "filename");
LABEL_7:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v7;
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

uint64_t __36__ALAssetRepresentation_orientation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  objc_msgSend(a3, "orientation");
  result = PLImageOrientationFromExifOrientation();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id __28__ALAssetRepresentation_url__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id result;

  result = (id)objc_msgSend(a2, "assetURLForPhoto:extension:", a3, a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __59__ALAssetRepresentation__largeDisplayableImageForFormatID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE71F68], "sharedAssetsSaver"), "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", objc_msgSend(a3, "objectID"), *(unsigned __int16 *)(a1 + 40), 1, 0, 0, 0, 0, 0);
  objc_msgSend(a3, "uniformTypeIdentifier");
  result = PLCreateImageFromDataWithFormat();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __51__ALAssetRepresentation_CGImageWithOptions_format___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  PLPushPhotoLibraryClient();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = (id)objc_msgSend(a3, "imageWithFormat:", 4007);
  return PLPopPhotoLibraryClient();
}

void __35__ALAssetRepresentation__imageData__block_invoke(int a1, void *a2, size_t a3)
{
  if (munmap(a2, a3))
    NSLog(CFSTR("failure unmapping %p size %ld"), a2, a3);
}

double __35__ALAssetRepresentation_dimensions__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  uint64_t v14;

  *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = (double)(int)objc_msgSend(a3, "orientation");
  v5 = objc_msgSend(a3, "originalWidth");
  v6 = objc_msgSend(a3, "originalHeight");
  v7 = objc_msgSend(a3, "width");
  v8 = objc_msgSend(a3, "height");
  v9 = PLIsRotatedExifOrientation();
  v10 = *(_QWORD *)(a1[5] + 8);
  if (v9)
    v11 = v6;
  else
    v11 = v5;
  if (v9)
    v12 = v5;
  else
    v12 = v6;
  *(double *)(v10 + 32) = (double)v11;
  *(double *)(v10 + 40) = (double)v12;
  result = (double)v7;
  v14 = *(_QWORD *)(a1[6] + 8);
  *(double *)(v14 + 32) = (double)v7;
  *(double *)(v14 + 40) = (double)v8;
  return result;
}

+ (void)_enableImageDataUsesMap
{
  _imageDataUsesMap = 1;
}

@end
