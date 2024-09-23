@implementation NUNICloudCoverFileConverter

- (NUNICloudCoverFileConverter)init
{
  NUNICloudCoverFileConverter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *privateQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUNICloudCoverFileConverter;
  v2 = -[NUNICloudCoverFileConverter init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoUniverse.NUNICloudCoverFileConverter", 0);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)convertFileAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *privateQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NUNICloudCoverFileConverter_convertFileAt_to_error___block_invoke;
  block[3] = &unk_24CFD7558;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(privateQueue, block);
  LOBYTE(privateQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)privateQueue;
}

uint64_t __54__NUNICloudCoverFileConverter_convertFileAt_to_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_convertFileAt:to:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)combineFilesAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *privateQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NUNICloudCoverFileConverter_combineFilesAt_to_error___block_invoke;
  block[3] = &unk_24CFD7558;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(privateQueue, block);
  LOBYTE(privateQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)privateQueue;
}

uint64_t __55__NUNICloudCoverFileConverter_combineFilesAt_to_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_combineFilesAt:to:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_convertFileAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  CGImage *v8;
  CGImage *v9;
  int Width;
  int Height;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unsigned __int8 *v18;
  id v19;
  void *v20;
  char v21;

  v7 = a4;
  v8 = _NUNICreateImageFromURL(a3, a5);
  if (v8)
  {
    v9 = v8;
    Width = CGImageGetWidth(v8);
    Height = CGImageGetHeight(v9);
    _NUNIRasterizeImageGenericGray(v9, Width, Height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v9);
    _NUNIEqualize(v12, Width, Height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _NUNIInitializeImageGenericGray(Width, Height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _NUNIAddCloudLayer(v13, v14, Width, Height);
    _NUNIConvertEquirectangularToOctahedral(v14, Width, Height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 5592413));
    v17 = objc_msgSend(v16, "mutableBytes");
    *(_WORD *)v17 = 7;
    *(_DWORD *)(v17 + 2) = 134220809;
    *(_WORD *)(v17 + 6) = 2048;
    v18 = (unsigned __int8 *)(v17 + 8);
    v19 = objc_retainAutorelease(v15);
    _NUNIGenerateAllMipmapsR8(v18, (const void *)objc_msgSend(v19, "bytes"));
    objc_msgSend(v7, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "writeToFile:options:error:", v20, 268435457, a5);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_combineFilesAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  CGImage *v13;
  int Width;
  int Height;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  unsigned __int8 *v20;
  void *v21;
  char v22;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _NUNICreateImageFromURL(v12, a5);

      if (!v13)
        break;
      Width = CGImageGetWidth(v13);
      Height = CGImageGetHeight(v13);
      if (!v11)
      {
        _NUNIInitializeImageGenericGray(Width, Height);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      _NUNIRasterizeImageGenericGray(v13, Width, Height);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v13);
      _NUNIEqualize(v16, Width, Height);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _NUNIAddCloudLayer(v10, v11, Width, Height);
      if (objc_msgSend(v7, "count") <= (unint64_t)++v9)
        goto LABEL_9;
    }
    v22 = 0;
  }
  else
  {
    Height = 0;
    Width = 0;
    v11 = 0;
    v10 = 0;
LABEL_9:
    _NUNIConvertEquirectangularToOctahedral(v11, Width, Height);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 5592413));
    v19 = objc_msgSend(v18, "mutableBytes");
    *(_WORD *)v19 = 7;
    *(_DWORD *)(v19 + 2) = 134220809;
    *(_WORD *)(v19 + 6) = 2048;
    v20 = (unsigned __int8 *)(v19 + 8);
    v11 = objc_retainAutorelease(v17);
    _NUNIGenerateAllMipmapsR8(v20, (const void *)objc_msgSend(v11, "bytes"));
    objc_msgSend(v8, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v18, "writeToFile:options:error:", v21, 268435457, a5);

  }
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

@end
