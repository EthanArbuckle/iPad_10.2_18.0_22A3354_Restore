@implementation AFUITargetDetectionController

- (NSMutableDictionary)fallbackAutoFillGroup
{
  return self->_fallbackAutoFillGroup;
}

- (unint64_t)delegateNeedsAutofillMode
{
  return self->_delegateNeedsAutofillMode;
}

- (AFUITargetDetectionController)init
{
  AFUITargetDetectionController *v2;
  uint64_t v3;
  NSMutableDictionary *autoFillGroup;
  uint64_t v5;
  NSMutableDictionary *autoFillContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFUITargetDetectionController;
  v2 = -[AFUITargetDetectionController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    autoFillGroup = v2->_autoFillGroup;
    v2->_autoFillGroup = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    autoFillContext = v2->_autoFillContext;
    v2->_autoFillContext = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (unint64_t)_needAutoFillCandidate:(id)a3 delegateAsResponder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  AFUITargetDetectionController *v44;
  id v45;
  void *v46;
  BOOL v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  _BOOL4 v84;
  _BOOL4 v85;
  BOOL v86;
  BOOL v87;
  char v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  _BOOL4 v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  AFUITargetDetectionController *v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  unint64_t v158;
  unint64_t v159;
  int v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  int64_t v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  uint64_t v174;
  void *v175;
  int64_t v176;
  void *v177;
  uint64_t v178;

  v6 = a3;
  v7 = a4;
  _AFUIResponderClass();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (_AFUITraitsProtocol(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v6, "conformsToProtocol:", v8),
        v8,
        !v9))
  {
    _AFUITextViewClass();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || !-[objc_class responderAcceptsText:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "responderAcceptsText:", v7))
    {
      goto LABEL_120;
    }
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v7, *MEMORY[0x24BE0B360]);

    v16 = 8;
    goto LABEL_121;
  }
  -[AFUITargetDetectionController clearAutoFillGroup](self, "clearAutoFillGroup");
  v10 = v6;
  v178 = -1;
  -[objc_class gatherRespondersFromResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "gatherRespondersFromResponder:", v10);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class textInputRespondersFromResponders:currentResponder:indexOfCurrent:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "textInputRespondersFromResponders:currentResponder:indexOfCurrent:", v175, v10, &v178);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("AFUIAutoFillPossibleRespondersKey"));

  if (v178 == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v11, "count"))
  {
    v14 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  else
  {
    v13 = objc_msgSend(v11, "count");
    if (v178 < 1)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", v178 - 1);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v17 = 0;
    if (v178 > 1 && v13 >= 3)
    {
      objc_msgSend(v11, "objectAtIndex:", v178 - 2);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = 0;
    if (v13 >= 1 && v178 < v13 - 1)
    {
      objc_msgSend(v11, "objectAtIndex:", v178 + 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    if (v13 < 2 || v178 >= v13 - 2)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", v178 + 2);
      v19 = objc_claimAutoreleasedReturnValue();
    }
  }
  +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v10);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v14);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_13;
LABEL_16:
    v167 = 0;
    if (v18)
      goto LABEL_14;
    goto LABEL_17;
  }
  v168 = 0;
  if (!v17)
    goto LABEL_16;
LABEL_13:
  +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v17);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
LABEL_14:
    +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v18);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_17:
  v172 = 0;
LABEL_18:
  v169 = (void *)v14;
  v163 = (void *)v17;
  v164 = (void *)v19;
  v171 = (void *)v18;
  v161 = v11;
  if (v19)
  {
    +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v19);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v165 = 0;
  }
  v174 = *MEMORY[0x24BE0B3A8];
  v176 = -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v177);
  v20 = -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v177, CFSTR("password"));
  v21 = -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v177, CFSTR("new-password"));
  v22 = -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v177, CFSTR("one-time-code"));
  v162 = v7;
  v166 = v20;
  if (v22 && (v23 = v22, v22 > v176) && v22 > v20 && (_AFUITextViewClass(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKey:", v10, *MEMORY[0x24BE0B360]);

    v24 = dyld_program_sdk_at_least();
    if (v23 == 2)
    {
LABEL_46:
      v47 = 0;
      v160 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v24 = dyld_program_sdk_at_least();
  }
  v25 = v24;
  if (v176)
  {
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v10, v174);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v28, v174);

    v173 = v177;
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("new-password")) == 2)
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = *MEMORY[0x24BE0B348];
      v32 = (void *)v18;
LABEL_42:
      objc_msgSend(v29, "setObject:forKey:", v32, v31);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v32);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setObject:forKey:", v53, v31);

      v47 = 0;
LABEL_43:
      v54 = 1;
LABEL_44:
      v160 = v54;
LABEL_72:
      v33 = v174;
      goto LABEL_73;
    }
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("password")))
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = *MEMORY[0x24BE0B370];
      objc_msgSend(v48, "setObject:forKey:", v18, *MEMORY[0x24BE0B370]);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v18);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKey:", v51, v49);

      if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v165, CFSTR("new-password")))
      {
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        v31 = *MEMORY[0x24BE0B348];
        v32 = v164;
        goto LABEL_42;
      }
      if (v176 == 2)
        v68 = v25;
      else
        v68 = 0;
      if (v68 == 1)
      {
        v160 = 0;
        v47 = -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("password")) == 2;
        goto LABEL_72;
      }
    }
    else
    {
      if (!-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, CFSTR("password"))|| v167)
      {
        v47 = 0;
        v54 = v168 != 0;
        goto LABEL_44;
      }
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *MEMORY[0x24BE0B370];
      objc_msgSend(v64, "setObject:forKey:", v169, *MEMORY[0x24BE0B370]);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v67, v65);

    }
    v47 = 0;
    v160 = 0;
    goto LABEL_72;
  }
  if (v169 && v21 == 2)
  {
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, CFSTR("new-password"))|| -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, CFSTR("password")))
    {
      v33 = v174;
      if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v167, v174))
      {
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v163, v174);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v163);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v36, v174);

        v173 = v167;
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *MEMORY[0x24BE0B370];
        objc_msgSend(v37, "setObject:forKey:", v169, *MEMORY[0x24BE0B370]);

        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x24BE0B348];
        objc_msgSend(v39, "setObject:forKey:", v10, *MEMORY[0x24BE0B348]);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKey:", v42, v38);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = self;
        v45 = v10;
LABEL_35:
        -[AFUITargetDetectionController placeholderTextForResponder:](v44, "placeholderTextForResponder:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKey:", v46, v40);

