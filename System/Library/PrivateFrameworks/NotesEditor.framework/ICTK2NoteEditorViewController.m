@implementation ICTK2NoteEditorViewController

- (ICAttributionSidebarController)tk2AttributionSidebarController
{
  return self->_tk2AttributionSidebarController;
}

- (ICTTTextStorage)textStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContentStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextStorage *)v6;
}

- (void)recreateTextView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ICTK2TextView *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  ICTK2TextView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  ICAttributionSidebarController *v76;
  void *v77;
  ICAttributionSidebarController *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  ICPaperTextAttachmentManager *v84;
  void *v85;
  void *v86;
  ICPaperTextAttachmentManager *v87;
  _BOOL8 v88;
  void *v89;
  BOOL v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  ICVisualAssetImportController *v113;
  void *v114;
  void *v115;
  ICVisualAssetImportController *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  ICLinkAcceleratorController *v137;
  void *v138;
  ICLinkAcceleratorController *v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  ICAuthorHighlightsUpdater *v185;
  void *v186;
  ICAuthorHighlightsUpdater *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  char v199;
  void *v200;
  void *v201;
  void *v202;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v203;
  void *v204;
  void *v205;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  dispatch_time_t v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  id *v220;
  void *v221;
  id v222;
  id v223;
  id v224;
  _QWORD block[5];
  _QWORD v226[6];
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  char v230;
  uint64_t v231;
  uint64_t *v232;
  uint64_t v233;
  char v234;
  _QWORD v235[4];
  id v236;
  _QWORD v237[5];
  id v238;
  id location;
  _QWORD v240[2];
  _QWORD v241[4];
  _QWORD v242[3];

  v242[1] = *MEMORY[0x1E0C80C00];
  -[ICTK2NoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ICTK2NoteEditorViewController removeTextView](self, "removeTextView");
  -[ICNoteEditorBaseViewController note](self, "note");
  v223 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v223, "isPasswordProtectedAndLocked"))
    goto LABEL_6;
  -[ICNoteEditorViewController invitation](self, "invitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_6:
    return;
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnsupported");

  if ((v6 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICTK2NoteEditorViewController ppt_willLoadNoteIntoEditor](self, "ppt_willLoadNoteIntoEditor");
    -[ICNoteEditorBaseViewController note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsPausingUndoActions:", 0);

    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "alwaysEnumerateTrailingParagraph") & 1) != 0)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0D63928];
        -[ICNoteEditorBaseViewController note](self, "note");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "textStorage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "attribute:atIndex:effectiveRange:", v16, objc_msgSend(v18, "length") - 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[ICNoteEditorBaseViewController note](self, "note");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "textStorage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "outlineController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "closestVisibleAncestorForUUID:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)MEMORY[0x1E0C99E60];
            v242[0] = v25;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v242, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setWithArray:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "expandUUIDs:", v28);

          }
        }

      }
    }
    else
    {

    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textStorage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlwaysEnumerateTrailingParagraph:", 0);

    v31 = [ICTK2TextView alloc];
    -[ICNoteEditorBaseViewController note](self, "note");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    v36 = -[ICTK2TextView initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:](v31, "initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:", v32, -[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"), self, 0, v34, v35);
    -[ICTK2NoteEditorViewController setTk2TextView:](self, "setTk2TextView:", v36);

    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setClipsToBounds:", 0);

    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEditorController:", self);

    -[ICNoteEditorBaseViewController note](self, "note");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "documentMergeController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addTextView:", v42);

    v224 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v224, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "addSubview:", v43);

    -[ICTK2NoteEditorViewController traitCollection](self, "traitCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v44, "ic_hasCompactWidth") & 1) != 0)
    {
      v45 = 1;
    }
    else
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v46, "isAuxiliary") & 1) != 0)
      {
        v45 = 1;
      }
      else if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      {
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v47, "isMainSplitViewDisplayModeSecondaryOnly");

      }
      else
      {
        v45 = 0;
      }

    }
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "noteContainerViewMode") == 0;

    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "noteContainerViewMode") == 1)
      v51 = 1;
    else
      v51 = v45;

    -[ICNoteEditorViewController backgroundView](self, "backgroundView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v224, objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"), v45, v49, v51, 0);

    v213 = (void *)MEMORY[0x1E0CB3718];
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v220 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "leadingAnchor");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "leadingAnchor");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "constraintEqualToAnchor:", v219);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController setTextViewLeadingConstraint:](self, "setTextViewLeadingConstraint:", v221);
    v241[0] = v221;
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "topAnchor");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "topAnchor");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "constraintEqualToAnchor:", v216);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v241[1] = v214;
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v241[2] = v56;
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v241[3] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v241, 4);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "activateConstraints:", v61);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setContentInsetAdjustmentBehavior:", 0);

    v222 = objc_alloc_init(MEMORY[0x1E0CD1210]);
    objc_msgSend(v222, "setDelegate:", self);
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addInteraction:", v222);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setDelegate:", self);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setIcDelegate:", self);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setAttachmentViewDelegate:", self);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "ic_pkTiledView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setRulerHostingDelegate:", self);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setDataDetectorTypes:", -1);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "undoManager");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addObserver:selector:name:object:", self, sel_updateBarButtons, *MEMORY[0x1E0CB33A0], v71);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObserver:selector:name:object:", self, sel_updateBarButtons, *MEMORY[0x1E0CB33B8], v71);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObserver:selector:name:object:", self, sel_updateBarButtons, *MEMORY[0x1E0CB33B0], v71);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "addObserver:selector:name:object:", self, sel_hideInkPicker, CFSTR("ICNoteEditorTitleEditingViewDidShowNotification"), 0);

    v76 = [ICAttributionSidebarController alloc];
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = -[ICAttributionSidebarController initWithTextView:](v76, "initWithTextView:", v77);
    -[ICTK2NoteEditorViewController setTk2AttributionSidebarController:](self, "setTk2AttributionSidebarController:", v78);

    -[ICTK2NoteEditorViewController tk2AttributionSidebarController](self, "tk2AttributionSidebarController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "panGestureRecognizer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setDelegate:", self);

    objc_initWeak(&location, self);
    v237[0] = MEMORY[0x1E0C809B0];
    v237[1] = 3221225472;
    v237[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke;
    v237[3] = &unk_1EA7E09F0;
    objc_copyWeak(&v238, &location);
    v237[4] = self;
    -[ICTK2NoteEditorViewController tk2AttributionSidebarController](self, "tk2AttributionSidebarController");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setSidebarWidthDidChangeHandler:", v237);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "updateLayoutMargins");

    if (-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper")
      && +[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote](ICPaperCommonUtilities, "shouldShowLinksWhenComposingQuickNote"))
    {
      -[ICNoteEditorViewController createSystemPaperLinkBarIfNecessary](self, "createSystemPaperLinkBarIfNecessary");
      -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "refresh");

    }
    v84 = [ICPaperTextAttachmentManager alloc];
    -[ICNoteEditorBaseViewController note](self, "note");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = -[ICPaperTextAttachmentManager initWithNote:textView:](v84, "initWithNote:textView:", v85, v86);
    -[ICNoteEditorViewController setPaperTextAttachmentManager:](self, "setPaperTextAttachmentManager:", v87);

    v88 = -[ICNoteEditorViewController shouldAllowAttributionSidebar](self, "shouldAllowAttributionSidebar");
    -[ICTK2NoteEditorViewController tk2AttributionSidebarController](self, "tk2AttributionSidebarController");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setEnabled:", v88);

    v90 = -[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel");
    if (v90)
    {
      v91 = 1;
    }
    else
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v86, "isSharedAndEmpty");
    }
    -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", v91);
    if (!v90)

    -[ICNoteEditorBaseViewController note](self, "note");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "dateView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setNote:", v92);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "createUserTitleViewIfNecessaryForNote:", v96);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "updateCompatibilityBannerForNote:parentViewController:updateTextViewContentInsets:", v98, self, 0);

    -[ICNoteEditorViewController rebuildInputAccessoryView](self, "rebuildInputAccessoryView");
    -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
    -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
    -[ICNoteEditorViewController backgroundView](self, "backgroundView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "reparentAccessibilityChildrenOfElement:", v100);

    -[ICNoteEditorViewController backgroundView](self, "backgroundView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setAxChildReparentingController:", self);

    -[ICNoteEditorBaseViewController note](self, "note");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v100) = objc_msgSend(v102, "isNewNoteWithHashtagsInsertedIntoBody");

    if ((_DWORD)v100)
    {
      -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", objc_msgSend(MEMORY[0x1E0D64DC0], "noteDefaultNamedStyle"));
      -[ICNoteEditorBaseViewController note](self, "note");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setIsNewNoteWithHashtagsInsertedIntoBody:", 0);

    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "isEditable");
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setDisplayingEditableContent:", v105);

    v107 = objc_alloc(MEMORY[0x1E0D64AF8]);
    -[ICNoteEditorBaseViewController note](self, "note");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)objc_msgSend(v107, "initWithNote:", v108);
    -[ICNoteEditorViewController setAttachmentInsertionController:](self, "setAttachmentInsertionController:", v109);

    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setAttachmentDelegate:", self);

    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textController](self, "textController");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setAttachmentInsertionController:", v111);

    v113 = [ICVisualAssetImportController alloc];
    -[ICNoteEditorBaseViewController note](self, "note");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = -[ICVisualAssetImportController initWithNote:textView:](v113, "initWithNote:textView:", v114, v115);
    -[ICNoteEditorViewController setVisualAssetImportController:](self, "setVisualAssetImportController:", v116);

    v117 = objc_alloc(MEMORY[0x1E0D63BB0]);
    -[ICNoteEditorBaseViewController note](self, "note");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (void *)objc_msgSend(v117, "initWithNote:", v118);
    -[ICNoteEditorViewController setMentionsController:](self, "setMentionsController:", v119);

    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setAnalyticsDelegate:", self);

    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setAttachmentInsertionController:", v121);

    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textController](self, "textController");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setMentionsController:", v123);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setTextView:", v125);

    v127 = objc_alloc(MEMORY[0x1E0D63B28]);
    -[ICNoteEditorBaseViewController note](self, "note");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (void *)objc_msgSend(v127, "initWithNote:", v128);
    -[ICNoteEditorViewController setHashtagController:](self, "setHashtagController:", v129);

    -[ICNoteEditorViewController hashtagController](self, "hashtagController");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setAnalyticsDelegate:", self);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController hashtagController](self, "hashtagController");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setTextView:", v131);

    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController hashtagController](self, "hashtagController");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setAttachmentInsertionController:", v133);

    -[ICNoteEditorViewController hashtagController](self, "hashtagController");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textController](self, "textController");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setHashtagController:", v135);

    v137 = [ICLinkAcceleratorController alloc];
    objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = -[ICLinkAcceleratorController initWithCloudConfiguration:mode:](v137, "initWithCloudConfiguration:mode:", v138, 0);
    -[ICNoteEditorViewController setLinkAcceleratorController:](self, "setLinkAcceleratorController:", v139);

    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setDelegate:", self);

    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setLinkDelegate:", self);

    if (ICInternalSettingsIsNotesMathEnabled())
    {
      v142 = objc_alloc(MEMORY[0x1E0D64B90]);
      -[ICNoteEditorBaseViewController note](self, "note");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = (void *)objc_msgSend(v142, "initWithNote:", v143);
      -[ICNoteEditorViewController setCalculateRecognitionController:](self, "setCalculateRecognitionController:", v144);

      -[ICTK2NoteEditorViewController textView](self, "textView");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setTextView:", v145);

      -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "setAttachmentInsertionController:", v147);

      -[ICTK2NoteEditorViewController textView](self, "textView");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setSuggestionsDelegate:", v149);

      -[ICNoteEditorBaseViewController note](self, "note");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v151, "calculatePreviewBehavior");
      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setInsertsResults:", v152 != 1);

      -[ICNoteEditorBaseViewController note](self, "note");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v154, "calculatePreviewBehavior");
      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setPreviewBehavior:", v155);

      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "addErrorInteraction");

    }
    if (ICInternalSettingsIsScrubbingEnabled())
    {
      v158 = objc_alloc(MEMORY[0x1E0D64BA8]);
      -[ICTK2NoteEditorViewController textView](self, "textView");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = (void *)objc_msgSend(v158, "initWithTextView:", v159);
      -[ICNoteEditorViewController setCalculateScrubberController:](self, "setCalculateScrubberController:", v160);

      -[ICNoteEditorBaseViewController note](self, "note");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "setNote:", v161);

    }
    if (ICInternalSettingsIsGraphingEnabled())
    {
      v163 = objc_alloc(MEMORY[0x1E0D64B80]);
      -[ICNoteEditorBaseViewController note](self, "note");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = (void *)objc_msgSend(v163, "initWithNote:", v164);
      -[ICNoteEditorViewController setCalculateGraphingController:](self, "setCalculateGraphingController:", v165);

      -[ICTK2NoteEditorViewController textView](self, "textView");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateGraphingController](self, "calculateGraphingController");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "setTextView:", v166);

      -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateGraphingController](self, "calculateGraphingController");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "setAttachmentInsertionController:", v168);

      -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController calculateGraphingController](self, "calculateGraphingController");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "setScrubberController:", v170);

    }
    v172 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel_handleLeftOrRightSwipe_);
    objc_msgSend(v172, "setDirection:", 1);
    objc_msgSend(v172, "setDelegate:", self);
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "addGestureRecognizer:", v172);

    v174 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel_handleLeftOrRightSwipe_);
    objc_msgSend(v174, "setDirection:", 2);
    objc_msgSend(v174, "setDelegate:", self);
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "addGestureRecognizer:", v174);

    v240[0] = v172;
    v240[1] = v174;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v240, 2);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setSwipeGestureRecognizers:](self, "setSwipeGestureRecognizers:", v176);

    objc_opt_class();
    -[ICTK2NoteEditorViewController textView](self, "textView");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "textLayoutManager");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    v180 = objc_alloc(MEMORY[0x1E0D64B50]);
    -[ICNoteEditorBaseViewController note](self, "note");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = (void *)objc_msgSend(v180, "initWithNote:textLayoutManager:", v181, v179);
    -[ICTK2NoteEditorViewController setAuthorHighlightsController:](self, "setAuthorHighlightsController:", v182);

    -[ICNoteEditorViewController authorHighlightsController](self, "authorHighlightsController");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController textController](self, "textController");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "setAuthorHighlightsController:", v183);

    v185 = [ICAuthorHighlightsUpdater alloc];
    -[ICNoteEditorViewController authorHighlightsController](self, "authorHighlightsController");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = -[ICAuthorHighlightsUpdater initWithAuthorHighlightsController:textLayoutManager:](v185, "initWithAuthorHighlightsController:textLayoutManager:", v186, v179);
    -[ICNoteEditorViewController setAuthorHighlightsUpdater:](self, "setAuthorHighlightsUpdater:", v187);

    objc_msgSend(v179, "highlightPatternRegexFinder");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "setSearchHighlightRegexFinder:", v188);

    -[ICTK2NoteEditorViewController textView](self, "textView");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "TTTextStorage");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "resetHighlightsAttributedString");

    -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v191) = objc_msgSend(v192, "hasHighlights");

    if ((_DWORD)v191)
    {
      -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "updateAnimated:", 0);

    }
    v235[0] = MEMORY[0x1E0C809B0];
    v235[1] = 3221225472;
    v235[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_4;
    v235[3] = &unk_1EA7E0A18;
    objc_copyWeak(&v236, &location);
    -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "setRenderingAttributesProvider:", v235);

    -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2NoteEditorViewController attributionSidebarView](self, "attributionSidebarView");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setAuthorHighlightsUpdater:", v195);

    v231 = 0;
    v232 = &v231;
    v233 = 0x2020000000;
    v234 = 0;
    v227 = 0;
    v228 = &v227;
    v229 = 0x2020000000;
    v230 = 0;
    -[ICNoteEditorBaseViewController note](self, "note");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v226[0] = MEMORY[0x1E0C809B0];
    v226[1] = 3221225472;
    v226[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_5;
    v226[3] = &unk_1EA7E0A40;
    v226[4] = &v231;
    v226[5] = &v227;
    objc_msgSend(v197, "enumerateAttachmentsInOrderUsingBlock:", v226);

    if (objc_msgSend(MEMORY[0x1E0D64D30], "isEnabled")
      && (*((_BYTE *)v228 + 24)
       || !*((_BYTE *)v232 + 24) && ICInternalSettingsDefaultToPaperKitAttachments())
      && (-[ICNoteEditorBaseViewController note](self, "note"),
          v198 = (void *)objc_claimAutoreleasedReturnValue(),
          v199 = objc_msgSend(v198, "isUnsupported"),
          v198,
          (v199 & 1) == 0))
    {
      -[ICTK2NoteEditorViewController textView](self, "textView");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "setPaperEnabled:", 1);

      if (!*((_BYTE *)v232 + 24))
      {
LABEL_57:
        -[ICTK2NoteEditorViewController textView](self, "textView");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "setDrawingDelegate:", self);

        -[ICNoteEditorViewController updatePencilKitPaperStyleType](self, "updatePencilKitPaperStyleType");
        if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
        {
          -[ICTK2NoteEditorViewController textView](self, "textView");
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v208, "ic_pkTiledView");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "setOverrideUserInterfaceStyle:", 1);

        }
        -[ICNoteEditorBaseViewController note](self, "note");
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v210, "calculateDocumentController");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v211, "updateHighlights");

        v212 = dispatch_time(0, 250000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_6;
        block[3] = &unk_1EA7DD2D8;
        block[4] = self;
        dispatch_after(v212, MEMORY[0x1E0C80D38], block);
        _Block_object_dispose(&v227, 8);
        _Block_object_dispose(&v231, 8);
        objc_destroyWeak(&v236);

        objc_destroyWeak(&v238);
        objc_destroyWeak(&location);

        return;
      }
      -[ICNoteEditorBaseViewController note](self, "note");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "managedObjectContext");
      v202 = (void *)objc_claimAutoreleasedReturnValue();

      if (v202)
      {
        v203 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
        -[ICNoteEditorBaseViewController note](self, "note");
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTK2NoteEditorViewController textView](self, "textView");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        v206 = -[ICInlineDrawingUpgradeHelper initWithNote:managedObjectContext:textView:](v203, "initWithNote:managedObjectContext:textView:", v204, v202, v205);

        -[ICInlineDrawingUpgradeHelper upgradeAllAttachmentsInNote](v206, "upgradeAllAttachmentsInNote");
      }
    }
    else
    {
      -[ICTK2NoteEditorViewController textView](self, "textView");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "setStylusDrawingEnabled:", 1);
    }

    goto LABEL_57;
  }
}

