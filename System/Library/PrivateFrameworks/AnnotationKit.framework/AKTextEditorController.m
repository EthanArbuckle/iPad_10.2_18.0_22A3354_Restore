@implementation AKTextEditorController

- (AKTextEditorController)initWithController:(id)a3
{
  id v4;
  AKTextEditorController *v5;
  AKTextEditorController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKTextEditorController;
  v5 = -[AKTextEditorController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKTextEditorController setController:](v5, "setController:", v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AKTextEditorController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[AKTextEditorController setTextStorage:](self, "setTextStorage:", 0);
  -[AKTextEditorController setTextView:](self, "setTextView:", 0);
  -[AKTextEditorController setTextViewContainer:](self, "setTextViewContainer:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)AKTextEditorController;
  -[AKTextEditorController dealloc](&v5, sel_dealloc);
}

- (void)beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5
{
  -[AKTextEditorController beginEditingAnnotation:withPageController:selectAllText:withPencil:](self, "beginEditingAnnotation:withPageController:selectAllText:withPencil:", a3, a4, a5, 0);
}

- (void)beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5 withPencil:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22907D044;
  v14[3] = &unk_24F1A8390;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v17 = a5;
  v18 = a6;
  v12 = v11;
  v13 = v10;
  -[AKTextEditorController _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v14);

}

- (void)commitToModelWithoutEndingEditing
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_22907D0AC;
  v2[3] = &unk_24F1A7328;
  v2[4] = self;
  -[AKTextEditorController _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v2);
}

- (void)endEditing
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_22907D104;
  v2[3] = &unk_24F1A7328;
  v2[4] = self;
  -[AKTextEditorController _performBlockOnMainThread:](self, "_performBlockOnMainThread:", v2);
}

