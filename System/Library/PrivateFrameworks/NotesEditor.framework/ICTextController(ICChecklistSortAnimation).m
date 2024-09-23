@implementation ICTextController(ICChecklistSortAnimation)

- (void)performAnimatedSortForTrackedParagraphs:()ICChecklistSortAnimation expandedRange:textView:sortChecklistsBlock:
{
  id v12;
  objc_class *v13;
  void (**v14)(_QWORD);
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  uint64_t v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  id v85;
  double v86;
  double v87;
  _QWORD v88[5];
  id v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  _QWORD v97[5];
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  double v105;

  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v14 = a7;
  v15 = a3;
  v76 = objc_alloc_init(v13);
  objc_msgSend(v12, "ic_textContainerOrigin");
  v17 = v16;
  v19 = v18;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_msgSend(v12, "icLayoutManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ensureLayoutForTextContainer:", v21);

  }
  objc_msgSend(v12, "clampTextView");
  objc_msgSend(v12, "visibleBounds");
  v23 = v22;
  v25 = v24;
  v28 = v27 + v26 * 0.3 * -0.5;
  v29 = v26 + v26 * 0.3;
  TSDMultiplyPointScalar();
  v74 = v28;
  v75 = v23;
  TSDAddPoints();
  v31 = v30;
  v33 = v32;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v12, "icTextLayoutManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v25;
    v36 = v29;
    v37 = objc_msgSend(v34, "characterRangeForBoundingRect:", v31, v33, v25, v29);
    v39 = v38;
  }
  else
  {
    objc_msgSend(v12, "icLayoutManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textContainer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v25;
    v36 = v29;
    v37 = objc_msgSend(v34, "glyphRangeForBoundingRect:inTextContainer:", v40, v31, v33, v25, v29);
    v39 = v41;

    objc_msgSend(v34, "ensureGlyphsForCharacterRange:", a4, a5);
    objc_msgSend(v34, "setShouldManuallyRenderSeparateSubviews:", 1);
    objc_msgSend(v34, "setIsDraggingChecklistItem:", 1);
  }
  v70 = v37;

  objc_msgSend(v12, "ic_rectForRange:", a4, a5);
  v71 = v43;
  v72 = v42;
  TSDAddPoints();
  v45 = v44;
  v69 = v46;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke;
  v97[3] = &unk_1EA7E05C0;
  v97[4] = a1;
  v48 = v12;
  v100 = v37;
  v101 = v39;
  v102 = v75;
  v103 = v74;
  v104 = v35;
  v105 = v36;
  v98 = v48;
  v99 = v47;
  v49 = v47;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v97);
  v50 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
  v51 = a5;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setIc_backgroundColor:", v52);

  objc_msgSend(v50, "setFrame:", v45, v69, v72, v71);
  objc_msgSend(v48, "addSubview:", v50);
  v73 = v49;
  objc_msgSend(a1, "addImageViewsBeforeSortIfNecessaryForTrackedInfos:textView:textContainerOrigin:todoUUIDsToImageViews:", v49, v48, v76, v17, v19);
  v14[2](v14);

  objc_msgSend(v48, "icLayoutManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "ensureLayoutForCharacterRange:", a4, v51);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v55 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_2;
  v88[3] = &unk_1EA7E05C0;
  v88[4] = a1;
  v56 = v48;
  v89 = v56;
  v91 = v70;
  v92 = v39;
  v93 = v75;
  v94 = v74;
  v95 = v35;
  v96 = v36;
  v57 = v54;
  v90 = v57;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v88);

  objc_msgSend(a1, "addImageViewsAfterSortIfNecessaryForTrackedInfos:existingInfos:textView:textContainerOrigin:todoUUIDsToImageViews:", v57, v49, v56, v76, v17, v19);
  objc_msgSend(v53, "setShouldManuallyRenderSeparateSubviews:", 0);
  objc_msgSend(v53, "setIsDraggingChecklistItem:", 0);
  LODWORD(v58) = 1051260355;
  LODWORD(v59) = 1045220557;
  LODWORD(v60) = 0;
  LODWORD(v61) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v58, v60, v59, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)MEMORY[0x1E0DC3F10];
  v82[0] = v55;
  v82[1] = 3221225472;
  v82[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_3;
  v82[3] = &unk_1EA7E05E8;
  v82[4] = a1;
  v83 = v57;
  v84 = v56;
  v86 = v17;
  v87 = v19;
  v85 = v76;
  v77[0] = v55;
  v77[1] = 3221225472;
  v77[2] = __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_4;
  v77[3] = &unk_1EA7DDEA8;
  v78 = v53;
  v79 = v50;
  v80 = v85;
  v81 = v84;
  v64 = v84;
  v65 = v85;
  v66 = v50;
  v67 = v53;
  v68 = v57;
  objc_msgSend(v63, "ic_animateWithDuration:timingFunction:animations:completion:", v62, v82, v77, 0.35);

}

