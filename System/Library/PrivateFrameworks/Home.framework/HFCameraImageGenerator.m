@implementation HFCameraImageGenerator

- (HFCameraImageGenerator)initWithDelegate:(id)a3
{
  id v4;
  HFCameraImageGenerator *v5;
  HFCameraImageGenerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFCameraImageGenerator;
  v5 = -[HFCameraImageGenerator init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_imagesExpected = 0;
  }

  return v6;
}

- (void)generateImagesFromAsset:(id)a3 forOffsets:(id)a4 atSize:(CGSize)a5 withKey:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Float64 v21;
  void *v22;
  void *v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  CMTime v27;
  CMTime v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  height = a5.height;
  width = a5.width;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  -[HFCameraImageGenerator setKey:](self, "setKey:", v13);
  v23 = v11;
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0CA2E68];
  v24 = v35;
  v36 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v15 = v36;
  objc_msgSend(v14, "setRequestedTimeToleranceBefore:", &v35);
  v33 = v24;
  v34 = v15;
  objc_msgSend(v14, "setRequestedTimeToleranceAfter:", &v33);
  objc_msgSend(v14, "setMaximumSize:", width, height);
  -[HFCameraImageGenerator setImagesExpected:](self, "setImagesExpected:", objc_msgSend(v12, "count"));
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "doubleValue");
        memset(&v28, 0, sizeof(v28));
        CMTimeMakeWithSeconds(&v28, v21, 1);
        v27 = v28;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  objc_initWeak((id *)&v28, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __76__HFCameraImageGenerator_generateImagesFromAsset_forOffsets_atSize_withKey___block_invoke;
  v25[3] = &unk_1EA737940;
  objc_copyWeak(&v26, (id *)&v28);
  objc_msgSend(v14, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v16, v25);
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)&v28);

}

void __76__HFCameraImageGenerator_generateImagesFromAsset_forOffsets_atSize_withKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, void *a6)
{
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3 || a5 || v11)
  {
    HFLogForCategory(0x19uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Error: Trying to generate image %@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = *(_OWORD *)a2;
    v22 = *(_QWORD *)(a2 + 16);
    v19 = *a4;
    v20 = *((_QWORD *)a4 + 2);
    objc_msgSend(v13, "imageGenerator:failedToGenerateImageForRequestedTime:actualTime:forKey:", WeakRetained, buf, &v19, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = *(_OWORD *)a2;
    v22 = *(_QWORD *)(a2 + 16);
    v19 = *a4;
    v20 = *((_QWORD *)a4 + 2);
    objc_msgSend(v14, "imageGenerator:didGenerateImage:requestedTime:actualTime:forKey:", WeakRetained, v13, buf, &v19, v15);

  }
  objc_msgSend(WeakRetained, "setImagesExpected:", objc_msgSend(WeakRetained, "imagesExpected") - 1);
  if (!objc_msgSend(WeakRetained, "imagesExpected"))
  {
    objc_msgSend(WeakRetained, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageGenerator:finishedGeneratingImagesForKey:", WeakRetained, v18);

  }
}

- (HFCameraImageGeneratorDelegate)delegate
{
  return (HFCameraImageGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)imagesExpected
{
  return self->_imagesExpected;
}

- (void)setImagesExpected:(unint64_t)a3
{
  self->_imagesExpected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
