@implementation CNVisualIdentityImagePickerController

- (CNVisualIdentityImagePickerController)initWithContactStyle:(id)a3
{
  id v5;
  CNVisualIdentityImagePickerController *v6;
  CNVisualIdentityImagePickerController *v7;
  CNVisualIdentityImagePickerController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVisualIdentityImagePickerController;
  v6 = -[CNVisualIdentityImagePickerController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStyle, a3);
    v8 = v7;
  }

  return v7;
}

- (void)presentCameraImagePickerFromViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "cameraImagePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);
  -[CNVisualIdentityImagePickerController presentImagePicker:withStyle:fromViewController:](self, "presentImagePicker:withStyle:fromViewController:", v5, 0, v4);

}

- (void)presentPhotoLibraryPickerFromViewController:(id)a3 sourceView:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "photoLibraryImagePickerWithIsMeContact:", -[CNVisualIdentityImagePickerController isMeContact](self, "isMeContact"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[CNVisualIdentityImagePickerController presentImagePicker:withStyle:fromViewController:](self, "presentImagePicker:withStyle:fromViewController:", v6, 3, v5);

}

- (void)presentMoveAndScaleForImageData:(id)a3 withCropRect:(CGRect)a4 fromViewController:(id)a5
{
  -[CNVisualIdentityImagePickerController presentMoveAndScaleForImageData:withCropRect:fromViewController:backgroundColor:](self, "presentMoveAndScaleForImageData:withCropRect:fromViewController:backgroundColor:", a3, a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)presentMoveAndScaleForImageData:(id)a3 withCropRect:(CGRect)a4 fromViewController:(id)a5 backgroundColor:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:backgroundColor:", v15, v13, x, y, width, height);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDelegate:", self);
  -[CNVisualIdentityImagePickerController presentImagePicker:withStyle:fromViewController:](self, "presentImagePicker:withStyle:fromViewController:", v16, 3, v14);

}

- (void)presentImagePicker:(id)a3 withStyle:(int64_t)a4 fromViewController:(id)a5 forVisualIdentityPicker:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v16, "setModalPresentationStyle:", a4);
  -[CNVisualIdentityImagePickerController contactStyle](self, "contactStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setModalTransitionStyle:", objc_msgSend(v12, "modalTransitionStyle"));

  -[CNVisualIdentityImagePickerController presenterDelegate](self, "presenterDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if (v11 && (v14 & 1) != 0)
  {
    -[CNVisualIdentityImagePickerController presenterDelegate](self, "presenterDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visualIdentityPicker:presentViewController:", v11, v16);

  }
  else
  {
    objc_msgSend(v10, "presentViewController:animated:completion:", v16, 1, 0);
  }

}

- (void)presentImagePicker:(id)a3 withStyle:(int64_t)a4 fromViewController:(id)a5
{
  -[CNVisualIdentityImagePickerController presentImagePicker:withStyle:fromViewController:forVisualIdentityPicker:](self, "presentImagePicker:withStyle:fromViewController:forVisualIdentityPicker:", a3, a4, a5, 0);
}

