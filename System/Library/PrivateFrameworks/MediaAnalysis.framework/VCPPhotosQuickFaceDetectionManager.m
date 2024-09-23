@implementation VCPPhotosQuickFaceDetectionManager

- (VCPPhotosQuickFaceDetectionManager)init
{

  return 0;
}

- (VCPPhotosQuickFaceDetectionManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  VCPPhotosQuickFaceDetectionManager *v6;
  VCPPhotosQuickFaceDetectionManager *v7;
  void *v8;
  VCPFaceAnalyzer *v9;
  VCPFaceAnalyzer *faceAnalyzer;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPPhotosQuickFaceDetectionManager;
  v6 = -[VCPPhotosQuickFaceDetectionManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:](VCPPhotosFaceProcessingContext, "contextWithPhotoLibrary:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VCPFaceAnalyzer initWithContext:]([VCPFaceAnalyzer alloc], "initWithContext:", v8);
    faceAnalyzer = v7->_faceAnalyzer;
    v7->_faceAnalyzer = v9;

  }
  return v7;
}

- (int)_persistFaces:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PHPhotoLibrary *photoLibrary;
  BOOL v11;
  id v12;
  int v13;
  void *v14;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__VCPPhotosQuickFaceDetectionManager__persistFaces_forAsset___block_invoke;
    aBlock[3] = &unk_1E6B16D58;
    v8 = v7;
    v18 = v8;
    v19 = v6;
    v9 = _Block_copy(aBlock);
    photoLibrary = self->_photoLibrary;
    v16 = 0;
    v11 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v9, &v16);
    v12 = v16;
    if (v11)
    {
      v13 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v14;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " [%@] QuickFaceDetect: failed to persist classification results: %@", buf, 0x16u);

      }
      v13 = objc_msgSend(v12, "code");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __61__VCPPhotosQuickFaceDetectionManager__persistFaces_forAsset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CD1530], "creationRequestForFace");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "placeholderForCreatedFace");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:](VCPFaceUtils, "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:", v6, v7);
        objc_msgSend(v7, "setNameSource:", 6);
        v16 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addFaces:", v9);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x1E0CD1398], "quickClassificationFaceAdjustmentVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFaceAdjustmentVersion:", v10);

}

- (int)processAsset:(id)a3
{
  id v4;
  void *v5;
  VCPFaceAnalyzer *faceAnalyzer;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    v18 = 1024;
    LODWORD(v19) = objc_msgSend(v4, "deferredProcessingNeeded");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, " [%@] QuickFaceDetect: analyzing asset (deferType: %d)", buf, 0x12u);

  }
  faceAnalyzer = self->_faceAnalyzer;
  v15 = 0;
  v7 = -[VCPFaceAnalyzer quickAnalyzeAsset:results:](faceAnalyzer, "quickAnalyzeAsset:results:", v4, &v15);
  v8 = v15;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FaceResults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FacesToPersist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[VCPPhotosQuickFaceDetectionManager _persistFaces:forAsset:](self, "_persistFaces:forAsset:", v11, v4);
    if (!v7 && (int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2048;
      v19 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, " [%@] QuickFaceDetect: processed %lu faces", buf, 0x16u);

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAnalyzer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
