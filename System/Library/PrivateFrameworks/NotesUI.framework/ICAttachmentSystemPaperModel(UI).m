@implementation ICAttachmentSystemPaperModel(UI)

- (id)imageForActivityItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  v13 = 0;
  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ICAttachmentSystemPaperModel_UI__imageForActivityItem__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  if (v9[5])
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPreviewImageLoader orientedImage:withBackground:](ICAttachmentPreviewImageLoader, "orientedImage:withBackground:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (ICAttachmentSystemPaperActivityItemSource)activityItem
{
  ICAttachmentSystemPaperActivityItemSource *v2;
  void *v3;
  ICAttachmentSystemPaperActivityItemSource *v4;

  v2 = [ICAttachmentSystemPaperActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICAttachmentActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);

  return v4;
}

- (id)activityItems
{
  uint64_t v2;
  void *v3;
  void *v4;
  ICAttachmentActivityItemSource *v5;
  void *v6;
  ICAttachmentActivityItemSource *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityItem");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  v5 = [ICAttachmentActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICAttachmentActivityItemSource initWithAttachment:](v5, "initWithAttachment:", v6);
  objc_msgSend(v4, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)drawPreviewInRect:()UI
{
  void *v10;
  void *v11;
  void *v12;
  CGContext *CurrentContext;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  CGRect v38;
  CGRect v39;
  CGRect ClipBoundingBox;

  objc_msgSend(MEMORY[0x1E0D639E8], "currentInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:](ICSystemPaperImageGenerator, "imageGeneratorWithPaperAttachment:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSixChannelBlendingEnabled:", 0);
  CurrentContext = UIGraphicsGetCurrentContext();
  ClipBoundingBox = CGContextGetClipBoundingBox(CurrentContext);
  v38.origin.x = a2;
  v38.origin.y = a3;
  v38.size.width = a4;
  v38.size.height = a5;
  v39 = CGRectIntersection(v38, ClipBoundingBox);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54__ICAttachmentSystemPaperModel_UI__drawPreviewInRect___block_invoke;
  v23[3] = &unk_1E5C1FB30;
  v26 = a2;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v23[4] = a1;
  v25 = &v34;
  v18 = v12;
  v24 = v18;
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  objc_msgSend(v10, "performAsDefaultAppearance:", v23);
  if (!*((_BYTE *)v35 + 24))
  {
    objc_msgSend(a1, "attachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fallbackImageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAttachmentPreviewImageLoader orientedImage:withBackground:](ICAttachmentPreviewImageLoader, "orientedImage:withBackground:", v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "drawInRect:", a2, a3, a4, a5);
    }

  }
  _Block_object_dispose(&v34, 8);

}

@end
