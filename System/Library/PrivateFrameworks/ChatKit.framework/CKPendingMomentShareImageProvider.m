@implementation CKPendingMomentShareImageProvider

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v10;
  void (**v11)(id, id, _QWORD);
  char isKindOfClass;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, id, _QWORD))a7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 || (v13 & 1) != 0)
  {
    if (v11)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKPendingMomentShareImageProvider.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

    if ((isKindOfClass & 1) != 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v10, "placeholderImage");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v14, 0);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKPendingMomentShareImageProvider.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isPreviewAsset || isPlaceholderAsset"));

  if (!v11)
    goto LABEL_10;
LABEL_4:
  if ((isKindOfClass & 1) == 0)
    goto LABEL_11;
LABEL_5:
  v14 = v10;
  if (objc_msgSend(v14, "isPreviewImageDataAvailable"))
  {
    objc_msgSend(v14, "previewImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v15, 0);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "momentShare");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("No preview image data available for moment share: %@"), v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2938];
    v28[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("CKPendingMomentShareImageProviderErrorDomain"), -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *MEMORY[0x1E0CD1BE8];
    v26 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v11)[2](v11, 0, v21);

  }
LABEL_12:

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

@end
