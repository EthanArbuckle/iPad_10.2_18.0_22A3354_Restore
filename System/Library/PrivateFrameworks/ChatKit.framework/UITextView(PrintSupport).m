@implementation UITextView(PrintSupport)

- (void)ck_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTextKit2Enabled");

  if (v5
    && (objc_msgSend(a1, "textLayoutManager"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(a1, "ck_textKit2_drawVisibleTextInCurrentContextWithContainerView:", v7);
  }
  else
  {
    objc_msgSend(a1, "ck_textKit1_drawVisibleTextInCurrentContextWithContainerView:", v7);
  }

}

- (void)ck_textKit1_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double x;
  double y;
  double width;
  double height;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[3];
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v54[2] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a3;
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "textContainerInset");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "layoutManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromView:", v4, v7, v9, v11, v13);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v5, "bounds");
  v57.origin.x = v27;
  v57.origin.y = v28;
  v57.size.width = v29;
  v57.size.height = v30;
  v55.origin.x = v20;
  v55.origin.y = v22;
  v55.size.width = v24;
  v55.size.height = v26;
  v56 = CGRectIntersection(v55, v57);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  objc_msgSend(v4, "convertPoint:toView:", v5, v7, v9);
  v36 = v17 + v35;
  v38 = v15 + v37;
  objc_msgSend(v4, "convertRect:fromView:", v5, x, y, width, height);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v53[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = *MEMORY[0x1E0DC1248];
  v54[0] = v47;
  v54[1] = &unk_1E28701E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLinkTextAttributes:", v48);

  objc_msgSend(v18, "textContainers");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v18, "glyphRangeForBoundingRect:inTextContainer:", v50, v40 - v17, v42 - v15, v44, v46);
  objc_msgSend(v18, "drawGlyphsForGlyphRange:atPoint:", v51, v52, v36, v38);

}

- (void)ck_textKit2_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  double v35;
  double v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKTranscriptPrintPageRenderer.m"), 71, CFSTR("Unable to draw a text view without a text layout manager."));

  }
  objc_msgSend(a1, "alpha");
  if (!CKFloatApproximatelyEqualToFloatWithTolerance(v7, 0.0, 0.00000999999975))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKTranscriptPrintPageRenderer.m"), 72, CFSTR("Expected to have an alpha value of 0."));

  }
  objc_msgSend(a1, "setAlpha:", 1.0);
  v37[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = *MEMORY[0x1E0DC1248];
  v38[0] = v8;
  v38[1] = &unk_1E28701E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLinkTextAttributes:", v9);

  objc_msgSend(a1, "textLayoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  objc_msgSend(v10, "ensureLayoutForBounds:");

  objc_msgSend(a1, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend(a1, "textContainerInset");
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "convertPoint:toView:", v5, v12, v14);
  v20 = v19;
  v22 = v21;

  objc_msgSend(a1, "textLayoutManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textViewportLayoutController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewportRange");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "textLayoutManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "location");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __89__UITextView_PrintSupport__ck_textKit2_drawVisibleTextInCurrentContextWithContainerView___block_invoke;
  v32[3] = &unk_1E274BC10;
  v33 = v25;
  v34 = a1;
  v35 = v18 + v20;
  v36 = v16 + v22;
  v28 = v25;
  v29 = (id)objc_msgSend(v26, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v27, 4, v32);

  objc_msgSend(a1, "setAlpha:", 0.0);
}

@end
