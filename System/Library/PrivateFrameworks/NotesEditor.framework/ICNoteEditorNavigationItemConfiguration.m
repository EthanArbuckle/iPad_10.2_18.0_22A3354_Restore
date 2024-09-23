@implementation ICNoteEditorNavigationItemConfiguration

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  unint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[34];

  v62[32] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddChecklist](self, "canAddChecklist"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v60;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddMedia](self, "canAddMedia"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddNote](self, "canAddNote"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v57;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddTable](self, "canAddTable"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v56;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canChangeStyle](self, "canChangeStyle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v55;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canInlineSketch](self, "canInlineSketch"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v54;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canRedo](self, "canRedo"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v53;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canSaveQuickNote](self, "canSaveQuickNote"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v52;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShare](self, "canShare"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v51;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShowPillOrnament](self, "canShowPillOrnament"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShowUndoRedo](self, "canShowUndoRedo"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v49;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canUndo](self, "canUndo"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration hidesBackButton](self, "hidesBackButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v47;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration hidesDefaultCenterItems](self, "hidesDefaultCenterItems"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v46;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v45;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isDeleted](self, "isDeleted"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v44;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[16] = v43;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isInTripleColumnSplitView](self, "isInTripleColumnSplitView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[17] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isTableSelected](self, "isTableSelected"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[18] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[19] = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isEditingTable](self, "isEditingTable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[20] = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[21] = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isInSecureScreen](self, "isInSecureScreen"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v62[22] = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration lockState](self, "lockState"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[23] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[24] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration showsDoneWhileEditing](self, "showsDoneWhileEditing"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v62[25] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesCustomBackButton](self, "usesCustomBackButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v62[26] = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesMediaMenu](self, "usesMediaMenu"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[27] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v62[28] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesSidecarMenu](self, "usesSidecarMenu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62[29] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesStyleMenu](self, "usesStyleMenu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v62[30] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesOnlyTrailingInputAssistantItems](self, "usesOnlyTrailingInputAssistantItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62[31] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 32);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 31;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "integerValue") < 0)
        break;
      v9 += v10 + v10 * objc_msgSend(v11, "unsignedIntegerValue");

      ++v8;
      v10 += 31;
      if (v8 >= objc_msgSend(v7, "count"))
        goto LABEL_8;
    }

  }
  v9 = 0;
LABEL_8:

  -[ICNoteEditorNavigationItemConfiguration checklistAccessibilityValue](self, "checklistAccessibilityValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "hash");

  }
  -[ICNoteEditorNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v61, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hash");

  }
  -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hash");

  }
  -[ICNoteEditorNavigationItemConfiguration inputAccessoryToolbar](self, "inputAccessoryToolbar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hash");

  }
  -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = v16;
    v28 = v13;
    v13 = (uint64_t)v12;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hash");

    v12 = (void *)v13;
    LOBYTE(v13) = v28;
    v16 = v59;
  }
  v30 = ICHashWithHashKeys(v9, v21, v22, v23, v24, v25, v26, v27, v13);

  return v30;
}

- (BOOL)usesUndoRedoMenu
{
  void *v4;
  BOOL v5;

  if (!-[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact")
    || -[ICNoteEditorNavigationItemConfiguration isLandscape](self, "isLandscape"))
  {
    return -[ICNoteEditorNavigationItemConfiguration isInTripleColumnSplitView](self, "isInTripleColumnSplitView");
  }
  -[ICNoteEditorNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4
    || -[ICNoteEditorNavigationItemConfiguration isAccessibilityTextSizeEnabled](self, "isAccessibilityTextSizeEnabled")
    || -[ICNoteEditorNavigationItemConfiguration isInTripleColumnSplitView](self, "isInTripleColumnSplitView");

  return v5;
}

- (BOOL)usesStyleMenu
{
  return self->_usesStyleMenu;
}

- (BOOL)usesSidecarMenu
{
  return self->_usesSidecarMenu;
}

- (BOOL)usesPillOrnament
{
  return self->_usesPillOrnament;
}

- (BOOL)usesOnlyTrailingInputAssistantItems
{
  return self->_usesOnlyTrailingInputAssistantItems;
}

- (BOOL)usesMediaMenu
{
  return self->_usesMediaMenu;
}

- (void)updateToolbarVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v3 = a3;
  -[ICNoteEditorNavigationItemConfiguration navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isToolbarHidden");

  v7 = -[ICNoteEditorNavigationItemConfiguration canShowToolbar](self, "canShowToolbar");
  if (v6 == v7)
  {
    v8 = v7;
    -[ICNoteEditorNavigationItemConfiguration navigationController](self, "navigationController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToolbarHidden:animated:", v8 ^ 1u, v3);

  }
}

- (void)updateTitlesAndImages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;

  -[ICNoteEditorNavigationItemConfiguration checklistAccessibilityValue](self, "checklistAccessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v3);

  switch(-[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState"))
  {
    case 0uLL:
      v5 = (void *)MEMORY[0x1E0DC3870];
      goto LABEL_6;
    case 1uLL:
      v12 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:withConfiguration:", CFSTR("pencil.tip.crop.circle.fill"), v13, v14);
      v92 = (id)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorNavigationItemConfiguration inlineSketchAnimationSelectorDelayer](self, "inlineSketchAnimationSelectorDelayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelPreviousFireRequests");
      goto LABEL_9;
    case 2uLL:
      v6 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageNamed:inBundle:withConfiguration:", CFSTR("pencil.tip.crop.circle.fill"), v7, v8);
      v92 = (id)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorNavigationItemConfiguration inlineSketchAnimationSelectorDelayer](self, "inlineSketchAnimationSelectorDelayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestFire");
LABEL_9:

      break;
    case 3uLL:
      v10 = -[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact");
      v11 = (void *)MEMORY[0x1E0DC3870];
      if (v10)
      {
        v5 = (void *)MEMORY[0x1E0DC3870];
LABEL_6:
        objc_msgSend(v5, "systemImageNamed:", CFSTR("pencil.tip.crop.circle"));
        v92 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageNamed:inBundle:withConfiguration:", CFSTR("pencil.tip.crop.circle.on"), v15, v16);
        v92 = (id)objc_claimAutoreleasedReturnValue();

      }
      break;
    default:
      v92 = 0;
      break;
  }
  -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v92);

  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItemMenu](self, "mediaBarButtonItemMenu");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v18)
  {
    if (v19)
      v22 = CFSTR("Add files, media, and more");
    else
      v22 = CFSTR("Attachments");
    objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1EA7E9860, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v23);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("paperclip"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setImage:", v25);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1EA7E9860, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAccessibilityLabel:", v28);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = CFSTR("Double tap to add a photo or scan a document into the current note.");
  }
  else
  {
    if (v19)
      v33 = CFSTR("Open the photo library");
    else
      v33 = CFSTR("Photo Library");
    objc_msgSend(v20, "localizedStringForKey:value:table:", v33, &stru_1EA7E9860, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTitle:", v23);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImage:", v35);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Photo Library"), &stru_1EA7E9860, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAccessibilityLabel:", v38);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = CFSTR("Double tap to add a photo into the current note.");
  }
  objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_1EA7E9860, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAccessibilityHint:", v40);

  if (-[ICNoteEditorNavigationItemConfiguration isEditingTable](self, "isEditingTable"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Table Actions"), &stru_1EA7E9860, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTitle:", v43);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("table.badge.more"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setImage:", v45);

    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setImageInsets:", 0.0, -5.0, 0.0, -5.0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Table Actions"), &stru_1EA7E9860, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAccessibilityLabel:", v49);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Double tap to show the table actions menu."), &stru_1EA7E9860, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setAccessibilityHint:", v52);
  }
  else
  {
    v54 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v54)
      v57 = CFSTR("Add a table");
    else
      v57 = CFSTR("Table");
    objc_msgSend(v55, "localizedStringForKey:value:table:", v57, &stru_1EA7E9860, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setTitle:", v51);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("table"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setImage:", v59);

    v61 = *MEMORY[0x1E0DC49E8];
    v62 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v63 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v64 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setImageInsets:", v61, v62, v63, v64);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Table"), &stru_1EA7E9860, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setAccessibilityLabel:", v67);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Double tap to add a table to the current note."), &stru_1EA7E9860, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setAccessibilityHint:", v53);

  }
  v70 = -[ICNoteEditorNavigationItemConfiguration lockState](self, "lockState");
  if (v70 < 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setImage:", v71);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Lock Note"), &stru_1EA7E9860, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTitle:", v74);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("Locked"), &stru_1EA7E9860, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setAccessibilityLabel:", v77);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v79;
    v81 = CFSTR("Double tap to open your locked notes");
LABEL_30:
    objc_msgSend(v79, "localizedStringForKey:value:table:", v81, &stru_1EA7E9860, 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setAccessibilityHint:", v90);

    goto LABEL_31;
  }
  if (v70 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.open"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setImage:", v82);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("Unlock Note"), &stru_1EA7E9860, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setTitle:", v85);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("Unlocked"), &stru_1EA7E9860, 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setAccessibilityLabel:", v88);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v79;
    v81 = CFSTR("Double tap to close your locked notes");
    goto LABEL_30;
  }
LABEL_31:

}

- (void)updateMenus
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItemMenu](self, "mediaBarButtonItemMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = sel_photoLibraryAction_;
  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAction:", v4);

  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItemMenu](self, "mediaBarButtonItemMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenu:", v6);

  if (-[ICNoteEditorNavigationItemConfiguration isEditingTable](self, "isEditingTable"))
    v8 = 0;
  else
    v8 = sel_tableAction_;
  -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAction:", v8);

  v10 = -[ICNoteEditorNavigationItemConfiguration isEditingTable](self, "isEditingTable");
  if (v10)
  {
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItemMenu](self, "tableBarButtonItemMenu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMenu:", v11);

  if (v10)
  v13 = -[ICNoteEditorNavigationItemConfiguration usesStyleMenu](self, "usesStyleMenu");
  -[ICNoteEditorNavigationItemConfiguration styleSelectorViewController](self, "styleSelectorViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
    objc_msgSend(v14, "makeInlineMenu");
  else
    objc_msgSend(v14, "makeShortcutMenu");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMenu:", v22);

  objc_opt_class();
  -[ICNoteEditorNavigationItemConfiguration undoBarButtonItem](self, "undoBarButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "customView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICNoteEditorNavigationItemConfiguration usesUndoRedoMenu](self, "usesUndoRedoMenu"))
  {
    -[ICNoteEditorNavigationItemConfiguration undoRedoMenu](self, "undoRedoMenu");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMenu:", v20);

  }
  else
  {
    objc_msgSend(v19, "setMenu:", 0);
  }
  if (-[ICNoteEditorNavigationItemConfiguration usesUndoRedoMenu](self, "usesUndoRedoMenu"))
    v21 = -[ICNoteEditorNavigationItemConfiguration canUndo](self, "canUndo") ^ 1;
  else
    v21 = 0;
  objc_msgSend(v19, "setShowsMenuAsPrimaryAction:", v21);

}

