@implementation MTKTextureLoader

intptr_t __68__MTKTextureLoader_newTextureWithCGImage_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "_loadCGImage:options:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  CGImageRelease(*(CGImageRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

intptr_t __65__MTKTextureLoader_newTextureWithData_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "_loadData:options:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;

  if (a2)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:atIndexedSubscript:", a2, *(_QWORD *)(a1 + 72));
    objc_sync_exit(v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "lock");
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "unlock");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[7];

  v6 = a2;
  v7 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke_2;
  v10[3] = &unk_24C3D4C60;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10[5] = a2;
  v10[6] = v9;
  v10[4] = a3;
  objc_msgSend(v8, "finishWithCompletionHandler:", v10);

}

- (void)_loadData:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9;
  _QWORD v10[6];

  v9 = -[MTKTextureLoader newUploaderForOptions:](self, "newUploaderForOptions:", a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke;
  v10[3] = &unk_24C3D4C88;
  v10[4] = v9;
  v10[5] = a5;
  -[MTKTextureLoader _loadData:options:uploader:label:completionHandler:](self, "_loadData:options:uploader:label:completionHandler:", a3, a4, v9, 0, v10);
}

void __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t j;
  unint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[7];
  _QWORD block[13];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  dispatch_semaphore_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v17 = (void *)objc_msgSend(*(id *)(a1 + 32), "newUploaderForOptions:", *(_QWORD *)(a1 + 40));
  v42 = 0;
  v43 = &v42;
  v44 = 0x3052000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  v47 = 0;
  v2 = 0;
  v47 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  while (v2 < objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend((id)v43[5], "addObject:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"));
    ++v2;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3052000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  v41 = dispatch_semaphore_create(0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v29 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = *(void **)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v48, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
        {
          v9 = *(_QWORD *)(a1 + 32);
          v10 = *(_QWORD *)(a1 + 40);
          v11 = *(NSObject **)(v9 + 8);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_48;
          block[3] = &unk_24C3D4B70;
          block[4] = v9;
          block[5] = v8;
          block[6] = v10;
          block[8] = &v24;
          block[9] = &v30;
          block[10] = &v36;
          block[7] = v17;
          block[11] = &v42;
          block[12] = v5 + i;
          dispatch_async(v11, block);
        }
        else
        {
          objc_msgSend((id)v25[5], "lock");
          if (!v31[5])
          {
            v12 = _newMTKTextureErrorWithCodeAndErrorString(0, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find resource %@ at specified location."), objc_msgSend(v8, "lastPathComponent")));
            v31[5] = v12;
          }
          objc_msgSend((id)v25[5], "unlock");
          dispatch_semaphore_signal((dispatch_semaphore_t)v37[5]);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v48, 16);
      v5 += i;
    }
    while (v4);
  }
  for (j = 0; ; ++j)
  {
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    v15 = v37[5];
    if (j >= v14)
      break;
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  dispatch_release(v15);

  v16 = (id)v43[5];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_3;
  v18[3] = &unk_24C3D4B98;
  v18[4] = *(_QWORD *)(a1 + 56);
  v18[5] = &v42;
  v18[6] = &v30;
  objc_msgSend(v17, "finishWithCompletionHandler:", v18);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

- (id)newUploaderForOptions:(id)a3
{
  int v5;
  char v6;
  MTLCommandQueue *blitQueue;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("MTKTextureLoaderOptionGenerateMipmaps")), "BOOLValue");
  if (!objc_msgSend(a3, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureStorageMode")))
  {
    if (v5)
      goto LABEL_6;
LABEL_10:
    blitQueue = 0;
    return -[MTKTextureUploader initWithDevice:commandQueue:notifyQueue:]([MTKTextureUploader alloc], "initWithDevice:commandQueue:notifyQueue:", self->_device, blitQueue, self->_notifyQueue);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureStorageMode")), "unsignedIntegerValue") == 2)v6 = 1;
  else
    v6 = v5;
  if ((v6 & 1) == 0)
    goto LABEL_10;
LABEL_6:
  objc_sync_enter(self);
  if (!self->_blitQueue)
    self->_blitQueue = (MTLCommandQueue *)-[MTLDeviceSPI newCommandQueue](self->_device, "newCommandQueue");
  objc_sync_exit(self);
  blitQueue = self->_blitQueue;
  return -[MTKTextureUploader initWithDevice:commandQueue:notifyQueue:]([MTKTextureUploader alloc], "initWithDevice:commandQueue:notifyQueue:", self->_device, blitQueue, self->_notifyQueue);
}

uint64_t __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];
  uint64_t v7;

  v7 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "newTextureWithData:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v7);

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MTKTextureLoaderOptionGenerateMipmaps")), "BOOLValue"))objc_msgSend(*(id *)(a1 + 32), "generateMipmapsForTexture:", v2);
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_4;
  v6[3] = &unk_24C3D4CD8;
  v4 = *(_QWORD *)(a1 + 56);
  v6[4] = v2;
  v6[5] = v7;
  v6[6] = v4;
  return objc_msgSend(v3, "finishWithCompletionHandler:", v6);
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[7];
  uint64_t v7;

  v7 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithData:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v7);
  v3 = v2;
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v2, "setLabel:");

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MTKTextureLoaderOptionGenerateMipmaps")), "BOOLValue"))objc_msgSend(*(id *)(a1 + 32), "generateMipmapsForTexture:", v3);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 64) + 24);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_4;
  v6[3] = &unk_24C3D4CD8;
  v6[4] = v3;
  v6[5] = v7;
  v6[6] = v4;
  dispatch_async(v5, v6);
}

