@implementation CKOrganicImageLayoutGroupProvider

- (id)layoutGroupForDatasourceItems:(id)a3 environment:(id)a4 layoutItems:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  unint64_t v21;
  char v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[5];
  CGRect v80;

  v8 = a3;
  v9 = a4;
  v64 = a5;
  v65 = v9;
  objc_msgSend(v9, "collectionLayoutEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "smallTranscriptSpace");
  v16 = v15;

  -[CKOrganicImageLayoutGroupProvider _setLayoutRecipesForChatItems:](self, "_setLayoutRecipesForChatItems:", v8);
  v18 = v17;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  *(double *)&v79[3] = v16;
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke;
  v70[3] = &unk_1E275A3F0;
  v72 = v79;
  v74 = v13;
  v20 = v19;
  v71 = v20;
  v73 = &v75;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v70);
  v21 = 0;
  v22 = 0;
  v23 = v16 + v18;
  v24 = (v16 + v18) * 0.5;
  while (objc_msgSend(v20, "count") > v21)
  {
    objc_msgSend(v8, "objectAtIndex:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v21)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(v25, "tapbacksChatItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v28 != 0;

    }
    objc_msgSend(v20, "objectAtIndex:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "CGRectValue");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v80.origin.x = v31;
    v80.origin.y = v33;
    v80.size.width = v35;
    v80.size.height = v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 - CGRectGetMinY(v80));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutRecipe");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setRelativeGroupCenter:", v38);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76[3]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutRecipe");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setGroupMaxX:", v40);

    objc_msgSend(v8, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutRecipe");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setIsLastItem:", v26 == v42);
    v22 |= v27;

    ++v21;
  }
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v23);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v66, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0CEA1D0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_2;
  v67[3] = &unk_1E275A440;
  v47 = v8;
  v68 = v47;
  v48 = v20;
  v69 = v48;
  objc_msgSend(v46, "customGroupWithLayoutSize:itemProvider:", v45, v67);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v47;
  v50 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "mediumTranscriptSpace");
  objc_msgSend(v50, "fixedSpacing:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "largeTranscriptSpace");
  objc_msgSend(v53, "fixedSpacing:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = objc_msgSend(v56, "isEmojiTapbacksEnabled");

  if ((_DWORD)v54)
  {
    v57 = (void *)MEMORY[0x1E0CEA1F8];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "extraLargeTranscriptSpace");
    objc_msgSend(v57, "fixedSpacing:");
    v59 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v59;
  }
  if ((v22 & 1) != 0)
    v60 = v55;
  else
    v60 = v52;
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", 0, v60, 0, v52);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setEdgeSpacing:", v61);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(v79, 8);

  return v49;
}

void __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  id v19;
  CGRect v20;

  v3 = a2;
  objc_msgSend(v3, "layoutRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetSize");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "layoutRecipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlap");
  v11 = v10;

  v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - v11;
  v13 = *(double *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, v12, v13, v8);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);
  objc_msgSend(v3, "layoutRecipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "offset");
  v16 = v15;

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(double *)(v17 + 24);
  if (v18 < v6 + v16)
    v18 = v6 + v16;
  *(double *)(v17 + 24) = v18;
  v20.origin.x = 0.0;
  v20.origin.y = v12;
  v20.size.width = v13;
  v20.size.height = v8;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v20);

}

