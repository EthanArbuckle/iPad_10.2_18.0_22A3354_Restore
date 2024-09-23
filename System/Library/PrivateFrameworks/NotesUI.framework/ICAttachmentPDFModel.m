@implementation ICAttachmentPDFModel

uint64_t __55__ICAttachmentPDFModel_UI__genericListThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_list_loading_file"));
}

uint64_t __56__ICAttachmentPDFModel_UI__genericBrickThumbnailCreator__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("attachmentbrick_note_loading_file"));
}

void __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
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
    objc_msgSend(v10, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaURL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_8(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  v2 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSizeWidth:", v2);

  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSizeHeight:", v4);

}

uint64_t __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  CGContextFillRect(v3, *(CGRect *)(a1 + 32));
  CGContextGetCTM(&v7, v3);
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextTranslateCTM(v3, 0.0, -*(double *)(a1 + 72));
  memset(&v7, 0, sizeof(v7));
  CGPDFPageGetDrawingTransform(&v7, *(CGPDFPageRef *)(a1 + 80), kCGPDFCropBox, *(CGRect *)(a1 + 32), 0, 1);
  v6 = v7;
  CGContextConcatCTM(v3, &v6);
  return CGContextDrawPDFPageWithAnnotations();
}

void __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "scale");
  v4 = (id)objc_msgSend(v2, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v3, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreviewUpdateDate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateChangeCountWithReason:", CFSTR("Generated previews for PDF"));

}

@end
