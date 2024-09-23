@implementation QLServiceThumbnailRenderer

- (QLServiceThumbnailRenderer)initWithRequest:(id)a3 reply:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  QLServiceThumbnailRenderer *v15;
  QLServiceThumbnailRenderer *v16;
  void *v17;
  id completionHandler;
  QLServiceThumbnailRenderer *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)QLServiceThumbnailRenderer;
  v15 = -[QLServiceThumbnailRenderer init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_request, a3);
    objc_storeStrong((id *)&v16->_reply, a4);
    v17 = _Block_copy(v14);
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = v17;

    objc_storeStrong((id *)&v16->_connection, a5);
    v19 = v16;
  }

  return v16;
}

- (void)generateThumbnailAndPerformCompletionHandler
{
  QLThumbnailReply *reply;
  double v4;
  double v5;
  double v6;
  double v7;
  CGColorSpace *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  QLServiceThumbnailRenderer *v13;
  uint64_t v14;
  id v15;
  QLServiceThumbnailRenderer *v16;
  void *v17;
  id v18;
  QLServiceThumbnailRenderer *v19;
  QLServiceThumbnailRenderer *v20;
  id v21;
  _QWORD v22[4];
  QLServiceThumbnailRenderer *v23;
  _QWORD v24[4];
  QLServiceThumbnailRenderer *v25;
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  reply = self->_reply;
  if (reply)
  {
    switch(-[QLThumbnailReply type](reply, "type"))
    {
      case 0uLL:
        -[QLThumbnailReply contextSize](self->_reply, "contextSize");
        v5 = v4;
        v7 = v6;
        v8 = -[QLThumbnailReply colorSpace](self->_reply, "colorSpace");
        v27 = 0;
        -[QLThumbnailReply drawInContextBlock](self->_reply, "drawInContextBlock");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](self, "_drawInContextOfSize:colorSpace:error:drawingBlock:", v8, &v27, v9, v5, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v27;

        if (v10)
        {
          v28[0] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[QLThumbnailReply setBitmapImages:](self->_reply, "setBitmapImages:", v12);

          v13 = self;
          v14 = 1;
          v15 = 0;
        }
        else
        {
          v13 = self;
          v14 = 0;
          v15 = v11;
        }
        -[QLServiceThumbnailRenderer _finishWithSuccess:error:](v13, "_finishWithSuccess:error:", v14, v15);

        return;
      case 1uLL:
        v16 = self;
        -[QLServiceThumbnailRenderer reply](v16, "reply");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke;
        v24[3] = &unk_1E5D7C118;
        v25 = v16;
        v26 = v17;
        v18 = v17;
        v19 = v16;
        QLTRunInMainThreadAsync(v24);

        goto LABEL_11;
      case 3uLL:
        -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 1, 0);
        return;
      case 4uLL:
        -[QLServiceThumbnailRenderer _drawInIOSurface](self, "_drawInIOSurface");
        return;
      case 5uLL:
        -[QLServiceThumbnailRenderer _drawMultipleImages](self, "_drawMultipleImages");
        return;
      case 6uLL:
        v20 = self;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke_2;
        v22[3] = &unk_1E5D7C4F0;
        v23 = v20;
        v19 = v20;
        QLTRunInMainThreadAsync(v22);

LABEL_11:
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLThumbnailServiceContextGenerator"), 0, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 0);

  }
}

void __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contextSize");
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 40), "colorSpace");
  objc_msgSend(*(id *)(a1 + 40), "drawingBlock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_drawInCurrentContextOfSize:colorSpace:drawingBlock:", v7, v8, v4, v6);

}

uint64_t __74__QLServiceThumbnailRenderer_generateThumbnailAndPerformCompletionHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawWithRendererBlock");
}

