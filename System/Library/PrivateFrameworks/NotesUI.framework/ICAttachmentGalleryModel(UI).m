@implementation ICAttachmentGalleryModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (id)quicklookPreviewItems
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__81;
  v9 = __Block_byref_object_dispose__81;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "subAttachmentCount"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ICAttachmentGalleryModel_UI__quicklookPreviewItems__block_invoke;
  v4[3] = &unk_1E5C20CF0;
  v4[4] = &v5;
  objc_msgSend(a1, "enumerateSubAttachmentsWithBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)activityItems
{
  ICAttachmentGalleryActivityItemSource *v2;
  void *v3;
  ICAttachmentGalleryActivityItemSource *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = [ICAttachmentGalleryActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICAttachmentActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previewItemURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamPDFGenerator pdfURLForAttachment:](ICDocCamPDFGenerator, "pdfURLForAttachment:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)providerFileTypes
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)fileURLForTypeIdentifier:()UI
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC570]),
        v5,
        v6))
  {
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamPDFGenerator pdfURLForAttachment:](ICDocCamPDFGenerator, "pdfURLForAttachment:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)drawPreviewInRect:()UI
{
  void *v10;
  int v11;
  CGContext *CurrentContext;
  const CGPath *v13;
  id v14;
  double width;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat y;
  CGFloat x;
  double height;
  _QWORD v30[14];
  _QWORD v31[4];
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[3];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "preferredViewSize");

  if (v11 == 1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)&off_1EED56828;
    objc_msgSendSuper2(&v32, sel_drawPreviewInRect_, a2, a3, a4, a5);
  }
  else
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v35.origin.x = a2;
    v35.origin.y = a3;
    v35.size.width = a4;
    v35.size.height = a5;
    CGContextClipToRect(CurrentContext, v35);
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = a4;
    v36.size.height = a5;
    v13 = CGPathCreateWithRoundedRect(v36, 16.0, 16.0, 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v14, "CGColor"));

    CGContextAddPath(CurrentContext, v13);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v13);
    v37.origin.x = a2;
    v37.origin.y = a3;
    v37.size.width = a4;
    v37.size.height = a5;
    v38 = CGRectInset(v37, 12.0, 12.0);
    y = v38.origin.y;
    x = v38.origin.x;
    width = v38.size.width;
    height = v38.size.height;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForStyle:withFontWeight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1420]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ic_fontWithSingleLineA");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0DC1140];
    v33[0] = *MEMORY[0x1E0DC1138];
    v33[1] = v19;
    v34[0] = v18;
    v34[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, width, height);
    v23 = v39.origin.x;
    v24 = v39.origin.y;
    v25 = v39.size.width;
    v26 = v39.size.height;
    v40 = CGRectOffset(v39, x, y);
    objc_msgSend(v22, "drawInRect:withAttributes:", v20, v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0x4028000000000000;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __50__ICAttachmentGalleryModel_UI__drawPreviewInRect___block_invoke;
    v30[3] = &unk_1E5C24410;
    *(double *)&v30[5] = height - v26 + -12.0;
    *(CGFloat *)&v30[6] = a2;
    *(CGFloat *)&v30[7] = a3;
    *(CGFloat *)&v30[8] = a4;
    v30[4] = v31;
    *(CGFloat *)&v30[9] = a5;
    *(CGFloat *)&v30[10] = v23;
    *(CGFloat *)&v30[11] = v24;
    *(CGFloat *)&v30[12] = v25;
    *(double *)&v30[13] = v26;
    objc_msgSend(a1, "enumerateSubAttachmentsWithBlock:", v30);
    CGContextRestoreGState(CurrentContext);
    _Block_object_dispose(v31, 8);

  }
}

- (id)blockingGeneratePDFURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDocCamPDFGenerator blockingGeneratePDFURLForAttachment:withProgress:error:](ICDocCamPDFGenerator, "blockingGeneratePDFURLForAttachment:withProgress:error:", v1, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
