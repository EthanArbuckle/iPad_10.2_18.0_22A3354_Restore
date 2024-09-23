@implementation CPBitmapStore

- (CPBitmapStore)initWithPath:(id)a3 version:(int)a4
{
  CPBitmapStore *v6;
  NSString *v7;
  NSCache *v8;
  NSObject *v9;
  NSObject *global_queue;
  NSObject *v11;
  NSObject *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CPBitmapStore;
  v6 = -[CPBitmapStore init](&v14, sel_init);
  if (v6)
  {
    v7 = (NSString *)a3;
    v6->_path = v7;
    if (access(-[NSString fileSystemRepresentation](v7, "fileSystemRepresentation"), 4))
      mkpath_np((const char *)objc_msgSend(-[CPBitmapStore imagePath](v6, "imagePath"), "fileSystemRepresentation"), 0x1EDu);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v6->_cache = v8;
    -[NSCache setName:](v8, "setName:", CFSTR("com.apple.cpbitmapstore"));
    -[NSCache setCountLimit:](v6->_cache, "setCountLimit:", 40);
    v9 = dispatch_queue_create("SerialQueueRemoveImagesBackground", 0);
    v6->_serialQueueRemoveImagesBackground = (OS_dispatch_queue *)v9;
    global_queue = dispatch_get_global_queue(9, 0);
    dispatch_set_target_queue(v9, global_queue);
    v11 = dispatch_queue_create("SerialQueueRemoveImagesDefault", 0);
    v6->_serialQueueRemoveImagesDefault = (OS_dispatch_queue *)v11;
    v12 = dispatch_get_global_queue(21, 0);
    dispatch_set_target_queue(v11, v12);
    v6->_version = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_serialQueueRemoveImagesBackground);
  dispatch_release((dispatch_object_t)self->_serialQueueRemoveImagesDefault);
  v3.receiver = self;
  v3.super_class = (Class)CPBitmapStore;
  -[CPBitmapStore dealloc](&v3, sel_dealloc);
}

- (unint64_t)cacheItemLimit
{
  return -[NSCache countLimit](self->_cache, "countLimit");
}

- (void)setCacheItemLimit:(unint64_t)a3
{
  -[NSCache setCountLimit:](self->_cache, "setCountLimit:", a3);
}

- (id)imageNameForKey:(id)a3 inGroup:(id)a4
{
  id result;

  result = malloc_type_malloc(0x32uLL, 0xE882C7F9uLL);
  if (result)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", result, snprintf((char *)result, 0x32uLL, "%lu%lu", objc_msgSend(a4, "hash"), objc_msgSend(a3, "hash")), 1, 1);
  return result;
}

- (id)cacheNumberForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a3, "hash"));
}

- (BOOL)findImageWithKey:(id)a3 inGroup:(id)a4 andInfo:(_img *)a5
{
  a5->var0 = -[CPBitmapStore imageNameForKey:inGroup:](self, "imageNameForKey:inGroup:", a3, a4);
  return 1;
}

- (BOOL)saveImageWithKey:(id)a3 inGroup:(id)a4 andInfo:(_img *)a5
{
  return 1;
}

- (void)openAndMmap:(id)a3 withInfo:(_img *)a4
{
  int v5;
  int v6;
  BOOL v7;
  unsigned int *v8;
  unsigned int *v9;
  size_t st_size;
  uint64_t v11;
  __int128 v12;
  uint64_t AlignedBytesPerRow;
  unint64_t v15;
  stat v17;

  v5 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 256);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    memset(&v17, 0, sizeof(v17));
    if (fstat(v5, &v17) < 0
      || ((v17.st_mode & 0xF000) == 0x8000 ? (v7 = v17.st_nlink > 1u) : (v7 = 1),
          v7 || (v8 = (unsigned int *)mmap(0, v17.st_size, 1, 1, v6, 0), v8 == (unsigned int *)-1)))
    {
      close(v6);
    }
    else
    {
      v9 = v8;
      st_size = v17.st_size;
      close(v6);
      if (v9)
      {
        if (st_size >= 0x30 && *v9 == 1129333331 && v9[1] == 1)
        {
          a4->var1 = v9[2];
          v11 = *(_QWORD *)(v9 + 3);
          *(_QWORD *)&v12 = v11;
          *((_QWORD *)&v12 + 1) = HIDWORD(v11);
          *(_OWORD *)&a4->var2 = v12;
          a4->var4 = v9[5];
          a4->var5 = *((_BYTE *)v9 + 24);
          a4->var6[0] = *((_BYTE *)v9 + 25);
          a4->var6[1] = *((_BYTE *)v9 + 26);
          a4->var6[2] = *((_BYTE *)v9 + 27);
          a4->var6[3] = *((_BYTE *)v9 + 28);
          AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
          if (a4->var4 == AlignedBytesPerRow)
          {
            v15 = (*MEMORY[0x1E0C85AD8] + a4->var3 * AlignedBytesPerRow + 47) & -*MEMORY[0x1E0C85AD8];
            if (a4->var1 == v15 && v15 == st_size)
              return v9 + 12;
          }
        }
        munmap(v9, st_size);
      }
    }
  }
  return 0;
}

