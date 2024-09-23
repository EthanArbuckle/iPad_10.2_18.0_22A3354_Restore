@implementation LPConcretePresentationProperties

- (LPConcretePresentationProperties)initWithParameters:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  LPConcretePresentationProperties *v8;
  uint64_t v9;
  LPCaptionButtonPresentationProperties *captionButton;
  uint64_t v11;
  LPCaptionButtonPresentationProperties *captionTextButton;
  LPConcretePresentationProperties *v13;
  id v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;
  void *v22;
  LPCaptionBarPresentationProperties *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  LPPlayButtonPresentationProperties *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  LPCaptionButtonPresentationProperties *v55;
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
  void *v76;
  LPCaptionButtonPresentationProperties *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
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
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  unint64_t v99;
  unint64_t v100;
  LPCaptionBarPresentationProperties *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  char v109;
  void *v110;
  char v111;
  void *v112;
  char v113;
  void *v114;
  char v115;
  void *v116;
  char v117;
  void *v118;
  char v119;
  void *v120;
  char v121;
  void *v122;
  char v123;
  void *v124;
  char v125;
  void *v126;
  char v127;
  void *v128;
  char v129;
  void *v130;
  char v131;
  void *v132;
  char v133;
  void *v134;
  char v135;
  void *v136;
  char v137;
  void *v138;
  LPConcretePresentationProperties *v139;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void (**v147)(void *, void *, uint64_t);
  id v148;
  id v149;
  _QWORD aBlock[4];
  LPConcretePresentationProperties *v151;
  objc_super v152;

  v6 = a3;
  v7 = a4;
  v152.receiver = self;
  v152.super_class = (Class)LPConcretePresentationProperties;
  v8 = -[LPConcretePresentationProperties init](&v152, sel_init);

  if (!v8)
    goto LABEL_178;
  objc_msgSend(v6, "captionButton");
  v9 = objc_claimAutoreleasedReturnValue();
  captionButton = v8->_captionButton;
  v8->_captionButton = (LPCaptionButtonPresentationProperties *)v9;

  objc_msgSend(v6, "captionTextButton");
  v11 = objc_claimAutoreleasedReturnValue();
  captionTextButton = v8->_captionTextButton;
  v8->_captionTextButton = (LPCaptionButtonPresentationProperties *)v11;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LPConcretePresentationProperties_initWithParameters_properties___block_invoke;
  aBlock[3] = &unk_1E44A9ED8;
  v13 = v8;
  v151 = v13;
  v147 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v7, "overrideURL"),
        v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v143 = v14;
    -[LPWebLinkPresentationProperties setOverrideURL:](v13, "setOverrideURL:", v14);
    v15 = objc_opt_respondsToSelector();
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v7, "overrideAllowOpeningSensitiveURLs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    -[LPWebLinkPresentationProperties setOverrideAllowOpeningSensitiveURLs:](v13, "setOverrideAllowOpeningSensitiveURLs:", v16);
    if ((v15 & 1) != 0)

  }
  else
  {
    v143 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v7, "isPreliminary");
  else
    v17 = 0;
  -[LPWebLinkPresentationProperties setPreliminary:](v13, "setPreliminary:", v17);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v7, "style");
  else
    v18 = 0;
  -[LPWebLinkPresentationProperties setStyle:](v13, "setStyle:", v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "topCaption");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  v146 = v19;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "bottomCaption");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  v145 = v20;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "trailingTopCaption");
    v149 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v149 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "trailingBottomCaption");
    v148 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_31;
  }
  else
  {
    v148 = 0;
    if (v19)
    {
LABEL_31:
      v23 = objc_alloc_init(LPCaptionBarPresentationProperties);
      -[LPWebLinkPresentationProperties setCaptionBar:](v13, "setCaptionBar:", v23);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "top");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "leading");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v146);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottom");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leading");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setText:", v145);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "top");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailing");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v149);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bottom");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "trailing");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setText:", v148);

LABEL_34:
      goto LABEL_35;
    }
  }
  if (v20 || v149 || v148)
    goto LABEL_31;
  v21 = objc_opt_respondsToSelector();
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v7, "captionBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  -[LPWebLinkPresentationProperties setCaptionBar:](v13, "setCaptionBar:", v22);
  if ((v21 & 1) != 0)
    goto LABEL_34;
