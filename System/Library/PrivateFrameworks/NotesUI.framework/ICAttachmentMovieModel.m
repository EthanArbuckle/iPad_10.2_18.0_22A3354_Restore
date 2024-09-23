@implementation ICAttachmentMovieModel

void __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(a1 + 32), "needToGeneratePreviews"))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_8(uint64_t a1)
{
  double v2;
  uint64_t v3;
  double v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(double *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "scale");
  v5 = (id)objc_msgSend(v6, "updateAttachmentPreviewImageWithImageSrc:maxDimension:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v3, 0, 1, 0, 0, v2, v4);

}

void __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviewUpdateDate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateChangeCountWithReason:", CFSTR("Generated previews for movie"));

}

@end