- (void)updateEnabled
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;

  v3 = -[ICNoteEditorNavigationItemConfiguration canAddNote](self, "canAddNote");
  -[ICNoteEditorNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  v5 = -[ICNoteEditorNavigationItemConfiguration canAddChecklist](self, "canAddChecklist");
  -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  v7 = -[ICNoteEditorNavigationItemConfiguration canInlineSketch](self, "canInlineSketch");
  -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  v9 = -[ICNoteEditorNavigationItemConfiguration canAddMedia](self, "canAddMedia");
  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v9);

  v11 = -[ICNoteEditorNavigationItemConfiguration canSaveQuickNote](self, "canSaveQuickNote");
  -[ICNoteEditorNavigationItemConfiguration quickNoteSaveBarButtonItem](self, "quickNoteSaveBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v11);

  v13 = -[ICNoteEditorNavigationItemConfiguration canRedo](self, "canRedo");
  -[ICNoteEditorNavigationItemConfiguration redoBarButtonItem](self, "redoBarButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", v13);

  v15 = -[ICNoteEditorNavigationItemConfiguration canShare](self, "canShare");
  -[ICNoteEditorNavigationItemConfiguration shareBarButtonItem](self, "shareBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v15);

  v17 = -[ICNoteEditorNavigationItemConfiguration canChangeStyle](self, "canChangeStyle");
  -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", v17);

  v19 = -[ICNoteEditorNavigationItemConfiguration canAddTable](self, "canAddTable");
  -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEnabled:", v19);

  v21 = -[ICNoteEditorNavigationItemConfiguration canUndo](self, "canUndo")
     || -[ICNoteEditorNavigationItemConfiguration usesUndoRedoMenu](self, "usesUndoRedoMenu");
  -[ICNoteEditorNavigationItemConfiguration undoBarButtonItem](self, "undoBarButtonItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEnabled:", v21);

  v23 = -[ICNoteEditorNavigationItemConfiguration canUndo](self, "canUndo") ^ 1;
  -[ICNoteEditorNavigationItemConfiguration undoMenuItem](self, "undoMenuItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setIc_disabled:", v23);

  v25 = -[ICNoteEditorNavigationItemConfiguration canRedo](self, "canRedo") ^ 1;
  -[ICNoteEditorNavigationItemConfiguration redoMenuItem](self, "redoMenuItem");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIc_disabled:", v25);

}

- (void)updateCompactAnimated:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  ICNoteEditorPillOrnamentBarButtonItem *checklistBarButtonItem;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  ICNoteEditorPillOrnamentBarButtonItem *mediaBarButtonItem;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  ICNoteEditorPillOrnamentBarButtonItem *inlineSketchBarButtonItem;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  unsigned int v145;
  unsigned int v146;
  void *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _QWORD v153[12];
  _QWORD v154[3];

  v4 = a3;
  v154[1] = *MEMORY[0x1E0C80C00];
  v6 = -[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState");
  if (-[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType") == 2 && v6 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("New Quick Note"), &stru_1EA7E9860, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  if (v7)
  {

  }
  v10 = -[ICNoteEditorNavigationItemConfiguration isDeleted](self, "isDeleted");
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStyle:", v10);

  v12 = -[ICNoteEditorNavigationItemConfiguration hidesBackButton](self, "hidesBackButton")
     || -[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType") != 0;
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidesBackButton:", v12);

  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLeftItemsSupplementBackButton:", 1);

  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLeadingItemGroups:", MEMORY[0x1E0C9AA60]);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType") != 2 || v6 == 3)
  {
    if (-[ICNoteEditorNavigationItemConfiguration isInSecureScreen](self, "isInSecureScreen"))
    {
      -[ICNoteEditorNavigationItemConfiguration quickNoteAllNotesBarButtonItem](self, "quickNoteAllNotesBarButtonItem");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType") != 1)
        goto LABEL_18;
      -[ICNoteEditorNavigationItemConfiguration closeAuxiliaryWindowBarButtonItem](self, "closeAuxiliaryWindowBarButtonItem");
      v17 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[ICNoteEditorNavigationItemConfiguration quickNoteCancelBarButtonItem](self, "quickNoteCancelBarButtonItem");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(v16, "addObject:", v17);

LABEL_18:
  if (-[ICNoteEditorNavigationItemConfiguration showsSidebarButton](self, "showsSidebarButton"))
  {
    -[ICNoteEditorNavigationItemConfiguration sidebarButtonItem](self, "sidebarButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

  }
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v20, "setLeftBarButtonItems:animated:", v21, v4);

  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenterItemGroups:", MEMORY[0x1E0C9AA60]);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICNoteEditorNavigationItemConfiguration canShowUndoRedo](self, "canShowUndoRedo"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration undoBarButtonItem](self, "undoBarButtonItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v25);

    if (!-[ICNoteEditorNavigationItemConfiguration usesUndoRedoMenu](self, "usesUndoRedoMenu"))
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 20.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v26);

      -[ICNoteEditorNavigationItemConfiguration redoBarButtonItem](self, "redoBarButtonItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v27);

    }
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 20.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v28);

    v29 = objc_alloc(MEMORY[0x1E0DC3500]);
    v30 = (void *)objc_msgSend(v24, "copy");
    v31 = (void *)objc_msgSend(v29, "initWithBarButtonItems:representativeItem:", v30, 0);

    objc_msgSend(v23, "addObject:", v31);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType") == 2 && v6 != 3)
  {
    -[ICNoteEditorNavigationItemConfiguration quickNoteSaveBarButtonItem](self, "quickNoteSaveBarButtonItem");
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_34:
    v37 = (void *)v33;
    objc_msgSend(v32, "addObject:", v33);

    goto LABEL_35;
  }
  if (!-[ICNoteEditorNavigationItemConfiguration isDeleted](self, "isDeleted") && v6 != 3)
  {
    -[ICNoteEditorNavigationItemConfiguration shareBarButtonItem](self, "shareBarButtonItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v34);

    -[ICNoteEditorNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[ICNoteEditorNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v36);

    }
  }
  if (-[ICNoteEditorNavigationItemConfiguration lockState](self, "lockState") && v6 != 3)
  {
    -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_35:
  if (objc_msgSend(v32, "count"))
  {
    v38 = objc_alloc(MEMORY[0x1E0DC3500]);
    v39 = (void *)objc_msgSend(v32, "copy");
    v40 = (void *)objc_msgSend(v38, "initWithBarButtonItems:representativeItem:", v39, 0);

    objc_msgSend(v23, "addObject:", v40);
  }
  v41 = (void *)objc_msgSend(v23, "copy");
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTrailingItemGroups:", v41);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing")
    && -[ICNoteEditorNavigationItemConfiguration showsDoneWhileEditing](self, "showsDoneWhileEditing")
    || v6 == 3)
  {
    -[ICNoteEditorNavigationItemConfiguration doneBarButtonItem](self, "doneBarButtonItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "addObject:", v43);

  }
  v44 = objc_alloc(MEMORY[0x1E0DC3500]);
  v45 = (void *)objc_msgSend(v147, "copy");
  v46 = (void *)objc_msgSend(v44, "initWithBarButtonItems:representativeItem:", v45, 0);
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setPinnedTrailingGroup:", v46);

  -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    if (-[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing"))
    {

    }
    else
    {
      v50 = -[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType");

      if (v50 != 1)
        goto LABEL_54;
    }
    v145 = v4;
    v143 = v23;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[ICNoteEditorNavigationItemConfiguration usesOnlyTrailingInputAssistantItems](self, "usesOnlyTrailingInputAssistantItems"))
    {
      -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v52);

      -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v53);

    }
    v54 = (void *)objc_msgSend(v51, "copy");
    -[ICNoteEditorNavigationItemConfiguration inputAssistantLeadingBarButtonItemGroup](self, "inputAssistantLeadingBarButtonItemGroup");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setBarButtonItems:", v54);

    -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingBarButtonGroups");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration inputAssistantLeadingBarButtonItemGroup](self, "inputAssistantLeadingBarButtonItemGroup");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "containsObject:", v58);

    if ((v59 & 1) == 0)
    {
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_setMarginOverride:", 11.0);

      NSStringFromSelector(sel_leadingBarButtonGroups);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "willChangeValueForKey:", v61);

      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "leadingBarButtonGroups");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantLeadingBarButtonItemGroup](self, "inputAssistantLeadingBarButtonItemGroup");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "arrayByAddingObject:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v67 = v32;
      v68 = v16;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setLeadingBarButtonGroups:", v66);

      v16 = v68;
      v32 = v67;

      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "didChangeValueForKey:", v61);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICNoteEditorNavigationItemConfiguration usesOnlyTrailingInputAssistantItems](self, "usesOnlyTrailingInputAssistantItems"))
    {
      -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addObject:", v72);

      -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addObject:", v73);

    }
    -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v74);

    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v75);

    -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v76);

    v77 = (void *)objc_msgSend(v71, "copy");
    -[ICNoteEditorNavigationItemConfiguration inputAssistantTrailingBarButtonItemGroup](self, "inputAssistantTrailingBarButtonItemGroup");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setBarButtonItems:", v77);

    -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "trailingBarButtonGroups");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration inputAssistantTrailingBarButtonItemGroup](self, "inputAssistantTrailingBarButtonItemGroup");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "containsObject:", v81);

    if ((v82 & 1) == 0)
    {
      NSStringFromSelector(sel_trailingBarButtonGroups);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "willChangeValueForKey:", v83);

      -[ICNoteEditorNavigationItemConfiguration inputAssistantTrailingBarButtonItemGroup](self, "inputAssistantTrailingBarButtonItemGroup");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v154[0] = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setTrailingBarButtonGroups:", v86);

      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "didChangeValueForKey:", v83);

    }
    v23 = v143;
    v4 = v145;
  }
