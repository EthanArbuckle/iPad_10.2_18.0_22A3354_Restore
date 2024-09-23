@implementation ICAttachmentGalleryModel

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (objc_msgSend(*(id *)(a1 + 32), "needToGeneratePreviews"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstSubAttachment");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attachmentPreviewImageWithMinSize:scale:", *(double *)(a1 + 64), *(double *)(a1 + 64), 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "orientedImage");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewImages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mutableCopy");
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
  }
}

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_11(id *a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  v2 = (double)objc_msgSend(a1[5], "unsignedIntValue");
  objc_msgSend(a1[4], "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSizeWidth:", v2);

  v4 = (double)objc_msgSend(a1[6], "unsignedIntValue");
  objc_msgSend(a1[4], "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSizeHeight:", v4);

}

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "scale");
  objc_msgSend(v2, "updateAttachmentPreviewImageWithImageSrc:maxDimension:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v3, 0, 1, 0, 0, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObject:", v7);
    v6 = v7;
  }

}

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removePreviewImages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
          objc_msgSend(*(id *)(a1 + 32), "attachment", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "managedObjectContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "deleteObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date", (_QWORD)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreviewUpdateDate:", v11);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Generated gallery previews"));

}

void __53__ICAttachmentGalleryModel_UI__quicklookPreviewItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "supportsQuickLook"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

void __50__ICAttachmentGalleryModel_UI__drawPreviewInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(a2, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = v7;
    objc_msgSend(v7, "size");
    v7 = v14;
    if (v8 > 0.0)
    {
      objc_msgSend(v14, "size");
      v7 = v14;
      if (v9 > 0.0)
      {
        objc_msgSend(v14, "size");
        v11 = v10;
        objc_msgSend(v14, "size");
        v13 = *(double *)(a1 + 40) * (v11 / v12);
        objc_msgSend(v14, "drawInRect:", *(double *)(a1 + 48) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(double *)(a1 + 56) + 24.0 + *(double *)(a1 + 104), v13);
        v7 = v14;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v13
                                                                    + 12.0
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                + 24);
      }
    }
  }
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > *(double *)(a1 + 64))
    *a5 = 1;

}

@end
