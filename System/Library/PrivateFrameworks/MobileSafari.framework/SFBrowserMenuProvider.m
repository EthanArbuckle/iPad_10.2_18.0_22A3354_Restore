@implementation SFBrowserMenuProvider

- (void)setWebExtensionsController:(id)a3
{
  objc_storeStrong((id *)&self->_webExtensionsController, a3);
}

void __39__SFBrowserMenuProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_sharedProvider_0;
  sharedProvider_sharedProvider_0 = (uint64_t)v1;

}

- (SFBrowserMenuProvider)init
{
  SFBrowserMenuProvider *v2;
  SFBrowserMenuProvider *v3;
  void *v4;
  SFBrowserMenuProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBrowserMenuProvider;
  v2 = -[SFBrowserMenuProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_persona = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__enabledExtensionsDidChange, *MEMORY[0x1E0D8A380], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__enabledExtensionsDidChange, *MEMORY[0x1E0D8A388], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__enabledExtensionsDidChange, *MEMORY[0x1E0D8A300], 0);
    v5 = v3;

  }
  return v3;
}

+ (SFBrowserMenuProvider)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFBrowserMenuProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_once != -1)
    dispatch_once(&sharedProvider_once, block);
  return (SFBrowserMenuProvider *)(id)sharedProvider_sharedProvider_0;
}

- (void)setMenusForSafariWithBuilder:(id)a3
{
  id v4;

  v4 = a3;
  -[SFBrowserMenuProvider _setMenusIfNecessaryForPersona:](self, "_setMenusIfNecessaryForPersona:", 0);
  -[SFBrowserMenuProvider _setMenusForPersona:withBuilder:](self, "_setMenusForPersona:withBuilder:", 0, v4);

}

- (void)setMenusIfNecessaryForSafariViewServiceWithBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((self->_persona | 4) != 4)
  {
    v5 = v4;
    -[SFBrowserMenuProvider _setMenusIfNecessaryForPersona:](self, "_setMenusIfNecessaryForPersona:");
    -[SFBrowserMenuProvider _setMenusForPersona:withBuilder:](self, "_setMenusForPersona:withBuilder:", self->_persona, v5);
    v4 = v5;
  }

}

- (void)rebuildMenuIfNeededForPersona:(int64_t)a3
{
  id v3;

  if (self->_persona != a3)
  {
    self->_persona = a3;
    objc_msgSend(MEMORY[0x1E0DC39F0], "mainSystem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsRebuild");

  }
}

- (void)clearCachedMenuForPersona:(int64_t)a3
{
  Class *v3;
  Class v4;
  Class v5;
  id v6;

  v3 = &self->super.isa + a3;
  v4 = v3[1];
  v3[1] = 0;

  v5 = v3[5];
  v3[5] = 0;

  objc_msgSend(MEMORY[0x1E0DC39F0], "mainSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRebuild");

}

