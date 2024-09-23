@implementation EMMessageListItemChange

- (NSString)debugDescription
{
  return (NSString *)-[EMMessageListItemChange _descriptionForInternal:useDebugDescriptions:](self, "_descriptionForInternal:useDebugDescriptions:", 1, 1);
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageListItemChange _descriptionForInternal:useDebugDescriptions:](self, "_descriptionForInternal:useDebugDescriptions:", objc_msgSend(v3, "isInternal"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_descriptionForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[EMMessageListItemChange changeDescriptionsForInternal:useDebugDescriptions:](self, "changeDescriptionsForInternal:useDebugDescriptions:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@: %p> %lu changes\n%@"), objc_opt_class(), self, objc_msgSend(v5, "count"), v6);

  return v7;
}

- (id)changeDescriptionsForInternal:(BOOL)a3 useDebugDescriptions:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  char v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  char v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  char v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  char v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  char v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  char v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  char v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  char v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  void *v187;
  char v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EMMessageListItemChange date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v4)
    {
      -[EMMessageListItemChange date](self, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "debugDescription");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange date](self, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v13 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange date](self, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "partiallyRedactedStringForString:", v9);
      }
      else
      {
        -[EMMessageListItemChange date](self, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
      }
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v10;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("date: %@"), v14);
    objc_msgSend(v7, "addObject:", v15);

  }
  -[EMMessageListItemChange displayDate](self, "displayDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v4)
    {
      -[EMMessageListItemChange displayDate](self, "displayDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "debugDescription");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange displayDate](self, "displayDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) != 0)
      {
        v21 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange displayDate](self, "displayDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "partiallyRedactedStringForString:", v17);
      }
      else
      {
        -[EMMessageListItemChange displayDate](self, "displayDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "description");
      }
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v18;

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("displayDate: %@"), v22);
    objc_msgSend(v7, "addObject:", v23);

  }
  -[EMMessageListItemChange readLater](self, "readLater");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v4)
    {
      -[EMMessageListItemChange readLater](self, "readLater");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "debugDescription");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange readLater](self, "readLater");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v28 = objc_opt_isKindOfClass();

      if ((v28 & 1) != 0)
      {
        v29 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange readLater](self, "readLater");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "partiallyRedactedStringForString:", v25);
      }
      else
      {
        -[EMMessageListItemChange readLater](self, "readLater");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "description");
      }
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v26;

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("readLater: %@"), v30);
    objc_msgSend(v7, "addObject:", v31);

  }
  -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (v4)
    {
      -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "debugDescription");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v36 = objc_opt_isKindOfClass();

      if ((v36 & 1) != 0)
      {
        v37 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "partiallyRedactedStringForString:", v33);
      }
      else
      {
        -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "description");
      }
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v38 = (void *)v34;

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("sendLaterDate: %@"), v38);
    objc_msgSend(v7, "addObject:", v39);

  }
  -[EMMessageListItemChange followUp](self, "followUp");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    if (v4)
    {
      -[EMMessageListItemChange followUp](self, "followUp");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "debugDescription");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange followUp](self, "followUp");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v44 = objc_opt_isKindOfClass();

      if ((v44 & 1) != 0)
      {
        v45 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange followUp](self, "followUp");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "partiallyRedactedStringForString:", v41);
      }
      else
      {
        -[EMMessageListItemChange followUp](self, "followUp");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "description");
      }
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v46 = (void *)v42;

    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("followUp: %@"), v46);
    objc_msgSend(v7, "addObject:", v47);

  }
  -[EMMessageListItemChange subject](self, "subject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    if (v5)
    {
      if (v4)
      {
        -[EMMessageListItemChange subject](self, "subject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "debugDescription");
        v50 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EMMessageListItemChange subject](self, "subject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v52 = objc_opt_isKindOfClass();

        if ((v52 & 1) != 0)
        {
          v53 = (void *)MEMORY[0x1E0D1EF48];
          -[EMMessageListItemChange subject](self, "subject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "partiallyRedactedStringForString:", v49);
        }
        else
        {
          -[EMMessageListItemChange subject](self, "subject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "description");
        }
        v50 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v50;

      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("subject: %@"), v54);
      objc_msgSend(v7, "addObject:", v55);

    }
    else
    {
      objc_msgSend(v7, "addObject:", CFSTR("subject"));
    }
  }
  -[EMMessageListItemChange summary](self, "summary");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    if (v5)
    {
      if (v4)
      {
        -[EMMessageListItemChange summary](self, "summary");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "debugDescription");
        v58 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EMMessageListItemChange summary](self, "summary");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v60 = objc_opt_isKindOfClass();

        if ((v60 & 1) != 0)
        {
          v61 = (void *)MEMORY[0x1E0D1EF48];
          -[EMMessageListItemChange summary](self, "summary");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "partiallyRedactedStringForString:", v57);
        }
        else
        {
          -[EMMessageListItemChange summary](self, "summary");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "description");
        }
        v58 = objc_claimAutoreleasedReturnValue();
      }
      v62 = (void *)v58;

      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("summary: %@"), v62);
      objc_msgSend(v7, "addObject:", v63);

    }
    else
    {
      objc_msgSend(v7, "addObject:", CFSTR("summary"));
    }
  }
  if (_os_feature_enabled_impl())
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (v5)
        {
          if (v4)
          {
            -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "debugDescription");
            v66 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v68 = objc_opt_isKindOfClass();

            if ((v68 & 1) != 0)
            {
              v69 = (void *)MEMORY[0x1E0D1EF48];
              -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "partiallyRedactedStringForString:", v65);
            }
            else
            {
              -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "description");
            }
            v66 = objc_claimAutoreleasedReturnValue();
          }
          v70 = (void *)v66;

          v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("generatedSummary: %@"), v70);
          objc_msgSend(v7, "addObject:", v71);

        }
        else
        {
          objc_msgSend(v7, "addObject:", CFSTR("generatedSummary"));
        }
      }
    }
  }
  -[EMMessageListItemChange senderList](self, "senderList");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    if (v5)
    {
      if (v4)
      {
        -[EMMessageListItemChange senderList](self, "senderList");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "debugDescription");
        v74 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EMMessageListItemChange senderList](self, "senderList");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v76 = objc_opt_isKindOfClass();

        if ((v76 & 1) != 0)
        {
          v77 = (void *)MEMORY[0x1E0D1EF48];
          -[EMMessageListItemChange senderList](self, "senderList");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "partiallyRedactedStringForString:", v73);
        }
        else
        {
          -[EMMessageListItemChange senderList](self, "senderList");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "description");
        }
        v74 = objc_claimAutoreleasedReturnValue();
      }
      v78 = (void *)v74;

      v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("senderList: %@"), v78);
      objc_msgSend(v7, "addObject:", v79);

    }
    else
    {
      objc_msgSend(v7, "addObject:", CFSTR("senderList"));
    }
  }
  -[EMMessageListItemChange toList](self, "toList");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    if (v5)
    {
      if (v4)
      {
        -[EMMessageListItemChange toList](self, "toList");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "debugDescription");
        v82 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EMMessageListItemChange toList](self, "toList");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v84 = objc_opt_isKindOfClass();

        if ((v84 & 1) != 0)
        {
          v85 = (void *)MEMORY[0x1E0D1EF48];
          -[EMMessageListItemChange toList](self, "toList");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "partiallyRedactedStringForString:", v81);
        }
        else
        {
          -[EMMessageListItemChange toList](self, "toList");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "description");
        }
        v82 = objc_claimAutoreleasedReturnValue();
      }
      v86 = (void *)v82;

      v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("toList: %@"), v86);
      objc_msgSend(v7, "addObject:", v87);

    }
    else
    {
      objc_msgSend(v7, "addObject:", CFSTR("toList"));
    }
  }
  -[EMMessageListItemChange ccList](self, "ccList");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    if (v5)
    {
      if (v4)
      {
        -[EMMessageListItemChange ccList](self, "ccList");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "debugDescription");
        v90 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EMMessageListItemChange ccList](self, "ccList");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v92 = objc_opt_isKindOfClass();

        if ((v92 & 1) != 0)
        {
          v93 = (void *)MEMORY[0x1E0D1EF48];
          -[EMMessageListItemChange ccList](self, "ccList");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "partiallyRedactedStringForString:", v89);
        }
        else
        {
          -[EMMessageListItemChange ccList](self, "ccList");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "description");
        }
        v90 = objc_claimAutoreleasedReturnValue();
      }
      v94 = (void *)v90;

      v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ccList: %@"), v94);
      objc_msgSend(v7, "addObject:", v95);

    }
    else
    {
      objc_msgSend(v7, "addObject:", CFSTR("ccList"));
    }
  }
  -[EMMessageListItemChange flags](self, "flags");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    if (v4)
    {
      -[EMMessageListItemChange flags](self, "flags");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "debugDescription");
      v98 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange flags](self, "flags");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v100 = objc_opt_isKindOfClass();

      if ((v100 & 1) != 0)
      {
        v101 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange flags](self, "flags");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "partiallyRedactedStringForString:", v97);
      }
      else
      {
        -[EMMessageListItemChange flags](self, "flags");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "description");
      }
      v98 = objc_claimAutoreleasedReturnValue();
    }
    v102 = (void *)v98;

    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("flags: %@"), v102);
    objc_msgSend(v7, "addObject:", v103);

  }
  -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    if (v4)
    {
      -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "debugDescription");
      v106 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v108 = objc_opt_isKindOfClass();

      if ((v108 & 1) != 0)
      {
        v109 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "partiallyRedactedStringForString:", v105);
      }
      else
      {
        -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "description");
      }
      v106 = objc_claimAutoreleasedReturnValue();
    }
    v110 = (void *)v106;

    v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("hasUnflagged: %@"), v110);
    objc_msgSend(v7, "addObject:", v111);

  }
  -[EMMessageListItemChange flagColors](self, "flagColors");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    if (v4)
    {
      -[EMMessageListItemChange flagColors](self, "flagColors");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "debugDescription");
      v114 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange flagColors](self, "flagColors");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v116 = objc_opt_isKindOfClass();

      if ((v116 & 1) != 0)
      {
        v117 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange flagColors](self, "flagColors");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "partiallyRedactedStringForString:", v113);
      }
      else
      {
        -[EMMessageListItemChange flagColors](self, "flagColors");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "description");
      }
      v114 = objc_claimAutoreleasedReturnValue();
    }
    v118 = (void *)v114;

    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("flagColors: %@"), v118);
    objc_msgSend(v7, "addObject:", v119);

  }
  -[EMMessageListItemChange isVIP](self, "isVIP");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  if (v120)
  {
    if (v4)
    {
      -[EMMessageListItemChange isVIP](self, "isVIP");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "debugDescription");
      v122 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange isVIP](self, "isVIP");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v124 = objc_opt_isKindOfClass();

      if ((v124 & 1) != 0)
      {
        v125 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange isVIP](self, "isVIP");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "partiallyRedactedStringForString:", v121);
      }
      else
      {
        -[EMMessageListItemChange isVIP](self, "isVIP");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "description");
      }
      v122 = objc_claimAutoreleasedReturnValue();
    }
    v126 = (void *)v122;

    v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isVIP: %@"), v126);
    objc_msgSend(v7, "addObject:", v127);

  }
  -[EMMessageListItemChange isBlocked](self, "isBlocked");
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (v128)
  {
    if (v4)
    {
      -[EMMessageListItemChange isBlocked](self, "isBlocked");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "debugDescription");
      v130 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange isBlocked](self, "isBlocked");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v132 = objc_opt_isKindOfClass();

      if ((v132 & 1) != 0)
      {
        v133 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange isBlocked](self, "isBlocked");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "partiallyRedactedStringForString:", v129);
      }
      else
      {
        -[EMMessageListItemChange isBlocked](self, "isBlocked");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "description");
      }
      v130 = objc_claimAutoreleasedReturnValue();
    }
    v134 = (void *)v130;

    v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isBlocked: %@"), v134);
    objc_msgSend(v7, "addObject:", v135);

  }
  -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  if (v136)
  {
    if (v4)
    {
      -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "debugDescription");
      v138 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v140 = objc_opt_isKindOfClass();

      if ((v140 & 1) != 0)
      {
        v141 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "partiallyRedactedStringForString:", v137);
      }
      else
      {
        -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "description");
      }
      v138 = objc_claimAutoreleasedReturnValue();
    }
    v142 = (void *)v138;

    v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsubscribeType: %@"), v142);
    objc_msgSend(v7, "addObject:", v143);

  }
  -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    if (v4)
    {
      -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "debugDescription");
      v146 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v148 = objc_opt_isKindOfClass();

      if ((v148 & 1) != 0)
      {
        v149 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "partiallyRedactedStringForString:", v145);
      }
      else
      {
        -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "description");
      }
      v146 = objc_claimAutoreleasedReturnValue();
    }
    v150 = (void *)v146;

    v151 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("hasAttachments: %@"), v150);
    objc_msgSend(v7, "addObject:", v151);

  }
  -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  if (v152)
  {
    if (v4)
    {
      -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "debugDescription");
      v154 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v156 = objc_opt_isKindOfClass();

      if ((v156 & 1) != 0)
      {
        v157 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "partiallyRedactedStringForString:", v153);
      }
      else
      {
        -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "description");
      }
      v154 = objc_claimAutoreleasedReturnValue();
    }
    v158 = (void *)v154;

    v159 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("conversationNotificationLevel: %@"), v158);
    objc_msgSend(v7, "addObject:", v159);

  }
  -[EMMessageListItemChange count](self, "count");
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  if (v160)
  {
    if (v4)
    {
      -[EMMessageListItemChange count](self, "count");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "debugDescription");
      v162 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange count](self, "count");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v164 = objc_opt_isKindOfClass();

      if ((v164 & 1) != 0)
      {
        v165 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange count](self, "count");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "partiallyRedactedStringForString:", v161);
      }
      else
      {
        -[EMMessageListItemChange count](self, "count");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "description");
      }
      v162 = objc_claimAutoreleasedReturnValue();
    }
    v166 = (void *)v162;

    v167 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("count: %@"), v166);
    objc_msgSend(v7, "addObject:", v167);

  }
  -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    if (v4)
    {
      -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "debugDescription");
      v170 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v172 = objc_opt_isKindOfClass();

      if ((v172 & 1) != 0)
      {
        v173 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "partiallyRedactedStringForString:", v169);
      }
      else
      {
        -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "description");
      }
      v170 = objc_claimAutoreleasedReturnValue();
    }
    v174 = (void *)v170;

    v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("mailboxObjectIDs: %@"), v174);
    objc_msgSend(v7, "addObject:", v175);

  }
  -[EMMessageListItemChange mailboxes](self, "mailboxes");
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  if (v176)
  {
    if (v5)
    {
      if (v4)
      {
        -[EMMessageListItemChange mailboxes](self, "mailboxes");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "debugDescription");
        v178 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[EMMessageListItemChange mailboxes](self, "mailboxes");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v180 = objc_opt_isKindOfClass();

        if ((v180 & 1) != 0)
        {
          v181 = (void *)MEMORY[0x1E0D1EF48];
          -[EMMessageListItemChange mailboxes](self, "mailboxes");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "partiallyRedactedStringForString:", v177);
        }
        else
        {
          -[EMMessageListItemChange mailboxes](self, "mailboxes");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "description");
        }
        v178 = objc_claimAutoreleasedReturnValue();
      }
      v182 = (void *)v178;

      v183 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("mailboxes: %@"), v182);
      objc_msgSend(v7, "addObject:", v183);

    }
    else
    {
      objc_msgSend(v7, "addObject:", CFSTR("mailboxes"));
    }
  }
  -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  if (v184)
  {
    if (v4)
    {
      -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "debugDescription");
      v186 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v188 = objc_opt_isKindOfClass();

      if ((v188 & 1) != 0)
      {
        v189 = (void *)MEMORY[0x1E0D1EF48];
        -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "partiallyRedactedStringForString:", v185);
      }
      else
      {
        -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "description");
      }
      v186 = objc_claimAutoreleasedReturnValue();
    }
    v190 = (void *)v186;

    v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("displayMessageItemID: %@"), v190);
    objc_msgSend(v7, "addObject:", v191);

  }
  v192 = v7;

  return v192;
}