LABEL_54:
  -[ICNoteEditorNavigationItemConfiguration inputAccessoryToolbar](self, "inputAccessoryToolbar");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    if (-[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing")
      && !-[ICNoteEditorNavigationItemConfiguration isTableSelected](self, "isTableSelected"))
    {
      v141 = v32;
      v142 = v16;
      v144 = v23;
      v146 = v4;
      if (-[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType") == 2)
      {
        -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "items");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v92, "containsObject:", v93);

        if (v94)
        {
          checklistBarButtonItem = self->_checklistBarButtonItem;
          self->_checklistBarButtonItem = 0;

        }
        -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "items");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = objc_msgSend(v97, "containsObject:", v98);

        if (v99)
        {
          mediaBarButtonItem = self->_mediaBarButtonItem;
          self->_mediaBarButtonItem = 0;

        }
        -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "items");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v102, "containsObject:", v103);

        if (v104)
        {
          inlineSketchBarButtonItem = self->_inlineSketchBarButtonItem;
          self->_inlineSketchBarButtonItem = 0;

        }
      }
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v153[0] = v140;
      -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v153[1] = v139;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v153[2] = v138;
      -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v153[3] = v137;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v153[4] = v106;
      -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v153[5] = v107;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v153[6] = v108;
      -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v153[7] = v109;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v153[8] = v110;
      -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v153[9] = v111;
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 42.0);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v153[10] = v112;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v153[11] = v113;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 12);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorNavigationItemConfiguration inputAccessoryToolbar](self, "inputAccessoryToolbar");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "setItems:", v90);

      v4 = v146;
      v16 = v142;
      v23 = v144;
      v32 = v141;
    }
    else
    {
      -[ICNoteEditorNavigationItemConfiguration inputAccessoryToolbar](self, "inputAccessoryToolbar");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setItems:", MEMORY[0x1E0C9AA60]);
    }

  }
  -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICNoteEditorNavigationItemConfiguration isDeleted](self, "isDeleted"))
    {
      -[ICNoteEditorNavigationItemConfiguration deleteBarButtonItem](self, "deleteBarButtonItem");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v117);

      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v118);

      -[ICNoteEditorNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem");
      v119 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing")
        && !-[ICNoteEditorNavigationItemConfiguration isTableSelected](self, "isTableSelected"))
      {
        goto LABEL_74;
      }
      -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v120);

      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v121);

      -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v122);

      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "addObject:", v123);

      -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
      v119 = objc_claimAutoreleasedReturnValue();
    }
    v124 = (void *)v119;
    objc_msgSend(v116, "addObject:", v119);

    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v125);

    -[ICNoteEditorNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v126);

LABEL_74:
    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v127 = v116;
    v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v148, v152, 16);
    if (v128)
    {
      v129 = v128;
      v130 = *(_QWORD *)v149;
      do
      {
        v131 = 0;
        do
        {
          if (*(_QWORD *)v149 != v130)
            objc_enumerationMutation(v127);
          objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * v131++), "setTintColor:", 0);
        }
        while (v129 != v131);
        v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v148, v152, 16);
      }
      while (v129);
    }

    -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setHidden:", 0);

    -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (void *)objc_msgSend(v127, "copy");
    objc_msgSend(v133, "setItems:animated:", v134, v4);

  }
  -[ICNoteEditorNavigationItemConfiguration pillOrnamentViewController](self, "pillOrnamentViewController");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setToolbarItems:", MEMORY[0x1E0C9AA60]);

  -[ICNoteEditorNavigationItemConfiguration pillOrnamentViewController](self, "pillOrnamentViewController");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "hide");

}

- (BOOL)updateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v7;

  v3 = a3;
  v5 = -[ICNavigationItemConfiguration needsUpdate](self, "needsUpdate");
  if (v5)
  {
    -[ICNoteEditorNavigationItemConfiguration updateToolbarVisibilityAnimated:](self, "updateToolbarVisibilityAnimated:", v3);
    if (-[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact"))
      -[ICNoteEditorNavigationItemConfiguration updateCompactAnimated:](self, "updateCompactAnimated:", v3);
    else
      -[ICNoteEditorNavigationItemConfiguration updateRegularAnimated:](self, "updateRegularAnimated:", v3);
    -[ICNoteEditorNavigationItemConfiguration updateEnabled](self, "updateEnabled");
    -[ICNoteEditorNavigationItemConfiguration updateMenus](self, "updateMenus");
    -[ICNoteEditorNavigationItemConfiguration updateTitlesAndImages](self, "updateTitlesAndImages");
    v7.receiver = self;
    v7.super_class = (Class)ICNoteEditorNavigationItemConfiguration;
    LOBYTE(v5) = -[ICNavigationItemConfiguration updateAnimated:](&v7, sel_updateAnimated_, v3);
  }
  return v5;
}

- (id)undoRedoButtonWithImageName:(id)a3 title:(id)a4 selector:(SEL)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0DC3520];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "plainButtonConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:", v12);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsLargeContentViewer:", 1);
  objc_msgSend(v13, "setLargeContentTitle:", v9);

  objc_msgSend(v13, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, a5, 0x2000);

  return v13;
}

- (UIAction)undoMenuItem
{
  return self->_undoMenuItem;
}

- (ICNoteEditorPillOrnamentBarButtonItem)undoBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *undoBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v3;
  void *v5;
  void *v6;
  ICNoteEditorPillOrnamentBarButtonItem *v7;
  void *v8;
  ICNoteEditorPillOrnamentBarButtonItem *v9;
  ICNoteEditorPillOrnamentBarButtonItem *v10;
  void *v11;
  ICNoteEditorPillOrnamentBarButtonItem *v12;
  ICNoteEditorPillOrnamentBarButtonItem *v13;

  undoBarButtonItem = self->_undoBarButtonItem;
  if (undoBarButtonItem)
  {
    v3 = undoBarButtonItem;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Undo"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"))
    {
      v7 = [ICNoteEditorPillOrnamentBarButtonItem alloc];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.backward"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:](v7, "initWithTitle:image:target:action:menu:", v6, v8, self, sel_undoAction_, 0);
      v10 = self->_undoBarButtonItem;
      self->_undoBarButtonItem = v9;

      -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_undoBarButtonItem, "setUsedInPillOrnament:", 1);
    }
    else
    {
      -[ICNoteEditorNavigationItemConfiguration undoRedoButtonWithImageName:title:selector:](self, "undoRedoButtonWithImageName:title:selector:", CFSTR("arrow.uturn.backward.circle"), v6, sel_undoAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ICNoteEditorPillOrnamentBarButtonItem initWithCustomView:]([ICNoteEditorPillOrnamentBarButtonItem alloc], "initWithCustomView:", v11);
      v13 = self->_undoBarButtonItem;
      self->_undoBarButtonItem = v12;

    }
    -[ICNoteEditorPillOrnamentBarButtonItem setTitle:](self->_undoBarButtonItem, "setTitle:", v6);
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityLabel:](self->_undoBarButtonItem, "setAccessibilityLabel:", v6);
    v3 = self->_undoBarButtonItem;

  }
  return v3;
}

- (UIToolbar)toolbar
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationToolbar:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIToolbar *)v4;
}

- (ICNoteEditorPillOrnamentBarButtonItem)tableBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *tableBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  ICNoteEditorPillOrnamentBarButtonItem *v11;
  ICNoteEditorPillOrnamentBarButtonItem *v12;

  tableBarButtonItem = self->_tableBarButtonItem;
  if (tableBarButtonItem)
  {
    v3 = tableBarButtonItem;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("table"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = CFSTR("Add a table");
    else
      v9 = CFSTR("Table");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:]([ICNoteEditorPillOrnamentBarButtonItem alloc], "initWithTitle:image:target:action:menu:", v10, v5, self, sel_tableAction_, 0);
    v12 = self->_tableBarButtonItem;
    self->_tableBarButtonItem = v11;

    -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_tableBarButtonItem, "setUsedInPillOrnament:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
    v3 = self->_tableBarButtonItem;

  }
  return v3;
}

- (ICStyleSelectorViewController)styleSelectorViewController
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationStyleSelectorViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICStyleSelectorViewController *)v4;
}

- (ICNoteEditorPillOrnamentBarButtonItem)styleBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *styleBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  ICNoteEditorPillOrnamentBarButtonItem *v11;
  char *v12;
  ICNoteEditorPillOrnamentBarButtonItem *v13;
  ICNoteEditorPillOrnamentBarButtonItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  styleBarButtonItem = self->_styleBarButtonItem;
  if (styleBarButtonItem)
  {
    v3 = styleBarButtonItem;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat.alt"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = CFSTR("Choose a style to apply to text");
    else
      v9 = CFSTR("Format");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [ICNoteEditorPillOrnamentBarButtonItem alloc];
    if (-[ICNoteEditorNavigationItemConfiguration usesStyleMenu](self, "usesStyleMenu"))
      v12 = 0;
    else
      v12 = sel_styleAction_;
    v13 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:](v11, "initWithTitle:image:target:action:menu:", v10, v5, self, v12, 0);
    v14 = self->_styleBarButtonItem;
    self->_styleBarButtonItem = v13;

    -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_styleBarButtonItem, "setUsedInPillOrnament:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Format"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityLabel:](self->_styleBarButtonItem, "setAccessibilityLabel:", v16);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Double tap to choose a style to apply to text."), &stru_1EA7E9860, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityHint:](self->_styleBarButtonItem, "setAccessibilityHint:", v18);

    v3 = self->_styleBarButtonItem;
  }
  return v3;
}

