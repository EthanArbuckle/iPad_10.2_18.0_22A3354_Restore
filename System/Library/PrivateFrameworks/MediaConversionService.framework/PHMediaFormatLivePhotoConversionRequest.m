@implementation PHMediaFormatLivePhotoConversionRequest

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  -[PHMediaFormatConversionCompositeRequest propagateRequestOptionsToSubrequests](self, "propagateRequestOptionsToSubrequests");
  -[PHMediaFormatLivePhotoConversionRequest imageConversionRequest](self, "imageConversionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke;
  v9[3] = &unk_1E9953C20;
  v9[4] = self;
  objc_msgSend(v4, "enqueueConversionRequest:completionHandler:", v5, v9);

  -[PHMediaFormatLivePhotoConversionRequest videoConversionRequest](self, "videoConversionRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_662;
  v8[3] = &unk_1E9953C20;
  v8[4] = self;
  objc_msgSend(v4, "enqueueConversionRequest:completionHandler:", v7, v8);

}

- (void)enumerateSubrequests:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PHMediaFormatLivePhotoConversionRequest imageConversionRequest](self, "imageConversionRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  -[PHMediaFormatLivePhotoConversionRequest videoConversionRequest](self, "videoConversionRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v7);

}

- (void)didPreflightSubrequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PHMediaFormatConversionCompositeRequest areAllSubrequestsPreflighted](self, "areAllSubrequestsPreflighted", a3))
  {
    -[PHMediaFormatLivePhotoConversionRequest imageConversionRequest](self, "imageConversionRequest");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PHMediaFormatLivePhotoConversionRequest videoConversionRequest](self, "videoConversionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PHMediaFormatConversionCompositeRequest requiresFormatConversion](self, "requiresFormatConversion"))
    {
      objc_msgSend(v8, "setForceFormatConversion:", 1);
      objc_msgSend(v5, "setForceFormatConversion:", 1);
      if (-[PHMediaFormatConversionRequest livePhotoPairingIdentifierBehavior](self, "livePhotoPairingIdentifierBehavior") == 4)
      {
        -[PHMediaFormatConversionRequest livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1682, CFSTR("Unexpected nil pairing identifier for configured live photo pairing identifier behavior"));

        }
        objc_msgSend(v8, "setLivePhotoPairingIdentifier:", v6);
        objc_msgSend(v5, "setLivePhotoPairingIdentifier:", v6);

      }
    }

  }
}

- (PHMediaFormatConversionRequest)imageConversionRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 240, 1);
}

- (void)setImageConversionRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (PHMediaFormatConversionRequest)videoConversionRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setVideoConversionRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionRequest, 0);
  objc_storeStrong((id *)&self->_imageConversionRequest, 0);
}

void __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "imageConversionRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Live photo request image subrequest finished: %@", (uint8_t *)&v3, 0xCu);

  }
}

void __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_662(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "videoConversionRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Live photo request video subrequest finished: %@", (uint8_t *)&v3, 0xCu);

  }
}

+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The constructor %@ is unavailable for %@"), v7, v9);

  return 0;
}

+ (id)requestForImageConversionRequest:(id)a3 videoConversionRequest:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 1633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageConversionRequest"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMediaFormatConversion.m"), 1634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoConversionRequest"));

LABEL_3:
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setImageConversionRequest:", v9);
  objc_msgSend(v9, "setParentRequest:", v12);
  objc_msgSend(v12, "setVideoConversionRequest:", v11);
  objc_msgSend(v11, "setParentRequest:", v12);
  objc_msgSend(v12, "setLivePhotoPairingIdentifierBehavior:", 4);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLivePhotoPairingIdentifier:", v14);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "livePhotoPairingIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_debug_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Initial live photo pairing identifier for live photo request: %@", buf, 0xCu);

  }
  objc_msgSend(v12, "compositeRequestCommonInitWithError:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