id __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v11 = a2;
  v12 = a5;
  v13 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v13);
  v15 = objc_msgSend(WeakRetained, "shouldRenderAuthorHighlights");

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained(v13);
    objc_msgSend(v16, "authorHighlightsController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained(v13);
    objc_msgSend(v18, "tk2TextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributesForHighlightingTextLineFragment:characterRange:defaultRenderingAttributes:effectiveRange:textView:", v11, a3, a4, v12, a6, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v12;
  }

  return v20;
}

- (ICTK2TextView)tk2TextView
{
  return self->_tk2TextView;
}

void __74__ICTK2NoteEditorViewController_textStorageDidUpdateDataDetectionResults___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "authorHighlightsController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_range");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performHighlightUpdatesForRange:inTextStorage:updates:", v3, v5, v6, 0);

}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_5(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  BOOL v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "attachmentType") == 10)
  {
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = v6;
  }
  else
  {
    v5 = objc_msgSend(v6, "attachmentType") == 13;
    v4 = v6;
    if (!v5)
      goto LABEL_7;
    v3 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *v3 = 1;
LABEL_7:

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTK2NoteEditorViewController;
  -[ICNoteEditorViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_textStorageDidUpdateDataDetectionResults_, *MEMORY[0x1E0D64A98], 0);

}