id __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_3;
  v6[3] = &unk_1E275A418;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  objc_msgSend(a2, "CGRectValue");
  objc_msgSend(MEMORY[0x1E0CEA1D8], "customItemWithFrame:zIndex:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (double)_setLayoutRecipesForChatItems:(id)a3
{
  id v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  double v36;
  double v37;
  CKOrganicImageLayoutRecipe *v38;
  CKOrganicImageLayoutRecipe *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  CKOrganicImageLayoutRecipe *v58;
  double v60;
  double v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2 && (unint64_t)objc_msgSend(v4, "count") < 4)
  {
    v7 = objc_msgSend(v4, "count");
    -[CKOrganicImageLayoutGroupProvider _startOffsetSpecForCount:](self, "_startOffsetSpecForCount:", v7);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 3)
    {
      objc_msgSend(v4, "objectAtIndex:", 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v65 = 0;
    }
    -[CKOrganicImageLayoutGroupProvider _targetSizeForChatItem:totalItemCount:](self, "_targetSizeForChatItem:totalItemCount:", v67, v7);
    v9 = v8;
    v61 = v10;
    v11 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:");
    -[CKOrganicImageLayoutGroupProvider _targetSizeForChatItem:totalItemCount:](self, "_targetSizeForChatItem:totalItemCount:", v66, v7);
    v13 = v12;
    v15 = v14;
    v16 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:");
    -[CKOrganicImageLayoutGroupProvider _startRotationSpec](self, "_startRotationSpec");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectAtIndexedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v20, "isFromMe");

    v21 = v19 ^ v18;
    -[CKOrganicImageLayoutGroupProvider _rotationForChatItem:leftRotated:](self, "_rotationForChatItem:leftRotated:", v67, v21);
    v23 = v22;
    -[CKOrganicImageLayoutGroupProvider _rotationForChatItem:leftRotated:](self, "_rotationForChatItem:leftRotated:", v66, v21 ^ 1);
    v25 = v24;
    -[CKOrganicImageLayoutGroupProvider _intersectSpecForIndex:count:](self, "_intersectSpecForIndex:count:", 0, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "CGSizeValue");
    v60 = v29;
    v31 = v30;

    objc_msgSend(v63, "objectAtIndexedSubscript:", v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");

    if (v34)
    {
      v35 = v13 - v13 * v60;
      v36 = 0.0;
    }
    else
    {
      v36 = v61 - v61 * v60;
      v35 = 0.0;
      if (v65)
      {
        if (!v11)
        {
          objc_msgSend(v65, "size");
          if (-[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:") == 1)
            v35 = v36 + v36 * -0.949999988;
        }
      }
    }
    v37 = v9 * v31;
    v38 = -[CKOrganicImageLayoutRecipe initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:]([CKOrganicImageLayoutRecipe alloc], "initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:", 1, v62, v23, v35, v61, v9, 0.0);
    objc_msgSend(v67, "setLayoutRecipe:", v38);
    v39 = -[CKOrganicImageLayoutRecipe initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:]([CKOrganicImageLayoutRecipe alloc], "initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:", 1, v62, v25, v36, v13, v15, v37);
    objc_msgSend(v66, "setLayoutRecipe:", v39);
    v5 = v9 + v15 - v37;
    v40 = v65;
    if (v65)
    {
      -[CKOrganicImageLayoutGroupProvider _targetSizeForChatItem:totalItemCount:](self, "_targetSizeForChatItem:totalItemCount:", v65, v7);
      v42 = v41;
      v44 = v43;
      -[CKOrganicImageLayoutGroupProvider _rotationForChatItem:leftRotated:](self, "_rotationForChatItem:leftRotated:", v65, v21);
      v46 = v45;
      v47 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:", v42, v44);
      -[CKOrganicImageLayoutGroupProvider _intersectSpecForIndex:count:](self, "_intersectSpecForIndex:count:", 1, v7);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "objectAtIndexedSubscript:", v16);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "CGSizeValue");
      v52 = v51;
      v54 = v53;

      if (v34)
      {
        v55 = v13 - v13 * v52;
        v56 = (void *)v62;
      }
      else
      {
        v55 = 0.0;
        v56 = (void *)v62;
        if (!v47)
          v55 = v42 - v42 * v52 - (v61 - v61 * v60);
      }
      v57 = v15 * v54;
      v58 = -[CKOrganicImageLayoutRecipe initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:]([CKOrganicImageLayoutRecipe alloc], "initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:", 1, v56, v46, v55, v42, v44, v57);
      v40 = v65;
      objc_msgSend(v65, "setLayoutRecipe:", v58);
      v5 = v5 + v44 - v57;

    }
    else
    {
      v48 = v26;
      v56 = (void *)v62;
    }

  }
  else
  {
    v5 = 0.0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "-[CKOrganicImageLayoutGroupProvider _setLayoutRecipesForChatItems:]";
        v70 = 2048;
        v71 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%s asked to generate layout with %lu items, unsupported!", buf, 0x16u);
      }

    }
  }

  return v5;
}