- (id)_drawInContextOfSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 error:(id *)a5 drawingBlock:(id)a6
{
  double height;
  double width;
  uint64_t (**v11)(id, CGContext *);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  double v23;
  CGContext *v24;
  id v25;
  void *Data;
  size_t BytesPerRow;
  void *v28;
  QLTBitmapFormat *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[12];
  __int16 v48;
  double v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  height = a3.height;
  width = a3.width;
  v58 = *MEMORY[0x1E0C80C00];
  v11 = (uint64_t (**)(id, CGContext *))a6;
  if (!v11)
  {
    _log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_20;
  }
  if (!-[QLServiceThumbnailRenderer _canCreateContextOfSize:forRequest:](self, "_canCreateContextOfSize:forRequest:", self->_request, width, height))
  {
    _log_2();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[QLFileThumbnailRequest maximumSize](self->_request, "maximumSize");
      v41 = v40;
      -[QLFileThumbnailRequest maximumSize](self->_request, "maximumSize");
      v43 = v42;
      -[QLFileThumbnailRequest minimumSize](self->_request, "minimumSize");
      v45 = v44;
      -[QLFileThumbnailRequest minimumSize](self->_request, "minimumSize");
      *(_DWORD *)v47 = 134219264;
      *(double *)&v47[4] = width;
      v48 = 2048;
      v49 = height;
      v50 = 2048;
      v51 = v41;
      v52 = 2048;
      v53 = v43;
      v54 = 2048;
      v55 = v45;
      v56 = 2048;
      v57 = v46;
      _os_log_error_impl(&dword_1AE3F5000, v20, OS_LOG_TYPE_ERROR, "Could not draw thumbnail from QLThumbnailReply because the requested context size is invalid (received: (%f, %f), maximum size is: (%f, %f), minimum size is: (%f, %f)). The maximum supported thumbnail size is 1284 * 2778", v47, 0x3Eu);
    }

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = 2;
    goto LABEL_21;
  }
  *(_QWORD *)v47 = 0;
  if (a4 && CGColorSpaceSupportsOutput(a4))
    CFRetain(a4);
  else
    a4 = QLCreateColorSpaceForThumbnailExtension();
  -[QLFileThumbnailRequest scale](self->_request, "scale", *(_QWORD *)v47);
  v24 = QLTCreateCGContextWithSize(a4, 1, (size_t *)v47, width, height, v23);
  CFRelease(a4);
  if (!v24)
  {
    _log_2();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = 1;
    goto LABEL_21;
  }
  if ((v11[2](v11, v24) & 1) == 0)
  {
    CGContextRelease(v24);
LABEL_20:
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = 0;
LABEL_21:
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLThumbnailServiceContextGenerator"), v22, 0);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v25 = objc_alloc(MEMORY[0x1E0C99D50]);
  Data = CGBitmapContextGetData(v24);
  BytesPerRow = CGBitmapContextGetBytesPerRow(v24);
  v28 = (void *)objc_msgSend(v25, "initWithBytesNoCopy:length:deallocator:", Data, CGBitmapContextGetHeight(v24) * BytesPerRow, *MEMORY[0x1E0CB2910]);
  v29 = -[QLTBitmapFormat initWithBitmapContext:]([QLTBitmapFormat alloc], "initWithBitmapContext:", v24);
  CGContextRelease(v24);
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setFormat:", v29);
  objc_msgSend(v30, "setData:", v28);

LABEL_22:
  return v30;
}

- (void)_drawInCurrentContextOfSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 drawingBlock:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  QLServiceThumbnailRenderer *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[2];

  height = a3.height;
  width = a3.width;
  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v27 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __82__QLServiceThumbnailRenderer__drawInCurrentContextOfSize_colorSpace_drawingBlock___block_invoke;
    v25[3] = &unk_1E5D7CC50;
    v25[4] = self;
    v26 = v9;
    -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](self, "_drawInContextOfSize:colorSpace:error:drawingBlock:", a4, &v27, v25, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;
    if (v11)
    {
      v28[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLThumbnailReply setBitmapImages:](self->_reply, "setBitmapImages:", v13);

      v14 = self;
      v15 = 1;
      v16 = 0;
    }
    else
    {
      v14 = self;
      v15 = 0;
      v16 = v12;
    }
    -[QLServiceThumbnailRenderer _finishWithSuccess:error:](v14, "_finishWithSuccess:error:", v15, v16);

  }
  else
  {
    _log_2();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLThumbnailServiceContextGenerator"), 0, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 0, v12);
  }

}