- (ICSidecarInsertMenuController)sidecarMenuController
{
  ICSidecarInsertMenuController *v3;
  ICSidecarInsertMenuController *sidecarMenuController;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[ICNoteEditorNavigationItemConfiguration usesSidecarMenu](self, "usesSidecarMenu")
    && !self->_sidecarMenuController)
  {
    v3 = objc_alloc_init(ICSidecarInsertMenuController);
    sidecarMenuController = self->_sidecarMenuController;
    self->_sidecarMenuController = v3;

    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke;
    v11[3] = &unk_1EA7DD6B8;
    objc_copyWeak(&v12, &location);
    -[ICSidecarInsertMenuController setMenuDidChange:](self->_sidecarMenuController, "setMenuDidChange:", v11);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke_2;
    v9[3] = &unk_1EA7DF2B8;
    objc_copyWeak(&v10, &location);
    -[ICSidecarInsertMenuController setDidReceiveItems:](self->_sidecarMenuController, "setDidReceiveItems:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSidecarInsertMenuController setPresentingViewController:](self->_sidecarMenuController, "setPresentingViewController:", v6);

  -[ICNoteEditorNavigationItemConfiguration presentingSourceView](self, "presentingSourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSidecarInsertMenuController setPresentingSourceView:](self->_sidecarMenuController, "setPresentingSourceView:", v7);

  return self->_sidecarMenuController;
}

- (BOOL)showsDoneWhileEditing
{
  return self->_showsDoneWhileEditing;
}

- (UIBarButtonItem)shareBarButtonItem
{
  UIBarButtonItem *shareBarButtonItem;
  UIBarButtonItem *v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  shareBarButtonItem = self->_shareBarButtonItem;
  if (shareBarButtonItem)
  {
    v3 = shareBarButtonItem;
  }
  else
  {
    v5 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("Share this note");
    else
      v8 = CFSTR("Share");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA7E9860, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIBarButtonItem *)objc_msgSend(v10, "initWithTitle:image:target:action:menu:", v9, v11, self, sel_shareAction_, 0);
    v13 = self->_shareBarButtonItem;
    self->_shareBarButtonItem = v12;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1EA7E9860, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_shareBarButtonItem, "setAccessibilityLabel:", v15);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Double tap to add people to the current note"), &stru_1EA7E9860, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_shareBarButtonItem, "setAccessibilityHint:", v17);

    v3 = self->_shareBarButtonItem;
  }
  return v3;
}

- (void)setUsesStyleMenu:(BOOL)a3
{
  self->_usesStyleMenu = a3;
}

- (void)setUsesSidecarMenu:(BOOL)a3
{
  self->_usesSidecarMenu = a3;
}

- (void)setUsesPillOrnament:(BOOL)a3
{
  self->_usesPillOrnament = a3;
}

- (void)setUsesOnlyTrailingInputAssistantItems:(BOOL)a3
{
  self->_usesOnlyTrailingInputAssistantItems = a3;
}

- (void)setTableSelected:(BOOL)a3
{
  self->_tableSelected = a3;
}

- (void)setShowsDoneWhileEditing:(BOOL)a3
{
  self->_showsDoneWhileEditing = a3;
}

- (void)setQuickNoteType:(unint64_t)a3
{
  self->_quickNoteType = a3;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (void)setLandscape:(BOOL)a3
{
  self->_landscape = a3;
}

- (void)setKeyboardFloating:(BOOL)a3
{
  self->_keyboardFloating = a3;
}

- (void)setInlineSketchEditingState:(unint64_t)a3
{
  self->_inlineSketchEditingState = a3;
}

- (void)setInTripleColumnSplitView:(BOOL)a3
{
  self->_inTripleColumnSplitView = a3;
}

- (void)setInSecureScreen:(BOOL)a3
{
  self->_inSecureScreen = a3;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (void)setEditingTable:(BOOL)a3
{
  self->_editingTable = a3;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void)setCompact:(BOOL)a3
{
  self->_compact = a3;
}

- (void)setCanUndo:(BOOL)a3
{
  self->_canUndo = a3;
}

- (void)setCanShowUndoRedo:(BOOL)a3
{
  self->_canShowUndoRedo = a3;
}

- (void)setCanShowPillOrnament:(BOOL)a3
{
  self->_canShowPillOrnament = a3;
}

- (void)setCanShare:(BOOL)a3
{
  self->_canShare = a3;
}

- (void)setCanSaveQuickNote:(BOOL)a3
{
  self->_canSaveQuickNote = a3;
}

- (void)setCanRedo:(BOOL)a3
{
  self->_canRedo = a3;
}

- (void)setCanInlineSketch:(BOOL)a3
{
  self->_canInlineSketch = a3;
}

- (void)setCanCustomizeCenterItems:(BOOL)a3
{
  self->_canCustomizeCenterItems = a3;
}

- (void)setCanChangeStyle:(BOOL)a3
{
  self->_canChangeStyle = a3;
}

- (void)setCanAddTable:(BOOL)a3
{
  self->_canAddTable = a3;
}

- (void)setCanAddNote:(BOOL)a3
{
  self->_canAddNote = a3;
}

- (void)setCanAddMedia:(BOOL)a3
{
  self->_canAddMedia = a3;
}

- (void)setCanAddChecklist:(BOOL)a3
{
  self->_canAddChecklist = a3;
}

- (void)setAuxiliaryWindowType:(unint64_t)a3
{
  self->_auxiliaryWindowType = a3;
}

- (void)setAccessibilityTextSizeEnabled:(BOOL)a3
{
  self->_accessibilityTextSizeEnabled = a3;
}

- (void)reset
{
  ICNoteEditorPillOrnamentBarButtonItem *undoBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *redoBarButtonItem;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorNavigationItemConfiguration;
  -[ICNavigationItemConfiguration reset](&v5, sel_reset);
  undoBarButtonItem = self->_undoBarButtonItem;
  self->_undoBarButtonItem = 0;

  redoBarButtonItem = self->_redoBarButtonItem;
  self->_redoBarButtonItem = 0;

}

- (UIAction)redoMenuItem
{
  return self->_redoMenuItem;
}

- (ICNoteEditorPillOrnamentBarButtonItem)redoBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *redoBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v3;
  void *v5;
  void *v6;
  ICNoteEditorPillOrnamentBarButtonItem *v7;
  void *v8;
  ICNoteEditorPillOrnamentBarButtonItem *v9;
  ICNoteEditorPillOrnamentBarButtonItem *v10;
  void *v11;
  ICNoteEditorPillOrnamentBarButtonItem *v12;
  ICNoteEditorPillOrnamentBarButtonItem *v13;

  redoBarButtonItem = self->_redoBarButtonItem;
  if (redoBarButtonItem)
  {
    v3 = redoBarButtonItem;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Redo"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"))
    {
      v7 = [ICNoteEditorPillOrnamentBarButtonItem alloc];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.forward"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:](v7, "initWithTitle:image:target:action:menu:", v6, v8, self, sel_redoAction_, 0);
      v10 = self->_redoBarButtonItem;
      self->_redoBarButtonItem = v9;

      -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_redoBarButtonItem, "setUsedInPillOrnament:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
    }
    else
    {
      -[ICNoteEditorNavigationItemConfiguration undoRedoButtonWithImageName:title:selector:](self, "undoRedoButtonWithImageName:title:selector:", CFSTR("arrow.uturn.forward.circle"), v6, sel_redoAction_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ICNoteEditorPillOrnamentBarButtonItem initWithCustomView:]([ICNoteEditorPillOrnamentBarButtonItem alloc], "initWithCustomView:", v11);
      v13 = self->_redoBarButtonItem;
      self->_redoBarButtonItem = v12;

    }
    -[ICNoteEditorPillOrnamentBarButtonItem setTitle:](self->_redoBarButtonItem, "setTitle:", v6);
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityLabel:](self->_redoBarButtonItem, "setAccessibilityLabel:", v6);
    v3 = self->_redoBarButtonItem;

  }
  return v3;
}

- (unint64_t)quickNoteType
{
  return self->_quickNoteType;
}

- (UIBarButtonItem)quickNoteSaveBarButtonItem
{
  UIBarButtonItem *quickNoteSaveBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  quickNoteSaveBarButtonItem = self->_quickNoteSaveBarButtonItem;
  if (!quickNoteSaveBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_quickNoteSaveAction_);
    v5 = self->_quickNoteSaveBarButtonItem;
    self->_quickNoteSaveBarButtonItem = v4;

    -[UIBarButtonItem setStyle:](self->_quickNoteSaveBarButtonItem, "setStyle:", 2);
    quickNoteSaveBarButtonItem = self->_quickNoteSaveBarButtonItem;
  }
  return quickNoteSaveBarButtonItem;
}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationPresentingViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v4;
}