- (unsigned)memContentOffset
{
  return 48;
}

- (CGImage)copyImageForKey:(id)a3
{
  return 0;
}

- (id)allGroups
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

- (CGImage)copyImageForKey:(id)a3 inGroup:(id)a4
{
  id v7;
  CGImage *v8;
  id v10;
  CGImageRef image_with_memory;
  unsigned int v12;
  size_t v13[2];
  __int128 v14;
  __int128 v15;

  v7 = -[CPBitmapStore cacheNumberForKey:](self, "cacheNumberForKey:");
  v8 = -[NSCache objectForKey:](self->_cache, "objectForKey:", v7);
  if (v8)
    return CGImageRetain(v8);
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)v13 = 0u;
  if (!-[CPBitmapStore findImageWithKey:inGroup:andInfo:](self, "findImageWithKey:inGroup:andInfo:", a3, a4, v13))
    return 0;
  v10 = -[CPBitmapStore imagePath](self, "imagePath");
  image_with_memory = -[CPBitmapStore openAndMmap:withInfo:](self, "openAndMmap:withInfo:", objc_msgSend(v10, "stringByAppendingPathComponent:", v13[0]), v13);
  if (image_with_memory)
  {
    if (-[CPBitmapStore lockOnRead](self, "lockOnRead"))
      mlock((char *)image_with_memory - 48, v13[1]);
    v12 = -[CPBitmapStore memContentOffset](self, "memContentOffset");
    v13[1] -= v12;
    image_with_memory = create_image_with_memory(image_with_memory, (uint64_t)v13, -[CPBitmapStore memContentOffset](self, "memContentOffset"));
    if (image_with_memory)
      -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", image_with_memory, v7);
  }
  return image_with_memory;
}

