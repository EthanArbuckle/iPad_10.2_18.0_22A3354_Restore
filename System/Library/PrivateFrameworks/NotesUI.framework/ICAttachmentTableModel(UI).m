@implementation ICAttachmentTableModel(UI)

- (void)redactAuthorAttributionsToCurrentUser
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (objc_msgSend(a1, "isMergeableDataDirty"))
    objc_msgSend(a1, "writeMergeableData");
  v2 = objc_alloc(MEMORY[0x1E0D63CD8]);
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergeableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentReplicaID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithData:replicaID:", v4, v5);

  objc_msgSend(v6, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__ICAttachmentTableModel_UI__redactAuthorAttributionsToCurrentUser__block_invoke;
  v10[3] = &unk_1E5C1E330;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v10);

  objc_msgSend(v9, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mergeWithMergeableData:", v8);

  objc_msgSend(a1, "writeMergeableData");
}

- (id)htmlString
{
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  objc_msgSend(a1, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRightToLeft");
  v4 = CFSTR("ltr");
  if (v3)
    v4 = CFSTR("rtl");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<table cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse; direction: %@\">\n<tbody>\n"),
    v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__ICAttachmentTableModel_UI__htmlString__block_invoke;
  v11[3] = &unk_1E5C1E358;
  v8 = v6;
  v12 = v8;
  v13 = a1;
  objc_msgSend(v7, "enumerateRowsWithBlock:", v11);

  objc_msgSend(v8, "appendString:", CFSTR("</tbody>\n</table>"));
  v9 = v8;

  return v9;
}

- (uint64_t)canConvertToHTMLForSharing
{
  return 1;
}

- (const)attributesForSharingHTMLWithTagName:()UI textContent:
{
  id v5;

  objc_msgSend(a1, "htmlString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a4 = v5;

  return &stru_1E5C2F8C0;
}

- (uint64_t)quicklookPreviewItems
{
  return MEMORY[0x1E0C9AA60];
}

- (id)activityItems
{
  ICTableLinkPresentationActivityItemSource *v2;
  void *v3;
  ICTableLinkPresentationActivityItemSource *v4;
  void *v5;
  ICAttachmentTableActivityItemSource *v6;
  void *v7;
  ICAttachmentTableActivityItemSource *v8;
  void *v9;
  ICAttachmentActivityItemSource *v10;
  void *v11;
  ICAttachmentActivityItemSource *v12;
  void *v13;

  v2 = [ICTableLinkPresentationActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICTableLinkPresentationActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);

  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [ICAttachmentTableActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICAttachmentActivityItemSource initWithAttachment:](v6, "initWithAttachment:", v7);

  objc_msgSend(v5, "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [ICAttachmentActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICAttachmentActivityItemSource initWithAttachment:](v10, "initWithAttachment:", v11);
  objc_msgSend(v9, "arrayByAddingObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)drawPreviewInRect:()UI
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, a2, a3);
  objc_msgSend(a1, "previewInAvailableSize:shouldDraw:", 1, a4, a5);
  CGContextRestoreGState(CurrentContext);
}

- (CGFloat)previewInAvailableSize:()UI shouldDraw:
{
  void *v9;
  ICConstantAvailableTableWidthProvider *v10;
  ICTableColumnWidthManager *v11;
  void *v12;
  ICTableColumnWidthManager *v13;
  CGContext *CurrentContext;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  ICTableColumnWidthManager *v20;
  id v21;
  double v22;
  CGFloat v23;
  double v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, uint64_t, _BYTE *);
  void *v30;
  ICTableColumnWidthManager *v31;
  uint64_t *v32;
  uint64_t *v33;
  CGContext *v34;
  CGFloat v35;
  double v36;
  char v37;
  uint64_t v38;
  CGFloat *v39;
  uint64_t v40;
  double v41;
  _QWORD v42[4];
  id v43;
  ICTableColumnWidthManager *v44;
  void *v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  _QWORD *v49;
  CGFloat v50;
  double v51;
  CGContext *v52;
  char v53;
  char v54;
  _QWORD v55[4];
  uint64_t v56;
  double *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CGFloat *v61;
  uint64_t v62;
  uint64_t v63;

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_systemGray4Color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(ICConstantAvailableTableWidthProvider);
  -[ICConstantAvailableTableWidthProvider setAvailableWidth:](v10, "setAvailableWidth:", a2);
  v11 = [ICTableColumnWidthManager alloc];
  objc_msgSend(a1, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICTableColumnWidthManager initWithTable:delegate:](v11, "initWithTable:delegate:", v12, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  v60 = 0;
  v61 = (CGFloat *)&v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = (double *)&v56;
  v58 = 0x2020000000;
  v59 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0;
  objc_msgSend(a1, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isRightToLeft");

  objc_msgSend(a1, "table");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke;
  v42[3] = &unk_1E5C1E3A8;
  v47 = &v56;
  v53 = v16;
  v50 = a2;
  v51 = a3;
  v19 = v17;
  v43 = v19;
  v20 = v13;
  v44 = v20;
  v45 = a1;
  v54 = a5;
  v48 = &v60;
  v49 = v55;
  v52 = CurrentContext;
  v21 = v9;
  v46 = v21;
  objc_msgSend(v19, "enumerateRowsWithBlock:", v42);
  if (a5)
  {
    v38 = 0;
    v39 = (CGFloat *)&v38;
    v22 = 0.0;
    if (v16)
      v22 = a2;
    v40 = 0x2020000000;
    v41 = v22;
    v27 = v18;
    v28 = 3221225472;
    v29 = __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_3;
    v30 = &unk_1E5C1E3D0;
    v32 = &v38;
    v33 = &v60;
    v34 = CurrentContext;
    v37 = v16;
    v31 = v20;
    v35 = a2;
    v36 = a3;
    objc_msgSend(v19, "enumerateColumnsWithBlock:", &v27);
    CGContextMoveToPoint(CurrentContext, v39[3], 0.0);
    CGContextAddLineToPoint(CurrentContext, v39[3], v61[3]);
    v23 = v61[3];
    if (v16)
    {
      CGContextMoveToPoint(CurrentContext, a2, v23);
      v24 = a2 - v57[3];
    }
    else
    {
      CGContextMoveToPoint(CurrentContext, 0.0, v23);
      v24 = v57[3];
    }
    CGContextAddLineToPoint(CurrentContext, v24, v61[3]);
    v25 = objc_retainAutorelease(v21);
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v25, "CGColor", v27, v28, v29, v30));
    CGContextSetLineWidth(CurrentContext, 1.0);
    CGContextStrokePath(CurrentContext);

    _Block_object_dispose(&v38, 8);
  }
  if (v57[3] < a2)
    a2 = v57[3];

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  return a2;
}

@end
