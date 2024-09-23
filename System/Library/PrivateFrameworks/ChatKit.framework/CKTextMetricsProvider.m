@implementation CKTextMetricsProvider

- (id)_metricsForAttributedString:(id)a3 lineFragmentPadding:(double)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 targetSize:(CGSize)a7
{
  double width;
  id v11;
  id v12;
  id v13;
  id v14;
  CKTextStorage *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  CKTextMetrics *v30;
  id v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[8];
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;

  width = a7.width;
  v11 = a3;
  v12 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
  v13 = objc_alloc_init(MEMORY[0x1E0DC12F0]);
  v14 = objc_alloc_init(MEMORY[0x1E0DC12C8]);
  v15 = objc_alloc_init(CKTextStorage);
  objc_msgSend(v14, "setTextStorage:", v15);

  objc_msgSend(v14, "addTextLayoutManager:", v13);
  objc_msgSend(v13, "setTextContainer:", v12);
  objc_msgSend(v12, "setLineFragmentPadding:", a4);
  objc_msgSend(v12, "setMaximumNumberOfLines:", a5);
  objc_msgSend(v12, "setLineBreakMode:", a6);
  objc_msgSend(v12, "setSize:", width, 1.79769313e308);
  v16 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke;
  v48[3] = &unk_1E274A108;
  v17 = v14;
  v49 = v17;
  v32 = v11;
  v50 = v32;
  objc_msgSend(v17, "performEditingTransactionUsingBlock:", v48);
  objc_msgSend(v13, "documentRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ensureLayoutForRange:", v18);
  objc_msgSend(v13, "usageBoundsForTextContainer");
  v20 = v19;
  v22 = v21;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = -1;
  v39 = 0;
  v40 = (double *)&v39;
  v41 = 0x2020000000;
  v42 = 0;
  objc_msgSend(v18, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_2;
  v38[3] = &unk_1E275A5E8;
  v38[4] = v43;
  v38[5] = &v39;
  v38[6] = &v44;
  v38[7] = a5;
  v24 = (id)objc_msgSend(v13, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v23, 4, v38);

  v25 = v45[3];
  v26 = v40[3];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  objc_msgSend(v13, "documentRange");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "location");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_3;
  v33[3] = &unk_1E274BA18;
  v33[4] = &v34;
  v29 = (id)objc_msgSend(v13, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v28, 4, v33);

  v30 = -[CKTextMetrics initWithSize:singleLine:alignmentInset:]([CKTextMetrics alloc], "initWithSize:singleLine:alignmentInset:", v35[3] == 1, v20 + a4 * 2.0, v22, v25, a4, v26, a4);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

void __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttributedString:", v1);

}

uint64_t __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a2, "textLineFragments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    v7 = *MEMORY[0x1E0DC1138];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        objc_msgSend(v9, "glyphOrigin");
        v11 = v10;
        objc_msgSend(v9, "typographicBounds");
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        v16 = CGRectGetHeight(v33);
        objc_msgSend(v9, "glyphOrigin");
        *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v16 - v17;
        objc_msgSend(v9, "attributedString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "attribute:atIndex:effectiveRange:", v7, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
        {
          v34.origin.x = x;
          v34.origin.y = y;
          v34.size.width = width;
          v34.size.height = height;
          v20 = CGRectGetHeight(v34) - v11;
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          v21 = CGRectGetMaxY(v35) - v20;
          objc_msgSend(v19, "capHeight");
          *(CGFloat *)(*(_QWORD *)(a1[6] + 8) + 24) = v21 - v22;
        }
        v23 = a1[7];
        if (v23)
        {
          v24 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 1;

          if (v23 <= v24)
          {
            v25 = 0;
            goto LABEL_15;
          }
        }
        else
        {

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }
  v25 = 1;
LABEL_15:

  return v25;
}

uint64_t __119__CKTextMetricsProvider__metricsForAttributedString_lineFragmentPadding_maximumNumberOfLines_lineBreakMode_targetSize___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "textLineFragments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

  return 1;
}

- (id)metricsForRequest:(id)a3
{
  id v4;
  double v5;
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
  void *v16;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "minimumViewHeight");
  v6 = v5;
  objc_msgSend(v4, "containerInset");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  if (v6 <= 0.0)
  {
    -[CKTextMetricsProvider _metricsForRequest:containerInset:](self, "_metricsForRequest:containerInset:", v4, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(v4, "minimumViewHeight");
    -[CKTextMetricsProvider _metricsForRequest:containerInset:minimumViewHeight:](self, "_metricsForRequest:containerInset:minimumViewHeight:", v4, v11, v12, v13, v14, v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_metricsForRequest:(id)a3 containerInset:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CKTextMetrics *v30;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  objc_msgSend(v9, "adjustedMaximumSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "attributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lineFragmentPadding");
  v16 = v15;
  v17 = objc_msgSend(v9, "maximumNumberOfLines");
  v18 = objc_msgSend(v9, "lineBreakMode");

  -[CKTextMetricsProvider _metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:](self, "_metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:", v14, v17, v18, v16, v11, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "alignmentInset");
  v21 = top + v20;
  objc_msgSend(v19, "alignmentInset");
  v23 = left + v22;
  objc_msgSend(v19, "alignmentInset");
  v25 = bottom + v24;
  objc_msgSend(v19, "alignmentInset");
  v27 = right + v26;
  objc_msgSend(v19, "size");
  v30 = -[CKTextMetrics initWithSize:singleLine:alignmentInset:]([CKTextMetrics alloc], "initWithSize:singleLine:alignmentInset:", objc_msgSend(v19, "isSingleLine"), left + right + v28, top + bottom + v29, v21, v23, v25, v27);

  return v30;
}

- (id)_metricsForRequest:(id)a3 containerInset:(UIEdgeInsets)a4 minimumViewHeight:(double)a5
{
  double top;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
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
  CKTextMetrics *v34;
  double bottom;

  bottom = a4.bottom;
  top = a4.top;
  v8 = a3;
  objc_msgSend(v8, "adjustedMaximumSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "attributedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineFragmentPadding");
  v15 = v14;
  v16 = objc_msgSend(v8, "maximumNumberOfLines");
  v17 = objc_msgSend(v8, "lineBreakMode");

  -[CKTextMetricsProvider _metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:](self, "_metricsForAttributedString:lineFragmentPadding:maximumNumberOfLines:lineBreakMode:targetSize:", v13, v16, v17, v15, v10, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "size");
  v20 = v19;
  objc_msgSend(v18, "size");
  v22 = v21;
  objc_msgSend(v18, "alignmentInset");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v18, "size");
  if (v31 >= a5)
  {
    a5 = v20;
  }
  else
  {
    v32 = (a5 - (bottom + top + v22)) * 0.5;
    v24 = top + v32;
    v28 = bottom + v32;
    v30 = 0.0;
    v26 = 0.0;
  }
  objc_msgSend(v18, "size");
  v34 = -[CKTextMetrics initWithSize:singleLine:alignmentInset:]([CKTextMetrics alloc], "initWithSize:singleLine:alignmentInset:", objc_msgSend(v18, "isSingleLine"), v33, a5, v24, v26, v28, v30);

  return v34;
}

@end