- (void)_loadCGImage:(CGImage *)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9;
  MTKTextureLoaderImageIO *v10;
  MTKTextureLoaderImageIO *v11;
  NSObject *uploadQueue;
  _QWORD *v13;
  _QWORD v14[8];
  _QWORD block[6];
  _QWORD v16[6];
  uint64_t v17;

  v9 = -[MTKTextureLoader newUploaderForOptions:](self, "newUploaderForOptions:", a4);
  v17 = 0;
  v10 = -[MTKTextureLoaderImageIO initWithCGImage:options:error:]([MTKTextureLoaderImageIO alloc], "initWithCGImage:options:error:", a3, a4, &v17);
  if (v10)
  {
    v11 = v10;
    if (-[MTKTextureLoader validateGenerateMipmapsForPixelFormat:options:error:](self, "validateGenerateMipmapsForPixelFormat:options:error:", -[MTKTextureLoaderData pixelFormat](v10, "pixelFormat"), a4, &v17))
    {
      uploadQueue = self->_uploadQueue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_3;
      v14[3] = &unk_24C3D4BC0;
      v14[4] = v9;
      v14[5] = v11;
      v14[6] = a4;
      v14[7] = a5;
      v13 = v14;
    }
    else
    {

      uploadQueue = self->_notifyQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_2;
      block[3] = &unk_24C3D4CB0;
      block[4] = v17;
      block[5] = a5;
      v13 = block;
    }
  }
  else
  {
    uploadQueue = self->_notifyQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke;
    v16[3] = &unk_24C3D4CB0;
    v16[4] = v17;
    v16[5] = a5;
    v13 = v16;
  }
  dispatch_async(uploadQueue, v13);

}

- (void)_loadData:(id)a3 options:(id)a4 uploader:(id)a5 label:(id)a6 completionHandler:(id)a7
{
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *notifyQueue;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v11 = 0;
  v22 = 0;
  v12 = -[MTKTextureLoader _determineFileType:](self, "_determineFileType:") - 1;
  if (v12 <= 3)
    v11 = (void *)objc_msgSend(objc_alloc(*off_24C3D4D90[v12]), "initWithData:options:error:", a3, a4, &v22);
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  objc_msgSend(v11, "pixelFormat");
  MTLPixelFormatGetInfoForDevice();

  v13 = v22;
  if (!v22)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(0, "pixelFormat");
    v15 = objc_msgSend(v14, "stringWithFormat:", CFSTR("Pixel format(%s) is not valid on this device"), MTLPixelFormatGetName());
    v13 = _newMTKTextureErrorWithCodeAndErrorString(0, v15);
    v22 = v13;
  }
  notifyQueue = self->_notifyQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke;
  v17[3] = &unk_24C3D4CB0;
  v17[4] = v13;
  v17[5] = a7;
  dispatch_async(notifyQueue, v17);
}

- (BOOL)validateGenerateMipmapsForPixelFormat:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  BOOL v6;

  if (!objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionGenerateMipmaps")), "BOOLValue"))return 1;
  MTLPixelFormatGetInfoForDevice();
  v6 = 0;
  if (a5)
    *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("MTKTextureLoaderOptionGenerateMipmaps is only supported for color renderable and filterable pixel formats"));
  return v6;
}

- (unint64_t)_determineFileType:(id)a3
{
  if (+[MTKTextureLoaderKTX isKTXFile:](MTKTextureLoaderKTX, "isKTXFile:"))
    return 1;
  if (+[MTKTextureLoaderPVR isPVRFile:](MTKTextureLoaderPVR, "isPVRFile:", a3))
    return 2;
  if (+[MTKTextureLoaderPVR3 isPVR3File:](MTKTextureLoaderPVR3, "isPVR3File:", a3))
    return 3;
  return 4;
}

intptr_t __56__MTKTextureLoader_newTextureWithCGImage_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __53__MTKTextureLoader_newTextureWithData_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__MTKTextureLoader__loadData_options_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

intptr_t __62__MTKTextureLoader_newTextureWithContentsOfURL_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_3(_QWORD *a1)
{
  (*(void (**)(void))(a1[4] + 16))();

}

