@implementation CKTranscriptPrintPageRenderer

- (CKTranscriptPrintPageRenderer)initWithTranscriptCollectionViewController:(id)a3
{
  id v5;
  CKTranscriptPrintPageRenderer *v6;
  CKTranscriptPrintPageRenderer *v7;
  uint64_t v8;
  UIScrollView *scrollView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptPrintPageRenderer;
  v6 = -[CKTranscriptPrintPageRenderer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transcriptCollectionViewController, a3);
    objc_msgSend(v5, "collectionView");
    v8 = objc_claimAutoreleasedReturnValue();
    scrollView = v7->_scrollView;
    v7->_scrollView = (UIScrollView *)v8;

    -[CKTranscriptPrintPageRenderer setCurrentPrintableRect:](v7, "setCurrentPrintableRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKTranscriptPrintPageRenderer setNumberOfPagesForCurrentConfiguration:](v7, "setNumberOfPagesForCurrentConfiguration:", 0);
  }

  return v7;
}

- (void)_determineNumberOfPages
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[UIPrintPageRenderer printableRect](self, "printableRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptPrintPageRenderer currentPrintableRect](self, "currentPrintableRect");
  v22.origin.x = v11;
  v22.origin.y = v12;
  v22.size.width = v13;
  v22.size.height = v14;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  if (!CGRectEqualToRect(v21, v22))
  {
    -[UIPrintPageRenderer printableRect](self, "printableRect");
    -[CKTranscriptPrintPageRenderer setNumberOfPagesForCurrentConfiguration:](self, "setNumberOfPagesForCurrentConfiguration:", -[CKTranscriptPrintPageRenderer __computedNumberOfPagesForPrintableRect:](self, "__computedNumberOfPagesForPrintableRect:"));
    -[UIPrintPageRenderer printableRect](self, "printableRect");
    -[CKTranscriptPrintPageRenderer setCurrentPrintableRect:](self, "setCurrentPrintableRect:");
    -[CKTranscriptPrintPageRenderer scrollView](self, "scrollView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentSize");
    v16 = v15;
    v18 = v17;
    -[CKTranscriptPrintPageRenderer scrollView](self, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v16, v18);

  }
}

- (int64_t)__computedNumberOfPagesForPrintableRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  int64_t v24;
  void *v25;
  CGFloat rect;
  CGRect v28;

  height = a3.size.height;
  rect = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrinting:", 1);

  -[CKTranscriptPrintPageRenderer scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  -[CKTranscriptPrintPageRenderer scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection");
  v12 = *MEMORY[0x1E0CEA080];
  v13 = *(double *)(MEMORY[0x1E0CEA080] + 16);
  if (v11)
    v14 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  else
    v14 = *(double *)(MEMORY[0x1E0CEA080] + 8);
  if (v11)
    v15 = *(double *)(MEMORY[0x1E0CEA080] + 8);
  else
    v15 = *(double *)(MEMORY[0x1E0CEA080] + 24);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 0, 0, 0, 0, width, v12, v14, v13, v15);
  v18 = v17;

  -[CKTranscriptPrintPageRenderer transcriptCollectionViewController](self, "transcriptCollectionViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPrintPageRenderer transcriptCollectionViewController](self, "transcriptCollectionViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v21, v18, v12, v14, v13, v15);

  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v9, "contentSize");
  v23 = v22;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = rect;
  v24 = vcvtpd_s64_f64(v23 / CGRectGetHeight(v28));
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPrinting:", 0);

  return v24;
}

- (int64_t)numberOfPages
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[CKTranscriptPrintPageRenderer _determineNumberOfPages](self, "_determineNumberOfPages");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CKTranscriptPrintPageRenderer_numberOfPages__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  return -[CKTranscriptPrintPageRenderer numberOfPagesForCurrentConfiguration](self, "numberOfPagesForCurrentConfiguration");
}

uint64_t __46__CKTranscriptPrintPageRenderer_numberOfPages__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_determineNumberOfPages");
}

