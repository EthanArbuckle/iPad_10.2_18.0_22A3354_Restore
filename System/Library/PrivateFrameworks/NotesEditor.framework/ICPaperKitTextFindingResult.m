@implementation ICPaperKitTextFindingResult

+ (double)scaleForDrawingBounds:(CGRect)a3
{
  double v3;

  v3 = *MEMORY[0x1E0CD1338];
  return CGRectGetWidth(a3) / v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICPaperKitTextFindingResult;
  v5 = -[ICTextFindingResult compare:](&v10, sel_compare_, v4);
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = -[ICPaperKitTextFindingResult order](self, "order");
      v8 = objc_msgSend(v6, "order");

      if (v7 < v8)
        v5 = -1;
      else
        v5 = v7 != v8;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (CGRect)frameForHighlightInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Width;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double height;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double x;
  double y;
  double v49;
  double v50;
  void *v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  CGFloat MinY;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat dx;
  CGFloat v66;
  CGAffineTransform v67;
  uint8_t buf[4];
  uint64_t v69;
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect result;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], -[ICTextFindingResult range](self, "range"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v6, -[ICTextFindingResult range](self, "range"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject window](v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSObject bounds](v8, "bounds");
      v11 = v10;
      v13 = v12;
      Width = v14;
      v17 = v16;
    }
    else
    {
      v22 = -[ICTextFindingResult range](self, "range");
      objc_msgSend(v4, "ic_rectForRange:", v22, v23);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      objc_msgSend(v4, "ic_textContainerOrigin");
      v33 = v32;
      v35 = v34;
      v71.origin.x = v25;
      v71.origin.y = v27;
      v71.size.width = v29;
      v71.size.height = v31;
      v72 = CGRectOffset(v71, v33, v35);
      height = v72.size.height;
      v11 = floor(v72.origin.x);
      v13 = floor(v72.origin.y);
      objc_msgSend(v4, "bounds");
      Width = CGRectGetWidth(v73);
      v17 = ceil(height);
    }
    v66 = v11;
    +[ICPaperKitTextFindingResult scaleForDrawingBounds:](ICPaperKitTextFindingResult, "scaleForDrawingBounds:", v11, v13, Width, v17);
    v38 = v37;
    -[ICPaperKitTextFindingResult searchResultRect](self, "searchResultRect");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    CGAffineTransformMakeScale(&v67, v38, v38);
    v74.origin.x = v40;
    v74.origin.y = v42;
    v74.size.width = v44;
    v74.size.height = v46;
    v75 = CGRectApplyAffineTransform(v74, &v67);
    v76 = CGRectIntegral(v75);
    x = v76.origin.x;
    y = v76.origin.y;
    v49 = v76.size.width;
    v50 = v76.size.height;
    -[NSObject window](v8, "window");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v8, x, y, v49, v50);
    }
    else
    {
      v77.origin.x = v66;
      v77.origin.y = v13;
      v77.size.width = Width;
      v77.size.height = v17;
      dx = CGRectGetMinX(v77);
      v78.origin.x = v66;
      v78.origin.y = v13;
      v78.size.width = Width;
      v78.size.height = v17;
      MinY = CGRectGetMinY(v78);
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = v49;
      v79.size.height = v50;
      *(CGRect *)&v52 = CGRectOffset(v79, dx, MinY);
    }
    v57 = v52;
    v58 = v53;
    v59 = v54;
    v60 = v55;

    v80.origin.x = v57;
    v80.origin.y = v58;
    v80.size.width = v59;
    v80.size.height = v60;
    v81 = CGRectInset(v80, -8.0, -8.0);
    v18 = v81.origin.x;
    v19 = v81.origin.y;
    v20 = v81.size.width;
    v21 = v81.size.height;
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v8 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v69 = -[ICTextFindingResult range](self, "range");
      _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find text attachment for PaperKit text finding result at %ld", buf, 0xCu);
    }
    v7 = v8;
  }

  v61 = v18;
  v62 = v19;
  v63 = v20;
  v64 = v21;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (id)framesForHighlightInTextView:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[ICPaperKitTextFindingResult frameForHighlightInTextView:](self, "frameForHighlightInTextView:", a3);
  objc_msgSend(MEMORY[0x1E0CB3B18], "ic_valueWithRect:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)generateFindPreviewImageForPaperKitAttachment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;

  v6 = a4;
  v7 = a3;
  -[ICPaperKitTextFindingResult searchResultRect](self, "searchResultRect");
  v21 = CGRectInset(v20, -100.0, -100.0);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  objc_msgSend(MEMORY[0x1E0D64D28], "imageGeneratorWithPaperAttachment:useActivePaper:", v7, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSixChannelBlendingEnabled:", 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__ICPaperKitTextFindingResult_generateFindPreviewImageForPaperKitAttachment_completion___block_invoke;
  v14[3] = &unk_1EA7DFB90;
  v15 = v6;
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  v13 = v6;
  objc_msgSend(v12, "imageWithBounds:completion:", v14, x, y, width, height);

}

uint64_t __88__ICPaperKitTextFindingResult_generateFindPreviewImageForPaperKitAttachment_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(double, double, double, double))(result + 16))(*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return result;
}

- (void)selectInTextView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSelectedRange:", -[ICTextFindingResult range](self, "range"), 0);

}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (CGRect)searchResultRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_searchResultRect.origin.x;
  y = self->_searchResultRect.origin.y;
  width = self->_searchResultRect.size.width;
  height = self->_searchResultRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSearchResultRect:(CGRect)a3
{
  self->_searchResultRect = a3;
}

@end
