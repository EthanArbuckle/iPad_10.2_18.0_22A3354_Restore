@implementation PHFigDecoder

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int *v22;
  void *v23;
  id v24;
  int CGImageForIndex;
  int v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  int Container;
  int v36;
  NSObject *v37;
  id v38;
  int v39;
  PHImageDecoderAsyncDecodeRequestHandle *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  PHImageDecoderAsyncDecodeRequestHandle *v45;
  id v46;
  int v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  int v52;
  NSObject *v53;
  NSObject *v54;
  unsigned int v55;
  id v56;
  id v57;
  id v58;
  id v59;
  int v60;
  id v61;
  id v63;
  id v64;
  CFTypeRef v65;
  CFTypeRef cf;
  _DWORD buf[3];
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  PFSharedFigDecodeSession();
  v14 = objc_msgSend(v12, "shouldLoadGainMap");
  if (v11)
    v15 = v11;
  else
    v15 = v10;
  v64 = v15;
  v16 = (char *)malloc_type_calloc(1uLL, 0x70uLL, 0x10A0040365111DBuLL);
  objc_storeStrong((id *)v16 + 6, a5);
  *(_QWORD *)v16 = objc_msgSend(v12, "maximumLongSideLength");
  *((_QWORD *)v16 + 1) = objc_msgSend(v12, "resizeMode");
  v16[16] = objc_msgSend(v12, "optimizeForDrawing");
  v16[17] = objc_msgSend(v12, "highPriority");
  v16[18] = objc_msgSend(v12, "waitUntilComplete");
  objc_storeStrong((id *)v16 + 8, a3);
  v17 = a4;
  v18 = v13;
  objc_storeStrong((id *)v16 + 7, v17);
  v19 = _Block_copy(v13);
  v20 = (void *)*((_QWORD *)v16 + 9);
  *((_QWORD *)v16 + 9) = v19;

  *((_QWORD *)v16 + 11) = 0;
  v16[19] = objc_msgSend(v12, "allowFallbackDecoder");
  v16[20] = objc_msgSend(v12, "preferSWDecode");
  v16[21] = objc_msgSend(v12, "useLowMemoryMode");
  *((_QWORD *)v16 + 12) = 0;
  v60 = v14;
  if (v14)
    v21 = 2;
  else
    v21 = 1;
  *((_DWORD *)v16 + 8) = v21;
  v22 = (unsigned int *)(v16 + 36);
  atomic_store(0, (unsigned int *)v16 + 9);
  CMPhotoDecompressionSessionReserveRequestID();
  _figDecodeOptionsFromContext((uint64_t)v16, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "waitUntilComplete"))
  {
    cf = 0;
    Container = CMPhotoDecompressionSessionCreateContainer();
    if (Container)
    {
      v36 = Container;
      PLImageManagerGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = v64;
        v68 = 1024;
        v69 = v36;
        _os_log_impl(&dword_1991EC000, v37, OS_LOG_TYPE_DEFAULT, "[RM] PHFigDecoder - failed to open container for image: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0, 0);
      goto LABEL_38;
    }
    v58 = v13;
    v40 = -[PHImageDecoderAsyncDecodeRequestHandle initWithFigRequestID:container:figDecoder:]([PHImageDecoderAsyncDecodeRequestHandle alloc], "initWithFigRequestID:container:figDecoder:", 0, cf, self);
    CFRelease(cf);
    objc_storeStrong((id *)v16 + 10, v40);
    v41 = CMPhotoDecompressionContainerDecodeImageForIndexAsyncF();
    if (v41)
    {
      v42 = v41;
      PLImageManagerGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = v64;
        v68 = 1024;
        v69 = v42;
        _os_log_impl(&dword_1991EC000, v43, OS_LOG_TYPE_DEFAULT, "[RM] PHFigDecoder - failed to start decode for image: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }

      if (v16[19])
      {
        +[PHImageIODecoder sharedDecoder](PHImageIODecoder, "sharedDecoder");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "decodeImageFromData:orFileURL:options:completion:", v10, v11, v12, v13);
        v45 = (PHImageDecoderAsyncDecodeRequestHandle *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0, 0);
        v45 = 0;
      }

      v18 = v58;
      goto LABEL_39;
    }
    v45 = v40;
    if (!v60)
    {
LABEL_48:

      v18 = v58;
      goto LABEL_40;
    }
    v65 = (CFTypeRef)0x7FFFFFFFFFFFFFFFLL;
    v47 = _indexOfGainMapInContainer((uint64_t)cf, &v65);
    if (v47)
    {
      v48 = v47;
      PLImageManagerGetLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = v64;
        v68 = 1024;
        v69 = v48;
        _os_log_impl(&dword_1991EC000, v49, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to determine index of gain map: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }
    }
    else
    {
      if (v65 == (CFTypeRef)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_47;
      CMPhotoDecompressionSessionReserveRequestID();
      objc_msgSend(*((id *)v16 + 10), "setFigGainMapRequestID:", 0);
      _figDecodeOptionsFromContext((uint64_t)v16, 0, 1);
      v49 = objc_claimAutoreleasedReturnValue();
      v52 = CMPhotoDecompressionContainerDecodeAuxiliaryImageForIndexAsyncF();
      PLImageManagerGetLog();
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (!v52)
      {
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_DEBUG, "[RM] PHFigDecoder - started async gain map decode", (uint8_t *)buf, 2u);
        }

        goto LABEL_48;
      }
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = v64;
        v68 = 1024;
        v69 = v52;
        _os_log_impl(&dword_1991EC000, v54, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to start decode for gain map: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }

    }
    do
LABEL_47:
      v55 = __ldaxr(v22);
    while (__stlxr(v55 + 1, v22));
    goto LABEL_48;
  }
  v24 = v12;
  v59 = v10;
  v63 = v11;
  v61 = v13;
  cf = 0;
  CGImageForIndex = CMPhotoDecompressionCreateCGImageForIndex();
  if (CGImageForIndex)
  {
    if (v16[19])
    {
      v26 = CGImageForIndex;
      v27 = v24;
      PLImageManagerGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = v64;
        v68 = 1024;
        v69 = v26;
        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEFAULT, "[RM] PHFigDecoder - failed sync decode of image: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }

      +[PHImageIODecoder sharedDecoder](PHImageIODecoder, "sharedDecoder");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v59;
      v31 = v27;
      v32 = v27;
      v33 = v61;
      v34 = (id)objc_msgSend(v29, "decodeImageFromData:orFileURL:options:completion:", v59, v63, v32, v61);

      v24 = v31;
    }
    else
    {
      v30 = v59;
      v33 = v61;
      if (*((_QWORD *)v16 + 9))
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v61 + 2))(v61, 0, 0, 0, 0);
    }
  }
  else
  {
    v56 = v10;
    v57 = v13;
    if (objc_msgSend(v24, "shouldLoadGainMap"))
    {
      v38 = v24;
      v65 = 0;
      v39 = CMPhotoDecompressionSessionCreateContainer();
      v46 = v11;
      PLImageManagerGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = v64;
        v68 = 1024;
        v69 = v39;
        _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_ERROR, "[RM] PHFigDecoder - failed to open decompression container for gain map: %@, status code: %d", (uint8_t *)buf, 0x12u);
      }

      v24 = v38;
    }
    else
    {
      v46 = v11;
    }
    v30 = v59;
    v33 = v61;
    (*((void (**)(id, CFTypeRef, _QWORD, uint64_t, _QWORD))v61 + 2))(v61, cf, 0, 1, 0);
    CGImageRelease((CGImageRef)cf);

    v11 = v46;
    v10 = v56;
    v18 = v57;
  }

LABEL_38:
  v45 = 0;
LABEL_39:
  _cleanupContext((uint64_t)v16);
LABEL_40:

  return v45;
}

+ (id)sharedDecoder
{
  if (sharedDecoder_s_onceToken_41451 != -1)
    dispatch_once(&sharedDecoder_s_onceToken_41451, &__block_literal_global_41452);
  return (id)sharedDecoder_s_shared_41453;
}

void __29__PHFigDecoder_sharedDecoder__block_invoke()
{
  PHFigDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(PHFigDecoder);
  v1 = (void *)sharedDecoder_s_shared_41453;
  sharedDecoder_s_shared_41453 = (uint64_t)v0;

}

- (void)cancelInFlightAsyncDecodeForRequestHandle:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "figRequestID") && objc_msgSend(v3, "figDecompressionContainer"))
  {
    objc_msgSend(v3, "figRequestID");
    CMPhotoDecompressionContainerCancelAsyncRequest();
    objc_msgSend(v3, "figGainMapRequestID");
    CMPhotoDecompressionContainerCancelAsyncRequest();
  }

}

@end