uint64_t __82__QLServiceThumbnailRenderer__drawInCurrentContextOfSize_colorSpace_drawingBlock___block_invoke(uint64_t a1, CGContextRef context)
{
  size_t Height;
  void *v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  uint64_t v10;
  CGAffineTransform v12;

  Height = CGBitmapContextGetHeight(context);
  CGContextTranslateCTM(context, 0.0, (double)Height);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  CGContextScaleCTM(context, v7, -v9);

  CGContextGetCTM(&v12, context);
  CGContextSetBaseCTM();
  _UIGraphicsPushContext((uint64_t)context);
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _UIGraphicsPopContext();
  return v10;
}

- (id)protocolHostWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[QLServiceThumbnailRenderer connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5D7C860;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _log_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke_cold_1(v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)_drawInIOSurface
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  -[QLServiceThumbnailRenderer _IOSurfaceSizeFromThumbnailReply:](self, "_IOSurfaceSizeFromThumbnailReply:", self->_reply);
  v4 = v3;
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke;
  v11[3] = &unk_1E5D7C5B8;
  v11[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8;
  v10[3] = &unk_1E5D7CCA0;
  v10[4] = self;
  objc_msgSend(v9, "ioSurfaceWithSize:completionHandler:", v10, v4, v6);

}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _log_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_cold_1((uint64_t)v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_finishWithSuccess:error:", 0, v3);
}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "reply");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ioSurfaceAsyncBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "reply");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "ioSurfaceAsyncBlock");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_9;
      v15[3] = &unk_1E5D7CC78;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v5;
      ((void (**)(_QWORD, id, _QWORD *))v11)[2](v11, v16, v15);

    }
    else
    {
      objc_msgSend(v9, "ioSurfaceBlock");
      v13 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = ((uint64_t (**)(_QWORD, id))v13)[2](v13, v5);

      objc_msgSend(*(id *)(a1 + 32), "_afterGeneratingIOSurfaceThumbnail:surface:", v14, v5);
    }
  }
  else
  {
    _log_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8_cold_1(a1, (uint64_t)v6, v12);

    objc_msgSend(*(id *)(a1 + 32), "_finishWithSuccess:error:", 0, v6);
  }

}

uint64_t __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_afterGeneratingIOSurfaceThumbnail:surface:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_afterGeneratingIOSurfaceThumbnail:(BOOL)a3 surface:(id)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (a3)
    -[QLThumbnailReply setIoSurface:](self->_reply, "setIoSurface:", a4);
  -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", v4, 0);
}

- (CGSize)_IOSurfaceSizeFromThumbnailReply:(id)a3
{
  QLFileThumbnailRequest *request;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v17;
  int v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x1E0C80C00];
  request = self->_request;
  v4 = a3;
  -[QLFileThumbnailRequest scale](request, "scale");
  v6 = v5;
  objc_msgSend(v4, "contextSize");
  v8 = v7;
  v10 = v9;

  v11 = v6 * v8;
  v12 = round(v6 * v8 * 1000.0) / 1000.0;
  v13 = v6 * v10;
  v14 = round(v6 * v10 * 1000.0) / 1000.0;
  v15 = ceil(v14);
  if (ceil(v12) != v12 || v15 != v14)
  {
    _log_2();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v18 = 134218752;
      v19 = v12;
      v20 = 2048;
      v21 = v14;
      v22 = 2048;
      v23 = v8;
      v24 = 2048;
      v25 = v10;
      _os_log_fault_impl(&dword_1AE3F5000, v17, OS_LOG_TYPE_FAULT, "Requested scaled IOSurface context size of non-integer pixel width or height (%f, %f). Will ceil requested size values (%f, %f)", (uint8_t *)&v18, 0x2Au);
    }

    v11 = v6 * round(v8);
    v13 = v6 * round(v10);
  }
  result.height = v13;
  result.width = v11;
  return result;
}