LABEL_35:
  objc_msgSend(v6, "overrideSubtitle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v6, "overrideSubtitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottom");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leading");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAttributedText:", v36);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v7, "icon"),
        v40 = (id)objc_claimAutoreleasedReturnValue(),
        v40,
        (v144 = v40) != 0))
  {
    -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTrailingIcon:", v144);

  }
  else
  {
    v144 = 0;
  }
  if ((objc_msgSend(v6, "usesComputedPresentationProperties") & 1) == 0
    && -[LPWebLinkPresentationProperties style](v13, "style") == 44)
  {
    +[LPWalletPresentationSpecialization captionButtonPropertiesForPasses](LPWalletPresentationSpecialization, "captionButtonPropertiesForPasses");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v147[2](v147, v42, 1);

  }
  if ((objc_msgSend(v6, "usesComputedPresentationProperties") & 1) == 0
    && -[LPWebLinkPresentationProperties style](v13, "style") == 53)
  {
    +[LPWalletPresentationSpecialization captionButtonPropertiesForOrders](LPWalletPresentationSpecialization, "captionButtonPropertiesForOrders");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v147[2](v147, v43, 1);

  }
  if (sizeClassAllowsPillButtonFromSpecialization(objc_msgSend(v6, "effectiveSizeClass")))
  {
    if (-[LPWebLinkPresentationProperties style](v13, "style") == 46)
    {
      +[LPFaceTimeInvitePresentationSpecialization captionButtonProperties](LPFaceTimeInvitePresentationSpecialization, "captionButtonProperties");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v147[2](v147, v44, objc_msgSend(v6, "inComposeContext") ^ 1);

    }
    if (-[LPWebLinkPresentationProperties style](v13, "style") == 48)
    {
      +[LPPasswordsInvitePresentationSpecialization captionButtonProperties](LPPasswordsInvitePresentationSpecialization, "captionButtonProperties");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v147[2](v147, v45, objc_msgSend(v6, "inComposeContext") ^ 1);

    }
  }
  if ((objc_msgSend(v6, "inComposeContext") & 1) == 0
    && sizeClassAllowsPillButtonFromSpecialization(objc_msgSend(v6, "effectiveSizeClass"))
    && -[LPWebLinkPresentationProperties style](v13, "style") == 50
    && (objc_msgSend(v6, "inSenderContext") & 1) == 0)
  {
    +[LPApplePhotosSharedLibraryInvitationPresentationSpecialization captionButtonProperties](LPApplePhotosSharedLibraryInvitationPresentationSpecialization, "captionButtonProperties");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v147[2](v147, v46, 1);

  }
  -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "playButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
  {
    v49 = objc_alloc_init(LPPlayButtonPresentationProperties);
    -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPlayButton:", v49);

  }
  v51 = objc_msgSend(v6, "inComposeContext");
  -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "playButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDisabled:", v51);

  if (-[LPWebLinkPresentationProperties style](v13, "style") == 47)
  {
    if (!v8->_captionTextButton)
      goto LABEL_70;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionButtonPresentationProperties setForegroundColor:](v8->_captionTextButton, "setForegroundColor:", v54);

  }
  v55 = v8->_captionTextButton;
  if (v55)
  {
    if (-[LPCaptionButtonPresentationProperties type](v55, "type") == 2)
    {
      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "bottom");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "leading");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setText:", 0);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "bottom");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "trailing");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setText:", 0);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "belowBottom");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "leading");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setText:", 0);

      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "belowBottom");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "trailing");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setText:", 0);

    }
    objc_msgSend(v6, "overrideSubtitleButtonColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v6, "overrideSubtitleButtonColor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionButtonPresentationProperties setBackgroundColor:](v8->_captionTextButton, "setBackgroundColor:", v69);

    }
    -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bottom");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v71, "hasAnyContent") & 1) == 0)
    {
      objc_msgSend(v71, "leading");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setText:", CFSTR("​"));

    }
    objc_msgSend(v71, "setButton:", v8->_captionTextButton);

  }