- (UIView)presentingSourceView
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationPresentingSourceView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (ICNoteEditorPillOrnamentViewController)pillOrnamentViewController
{
  void *v3;
  ICNoteEditorPillOrnamentViewController *pillOrnamentViewController;
  ICNoteEditorPillOrnamentViewController *v5;
  void *v6;
  ICNoteEditorPillOrnamentViewController *v7;
  ICNoteEditorPillOrnamentViewController *v8;
  ICNoteEditorPillOrnamentViewController *v9;

  if (-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament")
    && (-[ICNoteEditorNavigationItemConfiguration presentingWindowScene](self, "presentingWindowScene"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    pillOrnamentViewController = self->_pillOrnamentViewController;
    if (!pillOrnamentViewController)
    {
      v5 = [ICNoteEditorPillOrnamentViewController alloc];
      -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[ICNoteEditorPillOrnamentViewController initWithRootViewController:](v5, "initWithRootViewController:", v6);
      v8 = self->_pillOrnamentViewController;
      self->_pillOrnamentViewController = v7;

      pillOrnamentViewController = self->_pillOrnamentViewController;
    }
    v9 = pillOrnamentViewController;
  }
  else
  {
    -[ICPillOrnamentViewController hide](self->_pillOrnamentViewController, "hide");
    v9 = 0;
  }
  return v9;
}

- (UINavigationItem)navigationItem
{
  void *v2;
  void *v3;

  -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (ICNoteEditorPillOrnamentBarButtonItem)mediaBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *mediaBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v4;
  ICNoteEditorPillOrnamentBarButtonItem *v5;

  mediaBarButtonItem = self->_mediaBarButtonItem;
  if (!mediaBarButtonItem)
  {
    v4 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:]([ICNoteEditorPillOrnamentBarButtonItem alloc], "initWithTitle:image:target:action:menu:", 0, 0, self, 0, 0);
    v5 = self->_mediaBarButtonItem;
    self->_mediaBarButtonItem = v4;

    -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_mediaBarButtonItem, "setUsedInPillOrnament:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
    mediaBarButtonItem = self->_mediaBarButtonItem;
  }
  return mediaBarButtonItem;
}

- (UIMenu)mediaBarButtonItemMenu
{
  void *v3;
  int IsAudioTranscriptionEnabled;
  void *v5;
  void *v6;

  if (!-[ICNoteEditorNavigationItemConfiguration usesMediaMenu](self, "usesMediaMenu"))
    goto LABEL_7;
  if (-[ICNoteEditorNavigationItemConfiguration usesSidecarMenu](self, "usesSidecarMenu"))
  {
    -[ICNoteEditorNavigationItemConfiguration mediaActionMenu](self, "mediaActionMenu");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasSidecarMenuItems"))
    {

      goto LABEL_6;
    }
    IsAudioTranscriptionEnabled = ICInternalSettingsIsAudioTranscriptionEnabled();

    if (IsAudioTranscriptionEnabled)
      goto LABEL_6;
LABEL_7:
    v6 = 0;
    return (UIMenu *)v6;
  }
LABEL_6:
  -[ICNoteEditorNavigationItemConfiguration mediaActionMenu](self, "mediaActionMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v6;
}

- (ICMediaActionMenu)mediaActionMenu
{
  unint64_t v3;
  ICMediaActionMenu *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICMediaActionMenu *v10;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = -[ICNoteEditorNavigationItemConfiguration lockState](self, "lockState");
  v4 = [ICMediaActionMenu alloc];
  v5 = -[ICNoteEditorNavigationItemConfiguration isInSecureScreen](self, "isInSecureScreen");
  -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration presentingSourceView](self, "presentingSourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration sidecarMenuController](self, "sidecarMenuController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__ICNoteEditorNavigationItemConfiguration_mediaActionMenu__block_invoke;
  v12[3] = &unk_1EA7DF290;
  objc_copyWeak(&v13, &location);
  v10 = -[ICMediaActionMenu initWithIsPasswordProtected:isInSecureScreen:presentingViewController:presentingBarButtonItem:presentingSourceView:sidecarMenuController:completion:](v4, "initWithIsPasswordProtected:isInSecureScreen:presentingViewController:presentingBarButtonItem:presentingSourceView:sidecarMenuController:completion:", v3 != 0, v5, v6, v7, v8, v9, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v10;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (UIBarButtonItem)lockBarButtonItem
{
  UIBarButtonItem *lockBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  lockBarButtonItem = self->_lockBarButtonItem;
  if (!lockBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:image:target:action:menu:", 0, 0, self, sel_lockAction_, 0);
    v5 = self->_lockBarButtonItem;
    self->_lockBarButtonItem = v4;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Locked"), &stru_1EA7E9860, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_lockBarButtonItem, "setAccessibilityLabel:", v7);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Double tap to open your locked notes"), &stru_1EA7E9860, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_lockBarButtonItem, "setAccessibilityHint:", v9);

    lockBarButtonItem = self->_lockBarButtonItem;
  }
  return lockBarButtonItem;
}

- (BOOL)isTableSelected
{
  return self->_tableSelected;
}

- (BOOL)isLandscape
{
  return self->_landscape;
}

- (BOOL)isKeyboardFloating
{
  return self->_keyboardFloating;
}

- (BOOL)isInTripleColumnSplitView
{
  return self->_inTripleColumnSplitView;
}

- (BOOL)isInSecureScreen
{
  return self->_inSecureScreen;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isEditingTable
{
  return self->_editingTable;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (BOOL)isAccessibilityTextSizeEnabled
{
  return self->_accessibilityTextSizeEnabled;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationInputAssistantItem:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputAssistantItem *)v4;
}

- (UIToolbar)inputAccessoryToolbar
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationInputAccessoryToolbar:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIToolbar *)v4;
}

- (unint64_t)inlineSketchEditingState
{
  return self->_inlineSketchEditingState;
}

- (ICNoteEditorPillOrnamentBarButtonItem)inlineSketchBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *inlineSketchBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  ICNoteEditorPillOrnamentBarButtonItem *v11;
  ICNoteEditorPillOrnamentBarButtonItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  inlineSketchBarButtonItem = self->_inlineSketchBarButtonItem;
  if (inlineSketchBarButtonItem)
  {
    v3 = inlineSketchBarButtonItem;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil.tip.crop.circle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = CFSTR("Drawing tools");
    else
      v9 = CFSTR("Handwriting");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:]([ICNoteEditorPillOrnamentBarButtonItem alloc], "initWithTitle:image:target:action:menu:", v10, v5, self, sel_inlineSketchAction_, 0);
    v12 = self->_inlineSketchBarButtonItem;
    self->_inlineSketchBarButtonItem = v11;

    -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_inlineSketchBarButtonItem, "setUsedInPillOrnament:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Handwriting"), &stru_1EA7E9860, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityLabel:](self->_inlineSketchBarButtonItem, "setAccessibilityLabel:", v14);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Double tap to toggle the ink picker"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityHint:](self->_inlineSketchBarButtonItem, "setAccessibilityHint:", v16);

    v3 = self->_inlineSketchBarButtonItem;
  }
  return v3;
}

- (ICNoteEditorNavigationItemConfiguration)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  ICNoteEditorNavigationItemConfiguration *v8;
  ICNoteEditorNavigationItemConfiguration *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteEditorNavigationItemConfiguration;
  v8 = -[ICNavigationItemConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v9->_showsDoneWhileEditing = 1;
    v9->_usesMediaMenu = 1;
  }

  return v9;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (ICNoteEditorNavigationItemConfigurationDataSource)dataSource
{
  return (ICNoteEditorNavigationItemConfigurationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UIBarButtonItem)collaborationBarButtonItem
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationCollaborationBarButtonItem:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v4;
}

- (ICNoteEditorPillOrnamentBarButtonItem)checklistBarButtonItem
{
  ICNoteEditorPillOrnamentBarButtonItem *checklistBarButtonItem;
  ICNoteEditorPillOrnamentBarButtonItem *v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  ICNoteEditorPillOrnamentBarButtonItem *v11;
  ICNoteEditorPillOrnamentBarButtonItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  checklistBarButtonItem = self->_checklistBarButtonItem;
  if (checklistBarButtonItem)
  {
    v3 = checklistBarButtonItem;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checklist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = CFSTR("Make a checklist");
    else
      v9 = CFSTR("Checklist");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[ICNoteEditorPillOrnamentBarButtonItem initWithTitle:image:target:action:menu:]([ICNoteEditorPillOrnamentBarButtonItem alloc], "initWithTitle:image:target:action:menu:", v10, v5, self, sel_checklistAction_, 0);
    v12 = self->_checklistBarButtonItem;
    self->_checklistBarButtonItem = v11;

    -[ICNoteEditorPillOrnamentBarButtonItem setUsedInPillOrnament:](self->_checklistBarButtonItem, "setUsedInPillOrnament:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Checklist"), &stru_1EA7E9860, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityLabel:](self->_checklistBarButtonItem, "setAccessibilityLabel:", v14);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Double tap to add a checklist to the current note."), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorPillOrnamentBarButtonItem setAccessibilityHint:](self->_checklistBarButtonItem, "setAccessibilityHint:", v16);

    v3 = self->_checklistBarButtonItem;
  }
  return v3;
}

- (NSString)checklistAccessibilityValue
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationChecklistAccessibilityValue:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)canUndo
{
  return self->_canUndo;
}

- (BOOL)canShowUndoRedo
{
  return self->_canShowUndoRedo;
}

- (BOOL)canShowToolbar
{
  if (-[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact")
    && -[ICNoteEditorNavigationItemConfiguration isTableSelected](self, "isTableSelected"))
  {
    return 1;
  }
  if (!-[ICNoteEditorNavigationItemConfiguration isKeyboardFloating](self, "isKeyboardFloating")
    && -[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing")
    || -[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState") == 3)
  {
    return 0;
  }
  return -[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact");
}

- (BOOL)canShowPillOrnament
{
  return self->_canShowPillOrnament;
}

- (BOOL)canShare
{
  return self->_canShare;
}

- (BOOL)canSaveQuickNote
{
  return self->_canSaveQuickNote;
}

- (BOOL)canRedo
{
  return self->_canRedo;
}

- (BOOL)canInlineSketch
{
  return self->_canInlineSketch;
}

- (BOOL)canChangeStyle
{
  return self->_canChangeStyle;
}

- (BOOL)canAddTable
{
  return self->_canAddTable;
}

- (BOOL)canAddNote
{
  return self->_canAddNote;
}

- (BOOL)canAddMedia
{
  return self->_canAddMedia;
}

- (BOOL)canAddChecklist
{
  return self->_canAddChecklist;
}

- (unint64_t)auxiliaryWindowType
{
  return self->_auxiliaryWindowType;
}

- (UIBarButtonItem)addNoteBarButtonItem
{
  UIBarButtonItem *addNoteBarButtonItem;
  UIBarButtonItem *v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  addNoteBarButtonItem = self->_addNoteBarButtonItem;
  if (addNoteBarButtonItem)
  {
    v3 = addNoteBarButtonItem;
  }
  else
  {
    v5 = -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("Create a note");
    else
      v8 = CFSTR("New Note");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA7E9860, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.pencil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIBarButtonItem *)objc_msgSend(v10, "initWithTitle:image:target:action:menu:", v9, v11, self, sel_addNoteAction_event_, 0);
    v13 = self->_addNoteBarButtonItem;
    self->_addNoteBarButtonItem = v12;

    -[UIBarButtonItem setSpringLoaded:](self->_addNoteBarButtonItem, "setSpringLoaded:", 1);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("New note"), &stru_1EA7E9860, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_addNoteBarButtonItem, "setAccessibilityLabel:", v15);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Double tap to compose a new note."), &stru_1EA7E9860, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_addNoteBarButtonItem, "setAccessibilityHint:", v17);

    v3 = self->_addNoteBarButtonItem;
  }
  return v3;
}

- (UIWindowScene)presentingWindowScene
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationPresentingWindowScene:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v4;
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  void *v3;
  void *v4;

  -[ICNoteEditorNavigationItemConfiguration dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorNavigationItemConfigurationTableAttachmentViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTableAttachmentViewController *)v4;
}

- (ICSelectorDelayer)inlineSketchAnimationSelectorDelayer
{
  ICSelectorDelayer *inlineSketchAnimationSelectorDelayer;
  void *v4;

  inlineSketchAnimationSelectorDelayer = self->_inlineSketchAnimationSelectorDelayer;
  if (!inlineSketchAnimationSelectorDelayer)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_performInlineSketchAnimation_, 1, 1, 1.5);
    -[ICNoteEditorNavigationItemConfiguration setInlineSketchAnimationSelectorDelayer:](self, "setInlineSketchAnimationSelectorDelayer:", v4);

    inlineSketchAnimationSelectorDelayer = self->_inlineSketchAnimationSelectorDelayer;
  }
  return inlineSketchAnimationSelectorDelayer;
}

- (UINavigationController)navigationController
{
  void *v2;
  void *v3;

  -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationController *)v3;
}

- (void)performInlineSketchAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)MEMORY[0x1E0DC3F10];
  -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICNoteEditorNavigationItemConfiguration_performInlineSketchAnimation___block_invoke;
  v7[3] = &unk_1EA7DD2D8;
  v7[4] = self;
  objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v7, 0, 0.5);

}