LABEL_36:
        goto LABEL_37;
      }
      goto LABEL_149;
    }
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("new-password"))|| -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("password")))
    {
      v33 = v174;
      if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, v174))
      {
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "setObject:forKey:", v169, v174);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "setObject:forKey:", v144, v174);

        v173 = v168;
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = *MEMORY[0x24BE0B370];
        objc_msgSend(v145, "setObject:forKey:", v10, *MEMORY[0x24BE0B370]);

        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x24BE0B348];
        objc_msgSend(v147, "setObject:forKey:", v171, *MEMORY[0x24BE0B348]);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKey:", v149, v146);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = self;
        v45 = v171;
        goto LABEL_35;
      }
LABEL_149:
      v47 = 0;
      v160 = 0;
      v173 = 0;
      goto LABEL_73;
    }
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v174;
    objc_msgSend(v150, "setObject:forKey:", v169, v174);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "setObject:forKey:", v152, v174);

    v173 = v168;
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = *MEMORY[0x24BE0B348];
    objc_msgSend(v153, "setObject:forKey:", v10, *MEMORY[0x24BE0B348]);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = self;
    v116 = v10;
LABEL_157:
    -[AFUITargetDetectionController placeholderTextForResponder:](v115, "placeholderTextForResponder:", v116);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v154, v114);

    goto LABEL_36;
  }
  if (!v166)
  {
    if ((objc_msgSend(v177, "isSecureTextEntry") & 1) == 0
      && -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("password")))
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v174;
      objc_msgSend(v105, "setObject:forKey:", v10, v174);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setObject:forKey:", v107, v174);

      v108 = v177;
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = *MEMORY[0x24BE0B370];
      objc_msgSend(v109, "setObject:forKey:", v171, *MEMORY[0x24BE0B370]);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v171);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "setObject:forKey:", v112, v110);

      v173 = v108;
      if (!-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v165, CFSTR("new-password")))
      {
        v47 = 0;
        v160 = 0;
        goto LABEL_73;
      }
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = *MEMORY[0x24BE0B348];
      objc_msgSend(v113, "setObject:forKey:", v164, *MEMORY[0x24BE0B348]);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = self;
      v116 = v164;
      goto LABEL_157;
    }
    goto LABEL_46;
  }
  if (!v18)
  {
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup", v172);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = *MEMORY[0x24BE0B370];
    objc_msgSend(v117, "setObject:forKey:", v10, *MEMORY[0x24BE0B370]);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v63, v118);
    v160 = 0;
    goto LABEL_128;
  }
  if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, CFSTR("new-password")))
  {
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *MEMORY[0x24BE0B370];
    objc_msgSend(v56, "setObject:forKey:", v10, *MEMORY[0x24BE0B370]);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKey:", v59, v57);

    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *MEMORY[0x24BE0B348];
    objc_msgSend(v60, "setObject:forKey:", v18, *MEMORY[0x24BE0B348]);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v18);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v63, v61);
    v160 = 1;
LABEL_128:

LABEL_137:
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = *MEMORY[0x24BE0B370];
    objc_msgSend(v130, "setObject:forKey:", v10, *MEMORY[0x24BE0B370]);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setObject:forKey:", v133, v131);

    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, v174))
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "setObject:forKey:", v169, v174);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "setObject:forKey:", v136, v174);

      v137 = v168;
      if (v166 == 2)
        v138 = v25;
      else
        v138 = 0;
      v33 = v174;
      v173 = v137;
      if (v138 == 1)
      {
        v47 = -[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v137, v174) == 2;
        goto LABEL_73;
      }
LABEL_159:
      v47 = 0;
      goto LABEL_73;
    }
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v172, v174))
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "setObject:forKey:", v18, v174);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v18);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "setObject:forKey:", v141, v174);

      v173 = v172;
      v47 = 0;
      v33 = v174;
      goto LABEL_73;
    }
    v47 = (char)v169;
    if (v169)
    {
      if (!-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, CFSTR("password")))
      {
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v174;
        objc_msgSend(v155, "setObject:forKey:", v169, v174);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setObject:forKey:", v157, v174);

        v173 = v168;
        goto LABEL_159;
      }
      v47 = 0;
    }
LABEL_47:
    v173 = 0;
    goto LABEL_72;
  }
  if (!v169
    || !-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v168, CFSTR("password")))
  {
    v160 = 0;
    goto LABEL_137;
  }
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = *MEMORY[0x24BE0B348];
  objc_msgSend(v119, "setObject:forKey:", v10, *MEMORY[0x24BE0B348]);

  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = *MEMORY[0x24BE0B370];
  objc_msgSend(v121, "setObject:forKey:", v169, *MEMORY[0x24BE0B370]);

  -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setObject:forKey:", v124, v120);

  -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v169);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setObject:forKey:", v126, v122);

  v47 = (char)v163;
  if (!v163)
  {
    v173 = 0;
    goto LABEL_43;
  }
  v33 = v174;
  if (!-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v167, v174))
  {
    v47 = 0;
    v173 = 0;
    goto LABEL_38;
  }
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setObject:forKey:", v163, v174);

  -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v163);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setObject:forKey:", v129, v174);

  v173 = v167;
LABEL_37:
  v47 = 0;
LABEL_38:
  v160 = 1;