uint64_t __74__MTKTextureLoader_newTextureWithContentsOfURL_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  objc_opt_class();
  objc_opt_isKindOfClass();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newTextureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v9 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__MTKTextureLoader_newTextureWithCGImage_options_error___block_invoke;
  v12[3] = &unk_24C3D4C10;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  -[MTKTextureLoader newTextureWithCGImage:options:completionHandler:](self, "newTextureWithCGImage:options:completionHandler:", cgImage, options, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error)
    *error = (NSError *)(id)v14[5];
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)newTextureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  NSObject *loadQueue;
  _QWORD v10[8];

  CGImageRetain(cgImage);
  loadQueue = self->_loadQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__MTKTextureLoader_newTextureWithCGImage_options_completionHandler___block_invoke;
  v10[3] = &unk_24C3D4BE8;
  v10[4] = self;
  v10[5] = options;
  v10[6] = completionHandler;
  v10[7] = cgImage;
  dispatch_async(loadQueue, v10);
}

- (id)newTextureWithContentsOfURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v9 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__MTKTextureLoader_newTextureWithContentsOfURL_options_error___block_invoke;
  v12[3] = &unk_24C3D4C10;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  -[MTKTextureLoader newTextureWithContentsOfURL:options:completionHandler:](self, "newTextureWithContentsOfURL:options:completionHandler:", URL, options, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error)
    *error = (NSError *)(id)v14[5];
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)newTextureWithContentsOfURL:(NSURL *)URL options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (URL)
  {
    v11[0] = URL;
    v8 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__MTKTextureLoader_newTextureWithContentsOfURL_options_completionHandler___block_invoke;
    v10[3] = &unk_24C3D4B20;
    v10[4] = completionHandler;
    -[MTKTextureLoader newTexturesWithContentsOfURLs:options:completionHandler:](self, "newTexturesWithContentsOfURLs:options:completionHandler:", v8, options, v10);
  }
  else
  {
    v9 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("URL is nil"));
    (*((void (**)(MTKTextureLoaderCallback, _QWORD))completionHandler + 2))(completionHandler, 0);

  }
}

- (void)newTexturesWithContentsOfURLs:(NSArray *)URLs options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler
{
  NSObject *loadQueue;
  _QWORD v6[8];

  loadQueue = self->_loadQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke;
  v6[3] = &unk_24C3D4BC0;
  v6[4] = self;
  v6[5] = options;
  v6[6] = URLs;
  v6[7] = completionHandler;
  dispatch_async(loadQueue, v6);
}

- (id)newTextureWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v9 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__MTKTextureLoader_newTextureWithData_options_error___block_invoke;
  v12[3] = &unk_24C3D4C10;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  -[MTKTextureLoader newTextureWithData:options:completionHandler:](self, "newTextureWithData:options:completionHandler:", data, options, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error)
    *error = (NSError *)(id)v14[5];
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)newTextureWithData:(NSData *)data options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  NSObject *loadQueue;
  _QWORD v6[8];

  loadQueue = self->_loadQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__MTKTextureLoader_newTextureWithData_options_completionHandler___block_invoke;
  v6[3] = &unk_24C3D4BC0;
  v6[4] = self;
  v6[5] = data;
  v6[6] = options;
  v6[7] = completionHandler;
  dispatch_async(loadQueue, v6);
}

- (void)dealloc
{
  objc_super v3;

  self->_device = 0;
  dispatch_release((dispatch_object_t)self->_notifyQueue);
  self->_notifyQueue = 0;
  dispatch_release((dispatch_object_t)self->_uploadQueue);
  self->_uploadQueue = 0;
  dispatch_release((dispatch_object_t)self->_loadQueue);
  self->_loadQueue = 0;
  dispatch_release((dispatch_object_t)self->_loadSemaphore);
  self->_loadSemaphore = 0;

  self->_blitQueue = 0;
  self->_bufferAllocator = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTKTextureLoader;
  -[MTKTextureLoader dealloc](&v3, sel_dealloc);
}

- (MTKTextureLoader)initWithDevice:(id)device
{
  id v4;
  NSObject *v5;
  NSObject *initially_inactive;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTKTextureLoader;
  v4 = -[MTKTextureLoader init](&v11, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 7) = device;
    v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_UNSPECIFIED, 0);
    initially_inactive = dispatch_queue_attr_make_initially_inactive(v5);
    v7 = dispatch_queue_create("com.apple.mtktextureloaderload", initially_inactive);
    *((_QWORD *)v4 + 1) = v7;
    dispatch_set_qos_class_floor(v7, QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v4 + 1));
    v8 = dispatch_queue_create("com.apple.mtktextureloaderupload", initially_inactive);
    *((_QWORD *)v4 + 2) = v8;
    dispatch_set_qos_class_floor(v8, QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v4 + 2));
    v9 = dispatch_queue_create("com.apple.mtktextureloadernotify", initially_inactive);
    *((_QWORD *)v4 + 3) = v9;
    dispatch_set_qos_class_floor(v9, QOS_CLASS_DEFAULT, 0);
    dispatch_activate(*((dispatch_object_t *)v4 + 3));
    *((_QWORD *)v4 + 4) = dispatch_semaphore_create(3);
    *((_QWORD *)v4 + 5) = 0;
    *((_QWORD *)v4 + 6) = -[MTKTextureIOBufferAllocator initWithDevice:]([MTKTextureIOBufferAllocator alloc], "initWithDevice:", *((_QWORD *)v4 + 7));
  }
  return (MTKTextureLoader *)v4;
}