void __72__ICNoteEditorNavigationItemConfiguration_performInlineSketchAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setInlineSketchEditingState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "inlineSketchBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteEditorNavigationItemConfiguration:didCompleteAnimationFromInlineSketchBarButtonItem:", v2, v3);

}

- (void)updateRegularAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _BOOL8 v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL8 v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
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
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  _QWORD v131[17];
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  _QWORD v137[4];
  void *v138;
  _QWORD v139[3];

  v3 = a3;
  v139[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", 0);

  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleView:", 0);

  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1;
  objc_msgSend(v7, "setStyle:", 1);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ICNoteEditorNavigationItemConfiguration hidesBackButton](self, "hidesBackButton"))
  {
    if (-[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType"))
      v8 = 1;
    else
      v8 = -[ICNoteEditorNavigationItemConfiguration usesCustomBackButton](self, "usesCustomBackButton");
  }
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesBackButton:", v8);

  if (-[ICNoteEditorNavigationItemConfiguration usesCustomBackButton](self, "usesCustomBackButton")
    && !-[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType"))
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3500]);
    -[ICNoteEditorNavigationItemConfiguration customBackBarButtonItem](self, "customBackBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithBarButtonItems:representativeItem:", v12, 0);

    objc_msgSend(v130, "addObject:", v13);
  }
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLeftItemsSupplementBackButton:", 1);

  if (-[ICNoteEditorNavigationItemConfiguration showsSidebarButton](self, "showsSidebarButton"))
  {
    v15 = objc_alloc(MEMORY[0x1E0DC3500]);
    -[ICNoteEditorNavigationItemConfiguration sidebarButtonItem](self, "sidebarButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithBarButtonItems:representativeItem:", v17, 0);

    objc_msgSend(v130, "addObject:", v18);
  }
  if (!-[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICNoteEditorNavigationItemConfiguration isInSecureScreen](self, "isInSecureScreen"))
    {
      -[ICNoteEditorNavigationItemConfiguration quickNoteAllNotesBarButtonItem](self, "quickNoteAllNotesBarButtonItem");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType") != 1)
      {
LABEL_16:
        if (objc_msgSend(v19, "count"))
        {
          v22 = objc_alloc(MEMORY[0x1E0DC3500]);
          v23 = (void *)objc_msgSend(v19, "copy");
          v24 = (void *)objc_msgSend(v22, "initWithBarButtonItems:representativeItem:", v23, 0);

          objc_msgSend(v130, "addObject:", v24);
        }

        goto LABEL_19;
      }
      -[ICNoteEditorNavigationItemConfiguration closeAuxiliaryWindowBarButtonItem](self, "closeAuxiliaryWindowBarButtonItem");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;
    objc_msgSend(v19, "addObject:", v20);

    goto LABEL_16;
  }
LABEL_19:
  if (!-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament")
    && -[ICNoteEditorNavigationItemConfiguration canShowUndoRedo](self, "canShowUndoRedo"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 20.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);

    -[ICNoteEditorNavigationItemConfiguration undoBarButtonItem](self, "undoBarButtonItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v27);

    if (!-[ICNoteEditorNavigationItemConfiguration usesUndoRedoMenu](self, "usesUndoRedoMenu"))
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 20.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v28);

      -[ICNoteEditorNavigationItemConfiguration redoBarButtonItem](self, "redoBarButtonItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v29);

    }
    v30 = objc_alloc(MEMORY[0x1E0DC3500]);
    v31 = (void *)objc_msgSend(v25, "copy");
    v32 = (void *)objc_msgSend(v30, "initWithBarButtonItems:representativeItem:", v31, 0);

    objc_msgSend(v130, "addObject:", v32);
  }
  v33 = (void *)objc_msgSend(v130, "copy");
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLeadingItemGroups:", v33);

  if (-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"))
  {
    -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCenterItemGroups:", MEMORY[0x1E0C9AA60]);

    -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCustomizationIdentifier:", 0);
  }
  else
  {
    v37 = (void *)MEMORY[0x1E0DC3500];
    v38 = -[ICNoteEditorNavigationItemConfiguration hidesDefaultCenterItems](self, "hidesDefaultCenterItems") ^ 1;
    -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v127;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", CFSTR("ICNoteEditorViewControllerNavigationBarCustomizationID"), v38, 0, v125);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v137[0] = v123;
    v39 = (void *)MEMORY[0x1E0DC3500];
    v40 = -[ICNoteEditorNavigationItemConfiguration hidesDefaultCenterItems](self, "hidesDefaultCenterItems") ^ 1;
    -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v121;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", CFSTR("ICNoteEditorViewControllerNavigationBarCustomizationIDTodo"), v40, 0, v119);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v137[1] = v41;
    v42 = (void *)MEMORY[0x1E0DC3500];
    v43 = -[ICNoteEditorNavigationItemConfiguration hidesDefaultCenterItems](self, "hidesDefaultCenterItems") ^ 1;
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", CFSTR("ICNoteEditorViewControllerNavigationBarCustomizationIDTable"), v43, 0, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v137[2] = v46;
    v47 = (void *)MEMORY[0x1E0DC3500];
    v48 = -[ICNoteEditorNavigationItemConfiguration hidesDefaultCenterItems](self, "hidesDefaultCenterItems") ^ 1;
    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
    v50 = v3;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "optionalGroupWithCustomizationIdentifier:inDefaultCustomization:representativeItem:items:", CFSTR("ICNoteEditorViewControllerNavigationBarCustomizationIDInsert"), v48, 0, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v137[3] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v50;
    -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCenterItemGroups:", v36);

    if (-[ICNoteEditorNavigationItemConfiguration canCustomizeCenterItems](self, "canCustomizeCenterItems"))
      v54 = CFSTR("ICNoteEditorViewControllerNavigationBarCustomizationID");
    else
      v54 = 0;
    -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setCustomizationIdentifier:", v54);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType"))
  {
    if (-[ICNoteEditorNavigationItemConfiguration lockState](self, "lockState"))
    {
      -[ICNoteEditorNavigationItemConfiguration lockBarButtonItem](self, "lockBarButtonItem");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v57);

    }
    if (-[ICNoteEditorNavigationItemConfiguration isDeleted](self, "isDeleted"))
    {
      -[ICNoteEditorNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v58);

      -[ICNoteEditorNavigationItemConfiguration deleteBarButtonItem](self, "deleteBarButtonItem");
      v59 = objc_claimAutoreleasedReturnValue();
LABEL_39:
      v63 = (void *)v59;
      objc_msgSend(v56, "addObject:", v59);

      goto LABEL_40;
    }
    if (!-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"))
    {
      -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addObject:", v60);

    }
    -[ICNoteEditorNavigationItemConfiguration shareBarButtonItem](self, "shareBarButtonItem");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObject:", v61);

    -[ICNoteEditorNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      -[ICNoteEditorNavigationItemConfiguration collaborationBarButtonItem](self, "collaborationBarButtonItem");
      v59 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
  }
LABEL_40:
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v56, "copy");
  objc_msgSend(v64, "setRightBarButtonItems:animated:", v65, v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration addNoteBarButtonItem](self, "addNoteBarButtonItem");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObject:", v67);

  if (-[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing")
    && -[ICNoteEditorNavigationItemConfiguration showsDoneWhileEditing](self, "showsDoneWhileEditing"))
  {
    -[ICNoteEditorNavigationItemConfiguration doneBarButtonItem](self, "doneBarButtonItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v68);

  }
  v69 = objc_alloc(MEMORY[0x1E0DC3500]);
  v70 = (void *)objc_msgSend(v66, "copy");
  v71 = (void *)objc_msgSend(v69, "initWithBarButtonItems:representativeItem:", v70, 0);
  -[ICNoteEditorNavigationItemConfiguration navigationItem](self, "navigationItem");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setPinnedTrailingGroup:", v71);

  -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    -[ICNoteEditorNavigationItemConfiguration inputAssistantLeadingBarButtonItemGroup](self, "inputAssistantLeadingBarButtonItemGroup");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setBarButtonItems:", MEMORY[0x1E0C9AA60]);

    -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingBarButtonGroups");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration inputAssistantLeadingBarButtonItemGroup](self, "inputAssistantLeadingBarButtonItemGroup");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "containsObject:", v77);

    if ((v78 & 1) == 0)
    {
      NSStringFromSelector(sel_leadingBarButtonGroups);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "willChangeValueForKey:", v128);

      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "leadingBarButtonGroups");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantLeadingBarButtonItemGroup](self, "inputAssistantLeadingBarButtonItemGroup");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "arrayByAddingObject:", v82);
      v83 = v66;
      v84 = v56;
      v85 = v3;
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setLeadingBarButtonGroups:", v86);

      v3 = v85;
      v56 = v84;
      v66 = v83;

      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "didChangeValueForKey:", v128);

    }
    -[ICNoteEditorNavigationItemConfiguration inputAssistantTrailingBarButtonItemGroup](self, "inputAssistantTrailingBarButtonItemGroup");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setBarButtonItems:", MEMORY[0x1E0C9AA60]);

    -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "trailingBarButtonGroups");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration inputAssistantTrailingBarButtonItemGroup](self, "inputAssistantTrailingBarButtonItemGroup");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v91, "containsObject:", v92);

    if ((v93 & 1) == 0)
    {
      NSStringFromSelector(sel_trailingBarButtonGroups);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "willChangeValueForKey:", v94);

      -[ICNoteEditorNavigationItemConfiguration inputAssistantTrailingBarButtonItemGroup](self, "inputAssistantTrailingBarButtonItemGroup");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = v96;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setTrailingBarButtonGroups:", v97);

      -[ICNoteEditorNavigationItemConfiguration inputAssistantItem](self, "inputAssistantItem");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "didChangeValueForKey:", v94);

    }
  }
  -[ICNoteEditorNavigationItemConfiguration inputAccessoryToolbar](self, "inputAccessoryToolbar");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    -[ICNoteEditorNavigationItemConfiguration inputAccessoryToolbar](self, "inputAccessoryToolbar");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setItems:", MEMORY[0x1E0C9AA60]);

  }
  -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    -[ICNoteEditorNavigationItemConfiguration toolbar](self, "toolbar");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setItems:animated:", MEMORY[0x1E0C9AA60], v3);

  }
  if (-[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament")
    && -[ICNoteEditorNavigationItemConfiguration canShowPillOrnament](self, "canShowPillOrnament")
    && !-[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState"))
  {
    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = v129;
    -[ICNoteEditorNavigationItemConfiguration undoBarButtonItem](self, "undoBarButtonItem");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v131[1] = v126;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v131[2] = v124;
    -[ICNoteEditorNavigationItemConfiguration redoBarButtonItem](self, "redoBarButtonItem");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v131[3] = v122;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v131[4] = v120;
    -[ICNoteEditorNavigationItemConfiguration verticalSeparatorBarButtonItem](self, "verticalSeparatorBarButtonItem");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v131[5] = v118;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v131[6] = v117;
    -[ICNoteEditorNavigationItemConfiguration styleBarButtonItem](self, "styleBarButtonItem");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v131[7] = v116;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v131[8] = v115;
    -[ICNoteEditorNavigationItemConfiguration checklistBarButtonItem](self, "checklistBarButtonItem");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v131[9] = v114;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v131[10] = v113;
    -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v131[11] = v112;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v131[12] = v105;
    -[ICNoteEditorNavigationItemConfiguration mediaBarButtonItem](self, "mediaBarButtonItem");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v131[13] = v106;
    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 16.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v131[14] = v107;
    -[ICNoteEditorNavigationItemConfiguration inlineSketchBarButtonItem](self, "inlineSketchBarButtonItem");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v131[15] = v108;
    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v131[16] = v109;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 17);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration pillOrnamentViewController](self, "pillOrnamentViewController");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setToolbarItems:", v110);

    -[ICNoteEditorNavigationItemConfiguration pillOrnamentViewController](self, "pillOrnamentViewController");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "show");
  }
  else
  {
    -[ICNoteEditorNavigationItemConfiguration pillOrnamentViewController](self, "pillOrnamentViewController");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "hide");
  }

}