- (CGImage)_copyAndStoreImageForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 scale:(double)a7 fillMem:(id)a8 alternateCompletion:(id)a9
{
  uint64_t AlignedBytesPerRow;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  char *v19;
  std::__fs::filesystem::path *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  const std::__fs::filesystem::path *v25;
  std::error_code *v26;
  int v27;
  int v28;
  CGImageRef image_with_memory;
  unsigned int v31;
  size_t v32[2];
  __int128 v33;
  __int128 v34;

  if (a7 == 0.0)
    return 0;
  v34 = 0u;
  *(_QWORD *)&v33 = vcvtpd_u64_f64(a5.width * a7);
  *((_QWORD *)&v33 + 1) = vcvtpd_u64_f64(a5.height * a7);
  BYTE8(v34) = a6;
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v15 = AlignedBytesPerRow * *((_QWORD *)&v33 + 1);
  v16 = -[CPBitmapStore memContentOffset](self, "memContentOffset", 0, 0, v33, AlignedBytesPerRow, *((_QWORD *)&v34 + 1));
  v17 = (v15 + v16 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
  v32[1] = v17;
  *(_DWORD *)((char *)&v34 + 9) = 0;
  v18 = -[CPBitmapStore imagePath](self, "imagePath");
  v19 = strdup((const char *)objc_msgSend((id)objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("tmp.XXXXXXXX")), "fileSystemRepresentation"));
  if (!v19)
    return 0;
  v20 = (std::__fs::filesystem::path *)v19;
  v21 = mkstemp(v19);
  if (v21 < 0)
    goto LABEL_14;
  v22 = v21;
  if (fchmod(v21, 0x180u) < 0 || ftruncate(v22, v17) < 0)
  {
    close(v22);
    goto LABEL_13;
  }
  v23 = mmap(0, v17, 3, 1, v22, 0);
  close(v22);
  if (v23 == (void *)-1)
  {
LABEL_13:
    unlink((const char *)v20);
    goto LABEL_14;
  }
  if (!v23)
  {
LABEL_14:
    free(v20);
    return 0;
  }
  (*((void (**)(id, void *, size_t *))a8 + 2))(a8, v23, v32);
  v32[0] = (size_t)-[CPBitmapStore imageNameForKey:inGroup:](self, "imageNameForKey:inGroup:", a3, a4);
  munmap(v23, v32[1]);
  v24 = (void *)objc_msgSend(v18, "stringByAppendingPathComponent:", v32[0]);
  v25 = (const std::__fs::filesystem::path *)objc_msgSend(v24, "fileSystemRepresentation");
  rename(v20, v25, v26);
  v28 = v27;
  free(v20);
  if (v28 < 0
    || !-[CPBitmapStore saveImageWithKey:inGroup:andInfo:](self, "saveImageWithKey:inGroup:andInfo:", a3, a4, v32))
  {
    return 0;
  }
  if (a9)
  {
    (*((void (**)(id))a9 + 2))(a9);
    return 0;
  }
  image_with_memory = -[CPBitmapStore openAndMmap:withInfo:](self, "openAndMmap:withInfo:", v24, v32);
  if (image_with_memory)
  {
    v31 = -[CPBitmapStore memContentOffset](self, "memContentOffset");
    v32[1] -= v31;
    image_with_memory = create_image_with_memory(image_with_memory, (uint64_t)v32, -[CPBitmapStore memContentOffset](self, "memContentOffset"));
    if (image_with_memory)
      -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", image_with_memory, -[CPBitmapStore cacheNumberForKey:](self, "cacheNumberForKey:", a3));
  }
  return image_with_memory;
}

- (CGImage)copyAndStoreImageForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 draw:(id)a8
{
  _QWORD v9[7];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CPBitmapStore_copyAndStoreImageForKey_inGroup_withSize_opaque_scale_draw___block_invoke;
  v9[3] = &unk_1E2881D20;
  *(double *)&v9[6] = a7;
  v9[4] = self;
  v9[5] = a8;
  return -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, a6, v9, 0, a5.width, a5.height);
}

void __76__CPBitmapStore_copyAndStoreImageForKey_inGroup_withSize_opaque_scale_draw___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  double v7;
  uint64_t v8;
  unsigned int v9;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v11;
  size_t v12;
  size_t v13;
  uint32_t v14;
  CGContext *v15;
  CGAffineTransform v16;

  v6 = objc_msgSend(*(id *)(a1 + 32), "memContentOffset");
  if (v6 >= 1)
  {
    *(_QWORD *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(_BYTE *)(a2 + 24) = *(_BYTE *)(a3 + 40);
    *(_BYTE *)(a2 + 25) = *(_BYTE *)(a3 + 41);
    *(_BYTE *)(a2 + 26) = *(_BYTE *)(a3 + 42);
    *(_BYTE *)(a2 + 27) = *(_BYTE *)(a3 + 43);
    *(_BYTE *)(a2 + 28) = *(_BYTE *)(a3 + 44);
  }
  v7 = *(double *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(unsigned __int8 *)(a3 + 40);
  if (v9 < 3)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
LABEL_7:
    v11 = DeviceRGB;
    v9 = *(unsigned __int8 *)(a3 + 40);
    goto LABEL_8;
  }
  if (v9 - 3 < 2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceGray();
    goto LABEL_7;
  }
  v11 = 0;
LABEL_8:
  if (v9 > 5)
  {
    v12 = 0;
  }
  else
  {
    if (v9 == 2)
    {
      v13 = *(_QWORD *)(a3 + 32);
      v12 = 5;
LABEL_17:
      v14 = 4102;
      goto LABEL_20;
    }
    v12 = 8;
  }
  v13 = *(_QWORD *)(a3 + 32);
  v14 = 8194;
  switch(v9)
  {
    case 0u:
      break;
    case 1u:
      v14 = 8198;
      break;
    case 2u:
      goto LABEL_17;
    case 3u:
      v14 = 1;
      break;
    case 5u:
      v14 = 7;
      break;
    default:
      v14 = 0;
      break;
  }
LABEL_20:
  v15 = CGBitmapContextCreate((void *)(a2 + v6), *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v12, v13, v11, v14);
  CGColorSpaceRelease(v11);
  CGContextTranslateCTM(v15, 0.0, (double)*(unint64_t *)(a3 + 24));
  CGContextScaleCTM(v15, v7, -v7);
  CGAffineTransformMakeScale(&v16, v7, -v7);
  CGContextSetBaseCTM();
  (*(void (**)(uint64_t, CGContext *))(v8 + 16))(v8, v15);
  CGContextRelease(v15);
}