- (void)addImageViewsBeforeSortIfNecessaryForTrackedInfos:()ICChecklistSortAnimation textView:textContainerOrigin:todoUUIDsToImageViews:
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;
  double v19;

  v11 = a6;
  v12 = a7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __147__ICTextController_ICChecklistSortAnimation__addImageViewsBeforeSortIfNecessaryForTrackedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke;
  v15[3] = &unk_1EA7E0610;
  v18 = a1;
  v19 = a2;
  v16 = v11;
  v17 = v12;
  v13 = v12;
  v14 = v11;
  objc_msgSend(a5, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (void)addImageViewsAfterSortIfNecessaryForTrackedInfos:()ICChecklistSortAnimation existingInfos:textView:textContainerOrigin:todoUUIDsToImageViews:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;

  v13 = a6;
  v14 = a7;
  v15 = a8;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __160__ICTextController_ICChecklistSortAnimation__addImageViewsAfterSortIfNecessaryForTrackedInfos_existingInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke;
  v19[3] = &unk_1EA7E0638;
  v20 = v15;
  v21 = v13;
  v23 = a1;
  v24 = a2;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v15;
  objc_msgSend(a5, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (void)setFinalFramesForSortedInfos:()ICChecklistSortAnimation textView:textContainerOrigin:todoUUIDsToImageViews:
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  double v19;
  double v20;

  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __126__ICTextController_ICChecklistSortAnimation__setFinalFramesForSortedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke;
  v16[3] = &unk_1EA7E0638;
  v16[4] = a1;
  v17 = v12;
  v18 = v13;
  v19 = a2;
  v20 = a3;
  v14 = v13;
  v15 = v12;
  objc_msgSend(a5, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (ICTrackedParagraphImageInfo)imageInfoForTrackedParagraph:()ICChecklistSortAnimation textView:characterRangeToRender:visibleRectToRender:
{
  id v17;
  id v18;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat MaxY;
  CGFloat *v27;
  CGFloat *v28;
  ICTrackedParagraphImageInfo *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  NSUInteger v46;
  NSUInteger v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  NSRange v60;
  NSRange v61;
  CGRect v62;

  v17 = a7;
  v18 = a8;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__15;
  v58 = __Block_byref_object_dispose__15;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x4010000000;
  v51 = &unk_1DDA28851;
  v39 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v40 = *MEMORY[0x1E0C9D648];
  v52 = *MEMORY[0x1E0C9D648];
  v53 = v39;
  v60.location = objc_msgSend(v17, "characterRange");
  location = v60.location;
  length = v60.length;
  v61.location = a9;
  v61.length = a10;
  v21 = NSIntersectionRange(v60, v61).length;
  if (v21)
  {
    objc_msgSend(v18, "ic_platformAppearanceObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __127__ICTextController_ICChecklistSortAnimation__imageInfoForTrackedParagraph_textView_characterRangeToRender_visibleRectToRender___block_invoke;
    v41[3] = &unk_1EA7E0660;
    v42 = v18;
    v43 = v17;
    v44 = &v48;
    v46 = location;
    v47 = length - (length > 1);
    v45 = &v54;
    objc_msgSend(v22, "ic_performAsCurrent:", v41);

  }
  else
  {
    v23 = v49;
    *((_OWORD *)v49 + 2) = v40;
    *((_OWORD *)v23 + 3) = v39;
    v24 = objc_msgSend(v17, "characterRange");
    if (v24 + v25 <= a9)
    {
      v28 = (CGFloat *)v49;
      *((CGFloat *)v49 + 4) = a1;
      v28[5] = a2;
    }
    else
    {
      v62.origin.x = a1;
      v62.origin.y = a2;
      v62.size.width = a3;
      v62.size.height = a4;
      MaxY = CGRectGetMaxY(v62);
      v27 = (CGFloat *)v49;
      v49[4] = 0;
      v27[5] = MaxY;
    }
  }
  v29 = objc_alloc_init(ICTrackedParagraphImageInfo);
  v30 = v49;
  TSDMultiplyPointScalar();
  TSDAddPoints();
  v30[4] = v31;
  v30[5] = v32;
  -[ICTrackedParagraphImageInfo setImage:](v29, "setImage:", v55[5]);
  objc_msgSend(0, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "ic_rectValue");
  -[ICTrackedParagraphImageInfo setBoundingRect:](v29, "setBoundingRect:");

  -[ICTrackedParagraphImageInfo setTrackedParagraph:](v29, "setTrackedParagraph:", v17);
  -[ICTrackedParagraphImageInfo setRect:](v29, "setRect:", *((double *)v49 + 4), *((double *)v49 + 5), *((double *)v49 + 6), *((double *)v49 + 7));
  objc_msgSend(v17, "paragraph");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "todo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "uuid");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "UUIDString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTrackedParagraphImageInfo setUuid:](v29, "setUuid:", v37);

  -[ICTrackedParagraphImageInfo setEstimated:](v29, "setEstimated:", v21 == 0);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v29;
}

@end