- (void)_setMenusIfNecessaryForPersona:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
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
  void *v31;
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
  uint64_t v49;
  void *v50;
  unint64_t v51;
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
  int64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSDictionary *v113;
  uint64_t v114;
  Class *v115;
  Class v116;
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
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  NSDictionary **personaToMenusMap;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  int64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  _QWORD v167[6];
  _QWORD v168[6];
  _QWORD v169[12];
  _QWORD v170[8];
  _QWORD v171[8];
  _QWORD v172[6];
  void *v173;
  _QWORD v174[9];
  _QWORD v175[2];
  _QWORD v176[2];
  void *v177;
  _QWORD v178[3];
  _QWORD v179[2];
  void *v180;
  _QWORD v181[6];
  void *v182;
  _QWORD v183[3];

  v3 = a3;
  v183[1] = *MEMORY[0x1E0C80C00];
  if (!self->_personaToMenusMap[a3] || !self->_personaToCommandSetMap[a3])
  {
    personaToMenusMap = self->_personaToMenusMap;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x1E0C99000;
    v164 = v5;
    v156 = v6;
    v159 = v3;
    if (!v3)
    {
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3680];
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alternateWithTitle:action:modifierFlags:", v10, sel_newTabWithAlternativeOrderingKeyPressed, 0x80000);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v182, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:alternates:", sel_openNewTab_, CFSTR("T"), 0x100000, v8, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v183[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v14);

      v15 = -[SFBrowserMenuProvider _newDocumentCommands](self, "_newDocumentCommands");
      objc_msgSend(v6, "addObjectsFromArray:", v15);

      _WBSLocalizedString();
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_newTabGroupKeyPressed, CFSTR("N"), 1310720, v165, 1);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v181[0] = v161;
      _WBSLocalizedString();
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_focusAddressFieldKeyPressed, CFSTR("L"), 0x100000, v157, 0);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v181[1] = v153;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_focusAddressFieldKeyPressed, CFSTR("F"), 1572864, 0, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v181[2] = v16;
      -[SFBrowserMenuProvider _placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:](self, "_placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:", sel_emptySelectorForOpenInNewTabModifierLinkTap, v160, 0x100000, &stru_1E21FE780);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v181[3] = v17;
      -[SFBrowserMenuProvider _placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:](self, "_placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:", sel_emptySelectorForOpenInNewTabOppositePreferenceModifierLinkTap, v160, 1179648, &stru_1E21FE780);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v181[4] = v18;
      _WBSLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0DC3680];
      _WBSLocalizedString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "alternateWithTitle:action:modifierFlags:", v21, sel_closeOtherTabsKeyPressed, 0x80000);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:alternates:", sel_closeActiveTab_, CFSTR("W"), 0x100000, v19, 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v181[5] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "addObjectsFromArray:", v25);

      v7 = 0x1E0C99000uLL;
      v6 = v156;

      v3 = 0;
      v5 = v164;

    }
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_saveKeyPressed, CFSTR("S"), 0x100000, &stru_1E21FE780, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v179[0] = v26;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_saveKeyPressed, CFSTR("S"), 1179648, 1, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v179[1] = v27;
    objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", v179, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v28);

    if (!v3)
    {
      _WBSLocalizedString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:](self, "_placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:", sel_emptySelectorForDownloadModifierLinkTap, v160, 0x80000, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v178[0] = v30;
      _WBSLocalizedString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_emailCurrentPage, CFSTR("I"), 0x100000, v31, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v178[1] = v32;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_printKeyPressed, CFSTR("P"), 0x100000, 0, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v178[2] = v33;
      objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", v178, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v34);

      v7 = 0x1E0C99000uLL;
    }
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "isScribbleEnabled"))
    {
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_scribbleDoneKeyPressed, CFSTR("\r"), 0, 0, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v35);

    }
    if (v3 == 1)
    {
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_dismissSFSafariViewControllerKeyPressed, CFSTR("W"), 0x100000, 0, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v36);

    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", CFSTR("File"), 0, CFSTR("FileMenu"), 1, v6);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "count");
    objc_msgSend(v5, "addObjectsFromArray:", v6);
    _WBSLocalizedString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_autoFillFormKeyPressed, CFSTR("A"), 1179648, v37, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v38;
    objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", &v177, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", CFSTR("Edit"), 0, CFSTR("EditMenu"), 1, v39);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "count");
    v150 = v39;
    objc_msgSend(v5, "addObjectsFromArray:", v39);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v40;
    if (v3)
    {
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleReaderKeyPressed, CFSTR("R"), 1179648, &stru_1E21FE780, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v41);
    }
    else
    {
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleShowingFavoritesBarKeyPressed, CFSTR("B"), 1179648, &stru_1E21FE780, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v176[0] = v42;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleBookmarksKeyPressed, CFSTR("L"), 1179648, &stru_1E21FE780, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v176[1] = v43;
      objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", v176, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v44);

      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleReaderKeyPressed, CFSTR("R"), 1179648, &stru_1E21FE780, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v45);

      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleTabViewKeyPressed, CFSTR("\\"), 1179648, &stru_1E21FE780, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v175[0] = v41;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleDownloadsKeyPressed, CFSTR("L"), 1572864, &stru_1E21FE780, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v175[1] = v46;
      objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", v175, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v47);

    }
    _WBSLocalizedString();
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0DC3680];
    _WBSLocalizedString();
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "alternateWithTitle:action:modifierFlags:", v166, sel_reloadFromOriginKeyPressed, 0x80000);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = v162;
    objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", &v173, 1);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:alternates:", sel_reloadKeyPressed, CFSTR("R"), 0x100000, v154, 0, v147);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v174[0] = v145;
    v49 = MEMORY[0x1E0C9AA60];
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", sel_cancelKeyPressed, *MEMORY[0x1E0DC4DA0], 0, 0, 1, 1, 0, MEMORY[0x1E0C9AA60]);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v174[1] = v142;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", sel_cancelKeyPressed, CFSTR("."), 0x100000, 0, 1, 1, 1, v49);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v174[2] = v139;
    _WBSLocalizedString();
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_resetPageZoomLevelAndFontSize, CFSTR("0"), 0x100000, v136, 1);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v174[3] = v132;
    _WBSLocalizedString();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_increaseSize_, CFSTR("+"), 0x100000, v50, 1);
    v51 = v7;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v174[4] = v52;
    _WBSLocalizedString();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_decreaseSize_, CFSTR("-"), 0x100000, v53, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v174[5] = v54;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_increaseSize_, CFSTR("="), 0x100000, 1, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v174[6] = v55;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_decreaseSize_, CFSTR("_"), 0x100000, 1, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v174[7] = v56;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_toggleShowWebpageStatusBar, CFSTR("/"), 0x100000, &stru_1E21FE780, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v174[8] = v57;
    objc_msgSend(*(id *)(v51 + 3360), "arrayWithObjects:count:", v174, 9);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObjectsFromArray:", v58);

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", CFSTR("View"), 0, CFSTR("ViewMenu"), 1, v158);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "count");
    objc_msgSend(v164, "addObjectsFromArray:", v158);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_showHistoryCollectionKeyPressed, CFSTR("3"), 1310720, &stru_1E21FE780, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v172[0] = v59;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_showHistoryCollectionKeyPressed, CFSTR("Y"), 0x100000, 1, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v172[1] = v60;
    _WBSLocalizedString();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_navigateBackKeyPressed, CFSTR("["), 0x100000, v61, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v172[2] = v62;
    _WBSLocalizedString();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_navigateForwardKeyPressed, CFSTR("]"), 0x100000, v63, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v172[3] = v64;
    v140 = *MEMORY[0x1E0DC4E10];
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_navigateBackKeyPressed);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v172[4] = v65;
    v137 = *MEMORY[0x1E0DC4E28];
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_navigateForwardKeyPressed);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v172[5] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 6);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "addObjectsFromArray:", v67);

    v68 = v159;
    if (!v159)
    {
      _WBSLocalizedString();
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_reopenLastClosedTabPressed, CFSTR("T"), 1179648, v69, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "addObject:", v70);

    }
    v71 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "menuWithTitle:image:identifier:options:children:", v72, 0, CFSTR("HistoryMenu"), 1, v163);
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v163, "count");
    v73 = v164;
    objc_msgSend(v164, "addObjectsFromArray:", v163);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v74;
    if (!v159)
    {
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_showBookmarksCollectionKeyPressed, CFSTR("1"), 1310720, &stru_1E21FE780, 1);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v171[0] = v143;
      _WBSLocalizedString();
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_editBookmarksKeyPressed, CFSTR("B"), 1572864, v133, 1);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v171[1] = v129;
      _WBSLocalizedString();
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_addToBookmarks_, CFSTR("D"), 0x100000, v126, 1);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v171[2] = v123;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_showReadingListCollectionKeyPressed, CFSTR("2"), 1310720, &stru_1E21FE780, 1);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v171[3] = v120;
      _WBSLocalizedString();
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_addToReadingList_, CFSTR("D"), 1179648, v118, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v171[4] = v75;
      _WBSLocalizedString();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:](self, "_placeholderCommandWithAction:input:modifierFlags:discoverabilityTitle:", sel_emptySelectorForAddLinkToReadingListModifierLinkTap, v160, 0x20000, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v171[5] = v77;
      v78 = *MEMORY[0x1E0DC4E30];
      _WBSLocalizedString();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_previousReadingListItemKeyPressed, v78, 0x100000, v79, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v171[6] = v80;
      v81 = *MEMORY[0x1E0DC4D90];
      _WBSLocalizedString();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_nextReadingListItemKeyPressed, v81, 0x100000, v82, 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v171[7] = v83;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 8);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addObjectsFromArray:", v84);

      v73 = v164;
      v68 = 0;

      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_showCloudTabsCollectionKeyPressed, CFSTR("I"), 1310720, &stru_1E21FE780, 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addObject:", v85);

      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_showSharedWithYouCollectionKeyPressed, CFSTR("S"), 1310720, &stru_1E21FE780, 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addObject:", v86);

    }
    v87 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "menuWithTitle:image:identifier:options:children:", v88, 0, CFSTR("BookmarksMenu"), 1, v74);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v74, "count");
    objc_msgSend(v73, "addObjectsFromArray:", v74);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v68)
    {
      _WBSLocalizedString();
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = MEMORY[0x1E0C9AA60];
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", sel_previousTabKeyPressed_, CFSTR("\t"), 393216, v134, 1, 0, 0, MEMORY[0x1E0C9AA60]);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v170[0] = v130;
      _WBSLocalizedString();
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", sel_nextTabKeyPressed_, CFSTR("\t"), 0x40000, v127, 1, 0, 0, v90);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v170[1] = v124;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_previousTabKeyPressed_, CFSTR("["), 1179648, 0, 1);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v170[2] = v121;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_nextTabKeyPressed_, CFSTR("]"), 1179648, 0, 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v170[3] = v91;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_previousTabKeyPressed_, v140, 1179648, 0, 2);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v170[4] = v92;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_nextTabKeyPressed_, v137, 1179648, 0, 2);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v170[5] = v93;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", sel_previousTabKeyPressed_, v140, 1572864, 0, 1, 1, 3, v90);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v170[6] = v94;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", sel_nextTabKeyPressed_, v137, 1572864, 0, 1, 1, 3, v90);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v170[7] = v95;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 8);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "addObjectsFromArray:", v96);

      -[SFBrowserMenuProvider _switchToTabCommands](self, "_switchToTabCommands");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "addObjectsFromArray:", v97);

      _WBSLocalizedString();
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_closeTabGroupKeyPressed, CFSTR("W"), 1703936, v141, 1);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v169[0] = v138;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_closeTabGroupKeyPressed, CFSTR("\b"), 1703936, 1, 1);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v169[1] = v135;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_closeTabGroupKeyPressed, CFSTR("W"), 1310720, 1, 2);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v169[2] = v131;
      _WBSLocalizedString();
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_renameTabGroupKeyPressed, CFSTR("\r"), 1572864, v128, 1);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v169[3] = v125;
      _WBSLocalizedString();
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_previousTabGroupKeyPressed, CFSTR("["), 1572864, v122, 1);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v169[4] = v119;
      v98 = *MEMORY[0x1E0DC4E30];
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_previousTabGroupKeyPressed, *MEMORY[0x1E0DC4E30], 1179648, 1, 1);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v169[5] = v117;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_previousTabGroupKeyPressed, v98, 1572864, 1, 2);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v169[6] = v99;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_previousTabGroupKeyPressed, CFSTR("["), 1310720, 1, 3);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v169[7] = v100;
      _WBSLocalizedString();
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_nextTabGroupKeyPressed, CFSTR("]"), 1572864, v101, 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v169[8] = v102;
      v103 = *MEMORY[0x1E0DC4D90];
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_nextTabGroupKeyPressed, *MEMORY[0x1E0DC4D90], 1179648, 1, 1);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v169[9] = v104;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_nextTabGroupKeyPressed, v103, 1572864, 1, 2);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v169[10] = v105;
      -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_nextTabGroupKeyPressed, CFSTR("]"), 1310720, 1, 3);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v169[11] = v106;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 12);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "addObjectsFromArray:", v107);

      v73 = v164;
      v68 = v159;

      if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSafariProfilesEnabled"))
      {
        -[SFBrowserMenuProvider _switchToProfileCommands](self, "_switchToProfileCommands");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "addObjectsFromArray:", v108);

      }
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", CFSTR("Window"), 0, CFSTR("WindowMenu"), 1, v89);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "count");
    objc_msgSend(v73, "addObjectsFromArray:", v89);
    v110 = *MEMORY[0x1E0DC5058];
    v167[0] = *MEMORY[0x1E0DC5060];
    v167[1] = v110;
    v168[0] = v151;
    v168[1] = v149;
    v167[2] = *MEMORY[0x1E0DC5180];
    v167[3] = CFSTR("HistoryMenu");
    v168[2] = v148;
    v168[3] = v146;
    v111 = *MEMORY[0x1E0DC5188];
    v167[4] = CFSTR("BookmarksMenu");
    v167[5] = v111;
    v168[4] = v144;
    v168[5] = v109;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 6);
    v112 = objc_claimAutoreleasedReturnValue();
    v113 = personaToMenusMap[v68];
    personaToMenusMap[v68] = (NSDictionary *)v112;

    v114 = objc_msgSend(v73, "copy");
    v115 = &self->super.isa + v68;
    v116 = v115[5];
    v115[5] = (Class)v114;

  }
}

