@implementation ICAttachmentDrawingModel

void __75__ICAttachmentDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawing");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unrotatedBoundsInCommandSpace");
  if (CGRectIsNull(v9))
  {
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "setUnrotatedBoundsInCommandSpace:");
  }
  objc_msgSend(v8, "setOrientation:", 0);
  objc_msgSend(v8, "serializeWithPathData:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD1158]), "initWithLegacyData:", v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v8, "fullBounds");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "set_canvasBounds:");

}

void __70__ICAttachmentDrawingModel_UI__saveDrawing_withImage_forImageDrawing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D635F8];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v2, v4);

}

@end
