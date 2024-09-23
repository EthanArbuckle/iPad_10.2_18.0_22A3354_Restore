@implementation MPArtworkResizeOperation

- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4
{
  return -[MPArtworkResizeOperation initWithImage:scaledFittingSize:destinationURL:](self, "initWithImage:scaledFittingSize:destinationURL:", a3, 0, a4.width, a4.height);
}

- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4 destinationURL:(id)a5
{
  return -[MPArtworkResizeOperation initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:](self, "initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:", a3, 0, a5, a4.width, a4.height);
}

- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4 useExactFittingSizeAsDestinationSize:(BOOL)a5 destinationURL:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  MPArtworkResizeOperation *v14;
  MPArtworkResizeOperation *v15;
  dispatch_group_t v16;
  OS_dispatch_group *operationGroup;
  objc_super v19;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MPArtworkResizeOperation;
  v14 = -[MPArtworkResizeOperation init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_destinationURL, a6);
    v15->_scaledFittingSize.width = width;
    v15->_scaledFittingSize.height = height;
    objc_storeStrong((id *)&v15->_image, a3);
    v16 = dispatch_group_create();
    operationGroup = v15->_operationGroup;
    v15->_operationGroup = (OS_dispatch_group *)v16;

    v15->_usesExactFittingSizeAsDestinationSize = a5;
  }

  return v15;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *resizedImage;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  NSError *v24;
  NSError *error;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  UIImage *v41;
  UIImage *v42;
  CGImage *v43;
  CGImageRef v44;
  CGImage *v45;
  NSObject *v46;
  NSObject *v47;
  UIImage *v48;
  void *v49;
  uint64_t v50;
  _QWORD block[4];
  id v52;
  CGImage *v53;
  BOOL v54;
  _QWORD v55[9];
  uint8_t buf[4];
  UIImage *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  -[MPArtworkResizeOperation destinationURL](self, "destinationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    resizedImage = self->_resizedImage;
    self->_resizedImage = v6;

  }
  if (!self->_resizedImage)
  {
    -[MPArtworkResizeOperation image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

    -[MPArtworkResizeOperation image](self, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

    -[MPArtworkResizeOperation scaledFittingSize](self, "scaledFittingSize");
    v17 = v16;
    v19 = v18;
    -[MPArtworkResizeOperation image](self, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v21 = CFSTR("Failed to resize nil image.");
LABEL_15:
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2938];
      v61[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("MPArtworkResizeErrorDomain"), 0, v23);
      v24 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v24;

LABEL_34:
      goto LABEL_35;
    }
    if (v10 <= 0.00000011920929 || v12 <= 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input image has invalid size: {%f, %f}."), *(_QWORD *)&v10, *(_QWORD *)&v12);
    }
    else if (v15 <= 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input image has invalid scale: %f."), *(_QWORD *)&v15, v50);
    }
    else
    {
      if (v17 > 0.00000011920929 && v19 > 0.00000011920929)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to resize image with invalid scaled fitting size: {%f, %f}."), *(_QWORD *)&v17, *(_QWORD *)&v19);
    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_15;
LABEL_16:
    -[MPArtworkResizeOperation _resizedScaledSizeForScaledImageSize:scaledFittingSize:](self, "_resizedScaledSizeForScaledImageSize:scaledFittingSize:", v10 * v15, v12 * v15, v17, v19);
    v27 = v26;
    v29 = v28;
    v30 = -[MPArtworkResizeOperation usesExactFittingSizeAsDestinationSize](self, "usesExactFittingSizeAsDestinationSize");
    if (v30)
      v31 = v17;
    else
      v31 = v27;
    if (v30)
      v32 = v19;
    else
      v32 = v29;
    v33 = v32 > v29 + 0.00000011920929 || v31 > v27 + 0.00000011920929;
    v34 = v27 / v15;
    v35 = v29 / v15;
    v36 = v31 / v15;
    v37 = round((v31 / v15 - v34) * 0.5);
    v38 = v32 / v15;
    v39 = round((v32 / v15 - v35) * 0.5);
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setOpaque:](v21, "setOpaque:", !v33);
    -[__CFString setScale:](v21, "setScale:", v15);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v21, v36, v38);
    v40 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __32__MPArtworkResizeOperation_main__block_invoke;
    v55[3] = &unk_1E3159870;
    v55[4] = self;
    *(double *)&v55[5] = v37;
    *(double *)&v55[6] = v39;
    *(double *)&v55[7] = v34;
    *(double *)&v55[8] = v35;
    objc_msgSend(v23, "imageWithActions:", v55);
    v41 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v42 = self->_resizedImage;
    self->_resizedImage = v41;

    v43 = -[UIImage CGImage](self->_resizedImage, "CGImage");
    if (v43)
    {
      v44 = CGImageRetain(v43);
      v45 = v44;
      if (v3 && self->_resizedImage && v44)
      {
        dispatch_get_global_queue(0, 0);
        v46 = objc_claimAutoreleasedReturnValue();
        block[0] = v40;
        block[1] = 3221225472;
        block[2] = __32__MPArtworkResizeOperation_main__block_invoke_16;
        block[3] = &unk_1E315ED60;
        v54 = v33;
        v52 = v3;
        v53 = v45;
        dispatch_async(v46, block);

        goto LABEL_34;
      }
    }
    else
    {
      v47 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = self->_resizedImage;
        -[MPArtworkResizeOperation image](self, "image");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v48;
        v58 = 2114;
        v59 = v49;
        _os_log_impl(&dword_193B9B000, v47, OS_LOG_TYPE_ERROR, "[MPArtwork] failed to create scaled image for resized image: %{public}@ from image: %{public}@", buf, 0x16u);

      }
      v45 = 0;
    }
    CGImageRelease(v45);
    goto LABEL_34;
  }