- (void)storeImageForKey:(id)a3 inGroup:(id)a4 opaque:(BOOL)a5 image:(CGImage *)a6
{
  _BOOL8 v7;
  double Width;
  _QWORD v12[7];
  _QWORD v13[6];

  if (a6)
  {
    v7 = a5;
    v12[6] = a6;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke;
    v13[3] = &unk_1E2881D48;
    v13[4] = self;
    v13[5] = a6;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke_2;
    v12[3] = &unk_1E28818C8;
    v12[4] = self;
    v12[5] = a3;
    Width = (double)CGImageGetWidth(a6);
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, v7, v13, v12, Width, (double)CGImageGetHeight(a6), 1.0);
  }
}

void __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  CGDataProvider *DataProvider;
  const __CFData *v8;
  const __CFData *v9;
  void *v10;
  const UInt8 *BytePtr;
  size_t Length;

  v6 = objc_msgSend(*(id *)(a1 + 32), "memContentOffset");
  if (v6 >= 1)
  {
    *(_QWORD *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(_BYTE *)(a2 + 24) = *(_BYTE *)(a3 + 40);
    *(_BYTE *)(a2 + 25) = *(_BYTE *)(a3 + 41);
    *(_BYTE *)(a2 + 26) = *(_BYTE *)(a3 + 42);
    *(_BYTE *)(a2 + 27) = *(_BYTE *)(a3 + 43);
    *(_BYTE *)(a2 + 28) = *(_BYTE *)(a3 + 44);
  }
  DataProvider = CGImageGetDataProvider(*(CGImageRef *)(a1 + 40));
  if (DataProvider)
  {
    v8 = CGDataProviderCopyData(DataProvider);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)(a2 + v6);
      BytePtr = CFDataGetBytePtr(v8);
      Length = CFDataGetLength(v9);
      memcpy(v10, BytePtr, Length);
      CFRelease(v9);
    }
  }
}

uint64_t __55__CPBitmapStore_storeImageForKey_inGroup_opaque_image___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "cacheNumberForKey:", *(_QWORD *)(a1 + 40)));
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 data:(id)a8
{
  _QWORD v8[6];

  if (a8)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__CPBitmapStore_storeImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke;
    v8[3] = &unk_1E2881D70;
    v8[4] = self;
    v8[5] = a8;
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, a6, v8, &__block_literal_global_7, a5.width, a5.height, a7);
  }
}

void *__73__CPBitmapStore_storeImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;

  v6 = objc_msgSend(*(id *)(a1 + 32), "memContentOffset");
  if (v6 >= 1)
  {
    *(_QWORD *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(_BYTE *)(a2 + 24) = *(_BYTE *)(a3 + 40);
    *(_BYTE *)(a2 + 25) = *(_BYTE *)(a3 + 41);
    *(_BYTE *)(a2 + 26) = *(_BYTE *)(a3 + 42);
    *(_BYTE *)(a2 + 27) = *(_BYTE *)(a3 + 43);
    *(_BYTE *)(a2 + 28) = *(_BYTE *)(a3 + 44);
  }
  return memcpy((void *)(a2 + v6), (const void *)objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"));
}

- (void)storeGrayscaleImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 opaque:(BOOL)a6 scale:(double)a7 data:(id)a8
{
  uint64_t v8;
  _QWORD v9[6];

  if (a8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__CPBitmapStore_storeGrayscaleImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke;
    v9[3] = &unk_1E2881D70;
    v9[4] = self;
    v9[5] = a8;
    if (a6)
      v8 = 4;
    else
      v8 = 3;
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, v8, v9, &__block_literal_global_15, a5.width, a5.height, a7);
  }
}