LABEL_70:
  if (v8->_captionButton)
  {
    objc_msgSend(v6, "overrideActionButtonColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v6, "overrideActionButtonColor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionButtonPresentationProperties setBackgroundColor:](v8->_captionButton, "setBackgroundColor:", v74);

    }
    if ((sizeClassAllowsPillButton(objc_msgSend(v6, "effectiveSizeClass")) & 1) != 0
      || sizeClassAllowsPillButton(objc_msgSend(v6, "effectiveSizeClass"))
      && (-[LPConcretePresentationProperties captionButton](v13, "captionButton"),
          v75 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v75, "actions"),
          v76 = (void *)objc_claimAutoreleasedReturnValue(),
          v76,
          v75,
          v76))
    {
      v77 = v8->_captionButton;
      -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setButton:", v77);

      if (objc_msgSend(v6, "effectiveSizeClass") == 12)
      {
        -[LPConcretePresentationProperties captionButton](v13, "captionButton");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "actions");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v80, "count") >= 2)
        {

        }
        else
        {
          -[LPConcretePresentationProperties captionButton](v13, "captionButton");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "actions");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v82, "count") != 1)
          {

LABEL_88:
            goto LABEL_89;
          }
          -[LPConcretePresentationProperties captionButton](v13, "captionButton");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "actions");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "firstObject");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "handler");
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          if (v84)
            goto LABEL_89;
        }
        -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "bottom");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "leading");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setText:", 0);

        -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "bottom");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "trailing");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setText:", 0);

        -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "belowBottom");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "leading");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setText:", 0);

        -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "belowBottom");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "trailing");
        v96 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v96, "setText:", 0);

        -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "top");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v96) = objc_msgSend(v98, "hasAnyContent");

        if ((v96 & 1) != 0)
          goto LABEL_89;
        -[LPWebLinkPresentationProperties captionBar](v13, "captionBar");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "top");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "leading");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setText:", CFSTR("​"));
        goto LABEL_88;
      }
    }
  }
LABEL_89:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "mediaTopCaption");
    v99 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v99 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "mediaBottomCaption");
    v100 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v100 = 0;
  }
  if (v99 | v100)
  {
    v101 = objc_alloc_init(LPCaptionBarPresentationProperties);
    -[LPWebLinkPresentationProperties setMediaBottomCaptionBar:](v13, "setMediaBottomCaptionBar:", v101);

    -[LPWebLinkPresentationProperties mediaBottomCaptionBar](v13, "mediaBottomCaptionBar");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "top");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "leading");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setText:", v99);

    -[LPWebLinkPresentationProperties mediaBottomCaptionBar](v13, "mediaBottomCaptionBar");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "bottom");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "leading");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setText:", v100);

  }
  else
  {
    v108 = objc_opt_respondsToSelector();
    if ((v108 & 1) != 0)
    {
      objc_msgSend(v7, "mediaBottomCaptionBar");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v105 = 0;
    }
    -[LPWebLinkPresentationProperties setMediaBottomCaptionBar:](v13, "setMediaBottomCaptionBar:", v105);
    if ((v108 & 1) == 0)
      goto LABEL_102;
  }