void __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)device
{
  return self->_device;
}

intptr_t __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_48(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  v15 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", *(_QWORD *)(a1 + 40), 1, &v15);
  v3 = v2;
  if (v15)
  {
    if (v2)

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "lock");
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = _newMTKTextureErrorWithCodeAndErrorString(0, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid NSData, %@"), objc_msgSend(v15, "localizedDescription")));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "unlock");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v11[0] = MEMORY[0x24BDAC760];
    v11[2] = __76__MTKTextureLoader_newTexturesWithContentsOfURLs_options_completionHandler___block_invoke_2;
    v11[3] = &unk_24C3D4B48;
    v9 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 96);
    v13 = *(_QWORD *)(a1 + 80);
    v14 = v8;
    v11[1] = 3221225472;
    v12 = *(_OWORD *)(a1 + 64);
    v11[4] = v3;
    v11[5] = v9;
    objc_msgSend(v6, "_loadData:options:uploader:label:completionHandler:", v3, v4, v5, v7, v11);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)newTextureWithMDLTexture:(MDLTexture *)texture options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  NSObject *loadQueue;
  _QWORD v6[8];

  loadQueue = self->_loadQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__MTKTextureLoader_newTextureWithMDLTexture_options_completionHandler___block_invoke;
  v6[3] = &unk_24C3D4BC0;
  v6[4] = self;
  v6[5] = texture;
  v6[6] = options;
  v6[7] = completionHandler;
  dispatch_async(loadQueue, v6);
}

intptr_t __71__MTKTextureLoader_newTextureWithMDLTexture_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "_loadMDLTexture:options:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSArray)newTexturesWithContentsOfURLs:(NSArray *)URLs options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v9;
  NSArray *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v9 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__MTKTextureLoader_newTexturesWithContentsOfURLs_options_error___block_invoke;
  v12[3] = &unk_24C3D4C38;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  -[MTKTextureLoader newTexturesWithContentsOfURLs:options:completionHandler:](self, "newTexturesWithContentsOfURLs:options:completionHandler:", URLs, options, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error)
    *error = (NSError *)(id)v14[5];
  v10 = (NSArray *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

intptr_t __64__MTKTextureLoader_newTexturesWithContentsOfURLs_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)newTextureWithMDLTexture:(MDLTexture *)texture options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v9 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__MTKTextureLoader_newTextureWithMDLTexture_options_error___block_invoke;
  v12[3] = &unk_24C3D4C10;
  v12[5] = &v19;
  v12[6] = &v13;
  v12[4] = v9;
  -[MTKTextureLoader newTextureWithMDLTexture:options:completionHandler:](self, "newTextureWithMDLTexture:options:completionHandler:", texture, options, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  if (error)
    *error = (NSError *)(id)v14[5];
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

intptr_t __59__MTKTextureLoader_newTextureWithMDLTexture_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__MTKTextureLoader__loadData_options_uploader_label_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__MTKTextureLoader__loadCGImage_options_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_loadMDLTexture:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9;
  MTKTextureLoaderMDL *v10;
  MTKTextureLoaderMDL *v11;
  NSObject *uploadQueue;
  _QWORD *v13;
  _QWORD v14[8];
  _QWORD block[6];
  _QWORD v16[6];
  uint64_t v17;

  v9 = -[MTKTextureLoader newUploaderForOptions:](self, "newUploaderForOptions:", a4);
  v17 = 0;
  v10 = -[MTKTextureLoaderMDL initWithMDLTexture:options:error:]([MTKTextureLoaderMDL alloc], "initWithMDLTexture:options:error:", a3, a4, &v17);
  if (v10)
  {
    v11 = v10;
    if (-[MTKTextureLoader validateGenerateMipmapsForPixelFormat:options:error:](self, "validateGenerateMipmapsForPixelFormat:options:error:", -[MTKTextureLoaderData pixelFormat](v10, "pixelFormat"), a4, &v17))
    {
      uploadQueue = self->_uploadQueue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_3;
      v14[3] = &unk_24C3D4BC0;
      v14[4] = v9;
      v14[5] = v11;
      v14[6] = a4;
      v14[7] = a5;
      v13 = v14;
    }
    else
    {

      uploadQueue = self->_notifyQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_2;
      block[3] = &unk_24C3D4CB0;
      block[4] = v17;
      block[5] = a5;
      v13 = block;
    }
  }
  else
  {
    uploadQueue = self->_notifyQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke;
    v16[3] = &unk_24C3D4CB0;
    v16[4] = v17;
    v16[5] = a5;
    v13 = v16;
  }
  dispatch_async(uploadQueue, v13);

}