LABEL_73:
  v16 = -[AFUITargetDetectionController contactAutoFillModeWithCurrentResponder:currentTraits:allResponders:indexOfCurrent:](self, "contactAutoFillModeWithCurrentResponder:currentTraits:allResponders:indexOfCurrent:", v10, v177, v175, v178);
  v159 = -[AFUITargetDetectionController creditCardAutoFillModeWithCurrentResponder:currentTraits:allResponders:indexOfCurrent:](self, "creditCardAutoFillModeWithCurrentResponder:currentTraits:allResponders:indexOfCurrent:", v10, v177, v175, v178);
  v170 = v10;
  v158 = -[AFUITargetDetectionController cellularAutoFillModeWithCurrentResponder:currentTraits:allResponders:indexOfCurrent:](self, "cellularAutoFillModeWithCurrentResponder:currentTraits:allResponders:indexOfCurrent:", v10, v177, v175, v178);
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = *MEMORY[0x24BE0B360];
  objc_msgSend(v69, "objectForKey:", *MEMORY[0x24BE0B360]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "objectForKey:", v33);
  v73 = (id)objc_claimAutoreleasedReturnValue();

  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = *MEMORY[0x24BE0B370];
  objc_msgSend(v74, "objectForKey:", *MEMORY[0x24BE0B370]);
  v76 = objc_claimAutoreleasedReturnValue();

  if (v173)
  {
    v77 = objc_msgSend(v173, "keyboardType");
    if (v77 <= 0xD && ((1 << v77) & 0x2930) != 0)
    {
      if (v73 == v170)
      {
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "removeObjectForKey:", v174);

        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "removeObjectForKey:", v75);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "removeObjectForKey:", v174);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "removeObjectForKey:", v75);

        v73 = 0;
        v76 = 0;
      }
      v47 = 1;
    }
  }
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "objectForKey:", *MEMORY[0x24BE0B348]);
  v83 = objc_claimAutoreleasedReturnValue();

  if (v73)
    v84 = (v76 | v83) != 0;
  else
    v84 = 0;
  v85 = v76 != 0;
  v86 = v166 == 2 && v76 != 0;
  if (v166 != 1)
    v85 = 0;
  if (v73)
    v87 = v176 == 2;
  else
    v87 = 0;
  v88 = v87;
  if (v84 || (v88 & 1) != 0 || v86 || v85)
  {
    v95 = !v47
       && -[AFUITargetDetectionController signupHintForUsername:password:responder:](self, "signupHintForUsername:password:responder:", v73, v76, v175);
    v94 = v161;
    v7 = v162;
    v96 = v160;
    if (v83)
      v96 = 1;
    if ((v84 & (v96 | v95)) != 1)
    {
      v93 = 0;
      v16 = 1;
      goto LABEL_108;
    }
    v98 = v169;
    v97 = v170;
    v93 = 0;
    if (self->_didOptOutOfAutoFillSignup)
    {
      v16 = 4;
    }
    else if (v73 == v162 || v73 == v170)
    {
      v16 = 3;
    }
    else
    {
      v16 = 2;
    }
  }
  else
  {
    if (v16)
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "removeObjectForKey:", v174);

      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "removeObjectForKey:", v70);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "removeObjectForKey:", v174);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "removeObjectForKey:", v70);

      v93 = 0;
      v94 = v161;
      v7 = v162;
LABEL_108:
      v98 = v169;
      v97 = v170;
      goto LABEL_119;
    }
    v98 = v169;
    v16 = v159;
    if (v159 || (v16 = v158) != 0)
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "removeObjectForKey:", v174);

      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "removeObjectForKey:", v70);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "removeObjectForKey:", v174);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "removeObjectForKey:", v70);

      v93 = 0;
    }
    else if (v71)
    {
      v93 = 0;
      v16 = 8;
    }
    else
    {
      -[AFUITargetDetectionController clearAutoFillGroup](self, "clearAutoFillGroup");
      v93 = 1;
    }
    v94 = v161;
    v7 = v162;
    v97 = v170;
  }
LABEL_119:

  if ((v93 & 1) != 0)
LABEL_120:
    v16 = 0;
LABEL_121:

  return v16;
}

- (void)updateAutofillContextForResponder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AFUITargetDetectionController autoFillContextForResponder:](self, "autoFillContextForResponder:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("AFUIAutoFillContextKey"));

    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("AFUIAutoFillContextDelegateKey"));
  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("AFUIAutoFillContextDelegateKey"));

    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("AFUIAutoFillContextKey"));
  }

}

- (NSMutableDictionary)autoFillGroup
{
  return self->_autoFillGroup;
}

- (id)autoFillContextForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)-[NSMutableDictionary mutableCopy](self->_autoFillContext, "mutableCopy");
  objc_msgSend(v5, "setObject:forKey:", &unk_2508629E8, CFSTR("_WKAutofillContextVersion"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_autofillContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  }
  if (objc_msgSend(v5, "count"))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (int64_t)doTraits:(id)a3 matchTextContentType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  char v11;
  void *v12;
  char v13;
  unsigned int v14;
  int64_t v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  unsigned int v20;
  unsigned int v22;
  void *v23;
  char v24;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_29;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE0B3A8]))
  {
    objc_msgSend(v5, "textContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

    if ((v9 & 1) == 0)
    {
      if (objc_msgSend(v5, "keyboardType")
        && objc_msgSend(v5, "keyboardType") != 7
        && objc_msgSend(v5, "keyboardType") != 1)
      {
        goto LABEL_29;
      }
      objc_msgSend(v5, "textContentType");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v10 != CFSTR("password") && objc_msgSend(v5, "autocorrectionType") == 1)
      {
        v11 = objc_msgSend(v5, "isSecureTextEntry");

        if ((v11 & 1) == 0)
          goto LABEL_36;
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("password")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("one-time-code")))
    {
      objc_msgSend(v5, "textContentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v7);

      if ((v17 & 1) == 0)
      {
        if (!objc_msgSend(v5, "keyboardType"))
          goto LABEL_36;
        if ((objc_msgSend(v5, "isSecureTextEntry") & 1) != 0)
          goto LABEL_36;
        v22 = objc_msgSend(v5, "keyboardType") - 4;
        if (v22 < 0xA && ((0x293u >> v22) & 1) != 0)
          goto LABEL_36;
        if (objc_msgSend(v5, "keyboardType") == 1)
          goto LABEL_36;
        goto LABEL_29;
      }
      goto LABEL_19;
    }
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("new-password")))
    {
      if (AFTextContentTypeIsInContactSet(v7))
      {
        objc_msgSend(v5, "textContentType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v7);

        if ((v19 & 1) == 0)
        {
          if ((objc_msgSend(v5, "isSecureTextEntry") & 1) != 0)
          {
LABEL_29:
            v15 = 0;
            goto LABEL_30;
          }
          objc_msgSend(v5, "textContentType");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v10 && objc_msgSend(v5, "autocorrectionType") == 1)
          {
            v20 = objc_msgSend(v5, "keyboardType");
            if (v20 > 0xD || ((1 << v20) & 0x2930) == 0)
            {
              if ((AFUIIsAppleApp() & 1) == 0)
                goto LABEL_36;
              goto LABEL_29;
            }
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        if (!AFTextContentTypeIsInCreditCardSet(v7)
          && !AFTextContentTypeIsInCellularSet(v7))
        {
          goto LABEL_29;
        }
        objc_msgSend(v5, "textContentType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v7);

        if ((v24 & 1) == 0)
          goto LABEL_29;
      }
      goto LABEL_19;
    }
  }
  objc_msgSend(v5, "textContentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v7);

  if ((v13 & 1) != 0)
  {
LABEL_19:
    v15 = 2;
    goto LABEL_30;
  }
  if (!objc_msgSend(v5, "isSecureTextEntry")
    || (objc_msgSend(v5, "displaySecureTextUsingPlainText") & 1) != 0)
  {
    goto LABEL_29;
  }
  v14 = objc_msgSend(v5, "keyboardType") - 4;
  if (v14 >= 0xA)
  {
LABEL_36:
    v15 = 1;
    goto LABEL_30;
  }
  v15 = qword_236DCB490[v14];
LABEL_30:

  return v15;
}

- (id)textContentTypeForResponder:(id)a3 traits:(id)a4 contentTypesFound:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "textContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[objc_class textSignalsForResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "textSignalsForResponder:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x24BE0B300];
    if ((objc_msgSend(v10, "containsObject:", *MEMORY[0x24BE0B300]) & 1) == 0
      && ((v16 = objc_msgSend(v9, "keyboardType"), v16 == 7)
       || __86__AFUITargetDetectionController_textContentTypeForResponder_traits_contentTypesFound___block_invoke_2(v16, v12))|| (v13 = (void *)*MEMORY[0x24BE0B398], (objc_msgSend(v10, "containsObject:", *MEMORY[0x24BE0B398]) & 1) == 0)&& (v14 = objc_msgSend(v9, "keyboardType"), v14 != 3)&& __86__AFUITargetDetectionController_textContentTypeForResponder_traits_contentTypesFound___block_invoke(v14, v12))
    {
      v17 = v13;
    }
    else
    {
      if (AFUISupportsCarPlayMaps_onceToken != -1)
        dispatch_once(&AFUISupportsCarPlayMaps_onceToken, &__block_literal_global_200);
      if (!AFUISupportsCarPlayMaps__hasCarPlayMapsEntitlement)
      {
        +[AFUIAutoCompleteMappingController sharedInstance](AFUIAutoCompleteMappingController, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "heuristicTextContentTypeForHints:textContentTypesToSkip:", v19, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
        goto LABEL_19;
      }
      -[AFUITargetDetectionController searchKeywordSet](self, "searchKeywordSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((AFUITextSignalsFoundInKeywordsList(v12, v15) & 1) != 0)
      {

      }
      else
      {
        v20 = objc_msgSend(v9, "returnKeyType");

        if (v20 != 6)
        {
          v11 = 0;
          goto LABEL_18;
        }
      }
      v17 = (id)*MEMORY[0x24BE0B310];
    }
    v11 = v17;
    goto LABEL_18;
  }
LABEL_19:

  return v11;
}

uint64_t __86__AFUITargetDetectionController_textContentTypeForResponder_traits_contentTypesFound___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (!objc_msgSend(v2, "count"))
    goto LABEL_3;
  +[AFUIAutoCompleteMappingController sharedInstance](AFUIAutoCompleteMappingController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *MEMORY[0x24BE0B300];
  v4 = 1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heuristicStringsForTextContentTypes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = AFUITextSignalsFoundInKeywordsList(v2, v6);

  if ((v7 & 1) == 0)
  {
LABEL_3:
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v4 = 0;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          if (AFUIRegularExpressionForEmail_onceToken != -1)
            dispatch_once(&AFUIRegularExpressionForEmail_onceToken, &__block_literal_global_196);
          v14 = (id)AFUIRegularExpressionForEmail_regEx;
          v15 = objc_msgSend(v14, "numberOfMatchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length", (_QWORD)v17));

          v4 |= v15 != 0;
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
    else
    {
      v4 = 0;
    }

  }
  return v4 & 1;
}