LABEL_102:
  v109 = objc_opt_respondsToSelector();
  if ((v109 & 1) != 0)
  {
    objc_msgSend(v7, "mediaTopCaptionBar");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v110 = 0;
  }
  -[LPWebLinkPresentationProperties setMediaTopCaptionBar:](v13, "setMediaTopCaptionBar:", v110);
  if ((v109 & 1) != 0)

  v111 = objc_opt_respondsToSelector();
  if ((v111 & 1) != 0)
  {
    objc_msgSend(v7, "quotedText");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v112 = 0;
  }
  -[LPWebLinkPresentationProperties setQuotedText:](v13, "setQuotedText:", v112);
  if ((v111 & 1) != 0)

  v113 = objc_opt_respondsToSelector();
  if ((v113 & 1) != 0)
  {
    objc_msgSend(v7, "image");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v114 = 0;
  }
  -[LPWebLinkPresentationProperties setImage:](v13, "setImage:", v114);
  if ((v113 & 1) != 0)

  v115 = objc_opt_respondsToSelector();
  if ((v115 & 1) != 0)
  {
    objc_msgSend(v7, "imageProperties");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v116 = 0;
  }
  -[LPWebLinkPresentationProperties setImageProperties:](v13, "setImageProperties:", v116);
  if ((v115 & 1) != 0)

  v117 = objc_opt_respondsToSelector();
  if ((v117 & 1) != 0)
  {
    objc_msgSend(v7, "alternateImages");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v118 = 0;
  }
  -[LPWebLinkPresentationProperties setAlternateImages:](v13, "setAlternateImages:", v118);
  if ((v117 & 1) != 0)

  v119 = objc_opt_respondsToSelector();
  if ((v119 & 1) != 0)
  {
    objc_msgSend(v7, "arAsset");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v120 = 0;
  }
  -[LPWebLinkPresentationProperties setArAsset:](v13, "setArAsset:", v120);
  if ((v119 & 1) != 0)

  v121 = objc_opt_respondsToSelector();
  if ((v121 & 1) != 0)
  {
    objc_msgSend(v7, "video");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v122 = 0;
  }
  -[LPWebLinkPresentationProperties setVideo:](v13, "setVideo:", v122);
  if ((v121 & 1) != 0)

  v123 = objc_opt_respondsToSelector();
  if ((v123 & 1) != 0)
  {
    objc_msgSend(v7, "inlinePlaybackInformation");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v124 = 0;
  }
  -[LPWebLinkPresentationProperties setInlinePlaybackInformation:](v13, "setInlinePlaybackInformation:", v124);
  if ((v123 & 1) != 0)

  v125 = objc_opt_respondsToSelector();
  if ((v125 & 1) != 0)
  {
    objc_msgSend(v7, "backgroundColor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v126 = 0;
  }
  -[LPWebLinkPresentationProperties setBackgroundColor:](v13, "setBackgroundColor:", v126);
  if ((v125 & 1) != 0)

  v127 = objc_opt_respondsToSelector();
  if ((v127 & 1) != 0)
  {
    objc_msgSend(v7, "dominantImageBackgroundColor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v128 = 0;
  }
  -[LPWebLinkPresentationProperties setDominantImageBackgroundColor:](v13, "setDominantImageBackgroundColor:", v128);
  if ((v127 & 1) != 0)

  v129 = objc_opt_respondsToSelector();
  if ((v129 & 1) != 0)
  {
    objc_msgSend(v7, "minimumHeight");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v130 = 0;
  }
  -[LPWebLinkPresentationProperties setMinimumHeight:](v13, "setMinimumHeight:", v130);
  if ((v129 & 1) != 0)

  v131 = objc_opt_respondsToSelector();
  if ((v131 & 1) != 0)
  {
    objc_msgSend(v7, "domainNameForIndicator");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v132 = 0;
  }
  -[LPWebLinkPresentationProperties setDomainNameForIndicator:](v13, "setDomainNameForIndicator:", v132);
  if ((v131 & 1) != 0)

  v133 = objc_opt_respondsToSelector();
  if ((v133 & 1) != 0)
  {
    objc_msgSend(v7, "backgroundImage");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v134 = 0;
  }
  -[LPWebLinkPresentationProperties setBackgroundImage:](v13, "setBackgroundImage:", v134);
  if ((v133 & 1) != 0)

  v135 = objc_opt_respondsToSelector();
  if ((v135 & 1) != 0)
  {
    objc_msgSend(v7, "backgroundImageProperties");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v136 = 0;
  }
  -[LPWebLinkPresentationProperties setBackgroundImageProperties:](v13, "setBackgroundImageProperties:", v136);
  if ((v135 & 1) != 0)

  v137 = objc_opt_respondsToSelector();
  if ((v137 & 1) != 0)
  {
    objc_msgSend(v7, "progressSpinner");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v138 = 0;
  }
  -[LPWebLinkPresentationProperties setProgressSpinner:](v13, "setProgressSpinner:", v138);
  if ((v137 & 1) != 0)

  v139 = v13;
LABEL_178:

  return v8;
}

void __66__LPConcretePresentationProperties_initWithParameters_properties___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = objc_msgSend(v8, "type");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6 == 1)
  {
    objc_storeStrong((id *)(v7 + 184), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setDisabled:", a3 ^ 1u);
  }
  else
  {
    objc_storeStrong((id *)(v7 + 192), a2);
  }

}

- (BOOL)hasMedia
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[LPWebLinkPresentationProperties image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[LPWebLinkPresentationProperties video](self, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[LPWebLinkPresentationProperties arAsset](self, "arAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v4 = 1;
      else
        v4 = -[LPWebLinkPresentationProperties style](self, "style") == 15;

    }
  }

  return v4;
}

- (LPCaptionButtonPresentationProperties)captionButton
{
  return self->_captionButton;
}

- (void)setCaptionButton:(id)a3
{
  objc_storeStrong((id *)&self->_captionButton, a3);
}

- (LPCaptionButtonPresentationProperties)captionTextButton
{
  return self->_captionTextButton;
}

- (void)setCaptionTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_captionTextButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionTextButton, 0);
  objc_storeStrong((id *)&self->_captionButton, 0);
}

@end