void __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];
  uint64_t v7;

  v7 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "newTextureWithData:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v7);

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("MTKTextureLoaderOptionGenerateMipmaps")), "BOOLValue"))objc_msgSend(*(id *)(a1 + 32), "generateMipmapsForTexture:", v2);
  v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_4;
  v6[3] = &unk_24C3D4CD8;
  v4 = *(_QWORD *)(a1 + 56);
  v6[4] = v2;
  v6[5] = v7;
  v6[6] = v4;
  return objc_msgSend(v3, "finishWithCompletionHandler:", v6);
}

void __62__MTKTextureLoader__loadMDLTexture_options_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_newAsyncTextureWithNames:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 bundle:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  id v35;
  NSObject *v36;
  _QWORD *v37;
  uint64_t v38;
  OS_dispatch_queue *notifyQueue;
  id v40;
  _BOOL8 v41;
  void *v42;
  id obj;
  _QWORD v44[7];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[6];
  uint64_t v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v58 = 0;
  v14 = objc_msgSend(MEMORY[0x24BE28C28], "defaultUICatalogForBundle:", a6);
  if (!v14)
  {
    v38 = _newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Could not get asset catalog from supplied bundle"));
    notifyQueue = self->_notifyQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke;
    block[3] = &unk_24C3D4CB0;
    block[4] = v38;
    block[5] = a8;
    v37 = block;
    v36 = notifyQueue;
    goto LABEL_32;
  }
  v15 = (void *)v14;
  v40 = a8;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (!v16)
    goto LABEL_21;
  v17 = v16;
  v18 = *(_QWORD *)v54;
  v41 = a5 == 2;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v54 != v18)
        objc_enumerationMutation(a3);
      v20 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
      v21 = objc_msgSend(v15, "namedTextureWithName:scaleFactor:", v20, a4);
      if (v21)
      {
        v22 = (void *)v21;
        v23 = (void *)MEMORY[0x20BD32DD8]();
        v24 = (void *)objc_msgSend(v22, "textureWithBufferAllocator:", self->_bufferAllocator);
        v25 = v24;
        objc_autoreleasePoolPop(v23);
        v52 = 0;
        v50 = 0u;
        v51 = 0u;
        v49 = 0u;
        objc_msgSend(v24, "pixelFormat");
        MTLPixelFormatGetInfoForDevice();
        if (objc_msgSend(MEMORY[0x24BEB6DC8], "isGammaEncoded:", objc_msgSend(v24, "pixelFormat")))
          v26 = 71;
        else
          v26 = 70;
        objc_msgSend(v24, "reformat:gammaDegamma:bufferAllocator:error:", v26, 1, self->_bufferAllocator, 0);
        v27 = v42;
        goto LABEL_14;
      }
      if (objc_msgSend(v15, "imageExistsWithName:scaleFactor:", v20, a4))
      {
        v24 = (void *)objc_msgSend(v15, "imageWithName:scaleFactor:displayGamut:layoutDirection:", v20, v41, 5, a4);
        if (objc_msgSend(v24, "image"))
        {
          v28 = v24;
          v27 = obj;
LABEL_14:
          objc_msgSend(v27, "addObject:", v24);
          continue;
        }
      }
      else
      {
        v58 = _newMTKTextureErrorWithCodeAndErrorString(0, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find texture or image named \"%@\" in supplied bundle"), v20));
      }
    }
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  }
  while (v17);
LABEL_21:
  v29 = -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:](self, "_newSyncTexturesFromTXRTextures:labels:options:error:", v42, a3, a7, &v58);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v35 = -[MTKTextureLoader newTextureWithCGImage:options:error:](self, "newTextureWithCGImage:options:error:", objc_msgSend(v34, "image"), a7, &v58);

        if (v35)
          objc_msgSend(v29, "addObject:", v35);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v31);
  }

  v36 = self->_notifyQueue;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke_2;
  v44[3] = &unk_24C3D4CD8;
  v44[4] = v29;
  v44[5] = v58;
  v44[6] = v40;
  v37 = v44;
LABEL_32:
  dispatch_async(v36, v37);
}

void __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __104__MTKTextureLoader__newAsyncTextureWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)newTexturesFromTXRTextures:(id)a3 options:(id)a4 error:(id *)a5
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global);
  return -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:](self, "_newSyncTexturesFromTXRTextures:labels:options:error:", a3, 0, a4, a5);
}

- (id)newTextureFromTXRTexture:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v14[0] = a3;
  v10 = -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:](self, "_newSyncTexturesFromTXRTextures:labels:options:error:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1), 0, a4, a5);
  if (!v10)
    return 0;
  v11 = v10;
  if (!objc_msgSend(v10, "count"))
    return 0;
  v12 = (void *)objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  if (v12)

  return v12;
}