uint64_t __86__AFUITargetDetectionController_textContentTypeForResponder_traits_contentTypesFound___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    +[AFUIAutoCompleteMappingController sharedInstance](AFUIAutoCompleteMappingController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = *MEMORY[0x24BE0B398];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "heuristicStringsForTextContentTypes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = AFUITextSignalsFoundInKeywordsList(v2, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)searchKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__AFUITargetDetectionController_searchKeywordSet__block_invoke;
  block[3] = &unk_250856B30;
  block[4] = self;
  if (searchKeywordSet_onceToken != -1)
    dispatch_once(&searchKeywordSet_onceToken, block);
  return (id)searchKeywordSet__searchKeywordSet;
}

- (void)setDelegateNeedsAutofillMode:(unint64_t)a3
{
  self->_delegateNeedsAutofillMode = a3;
}

- (void)clearAutoFillGroup
{
  void *v3;
  void *v4;

  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  self->_didOptOutOfAutoFillSignup = 0;
}

- (BOOL)_detectionDisabledForResponder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  if (_detectionDisabledForResponder__onceToken != -1)
    dispatch_once(&_detectionDisabledForResponder__onceToken, &__block_literal_global_88);
  v4 = _detectionDisabledForResponder___disabledBundleIdentifiers;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "containsObject:", v6);

  if ((v4 & 1) != 0)
    goto LABEL_6;
  if (!objc_opt_class())
    goto LABEL_7;
  v7 = _detectionDisabledForResponder___disabledBundleIdentifiers;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend((id)v7, "containsObject:", v9);

  if ((v7 & 1) != 0)
LABEL_6:
    v10 = 1;
  else
LABEL_7:
    v10 = 0;

  return v10;
}

- (id)contactAutoFillKeywordsForKey:(id)a3 value:(id)a4 localizedKeywords:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "componentsSeparatedByString:", CFSTR("|"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", _AFUIApplicationClass());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_preferredEnglishLocalizationBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedStringForKey:value:table:", v8, v7, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("|"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v9);
  objc_msgSend(v14, "addObjectsFromArray:", v13);
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

void __64__AFUITargetDetectionController__detectionDisabledForResponder___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2508629D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_detectionDisabledForResponder___disabledBundleIdentifiers;
  _detectionDisabledForResponder___disabledBundleIdentifiers = v0;

}

void __63__AFUITargetDetectionController__detectionEnabledForResponder___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _detectionEnabledForResponder___enabled = objc_msgSend(v0, "hasPrefix:", CFSTR("com.apple.quicklook"));

}

void __49__AFUITargetDetectionController_searchKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _AFUIUIAppLocalizedStringWithDefaultValue(CFSTR("SEARCH_FIELD_SEARCH_TERMS"), CFSTR("search|query"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("SEARCH_FIELD_SEARCH_TERMS"), CFSTR("search|query"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)searchKeywordSet__searchKeywordSet;
  searchKeywordSet__searchKeywordSet = v2;

}

- (unint64_t)creditCardAutoFillModeWithCurrentResponder:(id)a3 currentTraits:(id)a4 allResponders:(id)a5 indexOfCurrent:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  int64_t v40;
  void *v41;
  id v42;
  id v43;

  v10 = a3;
  v11 = a4;
  v43 = a5;
  if (-[AFUITargetDetectionController _detectionEnabledForResponder:](self, "_detectionEnabledForResponder:", v10))
  {
    -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (AFTextContentTypeIsInCreditCardSet(v12))
    {
      v42 = v11;
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v10, v12);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v10;
      -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, v12);

      v41 = v12;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v43, "count");
      v40 = a6;
      v19 = a6 + 1;
      if (a6 + 1 < v18)
      {
        while (1)
        {
          objc_msgSend(v43, "objectAtIndex:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v20, v21, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((AFTextContentTypeIsInCreditCardSet(v22) & 1) == 0)
            break;
          -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v20, v22);

          -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKey:", v25, v22);

          objc_msgSend(v17, "addObject:", v22);
          if (++v19 >= v18)
            goto LABEL_9;
        }

      }