+ (void)renderViewWithText:(id)a3 withOffsetVertical:(double)a4
{
  id v5;
  CGContext *CurrentContext;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void (*v30)(void *);
  NSObject *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void (*v52)(void *);
  NSObject *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void (*v79)(void *);
  NSObject *v80;
  id v81;
  id v82;
  id obj;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  id v110;
  uint8_t v111[128];
  uint8_t buf[4];
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_opt_class();
  v84 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    CGContextTranslateCTM(CurrentContext, 0.0, -a4);
  objc_msgSend(v5, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke;
  v108[3] = &unk_1E274BC38;
  v81 = v7;
  v109 = v81;
  v17 = v8;
  v110 = v17;
  _DFSVisibleSubviewsInRect(v5, v108, v10, v12, v14, v16);
  objc_msgSend(v5, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "renderInContext:", CurrentContext);

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v17;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v105;
    v21 = *MEMORY[0x1E0C9D538];
    v22 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v105 != v20)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        if ((objc_msgSend(v24, "isHidden") & 1) == 0)
        {
          v99 = xmmword_1E274BC58;
          v100 = *(_OWORD *)off_1E274BC68;
          *(_QWORD *)&v101 = 262;
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = IMFileLocationTrimFileName();
          v27 = v101;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpectedly visible view during printing"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("contentView.hidden"), "+[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:]", v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v30)
          {
            v30(v29);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v29;
              _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
            }

          }
        }
        CGContextSaveGState(CurrentContext);
        objc_msgSend(v24, "frame");
        objc_msgSend(v84, "convertPoint:fromView:", v24);
        v33 = v32;
        objc_msgSend(v24, "frame");
        v35 = v34;
        v36 = objc_msgSend(v24, "suppressMask");
        objc_msgSend(v24, "setSuppressMask:", 1);
        objc_msgSend(v24, "setAlpha:", 1.0);
        objc_msgSend(v24, "frame");
        v38 = v37;
        v40 = v39;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v99 = 0u;
        if (v24)
          objc_msgSend(v24, "balloonDescriptor");
        +[CKPrintController printBalloonDescriptor:](CKPrintController, "printBalloonDescriptor:", &v99);
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", v38, v40);
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke_85;
        v89[3] = &unk_1E274BC88;
        v89[4] = v24;
        v92 = v101;
        v93 = v102;
        v94 = v103;
        v90 = v99;
        v91 = v100;
        v95 = v21;
        v96 = v22;
        v97 = v38;
        v98 = v40;
        objc_msgSend(v41, "imageWithActions:", v89);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "drawInRect:", v35, v33, v38, v40);
        objc_msgSend(v24, "setSuppressMask:", v36);
        CGContextRestoreGState(CurrentContext);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
    }
    while (v19);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v82 = v81;
  v43 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v86 != v44)
          objc_enumerationMutation(v82);
        v46 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
        if ((objc_msgSend(v46, "isHidden") & 1) == 0)
        {
          v99 = xmmword_1E274BCA8;
          v100 = *(_OWORD *)off_1E274BCB8;
          *(_QWORD *)&v101 = 300;
          v47 = (void *)MEMORY[0x1E0CB3940];
          v48 = IMFileLocationTrimFileName();
          v49 = v101;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpectedly visible text view during printing"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("textContainingView.hidden"), "+[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:]", v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v52)
          {
            v52(v51);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v51;
              _os_log_impl(&dword_18DFCD000, v53, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v46, "bounds");
        v55 = v54;
        v57 = v56;
        v59 = v58;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v60 = v46;
          objc_msgSend(v60, "setAlpha:", 1.0);
          objc_msgSend(v84, "convertPoint:fromView:", v60, v55, v57);
          v62 = v61;
          v64 = v63;
          objc_msgSend(v60, "bounds");
          objc_msgSend(v60, "textRectForBounds:");
          v66 = v65;
          v68 = v67;
          v70 = v69;
          v72 = v71;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v73 = v59 * 0.5 - v72 * 0.5;
          else
            v73 = -0.0;
          CGContextSaveGState(CurrentContext);
          CGContextTranslateCTM(CurrentContext, v62, v64 + v73);
          objc_msgSend(v60, "drawTextInRect:", v66, v68, v70, v72);
          CGContextRestoreGState(CurrentContext);
          objc_msgSend(v60, "setAlpha:", 0.0);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v46, "ck_drawVisibleTextInCurrentContextWithContainerView:", v84);
          }
          else
          {
            v99 = xmmword_1E274BCD0;
            v100 = *(_OWORD *)off_1E274BCE0;
            *(_QWORD *)&v101 = 321;
            v74 = (void *)MEMORY[0x1E0CB3940];
            v75 = IMFileLocationTrimFileName();
            v76 = v101;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected object of class %@ in textContainingViews"), objc_opt_class());
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "stringWithFormat:", CFSTR("Failure in %s at %s:%d. %@"), "+[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:]", v75, v76, v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            v79 = (void (*)(void *))IMGetAssertionFailureHandler();
            if (v79)
            {
              v79(v78);
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v80 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v113 = v78;
                _os_log_impl(&dword_18DFCD000, v80, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
              }

            }
          }
        }
        objc_msgSend(v46, "setAlpha:", 1.0);
      }
      v43 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
    }
    while (v43);
  }

  CGContextRestoreGState(CurrentContext);
}