- (id)_newSyncTexturesFromTXRTextures:(id)a3 labels:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  int32x4_t v27;
  int32x2_t v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  int8x8_t v38;
  int8x8_t v39;
  unsigned int v40;
  int8x8_t v41;
  int64x2_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int8x16_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  MTKTextureLoader *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v79;
  id obj;
  uint64_t v81;
  uint64x2_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  id v91;
  int8x8_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  unint64_t v96;
  unsigned int v97;
  int32x4_t v98;
  int8x8_t v99;
  uint64_t v100;
  void *v101;
  __int128 v102;
  uint64_t v103;
  _QWORD v104[3];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v8 = a3;
  v127 = *MEMORY[0x24BDAC8D0];
  v121 = 0uLL;
  v122 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v11 = (void *)-[MTLDeviceSPI newCommandQueue](self->_device, "newCommandQueue");
  objc_msgSend(v11, "setLabel:", CFSTR("com.apple.MTKTextureLoader"));
  v77 = v11;
  v76 = (void *)objc_msgSend(v11, "commandBuffer");
  v94 = (void *)objc_msgSend(v76, "blitCommandEncoder");
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v86 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v118 != v86)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"));
        }
        else
        {
          v89 = i;
          v17 = objc_alloc_init(MEMORY[0x24BDDD740]);
          objc_msgSend(v16, "dimensions");
          objc_msgSend(v17, "setWidth:", v18);
          objc_msgSend(v16, "dimensions");
          objc_msgSend(v17, "setHeight:", v19);
          objc_msgSend(v16, "dimensions");
          objc_msgSend(v17, "setDepth:", v20);
          objc_msgSend(v17, "setArrayLength:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "mipmapLevels"), "objectAtIndexedSubscript:", 0), "elements"), "count"));
          if ((unint64_t)objc_msgSend(v16, "pixelFormat") >> 31)
            -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:].cold.1();
          objc_msgSend(v17, "setPixelFormat:", objc_msgSend(v16, "pixelFormat"));
          v87 = objc_msgSend(v17, "arrayLength");
          v101 = v16;
          if (objc_msgSend(v16, "cubemap"))
          {
            if ((unint64_t)objc_msgSend(v17, "arrayLength") < 2)
            {
              v22 = 5;
            }
            else
            {
              v21 = -[MTLDeviceSPI supportsTextureCubeArray](self->_device, "supportsTextureCubeArray");
              if (v21)
                v22 = 6;
              else
                v22 = 5;
              v23 = v87;
              if (!v21)
                v23 = 1;
              v87 = v23;
              if ((v21 & 1) == 0 && a6)
              {
                *a6 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Attempt to load a cubemap array on platform that does not support cubemap arrays"));
                v22 = 5;
                v87 = 1;
              }
            }
            objc_msgSend(v17, "setTextureType:", v22);
            objc_msgSend(v16, "dimensions");
            if (v26 != 1)
              -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:].cold.4();
            objc_msgSend(v16, "dimensions");
            v98 = v27;
            objc_msgSend(v16, "dimensions");
            if ((vmovn_s32(vceqq_s32(v98, vdupq_lane_s32(v28, 1))).u8[0] & 1) == 0)
              -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:].cold.3();
          }
          else
          {
            objc_msgSend(v16, "dimensions");
            if (v24 <= 1)
            {
              objc_msgSend(v16, "dimensions");
              v30 = v29;
              v31 = objc_msgSend(v17, "arrayLength");
              if (v30 < 2)
              {
                v25 = v31 > 1;
              }
              else if (v31 <= 1)
              {
                v25 = 2;
              }
              else
              {
                v25 = 3;
              }
            }
            else
            {
              v25 = 7;
            }
            objc_msgSend(v17, "setTextureType:", v25);
          }
          if (objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureStorageMode")))
            objc_msgSend(v17, "setStorageMode:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureStorageMode")), "unsignedIntegerValue"));
          if (objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureUsage")))
            objc_msgSend(v17, "setUsage:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureUsage")), "unsignedIntegerValue"));
          if (objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureCPUCacheMode")))
            objc_msgSend(v17, "setCpuCacheMode:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionTextureCPUCacheMode")), "unsignedIntegerValue"));
          if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("MTKTextureLoaderOptionAllocateMipmaps")), "BOOLValue"))
          {
            v32 = objc_msgSend(v17, "width");
            v33 = objc_msgSend(v17, "height");
            if (v32 <= v33)
              v34 = v33;
            else
              v34 = v32;
            v35 = (unint64_t)(floor(log2((double)v34)) + 1.0);
          }
          else
          {
            v35 = objc_msgSend((id)objc_msgSend(v101, "mipmapLevels"), "count");
          }
          objc_msgSend(v17, "setMipmapLevelCount:", v35);
          v36 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("MTKTextureLoaderOptionLoadAsArray"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "BOOLValue"))
            objc_msgSend(v17, "setTextureType:", arrayTextureTypeFromTextureType(objc_msgSend(v17, "textureType")));
          v37 = -[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v17);

          if (v37)
          {
            v93 = (void *)v37;
            objc_msgSend(v10, "addObject:", v37);
            objc_msgSend(v101, "dimensions");
            v99 = v38;
            objc_msgSend(v101, "dimensions");
            v92 = v39;
            objc_msgSend(v101, "dimensions");
            v97 = v40;
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            v116 = 0u;
            obj = (id)objc_msgSend(v101, "mipmapLevels");
            i = v89;
            v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
            if (v79)
            {
              v95 = 0;
              v96 = v97;
              v41 = vext_s8(v92, v99, 4uLL);
              v42.i64[0] = v41.u32[0];
              v42.i64[1] = v41.u32[1];
              v82 = (uint64x2_t)v42;
              v43 = *(_QWORD *)v114;
              v73 = a4;
              v74 = a5;
              v71 = v8;
              v72 = v10;
              v69 = v14;
              v70 = self;
              v68 = v13;
              v75 = *(_QWORD *)v114;
              do
              {
                v44 = 0;
                do
                {
                  if (*(_QWORD *)v114 != v43)
                  {
                    v45 = v44;
                    objc_enumerationMutation(obj);
                    v44 = v45;
                  }
                  v81 = v44;
                  v46 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v44);
                  v109 = 0u;
                  v110 = 0u;
                  v111 = 0u;
                  v112 = 0u;
                  v83 = (id)objc_msgSend(v46, "elements");
                  v47 = v101;
                  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
                  if (v84)
                  {
                    v100 = 0;
                    v85 = *(_QWORD *)v110;
                    v90 = COERCE_DOUBLE(vrev64_s32(vmovn_s64((int64x2_t)v82)));
LABEL_54:
                    v48 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v110 != v85)
                        objc_enumerationMutation(v83);
                      v88 = v48;
                      v49 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v48);
                      v105 = 0u;
                      v106 = 0u;
                      v107 = 0u;
                      v108 = 0u;
                      v91 = (id)objc_msgSend(v49, "faces");
                      v50 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
                      if (v50)
                      {
                        v51 = v50;
                        v52 = 0;
                        v53 = *(_QWORD *)v106;
                        do
                        {
                          for (j = 0; j != v51; ++j)
                          {
                            if (*(_QWORD *)v106 != v53)
                              objc_enumerationMutation(v91);
                            v55 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
                            v56 = objc_msgSend(v55, "bytesPerRow");
                            v57 = objc_msgSend(v55, "bytesPerImage");
                            if (!v56)
                              v56 = objc_msgSend(MEMORY[0x24BEB6DC8], "packedMemoryLayoutForFormat:dimensions:", objc_msgSend(v47, "pixelFormat"), v90);
                            v58 = objc_msgSend(v47, "cubemap");
                            objc_msgSend(v55, "buffer");
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                              -[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:].cold.2();
                            if (!v57)
                              v57 = v56 * v82.i64[0];
                            v59 = 6;
                            if (!v58)
                              v59 = 1;
                            v60 = v52 + j + v100 * v59;
                            v61 = objc_msgSend((id)objc_msgSend(v55, "buffer"), "buffer");
                            v62 = objc_msgSend(v55, "offset");
                            v104[0] = v82.i64[1];
                            v104[1] = v82.i64[0];
                            v104[2] = v96;
                            v102 = v121;
                            v103 = v122;
                            objc_msgSend(v94, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v61, v62, v56, v57, v104, v93, v60, v95, &v102);
                            v47 = v101;
                          }
                          v51 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
                          v52 += j;
                        }
                        while (v51);
                      }
                      i = v89;
                      if (v87 == 1)
                        break;
                      ++v100;
                      v48 = v88 + 1;
                      if (v88 + 1 == v84)
                      {
                        v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
                        if (v84)
                          goto LABEL_54;
                        break;
                      }
                    }
                  }
                  v63 = (int8x16_t)vcgtq_u64(v82, (uint64x2_t)vdupq_n_s64(1uLL));
                  v82 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v82, 1uLL), v63), (int64x2_t)vmvnq_s8(v63));
                  v64 = v96 >> 1;
                  if (v96 <= 1)
                    v64 = 1;
                  ++v95;
                  v96 = v64;
                  v44 = v81 + 1;
                  a4 = v73;
                  a5 = v74;
                  v8 = v71;
                  v10 = v72;
                  v14 = v69;
                  self = v70;
                  v13 = v68;
                  v43 = v75;
                }
                while (v81 + 1 != v79);
                v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
                v43 = v75;
                v79 = v65;
              }
              while (v65);
            }

            if (a4)
            {
              v66 = objc_msgSend(a4, "objectAtIndexedSubscript:", v14);
              if (v66 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
                objc_msgSend(v93, "setLabel:", objc_msgSend(a4, "objectAtIndexedSubscript:", v14));
            }
            ++v14;
          }
          else
          {
            objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"));
            i = v89;
          }
        }
      }
      v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    }
    while (v13);
  }
  objc_msgSend(v94, "endEncoding");
  objc_msgSend(v76, "commit");
  objc_msgSend(v76, "waitUntilCompleted");

  return v10;
}

