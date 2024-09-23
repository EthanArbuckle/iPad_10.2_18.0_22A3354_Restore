@implementation ICAttachmentTableModel

uint64_t __67__ICAttachmentTableModel_UI__redactAuthorAttributionsToCurrentUser__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a2;
  objc_msgSend(v7, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_truncated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = *MEMORY[0x1E0D63940];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "ic_range");
  objc_msgSend(v12, "addAttribute:value:range:", v13, v15, v16, v17);

  objc_msgSend(*(id *)(a1 + 32), "table");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedString:columnIndex:rowIndex:", v12, a3, a4);

  return 0;
}

void __40__ICAttachmentTableModel_UI__htmlString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("<tr>"));
  objc_msgSend(*(id *)(a1 + 40), "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ICAttachmentTableModel_UI__htmlString__block_invoke_2;
  v7[3] = &unk_1E5C1E330;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, v6, 0, v7);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("</tr>\n"));
}

id __40__ICAttachmentTableModel_UI__htmlString__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("<td valign=\"top\" style=\"border-style: solid; border-width: 1.0px 1.0px 1.0px 1.0px; border-color: #ccc; padding: 3.0px 5.0px 3.0px 5.0px; min-width: 70px\">"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "attributedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = *MEMORY[0x1E0D63940];
    v7 = objc_msgSend(v5, "ic_range");
    objc_msgSend(v5, "removeAttribute:range:", v6, v7, v8);
    objc_msgSend(MEMORY[0x1E0D63BB8], "htmlStringFromAttributedString:attachmentConversionHandler:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("<br>"));
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("</td>"));
  return v3;
}

void __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  CGContext *v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  char v24;
  char v25;
  _QWORD v26[4];

  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  if (*(_BYTE *)(a1 + 112))
    v7 = *(_QWORD *)(a1 + 88);
  else
    v7 = 0;
  v26[3] = v7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_2;
  v15[3] = &unk_1E5C1E380;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v24 = *(_BYTE *)(a1 + 112);
  v16 = v9;
  v20 = v26;
  v17 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 48);
  v18 = v10;
  v19 = v11;
  v25 = *(_BYTE *)(a1 + 113);
  v21 = *(_OWORD *)(a1 + 72);
  v22 = *(_QWORD *)(a1 + 64);
  v23 = *(_OWORD *)(a1 + 88);
  objc_msgSend(v8, "enumerateColumnsWithBlock:", v15);
  if (*(_BYTE *)(a1 + 113))
  {
    v12 = *(CGContext **)(a1 + 104);
    if (*(_BYTE *)(a1 + 112))
    {
      CGContextMoveToPoint(v12, *(CGFloat *)(a1 + 88), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v13 = *(double *)(a1 + 88) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    else
    {
      CGContextMoveToPoint(v12, 0.0, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
    CGContextAddLineToPoint(*(CGContextRef *)(a1 + 104), v13, *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 104), (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "CGColor"));
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 104), 1.0);
    CGContextStrokePath(*(CGContextRef *)(a1 + 104));
  }
  v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v14 < 16.0)
    v14 = 16.0;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v14
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) > *(double *)(a1 + 96))
    *a4 = 1;

  _Block_object_dispose(v26, 8);
}

void __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  ICTTTextStorage *v13;
  void *v14;
  ICTTTextStorage *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  id v30;
  CGRect v31;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "widthOfColumn:", v7);
  v9 = v8;
  if (*(_BYTE *)(a1 + 112))
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24)
                                                                - v8;
  objc_msgSend(*(id *)(a1 + 40), "stringForColumnID:rowID:", v7, *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", v12, 0);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "length"))
  {
    v13 = [ICTTTextStorage alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ICTTTextStorage initWithData:replicaID:](v13, "initWithData:replicaID:", 0, v14);

    -[ICTTTextStorage setWantsUndoCommands:](v15, "setWantsUndoCommands:", 0);
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v15, "replaceCharactersInRange:withAttributedString:", 0, 0, v30);
    v16 = *MEMORY[0x1E0D63950];
    v17 = -[ICTTTextStorage ic_range](v15, "ic_range");
    -[ICTTTextStorage removeAttribute:range:](v15, "removeAttribute:range:", v16, v17, v18);
    objc_msgSend(*(id *)(a1 + 32), "styler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextStorage setStyler:](v15, "setStyler:", v19);

    objc_msgSend(*(id *)(a1 + 32), "styler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "styleText:inExactRange:fixModelAttributes:", v15, 0, -[ICTTTextStorage length](v15, "length"), 1);

    -[ICTTTextStorage boundingRectWithSize:options:context:](v15, "boundingRectWithSize:options:context:", 1, 0, v9 + 5.0 * -2.0, 1.79769313e308);
    v24 = v23;
    if (*(_BYTE *)(a1 + 113))
    {
      v25 = v9 + 5.0 * -2.0;
      v31 = CGRectOffset(*(CGRect *)&v21, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 5.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 5.0);
      -[ICTTTextStorage drawInRect:](v15, "drawInRect:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    }
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v27 = *(double *)(v26 + 24);
    if (v27 < v24 + 5.0 + 4.0)
      v27 = v24 + 5.0 + 4.0;
    *(double *)(v26 + 24) = v27;

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                          + 24);
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v29 = *(double *)(v28 + 24);
  if (!*(_BYTE *)(a1 + 112))
  {
    *(double *)(v28 + 24) = v9 + v29;
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) <= *(double *)(a1 + 96))
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v29 < 0.0)
LABEL_11:
    *a4 = 1;
LABEL_12:

}

void __64__ICAttachmentTableModel_UI__previewInAvailableSize_shouldDraw___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGContext *v6;
  CGFloat v7;
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  v6 = *(CGContext **)(a1 + 56);
  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8 = a2;
  CGContextMoveToPoint(v6, v7, 0.0);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 56), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  LODWORD(v6) = *(unsigned __int8 *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "widthOfColumn:", v8);
  v10 = v9;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(double *)(v11 + 24);
  if ((_DWORD)v6)
  {
    *(double *)(v11 + 24) = v12 - v10;
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 0.0)
      return;
  }
  else
  {
    *(double *)(v11 + 24) = v10 + v12;
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= *(double *)(a1 + 64))
      return;
  }
  *a4 = 1;
}

@end