- (void)textStorageDidUpdateDataDetectionResults:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2NoteEditorViewController textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    dispatchMainAfterDelay();
}

- (id)textController
{
  void *v2;
  void *v3;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tk2TextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTk2TextView:(id)a3
{
  objc_storeStrong((id *)&self->_tk2TextView, a3);
}

- (void)setTk2AttributionSidebarController:(id)a3
{
  objc_storeStrong((id *)&self->_tk2AttributionSidebarController, a3);
}

- (void)setTextViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, a3);
}

- (void)setAuthorHighlightsController:(id)a3
{
  id v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  -[ICNoteEditorViewController authorHighlightsController](self, "authorHighlightsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (uint64_t *)MEMORY[0x1E0D648F8];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *v6;
    -[ICNoteEditorViewController authorHighlightsController](self, "authorHighlightsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

  }
  v14.receiver = self;
  v14.super_class = (Class)ICTK2NoteEditorViewController;
  -[ICNoteEditorViewController setAuthorHighlightsController:](&v14, sel_setAuthorHighlightsController_, v4);
  -[ICNoteEditorViewController authorHighlightsController](self, "authorHighlightsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *v6;
    -[ICNoteEditorViewController authorHighlightsController](self, "authorHighlightsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_authorHighlightsControllerDidPerformHighlightUpdates_, v12, v13);

  }
}

- (id)nibName
{
  return CFSTR("ICNoteEditorViewController");
}

- (id)attributionSidebarView
{
  void *v2;
  void *v3;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionSidebarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTK2NoteEditorViewController;
  -[ICNoteEditorViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionSidebarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unfocusAttributionDetails");

  -[ICTK2NoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideSidebarAnimated:", 0);

}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke(uint64_t a1, uint64_t a2, int a3, double a4, double a5)
{
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  void (**v26)(void *, uint64_t);
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33[2];
  _QWORD aBlock[4];
  id v35;
  id v36[2];
  BOOL v37;
  char v38;

  v10 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tk2TextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributionSidebarView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v10);
  objc_msgSend(v14, "attributionSidebarOpenedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceNow");
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 32), "attributionSidebarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "visibleContentWidth");
  if (a4 != 0.0 || v19 <= 0.0)
    goto LABEL_7;
  if (v17 < 0.0)
    v17 = -v17;

  if (v17 > 2.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v10);
    objc_msgSend(v20, "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLastAttributionsViewedDate:", v18);

LABEL_7:
  }
  objc_msgSend(v13, "fullContentWidth");
  v23 = v22 == a4;
  v24 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_2;
  aBlock[3] = &unk_1EA7E09A0;
  objc_copyWeak(v36, v10);
  v37 = v23;
  v36[1] = *(id *)&a4;
  v25 = v13;
  v35 = v25;
  v38 = a2;
  v26 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  objc_msgSend(v25, "setVisibleContentWidth:isGestureActive:", a2, a4);
  if (a3)
  {
    v27 = 1.0;
    if (a5 > 0.0)
    {
      objc_msgSend(v25, "visibleContentWidth");
      v27 = (a4 - v28) / a5;
    }
    v29 = (void *)MEMORY[0x1E0DC3F10];
    v32[0] = v24;
    v32[1] = 3221225472;
    v32[2] = __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_3;
    v32[3] = &unk_1EA7E09C8;
    objc_copyWeak(v33, v10);
    v33[1] = *(id *)&a4;
    objc_msgSend(v29, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v32, v26, 0.3, 0.0, 0.65, v27);
    objc_destroyWeak(v33);
  }
  else
  {
    v30 = objc_loadWeakRetained(v10);
    objc_msgSend(v30, "textViewLeadingConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setConstant:", a4);

    v26[2](v26, 1);
  }

  objc_destroyWeak(v36);
}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unclampTextView");

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setAttributionSidebarOpenedDate:", v5);

    v7 = objc_loadWeakRetained(v2);
    v8 = v7;
    v9 = 1;
LABEL_5:
    objc_msgSend(v7, "setIgnoresTaps:", v9);

    goto LABEL_6;
  }
  if (*(double *)(a1 + 48) == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "reload");
    v7 = objc_loadWeakRetained(v2);
    v8 = v7;
    v9 = 0;
    goto LABEL_5;
  }