- (void)newTexturesWithNames:(NSArray *)names scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler
{
  NSObject *loadQueue;
  _QWORD v8[10];

  loadQueue = self->_loadQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__MTKTextureLoader_newTexturesWithNames_scaleFactor_bundle_options_completionHandler___block_invoke;
  v8[3] = &unk_24C3D4D48;
  v8[4] = self;
  v8[5] = names;
  *(CGFloat *)&v8[9] = scaleFactor;
  v8[6] = bundle;
  v8[7] = options;
  v8[8] = completionHandler;
  dispatch_async(loadQueue, v8);
}

uint64_t __86__MTKTextureLoader_newTexturesWithNames_scaleFactor_bundle_options_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_newAsyncTextureWithNames:scaleFactor:displayGamut:bundle:options:completionHandler:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)newTexturesWithNames:(NSArray *)names scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderArrayCallback)completionHandler
{
  NSObject *loadQueue;
  _QWORD block[11];

  loadQueue = self->_loadQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__MTKTextureLoader_newTexturesWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke;
  block[3] = &unk_24C3D4D70;
  block[4] = self;
  block[5] = names;
  *(CGFloat *)&block[9] = scaleFactor;
  block[10] = displayGamut;
  block[6] = bundle;
  block[7] = options;
  block[8] = completionHandler;
  dispatch_async(loadQueue, block);
}