- (void)_beginEditingAnnotation:(id)a3 withPageController:(id)a4 selectAllText:(BOOL)a5 withPencil:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id v48;
  AKTextLayoutManager *v49;
  id v50;
  void *v51;
  AKTextView *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  id v87;
  void *v88;
  void *v89;
  AKTextLayoutManager *v90;
  void *v91;
  _BOOL4 v92;
  int v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  double v98;
  id v99;
  float64x2_t v100;
  __int128 v101;
  __int128 v102;
  void *v103;
  _QWORD v104[3];
  __CFString *v105;
  _QWORD v106[3];

  v6 = a6;
  v7 = a5;
  v106[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  -[AKTextEditorController annotation](self, "annotation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v10)
  {
    v13 = objc_msgSend(v10, "isEditingText");

    if ((v13 & 1) != 0)
      goto LABEL_33;
  }
  else
  {

  }
  -[AKTextEditorController _endEditing](self, "_endEditing");
  -[AKTextEditorController controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didBeginEditingAnnotation:", self);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKTextEditorController setPageController:](self, "setPageController:", v11);
  -[AKTextEditorController setAnnotation:](self, "setAnnotation:", v10);
  v105 = AKEditingTextAnnotationKey;
  v106[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = AKWillBeginEditingTextAnnotationNotification;
  objc_msgSend(v11, "controller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", v17, v18, v15);

  objc_msgSend(v10, "setIsEditingText:", 1);
  objc_msgSend(v10, "setShouldUseAppearanceOverride:", 0);
  objc_msgSend(v11, "pageModelController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v20;
  objc_msgSend(v20, "setSet:", v21);

  objc_msgSend(v10, "annotationText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v6;
  if (v6)
  {
    v23 = 0;
  }
  else
  {
    +[AKTextAnnotationAttributeHelper placeholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "placeholderTextOfAnnotation:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v22, "length"))
  {
    objc_msgSend(v22, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v24, "isEqualToString:", v25);

  }
  else
  {
    v26 = v23;

    v86 = objc_msgSend(v26, "length") != 0;
    v22 = v26;
  }
  v94 = v23;
  if (!objc_msgSend(v22, "length"))
  {
    if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(v10, "typingAttributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      objc_msgSend(v10, "strokeColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v29, *MEMORY[0x24BDF6600]);

      objc_msgSend(v10, "setTypingAttributes:", v28);
    }
    objc_msgSend(v10, "typingAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", &stru_24F1A83D0, v30);

    v22 = v31;
  }
  v32 = objc_alloc_init(MEMORY[0x24BDD1898]);
  -[AKTextEditorController setTextViewUndoManager:](self, "setTextViewUndoManager:", v32);

  v101 = 0u;
  v102 = 0u;
  v100 = 0uLL;
  v99 = 0;
  LOBYTE(v80) = 1;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v101, &v100, &v99, 0, v10, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v11, 0, v80, v22);
  v33 = v99;
  -[AKTextEditorController _editorFrameForTextBoundsInModel:](self, "_editorFrameForTextBoundsInModel:", v101, v102);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v98 = 0.0;
  +[AKGeometryHelper effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:](AKGeometryHelper, "effectiveDrawingBoundsForAnnotation:forDisplay:pageControllerOrNil:outScaleFactor:", v10, 1, v11, &v98);
  objc_msgSend(v11, "overlayView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "akEnclosingScrollView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "akMagnification");
  v45 = v44;

  v96 = v45 * v98;
  -[AKTextEditorController setModelToEditorScaleFactor:](self, "setModelToEditorScaleFactor:");
  -[AKTextEditorController setHandleCompensatingScaleFactor:](self, "setHandleCompensatingScaleFactor:", v45);
  objc_msgSend(v10, "originalModelBaseScaleFactor");
  -[AKTextEditorController setRenderingTextStorageScaleFactor:](self, "setRenderingTextStorageScaleFactor:", v96 * v46);
  v47 = -[AKTextEditorController _newScaledPaths:withScaleFactor:aboutCenter:](self, "_newScaledPaths:withScaleFactor:aboutCenter:", v33, v96, v100.f64[0] * 0.5, v100.f64[1] * 0.5);

  v100 = vmulq_n_f64(v100, v96);
  -[AKTextEditorController renderingTextStorageScaleFactor](self, "renderingTextStorageScaleFactor");
  v48 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v22);
  v49 = objc_alloc_init(AKTextLayoutManager);
  v97 = v48;
  objc_msgSend(v48, "addLayoutManager:", v49);
  v50 = objc_alloc(MEMORY[0x24BDF6770]);
  v51 = (void *)objc_msgSend(v50, "initWithContainerSize:", *(_OWORD *)&v100);
  v91 = v47;
  objc_msgSend(v51, "setExclusionPaths:", v47);
  v90 = v49;
  -[AKTextLayoutManager addTextContainer:](v49, "addTextContainer:", v51);
  v89 = v51;
  v52 = -[AKTextView initWithFrame:textContainer:]([AKTextView alloc], "initWithFrame:textContainer:", v51, v35, v37, v39, v41);
  objc_msgSend(v10, "typingAttributes");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextEditorController renderingTextStorageScaleFactor](self, "renderingTextStorageScaleFactor");
  +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v53);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextView setTypingAttributes:](v52, "setTypingAttributes:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AKTextView setMaximumNumberOfCharacters:](v52, "setMaximumNumberOfCharacters:", objc_msgSend(v10, "maximumNumberOfCharacters"));
  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("AKTextAnnotationTypingAttributesTextContentTypeKey"));
  v54 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v54;
  if (v54)
  {
    -[AKTextView setTextContentType:](v52, "setTextContentType:", v54);
    goto LABEL_23;
  }
  objc_msgSend(v10, "textContentType");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v10, "textContentType");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    -[AKTextView setTextContentType:](v52, "setTextContentType:", v56);
    goto LABEL_22;
  }
  objc_msgSend((id)objc_opt_class(), "textContentTypeFromCRFormContentType:", objc_msgSend(v10, "formContentType"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    goto LABEL_21;
LABEL_22:

LABEL_23:
  -[AKTextView setDelegate:](v52, "setDelegate:", self);
  -[AKTextView setEditable:](v52, "setEditable:", 1);
  -[AKTextView setSelectable:](v52, "setSelectable:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextView setBackgroundColor:](v52, "setBackgroundColor:", v57);

  -[AKTextView textContainer](v52, "textContainer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setLineFragmentPadding:", 0.0);

  -[AKTextView textContainer](v52, "textContainer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setWidthTracksTextView:", 0);

  -[AKTextView textContainer](v52, "textContainer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHeightTracksTextView:", 0);

  -[AKTextView setTextContainerInset:](v52, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  -[AKTextView setScrollEnabled:](v52, "setScrollEnabled:", 0);
  if (v92 && (objc_opt_respondsToSelector() & 1) != 0)
    -[AKTextView set_textInputSource:](v52, "set_textInputSource:", 3);
  v93 = v86 | v7;
  -[AKTextEditorController setTextView:](self, "setTextView:", v52);
  -[AKTextEditorController setTextStorage:](self, "setTextStorage:", v97);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v35, v37, v39, v41);
  -[AKTextEditorController setTextViewContainer:](self, "setTextViewContainer:", v61);

  objc_msgSend(v11, "overlayView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextEditorController textViewContainer](self, "textViewContainer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", v63);

  -[AKTextEditorController textViewContainer](self, "textViewContainer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addSubview:", v52);

  -[AKTextView setClipsToBounds:](v52, "setClipsToBounds:", 0);
  -[AKTextView superview](v52, "superview");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setClipsToBounds:", 0);

  -[AKTextEditorController controller](self, "controller");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "delegate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v67, "shouldAddTabControlsToTextEditorForAnnotation:forAnnotationController:", v10, v66))
  {
    -[AKTextView setKeyCommandDelegate:](v52, "setKeyCommandDelegate:", self);
    v83 = v53;
    v84 = v15;
    v68 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.up"));
    v87 = v11;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)objc_msgSend(v68, "initWithImage:style:target:action:", v69, 0, self, sel_handleBackTabCommand);

    v70 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.down"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)objc_msgSend(v70, "initWithImage:style:target:action:", v71, 0, self, sel_handleTabCommand);

    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v73 = objc_alloc(MEMORY[0x24BDF6868]);
    v104[0] = v82;
    v104[1] = v81;
    v104[2] = v72;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 3);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v73, "initWithBarButtonItems:representativeItem:", v74, 0);

    v103 = v75;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextView inputAssistantItem](v52, "inputAssistantItem");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setLeadingBarButtonGroups:", v76);

    v53 = v83;
    v11 = v87;

    v15 = v84;
  }
  -[AKTextEditorController _adjustEditorToFitAnnotation:withText:](self, "_adjustEditorToFitAnnotation:withText:", v10, v22);
  -[AKTextEditorController _adjustAnnotationFrameToFitText](self, "_adjustAnnotationFrameToFitText");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  self->_wantsTextViewBecomeFirstResponder = 1;
  -[AKTextView becomeFirstResponder](v52, "becomeFirstResponder");
  -[AKTextEditorController _registerForFirstResponderNotifications](self, "_registerForFirstResponderNotifications");
  if (v93)
  {
    -[AKTextView selectAll:](v52, "selectAll:", self);
  }
  else
  {
    -[AKTextEditorController textStorage](self, "textStorage");
    v78 = v53;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextView setSelectedRange:](v52, "setSelectedRange:", objc_msgSend(v79, "length"), 0);

    v53 = v78;
  }

