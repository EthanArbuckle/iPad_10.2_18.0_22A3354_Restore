@implementation CNPhotoPickerPhotoFacesProvider

- (CNPhotoPickerPhotoFacesProvider)initWithVisualIdentity:(id)a3
{
  id v5;
  CNPhotoPickerPhotoFacesProvider *v6;
  CNPhotoPickerPhotoFacesProvider *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  CNPhotoPickerPhotoFacesProvider *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerPhotoFacesProvider;
  v6 = -[CNPhotoPickerPhotoFacesProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = v7;
  }

  return v7;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  Class PHPhotoLibraryClass_44969;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v11 = a6;
  v12 = a7;
  v13 = a8;
  if (+[CNPhotoPickerCapabilities allowsPhotoLibraryAccess](CNPhotoPickerCapabilities, "allowsPhotoLibraryAccess")&& -[objc_class authorizationStatus](getPHPhotoLibraryClass_44969(), "authorizationStatus") != 2)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__44972;
    v26 = __Block_byref_object_dispose__44973;
    v27 = 0;
    if (-[objc_class authorizationStatus](getPHPhotoLibraryClass_44969(), "authorizationStatus"))
    {
      -[CNPhotoPickerPhotoFacesProvider getItemsFromPhotoLibraryWithItemDelegate:](self, "getItemsFromPhotoLibraryWithItemDelegate:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v23[5];
      v23[5] = v15;

    }
    else
    {
      PHPhotoLibraryClass_44969 = getPHPhotoLibraryClass_44969();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __104__CNPhotoPickerPhotoFacesProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke;
      v19[3] = &unk_1E204D808;
      v21 = &v22;
      v19[4] = self;
      v20 = v13;
      -[objc_class requestAuthorization:](PHPhotoLibraryClass_44969, "requestAuthorization:", v19);

    }
    v14 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)getItemsFromPhotoLibraryWithItemDelegate:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  Class PHPersonClass;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  CNPhotoPickerPhotoFacesProvider *v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  void *v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  +[CNPhotoLibraryProvider photoLibraryWithError:](CNPhotoLibraryProvider, "photoLibraryWithError:", &v49);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v49;
  if (v4)
  {
    v6 = objc_alloc_init((Class)getPHFetchOptionsClass[0]());
    -[NSObject setPhotoLibrary:](v6, "setPhotoLibrary:", v4);
    -[CNPhotoPickerPhotoFacesProvider visualIdentity](self, "visualIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    {
      PHPersonClass = getPHPersonClass();
      v51 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class fetchPersonsForContactIdentifiers:options:](PHPersonClass, "fetchPersonsForContactIdentifiers:options:", v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v32 = v11;
        v33 = v8;
        v37 = self;
        v34 = v6;
        v35 = v5;
        v13 = objc_alloc_init((Class)getPHFetchOptionsClass[0]());
        v36 = v4;
        objc_msgSend(v13, "setPhotoLibrary:", v4);
        objc_msgSend(v13, "setFetchLimit:", 4);
        v30 = v13;
        v31 = v12;
        objc_msgSend((Class)getPHFaceClass[0](), "fetchSuggestedFacesForPerson:options:", v12, v13);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fetchedObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((Class)getPHAssetClass[0](), "fetchAssetsGroupedByFaceUUIDForFaces:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v46 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v21, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                getPHImageRequestOptionsClass[0]();
                v24 = (void *)objc_opt_new();
                objc_msgSend(v24, "setSynchronous:", 1);
                objc_msgSend(v24, "setNetworkAccessAllowed:", 1);
                objc_msgSend(v24, "setResizeMode:", 1);
                objc_msgSend((Class)getPHImageManagerClass[0](), "defaultManager");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v40[0] = MEMORY[0x1E0C809B0];
                v40[1] = 3221225472;
                v40[2] = __76__CNPhotoPickerPhotoFacesProvider_getItemsFromPhotoLibraryWithItemDelegate___block_invoke;
                v40[3] = &unk_1E204D830;
                v40[4] = v37;
                v26 = v23;
                v41 = v26;
                v42 = v21;
                v43 = v38;
                v44 = v39;
                objc_msgSend(v25, "requestImageDataAndOrientationForAsset:options:resultHandler:", v26, v24, v40);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v18);
        }

        v5 = v35;
        v4 = v36;
        v8 = v33;
        v6 = v34;
        v12 = v31;
        v11 = v32;
      }
      v27 = v39;

    }
    else
    {
      v27 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v5;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Unable to fetch faces from photo library %@", buf, 0xCu);
    }
    v27 = (id)MEMORY[0x1E0C9AA60];
  }

  return v27;
}