- (void)_setMenusForPersona:(int64_t)a3 withBuilder:(id)a4
{
  uint64_t v6;
  NSDictionary *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v6 = *MEMORY[0x1E0DC5060];
  v7 = self->_personaToMenusMap[a3];
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertChildMenu:atEndOfMenuForIdentifier:", v8, v6);

  v9 = *MEMORY[0x1E0DC5058];
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5058]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertChildMenu:atEndOfMenuForIdentifier:", v10, v9);

  objc_msgSend(v18, "removeMenuForIdentifier:", *MEMORY[0x1E0DC5150]);
  v11 = *MEMORY[0x1E0DC5180];
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5180]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertChildMenu:atEndOfMenuForIdentifier:", v12, v11);

  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("HistoryMenu"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertSiblingMenu:afterMenuForIdentifier:", v13, v11);

  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("BookmarksMenu"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertSiblingMenu:afterMenuForIdentifier:", v14, CFSTR("HistoryMenu"));

  v15 = *MEMORY[0x1E0DC5188];
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5188]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "insertChildMenu:atEndOfMenuForIdentifier:", v16, v15);
  -[SFBrowserMenuProvider _extensionsMenu](self, "_extensionsMenu");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v18, "insertChildMenu:atEndOfMenuForIdentifier:", v17, *MEMORY[0x1E0DC50E0]);

}