- (void)_drawMultipleImages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CGImage *v17;
  double Width;
  double Height;
  CGColorSpaceRef ColorSpace;
  void *v21;
  void *v22;
  _QWORD v23[8];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[QLServiceThumbnailRenderer reply](self, "reply");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "images");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLFileThumbnailRequest scale](self->_request, "scale");
  v8 = v7;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[QLServiceThumbnailRenderer reply](self, "reply");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "images");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v26;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v10);
        v17 = *(CGImage **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        Width = (double)CGImageGetWidth(v17);
        Height = (double)CGImageGetHeight(v17);
        ColorSpace = CGImageGetColorSpace(v17);
        v24 = v16;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __49__QLServiceThumbnailRenderer__drawMultipleImages__block_invoke;
        v23[3] = &__block_descriptor_64_e20_B16__0__CGContext__8l;
        v23[4] = v8;
        *(double *)&v23[5] = Width;
        *(double *)&v23[6] = Height;
        v23[7] = v17;
        -[QLServiceThumbnailRenderer _drawInContextOfSize:colorSpace:error:drawingBlock:](self, "_drawInContextOfSize:colorSpace:error:drawingBlock:", ColorSpace, &v24, v23, Width, Height);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v24;

        if (!v21)
        {
          -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 0, v13);
          goto LABEL_11;
        }
        objc_msgSend(v6, "addObject:", v21);

        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
        continue;
      break;
    }
LABEL_11:

  }
  -[QLServiceThumbnailRenderer reply](self, "reply");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBitmapImages:", v6);

  -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 1, 0);
}