- (BOOL)isEqual:(id)a3
{
  EMMessageListItemChange *v4;
  EMMessageListItemChange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v4 = (EMMessageListItemChange *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if ((-[EMMessageListItemChange isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[EMMessageListItemChange date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange date](v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFObjectsAreEqual())
    {
      -[EMMessageListItemChange readLater](self, "readLater");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMessageListItemChange readLater](v5, "readLater");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessageListItemChange sendLaterDate](v5, "sendLaterDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual())
        {
          -[EMMessageListItemChange followUp](self, "followUp");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMMessageListItemChange followUp](v5, "followUp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFObjectsAreEqual())
          {
            -[EMMessageListItemChange subject](self, "subject");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[EMMessageListItemChange subject](v5, "subject");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (EFObjectsAreEqual())
            {
              -[EMMessageListItemChange summary](self, "summary");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[EMMessageListItemChange summary](v5, "summary");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (EFObjectsAreEqual())
              {
                -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[EMMessageListItemChange generatedSummary](v5, "generatedSummary");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (EFObjectsAreEqual())
                {
                  -[EMMessageListItemChange senderList](self, "senderList");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[EMMessageListItemChange senderList](v5, "senderList");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  if (EFArraysAreEqual())
                  {
                    -[EMMessageListItemChange toList](self, "toList");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[EMMessageListItemChange toList](v5, "toList");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if (EFArraysAreEqual())
                    {
                      -[EMMessageListItemChange ccList](self, "ccList");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      -[EMMessageListItemChange ccList](v5, "ccList");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if (EFArraysAreEqual())
                      {
                        -[EMMessageListItemChange flags](self, "flags");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        -[EMMessageListItemChange flags](v5, "flags");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        if (EFObjectsAreEqual())
                        {
                          -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          -[EMMessageListItemChange hasUnflagged](v5, "hasUnflagged");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          if (EFObjectsAreEqual())
                          {
                            -[EMMessageListItemChange flagColors](self, "flagColors");
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            -[EMMessageListItemChange flagColors](v5, "flagColors");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            if (EFObjectsAreEqual())
                            {
                              -[EMMessageListItemChange isVIP](self, "isVIP");
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              -[EMMessageListItemChange isVIP](v5, "isVIP");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              if (EFObjectsAreEqual())
                              {
                                -[EMMessageListItemChange isBlocked](self, "isBlocked");
                                v32 = (void *)objc_claimAutoreleasedReturnValue();
                                -[EMMessageListItemChange isBlocked](v5, "isBlocked");
                                v31 = (void *)objc_claimAutoreleasedReturnValue();
                                if (EFObjectsAreEqual())
                                {
                                  -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
                                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[EMMessageListItemChange unsubscribeType](v5, "unsubscribeType");
                                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (EFObjectsAreEqual())
                                  {
                                    -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
                                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[EMMessageListItemChange hasAttachments](v5, "hasAttachments");
                                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (EFObjectsAreEqual())
                                    {
                                      -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
                                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[EMMessageListItemChange conversationNotificationLevel](v5, "conversationNotificationLevel");
                                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (EFObjectsAreEqual())
                                      {
                                        -[EMMessageListItemChange count](self, "count");
                                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[EMMessageListItemChange count](v5, "count");
                                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (EFObjectsAreEqual())
                                        {
                                          -[EMMessageListItemChange conversationID](self, "conversationID");
                                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[EMMessageListItemChange conversationID](v5, "conversationID");
                                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                                          if (EFObjectsAreEqual())
                                          {
                                            -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
                                            v20 = (void *)objc_claimAutoreleasedReturnValue();
                                            -[EMMessageListItemChange mailboxObjectIDs](v5, "mailboxObjectIDs");
                                            v19 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (EFArraysAreEqual())
                                            {
                                              -[EMMessageListItemChange mailboxes](self, "mailboxes");
                                              v18 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[EMMessageListItemChange mailboxes](v5, "mailboxes");
                                              v17 = (void *)objc_claimAutoreleasedReturnValue();
                                              if (EFArraysAreEqual())
                                              {
                                                -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
                                                v16 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[EMMessageListItemChange displayMessageItemID](v5, "displayMessageItemID");
                                                v15 = (void *)objc_claimAutoreleasedReturnValue();
                                                v13 = EFObjectsAreEqual();

                                              }
                                              else
                                              {
                                                v13 = 0;
                                              }

                                            }
                                            else
                                            {
                                              v13 = 0;
                                            }

                                          }
                                          else
                                          {
                                            v13 = 0;
                                          }

                                        }
                                        else
                                        {
                                          v13 = 0;
                                        }

                                      }
                                      else
                                      {
                                        v13 = 0;
                                      }

                                    }
                                    else
                                    {
                                      v13 = 0;
                                    }

                                  }
                                  else
                                  {
                                    v13 = 0;
                                  }

                                }
                                else
                                {
                                  v13 = 0;
                                }

                              }
                              else
                              {
                                v13 = 0;
                              }

                            }
                            else
                            {
                              v13 = 0;
                            }

                          }
                          else
                          {
                            v13 = 0;
                          }

                        }
                        else
                        {
                          v13 = 0;
                        }

                      }
                      else
                      {
                        v13 = 0;
                      }

                    }
                    else
                    {
                      v13 = 0;
                    }

                  }
                  else
                  {
                    v13 = 0;
                  }

                }
                else
                {
                  v13 = 0;
                }

              }
              else
              {
                v13 = 0;
              }

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
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
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  -[EMMessageListItemChange date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[EMMessageListItemChange readLater](self, "readLater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[EMMessageListItemChange followUp](self, "followUp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[EMMessageListItemChange subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[EMMessageListItemChange summary](self, "summary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  -[EMMessageListItemChange senderList](self, "senderList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  -[EMMessageListItemChange toList](self, "toList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v19, "hash");

  -[EMMessageListItemChange ccList](self, "ccList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v20, "hash");

  -[EMMessageListItemChange flags](self, "flags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v21, "hash");

  -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v22, "hash");

  -[EMMessageListItemChange flagColors](self, "flagColors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v23, "hash");

  -[EMMessageListItemChange isVIP](self, "isVIP");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v24, "hash");

  -[EMMessageListItemChange isBlocked](self, "isBlocked");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v25, "hash");

  -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v26, "hash");

  -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v27, "hash");

  -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v28, "hash");

  -[EMMessageListItemChange count](self, "count");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v29, "hash");

  -[EMMessageListItemChange conversationID](self, "conversationID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v30, "hash");
  v38 = v18;

  -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v31, "hash");

  -[EMMessageListItemChange mailboxes](self, "mailboxes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hash");

  -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 33
      * (33
       * (33
        * (33
         * (33
          * (33
           * (33
            * (33
             * (33
              * (33
               * (33
                * (33
                 * (33
                  * (33
                   * (33 * (33 * (33 * (33 * (33 * (33 * (33 * (33 * v4 + v6) + v8) + v10) + v12) + v14) + v16) + v38)
                    + v50)
                   + v49)
                  + v48)
                 + v47)
                + v46)
               + v45)
              + v44)
             + v43)
            + v42)
           + v41)
          + v40)
         + v39)
        + v37)
       + v33)
      + objc_msgSend(v34, "hash")
      + 0x11A65AC5CEE976E1;

  return v35;
}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void)setMailboxObjectIDs:(id)a3
{
  NSArray *mailboxes;
  NSArray *v5;
  NSArray *mailboxObjectIDs;
  id v7;

  v7 = a3;
  if ((EFArraysAreEqual() & 1) == 0)
  {
    mailboxes = self->_mailboxes;
    self->_mailboxes = 0;

    v5 = (NSArray *)objc_msgSend(v7, "copy");
    mailboxObjectIDs = self->_mailboxObjectIDs;
    self->_mailboxObjectIDs = v5;

  }
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  NSArray *v4;
  NSArray *mailboxes;
  NSArray *v6;
  NSArray *mailboxObjectIDs;
  id v8;

  v8 = a3;
  v4 = (NSArray *)objc_msgSend(v8, "copy");
  mailboxes = self->_mailboxes;
  self->_mailboxes = v4;

  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mailboxObjectIDs = self->_mailboxObjectIDs;
  self->_mailboxObjectIDs = v6;

}

+ (id)changeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  EMMessageListItemChange *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(EMMessageListItemChange);
  objc_msgSend(a1, "changeFrom:to:with:hasChanges:", v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)changeFrom:(id)a3 to:(id)a4 with:(id)a5 hasChanges:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  char v71;
  id v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "date");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = EFObjectsAreEqual();

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v11, "setDate:", v83);
    v6 = 1;
  }
  objc_msgSend(v10, "displayDate");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = EFObjectsAreEqual();

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v11, "setDisplayDate:", v82);
    v6 = 1;
  }
  objc_msgSend(v10, "sendLaterDate");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendLaterDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = EFObjectsAreEqual();

  if ((v17 & 1) == 0)
  {
    v18 = v81;
    if (!v81)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setSendLaterDate:", v18);
    if (!v81)

    v6 = 1;
  }
  objc_msgSend(v10, "readLater");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readLater");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = EFObjectsAreEqual();

  if ((v20 & 1) == 0)
  {
    v21 = v80;
    if (!v80)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setReadLater:", v21);
    if (!v80)

    v6 = 1;
  }
  objc_msgSend(v10, "followUp");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "followUp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = EFObjectsAreEqual();

  if ((v23 & 1) == 0)
  {
    v24 = v79;
    if (!v79)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setFollowUp:", v24);
    if (!v79)

    v6 = 1;
  }
  objc_msgSend(v10, "subject");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = EFObjectsAreEqual();

  if ((v26 & 1) == 0)
  {
    v27 = v78;
    if (!v78)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setSubject:", v27);
    if (!v78)

    v6 = 1;
  }
  objc_msgSend(v10, "summary");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "summary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = EFObjectsAreEqual();

  if ((v29 & 1) == 0)
  {
    v30 = v84;
    if (!v84)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setSummary:", v30);
    if (!v84)

    v6 = 1;
  }
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(v10, "generatedSummary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generatedSummary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = EFObjectsAreEqual();

    if ((v33 & 1) == 0)
    {
      v34 = v31;
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "setGeneratedSummary:", v34);
      if (!v31)

      v6 = 1;
    }

  }
  objc_msgSend(v10, "senderList");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "senderList");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = EFArraysAreEqual();

  if ((v36 & 1) == 0)
  {
    objc_msgSend(v11, "setSenderList:", v77);
    v6 = 1;
  }
  objc_msgSend(v10, "toList");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toList");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = EFArraysAreEqual();

  if ((v38 & 1) == 0)
  {
    objc_msgSend(v11, "setToList:", v76);
    v6 = 1;
  }
  objc_msgSend(v10, "ccList");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ccList");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = EFArraysAreEqual();

  if ((v40 & 1) == 0)
  {
    objc_msgSend(v11, "setCcList:", v75);
    v6 = 1;
  }
  objc_msgSend(v10, "flags");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flags");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = EFObjectsAreEqual();

  if ((v42 & 1) == 0)
  {
    objc_msgSend(v11, "setFlags:", v74);
    v6 = 1;
  }
  v43 = objc_msgSend(v10, "hasUnflagged");
  if ((_DWORD)v43 != objc_msgSend(v9, "hasUnflagged"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasUnflagged:", v44);

    v6 = 1;
  }
  objc_msgSend(v10, "flagColors");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flagColors");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = EFObjectsAreEqual();

  if ((v47 & 1) == 0)
  {
    v48 = v45;
    if (!v45)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setFlagColors:", v48);
    if (!v45)

    v6 = 1;
  }
  v49 = objc_msgSend(v10, "isVIP");
  if ((_DWORD)v49 != objc_msgSend(v9, "isVIP"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsVIP:", v50);

    v6 = 1;
  }
  v51 = objc_msgSend(v10, "isBlocked");
  if ((_DWORD)v51 != objc_msgSend(v9, "isBlocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsBlocked:", v52);

    v6 = 1;
  }
  v53 = objc_msgSend(v10, "unsubscribeType");
  if (v53 != objc_msgSend(v9, "unsubscribeType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUnsubscribeType:", v54);

    v6 = 1;
  }
  v55 = objc_msgSend(v10, "hasAttachments");
  if ((_DWORD)v55 != objc_msgSend(v9, "hasAttachments"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasAttachments:", v56);

    v6 = 1;
  }
  v57 = objc_msgSend(v10, "isAuthenticated");
  if ((_DWORD)v57 != objc_msgSend(v9, "isAuthenticated"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsAuthenticated:", v58);

    v6 = 1;
  }
  v59 = objc_msgSend(v10, "conversationNotificationLevel");
  if (v59 != objc_msgSend(v9, "conversationNotificationLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConversationNotificationLevel:", v60);

    v6 = 1;
  }
  v61 = objc_msgSend(v10, "count");
  if (v61 != objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCount:", v62);

    v6 = 1;
  }
  objc_msgSend(v10, "mailboxObjectIDs");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mailboxObjectIDs");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if ((EFArraysAreEqual() & 1) == 0)
  {
    objc_msgSend(v10, "mailboxes");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxes");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "count");
    if (v67 == objc_msgSend(v63, "count")
      && (v68 = objc_msgSend(v66, "count"), v68 == objc_msgSend(v64, "count"))
      && (EFArraysAreEqual() & 1) == 0)
    {
      objc_msgSend(v11, "setMailboxes:", v65);
    }
    else
    {
      objc_msgSend(v11, "setMailboxObjectIDs:", v63);
    }

    v6 = 1;
  }
  objc_msgSend(v10, "displayMessageItemID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayMessageItemID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = EFObjectsAreEqual();

  if ((v71 & 1) == 0)
  {
    objc_msgSend(v11, "setDisplayMessageItemID:", v69);
    goto LABEL_84;
  }
  if (v6)
  {
LABEL_84:
    v72 = v11;
    goto LABEL_85;
  }
  v72 = 0;
LABEL_85:

  return v72;
}

+ (id)changeForKeyPaths:(id)a3 ofItem:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  EMMessageListItemChange *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v19 = v7;
  if (!objc_msgSend(v7, "count"))
  {
    v20 = 0;
    goto LABEL_25;
  }
  v20 = objc_alloc_init(EMMessageListItemChange);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
    goto LABEL_23;
  v11 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("readLater.date")))
        {
          objc_msgSend(v8, "readLater");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v4 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v4;
          }
          -[EMMessageListItemChange setReadLater:](v20, "setReadLater:", v15);
          v16 = (void *)v4;
          if (!v14)
            goto LABEL_18;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("followUp.startDate")) & 1) != 0
               || objc_msgSend(v13, "isEqualToString:", CFSTR("followUp.endDate")))
        {
          objc_msgSend(v8, "followUp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v14;
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v5 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v5;
          }
          -[EMMessageListItemChange setFollowUp:](v20, "setFollowUp:", v17);
          v16 = (void *)v5;
          if (!v14)
LABEL_18:

        }
        else
        {
          objc_msgSend(v8, "valueForKeyPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMMessageListItemChange setValue:forKeyPath:](v20, "setValue:forKeyPath:", v14, v13);
        }

        continue;
      }
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v10);
LABEL_23:

