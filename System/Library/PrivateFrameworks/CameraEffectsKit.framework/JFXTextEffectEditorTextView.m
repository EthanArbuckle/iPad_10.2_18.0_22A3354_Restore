@implementation JFXTextEffectEditorTextView

- (JFXTextEffectEditorTextView)initWithTextEditingProperties:(id)a3 editorView:(id)a4 textContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  JFXTextEffectEditorTextView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "bounds");
  v18.receiver = self;
  v18.super_class = (Class)JFXTextEffectEditorTextView;
  v11 = -[JFXTextEffectEditorTextView initWithFrame:textContainer:](&v18, sel_initWithFrame_textContainer_, v10);

  if (v11)
  {
    -[JFXTextEffectEditorTextView setEditorView:](v11, "setEditorView:", v9);
    -[JFXTextEffectEditorTextView layer](v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", 0.0);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectEditorTextView setBackgroundColor:](v11, "setBackgroundColor:", v13);

    -[JFXTextEffectEditorTextView setReturnKeyType:](v11, "setReturnKeyType:", 0);
    -[JFXTextEffectEditorTextView setKeyboardAppearance:](v11, "setKeyboardAppearance:", 1);
    -[JFXTextEffectEditorTextView setScrollEnabled:](v11, "setScrollEnabled:", 0);
    -[JFXTextEffectEditorTextView textContainer](v11, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineFragmentPadding:", 0.0);

    -[JFXTextEffectEditorTextView setTextContainerInset:](v11, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[JFXTextEffectEditorTextView setContentInsetAdjustmentBehavior:](v11, "setContentInsetAdjustmentBehavior:", 2);
    -[JFXTextEffectEditorTextView textContainer](v11, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWidthTracksTextView:", 1);

    -[JFXTextEffectEditorTextView textContainer](v11, "textContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHeightTracksTextView:", 1);

    if (objc_msgSend(v8, "isAllCaps"))
      -[JFXTextEffectEditorTextView setAutocapitalizationType:](v11, "setAutocapitalizationType:", 3);
    if (objc_msgSend(v8, "isEmoji"))
      -[JFXTextEffectEditorTextView setKeyboardType:](v11, "setKeyboardType:", 124);
  }

  return v11;
}

- (JFXTextEffectEditorTextView)initWithTextEditingProperties:(id)a3 editorView:(id)a4
{
  return -[JFXTextEffectEditorTextView initWithTextEditingProperties:editorView:textContainer:](self, "initWithTextEditingProperties:editorView:textContainer:", a3, a4, 0);
}

- (void)applyTextEditingProperties:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  float64_t v94;
  float64x2_t v95;
  float64x2_t v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  double v106;
  __int128 v107;
  double v108;
  _OWORD v109[3];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _OWORD v113[8];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _OWORD v122[3];
  _OWORD v123[8];

  v4 = a3;
  v5 = objc_msgSend(v4, "useFullTransform");
  -[JFXTextEffectEditorTextView editorView](self, "editorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transformView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v123[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v123[5] = v9;
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v123[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v123[7] = v10;
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v123[0] = *MEMORY[0x24BDE5598];
    v123[1] = v11;
    v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v123[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v123[3] = v12;
    objc_msgSend(v7, "setTransform3D:", v123);

    objc_msgSend(v4, "effectFrame");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relativeToSize");
    v14 = CGRectMakeWithSize();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[JFXTextEffectEditorTextView editorView](self, "editorView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transformView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBounds:", v14, v16, v18, v20);

    v23 = *MEMORY[0x24BDBEFB0];
    v24 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[JFXTextEffectEditorTextView editorView](self, "editorView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transformView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCenter:", v23, v24);
  }
  else
  {
    v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v122[0] = *MEMORY[0x24BDBD8B8];
    v122[1] = v27;
    v122[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v7, "setTransform:", v122);

    objc_msgSend(v4, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[JFXTextEffectEditorTextView editorView](self, "editorView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transformView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v29, v31, v33, v35);
  }

  v36 = -[JFXTextEffectEditorTextView selectedRange](self, "selectedRange");
  v38 = v37;
  objc_msgSend(v4, "attributedText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView setAttributedText:](self, "setAttributedText:", v39);

  -[JFXTextEffectEditorTextView setSelectedRange:](self, "setSelectedRange:", v36, v38);
  objc_msgSend(v4, "customTextEditTintColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView setTintColor:](self, "setTintColor:", v40);

  objc_msgSend(v4, "bounds");
  if (v5)
  {
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    objc_msgSend(v4, "effectFrame");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "transform");
    }
    else
    {
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
    }

    v105 = v117;
    v107 = v115;
    v101 = v116;
    v102 = v114;
    v103 = v121;
    v104 = v119;
    v99 = v120;
    v100 = v118;
    -[JFXTextEffectEditorTextView editorView](self, "editorView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "transformView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v102;
    v113[1] = v107;
    v113[2] = v101;
    v113[3] = v105;
    v113[4] = v100;
    v113[5] = v104;
    v113[6] = v99;
    v113[7] = v103;
    objc_msgSend(v52, "setTransform3D:", v113);

    objc_msgSend(v4, "effectFrame");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectBounds");
    v47 = v54;
    v56 = v55;
    v49 = v57;
    v50 = v58;

    objc_msgSend(v4, "effectFrame");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "relativeToSize");
    v48 = v60 - (v56 + v50);

  }
  else
  {
    v47 = v41;
    v48 = v42;
    v49 = v43;
    v50 = v44;
  }
  if (objc_msgSend(v4, "isSpecialCaseForGameOverPoster"))
  {
    v47 = v47 + (v49 - v49 * 0.73) * 0.5;
    v48 = v48 + (v50 - v50 * 0.73) * 0.5;
    v50 = v50 * 0.73;
    v49 = v49 * 0.73;
  }
  -[JFXTextEffectEditorTextView setFrame:](self, "setFrame:", v47, v48, v49, v50);
  -[JFXTextEffectEditorTextView setTextContainerInset:](self, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v61 = (void *)MEMORY[0x24BE79010];
  objc_msgSend(v4, "attributedText");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultTypingAttributes");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "shadowFromAttributedString:defaultAttributes:", v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXTextEffectEditorTextView JFX_adjustTextEditingViewFrameAndInsetsForShadow:](self, "JFX_adjustTextEditingViewFrameAndInsetsForShadow:", v64);
  -[JFXTextEffectEditorTextView frame](self, "frame");
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v73 = 1.0;
  v74 = 1.0;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v4, "scale");
    v73 = v75;
    v74 = v76;
  }
  -[JFXTextEffectEditorTextView textContainerInset](self, "textContainerInset");
  v78 = v77;
  -[JFXTextEffectEditorTextView textContainerInset](self, "textContainerInset");
  v80 = v72 - (v78 + v79);
  v81 = (void *)MEMORY[0x24BE79010];
  objc_msgSend(v4, "attributedText");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView typingAttributes](self, "typingAttributes");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "textHeightFromAttributedString:defaultAttributes:scale:", v82, v83, v73);
  v85 = v84;

  v86 = (void *)MEMORY[0x24BE79010];
  objc_msgSend(v4, "attributedText");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultTypingAttributes");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v86, "verticalAlignmentFromAttributedString:defaultAttributes:", v87, v88);

  -[JFXTextEffectEditorTextView JFX_adjustTextEditingViewInsetsForVerticalAlignment:textAreaHeight:textHeight:](self, "JFX_adjustTextEditingViewInsetsForVerticalAlignment:textAreaHeight:textHeight:", v89, v80, v85);
  -[JFXTextEffectEditorTextView setTextFrameWithoutFudge:](self, "setTextFrameWithoutFudge:", v66, v68, v70, v72);
  -[JFXTextEffectEditorTextView setFrame:](self, "setFrame:", v66, v68, v70, v72 + 100.0);
  -[JFXTextEffectEditorTextView JFX_adjustSizeToMatchExpectedNumberOfLines:](self, "JFX_adjustSizeToMatchExpectedNumberOfLines:", v4);
  v90 = (void *)MEMORY[0x24BE79010];
  objc_msgSend(v4, "attributedText");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "xOffsetForTextTrackingFromAttributedString:", v91);
  v108 = v73 * v92;

  objc_msgSend(v4, "baselineYOffset");
  v106 = v74 * v93;
  -[JFXTextEffectEditorTextView center](self, "center");
  v95.f64[1] = v94;
  v96.f64[0] = v108;
  v96.f64[1] = v106;
  -[JFXTextEffectEditorTextView setCenter:](self, "setCenter:", vaddq_f64(v96, v95));
  if ((v5 & 1) == 0)
  {
    if (v4)
    {
      objc_msgSend(v4, "partialTransformNoScaleNoTranslation");
    }
    else
    {
      v111 = 0u;
      v112 = 0u;
      v110 = 0u;
    }
    -[JFXTextEffectEditorTextView editorView](self, "editorView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "transformView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v110;
    v109[1] = v111;
    v109[2] = v112;
    objc_msgSend(v98, "setTransform:", v109);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  if (sel_paste_ == a3
    && (objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasImages"),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)JFXTextEffectEditorTextView;
    v9 = -[JFXTextEffectEditorTextView canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[JFXTextEffectEditorTextView beginningOfDocument](self, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView endOfDocument](self, "endOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXTextEffectEditorTextView selectionRectsForRange:](self, "selectionRectsForRange:", v10);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "rect");
        v25.x = x;
        v25.y = y;
        if (CGRectContainsPoint(v26, v25))
        {
          v18.receiver = self;
          v18.super_class = (Class)JFXTextEffectEditorTextView;
          -[JFXTextEffectEditorTextView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (CGRect)textEditingFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  v24 = *MEMORY[0x24BDAC8D0];
  -[JFXTextEffectEditorTextView beginningOfDocument](self, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView endOfDocument](self, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXTextEffectEditorTextView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXTextEffectEditorTextView selectionRectsForRange:](self, "selectionRectsForRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "rect");
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)unmarkText
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[JFXTextEffectEditorTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_2558E7B48);

  if (v4)
  {
    -[JFXTextEffectEditorTextView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textEffectEditorTextViewDidUnmarkText:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)JFXTextEffectEditorTextView;
  -[JFXTextEffectEditorTextView unmarkText](&v6, sel_unmarkText);
}

- (id)textColorForCaretSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[JFXTextEffectEditorTextView editorView](self, "editorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textEditingProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    v8 = v4;
  else
    v8 = v5;
  v9 = v8;

  return v9;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  objc_super v17;

  v6 = a3;
  -[JFXTextEffectEditorTextView editorView](self, "editorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textEditingProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)JFXTextEffectEditorTextView;
  -[JFXTextEffectEditorTextView textStylingAtPosition:inDirection:](&v17, sel_textStylingAtPosition_inDirection_, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x24BDF6600];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDF6600]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v8, "customTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    objc_msgSend(v8, "defaultTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = (id)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v10);

  }
  else
  {
    v15 = v9;
  }

  return v15;
}

- (void)JFX_adjustTextEditingViewFrameAndInsetsForShadow:(id)a3
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
  double v16;
  double v17;
  JFXTextEffectEditorTextView *v18;
  CGRect v19;
  CGRect v20;

  if (a3)
  {
    v18 = self;
    v4 = a3;
    objc_msgSend(v4, "shadowOffset");
    v6 = fabs(v5);
    objc_msgSend(v4, "shadowBlurRadius");
    v8 = v6 + fabs(v7);
    objc_msgSend(v4, "shadowOffset");
    v10 = fabs(v9);
    objc_msgSend(v4, "shadowBlurRadius");
    v12 = v11;

    v13 = v10 + fabs(v12);
    -[JFXTextEffectEditorTextView frame](v18, "frame");
    v20 = CGRectInset(v19, -v8, -v13);
    -[JFXTextEffectEditorTextView setFrame:](v18, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    -[JFXTextEffectEditorTextView textContainerInset](v18, "textContainerInset");
    -[JFXTextEffectEditorTextView setTextContainerInset:](v18, "setTextContainerInset:", v13 + v14, v8 + v16, v13 + v15, v8 + v17);

  }
}

- (void)JFX_adjustTextEditingViewInsetsForVerticalAlignment:(int64_t)a3 textAreaHeight:(double)a4 textHeight:(double)a5
{
  JFXTextEffectEditorTextView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  JFXTextEffectEditorTextView *v13;

  if ((unint64_t)(a3 + 1) >= 2)
  {
    v8 = self;
    if (a4 > a5)
    {
      v9 = a4 - a5;
      if (a3 == 2)
      {
        v13 = v8;
        -[JFXTextEffectEditorTextView textContainerInset](v8, "textContainerInset");
        v11 = v9 + v12;
        goto LABEL_7;
      }
      if (a3 == 1)
      {
        v13 = v8;
        -[JFXTextEffectEditorTextView textContainerInset](v8, "textContainerInset");
        v11 = v9 * 0.5 + v10;
LABEL_7:
        -[JFXTextEffectEditorTextView setTextContainerInset:](v13, "setTextContainerInset:", v11);
        v8 = v13;
      }
    }

  }
}

- (void)JFX_adjustSizeToMatchExpectedNumberOfLines:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "numberOfLines");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v11, "textAlignment");
    v7 = 5;
    do
    {
      v8 = -[JFXTextEffectEditorTextView JFX_countNumberOfLines](self, "JFX_countNumberOfLines");
      if (v8 == v5)
        break;
      v9 = v8 <= v5 ? -2.0 : 2.0;
      -[JFXTextEffectEditorTextView frame](self, "frame");
      if (v6 == 2)
      {
        v10 = v10 - v9;
      }
      else if (v6 == 1)
      {
        v10 = v10 + v9 * -0.5;
      }
      -[JFXTextEffectEditorTextView setFrame:](self, "setFrame:", v10);
      --v7;
    }
    while (v7);
  }

}

- (unint64_t)JFX_countNumberOfLines
{
  void *v2;
  unint64_t v3;
  double v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  -[JFXTextEffectEditorTextView layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfGlyphs");
  objc_msgSend(v2, "extraLineFragmentRect");
  v5 = v4 > 0.0;
  if (v3)
  {
    v6 = 0;
    do
    {
      v8 = 0;
      v9 = 0;
      objc_msgSend(v2, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v6, &v8);
      v6 = v9 + v8;
      ++v5;
    }
    while (v9 + v8 < v3);
  }

  return v5;
}

- (CGRect)textFrameWithoutFudge
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textFrameWithoutFudge.origin.x;
  y = self->_textFrameWithoutFudge.origin.y;
  width = self->_textFrameWithoutFudge.size.width;
  height = self->_textFrameWithoutFudge.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextFrameWithoutFudge:(CGRect)a3
{
  self->_textFrameWithoutFudge = a3;
}

- (JFXTextEffectEditorView)editorView
{
  return (JFXTextEffectEditorView *)objc_loadWeakRetained((id *)&self->_editorView);
}

- (void)setEditorView:(id)a3
{
  objc_storeWeak((id *)&self->_editorView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editorView);
}

@end