uint64_t __99__MTKTextureLoader_newTexturesWithNames_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_newAsyncTextureWithNames:scaleFactor:displayGamut:bundle:options:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v14[0] = name;
  v12 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_completionHandler___block_invoke;
  v13[3] = &unk_24C3D4B20;
  v13[4] = completionHandler;
  -[MTKTextureLoader newTexturesWithNames:scaleFactor:bundle:options:completionHandler:](self, "newTexturesWithNames:scaleFactor:bundle:options:completionHandler:", v12, bundle, options, v13, scaleFactor);
}

uint64_t __84__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "count") == 1)
  {
    objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options completionHandler:(MTKTextureLoaderCallback)completionHandler
{
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v16[0] = name;
  v14 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke;
  v15[3] = &unk_24C3D4B20;
  v15[4] = completionHandler;
  -[MTKTextureLoader newTexturesWithNames:scaleFactor:displayGamut:bundle:options:completionHandler:](self, "newTexturesWithNames:scaleFactor:displayGamut:bundle:options:completionHandler:", v14, displayGamut, bundle, options, v15, scaleFactor);
}

uint64_t __97__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "count") == 1)
  {
    objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v13;
  void *v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;

  v13 = dispatch_semaphore_create(0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_error___block_invoke;
  v16[3] = &unk_24C3D4C10;
  v16[5] = &v23;
  v16[6] = &v17;
  v16[4] = v13;
  -[MTKTextureLoader newTextureWithName:scaleFactor:bundle:options:completionHandler:](self, "newTextureWithName:scaleFactor:bundle:options:completionHandler:", name, bundle, options, v16, scaleFactor);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v13);
  if (error)
    *error = (NSError *)(id)v18[5];
  v14 = (void *)v24[5];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

intptr_t __72__MTKTextureLoader_newTextureWithName_scaleFactor_bundle_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)newTextureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor displayGamut:(NSDisplayGamut)displayGamut bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)error
{
  NSObject *v15;
  void *v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;

  v15 = dispatch_semaphore_create(0);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __85__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_error___block_invoke;
  v18[3] = &unk_24C3D4C10;
  v18[5] = &v25;
  v18[6] = &v19;
  v18[4] = v15;
  -[MTKTextureLoader newTextureWithName:scaleFactor:displayGamut:bundle:options:completionHandler:](self, "newTextureWithName:scaleFactor:displayGamut:bundle:options:completionHandler:", name, displayGamut, bundle, options, v18, scaleFactor);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v15);
  if (error)
    *error = (NSError *)(id)v20[5];
  v16 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

intptr_t __85__MTKTextureLoader_newTextureWithName_scaleFactor_displayGamut_bundle_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadData:options:uploader:label:completionHandler:.cold.1()
{
  __assert_rtn("-[MTKTextureLoader _loadData:options:uploader:label:completionHandler:]", "MTKTextureLoader.m", 590, "!\"No texture loader supports MSAA or TexBuffers\");
}

- (void)_loadData:options:uploader:label:completionHandler:.cold.2()
{
  __assert_rtn("-[MTKTextureLoader _loadData:options:uploader:label:completionHandler:]", "MTKTextureLoader.m", 593, "!error && \"Should not get here if we already encountered an error\");
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.1()
{
  __assert_rtn("-[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]", "MTKTextureLoader.m", 1006, "txrTexture.pixelFormat < 0x80000000");
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.2()
{
  __assert_rtn("-[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]", "MTKTextureLoader.m", 1129, "[image.buffer isKindOfClass:[MTKTextureIOBuffer class]]");
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.3()
{
  __assert_rtn("-[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]", "MTKTextureLoader.m", 1028, "txrTexture.dimensions.x == txrTexture.dimensions.y");
}

- (void)_newSyncTexturesFromTXRTextures:labels:options:error:.cold.4()
{
  __assert_rtn("-[MTKTextureLoader _newSyncTexturesFromTXRTextures:labels:options:error:]", "MTKTextureLoader.m", 1027, "1 == txrTexture.dimensions.z");
}

@end
