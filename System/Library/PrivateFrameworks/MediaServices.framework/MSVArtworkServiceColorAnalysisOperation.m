@implementation MSVArtworkServiceColorAnalysisOperation

- (MSVArtworkColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (void)main
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  CGImageSource *ImageSource;
  CGImageRef ImageFromSource;
  MSVArtworkColorAnalyzer *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MSVArtworkServiceOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceColorAnalysisOperation.m"), 28, CFSTR("MSVArtworkServiceColorAnalysisOperation only supports requests of type MSVArtworkServiceColorAnalysisRequest"));

  }
  -[MSVArtworkServiceOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "consumeSandboxExtensions");
  objc_msgSend(v6, "sourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ImageSource = MSVImageUtilitiesCreateImageSource(v7);

  if (!ImageSource)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v6, "sourceURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Invalid source image URL=%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v16);

    goto LABEL_11;
  }
  ImageFromSource = MSVImageUtilitiesCreateImageFromSource(ImageSource, 0);
  v10 = -[MSVArtworkColorAnalyzer initWithSourceImage:]([MSVArtworkColorAnalyzer alloc], "initWithSourceImage:", ImageFromSource);
  -[MSVArtworkColorAnalyzer analyze](v10, "analyze");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.MediaServices", "Artwork");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "sourceURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v22 = v13;
      _os_log_impl(&dword_1A077D000, v12, OS_LOG_TYPE_INFO, "Created artwork analysis for source URL=%{private}@", buf, 0xCu);

    }
    objc_storeStrong((id *)&self->_colorAnalysis, v11);
    if (!ImageFromSource)
      goto LABEL_9;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    -[MSVArtworkColorAnalyzer debugDescription](v10, "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Failed to create color analysis with analyzer=%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v19);

    if (!ImageFromSource)
      goto LABEL_9;
  }
  CFRelease(ImageFromSource);
LABEL_9:
  CFRelease(ImageSource);

LABEL_11:
  objc_msgSend(v6, "releaseSandboxExtensions");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorAnalysis, 0);
}

@end