- (CGRect)cropRectForAsset:(id)a3 face:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  CGFloat v36;
  __int16 v37;
  CGFloat v38;
  __int16 v39;
  CGFloat v40;
  __int16 v41;
  CGFloat v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  uint64_t v47;
  CGRect v48;
  CGRect result;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "size");
  v8 = v7;
  objc_msgSend(v5, "centerX");
  v10 = v9;
  objc_msgSend(v5, "centerY");
  v12 = v11;

  v13 = (double)(unint64_t)objc_msgSend(v6, "pixelWidth");
  v14 = objc_msgSend(v6, "pixelHeight");

  v15 = (double)v14;
  if (v13 >= (double)v14)
    v16 = (double)v14;
  else
    v16 = v13;
  v17 = v8 * v16;
  v18 = v8 * v16 * -0.5;
  v19 = v18 + v10 * v13;
  v20 = v18 + (1.0 - v12) * v15;
  v21 = v8 * v16 + v19 - v13;
  if (v21 < v8 * v16 + v20 - v15)
    v21 = v8 * v16 + v20 - v15;
  v22 = -(v8 * v16);
  if (v21 >= v22)
    v22 = v21;
  v23 = v22 - fmin(v19 + v22, 0.0);
  v24 = v23 - fmin(v20 + v23, 0.0);
  v25 = v17;
  v48 = CGRectInset(*(CGRect *)&v19, v24, v24);
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  height = v48.size.height;
  objc_msgSend((id)objc_opt_class(), "log");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v35 = 134219264;
    v36 = x;
    v37 = 2048;
    v38 = y;
    v39 = 2048;
    v40 = width;
    v41 = 2048;
    v42 = height;
    v43 = 2048;
    v44 = v13;
    v45 = 2048;
    v46 = (double)v14;
    _os_log_debug_impl(&dword_18AC56000, v30, OS_LOG_TYPE_DEBUG, "cropRect {%.2f, %.2f, %.2f, %.2f} for face asset of size (%.2f x %.2f)", (uint8_t *)&v35, 0x3Eu);
  }

  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __76__CNPhotoPickerPhotoFacesProvider_getItemsFromPhotoLibraryWithItemDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CNPhotoPickerPhotoFacesProviderItem *v12;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "cropRectForAsset:face:", v4, v5);
  v12 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerPhotoFacesProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v6, 0, 0, v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 40), "modificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerProviderItem setSortDate:](v12, "setSortDate:", v11);

  -[CNPhotoPickerProviderItem setDelegate:](v12, "setDelegate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);

}

void __104__CNPhotoPickerPhotoFacesProvider_loadItemsForSize_scale_RTL_renderingQueue_callbackQueue_itemDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getItemsFromPhotoLibraryWithItemDelegate:", *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = MEMORY[0x1E0C9AA60];
  }

}

+ (id)log
{
  if (log_cn_once_token_20_44981 != -1)
    dispatch_once(&log_cn_once_token_20_44981, &__block_literal_global_44982);
  return (id)log_cn_once_object_20_44983;
}

void __38__CNPhotoPickerPhotoFacesProvider_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerPhotoFacesProvider");
  v1 = (void *)log_cn_once_object_20_44983;
  log_cn_once_object_20_44983 = (uint64_t)v0;

}

@end