LABEL_6:
  v10 = *(_BYTE *)(a1 + 57) == 0;
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "tk2TextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", v10);

}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_3(uint64_t a1)
{
  double v1;
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v1 = *(double *)(a1 + 40);
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "textViewLeadingConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v1);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

void __49__ICTK2NoteEditorViewController_recreateTextView__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculateDocumentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleUpdateAffectingChangeCounts:", 0);

  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "calculateAccessibilityController");

}

- (void)removeTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ICTK2NoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33A0], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B8], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B0], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("ICNoteEditorTitleEditingViewDidShowNotification"), 0);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICNoteEditorViewController previousNote](self, "previousNote", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allDocumentMergeControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        -[ICTK2NoteEditorViewController textView](self, "textView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeTextView:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[ICTK2NoteEditorViewController textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", 0);

  -[ICTK2NoteEditorViewController textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeFromSuperview");

}

- (BOOL)shouldRenderAuthorHighlights
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasHighlights") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calculateDocumentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "hasExpressions");

  }
  return v4;
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icTextLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (BOOL)textView:(id)a3 isEndOfDocument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "offsetFromPosition:toPosition:", v8, v7);

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textContentStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "outlineController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "visibleRange");
  v15 = v14;

  if (v9 >= v15 + v13 - 1)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v6, "endOfDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "isEqual:", v16);

  }
  return v17;
}