unint64_t __82__CPBitmapStore_storeGrayscaleImageDataForKey_inGroup_withSize_opaque_scale_data___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  int AlignedBytesPerRow;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v6 = objc_msgSend(*(id *)(a1 + 32), "memContentOffset");
  if (v6 >= 1)
  {
    *(_QWORD *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(_BYTE *)(a2 + 24) = *(_BYTE *)(a3 + 40);
    *(_BYTE *)(a2 + 25) = *(_BYTE *)(a3 + 41);
    *(_BYTE *)(a2 + 26) = *(_BYTE *)(a3 + 42);
    *(_BYTE *)(a2 + 27) = *(_BYTE *)(a3 + 43);
    *(_BYTE *)(a2 + 28) = *(_BYTE *)(a3 + 44);
  }
  v7 = 4 * *(_QWORD *)(a3 + 16);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v9 = 2 * *(_QWORD *)(a3 + 16);
  v10 = CGBitmapGetAlignedBytesPerRow();
  v11 = objc_msgSend(*(id *)(a1 + 40), "bytes");
  result = objc_msgSend(*(id *)(a1 + 40), "length");
  if (result >= 4)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)(a3 + 16);
    do
    {
      if (v15 + 1 == v16)
        v17 = (unsigned __int16)((unint64_t)(AlignedBytesPerRow - v7) >> 2);
      else
        v17 = 0;
      v18 = v13 + v17;
      v19 = *(_WORD *)(v11 + 4 * v13 + 2);
      if (v15 + 1 == v16)
        v20 = (unsigned __int16)((unint64_t)(v10 - v9) >> 1);
      else
        v20 = 0;
      v21 = v14 + v20;
      *(_WORD *)(a2 + v6 + 2 * v14) = v19;
      if (v15 + 1 == v16)
        v15 = 0;
      else
        ++v15;
      v14 = v21 + 1;
      v13 = v18 + 1;
    }
    while (v18 + 1 < result >> 2);
  }
  return result;
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 scale:(double)a7 data:(id)a8
{
  -[CPBitmapStore storeImageDataForKey:inGroup:withSize:format:formatColor:scale:data:](self, "storeImageDataForKey:inGroup:withSize:format:formatColor:scale:data:", a3, a4, a6, 0, a8, a5.width, a5.height, a7);
}

- (void)storeImageDataForKey:(id)a3 inGroup:(id)a4 withSize:(CGSize)a5 format:(unsigned __int8)a6 formatColor:(CGColor *)a7 scale:(double)a8 data:(id)a9
{
  _QWORD v9[7];

  if (a9)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__CPBitmapStore_storeImageDataForKey_inGroup_withSize_format_formatColor_scale_data___block_invoke;
    v9[3] = &unk_1E2881DD8;
    v9[5] = a9;
    v9[6] = a7;
    v9[4] = self;
    -[CPBitmapStore _copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:](self, "_copyAndStoreImageForKey:inGroup:withSize:format:scale:fillMem:alternateCompletion:", a3, a4, a6, v9, &__block_literal_global_16, a5.width, a5.height, a8);
  }
}

uint64_t __85__CPBitmapStore_storeImageDataForKey_inGroup_withSize_format_formatColor_scale_data___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  CGColor *v7;
  size_t NumberOfComponents;
  const CGFloat *Components;
  _BYTE *v10;
  double v11;

  v6 = objc_msgSend(*(id *)(a1 + 32), "memContentOffset");
  if (v6 >= 1)
  {
    if (a3)
    {
      v7 = *(CGColor **)(a1 + 48);
      if (v7)
      {
        if (*(_BYTE *)(a3 + 40) == 5)
        {
          NumberOfComponents = CGColorGetNumberOfComponents(*(CGColorRef *)(a1 + 48));
          Components = CGColorGetComponents(v7);
          if (NumberOfComponents)
          {
            v10 = (_BYTE *)(a3 + 41);
            do
            {
              v11 = *Components++;
              *v10++ = (int)(v11 * 255.0);
              --NumberOfComponents;
            }
            while (NumberOfComponents);
          }
        }
      }
    }
    *(_QWORD *)a2 = 0x143504253;
    *(int32x4_t *)(a2 + 8) = vuzp1q_s32(*(int32x4_t *)(a3 + 8), *(int32x4_t *)(a3 + 24));
    *(_BYTE *)(a2 + 24) = *(_BYTE *)(a3 + 40);
    *(_BYTE *)(a2 + 25) = *(_BYTE *)(a3 + 41);
    *(_BYTE *)(a2 + 26) = *(_BYTE *)(a3 + 42);
    *(_BYTE *)(a2 + 27) = *(_BYTE *)(a3 + 43);
    *(_BYTE *)(a2 + 28) = *(_BYTE *)(a3 + 44);
  }
  return objc_msgSend(*(id *)(a1 + 40), "getBytes:length:", a2 + v6, objc_msgSend(*(id *)(a1 + 40), "length"));
}

