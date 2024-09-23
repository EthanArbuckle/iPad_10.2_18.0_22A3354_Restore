@implementation MSVArtworkServiceConversionOperation

- (void)main
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  CGImageSource *ImageSource;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  CGImageRef ImageFromSource;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  unint64_t v30;
  void *v31;
  CGImageDestination *FileImageDestination;
  double v33;
  void *v34;
  void *v35;
  id v36;
  id v37;

  -[MSVArtworkServiceOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceConversionOperation.m"), 20, CFSTR("MSVArtworkServiceConversionOperation only supports requests of type MSVArtworkServiceConversionRequest"));

  }
  -[MSVArtworkServiceOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "consumeSandboxExtensions");
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v6, "sourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ImageSource = MSVImageUtilitiesCreateImageSource(v8);

  if (!ImageSource)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v6, "sourceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Invalid source image URL=%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v12);

  }
  -[MSVArtworkServiceOperation operationError](self, "operationError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v6, "destinationURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "fileExistsAtPath:", v16);

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v15, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v7, "isWritableFileAtPath:", v18);

      if ((v19 & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Destination directory isn't writable URL=%@"), v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
      objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v37);
      v20 = v37;
      if (!v20)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v20);
    goto LABEL_11;
  }
LABEL_13:
  -[MSVArtworkServiceOperation operationError](self, "operationError");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_30;
  objc_msgSend(v6, "destinationURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", v22, 0);

  ImageFromSource = MSVImageUtilitiesCreateImageFromSource(ImageSource, 0);
  MSVImageUtilitiesCopyUTTypeForImage();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (ImageFromSource)
    CFRelease(ImageFromSource);
  MSVImageUtilitiesCopyUTTypeForImageFormat(objc_msgSend(v6, "destinationFormat"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", v24))
  {
    objc_msgSend(v6, "sourceURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destinationURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v28 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v26, v27, &v36);
    v29 = v36;

    if ((v28 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
    v30 = objc_msgSend(v6, "destinationFormat");
    objc_msgSend(v6, "destinationURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    FileImageDestination = MSVImageUtilitiesCreateFileImageDestination(v30, v31, 1uLL);

    if (FileImageDestination)
    {
      if (objc_msgSend(v6, "destinationFormat"))
      {
        MSVImageUtilitiesAddSourceImageToDestination(ImageSource, 0, objc_msgSend(v6, "destinationFormat"), FileImageDestination);
      }
      else
      {
        objc_msgSend(v6, "destinationCompressionQuality");
        MSVImageUtilitiesAddSourceImageToJPEGDestination(ImageSource, 0, FileImageDestination, v33);
      }
      if (!CGImageDestinationFinalize(FileImageDestination))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Failed to convert image"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v34);

      }
      CFRelease(FileImageDestination);
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Failed to convert image format=%ld"), objc_msgSend(v6, "destinationFormat"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v29);
LABEL_24:

LABEL_29:
LABEL_30:
  if (ImageSource)
    CFRelease(ImageSource);
  objc_msgSend(v6, "releaseSandboxExtensions");

}

@end