- (void)acceleratorOriginNeedsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRectForPosition:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2NoteEditorViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toView:", v16, v7, v9, v11, v13);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateAcceleratorOriginWith:", v18, v20, v22, v24);

}

- (BOOL)languageHasSpaces
{
  void *v2;
  char v3;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "languageHasSpaces");

  return v3;
}

- (int64_t)writingDirection
{
  void *v2;
  int64_t v3;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_currentWritingDirection");

  return v3;
}

- (_NSRange)lastSelectedRangeForAccelerator
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)authorHighlightsControllerDidPerformHighlightUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D64908]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
    -[ICTK2NoteEditorViewController renderAuthorHighlights](self, "renderAuthorHighlights");

}

- (void)renderAuthorHighlights
{
  Class v3;
  Class v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = NSClassFromString(CFSTR("_UITextContainerView"));
  v4 = NSClassFromString(CFSTR("_UITextLayoutCanvasView"));
  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_firstObjectOfClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_firstObjectOfClass:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v9, "subviews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setNeedsDisplay");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (int64_t)uniqueCollapsibleSectionAffordanceExposures
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outlineRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collapsibleSectionAffordanceExposures");

  return v4;
}

- (int64_t)uniqueCollapsibleSectionAffordanceUsages
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outlineRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collapsibleSectionAffordanceUsages");

  return v4;
}

- (void)resetCollapsibleSectionAffordanceUsageData
{
  void *v2;
  id v3;

  -[ICTK2NoteEditorViewController tk2TextView](self, "tk2TextView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outlineRenderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetCollapsibleSectionsAffordanceUsageData");

}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (NSDate)attributionSidebarOpenedDate
{
  return self->_attributionSidebarOpenedDate;
}

- (void)setAttributionSidebarOpenedDate:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarOpenedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarOpenedDate, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_tk2AttributionSidebarController, 0);
  objc_storeStrong((id *)&self->_tk2TextView, 0);
}

@end
