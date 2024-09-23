@implementation ICPencilKitTextFindingResult

- (double)cornerRadius
{
  return 5.0;
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
  v10.super_class = (Class)ICPencilKitTextFindingResult;
  v5 = -[ICTextFindingResult compare:](&v10, sel_compare_, v4);
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = -[ICPencilKitTextFindingResult order](self, "order");
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

- (id)framesForHighlightInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
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
  double height;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
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
  NSObject *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  CGFloat dx;
  CGFloat v72;
  CGAffineTransform v73;
  void *v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  void *v78;
  uint64_t v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  NSRect v91;
  NSRect v92;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], -[ICTextFindingResult range](self, "range"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
    {
      objc_msgSend(v4, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v6, -[ICTextFindingResult range](self, "range"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewProviderForTextAttachment:characterIndex:", v6, -[ICTextFindingResult range](self, "range"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "view");
    v8 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject window](v8, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NSObject bounds](v8, "bounds");
      v13 = v12;
      v15 = v14;
      Width = v16;
      v19 = v18;
    }
    else
    {
      v20 = -[ICTextFindingResult range](self, "range");
      objc_msgSend(v4, "ic_rectForRange:", v20, v21);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v4, "ic_textContainerOrigin");
      v31 = v30;
      v33 = v32;
      v80.origin.x = v23;
      v80.origin.y = v25;
      v80.size.width = v27;
      v80.size.height = v29;
      v81 = CGRectOffset(v80, v31, v33);
      height = v81.size.height;
      v13 = floor(v81.origin.x);
      v15 = floor(v81.origin.y);
      objc_msgSend(v4, "bounds");
      Width = CGRectGetWidth(v82);
      v19 = ceil(height);
    }
    v35 = v13;
    v72 = v15;
    +[ICPaperKitTextFindingResult scaleForDrawingBounds:](ICPaperKitTextFindingResult, "scaleForDrawingBounds:", v13, v15, Width, v19);
    v37 = v36;
    -[ICPencilKitTextFindingResult searchQueryItem](self, "searchQueryItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;

    CGAffineTransformMakeScale(&v73, v37, v37);
    v83.origin.x = v40;
    v83.origin.y = v42;
    v83.size.width = v44;
    v83.size.height = v46;
    v84 = CGRectApplyAffineTransform(v83, &v73);
    v85 = CGRectIntegral(v84);
    x = v85.origin.x;
    y = v85.origin.y;
    v49 = v85.size.width;
    v50 = v85.size.height;
    -[NSObject window](v8, "window");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      -[NSObject convertRect:toView:](v8, "convertRect:toView:", v4, x, y, v49, v50);
    }
    else
    {
      v86.origin.x = v35;
      v86.origin.y = v72;
      v86.size.width = Width;
      v86.size.height = v19;
      dx = CGRectGetMinX(v86);
      v87.origin.x = v35;
      v87.origin.y = v72;
      v87.size.width = Width;
      v87.size.height = v19;
      MinY = CGRectGetMinY(v87);
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = v49;
      v88.size.height = v50;
      *(CGRect *)&v52 = CGRectOffset(v88, dx, MinY);
    }
    v57 = v52;
    v58 = v53;
    v59 = v54;
    v60 = v55;

    v89.origin.x = v57;
    v89.origin.y = v58;
    v89.size.width = v59;
    v89.size.height = v60;
    v90 = CGRectInset(v89, -8.0, -8.0);
    v61 = v90.origin.x;
    v62 = v90.origin.y;
    v63 = v90.size.width;
    v64 = v90.size.height;
    v65 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      -[ICPencilKitTextFindingResult searchQueryItem](self, "searchQueryItem");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bounds");
      NSStringFromRect(v91);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v92.origin.x = v61;
      v92.origin.y = v62;
      v92.size.width = v63;
      v92.size.height = v64;
      NSStringFromRect(v92);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v76 = (uint64_t)v69;
      v77 = 2112;
      v78 = v70;
      _os_log_debug_impl(&dword_1DD7B0000, v65, OS_LOG_TYPE_DEBUG, "Converted frame for PencilKit find result from %@ to %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "ic_valueWithRect:", v61, v62, v63, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v76 = -[ICTextFindingResult range](self, "range");
      _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't find text attachment for PencilKit text finding result at %ld", buf, 0xCu);
    }
    v9 = (void *)MEMORY[0x1E0C9AA60];
    v7 = v8;
  }

  return v9;
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

- (CGSize)drawingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawingSize.width;
  height = self->_drawingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDrawingSize:(CGSize)a3
{
  self->_drawingSize = a3;
}

- (PKSearchQueryItem)searchQueryItem
{
  return self->_searchQueryItem;
}

- (void)setSearchQueryItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryItem, 0);
}

@end