LABEL_9:
      if (v40 >= 1 && v40 - 1 < v18)
      {
        v26 = v40 - 2;
        while (1)
        {
          objc_msgSend(v43, "objectAtIndex:", v26 + 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v27, v28, v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((AFTextContentTypeIsInCreditCardSet(v29) & 1) == 0)
            break;
          -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKey:", v27, v29);

          -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v32, v29);

          objc_msgSend(v17, "addObject:", v29);
          if ((uint64_t)(v26 + 1) >= 1 && v26-- < v18)
            continue;
          goto LABEL_18;
        }

      }
LABEL_18:
      v12 = v41;
      v11 = v42;
      if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v42, v41) == 2)
      {
        v13 = 9;
        v10 = v39;
      }
      else
      {
        v10 = v39;
        if (objc_msgSend(v17, "count") == 1)
        {
          -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "anyObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeObjectForKey:", v35);

          -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "anyObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removeObjectForKey:", v37);

          v13 = 0;
        }
        else
        {
          v13 = 9;
        }
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)contactAutoFillModeWithCurrentResponder:(id)a3 currentTraits:(id)a4 allResponders:(id)a5 indexOfCurrent:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  int64_t v41;
  void *v42;
  id v43;
  id v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (AFTextContentTypeIsInContactSet(v13))
  {
    v43 = v11;
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v10, v13);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, v13);

    v42 = v13;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "count");
    v41 = a6;
    v20 = a6 + 1;
    v44 = v12;
    if (v20 < v19)
    {
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v21, v22, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((AFTextContentTypeIsInContactSet(v23) & 1) == 0)
          break;
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v21, v23);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v26, v23);

        v12 = v44;
        objc_msgSend(v18, "addObject:", v23);

        if (++v20 >= v19)
          goto LABEL_7;
      }

    }
LABEL_7:
    v40 = v10;
    if (v41 >= 1 && v41 - 1 < v19)
    {
      v27 = v41 - 2;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", v27 + 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v28, v29, v18);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((AFTextContentTypeIsInContactSet(v30) & 1) == 0)
          break;
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v28, v30);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v33, v30);

        objc_msgSend(v18, "addObject:", v30);
        v12 = v44;
        if ((uint64_t)(v27 + 1) >= 1 && v27-- < v19)
          continue;
        goto LABEL_16;
      }

      v12 = v44;
    }
LABEL_16:
    v13 = v42;
    v11 = v43;
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v43, v42) == 2|| objc_msgSend(v18, "count") != 1)
    {
      if ((objc_msgSend(v42, "isEqualToString:", *MEMORY[0x24BE0B300]) & 1) == 0)
      {
        v10 = v40;
        if ((objc_msgSend(v42, "isEqualToString:", *MEMORY[0x24BE0B398]) & 1) != 0)
        {
          v14 = 6;
        }
        else if (AFTextContentTypeIsInContactSet(v42))
        {
          v14 = 7;
        }
        else
        {
          v14 = 0;
        }
        goto LABEL_27;
      }
      v14 = 5;
    }
    else
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeObjectForKey:", v36);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeObjectForKey:", v38);

      v14 = 0;
    }
    v10 = v40;
LABEL_27:

  }
  return v14;
}

- (unint64_t)cellularAutoFillModeWithCurrentResponder:(id)a3 currentTraits:(id)a4 allResponders:(id)a5 indexOfCurrent:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (AFTextContentTypeIsInCellularSet(v13))
  {
    v42 = v11;
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v10, v13);

    -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v10;
    -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, v13);

    v41 = v13;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "count");
    v40 = a6;
    v20 = a6 + 1;
    v44 = v12;
    if (v20 < v19)
    {
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v21, v22, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((AFTextContentTypeIsInCellularSet(v23) & 1) == 0)
          break;
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v21, v23);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v26, v23);

        v12 = v44;
        objc_msgSend(v18, "addObject:", v23);

        if (++v20 >= v19)
          goto LABEL_7;
      }

    }
LABEL_7:
    if (v40 >= 1 && v40 - 1 < v19)
    {
      v27 = v40 - 2;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", v27 + 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[AFUIInputTraits traitsByAdoptingTraits:](AFUIInputTraits, "traitsByAdoptingTraits:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController textContentTypeForResponder:traits:contentTypesFound:](self, "textContentTypeForResponder:traits:contentTypesFound:", v28, v29, v18);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((AFTextContentTypeIsInCellularSet(v30) & 1) == 0)
          break;
        -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v28, v30);

        -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUITargetDetectionController placeholderTextForResponder:](self, "placeholderTextForResponder:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v33, v30);

        objc_msgSend(v18, "addObject:", v30);
        v12 = v44;
        if ((uint64_t)(v27 + 1) >= 1 && v27-- < v19)
          continue;
        goto LABEL_16;
      }

      v12 = v44;
    }
LABEL_16:
    v13 = v41;
    v11 = v42;
    if (-[AFUITargetDetectionController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v42, v41) == 2|| objc_msgSend(v18, "count") != 1)
    {
      v14 = 10;
    }
    else
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeObjectForKey:", v36);

      -[AFUITargetDetectionController autoFillContext](self, "autoFillContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeObjectForKey:", v38);

      v14 = 0;
    }
    v10 = v43;

  }
  return v14;
}

- (unint64_t)autoFillModeForResponder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  if (-[AFUITargetDetectionController _detectionDisabledForResponder:](self, "_detectionDisabledForResponder:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[objc_class firstResponderForInput](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "firstResponderForInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AFUITargetDetectionController _needAutoFillCandidate:delegateAsResponder:](self, "_needAutoFillCandidate:delegateAsResponder:", v4, v6);

  }
  return v5;
}

- (NSMutableDictionary)autoFillContext
{
  return self->_autoFillContext;
}