- (id)_newDocumentCommands
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerForKey:", CFSTR("NewDocumentShortcutBehavior"));

  if (v5 == 1)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_openNewWindowInFrontmostProfile_, CFSTR("N"), 0x100000, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_openNewPrivateWindow_, CFSTR("N"), 1179648, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_openNewWindowInFrontmostProfile_, CFSTR("N"), 1572864, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v10;
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_openNewPrivateWindow_, CFSTR("N"), 1703936, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v5)
  {
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:webInterceptable:property:](self, "_commandWithAction:input:modifierFlags:webInterceptable:property:", sel_openNewTab_, CFSTR("N"), 0x100000, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_openNewPrivateTab_, CFSTR("N"), 1179648, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_openNewWindowInFrontmostProfile_, CFSTR("N"), 1572864, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:", sel_openNewPrivateWindow_, CFSTR("N"), 1703936, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  }
  return v2;
}

- (id)_switchToTabCommands
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SFBrowserMenuProvider *v10;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SFBrowserMenuProvider__switchToTabCommands__block_invoke;
  v8[3] = &unk_1E21E2BD8;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v8);
  v6 = v5;

  return v6;
}

void __45__SFBrowserMenuProvider__switchToTabCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2 == 9 || a2 == 1)
  {
    _WBSLocalizedString();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:property:alternates:", sel_switchToTabKeyPressed_, v4, 0x100000, v7, 0, a2, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (id)_switchToProfileCommands
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SFBrowserMenuProvider *v10;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SFBrowserMenuProvider__switchToProfileCommands__block_invoke;
  v8[3] = &unk_1E21E2BD8;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v8);
  v6 = v5;

  return v6;
}

