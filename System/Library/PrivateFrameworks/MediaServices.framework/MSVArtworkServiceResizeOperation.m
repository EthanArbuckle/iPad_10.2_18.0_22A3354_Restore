@implementation MSVArtworkServiceResizeOperation

- (void)main
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  CGImageSource *ImageSource;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  CGImage *ImageFromSource;
  size_t Width;
  size_t Height;
  id v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  double v43;
  double v44;
  unint64_t v45;
  void *v46;
  CGImageDestination *FileImageDestination;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CGImage *cf;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  -[MSVArtworkServiceOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVArtworkServiceResizeOperation.m"), 21, CFSTR("MSVArtworkServiceResizeOperation only supports requests of type MSVArtworkServiceResizeRequest"));

  }
  -[MSVArtworkServiceOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "consumeSandboxExtensions");
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __40__MSVArtworkServiceResizeOperation_main__block_invoke;
  v77[3] = &unk_1E43E8680;
  v9 = v7;
  v78 = v9;
  v10 = v8;
  v79 = v10;
  objc_msgSend(v6, "enumerateDestinationsUsingBlock:", v77);
  if (!objc_msgSend(v10, "count"))
  {
    -[MSVArtworkServiceOperation setDebugMessage:](self, "setDebugMessage:", CFSTR("No resizing needed, all destinations already exist on disk."));
    goto LABEL_57;
  }
  objc_msgSend(v6, "sourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ImageSource = MSVImageUtilitiesCreateImageSource(v11);

  if (!ImageSource)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v6, "sourceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Invalid source image URL=%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v15);

  }
  -[MSVArtworkServiceOperation operationError](self, "operationError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v65 = v10;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v74;
      v63 = v6;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v74 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "destinationURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "URLByDeletingLastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v9, "fileExistsAtPath:", v24);

          if ((v25 & 1) != 0)
          {
            objc_msgSend(v23, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v9, "isWritableFileAtPath:", v26);

            if ((v27 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Destination directory isn't writable URL=%@"), v23);
              v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
              v30 = v29;
              -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v29);

              v6 = v63;
              goto LABEL_22;
            }
          }
          else
          {
            v72 = 0;
            objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 1, 0, &v72);
            v29 = v72;
            if (v29)
              goto LABEL_21;
            objc_msgSend(v23, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            MSVEnableDirStatsForDirectory(v28);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        v6 = v63;
        if (v19)
          continue;
        break;
      }
    }
LABEL_22:

    v10 = v65;
  }
  -[MSVArtworkServiceOperation operationError](self, "operationError");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
    goto LABEL_55;
  ImageFromSource = MSVImageUtilitiesCreateImageFromSource(ImageSource, 0);
  Width = CGImageGetWidth(ImageFromSource);
  cf = ImageFromSource;
  Height = CGImageGetHeight(ImageFromSource);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v35 = v10;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (!v36)
    goto LABEL_52;
  v37 = v36;
  v64 = v6;
  v66 = v10;
  v67 = 0;
  v38 = (double)Width;
  v39 = (double)Height;
  v40 = *(_QWORD *)v69;
  while (2)
  {
    for (j = 0; j != v37; ++j)
    {
      if (*(_QWORD *)v69 != v40)
        objc_enumerationMutation(v35);
      v42 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
      objc_msgSend(v42, "size");
      if (v43 >= v38)
      {
        objc_msgSend(v42, "size");
        if (v44 >= v39)
        {
          ++v67;
          continue;
        }
      }
      v45 = objc_msgSend(v42, "format");
      objc_msgSend(v42, "destinationURL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      FileImageDestination = MSVImageUtilitiesCreateFileImageDestination(v45, v46, 1uLL);

      if (!FileImageDestination)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Failed to create file image destination format=%ld"), objc_msgSend(v42, "format"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v60);

        goto LABEL_50;
      }
      if (objc_msgSend(v42, "format"))
      {
        v48 = objc_msgSend(v42, "format");
        objc_msgSend(v42, "size");
        v50 = v49;
        objc_msgSend(v42, "size");
        if (v50 >= v51)
          v52 = v50;
        else
          v52 = v51;
        if (MSVImageUtilitiesResizeSourceImageToDestination(ImageSource, 0, v48, FileImageDestination, v52))
          goto LABEL_41;
      }
      else
      {
        objc_msgSend(v42, "compressionQuality");
        v54 = v53;
        objc_msgSend(v42, "size");
        v56 = v55;
        objc_msgSend(v42, "size");
        if (v56 >= v57)
          v57 = v56;
        if (MSVImageUtilitiesResizeSourceImageToJPEGDestination(ImageSource, 0, FileImageDestination, v54, v57))
        {
LABEL_41:
          if (CGImageDestinationFinalize(FileImageDestination))
            goto LABEL_43;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVArtworkServiceErrorDomain"), 1, CFSTR("Failed to resize image"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVArtworkServiceOperation setOperationError:](self, "setOperationError:", v58);

LABEL_43:
      CFRelease(FileImageDestination);
      -[MSVArtworkServiceOperation operationError](self, "operationError");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
        goto LABEL_50;
    }
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (v37)
      continue;
    break;
  }
LABEL_50:

  v6 = v64;
  v10 = v66;
  if (v67)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipped %lu destinations that were larger than the source image."), v67);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[MSVArtworkServiceOperation setDebugMessage:](self, "setDebugMessage:", v35);
LABEL_52:

  }
  if (cf)
    CFRelease(cf);
LABEL_55:
  if (ImageSource)
    CFRelease(ImageSource);
LABEL_57:
  objc_msgSend(v6, "releaseSandboxExtensions");

}

void __40__MSVArtworkServiceResizeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "destinationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "fileExistsAtPath:", v6);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

@end
