@implementation PHMediaFormatLivePhotoBundleConversionRequest

- (BOOL)prepareWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PHMediaFormatConversionRequest source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v6);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "imagePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPath");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get image and video path from pvt bundle at path %@", buf, 0xCu);
      }
      v13 = 0;
    }
    else
    {
      v29 = v9;
      v30 = (void *)v10;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHMediaFormatConversionSource imageSourceForFileURL:](PHMediaFormatConversionSource, "imageSourceForFileURL:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v15;
      +[PHMediaFormatConversionRequest requestForSource:destinationCapabilities:error:](PHMediaFormatConversionRequest, "requestForSource:destinationCapabilities:error:", v15, v16, a3);
      v17 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v17;
      if (v17)
      {
        v11 = v30;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHMediaFormatConversionSource videoSourceForFileURL:](PHMediaFormatConversionSource, "videoSourceForFileURL:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        -[PHMediaFormatConversionRequest destinationCapabilities](self, "destinationCapabilities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v19;
        +[PHMediaFormatConversionRequest requestForSource:destinationCapabilities:error:](PHMediaFormatConversionRequest, "requestForSource:destinationCapabilities:error:", v19, v20, a3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          +[PHMediaFormatLivePhotoConversionRequest requestForImageConversionRequest:videoConversionRequest:error:](PHMediaFormatLivePhotoConversionRequest, "requestForImageConversionRequest:videoConversionRequest:error:", v17, v21, a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v22 != 0;
          if (v22)
          {
            -[PHMediaFormatConversionRequest setLivePhotoPairingIdentifierBehavior:](self, "setLivePhotoPairingIdentifierBehavior:", 4);
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUIDString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHMediaFormatConversionRequest setLivePhotoPairingIdentifier:](self, "setLivePhotoPairingIdentifier:", v24);

            -[PHMediaFormatLivePhotoBundleConversionRequest setLivePhotoConversionRequest:](self, "setLivePhotoConversionRequest:", v22);
            objc_msgSend(v22, "setParentRequest:", self);
            v25 = v28;
          }
          else
          {
            v25 = (void *)v19;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v6;
              _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle request for %@", buf, 0xCu);
            }
          }

          v9 = v29;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v30;
            _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle video subrequest for %@", buf, 0xCu);
          }
          v13 = 0;
          v25 = (void *)v19;
          v9 = v29;
        }

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v29;
        v34 = v29;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle image subrequest for %@", buf, 0xCu);
        v13 = 0;
        v11 = v30;
      }
      else
      {
        v13 = 0;
        v9 = v29;
        v11 = v30;
      }

    }
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 5, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v27;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create live photo bundle with path %@", buf, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[PHMediaFormatConversionCompositeRequest propagateRequestOptionsToSubrequests](self, "propagateRequestOptionsToSubrequests");
  -[PHMediaFormatLivePhotoBundleConversionRequest livePhotoConversionRequest](self, "livePhotoConversionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__PHMediaFormatLivePhotoBundleConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke;
  v6[3] = &unk_1E9953C20;
  v6[4] = self;
  objc_msgSend(v4, "enqueueConversionRequest:completionHandler:", v5, v6);

}

- (void)enumerateSubrequests:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[PHMediaFormatLivePhotoBundleConversionRequest livePhotoConversionRequest](self, "livePhotoConversionRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)postProcessSuccessfulCompositeRequest
{
  void *v3;
  void (**v4)(_QWORD);
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _BYTE v30[24];
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setMediaType:", 3);
  objc_msgSend(v3, "generateTemporaryOutputFileURLForRequest:", self);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __86__PHMediaFormatLivePhotoBundleConversionRequest_postProcessSuccessfulCompositeRequest__block_invoke;
  v32[3] = &unk_1E9953840;
  v32[4] = self;
  v33 = 0;
  v4 = (void (**)(_QWORD))MEMORY[0x1D8270520](v32);
  v31 = 0;
  v5 = objc_msgSend(v3, "createTemporaryOutputDirectoryWithError:", &v31);
  v6 = v31;
  if ((v5 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0D75318]);
    -[PHMediaFormatConversionRequest source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithBundleAtURL:", v9);

    if (v10)
    {
      -[PHMediaFormatLivePhotoBundleConversionRequest livePhotoConversionRequest](self, "livePhotoConversionRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "videoConversionRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "destination");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHMediaFormatLivePhotoBundleConversionRequest livePhotoConversionRequest](self, "livePhotoConversionRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageConversionRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "destination");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[PHMediaFormatConversionCompositeRequest requiresFormatConversion](self, "requiresFormatConversion"))
        -[PHMediaFormatConversionRequest livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");
      else
        objc_msgSend(v10, "pairingIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0D75318]);
      v28 = v14;
      objc_msgSend(v14, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v18;
      objc_msgSend(v18, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageDisplayTime");
      v23 = (void *)objc_msgSend(v20, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v21, v22, v30, v19);

      objc_msgSend(v3, "temporaryOutputFileURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v6;
      v25 = objc_msgSend(v23, "writeToBundleAtURL:error:", v24, &v29);
      v26 = v29;

      if ((v25 & 1) != 0)
      {
        -[PHMediaFormatConversionRequest setDestination:](self, "setDestination:", v3);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v26;
          _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create live photo output bundle: %@", buf, 0xCu);
        }
        v4[2](v4);
      }

      v6 = v26;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create live photo source bundle", buf, 2u);
      }
      v4[2](v4);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create temporary output parent directory for live photo bundle: %@", buf, 0xCu);
    }
    v4[2](v4);
  }

}

- (PHMediaFormatLivePhotoConversionRequest)livePhotoConversionRequest
{
  return (PHMediaFormatLivePhotoConversionRequest *)objc_getProperty(self, a2, 240, 1);
}

- (void)setLivePhotoConversionRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoConversionRequest, 0);
}

uint64_t __86__PHMediaFormatLivePhotoBundleConversionRequest_postProcessSuccessfulCompositeRequest__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v7 = *MEMORY[0x1E0CB3388];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v5);

  if (v3)
  return objc_msgSend(*(id *)(a1 + 32), "setStatus:", 5);
}

void __87__PHMediaFormatLivePhotoBundleConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "livePhotoConversionRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Live photo bundle request subrequest finished: %@", (uint8_t *)&v3, 0xCu);

  }
}

@end
