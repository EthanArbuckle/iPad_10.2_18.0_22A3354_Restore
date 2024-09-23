@implementation ICTextFindingResult

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[ICTextFindingResult range](self, "range");
  v6 = objc_msgSend(v4, "range");

  if (v5 < v6)
    return -1;
  else
    return v5 != v6;
}

- (id)framesForHighlightInTextView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICTextFindingResult range](self, "range");
  v8 = v7;
  objc_msgSend(v4, "textContainerInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v4, "textLayoutManager");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ic_textRangeForRange:", v6, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke;
    v30[3] = &unk_1EA7E1168;
    v32 = v10;
    v33 = v12;
    v34 = v14;
    v35 = v16;
    v31 = v5;
    objc_msgSend(v17, "enumerateTextSegmentsInRange:type:options:usingBlock:", v18, 0, 1, v30);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTextFindingResult framesForHighlightInTextView:]", 1, 0, CFSTR("Unsupported use of TextKit1."));
    objc_msgSend(v4, "layoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ensureLayoutForGlyphRange:", 0, v6 + v8);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_2;
    v21[3] = &unk_1EA7E11B8;
    v24 = v6;
    v25 = v8;
    v22 = v19;
    v26 = v10;
    v27 = v12;
    v28 = v14;
    v29 = v16;
    v23 = v5;
    v17 = v19;
    objc_msgSend(v17, "enumerateLineFragmentsForGlyphRange:usingBlock:", v6, v8, v21);

  }
  return v5;
}

uint64_t __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", a2 + *(double *)(a1 + 48), a3 + *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

void __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger v7;
  NSUInteger v8;
  id v9;
  NSRange v10;
  __int128 v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  NSRange v17;
  NSRange v18;

  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = a2;
  v17.location = a3;
  v17.length = a4;
  v18.location = v7;
  v18.length = v8;
  v10 = NSIntersectionRange(v17, v18);
  v13[1] = 3221225472;
  v11 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 64);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_3;
  v13[3] = &unk_1EA7E1190;
  v16 = v11;
  v12 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v12, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v10.location, v10.length, v10.location, v10.length, v9, v13);

}

void __52__ICTextFindingResult_framesForHighlightInTextView___block_invoke_3(uint64_t a1, double a2, double a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "ic_valueWithRect:", a2 + *(double *)(a1 + 48), a3 + *(double *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)selectInTextView:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[ICTextFindingResult range](self, "range");
  objc_msgSend(v6, "setSelectedRange:", v4, v5);

}

- (void)scrollToVisibleInTextView:(id)a3
{
  id v4;
  double y;
  double x;
  double height;
  double width;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICTextFindingResult isAttachmentResult](self, "isAttachmentResult"))
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ICTextFindingResult framesForHighlightInTextView:](self, "framesForHighlightInTextView:", v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "ic_rectValue");
          v28.origin.x = v14;
          v28.origin.y = v15;
          v28.size.width = v16;
          v28.size.height = v17;
          v26.origin.x = x;
          v26.origin.y = y;
          v26.size.width = width;
          v26.size.height = height;
          v27 = CGRectUnion(v26, v28);
          x = v27.origin.x;
          y = v27.origin.y;
          width = v27.size.width;
          height = v27.size.height;
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "ic_scrollRectToVisible:animated:completionHandler:", 1, 0, x, y, width, height);
  }
  else
  {
    v18 = -[ICTextFindingResult range](self, "range");
    objc_msgSend(v4, "scrollRangeToVisible:", v18, v19);
  }

}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (BOOL)isAttachmentResult
{
  return self->_attachmentResult;
}

- (void)setAttachmentResult:(BOOL)a3
{
  self->_attachmentResult = a3;
}

@end