uint64_t __49__QLServiceThumbnailRenderer__drawMultipleImages__block_invoke(uint64_t a1, CGContextRef c)
{
  CGRect v5;

  CGContextScaleCTM(c, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
  v5.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v5.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v5.size.width = *(CGFloat *)(a1 + 40);
  v5.size.height = *(CGFloat *)(a1 + 48);
  CGContextDrawImage(c, v5, *(CGImageRef *)(a1 + 56));
  return 1;
}

- (void)_drawWithRendererBlock
{
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *Data;
  size_t BytesPerRow;
  void *v9;
  QLTBitmapFormat *v10;
  QLTBitmapFormat *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[QLFileThumbnailRequest scale](self->_request, "scale");
  v4 = v3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[QLThumbnailReply rendererBlock](self->_reply, "rendererBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__QLServiceThumbnailRenderer__drawWithRendererBlock__block_invoke;
  v15[3] = &unk_1E5D7CCE8;
  v15[4] = &v16;
  v15[5] = v4;
  ((void (**)(_QWORD, _QWORD *))v5)[2](v5, v15);

  v6 = objc_alloc(MEMORY[0x1E0C99D50]);
  Data = CGBitmapContextGetData((CGContextRef)v17[3]);
  BytesPerRow = CGBitmapContextGetBytesPerRow((CGContextRef)v17[3]);
  v9 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:deallocator:", Data, CGBitmapContextGetHeight((CGContextRef)v17[3]) * BytesPerRow, *MEMORY[0x1E0CB2910]);
  v10 = [QLTBitmapFormat alloc];
  v11 = -[QLTBitmapFormat initWithBitmapContext:](v10, "initWithBitmapContext:", v17[3]);
  CGContextRelease((CGContextRef)v17[3]);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setFormat:", v11);
  objc_msgSend(v12, "setData:", v9);
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLServiceThumbnailRenderer reply](self, "reply");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBitmapImages:", v13);

  -[QLServiceThumbnailRenderer _finishWithSuccess:error:](self, "_finishWithSuccess:error:", 1, 0);
  _Block_object_dispose(&v16, 8);
}

uint64_t __52__QLServiceThumbnailRenderer__drawWithRendererBlock__block_invoke(uint64_t a1, double a2, double a3)
{
  CGColorSpace *v6;
  size_t v8;

  v6 = QLCreateColorSpaceForThumbnailExtension();
  v8 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = QLTCreateCGContextWithSize(v6, 1, &v8, a2, a3, *(double *)(a1 + 40));
  CFRelease(v6);
  CGContextScaleCTM(*(CGContextRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)_finishWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  QLServiceThumbnailRenderer *v6;
  void *v7;
  void (**completionHandler)(id, QLThumbnailReply *, _QWORD);
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = a4;
  v6 = self;
  objc_sync_enter(v6);
  -[QLFileThumbnailRequest item](v6->_request, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanup");

  completionHandler = (void (**)(id, QLThumbnailReply *, _QWORD))v6->_completionHandler;
  if (completionHandler)
  {
    if (v4)
    {
      completionHandler[2](v6->_completionHandler, v6->_reply, 0);
    }
    else
    {
      v9 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      ((void (**)(id, QLThumbnailReply *, void *))completionHandler)[2](completionHandler, 0, v9);
      if (!v11)

    }
    v10 = v6->_completionHandler;
    v6->_completionHandler = 0;

  }
  objc_sync_exit(v6);

}

- (BOOL)_canCreateContextOfSize:(CGSize)a3 forRequest:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (width > 0.0 && height > 0.0)
  {
    objc_msgSend(v6, "maximumSize");
    if (width <= v9 + 1.0
      && (objc_msgSend(v7, "maximumSize"), height <= v10 + 1.0)
      && (objc_msgSend(v7, "minimumSize"), width >= v11 + -1.0)
      && (objc_msgSend(v7, "minimumSize"), height >= v12 + -1.0))
    {
      objc_msgSend(v7, "scale");
      v15 = width * height * v14;
      objc_msgSend(v7, "scale");
      v8 = v15 * v16 < 3566952.0;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_thumbnailDataDestructionConcurrenQueue
{
  if (_thumbnailDataDestructionConcurrenQueue_onceToken != -1)
    dispatch_once(&_thumbnailDataDestructionConcurrenQueue_onceToken, &__block_literal_global_8);
  return (id)_thumbnailDataDestructionConcurrenQueue__thumbnailDataDestructionConcurrenQueue;
}

void __69__QLServiceThumbnailRenderer__thumbnailDataDestructionConcurrenQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.quicklook.thumbnailrenderer.datadestruction", MEMORY[0x1E0C80D50]);
  v1 = (void *)_thumbnailDataDestructionConcurrenQueue__thumbnailDataDestructionConcurrenQueue;
  _thumbnailDataDestructionConcurrenQueue__thumbnailDataDestructionConcurrenQueue = (uint64_t)v0;

}

- (QLFileThumbnailRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (QLThumbnailReply)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_storeStrong((id *)&self->_reply, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_drawInContextOfSize:(uint64_t)a3 colorSpace:(uint64_t)a4 error:(uint64_t)a5 drawingBlock:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, a1, a3, "Could not draw thumbnail from QLThumbnailReply because received a nil drawing block.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_drawInContextOfSize:(uint64_t)a3 colorSpace:(uint64_t)a4 error:(uint64_t)a5 drawingBlock:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AE3F5000, a1, a3, "Could not create CGContext for thumbail extension. Cancelling thumbnail generation.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __59__QLServiceThumbnailRenderer_protocolHostWithErrorHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a2, v4, "Error while calling host: %@", (uint8_t *)&v5);

}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_1AE3F5000, a2, a3, "Host connection error: %@", (uint8_t *)&v3);
}

void __46__QLServiceThumbnailRenderer__drawInIOSurface__block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1AE3F5000, a3, OS_LOG_TYPE_ERROR, "Could not draw thumbnail because received nil IOSurface for request %@. Error: %@", (uint8_t *)&v7, 0x16u);

}

@end