uint64_t __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v3, "setAlpha:", 0.0);
      v4 = 0;
      v5 = (id *)(a1 + 32);
    }
    else
    {
      if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EE182320))
      {
        v4 = 1;
        goto LABEL_7;
      }
      objc_msgSend(v3, "setAlpha:", 0.0);
      v5 = (id *)(a1 + 40);
      v4 = 1;
    }
    objc_msgSend(*v5, "addObject:", v3);
  }
LABEL_7:

  return v4;
}

void __71__CKTranscriptPrintPageRenderer_renderViewWithText_withOffsetVertical___block_invoke_85(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  _OWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderInContext:", UIGraphicsGetCurrentContext());

  v3 = *(_OWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 88);
  v6[2] = *(_OWORD *)(a1 + 72);
  v6[3] = v4;
  v6[4] = *(_OWORD *)(a1 + 104);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v3;
  CKResizableBalloonImage((uint64_t)v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 22, *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), 1.0);

}

- (void)drawScrollViewAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrinting:", 1);

  -[UIPrintPageRenderer printableRect](self, "printableRect");
  v8 = v7;
  -[CKTranscriptPrintPageRenderer scrollView](self, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:](CKTranscriptPrintPageRenderer, "renderViewWithText:withOffsetVertical:", v10, v8 * (double)a3);
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrinting:", 0);

}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContextRef CurrentContext;
  uint64_t v11;
  void (**v12)(_QWORD);
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD aBlock[11];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke;
  aBlock[3] = &unk_1E274BD00;
  *(CGFloat *)&aBlock[6] = x;
  *(CGFloat *)&aBlock[7] = y;
  *(CGFloat *)&aBlock[8] = width;
  *(CGFloat *)&aBlock[9] = height;
  aBlock[4] = self;
  aBlock[5] = CurrentContext;
  aBlock[10] = a3;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v12[2](v12);
  }
  else
  {
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke_2;
    v13[3] = &unk_1E274AED0;
    v14 = v12;
    dispatch_sync(MEMORY[0x1E0C80D38], v13);

  }
}

void __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke(uint64_t a1)
{
  UIGraphicsPushContext(*(CGContextRef *)(a1 + 40));
  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "drawScrollViewAtIndex:inRect:", *(_QWORD *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
  UIGraphicsPopContext();
}

uint64_t __56__CKTranscriptPrintPageRenderer_drawPageAtIndex_inRect___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (CKPrintTranscriptCollectionViewController)transcriptCollectionViewController
{
  return self->_transcriptCollectionViewController;
}

- (void)setTranscriptCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptCollectionViewController, a3);
}

- (int64_t)numberOfPagesForCurrentConfiguration
{
  return self->_numberOfPagesForCurrentConfiguration;
}

- (void)setNumberOfPagesForCurrentConfiguration:(int64_t)a3
{
  self->_numberOfPagesForCurrentConfiguration = a3;
}

- (CGRect)currentPrintableRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_currentPrintableRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCurrentPrintableRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_currentPrintableRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptCollectionViewController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