- (UIBarButtonItem)closeAuxiliaryWindowBarButtonItem
{
  UIBarButtonItem *closeAuxiliaryWindowBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  closeAuxiliaryWindowBarButtonItem = self->_closeAuxiliaryWindowBarButtonItem;
  if (!closeAuxiliaryWindowBarButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:image:target:action:menu:", v6, 0, self, sel_closeAuxiliaryWindowAction_, 0);
    v8 = self->_closeAuxiliaryWindowBarButtonItem;
    self->_closeAuxiliaryWindowBarButtonItem = v7;

    closeAuxiliaryWindowBarButtonItem = self->_closeAuxiliaryWindowBarButtonItem;
  }
  return closeAuxiliaryWindowBarButtonItem;
}

- (UIBarButtonItem)customBackBarButtonItem
{
  UIBarButtonItem *customBackBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  if (-[ICNoteEditorNavigationItemConfiguration usesCustomBackButton](self, "usesCustomBackButton"))
  {
    customBackBarButtonItem = self->_customBackBarButtonItem;
    if (!customBackBarButtonItem)
    {
      v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 101, self, sel_backAction_);
      v5 = self->_customBackBarButtonItem;
      self->_customBackBarButtonItem = v4;

      customBackBarButtonItem = self->_customBackBarButtonItem;
    }
    v6 = customBackBarButtonItem;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (UIBarButtonItem)deleteBarButtonItem
{
  UIBarButtonItem *deleteBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  deleteBarButtonItem = self->_deleteBarButtonItem;
  if (!deleteBarButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Delete Note"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:image:target:action:menu:", v6, v7, self, sel_deleteAction_, 0);
    v9 = self->_deleteBarButtonItem;
    self->_deleteBarButtonItem = v8;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Delete Note"), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_deleteBarButtonItem, "setAccessibilityLabel:", v11);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Double tap to delete the current note."), &stru_1EA7E9860, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_deleteBarButtonItem, "setAccessibilityHint:", v13);

    deleteBarButtonItem = self->_deleteBarButtonItem;
  }
  return deleteBarButtonItem;
}

- (UIBarButtonItem)doneBarButtonItem
{
  UIBarButtonItem *doneBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneBarButtonItem = self->_doneBarButtonItem;
  if (!doneBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneAction_);
    v5 = self->_doneBarButtonItem;
    self->_doneBarButtonItem = v4;

    doneBarButtonItem = self->_doneBarButtonItem;
  }
  return doneBarButtonItem;
}

- (UIBarButtonItem)moveBarButtonItem
{
  UIBarButtonItem *moveBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  moveBarButtonItem = self->_moveBarButtonItem;
  if (!moveBarButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Move Note"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("folder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:image:target:action:menu:", v6, v7, self, sel_moveAction_, 0);
    v9 = self->_moveBarButtonItem;
    self->_moveBarButtonItem = v8;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Move Note"), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityLabel:", v11);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Double tap to move the current note."), &stru_1EA7E9860, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration moveBarButtonItem](self, "moveBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityHint:", v14);

    moveBarButtonItem = self->_moveBarButtonItem;
  }
  return moveBarButtonItem;
}

- (UIBarButtonItem)quickNoteAllNotesBarButtonItem
{
  UIBarButtonItem *quickNoteAllNotesBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  quickNoteAllNotesBarButtonItem = self->_quickNoteAllNotesBarButtonItem;
  if (!quickNoteAllNotesBarButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("All Notes"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:image:target:action:menu:", v6, 0, self, sel_quickNoteAllNotesAction_, 0);
    v8 = self->_quickNoteAllNotesBarButtonItem;
    self->_quickNoteAllNotesBarButtonItem = v7;

    quickNoteAllNotesBarButtonItem = self->_quickNoteAllNotesBarButtonItem;
  }
  return quickNoteAllNotesBarButtonItem;
}

- (UIBarButtonItem)quickNoteCancelBarButtonItem
{
  UIBarButtonItem *quickNoteCancelBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  quickNoteCancelBarButtonItem = self->_quickNoteCancelBarButtonItem;
  if (!quickNoteCancelBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_quickNoteCancelAction_);
    v5 = self->_quickNoteCancelBarButtonItem;
    self->_quickNoteCancelBarButtonItem = v4;

    quickNoteCancelBarButtonItem = self->_quickNoteCancelBarButtonItem;
  }
  return quickNoteCancelBarButtonItem;
}

- (UIBarButtonItem)sidebarButtonItem
{
  UIBarButtonItem *sidebarButtonItem;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  sidebarButtonItem = self->_sidebarButtonItem;
  if (!sidebarButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Sidebar"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("sidebar.leading"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:image:target:action:menu:", v6, v7, self, sel_sidebarAction_, 0);
    v9 = self->_sidebarButtonItem;
    self->_sidebarButtonItem = v8;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Sidebar"), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_sidebarButtonItem, "setAccessibilityLabel:", v11);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Double tap to toggle the sidebar"), &stru_1EA7E9860, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_sidebarButtonItem, "setAccessibilityHint:", v13);

    sidebarButtonItem = self->_sidebarButtonItem;
  }
  return sidebarButtonItem;
}

- (UIBarButtonItem)verticalSeparatorBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *verticalSeparatorBarButtonItem;
  UIBarButtonItem *v11;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_hairlineWidth");
  v7 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v6, 12.0 * -2.0 + 44.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
  verticalSeparatorBarButtonItem = self->_verticalSeparatorBarButtonItem;
  self->_verticalSeparatorBarButtonItem = v9;

  v11 = self->_verticalSeparatorBarButtonItem;
  return v11;
}

void __58__ICNoteEditorNavigationItemConfiguration_mediaActionMenu__block_invoke(uint64_t a1, int a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id WeakRetained;

  if (a2)
  {
    v3 = (id *)(a1 + 32);
    v4 = a3;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v3);
    v7 = ICMediaSourceTypeFromString(v4);

    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "mediaBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteEditorNavigationItemConfiguration:insertMediaWithSourceType:mediaBarButtonItem:", v6, v7, v9);

  }
}

void __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateMenus");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v9 = objc_loadWeakRetained(v1);
    objc_msgSend(v9, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "mediaBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteEditorNavigationItemConfiguration:updateSidecarMenuFromMediaBarButtonItem:", v7, v8);

  }
}

void __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "mediaBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteEditorNavigationItemConfiguration:insertSidecarItemWithMenuItems:service:mediaBarButtonItem:", v7, v5, a3, v8);

}

- (ICTableActionMenu)tableActionMenu
{
  ICTableActionMenu *v3;
  void *v4;
  void *v5;
  void *v6;
  ICTableActionMenu *v7;
  _QWORD v9[4];
  id v10;
  id location;

  if (!-[ICNoteEditorNavigationItemConfiguration isEditingTable](self, "isEditingTable"))
    return (ICTableActionMenu *)0;
  objc_initWeak(&location, self);
  v3 = [ICTableActionMenu alloc];
  -[ICNoteEditorNavigationItemConfiguration tableAttachmentViewController](self, "tableAttachmentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorNavigationItemConfiguration tableBarButtonItem](self, "tableBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ICNoteEditorNavigationItemConfiguration_tableActionMenu__block_invoke;
  v9[3] = &unk_1EA7DF290;
  objc_copyWeak(&v10, &location);
  v7 = -[ICTableActionMenu initWithTableAttachmentViewController:presentingViewController:presentingBarButtonItem:completion:](v3, "initWithTableAttachmentViewController:presentingViewController:presentingBarButtonItem:completion:", v4, v5, v6, v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

void __58__ICNoteEditorNavigationItemConfiguration_tableActionMenu__block_invoke(uint64_t a1, int a2)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  if (a2)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "tableBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "noteEditorNavigationItemConfiguration:startEditingFromBarButtonItem:", v4, v5);

  }
}

- (UIMenu)tableBarButtonItemMenu
{
  void *v2;
  void *v3;

  -[ICNoteEditorNavigationItemConfiguration tableActionMenu](self, "tableActionMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v3;
}

- (UIMenu)undoRedoMenu
{
  UIMenu *undoRedoMenu;
  UIMenu *v3;
  void *v5;
  void *v6;
  ICNoteEditorNavigationItemConfiguration *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIMenu *v20;
  UIMenu *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  undoRedoMenu = self->_undoRedoMenu;
  if (undoRedoMenu)
  {
    v3 = undoRedoMenu;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3428];
    v6 = (void *)MEMORY[0x1E0CB34D0];
    v7 = self;
    objc_msgSend(v6, "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Undo"), &stru_1EA7E9860, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke;
    v24[3] = &unk_1EA7DDE30;
    v24[4] = v7;
    objc_msgSend(v5, "ic_actionWithTitle:imageName:handler:", v9, CFSTR("arrow.uturn.backward.circle"), v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration setUndoMenuItem:](v7, "setUndoMenuItem:", v11);

    v12 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Redo"), &stru_1EA7E9860, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke_2;
    v23[3] = &unk_1EA7DDE30;
    v23[4] = v7;
    objc_msgSend(v12, "ic_actionWithTitle:imageName:handler:", v14, CFSTR("arrow.uturn.forward.circle"), v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorNavigationItemConfiguration setRedoMenuItem:](v7, "setRedoMenuItem:", v15);

    v16 = (void *)MEMORY[0x1E0DC39D0];
    -[ICNoteEditorNavigationItemConfiguration undoMenuItem](v7, "undoMenuItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    -[ICNoteEditorNavigationItemConfiguration redoMenuItem](v7, "redoMenuItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "menuWithChildren:", v19);
    v20 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    v21 = self->_undoRedoMenu;
    self->_undoRedoMenu = v20;

    v3 = self->_undoRedoMenu;
  }
  return v3;
}

void __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "undoBarButtonItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undoAction:", v2);

}