- (id)providerItemFromImagePickerInfo:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  UIImage *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v32;
  double v33;
  NSObject *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  UIImage *v58;
  void *v59;
  CNPhotoPickerProviderItem *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  double v65;
  double v66;
  double v67;
  void *v69;
  uint8_t buf[4];
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)MEMORY[0x1E0DC4CA0];
  if (!v5)
  {
    v7 = *MEMORY[0x1E0DC4CA0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImageJPEGRepresentation(v9, 0.8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v10;
  if (v10)
  {
    objc_msgSend(v10, "CGRectValue");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v19 = *MEMORY[0x1E0DC4CA8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (double)(unint64_t)objc_msgSend(v21, "pixelWidth");
    v23 = (double)(unint64_t)objc_msgSend(v21, "pixelHeight");
    objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = *MEMORY[0x1E0C9D820];
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*MEMORY[0x1E0C9D820] != v22 || v27 != v23)
    {
      objc_msgSend(v24, "size");
      if (v30 != v26 || v29 != v27)
      {
        objc_msgSend(v25, "size");
        if (v33 != v22 || v32 != v23)
        {
          objc_msgSend((id)objc_opt_class(), "log");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v25, "size");
            v37 = v36;
            objc_msgSend(v25, "size");
            *(_DWORD *)buf = 134219264;
            v71 = v12;
            v72 = 2048;
            v73 = v14;
            v74 = 2048;
            v75 = v16;
            v76 = 2048;
            v77 = v18;
            v78 = 2048;
            v79 = v37;
            v80 = 2048;
            v81 = v38;
            _os_log_impl(&dword_18AC56000, v35, OS_LOG_TYPE_DEFAULT, "Adjusting cropRect, mismatch detected with returned crop rect {%.2f, %.2f, %.2f, %.2f} and original image size {%.2f, %.2f}", buf, 0x3Eu);
          }

          v39 = (void *)MEMORY[0x1E0D13A80];
          objc_msgSend(v25, "size");
          objc_msgSend(v39, "scaledCropRect:fromSize:toSize:", v12, v14, v16, v18, v22, v23, v40, v41);
          v12 = v42;
          v14 = v43;
          v16 = v44;
          v18 = v45;
        }
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0D13A80];
  objc_msgSend(v46, "size");
  objc_msgSend(v47, "squareCropRect:toFitSize:", v12, v14, v16, v18, v48, v49);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58D0]);
  v58 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(v58, 0.8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, v59, v51, v53, v55, v57);
  objc_msgSend(v4, "objectForKeyedSubscript:", v19);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityImagePickerController photoLibraryAssetID](self, "photoLibraryAssetID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    -[CNPhotoPickerProviderItem setAssetIdentifier:](v60, "setAssetIdentifier:", v62);
  }
  else
  {
    objc_msgSend(v61, "localIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerProviderItem setAssetIdentifier:](v60, "setAssetIdentifier:", v63);

  }
  objc_msgSend((id)objc_opt_class(), "log");
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v46, "size");
    v66 = v65;
    objc_msgSend(v46, "size");
    *(_DWORD *)buf = 134219264;
    v71 = v66;
    v72 = 2048;
    v73 = v67;
    v74 = 2048;
    v75 = v51;
    v76 = 2048;
    v77 = v53;
    v78 = 2048;
    v79 = v55;
    v80 = 2048;
    v81 = v57;
    _os_log_impl(&dword_18AC56000, v64, OS_LOG_TYPE_DEFAULT, "Creating provider item with original image of size {%.2f, %.2f} and crop rect {%.2f, %.2f, %.2f, %.2f}", buf, 0x3Eu);
  }

  return v60;
}

- (void)imageDataFromPickerResult:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  objc_msgSend(a3, "itemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CEC520];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke;
  v10[3] = &unk_1E204D408;
  v11 = v5;
  v8 = v5;
  v9 = (id)objc_msgSend(v6, "loadDataRepresentationForContentType:completionHandler:", v7, v10);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  CNVisualIdentityImagePickerController *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13820] + 16))())
  {
    -[CNVisualIdentityImagePickerController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imagePickerController:didFinishWithProviderItem:", v6, 0);
  }
  else
  {
    -[CNVisualIdentityImagePickerController providerItemFromImagePickerInfo:](self, "providerItemFromImagePickerInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "sourceType");
    objc_msgSend(v8, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && v9 == 1)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v12 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(v8, "imageData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageWithData:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
      v15[3] = &unk_1E204D430;
      v16 = v8;
      v17 = self;
      v18 = v6;
      +[CNPhotoAssetCreationHelper createAssetFromImage:completionHandler:](CNPhotoAssetCreationHelper, "createAssetFromImage:completionHandler:", v11, v15);

    }
    else
    {
      -[CNVisualIdentityImagePickerController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imagePickerController:didFinishWithProviderItem:", v6, v8);

    }
  }

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNVisualIdentityImagePickerController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imagePickerControllerDidCancel:", v4);

}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (Class)getPHObjectClass[0]();
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class uuidFromLocalIdentifier:](v8, "uuidFromLocalIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityImagePickerController setPhotoLibraryAssetID:](self, "setPhotoLibraryAssetID:", v11);

    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__CNVisualIdentityImagePickerController_picker_didFinishPicking___block_invoke;
    v14[3] = &unk_1E204D458;
    v14[4] = self;
    v15 = v6;
    -[CNVisualIdentityImagePickerController imageDataFromPickerResult:completionHandler:](self, "imageDataFromPickerResult:completionHandler:", v12, v14);

  }
  else
  {
    -[CNVisualIdentityImagePickerController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imagePickerControllerDidCancel:", v6);

  }
}

- (CNVisualIdentityPickerPresenterDelegate)presenterDelegate
{
  return (CNVisualIdentityPickerPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenterDelegate, a3);
}

- (CNVisualIdentityImagePickerControllerDelegate)delegate
{
  return (CNVisualIdentityImagePickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMeContact
{
  return self->_isMeContact;
}

- (void)setIsMeContact:(BOOL)a3
{
  self->_isMeContact = a3;
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (void)setContactStyle:(id)a3
{
  objc_storeStrong((id *)&self->_contactStyle, a3);
}

- (NSString)photoLibraryAssetID
{
  return self->_photoLibraryAssetID;
}

- (void)setPhotoLibraryAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryAssetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryAssetID, 0);
  objc_storeStrong((id *)&self->_contactStyle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
}

void __65__CNVisualIdentityImagePickerController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "presentImagePicker:withStyle:fromViewController:", v4, 3, *(_QWORD *)(a1 + 40));

}

void __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setAssetIdentifier:", a2);
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2;
  v5[3] = &unk_1E204FAA0;
  v4 = *(void **)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v4;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "performBlock:", v5);

}