- (void)removeImagesInGroups:(id)a3
{
  -[CPBitmapStore removeImagesInGroups:completion:](self, "removeImagesInGroups:completion:", a3, 0);
}

- (void)removeImagesInGroups:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *serialQueueRemoveImagesBackground;
  _QWORD block[9];

  if (objc_msgSend(a3, "count"))
  {
    v7 = -[CPBitmapStore imagePath](self, "imagePath");
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", v7, 0);
    v9 = objc_msgSend(a4, "copy");
    serialQueueRemoveImagesBackground = self->_serialQueueRemoveImagesBackground;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke;
    block[3] = &unk_1E2881E48;
    block[4] = a3;
    block[5] = v8;
    block[6] = v7;
    block[7] = self;
    block[8] = v9;
    dispatch_async(serialQueueRemoveImagesBackground, block);
  }
}

void __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_2;
  v32[3] = &unk_1E2881E20;
  v32[4] = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v32);
  v4 = dispatch_group_create();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 40);
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v22 = v5;
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v25 != v9)
                objc_enumerationMutation(v2);
              v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "hasPrefix:", v11))
              {
                v12 = objc_msgSend(v6, "isAbsolutePath");
                v13 = v6;
                if ((v12 & 1) == 0)
                  v13 = (void *)objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v6);
                unlink((const char *)objc_msgSend(v13, "fileSystemRepresentation"));
                v14 = (void *)objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "substringFromIndex:", objc_msgSend(v11, "length"));
                v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v14, "UTF8String"), 0, 10));
                v16 = *(_QWORD *)(a1 + 56);
                v17 = *(NSObject **)(v16 + 56);
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_3;
                block[3] = &unk_1E2881868;
                block[4] = v16;
                block[5] = v15;
                dispatch_group_async(v4, v17, block);
              }
            }
            v8 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          }
          while (v8);
        }
        v5 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v21);
  }
  v18 = *(void **)(a1 + 64);
  if (v18)
  {
    dispatch_group_notify(v4, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 56) + 48), v18);

  }
  dispatch_release(v4);
}

char *__49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  char *result;

  result = (char *)malloc_type_malloc(0x32uLL, 0x9A08B503uLL);
  if (result)
  {
    result = (char *)objc_msgSend(*(id *)(a1 + 32), "addObject:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", result, snprintf(result, 0x32uLL, "%lu", objc_msgSend(a2, "hash")), 1, 1));
    *a3 = 0;
  }
  return result;
}

uint64_t __49__CPBitmapStore_removeImagesInGroups_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)imagePath
{
  id result;

  result = self->_imagePath;
  if (!result)
  {
    result = -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", CFSTR("images"));
    self->_imagePath = (NSString *)result;
  }
  return result;
}

- (unint64_t)imageCount
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "subpathsAtPath:", -[CPBitmapStore imagePath](self, "imagePath")), "count");
}

- (void)purge
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", self->_path, 0);
}

- (id)_versionPath
{
  id result;

  result = self->_versionPath;
  if (!result)
  {
    result = -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", CFSTR("version"));
    self->_versionPath = (NSString *)result;
  }
  return result;
}

- (int)version
{
  void *v3;
  int result;
  uint64_t v5;

  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[CPBitmapStore _versionPath](self, "_versionPath")))return -1;
  v5 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", -[CPBitmapStore _versionPath](self, "_versionPath"), 4, &v5);
  if (v5)
    return -1;
  result = objc_msgSend(v3, "intValue");
  self->_version = result;
  return result;
}

- (int)setVersion:(int)a3
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), "stringValue"), "writeToFile:atomically:encoding:error:", -[CPBitmapStore _versionPath](self, "_versionPath"), 1, 4, 0);
  return -[CPBitmapStore version](self, "version");
}

- (BOOL)lockOnRead
{
  return self->_lockOnRead;
}

- (void)setLockOnRead:(BOOL)a3
{
  self->_lockOnRead = a3;
}

@end