LABEL_25:
  return v20;
}

+ (id)changesForKeyPaths:(id)a3 ofItems:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1, "changeForKeyPaths:ofItem:", v6, v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v13, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v8;
}

+ (id)changeForFlags:(id)a3
{
  id v3;
  EMMessageListItemChange *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(EMMessageListItemChange);
  -[EMMessageListItemChange setFlags:](v4, "setFlags:", v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "flagged") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageListItemChange setHasUnflagged:](v4, "setHasUnflagged:", v5);

  if (objc_msgSend(v3, "flagged"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v3, "flagColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setFlagColors:](v4, "setFlagColors:", v6);

  }
  return v4;
}

+ (id)changeForUnsubscribeType:(int64_t)a3
{
  EMMessageListItemChange *v4;
  void *v5;

  v4 = objc_alloc_init(EMMessageListItemChange);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageListItemChange setUnsubscribeType:](v4, "setUnsubscribeType:", v5);

  return v4;
}

- (void)addChange:(id)a3
{
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
  void *v14;
  void *v15;
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
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v52 = a3;
  objc_msgSend(v52, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v52, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setDate:](self, "setDate:", v5);

  }
  objc_msgSend(v52, "displayDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v52, "displayDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setDisplayDate:](self, "setDisplayDate:", v7);

  }
  objc_msgSend(v52, "readLater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v52, "readLater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setReadLater:](self, "setReadLater:", v9);

  }
  objc_msgSend(v52, "sendLaterDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v52, "sendLaterDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setSendLaterDate:](self, "setSendLaterDate:", v11);

  }
  objc_msgSend(v52, "followUp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v52, "followUp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setFollowUp:](self, "setFollowUp:", v13);

  }
  objc_msgSend(v52, "subject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v52, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setSubject:](self, "setSubject:", v15);

  }
  objc_msgSend(v52, "summary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v52, "summary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setSummary:](self, "setSummary:", v17);

  }
  objc_msgSend(v52, "generatedSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v52, "generatedSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setGeneratedSummary:](self, "setGeneratedSummary:", v19);

  }
  objc_msgSend(v52, "senderList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v52, "senderList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setSenderList:](self, "setSenderList:", v21);

  }
  objc_msgSend(v52, "toList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v52, "toList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setToList:](self, "setToList:", v23);

  }
  objc_msgSend(v52, "ccList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v52, "ccList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setCcList:](self, "setCcList:", v25);

  }
  objc_msgSend(v52, "flags");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v52, "flags");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setFlags:](self, "setFlags:", v27);

  }
  objc_msgSend(v52, "hasUnflagged");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v52, "hasUnflagged");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setHasUnflagged:](self, "setHasUnflagged:", v29);

  }
  objc_msgSend(v52, "flagColors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v52, "flagColors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setFlagColors:](self, "setFlagColors:", v31);

  }
  objc_msgSend(v52, "isVIP");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v52, "isVIP");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setIsVIP:](self, "setIsVIP:", v33);

  }
  objc_msgSend(v52, "isBlocked");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v52, "isBlocked");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setIsBlocked:](self, "setIsBlocked:", v35);

  }
  objc_msgSend(v52, "unsubscribeType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v52, "unsubscribeType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setUnsubscribeType:](self, "setUnsubscribeType:", v37);

  }
  objc_msgSend(v52, "hasAttachments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v52, "hasAttachments");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setHasAttachments:](self, "setHasAttachments:", v39);

  }
  objc_msgSend(v52, "conversationNotificationLevel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v52, "conversationNotificationLevel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setConversationNotificationLevel:](self, "setConversationNotificationLevel:", v41);

  }
  objc_msgSend(v52, "count");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v52, "count");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setCount:](self, "setCount:", v43);

  }
  objc_msgSend(v52, "conversationID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v52, "conversationID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setConversationID:](self, "setConversationID:", v45);

  }
  objc_msgSend(v52, "mailboxObjectIDs");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v52, "mailboxObjectIDs");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setMailboxObjectIDs:](self, "setMailboxObjectIDs:", v47);

  }
  objc_msgSend(v52, "mailboxes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v52, "mailboxes");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setMailboxes:](self, "setMailboxes:", v49);

  }
  objc_msgSend(v52, "displayMessageItemID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v52, "displayMessageItemID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setDisplayMessageItemID:](self, "setDisplayMessageItemID:", v51);

  }
}