- (BOOL)_detectionEnabledForResponder:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (_detectionEnabledForResponder__onceToken != -1)
    dispatch_once(&_detectionEnabledForResponder__onceToken, &__block_literal_global_98);
  if (_detectionEnabledForResponder___enabled)
    v4 = 1;
  else
    v4 = _os_feature_enabled_impl();

  return v4;
}

- (id)textContentTypeForResponder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__AFUITargetDetectionController_textContentTypeForResponder___block_invoke;
  v9[3] = &unk_250856B08;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__AFUITargetDetectionController_textContentTypeForResponder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (id)addressKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AFUITargetDetectionController_addressKeywordSet__block_invoke;
  block[3] = &unk_250856B30;
  block[4] = self;
  if (addressKeywordSet_onceToken != -1)
    dispatch_once(&addressKeywordSet_onceToken, block);
  return (id)addressKeywordSet__addressKeywordSet;
}

void __50__AFUITargetDetectionController_addressKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _AFUIUIAppLocalizedStringWithDefaultValue(CFSTR("Address_FIELD_SEARCH_TERMS"), CFSTR("address|where|destination|location"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("Address_FIELD_SEARCH_TERMS"), CFSTR("address|where|destination|location"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)addressKeywordSet__addressKeywordSet;
  addressKeywordSet__addressKeywordSet = v2;

}

- (id)phoneKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AFUITargetDetectionController_phoneKeywordSet__block_invoke;
  block[3] = &unk_250856B30;
  block[4] = self;
  if (phoneKeywordSet_onceToken != -1)
    dispatch_once(&phoneKeywordSet_onceToken, block);
  return (id)phoneKeywordSet__phoneKeywordSet;
}

void __48__AFUITargetDetectionController_phoneKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _AFUIUIAppLocalizedStringWithDefaultValue(CFSTR("PHONE_FIELD_SEARCH_TERMS"), CFSTR("phone|mobile|telephone"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("PHONE_FIELD_SEARCH_TERMS"), CFSTR("phone|mobile|telephone"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)phoneKeywordSet__phoneKeywordSet;
  phoneKeywordSet__phoneKeywordSet = v2;

}

- (id)emailKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AFUITargetDetectionController_emailKeywordSet__block_invoke;
  block[3] = &unk_250856B30;
  block[4] = self;
  if (emailKeywordSet_onceToken != -1)
    dispatch_once(&emailKeywordSet_onceToken, block);
  return (id)emailKeywordSet__emailKeywordSet;
}

void __48__AFUITargetDetectionController_emailKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _AFUIUIAppLocalizedStringWithDefaultValue(CFSTR("EMAIL_FIELD_SEARCH_TERMS"), CFSTR("email|e-mail"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("EMAIL_FIELD_SEARCH_TERMS"), CFSTR("email|e-mail"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)emailKeywordSet__emailKeywordSet;
  emailKeywordSet__emailKeywordSet = v2;

}

- (id)signupKeywordList
{
  if (signupKeywordList_onceToken != -1)
    dispatch_once(&signupKeywordList_onceToken, &__block_literal_global_5);
  return (id)signupKeywordList_wordList;
}

void __50__AFUITargetDetectionController_signupKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)signupKeywordList_wordList;
  signupKeywordList_wordList = (uint64_t)&unk_250862970;

}

- (id)loginKeywordList
{
  if (loginKeywordList_onceToken != -1)
    dispatch_once(&loginKeywordList_onceToken, &__block_literal_global_56);
  return (id)loginKeywordList_wordList;
}

void __49__AFUITargetDetectionController_loginKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)loginKeywordList_wordList;
  loginKeywordList_wordList = (uint64_t)&unk_250862988;

}

- (id)accessibilitySignupKeywordList
{
  if (accessibilitySignupKeywordList_onceToken != -1)
    dispatch_once(&accessibilitySignupKeywordList_onceToken, &__block_literal_global_67);
  return (id)accessibilitySignupKeywordList_wordList;
}

void __63__AFUITargetDetectionController_accessibilitySignupKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)accessibilitySignupKeywordList_wordList;
  accessibilitySignupKeywordList_wordList = (uint64_t)&unk_2508629A0;

}

- (id)accessibilityLoginKeywordList
{
  if (accessibilityLoginKeywordList_onceToken != -1)
    dispatch_once(&accessibilityLoginKeywordList_onceToken, &__block_literal_global_70);
  return (id)accessibilityLoginKeywordList_wordList;
}

void __62__AFUITargetDetectionController_accessibilityLoginKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)accessibilityLoginKeywordList_wordList;
  accessibilityLoginKeywordList_wordList = (uint64_t)&unk_2508629B8;

}

- (void)clearFallbackAutoFillGroup
{
  -[AFUITargetDetectionController setFallbackAutoFillGroup:](self, "setFallbackAutoFillGroup:", 0);
  self->_didOptOutOfAutoFillSignup = 0;
}

- (BOOL)containsUsernamePasswordPairsInAutoFillGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE0B3A8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE0B370]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE0B348]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v8 != 0;

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldPreferFallbackAutoFillGroup
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  BOOL v10;

  -[AFUITargetDetectionController fallbackAutoFillGroup](self, "fallbackAutoFillGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AFUITargetDetectionController fallbackAutoFillGroup](self, "fallbackAutoFillGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[AFUITargetDetectionController containsUsernamePasswordPairsInAutoFillGroup:](self, "containsUsernamePasswordPairsInAutoFillGroup:", v7);

      -[AFUITargetDetectionController fallbackAutoFillGroup](self, "fallbackAutoFillGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AFUITargetDetectionController containsUsernamePasswordPairsInAutoFillGroup:](self, "containsUsernamePasswordPairsInAutoFillGroup:", v9);

      LOBYTE(v3) = v10 & ~v8;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)didOptOutOfAutoFillSignup
{
  self->_didOptOutOfAutoFillSignup = 1;
}

- (void)showASPInTextField:(id)a3 isRightToLeft:(BOOL)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  UIColor *v26;
  UIColor *textFieldOriginalColor;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[objc_class areaForASPFromTextField:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "areaForASPFromTextField:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = a4
     || -[objc_class alignmentFromTextField:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "alignmentFromTextField:", v6) == 2;
  v29 = *MEMORY[0x24BEBD270];
  objc_msgSend(v6, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class textFromResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "textFromResponder:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeWithAttributes:", v17);
  v20 = v19;

  +[AFUIASPCoverView coverForeground:withFrame:isRightToLeft:withTextWidth:](AFUIASPCoverView, "coverForeground:withFrame:isRightToLeft:withTextWidth:", 1, v15, v8, v10, v12, v14, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  +[AFUIASPCoverView coverForeground:withFrame:isRightToLeft:withTextWidth:](AFUIASPCoverView, "coverForeground:withFrame:isRightToLeft:withTextWidth:", 0, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("AFUIAutoFillASPOptInKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if ((v25 & 1) == 0)
  {
    objc_msgSend(v6, "backgroundColor");
    v26 = (UIColor *)objc_claimAutoreleasedReturnValue();
    textFieldOriginalColor = self->_textFieldOriginalColor;
    self->_textFieldOriginalColor = v26;

    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AFUIAutoFillASPOptInKey"));

  }
  -[objc_class configureField:withASPForegroundView:withASPBackgroundView:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "configureField:withASPForegroundView:withASPBackgroundView:", v6, v21, v22);

}

- (void)clearASPVisualEffectsInTextField:(id)a3
{
  id v3;

  v3 = a3;
  -[objc_class configureField:withASPForegroundView:withASPBackgroundView:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "configureField:withASPForegroundView:withASPBackgroundView:", v3, 0, 0);

}

- (void)_clearASPInTextField:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("AFUIAutoFillASPOptInKey"));

  -[AFUITargetDetectionController removeTemporaryTextColorFromTextField:](self, "removeTemporaryTextColorFromTextField:", v5);
  -[AFUITargetDetectionController clearASPVisualEffectsInTextField:](self, "clearASPVisualEffectsInTextField:", v5);
  -[objc_class setText:forResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "setText:forResponder:", &stru_250857310, v5);

}

- (void)clearASPInPasswordFields
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE0B370]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  _AFUITextFieldClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AFUITargetDetectionController _clearASPInTextField:](self, "_clearASPInTextField:", v6);
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE0B348]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _AFUITextFieldClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AFUITargetDetectionController _clearASPInTextField:](self, "_clearASPInTextField:", v5);

}