void __93__CNVisualIdentityImagePickerController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imagePickerController:didFinishWithProviderItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke_2;
  v6[3] = &unk_1E204F9B0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __85__CNVisualIdentityImagePickerController_imageDataFromPickerResult_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)log
{
  if (log_cn_once_token_20_42173 != -1)
    dispatch_once(&log_cn_once_token_20_42173, &__block_literal_global_42174);
  return (id)log_cn_once_object_20_42175;
}

+ (id)cameraImagePicker
{
  void *v2;

  objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSourceType:", 1);
  return v2;
}

+ (id)imagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "imagePickerForEditingImageData:withCropRect:backgroundColor:", v8, 0, x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)imagePickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 backgroundColor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v32[6];
  _QWORD v33[7];
  CGRect v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v33[6] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    if (CGRectIsEmpty(v34))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      v14 = v13;
      objc_msgSend(v12, "size");
      objc_msgSend(MEMORY[0x1E0D13A80], "centeredSquareCropRectInRect:", 0.0, 0.0, v14, v15 + -1.0);
      x = v16;
      y = v17;
      width = v18;
      height = v19;

    }
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3880]), "_initWithSourceImageData:cropRect:", v10, x, y, width, height);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DC3880]);
  }
  v21 = v20;
  objc_msgSend(v20, "_setImagePickerSavingOptions:", 7);
  v22 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v21, "_properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = *MEMORY[0x1E0DC5910];
  v32[0] = *MEMORY[0x1E0DC4C68];
  v32[1] = v25;
  v33[0] = MEMORY[0x1E0C9AAB0];
  v33[1] = MEMORY[0x1E0C9AAB0];
  v26 = *MEMORY[0x1E0DC58C8];
  v32[2] = *MEMORY[0x1E0DC5860];
  v32[3] = v26;
  v33[2] = MEMORY[0x1E0C9AAB0];
  v33[3] = MEMORY[0x1E0C9AAB0];
  v27 = *MEMORY[0x1E0DC5858];
  v33[4] = MEMORY[0x1E0C9AAB0];
  v28 = *MEMORY[0x1E0DC58B0];
  v29 = v11;
  v32[4] = v27;
  v32[5] = v28;
  if (!v11)
  {
    +[CNUIColorRepository photoPickerCaptureBackgroundColor](CNUIColorRepository, "photoPickerCaptureBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[5] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addEntriesFromDictionary:", v30);

  if (!v11)
  objc_msgSend(v21, "_setProperties:", v24);

  return v21;
}

+ (id)photoLibraryImagePickerWithIsMeContact:(BOOL)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "photoPickerForEditingImageData:withCropRect:isMeContact:", 0, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (id)photoPickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 isMeContact:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "photoPickerForEditingImageData:withCropRect:backgroundColor:isMeContact:", v10, 0, v5, x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)photoPickerForEditingImageData:(id)a3 withCropRect:(CGRect)a4 backgroundColor:(id)a5 isMeContact:(BOOL)a6
{
  _BOOL4 v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  Class v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v6 = a6;
  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  +[CNPhotoLibraryProvider photoLibraryWithError:](CNPhotoLibraryProvider, "photoLibraryWithError:", &v16, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Unable to pick photos from photo library %@", buf, 0xCu);
    }

  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)getPHPickerConfigurationClass[0]()), "initWithPhotoLibrary:", v7);
  objc_msgSend((Class)getPHPickerFilterClass[0](), "imagesFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilter:", v11);

  objc_msgSend(v10, "_setDisabledPrivateCapabilities:", 8);
  v12 = (Class)get_PHPickerSuggestionGroupClass[0]();
  if (v6)
    -[objc_class deviceOwnerSuggestionGroup](v12, "deviceOwnerSuggestionGroup");
  else
    -[objc_class wallpaperSuggestionGroup](v12, "wallpaperSuggestionGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set_suggestionGroup:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(getPHPickerViewControllerClass_42158()), "initWithConfiguration:", v10);
  return v14;
}

void __44__CNVisualIdentityImagePickerController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityImagePickerController");
  v1 = (void *)log_cn_once_object_20_42175;
  log_cn_once_object_20_42175 = (uint64_t)v0;

}

@end