LABEL_33:
}

- (void)_commitToModelWithoutEndingEditing
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (-[AKTextEditorController isEditing](self, "isEditing"))
  {
    -[AKTextEditorController annotation](self, "annotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v17 = v3;
      -[AKTextEditorController renderingTextStorageScaleFactor](self, "renderingTextStorageScaleFactor");
      v5 = 1.0 / v4;
      -[AKTextEditorController textStorage](self, "textStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v6, v5);

      if (objc_msgSend(v7, "length"))
        v8 = v7;
      else
        v8 = 0;
      objc_msgSend(v17, "setAnnotationText:", v8);
      -[AKTextEditorController textView](self, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "typingAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[AKTextEditorController textView](self, "textView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "typingAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDF65F8]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[AKTextEditorController textView](self, "textView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "typingAttributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v15, v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setTypingAttributes:", v16);
        }
      }

      v3 = v17;
    }

  }
}

- (void)_endEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  self->_wantsTextViewBecomeFirstResponder = 0;
  -[AKTextEditorController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didEndEditingAnnotation:", self);

  -[AKTextEditorController _unregisterForFirstResponderNotifications](self, "_unregisterForFirstResponderNotifications");
  if (-[AKTextEditorController isEditing](self, "isEditing")
    && !-[AKTextEditorController isInEndEditing](self, "isInEndEditing"))
  {
    -[AKTextEditorController setIsInEndEditing:](self, "setIsInEndEditing:", 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[AKTextEditorController annotation](self, "annotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextEditorController _commitToModelWithoutEndingEditing](self, "_commitToModelWithoutEndingEditing");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[AKTextEditorController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AKTextEditorController textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignFirstResponder");

      -[AKTextEditorController textView](self, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      -[AKTextEditorController textView](self, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

    }
    -[AKTextEditorController setTextView:](self, "setTextView:", 0);
    -[AKTextEditorController setTextViewUndoManager:](self, "setTextViewUndoManager:", 0);
    -[AKTextEditorController setTextStorage:](self, "setTextStorage:", 0);
    objc_msgSend(v4, "setIsEditingText:", 0);
    v22 = AKEditingTextAnnotationKey;
    v23[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = AKDidEndEditingTextAnnotationNotification;
    -[AKTextEditorController pageController](self, "pageController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "controller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, v16, v12);

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(v4, "annotationText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (!v18)
    {
      -[AKTextEditorController pageController](self, "pageController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend((id)objc_opt_class(), "deleteAfterEditingIfEmpty"))
      {
        objc_msgSend(v19, "pageModelController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mutableArrayValueForKey:", CFSTR("annotations"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v4);

      }
      else
      {
        +[AKTextAnnotationAttributeHelper placeholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "placeholderTextOfAnnotation:", v4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:toFitOptionalText:onPageController:](AKTextAnnotationAttributeHelper, "adjustBoundsOfAnnotation:toFitOptionalText:onPageController:", v4, v20, v19);
      }

    }
    -[AKTextEditorController setAnnotation:](self, "setAnnotation:", 0);
    -[AKTextEditorController setPageController:](self, "setPageController:", 0);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[AKTextEditorController setIsInEndEditing:](self, "setIsInEndEditing:", 0);

  }
}

+ (id)textContentTypeFromCRFormContentType:(unint64_t)a3
{
  id v3;
  id *v4;
  id result;

  v3 = 0;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_42;
    case 2uLL:
      v4 = (id *)MEMORY[0x24BDF7EA8];
      goto LABEL_41;
    case 3uLL:
      v4 = (id *)MEMORY[0x24BDF7EB0];
      goto LABEL_41;
    case 4uLL:
      v4 = (id *)MEMORY[0x24BDF7E88];
      goto LABEL_41;
    case 5uLL:
    case 0x1AuLL:
      v4 = (id *)MEMORY[0x24BDF7EA0];
      goto LABEL_41;
    case 6uLL:
      v4 = (id *)MEMORY[0x24BDF7E78];
      goto LABEL_41;
    case 7uLL:
      v4 = (id *)MEMORY[0x24BDF7EB8];
      goto LABEL_41;
    case 8uLL:
      v4 = (id *)MEMORY[0x24BDF7EC8];
      goto LABEL_41;
    case 9uLL:
      v4 = (id *)MEMORY[0x24BDF7E90];
      goto LABEL_41;
    case 0xAuLL:
      v4 = (id *)MEMORY[0x24BDF7ED8];
      goto LABEL_41;
    case 0xBuLL:
      v4 = (id *)MEMORY[0x24BDF7E98];
      goto LABEL_41;
    case 0xCuLL:
      v4 = (id *)MEMORY[0x24BDF7E80];
      goto LABEL_41;
    case 0xDuLL:
      v4 = (id *)MEMORY[0x24BDF7EF0];
      goto LABEL_41;
    case 0xEuLL:
      v4 = (id *)MEMORY[0x24BDF7EF8];
      goto LABEL_41;
    case 0xFuLL:
      v4 = (id *)MEMORY[0x24BDF7E00];
      goto LABEL_41;
    case 0x10uLL:
      v4 = (id *)MEMORY[0x24BDF7E10];
      goto LABEL_41;
    case 0x11uLL:
      v4 = (id *)MEMORY[0x24BDF7E08];
      goto LABEL_41;
    case 0x12uLL:
      v4 = (id *)MEMORY[0x24BDF7F00];
      goto LABEL_41;
    case 0x13uLL:
      v4 = (id *)MEMORY[0x24BDF7E18];
      goto LABEL_41;
    case 0x14uLL:
      v4 = (id *)MEMORY[0x24BDF7EE8];
      goto LABEL_41;
    case 0x15uLL:
      v4 = (id *)MEMORY[0x24BDF7E70];
      goto LABEL_41;
    case 0x16uLL:
      v4 = (id *)MEMORY[0x24BDF7F38];
      goto LABEL_41;
    case 0x17uLL:
      v4 = (id *)MEMORY[0x24BDF7EE0];
      goto LABEL_41;
    case 0x18uLL:
      v4 = (id *)MEMORY[0x24BDF7E48];
      goto LABEL_41;
    case 0x19uLL:
      v4 = (id *)MEMORY[0x24BDF7E40];
      goto LABEL_41;
    case 0x1BuLL:
      v4 = (id *)MEMORY[0x24BDF7E38];
      goto LABEL_41;
    case 0x1CuLL:
      v4 = (id *)MEMORY[0x24BDF7E50];
      goto LABEL_41;
    case 0x1DuLL:
      v4 = (id *)MEMORY[0x24BDF7E20];
      goto LABEL_41;
    case 0x1EuLL:
      v4 = (id *)MEMORY[0x24BDF7E28];
      goto LABEL_41;
    case 0x1FuLL:
      v4 = (id *)MEMORY[0x24BDF7E30];
      goto LABEL_41;
    case 0x20uLL:
      v4 = (id *)MEMORY[0x24BDF7E58];
      goto LABEL_41;
    case 0x21uLL:
      v4 = (id *)MEMORY[0x24BDF7E60];
      goto LABEL_41;
    case 0x2AuLL:
      v4 = (id *)MEMORY[0x24BDF7F30];
      goto LABEL_41;
    case 0x2BuLL:
      v4 = (id *)MEMORY[0x24BDF7F10];
      goto LABEL_41;
    case 0x2CuLL:
      v4 = (id *)MEMORY[0x24BDF7F28];
      goto LABEL_41;
    case 0x2DuLL:
      v4 = (id *)MEMORY[0x24BDF7F08];
      goto LABEL_41;
    case 0x2EuLL:
      v4 = (id *)MEMORY[0x24BDF7F20];
      goto LABEL_41;
    case 0x31uLL:
      v4 = (id *)MEMORY[0x24BDF7F18];
      goto LABEL_41;
    case 0x34uLL:
      v4 = (id *)MEMORY[0x24BDF7E68];
LABEL_41:
      v3 = *v4;
LABEL_42:
      result = v3;
      break;
    default:
      NSLog(CFSTR("CRFormContentType(%d) cannot be mapped to UITextContentType"), a2, a3);
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[AKTextEditorController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AKTextEditorController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleTabCommand
{
  MEMORY[0x24BEDD108](self, sel__doHandleTab);
}

- (void)handleBackTabCommand
{
  MEMORY[0x24BEDD108](self, sel__doHandleBackTab);
}

- (void)_performBlockOnMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (id)_newScaledPaths:(id)a3 withScaleFactor:(double)a4 aboutCenter:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a5.y;
  x = a5.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (fabs(a4 + -1.0) >= 0.0005)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v20 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v30.a = *MEMORY[0x24BDBD8B8];
    v19 = *(_OWORD *)&v30.a;
    *(_OWORD *)&v30.c = v20;
    *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v18 = *(_OWORD *)&v30.tx;
    CGAffineTransformMakeTranslation(&t2, -x, -y);
    *(_OWORD *)&t1.a = v19;
    *(_OWORD *)&t1.c = v20;
    *(_OWORD *)&t1.tx = v18;
    CGAffineTransformConcat(&v30, &t1, &t2);
    CGAffineTransformMakeScale(&v27, a4, a4);
    v26 = v30;
    CGAffineTransformConcat(&t1, &v26, &v27);
    v30 = t1;
    CGAffineTransformMakeTranslation(&v25, x * a4, y * a4);
    v26 = v30;
    CGAffineTransformConcat(&t1, &v26, &v25);
    v30 = t1;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copy", v18, v19, v20, (_QWORD)v21);
          t1 = v30;
          objc_msgSend(v16, "applyTransform:", &t1);
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (void)_adjustAnnotationFrameToFitText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  if (!-[AKTextEditorController isInAdjustAnnotationFrameToFitText](self, "isInAdjustAnnotationFrameToFitText"))
  {
    -[AKTextEditorController setIsInAdjustAnnotationFrameToFitText:](self, "setIsInAdjustAnnotationFrameToFitText:", 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[AKTextEditorController pageController](self, "pageController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextEditorController annotation](self, "annotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[AKTextEditorController textStorage](self, "textStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
      {
        -[AKTextEditorController textStorage](self, "textStorage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKTextEditorController renderingTextStorageScaleFactor](self, "renderingTextStorageScaleFactor");
        v9 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v7, 1.0 / v8);
      }
      else
      {
        objc_msgSend(v4, "typingAttributes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:attributes:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithString:attributes:", &stru_24F1A83D0, v7);
        -[AKTextEditorController renderingTextStorageScaleFactor](self, "renderingTextStorageScaleFactor");
        +[AKTextAnnotationAttributeHelper typingAttributes:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "typingAttributes:byApplyingScaleFactor:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKTextEditorController textView](self, "textView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTypingAttributes:", v10);

      }
      -[AKTextEditorController textStorage](self, "textStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13 >= 2)
      {
        v24 = 0;
        -[AKTextEditorController textStorage](self, "textStorage", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "attributesAtIndex:effectiveRange:", 0, &v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = *MEMORY[0x24BDF66C8];
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDF66C8]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = v13 - (v13 == objc_msgSend(v4, "maximumNumberOfCharacters"));
          if (v18 != v24)
          {
            -[AKTextEditorController textStorage](self, "textStorage");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeAttribute:range:", v16, 0, v13);

            -[AKTextEditorController textStorage](self, "textStorage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addAttribute:value:range:", v16, v21, 0, v18);

            objc_msgSend(v9, "removeAttribute:range:", v16, 0, v13);
            objc_msgSend(v15, "objectForKeyedSubscript:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addAttribute:value:range:", v16, v22, 0, v18);

          }
        }

      }
      +[AKTextAnnotationAttributeHelper adjustBoundsOfAnnotation:toFitOptionalText:onPageController:](AKTextAnnotationAttributeHelper, "adjustBoundsOfAnnotation:toFitOptionalText:onPageController:", v4, v9, v3);
      if (!objc_msgSend(v4, "conformsToAKRectangularAnnotationProtocol")
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[AKTextEditorController commitToModelWithoutEndingEditing](self, "commitToModelWithoutEndingEditing");
      }
      -[AKTextEditorController _adjustEditorToFitAnnotation:withText:](self, "_adjustEditorToFitAnnotation:withText:", v4, v9);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      -[AKTextEditorController setIsInAdjustAnnotationFrameToFitText:](self, "setIsInAdjustAnnotationFrameToFitText:", 0);

    }
  }
}

- (void)_adjustEditorToFitAnnotation:(id)a3 withText:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  id v30;
  float64x2_t v31;
  __int128 v32;
  __int128 v33;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDE57D8];
  v8 = a4;
  objc_msgSend(v7, "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKTextEditorController pageController](self, "pageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v31 = 0uLL;
  v30 = 0;
  LOBYTE(v28) = 1;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, &v32, &v31, &v30, 0, v6, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v9, 0, v28, v8);

  v10 = v30;
  -[AKTextEditorController _editorFrameForTextBoundsInModel:](self, "_editorFrameForTextBoundsInModel:", v32, v33);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[AKTextEditorController modelToEditorScaleFactor](self, "modelToEditorScaleFactor");
  v29 = v19;
  v20 = -[AKTextEditorController _newScaledPaths:withScaleFactor:aboutCenter:](self, "_newScaledPaths:withScaleFactor:aboutCenter:", v10);

  v31 = vmulq_n_f64(v31, v29);
  -[AKTextEditorController textView](self, "textView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "akSetContainerSize:", *(_OWORD *)&v31);

  -[AKTextEditorController textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setExclusionPaths:", v20);

  v25 = 0.0;
  if (objc_msgSend(v6, "conformsToAKRotatableAnnotationProtocol"))
  {
    objc_msgSend(v6, "rotationAngle");
    v25 = v26;
  }
  -[AKTextEditorController textView](self, "textView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextEditorController _updateTextView:withFrame:andOrientation:additionalRotation:](self, "_updateTextView:withFrame:andOrientation:additionalRotation:", v27, objc_msgSend(v6, "originalExifOrientation"), v12, v14, v16, v18, v25);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGRect)_editorFrameForTextBoundsInModel:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    v8 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    -[AKTextEditorController pageController](self, "pageController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRectFromModelToOverlay:", x, y, width, height);
    v18 = CGRectIntegral(v17);
    v19 = CGRectInset(v18, -1.0, -1.0);
    v8 = v19.origin.x;
    v9 = v19.origin.y;
    v10 = v19.size.width;
    v11 = v19.size.height;

  }
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_updateTextView:(id)a3 withFrame:(CGRect)a4 andOrientation:(int64_t)a5 additionalRotation:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v13;
  int64_t v14;
  double v15;
  double v16;
  double MidX;
  double v18;
  double v19;
  double v20;
  double v21;
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
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double MidY;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
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
  __int128 v83;
  __int128 v84;
  double v85;
  __int128 v86;
  double v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  _OWORD v90[3];
  _OWORD v91[3];
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", a5);
  v86 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v98.a = *MEMORY[0x24BDBD8B8];
  v84 = *(_OWORD *)&v98.a;
  *(_OWORD *)&v98.c = v86;
  *(_OWORD *)&v98.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v83 = *(_OWORD *)&v98.tx;
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  *(_OWORD *)&t1.a = v84;
  *(_OWORD *)&t1.c = v86;
  *(_OWORD *)&t1.tx = v83;
  CGAffineTransformConcat(&v98, &t1, &t2);
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v14, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v94 = v98;
  CGAffineTransformConcat(&t1, &v94, &v95);
  v98 = t1;
  CGAffineTransformMakeRotation(&v93, a6);
  v94 = v98;
  CGAffineTransformConcat(&t1, &v94, &v93);
  v98 = t1;
  -[AKTextEditorController handleCompensatingScaleFactor](self, "handleCompensatingScaleFactor");
  v16 = v15;
  CGAffineTransformMakeScale(&v92, 1.0 / v15, 1.0 / v15);
  v94 = v98;
  CGAffineTransformConcat(&t1, &v94, &v92);
  v98 = t1;
  v99.origin.x = x;
  v99.origin.y = y;
  v99.size.width = width;
  v99.size.height = height;
  MidX = CGRectGetMidX(v99);
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", width * v16, height * v16, MidX, CGRectGetMidY(v100));
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v13, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v84;
  v91[1] = v86;
  v91[2] = v83;
  objc_msgSend(v26, "setTransform:", v91);

  v90[0] = v84;
  v90[1] = v86;
  v90[2] = v83;
  objc_msgSend(v13, "setTransform:", v90);
  objc_msgSend(v13, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);

  objc_msgSend(v13, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", v14))
  {
    v101.origin.x = v30;
    v101.origin.y = v32;
    v101.size.width = v34;
    v101.size.height = v36;
    v87 = v19;
    v37 = CGRectGetHeight(v101);
    v102.origin.x = v30;
    v102.origin.y = v32;
    v102.size.width = v34;
    v102.size.height = v36;
    v85 = v21;
    v38 = CGRectGetWidth(v102);
    v103.origin.x = v30;
    v103.origin.y = v32;
    v103.size.width = v34;
    v103.size.height = v36;
    *(double *)&v83 = v25;
    v39 = v23;
    v40 = CGRectGetMidX(v103);
    v104.origin.x = v30;
    v104.origin.y = v32;
    v104.size.width = v34;
    v104.size.height = v36;
    MidY = CGRectGetMidY(v104);
    v105.origin.x = v30;
    v105.origin.y = v32;
    v105.size.width = v37;
    v105.size.height = v38;
    v42 = v40 - CGRectGetWidth(v105) * 0.5;
    v106.origin.x = v30;
    v106.origin.y = v32;
    v106.size.width = v37;
    v106.size.height = v38;
    v32 = MidY - CGRectGetHeight(v106) * 0.5;
    v36 = v38;
    v21 = v85;
    v34 = v37;
    v19 = v87;
    v30 = v42;
    v23 = v39;
    v25 = *(double *)&v83;
  }
  objc_msgSend(v13, "frame", (_QWORD)v83);
  v111.origin.x = v30;
  v111.origin.y = v32;
  v111.size.width = v34;
  v111.size.height = v36;
  if (CGRectEqualToRect(v107, v111))
  {
    v108.origin.x = v30;
    v108.origin.y = v32;
    v108.size.width = v34;
    v108.size.height = v36;
    v109 = CGRectInset(v108, -1.0, -1.0);
    objc_msgSend(v13, "setFrame:", v109.origin.x, v109.origin.y, v109.size.width, v109.size.height);
  }
  objc_msgSend(v13, "setFrame:", v30, v32, v34, v36);
  v89 = v98;
  objc_msgSend(v13, "superview");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v89;
  objc_msgSend(v43, "setTransform:", &v88);

  -[AKTextEditorController pageController](self, "pageController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "visibleRectOfOverlay");
  objc_msgSend(v44, "convertRectFromModelToOverlay:");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v110.origin.x = v19;
  v110.origin.y = v21;
  v110.size.width = v23;
  v110.size.height = v25;
  v112.origin.x = v46;
  v112.origin.y = v48;
  v112.size.width = v50;
  v112.size.height = v52;
  v53 = CGRectIntersectsRect(v110, v112);
  -[AKTextEditorController textViewMaskLayer](self, "textViewMaskLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v53)
  {

    if (v55)
    {
      -[AKTextEditorController textViewMaskLayer](self, "textViewMaskLayer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "sublayers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKTextEditorController setTextViewMaskLayer:](self, "setTextViewMaskLayer:", v58);

      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.4);
      v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v60 = objc_msgSend(v59, "CGColor");
      -[AKTextEditorController textViewMaskLayer](self, "textViewMaskLayer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setBackgroundColor:", v60);

      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v55, "setBackgroundColor:", objc_msgSend(v62, "CGColor"));

      -[AKTextEditorController textViewMaskLayer](self, "textViewMaskLayer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addSublayer:", v55);
    }

    objc_msgSend(v13, "bounds");
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    -[AKTextEditorController textViewMaskLayer](self, "textViewMaskLayer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setFrame:", v64, v66, v68, v70);

    objc_msgSend(v44, "overlayView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:fromView:", v72, v46, v48, v50, v52);
    v74 = v73;
    v76 = v75;
    v78 = v77;
    v80 = v79;

    objc_msgSend(v55, "setFrame:", v74, v76, v78, v80);
    -[AKTextEditorController textViewMaskLayer](self, "textViewMaskLayer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setMask:", v81);

  }
  else
  {
    objc_msgSend(v54, "removeFromSuperlayer");
  }

}

- (BOOL)_doHandleTab
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[AKTextEditorController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKTextEditorController annotation](self, "annotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "handleTabInTextEditorForAnnotation:forAnnotationController:", v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_doHandleBackTab
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[AKTextEditorController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKTextEditorController annotation](self, "annotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "handleBackTabInTextEditorForAnnotation:forAnnotationController:", v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_registerForFirstResponderNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, *MEMORY[0x24BDF81E0], 0);

}

- (void)_unregisterForFirstResponderNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF81E0], 0);

}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  char v5;

  if (!self->_wantsTextViewBecomeFirstResponder)
  {
    -[AKTextEditorController textView](self, "textView", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFirstResponder");

    if ((v5 & 1) == 0)
    {
      self->_wantsTextViewBecomeFirstResponder = 0;
      -[AKTextEditorController endEditing](self, "endEditing");
    }
  }
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTextView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AKTextAnnotationProtocol)annotation
{
  return (AKTextAnnotationProtocol *)objc_loadWeakRetained((id *)&self->_annotation);
}

- (void)setAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_annotation, a3);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (CALayer)textViewMaskLayer
{
  return (CALayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTextViewMaskLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIView)textViewContainer
{
  return (UIView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTextViewContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSTextStorage)textStorage
{
  return (NSTextStorage *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTextStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)renderingTextStorageScaleFactor
{
  return self->_renderingTextStorageScaleFactor;
}

- (void)setRenderingTextStorageScaleFactor:(double)a3
{
  self->_renderingTextStorageScaleFactor = a3;
}

- (double)modelToEditorScaleFactor
{
  return self->_modelToEditorScaleFactor;
}

- (void)setModelToEditorScaleFactor:(double)a3
{
  self->_modelToEditorScaleFactor = a3;
}

- (double)handleCompensatingScaleFactor
{
  return self->_handleCompensatingScaleFactor;
}

- (void)setHandleCompensatingScaleFactor:(double)a3
{
  self->_handleCompensatingScaleFactor = a3;
}

- (NSUndoManager)textViewUndoManager
{
  return (NSUndoManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTextViewUndoManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)isInEndEditing
{
  return self->_isInEndEditing;
}

- (void)setIsInEndEditing:(BOOL)a3
{
  self->_isInEndEditing = a3;
}

- (BOOL)isInAdjustAnnotationFrameToFitText
{
  return self->_isInAdjustAnnotationFrameToFitText;
}

- (void)setIsInAdjustAnnotationFrameToFitText:(BOOL)a3
{
  self->_isInAdjustAnnotationFrameToFitText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewUndoManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textViewContainer, 0);
  objc_storeStrong((id *)&self->_textViewMaskLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_annotation);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