void __49__SFBrowserMenuProvider__switchToProfileCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:property:alternates:", sel_switchToProfileKeyPressed_, v6, 1703936, &stru_1E21FE780, 0, a2, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (BOOL)commandConflictsWithTextEditing:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "propertyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = ((unint64_t)objc_msgSend(v3, "integerValue") >> 20) & 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)_placeholderCommandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6
{
  void *v6;
  uint64_t v7;

  -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:webInterceptable:property:alternates:", a3, a4, a5, a6, 1, 0, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "_placeholderKeyCommand");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 webInterceptable:(BOOL)a6 property:(unint64_t)a7
{
  return -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", a3, a4, a5, 0, 0, a6, a7, MEMORY[0x1E0C9AA60]);
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7
{
  return -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", a3, a4, a5, a6, 0, a7, 0, MEMORY[0x1E0C9AA60]);
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7 alternates:(id)a8
{
  return -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", a3, a4, a5, a6, 0, a7, 0, a8);
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 webInterceptable:(BOOL)a7 property:(unint64_t)a8 alternates:(id)a9
{
  return -[SFBrowserMenuProvider _commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:](self, "_commandWithAction:input:modifierFlags:discoverabilityTitle:wantsPriorityOverSystemBehavior:webInterceptable:property:alternates:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (id)_commandWithAction:(SEL)a3 input:(id)a4 modifierFlags:(int64_t)a5 discoverabilityTitle:(id)a6 wantsPriorityOverSystemBehavior:(BOOL)a7 webInterceptable:(BOOL)a8 property:(unint64_t)a9 alternates:(id)a10
{
  _BOOL8 v10;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v24;

  v24 = a8;
  v10 = a7;
  v14 = (const __CFString *)a6;
  v15 = (__CFString *)v14;
  v16 = (void *)MEMORY[0x1E0DC3930];
  if (v14)
    v17 = v14;
  else
    v17 = &stru_1E21FE780;
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = a10;
  v20 = a4;
  objc_msgSend(v18, "numberWithUnsignedInteger:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v17, 0, a3, v20, a5, v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v22, "setDiscoverabilityTitle:", v15);
  else
    objc_msgSend(v22, "setAttributes:", 4);
  objc_msgSend(v22, "setWantsPriorityOverSystemBehavior:", v10);
  if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "_markHandleAfterKeyEvent");

  return v22;
}

- (id)_extensionsMenu
{
  void *v3;
  void *v4;
  SFWebExtensionsController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  SFWebExtensionsController *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSSet mutableCopy](self->_personaToCommandSetMap[self->_persona], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_webExtensionsController;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v5;
  -[WBSWebExtensionsController webExtensionKeyCommands](v5, "webExtensionKeyCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v3, "containsObject:", v11))
        {
          v12 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_impl(&dword_18B7B2000, v12, OS_LOG_TYPE_INFO, "Discarding conflicting key command: %@", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(v4, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v4, "count"))
  {
    v13 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "menuWithTitle:image:identifier:options:children:", v14, 0, CFSTR("ExtensionsMenu"), 1, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_enabledExtensionsDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC39F0], "mainSystem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsRebuild");

}

- (SFWebExtensionsController)webExtensionsController
{
  return self->_webExtensionsController;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  for (i = 64; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end