- (id)_startRotationSpec
{
  return &unk_1E286FFE8;
}

- (id)_startOffsetSpecForCount:(unint64_t)a3
{
  void *v3;

  v3 = &unk_1E2870078;
  if (a3 != 3)
    v3 = 0;
  if (a3 == 2)
    return &unk_1E2870030;
  else
    return v3;
}

- (id)_intersectSpecForIndex:(unint64_t)a3 count:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (a4 == 3)
  {
    if (a3 == 1)
    {
      v16 = xmmword_18E7CC240;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v16, "{CGSize=dd}");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v4;
      v15 = xmmword_18E7CC250;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v15, "{CGSize=dd}");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v6;
      v14 = xmmword_18E7CC260;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v14, "{CGSize=dd}");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v13 = xmmword_18E7CC270;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v13, "{CGSize=dd}");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v9;
      v10 = v27;
      goto LABEL_9;
    }
    if (!a3)
    {
      v20 = xmmword_18E7CC240;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v20, "{CGSize=dd}");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v4;
      v19 = xmmword_18E7CC280;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v19, "{CGSize=dd}");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v6;
      v18 = xmmword_18E7CC260;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v18, "{CGSize=dd}");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v7;
      v17 = xmmword_18E7CC290;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v17, "{CGSize=dd}");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v9;
      v10 = v30;
      goto LABEL_9;
    }
    return 0;
  }
  if (a4 != 2)
    return 0;
  v24 = xmmword_18E7CC2A0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v24, "{CGSize=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v4;
  v23 = xmmword_18E7CC280;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v23, "{CGSize=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  v22 = xmmword_18E7CC260;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v22, "{CGSize=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v21 = xmmword_18E7CC290;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v21, "{CGSize=dd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v9;
  v10 = v33;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGSize)_targetSizeForChatItem:(id)a3 totalItemCount:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;
  CGSize v31;
  CGSize result;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "size");
  v9 = v8;
  v10 = v7;
  if (v8 <= 0.0
    || v7 <= 0.0
    || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "previewMaxWidth"),
        v13 = v12,
        v11,
        v9 > v13))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "size");
        NSStringFromCGSize(v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 136315650;
        v25 = "-[CKOrganicImageLayoutGroupProvider _targetSizeForChatItem:totalItemCount:]";
        v26 = 2112;
        v27 = v15;
        v28 = 2112;
        v29 = v6;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "CKOrganicImageLayoutGroupProvider - %s - Got invalid chatItem size %@ for chatItem %@", (uint8_t *)&v24, 0x20u);

      }
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previewMaxWidth");
    objc_msgSend(v16, "thumbnailFillSizeForWidth:imageSize:");
    v9 = v18;
    v10 = v19;

  }
  v20 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:", v9, v10);
  if (a4 == 3 || (v21 = 1.0, a4 == 2))
  {
    if (v20)
      v21 = 0.75;
    else
      v21 = 0.6;
  }

  v22 = v9 * v21;
  v23 = v10 * v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (double)_rotationForChatItem:(id)a3 leftRotated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;

  v4 = a4;
  objc_msgSend(a3, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hash");
  v8 = 1.0;
  if (v4)
    v8 = -1.0;
  if ((v7 & 1) != 0)
    v9 = v8 * 0.5;
  else
    v9 = v8;

  return v9;
}

- (unint64_t)_orientationForChatItemSize:(CGSize)a3
{
  return a3.width > a3.height;
}

- (double)scalarForSize:(CGSize)a3 count:(unint64_t)a4
{
  double v4;

  if (a4 == 2 || (v4 = 0.0, a4 == 3))
  {
    if (a3.width <= a3.height)
      return 0.6;
    else
      return 0.75;
  }
  return v4;
}

@end
