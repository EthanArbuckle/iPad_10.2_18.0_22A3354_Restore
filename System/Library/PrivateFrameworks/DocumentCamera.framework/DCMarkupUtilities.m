@implementation DCMarkupUtilities

+ (id)dataToEditForDocumentInfo:(id)a3 imageCache:(id)a4 includeMarkupModelData:(BOOL)a5
{
  return (id)objc_msgSend(a1, "dataToEditForDocumentInfo:includeMarkupModelData:imageCache:embedMarkupModelDataInImage:", a3, a5, a4, 1);
}

+ (id)dataToEditForDocumentInfo:(id)a3 includeMarkupModelData:(BOOL)a4 imageCache:(id)a5 embedMarkupModelDataInImage:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  UIImage *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *context;
  id v25;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "fullImageUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getImage:", v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

  UIImageJPEGRepresentation(v11, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(v8, "currentOrientation");
    objc_msgSend(v8, "markupModelData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageQuad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || objc_msgSend(v8, "currentFilter") || v15)
    {
      v25 = a1;
      context = (void *)MEMORY[0x212B98734]();
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v16, v15);
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }
      +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:", v16, 0, objc_msgSend(v8, "currentFilter"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICDocCamImageFilters imageWithRGBColorspaceFromImage:](ICDocCamImageFilters, "imageWithRGBColorspaceFromImage:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDF6AC8], "dc_orientedImageFromImage:toOrientation:", v19, v13);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v20;
      }
      objc_msgSend(v19, "dc_JPEGData");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(context);
      v12 = (void *)v21;
      a1 = v25;
    }
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(a1, "imageDataWithMarkupModelData:sourceImageData:", v14, v12);
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v22;
    }

  }
  return v12;
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(getMarkupViewControllerClass(), "hasPrivateImageMetadata:", v3);

  return v4;
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getMarkupViewControllerClass(), "cleanImageMetadataFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createMarkupViewController
{
  return objc_alloc_init((Class)getMarkupViewControllerClass());
}

+ (id)createProcessingMarkupViewControllerOutWindow:(id *)a3
{
  void *v3;

  objc_msgSend(a1, "createMarkupViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEncryptPrivateMetadata:", 0);
  return v3;
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4
{
  return (id)objc_msgSend(a1, "imageDataWithMarkupModelData:sourceImageData:embedData:", a3, a4, 0);
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageData:(id)a4 embedData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v30 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke;
  v26[3] = &unk_24C5B80C0;
  v12 = v10;
  v27 = v12;
  v13 = v9;
  v28 = v13;
  v14 = v8;
  v29 = v14;
  dc_performBlockOnMainThread(v26);
  v25 = 0;
  objc_msgSend(v12, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", v5, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (v16)
  {
    v17 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[DCMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

  }
  return v15;
}

uint64_t __76__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageData_embedData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setData:withArchivedModelData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)imageDataWithMarkupModelData:(id)a3 sourceImageURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __65__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke;
  v24[3] = &unk_24C5B80C0;
  v10 = v8;
  v25 = v10;
  v11 = v7;
  v26 = v11;
  v12 = v6;
  v27 = v12;
  dc_performBlockOnMainThread(v24);
  v23 = 0;
  objc_msgSend(v10, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", 0, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (v14)
  {
    v15 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[DCMarkupUtilities imageDataWithMarkupModelData:sourceImageData:embedData:].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

  }
  return v13;
}

uint64_t __65__DCMarkupUtilities_imageDataWithMarkupModelData_sourceImageURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFileURL:withArchivedModelData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)markupModelDataFromDataAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v14 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__DCMarkupUtilities_markupModelDataFromDataAtURL___block_invoke;
  v11[3] = &unk_24C5B7BF0;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  dc_performBlockOnMainThread(v11);
  objc_msgSend(v8, "createArchivedModelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __50__DCMarkupUtilities_markupModelDataFromDataAtURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFileURL:withArchivedModelData:", *(_QWORD *)(a1 + 40), 0);
}

+ (id)markupModelDataFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v14 = 0;
  objc_msgSend(a1, "createProcessingMarkupViewControllerOutWindow:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__DCMarkupUtilities_markupModelDataFromData___block_invoke;
  v11[3] = &unk_24C5B7BF0;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  dc_performBlockOnMainThread(v11);
  objc_msgSend(v8, "createArchivedModelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __45__DCMarkupUtilities_markupModelDataFromData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setData:withArchivedModelData:", *(_QWORD *)(a1 + 40), 0);
}

+ (void)applyMarkupModelData:(id)a3 documentInfo:(id)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  char v11;
  unint64_t v12;

  v12 = (unint64_t)a3;
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "markupModelData");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v12 | v9)
  {
    v10 = (void *)v9;
    v11 = objc_msgSend((id)v12, "isEqual:", v9);

    if ((v11 & 1) == 0)
      objc_msgSend(v7, "setMarkupModelData:", v12);
  }
  if (v8)
    v8[2](v8);

}

+ (void)extractReturnedMarkupURL:(id)a3 documentInfo:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "startAccessingSecurityScopedResource");
  objc_msgSend(a1, "markupModelDataFromDataAtURL:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopAccessingSecurityScopedResource");

  objc_msgSend(a1, "applyMarkupModelData:documentInfo:completionBlock:", v11, v9, v8);
}

+ (void)imageDataWithMarkupModelData:(uint64_t)a3 sourceImageData:(uint64_t)a4 embedData:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a2, a3, "Markup error: %@", a5, a6, a7, a8, 2u);
}

@end