- (BOOL)applyToMessageListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  int v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  int v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  int v89;
  int v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  void *v111;
  void *v112;
  void *v113;
  char v114;

  v4 = a3;
  -[EMMessageListItemChange date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EMMessageListItemChange date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[EMMessageListItemChange date](self, "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDate:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange displayDate](self, "displayDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[EMMessageListItemChange displayDate](self, "displayDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[EMMessageListItemChange displayDate](self, "displayDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDisplayDate:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange readLater](self, "readLater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[EMMessageListItemChange readLater](self, "readLater");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange readLater](self, "readLater");
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    objc_msgSend(v4, "readLater");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {

    }
    else
    {
      objc_msgSend(v4, "readLater");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqual:", v17);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v4, "setReadLater:", v15);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

    objc_msgSend(v4, "sendLaterDate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v21 == v22)
    {

    }
    else
    {
      objc_msgSend(v4, "sendLaterDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "isEqual:", v23);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v4, "setSendLaterDate:", v21);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange followUp](self, "followUp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[EMMessageListItemChange followUp](self, "followUp");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange followUp](self, "followUp");
      v27 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }

    objc_msgSend(v4, "followUp");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v27 == v28)
    {

    }
    else
    {
      objc_msgSend(v4, "followUp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v27, "isEqual:", v29);

      if ((v30 & 1) == 0)
      {
        objc_msgSend(v4, "setFollowUp:", v27);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange subject](self, "subject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[EMMessageListItemChange subject](self, "subject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange subject](self, "subject");
      v33 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }

    objc_msgSend(v4, "subject");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (v33 == v34)
    {

    }
    else
    {
      objc_msgSend(v4, "subject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v33, "isEqual:", v35);

      if ((v36 & 1) == 0)
      {
        objc_msgSend(v4, "setSubject:", v33);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange summary](self, "summary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[EMMessageListItemChange summary](self, "summary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange summary](self, "summary");
      v39 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
    }

    objc_msgSend(v4, "summary");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if (v39 == v40)
    {

    }
    else
    {
      objc_msgSend(v4, "summary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v39, "isEqual:", v41);

      if ((v42 & 1) == 0)
      {
        objc_msgSend(v4, "setSummary:", v39);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
      v45 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v45 = 0;
    }

    objc_msgSend(v4, "generatedSummary");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (v45 == v46)
    {

    }
    else
    {
      objc_msgSend(v4, "generatedSummary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v45, "isEqual:", v47);

      if ((v48 & 1) == 0)
      {
        objc_msgSend(v4, "setGeneratedSummary:", v45);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange senderList](self, "senderList");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    -[EMMessageListItemChange senderList](self, "senderList");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderList");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) == 0)
    {
      -[EMMessageListItemChange senderList](self, "senderList");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSenderList:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange toList](self, "toList");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    -[EMMessageListItemChange toList](self, "toList");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toList");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if ((v56 & 1) == 0)
    {
      -[EMMessageListItemChange toList](self, "toList");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setToList:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange ccList](self, "ccList");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    -[EMMessageListItemChange ccList](self, "ccList");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ccList");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if ((v60 & 1) == 0)
    {
      -[EMMessageListItemChange ccList](self, "ccList");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCcList:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange flags](self, "flags");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    -[EMMessageListItemChange flags](self, "flags");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flags");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqual:", v63);

    if ((v64 & 1) == 0)
    {
      -[EMMessageListItemChange flags](self, "flags");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFlags:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "BOOLValue");
    v68 = objc_msgSend(v4, "hasUnflagged");

    if (v67 != v68)
    {
      -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHasUnflagged:", objc_msgSend(v5, "BOOLValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange flagColors](self, "flagColors");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    -[EMMessageListItemChange flagColors](self, "flagColors");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMMessageListItemChange flagColors](self, "flagColors");
      v71 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v71 = 0;
    }

    objc_msgSend(v4, "flagColors");
    v72 = (id)objc_claimAutoreleasedReturnValue();
    if (v71 == v72)
    {

    }
    else
    {
      objc_msgSend(v4, "flagColors");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v71, "isEqual:", v73);

      if ((v74 & 1) == 0)
      {
        objc_msgSend(v4, "setFlagColors:", v71);
        LOBYTE(v5) = 1;
      }
    }

  }
  -[EMMessageListItemChange isVIP](self, "isVIP");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    -[EMMessageListItemChange isVIP](self, "isVIP");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "BOOLValue");
    v78 = objc_msgSend(v4, "isVIP");

    if (v77 != v78)
    {
      -[EMMessageListItemChange isVIP](self, "isVIP");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIsVIP:", objc_msgSend(v5, "BOOLValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange isBlocked](self, "isBlocked");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    -[EMMessageListItemChange isBlocked](self, "isBlocked");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "BOOLValue");
    v82 = objc_msgSend(v4, "isBlocked");

    if (v81 != v82)
    {
      -[EMMessageListItemChange isBlocked](self, "isBlocked");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIsBlocked:", objc_msgSend(v5, "BOOLValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "integerValue");
    v86 = objc_msgSend(v4, "unsubscribeType");

    if (v85 != v86)
    {
      -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUnsubscribeType:", objc_msgSend(v5, "integerValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "BOOLValue");
    v90 = objc_msgSend(v4, "hasAttachments");

    if (v89 != v90)
    {
      -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHasAttachments:", objc_msgSend(v5, "BOOLValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "integerValue");
    v94 = objc_msgSend(v4, "conversationNotificationLevel");

    if (v93 != v94)
    {
      -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setConversationNotificationLevel:", objc_msgSend(v5, "integerValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange count](self, "count");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    -[EMMessageListItemChange count](self, "count");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "unsignedIntegerValue");
    v98 = objc_msgSend(v4, "count");

    if (v97 != v98)
    {
      -[EMMessageListItemChange count](self, "count");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCount:", objc_msgSend(v5, "unsignedIntegerValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange conversationID](self, "conversationID");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    -[EMMessageListItemChange conversationID](self, "conversationID");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "longLongValue");
    v102 = objc_msgSend(v4, "conversationID");

    if (v101 != v102)
    {
      -[EMMessageListItemChange conversationID](self, "conversationID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setConversationID:", objc_msgSend(v5, "longLongValue"));

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailboxObjectIDs");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "isEqual:", v105);

    if ((v106 & 1) == 0)
    {
      -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMailboxObjectIDs:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange mailboxes](self, "mailboxes");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    -[EMMessageListItemChange mailboxes](self, "mailboxes");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mailboxes");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v108, "isEqual:", v109);

    if ((v110 & 1) == 0)
    {
      -[EMMessageListItemChange mailboxes](self, "mailboxes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMailboxes:", v5);

      LOBYTE(v5) = 1;
    }
  }
  -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayMessageItemID");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if ((v114 & 1) == 0)
    {
      -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDisplayMessageItemID:", v5);

      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageListItemChange)initWithCoder:(id)a3
{
  id v4;
  EMMessageListItemChange *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSDate *displayDate;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  EMMessageListItemChangeReadLater *readLater;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  EMMessageListItemChangeFollowUp *followUp;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  EMMessageListItemChangeSubject *subject;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  EMMessageListItemChangeSendLaterDate *sendLaterDate;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  EMMessageListItemChangeSummary *summary;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  EMMessageListItemChangeGeneratedSummary *generatedSummary;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *senderList;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSArray *toList;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSArray *ccList;
  uint64_t v58;
  ECMessageFlags *flags;
  uint64_t v60;
  NSNumber *hasUnflagged;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  EMMessageListItemChangeFlagColors *flagColors;
  uint64_t v67;
  NSNumber *isVIP;
  uint64_t v69;
  NSNumber *isBlocked;
  uint64_t v71;
  NSNumber *unsubscribeType;
  uint64_t v73;
  NSNumber *hasAttachments;
  uint64_t v75;
  NSNumber *conversationNotificationLevel;
  uint64_t v77;
  NSNumber *count;
  uint64_t v79;
  NSNumber *conversationID;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  NSArray *mailboxObjectIDs;
  uint64_t v86;
  EMCollectionItemID *displayMessageItemID;

  v4 = a3;
  v5 = -[EMMessageListItemChange init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayDate = v5->_displayDate;
    v5->_displayDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("EFPropertyKey_readLater"));
    v13 = objc_claimAutoreleasedReturnValue();
    readLater = v5->_readLater;
    v5->_readLater = (EMMessageListItemChangeReadLater *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("EFPropertyKey_followUp"));
    v18 = objc_claimAutoreleasedReturnValue();
    followUp = v5->_followUp;
    v5->_followUp = (EMMessageListItemChangeFollowUp *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("EFPropertyKey_subject"));
    v23 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (EMMessageListItemChangeSubject *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("EFPropertyKey_sendLaterDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    sendLaterDate = v5->_sendLaterDate;
    v5->_sendLaterDate = (EMMessageListItemChangeSendLaterDate *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("EFPropertyKey_summary"));
    v33 = objc_claimAutoreleasedReturnValue();
    summary = v5->_summary;
    v5->_summary = (EMMessageListItemChangeSummary *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("EFPropertyKey_generatedSummary"));
    v38 = objc_claimAutoreleasedReturnValue();
    generatedSummary = v5->_generatedSummary;
    v5->_generatedSummary = (EMMessageListItemChangeGeneratedSummary *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    v42 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("EFPropertyKey_senderList"));
    v44 = objc_claimAutoreleasedReturnValue();
    senderList = v5->_senderList;
    v5->_senderList = (NSArray *)v44;

    v46 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_class();
    v48 = objc_opt_class();
    objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("EFPropertyKey_toList"));
    v50 = objc_claimAutoreleasedReturnValue();
    toList = v5->_toList;
    v5->_toList = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E0C99E60];
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    objc_msgSend(v52, "setWithObjects:", v53, v54, objc_opt_class(), 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("EFPropertyKey_ccList"));
    v56 = objc_claimAutoreleasedReturnValue();
    ccList = v5->_ccList;
    v5->_ccList = (NSArray *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flags"));
    v58 = objc_claimAutoreleasedReturnValue();
    flags = v5->_flags;
    v5->_flags = (ECMessageFlags *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_hasUnflagged"));
    v60 = objc_claimAutoreleasedReturnValue();
    hasUnflagged = v5->_hasUnflagged;
    v5->_hasUnflagged = (NSNumber *)v60;

    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("EFPropertyKey_flagColors"));
    v65 = objc_claimAutoreleasedReturnValue();
    flagColors = v5->_flagColors;
    v5->_flagColors = (EMMessageListItemChangeFlagColors *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_isVIP"));
    v67 = objc_claimAutoreleasedReturnValue();
    isVIP = v5->_isVIP;
    v5->_isVIP = (NSNumber *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_isBlocked"));
    v69 = objc_claimAutoreleasedReturnValue();
    isBlocked = v5->_isBlocked;
    v5->_isBlocked = (NSNumber *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_unsubscribeType"));
    v71 = objc_claimAutoreleasedReturnValue();
    unsubscribeType = v5->_unsubscribeType;
    v5->_unsubscribeType = (NSNumber *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_hasAttachments"));
    v73 = objc_claimAutoreleasedReturnValue();
    hasAttachments = v5->_hasAttachments;
    v5->_hasAttachments = (NSNumber *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_conversationNotificationLevel"));
    v75 = objc_claimAutoreleasedReturnValue();
    conversationNotificationLevel = v5->_conversationNotificationLevel;
    v5->_conversationNotificationLevel = (NSNumber *)v75;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_count"));
    v77 = objc_claimAutoreleasedReturnValue();
    count = v5->_count;
    v5->_count = (NSNumber *)v77;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_conversationID"));
    v79 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSNumber *)v79;

    v81 = (void *)MEMORY[0x1E0C99E60];
    v82 = objc_opt_class();
    objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v83, CFSTR("EFPropertyKey_mailboxObjectIDs"));
    v84 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v5->_mailboxObjectIDs;
    v5->_mailboxObjectIDs = (NSArray *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_displayMessageItemID"));
    v86 = objc_claimAutoreleasedReturnValue();
    displayMessageItemID = v5->_displayMessageItemID;
    v5->_displayMessageItemID = (EMCollectionItemID *)v86;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  void *v14;
  void *v15;
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
  id v27;

  v27 = a3;
  -[EMMessageListItemChange date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_date"));

  -[EMMessageListItemChange displayDate](self, "displayDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_displayDate"));

  -[EMMessageListItemChange readLater](self, "readLater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_readLater"));

  -[EMMessageListItemChange followUp](self, "followUp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_followUp"));

  -[EMMessageListItemChange subject](self, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_subject"));

  -[EMMessageListItemChange sendLaterDate](self, "sendLaterDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_sendLaterDate"));

  -[EMMessageListItemChange summary](self, "summary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_summary"));

  -[EMMessageListItemChange generatedSummary](self, "generatedSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_generatedSummary"));

  -[EMMessageListItemChange senderList](self, "senderList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v12, CFSTR("EFPropertyKey_senderList"));

  -[EMMessageListItemChange toList](self, "toList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v13, CFSTR("EFPropertyKey_toList"));

  -[EMMessageListItemChange ccList](self, "ccList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v14, CFSTR("EFPropertyKey_ccList"));

  -[EMMessageListItemChange flags](self, "flags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v15, CFSTR("EFPropertyKey_flags"));

  -[EMMessageListItemChange hasUnflagged](self, "hasUnflagged");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v16, CFSTR("EFPropertyKey_hasUnflagged"));

  -[EMMessageListItemChange flagColors](self, "flagColors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v17, CFSTR("EFPropertyKey_flagColors"));

  -[EMMessageListItemChange isVIP](self, "isVIP");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v18, CFSTR("EFPropertyKey_isVIP"));

  -[EMMessageListItemChange isBlocked](self, "isBlocked");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v19, CFSTR("EFPropertyKey_isBlocked"));

  -[EMMessageListItemChange unsubscribeType](self, "unsubscribeType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v20, CFSTR("EFPropertyKey_unsubscribeType"));

  -[EMMessageListItemChange hasAttachments](self, "hasAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v21, CFSTR("EFPropertyKey_hasAttachments"));

  -[EMMessageListItemChange conversationNotificationLevel](self, "conversationNotificationLevel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v22, CFSTR("EFPropertyKey_conversationNotificationLevel"));

  -[EMMessageListItemChange count](self, "count");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v23, CFSTR("EFPropertyKey_count"));

  -[EMMessageListItemChange conversationID](self, "conversationID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v24, CFSTR("EFPropertyKey_conversationID"));

  -[EMMessageListItemChange mailboxObjectIDs](self, "mailboxObjectIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v25, CFSTR("EFPropertyKey_mailboxObjectIDs"));

  -[EMMessageListItemChange displayMessageItemID](self, "displayMessageItemID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v26, CFSTR("EFPropertyKey_displayMessageItemID"));

}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
  objc_storeStrong((id *)&self->_displayDate, a3);
}

- (EMMessageListItemChangeSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (EMMessageListItemChangeSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (EMMessageListItemChangeGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)toList
{
  return self->_toList;
}

- (void)setToList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (void)setCcList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (void)setIsToMe:(BOOL)a3
{
  self->_isToMe = a3;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (void)setIsCCMe:(BOOL)a3
{
  self->_isCCMe = a3;
}

- (ECMessageFlags)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (NSNumber)hasUnflagged
{
  return self->_hasUnflagged;
}

- (void)setHasUnflagged:(id)a3
{
  objc_storeStrong((id *)&self->_hasUnflagged, a3);
}

- (EMMessageListItemChangeFlagColors)flagColors
{
  return self->_flagColors;
}

- (void)setFlagColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(id)a3
{
  objc_storeStrong((id *)&self->_isVIP, a3);
}

- (NSNumber)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(id)a3
{
  objc_storeStrong((id *)&self->_isBlocked, a3);
}

- (NSNumber)unsubscribeType
{
  return self->_unsubscribeType;
}

- (void)setUnsubscribeType:(id)a3
{
  objc_storeStrong((id *)&self->_unsubscribeType, a3);
}

- (NSNumber)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_hasAttachments, a3);
}

- (NSNumber)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(id)a3
{
  objc_storeStrong((id *)&self->_isAuthenticated, a3);
}

- (NSNumber)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(id)a3
{
  objc_storeStrong((id *)&self->_conversationNotificationLevel, a3);
}

- (EMMessageListItemChangeReadLater)readLater
{
  return self->_readLater;
}

- (void)setReadLater:(id)a3
{
  objc_storeStrong((id *)&self->_readLater, a3);
}

- (EMMessageListItemChangeSendLaterDate)sendLaterDate
{
  return self->_sendLaterDate;
}

- (void)setSendLaterDate:(id)a3
{
  objc_storeStrong((id *)&self->_sendLaterDate, a3);
}

- (EMMessageListItemChangeFollowUp)followUp
{
  return self->_followUp;
}

- (void)setFollowUp:(id)a3
{
  objc_storeStrong((id *)&self->_followUp, a3);
}

- (EMMessageListItemChangeCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSArray)groupedSenderMessageListItems
{
  return self->_groupedSenderMessageListItems;
}

- (void)setGroupedSenderMessageListItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
  objc_storeStrong((id *)&self->_count, a3);
}

- (NSNumber)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (EMCollectionItemID)displayMessageItemID
{
  return self->_displayMessageItemID;
}

- (void)setDisplayMessageItemID:(id)a3
{
  objc_storeStrong((id *)&self->_displayMessageItemID, a3);
}

- (NSNumber)messageSize
{
  return self->_messageSize;
}

- (void)setMessageSize:(id)a3
{
  objc_storeStrong((id *)&self->_messageSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSize, 0);
  objc_storeStrong((id *)&self->_displayMessageItemID, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_conversationNotificationLevel, 0);
  objc_storeStrong((id *)&self->_isAuthenticated, 0);
  objc_storeStrong((id *)&self->_hasAttachments, 0);
  objc_storeStrong((id *)&self->_unsubscribeType, 0);
  objc_storeStrong((id *)&self->_isBlocked, 0);
  objc_storeStrong((id *)&self->_isVIP, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_hasUnflagged, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
}

@end