- (void)optOutASPInPasswordFields
{
  id v3;

  -[AFUITargetDetectionController clearASPInPasswordFields](self, "clearASPInPasswordFields");
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AFUIAutoFillASPOptInKey"));

}

- (id)placeholderTextForResponder:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v3 = a3;
  -[objc_class placeholderTextForResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "placeholderTextForResponder:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = &stru_250857310;
  v6 = v5;

  return v6;
}

- (unint64_t)containsIndicationInText:(id)a3 withAccessibilityHints:(BOOL)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (a4)
      -[AFUITargetDetectionController accessibilityLoginKeywordList](self, "accessibilityLoginKeywordList");
    else
      -[AFUITargetDetectionController loginKeywordList](self, "loginKeywordList");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      v8 = 1;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i)) & 1) != 0)
          {
            v14 = v9;
            goto LABEL_29;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (a4)
      -[AFUITargetDetectionController accessibilitySignupKeywordList](self, "accessibilitySignupKeywordList");
    else
      -[AFUITargetDetectionController signupKeywordList](self, "signupKeywordList");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      v8 = 2;
LABEL_21:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        if ((objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18), (_QWORD)v20) & 1) != 0)break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v16)
            goto LABEL_21;
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:
      v8 = 0;
    }

LABEL_29:
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)signUpSignalFromButton:(id)a3
{
  id v4;
  objc_class *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = +[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__AFUITargetDetectionController_signUpSignalFromButton___block_invoke;
  v8[3] = &unk_250856BB8;
  v8[4] = self;
  v8[5] = &v9;
  -[objc_class enumerateSignUpSignalsFromButton:block:](v5, "enumerateSignUpSignalsFromButton:block:", v4, v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __56__AFUITargetDetectionController_signUpSignalFromButton___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

- (unint64_t)signUpSignalFromViewControllerHierarchy:(id)a3
{
  id v4;
  objc_class *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = +[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__AFUITargetDetectionController_signUpSignalFromViewControllerHierarchy___block_invoke;
  v8[3] = &unk_250856BB8;
  v8[4] = self;
  v8[5] = &v9;
  -[objc_class enumerateSignUpSignalsFromViewController:block:](v5, "enumerateSignUpSignalsFromViewController:block:", v4, v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __73__AFUITargetDetectionController_signUpSignalFromViewControllerHierarchy___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

- (BOOL)signupHintForUsername:(id)a3 password:(id)a4 responder:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  _QWORD v31[6];
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[6];
  _QWORD v40[6];
  id v41;
  _QWORD v42[6];
  id v43;
  _QWORD v44[6];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[6];
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v11 = +[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass");
  v12 = MEMORY[0x24BDAC760];
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke;
  v54[3] = &unk_250856BB8;
  v54[4] = self;
  v54[5] = &v55;
  -[objc_class enumerateSignupSignalsFromAccessibility:block:](v11, "enumerateSignupSignalsFromAccessibility:block:", v8, v54);
  v13 = v56;
  if (!v56[3])
  {
    v53[0] = v12;
    v53[1] = 3221225472;
    v53[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_2;
    v53[3] = &unk_250856BB8;
    v53[4] = self;
    v53[5] = &v55;
    -[objc_class enumerateSignupSignalsFromAccessibility:block:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "enumerateSignupSignalsFromAccessibility:block:", v9, v53);
    v13 = v56;
  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  if (!v13[3])
  {
    v43 = 0;
    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_3;
    v44[3] = &unk_250856BB8;
    v44[4] = self;
    v44[5] = &v49;
    -[objc_class enumerateSignUpSignalsFromViewControllerForResponder:block:viewControllerOut:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "enumerateSignUpSignalsFromViewControllerForResponder:block:viewControllerOut:", v8, v44, &v43);
    v14 = v43;
    if (!v50[3])
    {
      v41 = v14;
      v42[0] = v12;
      v42[1] = 3221225472;
      v42[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_4;
      v42[3] = &unk_250856BB8;
      v42[4] = self;
      v42[5] = &v49;
      -[objc_class enumerateSignUpSignalsFromViewControllerForResponder:block:viewControllerOut:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "enumerateSignUpSignalsFromViewControllerForResponder:block:viewControllerOut:", v9, v42, &v41);
      v15 = v41;

      v14 = v15;
    }
    v40[0] = v12;
    v40[1] = 3221225472;
    v40[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_5;
    v40[3] = &unk_250856BB8;
    v40[4] = self;
    v40[5] = &v45;
    -[objc_class enumerateSignUpSignalsFromNavBarItem:block:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "enumerateSignUpSignalsFromNavBarItem:block:", v14, v40);
    _AFUINavigationControllerClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 1;
      if (v50[3])
        goto LABEL_17;
    }
    else
    {
      v17 = v46[3];
      v18 = v50[3];
      if (v17)
        v19 = v17 == v18;
      else
        v19 = 0;
      v16 = v19;
      if (v18)
      {
LABEL_17:

        v13 = v56;
        if (v16)
          v56[3] = v50[3];
        goto LABEL_19;
      }
    }
    -[objc_class presentedRootViewControllerForResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "presentedRootViewControllerForResponder:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_6;
    v39[3] = &unk_250856BB8;
    v39[4] = self;
    v39[5] = &v49;
    -[objc_class enumerateSignUpSignalsFromViewController:block:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "enumerateSignUpSignalsFromViewController:block:", v20, v39);

    goto LABEL_17;
  }
LABEL_19:
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v21 = v13[3];
  if (!v21)
  {
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_7;
    v32[3] = &unk_250856BE0;
    v25 = v23;
    v33 = v25;
    v26 = v24;
    v34 = v26;
    objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v32);
    v27 = objc_msgSend(v26, "count");
    v31[0] = v12;
    v31[1] = 3221225472;
    v31[2] = __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_8;
    v31[3] = &unk_250856C08;
    v31[4] = self;
    v31[5] = &v35;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v31);

    v21 = v56[3];
    if (!v21)
    {
      v21 = v50[3];
      v28 = v36[3];
      if (v21)
      {
        if (v28 && v21 != v28 && v27 < 3)
          v21 = v36[3];
      }
      else
      {
        v21 = v36[3];
      }
      v56[3] = v21;
    }
  }
  v29 = v21 == 2;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v29;
}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_3(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_4(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_5(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_6(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndicationInText:withAccessibilityHints:", a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return result;
}

void __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    *a4 = 1;
  _AFUIButtonClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v6, 0);

}

uint64_t __74__AFUITargetDetectionController_signupHintForUsername_password_responder___block_invoke_8(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  if (a3 > 2 || (v4 = result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)))
  {
    *a4 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(result + 32), "signUpSignalFromButton:", a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)enumeratePasswordFieldsUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v9 = v4;
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE0B370]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _AFUITextFieldClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9[2](v9, v6);
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE0B348]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _AFUITextFieldClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9[2](v9, v8);

    v4 = v9;
  }

}

- (void)addTemporaryTextColorToTextField:(id)a3
{
  id v3;

  v3 = a3;
  -[objc_class addTemporaryTextColorToTextField:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "addTemporaryTextColorToTextField:", v3);

}

- (void)removeTemporaryTextColorFromTextField:(id)a3
{
  id v3;

  v3 = a3;
  -[objc_class removeTemporaryTextColorFromTextField:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "removeTemporaryTextColorFromTextField:", v3);

}

- (void)saveAutoFillCredentialIfNeeded:(id)a3 passwordIsAutoGenerated:(BOOL)a4 block:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  uint64_t v24;
  _BOOL8 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[AFUITargetDetectionController shouldPreferFallbackAutoFillGroup](self, "shouldPreferFallbackAutoFillGroup"))
    -[AFUITargetDetectionController fallbackAutoFillGroup](self, "fallbackAutoFillGroup");
  else
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_22;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE0B3A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class textFromResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "textFromResponder:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE0B348]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE0B370]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[objc_class textFromResponder:](+[AFUIAdapter runtimeClass](AFUIAdapter, "runtimeClass"), "textFromResponder:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v15;
  if (v13)
  {
    v16 = v15;
    v34 = v9;
    v35 = v12;
    v33 = v8;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      v19 = v16 == 0;
    else
      v19 = 1;
    if (v19)
    {

      v8 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringByTrimmingCharactersInSet:", v20);
      v21 = v13;
      v22 = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      v25 = v22;
      v13 = v21;

      v8 = v33;
      v9 = v34;
      v12 = v35;
      if (!v24)
        goto LABEL_19;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AFUIAutoFillContextKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("_WebViewURL"));
      v27 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v27;
      v29 = objc_alloc_init((Class)get_SFAppPasswordSavingViewControllerClass());
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __94__AFUITargetDetectionController_saveAutoFillCredentialIfNeeded_passwordIsAutoGenerated_block___block_invoke;
        v37[3] = &unk_250856C50;
        v39 = v34;
        v38 = v29;
        objc_msgSend(v38, "credentialsSubmittedForWebsiteURL:user:password:passwordIsAutoGenerated:completionHandler:", v28, v13, v36, v25, v37);

      }
    }
    v12 = v35;
  }
LABEL_19:
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allKeysForObject:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
    -[AFUITargetDetectionController clearAutoFillGroup](self, "clearAutoFillGroup");

LABEL_22:
  -[AFUITargetDetectionController clearFallbackAutoFillGroup](self, "clearFallbackAutoFillGroup");

}

uint64_t __94__AFUITargetDetectionController_saveAutoFillCredentialIfNeeded_passwordIsAutoGenerated_block___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (void)saveWebviewCredentialsForResponder:(id)a3 WebsiteURL:(id)a4 user:(id)a5 password:(id)a6 passwordIsAutoGenerated:(BOOL)a7 block:(id)a8
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a7;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  v16 = objc_alloc_init((Class)get_SFAppPasswordSavingViewControllerClass());
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __123__AFUITargetDetectionController_saveWebviewCredentialsForResponder_WebsiteURL_user_password_passwordIsAutoGenerated_block___block_invoke;
    v17[3] = &unk_250856C50;
    v19 = v15;
    v18 = v16;
    objc_msgSend(v18, "credentialsSubmittedForWebsiteURL:user:password:passwordIsAutoGenerated:completionHandler:", v12, v13, v14, v9, v17);

  }
}

uint64_t __123__AFUITargetDetectionController_saveWebviewCredentialsForResponder_WebsiteURL_user_password_passwordIsAutoGenerated_block___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (BOOL)shouldLoadASPForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  BOOL v12;

  v4 = a3;
  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE0B3A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE0B370]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v4)
  {
    v11 = 1;
  }
  else
  {
    -[AFUITargetDetectionController autoFillGroup](self, "autoFillGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE0B348]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == v4;

  }
  if (v6)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

+ (BOOL)shouldAutomaticallyPresentCompletionListForDocumentTraits:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "autofillMode");
  return (v3 < 0xA) & (0x3E2u >> v3);
}

- (void)setFallbackAutoFillGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setAutoFillContext:(id)a3
{
  objc_storeStrong((id *)&self->_autoFillContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillContext, 0);
  objc_storeStrong((id *)&self->_fallbackAutoFillGroup, 0);
  objc_storeStrong((id *)&self->_autoFillGroup, 0);
  objc_storeStrong((id *)&self->_textFieldOriginalColor, 0);
}

@end