void __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "redoBarButtonItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "redoAction:", v2);

}

- (UIBarButtonItemGroup)inputAssistantLeadingBarButtonItemGroup
{
  UIBarButtonItemGroup *inputAssistantLeadingBarButtonItemGroup;
  id v4;
  UIBarButtonItemGroup *v5;
  UIBarButtonItemGroup *v6;

  inputAssistantLeadingBarButtonItemGroup = self->_inputAssistantLeadingBarButtonItemGroup;
  if (!inputAssistantLeadingBarButtonItemGroup)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3500]);
    v5 = (UIBarButtonItemGroup *)objc_msgSend(v4, "initWithBarButtonItems:representativeItem:", MEMORY[0x1E0C9AA60], 0);
    v6 = self->_inputAssistantLeadingBarButtonItemGroup;
    self->_inputAssistantLeadingBarButtonItemGroup = v5;

    inputAssistantLeadingBarButtonItemGroup = self->_inputAssistantLeadingBarButtonItemGroup;
  }
  return inputAssistantLeadingBarButtonItemGroup;
}

- (UIBarButtonItemGroup)inputAssistantTrailingBarButtonItemGroup
{
  UIBarButtonItemGroup *inputAssistantTrailingBarButtonItemGroup;
  id v4;
  UIBarButtonItemGroup *v5;
  UIBarButtonItemGroup *v6;

  inputAssistantTrailingBarButtonItemGroup = self->_inputAssistantTrailingBarButtonItemGroup;
  if (!inputAssistantTrailingBarButtonItemGroup)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3500]);
    v5 = (UIBarButtonItemGroup *)objc_msgSend(v4, "initWithBarButtonItems:representativeItem:", MEMORY[0x1E0C9AA60], 0);
    v6 = self->_inputAssistantTrailingBarButtonItemGroup;
    self->_inputAssistantTrailingBarButtonItemGroup = v5;

    inputAssistantTrailingBarButtonItemGroup = self->_inputAssistantTrailingBarButtonItemGroup;
  }
  return inputAssistantTrailingBarButtonItemGroup;
}

- (void)addNoteAction:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "noteEditorNavigationItemConfiguration:addNoteFromBarButtonItem:event:", self, v7, v6);

}

- (void)backAction:(id)a3
{
  id v3;
  id v4;

  -[ICNoteEditorNavigationItemConfiguration navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)checklistAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:addChecklistFromBarButtonItem:", self, v4);

}

- (void)closeAuxiliaryWindowAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:closeAuxiliaryWindowFromBarButtonItem:", self, v4);

}

- (void)deleteAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:deleteFromBarButtonItem:", self, v4);

}

- (void)doneAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration setInlineSketchEditingState:](self, "setInlineSketchEditingState:", 0);
  -[ICNoteEditorNavigationItemConfiguration setEditing:](self, "setEditing:", 0);
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:doneEditingFromBarButtonItem:", self, v4);

}

- (void)inlineSketchAction:(id)a3
{
  id v4;
  unint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = -[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState");
  v6 = v5 != 3;
  if (v5 == 3)
    v7 = 0;
  else
    v7 = 3;
  -[ICNoteEditorNavigationItemConfiguration setInlineSketchEditingState:](self, "setInlineSketchEditingState:", v7);
  -[ICNoteEditorNavigationItemConfiguration setEditing:](self, "setEditing:", v6);
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "noteEditorNavigationItemConfiguration:inlineSketchFromBarButtonItem:", self, v4);

}

- (void)lockAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:toggleLockFromBarButtonItem:", self, v4);

}

- (void)moveAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:moveFromBarButtonItem:", self, v4);

}

- (void)photoLibraryAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:showPhotoLibraryFromBarButtonItem:", self, v4);

}

- (void)quickNoteAllNotesAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:quickNoteShowAllNotesFromBarButtonItem:", self, v4);

}

- (void)quickNoteCancelAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:quickNoteDidCancelFromBarButtonItem:", self, v4);

}

- (void)quickNoteSaveAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:quickNoteDidSaveFromBarButtonItem:", self, v4);

}

- (void)redoAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:redoFromBarButtonItem:", self, v4);

}

- (void)shareAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:shareFromBarButtonItem:", self, v4);

}

- (void)sidebarAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:toggleSidebarFromBarButtonItem:", self, v4);

}

- (void)styleAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:changeStyleFromBarButtonItem:", self, v4);

}

- (void)tableAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:addTableFromBarButtonItem:", self, v4);

}

- (void)undoAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorNavigationItemConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorNavigationItemConfiguration:undoFromBarButtonItem:", self, v4);

}

- (BOOL)isEqual:(id)a3
{
  ICNoteEditorNavigationItemConfiguration *v4;
  ICNoteEditorNavigationItemConfiguration *v5;
  unint64_t v6;
  BOOL v7;

  v4 = (ICNoteEditorNavigationItemConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[ICNoteEditorNavigationItemConfiguration hash](self, "hash");
    v7 = v6 == -[ICNoteEditorNavigationItemConfiguration hash](v5, "hash");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (ICNoteEditorNavigationItemConfigurationDelegate)delegate
{
  return (ICNoteEditorNavigationItemConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canCustomizeCenterItems
{
  return self->_canCustomizeCenterItems;
}

- (BOOL)hidesDefaultCenterItems
{
  return self->_hidesDefaultCenterItems;
}

- (void)setHidesDefaultCenterItems:(BOOL)a3
{
  self->_hidesDefaultCenterItems = a3;
}

- (BOOL)showsSidebarButton
{
  return self->_showsSidebarButton;
}

- (void)setShowsSidebarButton:(BOOL)a3
{
  self->_showsSidebarButton = a3;
}

- (BOOL)usesCustomBackButton
{
  return self->_usesCustomBackButton;
}

- (void)setUsesCustomBackButton:(BOOL)a3
{
  self->_usesCustomBackButton = a3;
}

- (void)setUsesMediaMenu:(BOOL)a3
{
  self->_usesMediaMenu = a3;
}

- (void)setMediaActionMenu:(id)a3
{
  objc_storeStrong((id *)&self->_mediaActionMenu, a3);
}

- (void)setSidecarMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_sidecarMenuController, a3);
}

- (void)setPillOrnamentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pillOrnamentViewController, a3);
}

- (void)setTableActionMenu:(id)a3
{
  objc_storeStrong((id *)&self->_tableActionMenu, a3);
}

- (void)setCustomBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_customBackBarButtonItem, a3);
}

- (void)setMediaBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaBarButtonItem, a3);
}

- (void)setShareBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareBarButtonItem, a3);
}

- (void)setStyleBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_styleBarButtonItem, a3);
}

- (void)setAddNoteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addNoteBarButtonItem, a3);
}

- (void)setChecklistBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_checklistBarButtonItem, a3);
}

- (void)setCloseAuxiliaryWindowBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_closeAuxiliaryWindowBarButtonItem, a3);
}

- (void)setDeleteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_deleteBarButtonItem, a3);
}

- (void)setDoneBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneBarButtonItem, a3);
}

- (void)setInlineSketchBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_inlineSketchBarButtonItem, a3);
}

- (void)setLockBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_lockBarButtonItem, a3);
}

- (void)setMoveBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moveBarButtonItem, a3);
}

- (void)setQuickNoteAllNotesBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_quickNoteAllNotesBarButtonItem, a3);
}

- (void)setQuickNoteCancelBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_quickNoteCancelBarButtonItem, a3);
}

- (void)setQuickNoteSaveBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_quickNoteSaveBarButtonItem, a3);
}

- (void)setRedoBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_redoBarButtonItem, a3);
}

- (void)setSidebarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarButtonItem, a3);
}

- (void)setTableBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_tableBarButtonItem, a3);
}

- (void)setUndoBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_undoBarButtonItem, a3);
}

- (void)setVerticalSeparatorBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_verticalSeparatorBarButtonItem, a3);
}

- (void)setInputAssistantLeadingBarButtonItemGroup:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantLeadingBarButtonItemGroup, a3);
}

- (void)setInputAssistantTrailingBarButtonItemGroup:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantTrailingBarButtonItemGroup, a3);
}

- (void)setInlineSketchAnimationSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_inlineSketchAnimationSelectorDelayer, a3);
}

- (void)setUndoRedoMenu:(id)a3
{
  objc_storeStrong((id *)&self->_undoRedoMenu, a3);
}

- (void)setUndoMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_undoMenuItem, a3);
}

- (void)setRedoMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_redoMenuItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoMenuItem, 0);
  objc_storeStrong((id *)&self->_undoMenuItem, 0);
  objc_storeStrong((id *)&self->_undoRedoMenu, 0);
  objc_storeStrong((id *)&self->_inlineSketchAnimationSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_inputAssistantTrailingBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_inputAssistantLeadingBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_verticalSeparatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_undoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tableBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sidebarButtonItem, 0);
  objc_storeStrong((id *)&self->_redoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_quickNoteSaveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_quickNoteCancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_quickNoteAllNotesBarButtonItem, 0);
  objc_storeStrong((id *)&self->_moveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_lockBarButtonItem, 0);
  objc_storeStrong((id *)&self->_inlineSketchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_closeAuxiliaryWindowBarButtonItem, 0);
  objc_storeStrong((id *)&self->_checklistBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addNoteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_styleBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_mediaBarButtonItem, 0);
  objc_storeStrong((id *)&self->_customBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tableActionMenu, 0);
  objc_storeStrong((id *)&self->_pillOrnamentViewController, 0);
  objc_storeStrong((id *)&self->_sidecarMenuController, 0);
  objc_storeStrong((id *)&self->_mediaActionMenu, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
