@implementation CLSImageUtils

+ (id)JPEGDataFromCGImage:(CGImage *)a3 error:(id *)a4
{
  __CFData *v6;
  CGImageDestination *v7;
  const char *v8;
  CGImageDestination *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __CFData *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (__CFData *)objc_opt_new();
    v7 = CGImageDestinationCreateWithData(v6, CFSTR("public.jpeg"), 1uLL, 0);
    if (v7)
    {
      v9 = v7;
      CGImageDestinationAddImage(v7, a3, 0);
      if (CGImageDestinationFinalize(v9) && objc_msgSend_length(v6, v10, v11))
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v10, 100, CFSTR("CGImageDestinationFinalize failed"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v16;
        if (a4)
          *a4 = objc_retainAutorelease(v16);
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v17 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          v21 = 138543362;
          v22 = v12;
          _os_log_error_impl(&dword_1D4054000, v17, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_JPEGDataFromCGImage' %{public}@", (uint8_t *)&v21, 0xCu);
        }

        v6 = 0;
      }
      CFRelease(v9);
      v6 = v6;
      v15 = v6;
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v8, 100, CFSTR("CGImageDestinationCreateWithData failed"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18;
      if (a4)
        *a4 = objc_retainAutorelease(v18);
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v19 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v21 = 138543362;
        v22 = v12;
        _os_log_error_impl(&dword_1D4054000, v19, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_JPEGDataFromCGImage' %{public}@", (uint8_t *)&v21, 0xCu);
      }
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], a2, 2, CFSTR("Input image is NULL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v14 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v21 = 138543362;
      v22 = v12;
      _os_log_error_impl(&dword_1D4054000, v14, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_JPEGDataFromCGImage' %{public}@", (uint8_t *)&v21, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

+ (CGImage)CGImageFromJPEGData:(id)a3 error:(id *)a4
{
  const __CFData *v5;
  const char *v6;
  const __CFData *v7;
  CGImageSource *v8;
  const char *v9;
  CGImageSource *v10;
  const char *v11;
  CGImage *ImageAtIndex;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v6, 2, CFSTR("Input data is NULL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v17 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v20 = 138543362;
    v21 = v13;
    goto LABEL_25;
  }
  v8 = CGImageSourceCreateWithData(v5, 0);
  if (!v8)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v9, 100, CFSTR("CGImageSourceCreateWithData failed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v17 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v20 = 138543362;
    v21 = v13;
LABEL_25:
    _os_log_error_impl(&dword_1D4054000, v17, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_CreateImageFromJPEGData' %{public}@", (uint8_t *)&v20, 0xCu);
LABEL_22:
    ImageAtIndex = 0;
    goto LABEL_23;
  }
  v10 = v8;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
  v13 = 0;
  if (!ImageAtIndex)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v11, 100, CFSTR("CGImageSourceCreateImageAtIndex failed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v15 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v20 = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1D4054000, v15, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in'_CreateImageFromJPEGData' %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
  CFRelease(v10);
LABEL_23:

  return ImageAtIndex;
}

+ (id)JPEGDataFromCGImage:(CGImage *)a3 desiredMinimumDimension:(unint64_t)a4 desiredMaximumDimension:(unint64_t)a5 error:(id *)a6
{
  void *v9;
  NSObject *v10;
  size_t Height;
  size_t Width;
  const char *v15;
  uint64_t Thumb;
  const char *v17;
  CGImage *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], a2, 2, CFSTR("Input image is NULL"), a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v21 = 138543362;
    v22 = v9;
    goto LABEL_27;
  }
  if (a5 < a4)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], a2, 2, CFSTR("desiredMaxDimension < desiredMinDimension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v21 = 138543362;
    v22 = v9;
    goto LABEL_27;
  }
  Height = CGImageGetHeight(a3);
  Width = CGImageGetWidth(a3);
  if (Height < a4 && Width < a4)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v15, 2, CFSTR("Input image dimension is less than desiredMinDimension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    v21 = 138543362;
    v22 = v9;
    goto LABEL_27;
  }
  if (Width > a5 || Height > a5)
    Thumb = CGImageCreateThumb();
  else
    Thumb = (uint64_t)CGImageRetain(a3);
  v18 = (CGImage *)Thumb;
  if (Thumb)
  {
    objc_msgSend_JPEGDataFromCGImage_error_(a1, v17, Thumb, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v18);
    return v19;
  }
  objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v17, 2, CFSTR("Failed to create thumbnail image from input image"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v10 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v21 = 138543362;
    v22 = v9;
LABEL_27:
    _os_log_error_impl(&dword_1D4054000, v10, OS_LOG_TYPE_ERROR, "ERROR: Error occurred in 'JPEGThumbnailDataFromCGImage:...' %{public}@", (uint8_t *)&v21, 0xCu);
  }
LABEL_28:
  if (a6)
    *a6 = objc_retainAutorelease(v9);

  v19 = 0;
  return v19;
}

+ (id)JPEGDataForThumbnailForFileAtURL:(id)a3 maxSize:(CGSize)a4 scaleFactor:(double)a5 error:(id *)a6
{
  double height;
  double width;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  dispatch_block_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  dispatch_time_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD *, void *, void *);
  void *v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1D40AB798;
  v48 = sub_1D40AB7A8;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1D40AB798;
  v42 = sub_1D40AB7A8;
  v43 = 0;
  v12 = objc_alloc(MEMORY[0x1E0CD32C8]);
  v14 = (void *)objc_msgSend_initWithFileAtURL_size_scale_representationTypes_(v12, v13, (uint64_t)v11, 4, width, height, a5);
  objc_msgSend_setBadgeType_(v14, v15, 0);
  v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1E9749B50);
  objc_msgSend_sharedGenerator(MEMORY[0x1E0CD32D0], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = sub_1D40AB7B4;
  v33 = &unk_1E974B950;
  v35 = &v38;
  v20 = v16;
  v34 = v20;
  v36 = &v44;
  v37 = a1;
  objc_msgSend_generateBestRepresentationForRequest_completionHandler_(v19, v21, (uint64_t)v14, &v30);

  v22 = dispatch_time(0, 60000000000);
  if (dispatch_block_wait(v20, v22))
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v23, 320, CFSTR("Timed out JPEGDataForThumbnailForFileAtURL!"), v30, v31, v32, v33);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v39[5];
    v39[5] = v24;

    objc_msgSend_cls_log_((void *)v39[5], v26, CLSLogDefault);
  }
  if (a6)
  {
    v27 = (void *)v39[5];
    if (v27)
      *a6 = objc_retainAutorelease(v27);
  }
  v28 = (id)v45[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

+ (CGSize)sizeOfImageAtURL:(id)a3
{
  CGImageSource *v3;
  CGImageSource *v4;
  CGImage *ImageAtIndex;
  CGImage *v6;
  double Width;
  double Height;
  double v9;
  double v10;
  CGSize result;

  v3 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v3)
  {
    v4 = v3;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, 0);
    if (ImageAtIndex)
    {
      v6 = ImageAtIndex;
      Width = (double)CGImageGetWidth(ImageAtIndex);
      Height = (double)CGImageGetHeight(v6);
      CGImageRelease(v6);
    }
    else
    {
      Height = 0.0;
      Width = 0.0;
    }
    CFRelease(v4);
  }
  else
  {
    Height = 0.0;
    Width = 0.0;
  }
  v9 = Width;
  v10 = Height;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