LABEL_35:

}

- (CGSize)_resizedScaledSizeForScaledImageSize:(CGSize)a3 scaledFittingSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  CGSize result;

  if (a3.width <= a4.width)
  {
    a4.width = a3.width;
    height = a3.height;
  }
  else
  {
    height = floor(a3.height * a4.width / a3.width);
  }
  if (height > a4.height)
  {
    a4.width = floor(a3.width * a4.height / a3.height);
    height = a4.height;
  }
  width = a4.width;
  v6 = height;
  result.height = v6;
  result.width = width;
  return result;
}

- (UIImage)resizedImage
{
  return self->_resizedImage;
}

- (NSError)error
{
  return self->_error;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (OS_dispatch_group)operationGroup
{
  return self->_operationGroup;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGSize)scaledFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scaledFittingSize.width;
  height = self->_scaledFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScaledFittingSize:(CGSize)a3
{
  self->_scaledFittingSize = a3;
}

- (BOOL)usesExactFittingSizeAsDestinationSize
{
  return self->_usesExactFittingSizeAsDestinationSize;
}

- (void)setUsesExactFittingSizeAsDestinationSize:(BOOL)a3
{
  self->_usesExactFittingSizeAsDestinationSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resizedImage, 0);
}

void __32__MPArtworkResizeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(a2, "CGContext"), kCGInterpolationHigh);
  objc_msgSend(*(id *)(a1 + 32), "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void __32__MPArtworkResizeOperation_main__block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t FileImageDestination;
  CGImageDestination *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v13);
  v5 = v13;

  if ((v4 & 1) != 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D51270], "devicePreferredImageFormat");
    if (*(_BYTE *)(a1 + 48))
      v7 = 1;
    else
      v7 = v6;
    FileImageDestination = MSVImageUtilitiesCreateFileImageDestination();
    if (FileImageDestination)
    {
      v9 = (CGImageDestination *)FileImageDestination;
      if (v7)
        MSVImageUtilitiesAddImageToDestination();
      else
        MSVImageUtilitiesAddJPEGToDestination();
      if (!CGImageDestinationFinalize(v9))
      {
        v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v15 = v12;
          _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "[MPArtwork] Could not write resized image to %{public}@: Failed to finalize CGImageDestination", buf, 0xCu);

        }
      }
      CFRelease(v9);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = v2;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "[MPArtwork] Failed to create directory at '%{public}@' with error: %{public}@", buf, 0x16u);
    }

  }
  CGImageRelease(*(CGImageRef *)(a1 + 40));

}

@end
