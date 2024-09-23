@implementation CUIKEventDescriptionGenerator

+ (id)sharedGenerator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CUIKEventDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_2 != -1)
    dispatch_once(&sharedGenerator_onceToken_2, block);
  return (id)sharedGenerator___sharedInstance_2;
}

void __48__CUIKEventDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_2;
  sharedGenerator___sharedInstance_2 = (uint64_t)v1;

}

- (id)textRepresentationForEvent:(id)a3 withTextFormat:(unint64_t)a4 showURI:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
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
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  _BOOL8 v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  CUIKEventDescriptionGenerator *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t j;
  void *v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  _BOOL4 v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  unint64_t v153;
  unint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  _BOOL4 v165;
  CUIKEventDescriptionGenerator *v166;
  void *v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v5 = a5;
  v178 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attendees");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNotes");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "virtualConference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = self;
  v13 = -[CUIKEventDescriptionGenerator _virtualConferenceUsesShortRepresentation:](self, "_virtualConferenceUsesShortRepresentation:", v12);
  v161 = v12;
  if (a4 == 1)
  {
    v14 = &stru_1E6EBAE30;
    goto LABEL_6;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v15 = a4 == 3;
    if (a4 == 3)
    {
      v14 = CFSTR("\n\n\n");
LABEL_6:
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
      v165 = a4 == 3;
LABEL_7:
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKEventDescriptionGenerator _boldBasicTextAttributes](v166, "_boldBasicTextAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v19);

      v12 = v161;
      objc_msgSend(v16, "appendAttributedString:", v20);
LABEL_8:

      goto LABEL_9;
    }
    v16 = 0;
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E6EBAE30);
  }
  v26 = v15;
  v165 = v26;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendString:", v20);
      goto LABEL_8;
    case 1uLL:
    case 3uLL:
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v9, "stringByTrimmingWhitespaceAndRemovingNewlines");
      v144 = objc_claimAutoreleasedReturnValue();
      v145 = (void *)v144;
      v146 = (void *)MEMORY[0x1E0CB3940];
      if (v5)
      {
        -[CUIKEventDescriptionGenerator _showEventURLStringForEvent:](v166, "_showEventURLStringForEvent:", v8);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "stringWithFormat:", CFSTR("<b><a href = %@>%@</a></b><br />"), v147, v145);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<b>%@</b><br />"), v144);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "appendString:", v20);

      v12 = v161;
      goto LABEL_8;
    default:
      break;
  }
LABEL_9:
  -[CUIKEventDescriptionGenerator dateStringRepresentationForEvent:](v166, "dateStringRepresentationForEvent:", v8);
  v21 = objc_claimAutoreleasedReturnValue();
  v158 = (void *)v10;
  if (v21)
  {
    v159 = (void *)v21;
    switch(a4)
    {
      case 0uLL:
        v27 = (void *)v21;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v21);
        goto LABEL_22;
      case 1uLL:
      case 3uLL:
        v22 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v159);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v24);

        v12 = v161;
        objc_msgSend(v16, "appendAttributedString:", v25);

        break;
      case 2uLL:
        v27 = (void *)v21;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<br />"), v21);
LABEL_22:
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "appendString:", v28);
        v159 = (void *)v28;
        break;
      default:
        break;
    }
  }
  else
  {
    v159 = 0;
  }
  v167 = v16;
  if (objc_msgSend(v164, "length"))
  {
    v29 = v9;
    v30 = v11;
    v31 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Location: %@"), &stru_1E6EBAE30, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringWithFormat:", v33, v164);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v34);
        goto LABEL_28;
      case 1uLL:
      case 3uLL:
        v35 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v35, "initWithString:attributes:", v36, v37);
        objc_msgSend(v16, "appendAttributedString:", v38);

        goto LABEL_29;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<br />"), v34);
LABEL_28:
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v36);
LABEL_29:

        break;
      default:
        break;
    }

    v12 = v161;
    v11 = v30;
    v9 = v29;
  }
  v39 = !v13;
  if (!v12)
    v39 = 1;
  if ((v39 & 1) == 0)
  {
    v40 = v9;
    CUIKBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Video Call: %@"), &stru_1E6EBAE30, 0);
    v42 = v12;
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "joinMethods");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "URL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 0uLL:
        v50 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v46, "absoluteString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringWithFormat:", v43, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v52);

        objc_msgSend(v16, "appendString:", CFSTR("\n"));
        break;
      case 1uLL:
      case 3uLL:
        v155 = v40;
        v47 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v47, "initWithString:attributes:", v43, v48);

        if (v165)
          objc_msgSend(v46, "cal_ShortDisplayStringForURL");
        else
          objc_msgSend(v46, "absoluteString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _attributedStringWithURL:title:](v166, "_attributedStringWithURL:title:", v46, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v49, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "appendAttributedString:", v56);

        v16 = v167;
        v40 = v155;
        break;
      case 2uLL:
        -[CUIKEventDescriptionGenerator _virtualConferenceHTMLRepresentation:isForEmail:](v166, "_virtualConferenceHTMLRepresentation:isForEmail:", v8, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v53);

        break;
      default:
        break;
    }

    v12 = v161;
    v9 = v40;
  }
  v57 = v158;
  if (v158)
  {
    switch(a4)
    {
      case 0uLL:
        v85 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v158, "absoluteString");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "stringWithFormat:", CFSTR("%@\n"), v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v87);

        break;
      case 1uLL:
      case 3uLL:
        objc_msgSend(v158, "absoluteString");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _attributedStringWithURL:title:](v166, "_attributedStringWithURL:title:", v158, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "appendAttributedString:", v59);
        goto LABEL_45;
      case 2uLL:
        objc_msgSend(v158, "absoluteString");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _htmlStringWithURL:title:](v166, "_htmlStringWithURL:title:", v158, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v89);

        break;
      default:
        break;
    }
  }
  else
  {
LABEL_45:
    if ((a4 | 2) == 3 && objc_msgSend(v11, "count"))
    {
      v148 = v13;
      v153 = a4;
      v156 = v9;
      v151 = v8;
      v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E6EBAE30);
      v162 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      v175 = 0u;
      v149 = v11;
      v61 = v11;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v172, v177, 16);
      v63 = (void *)v60;
      if (v62)
      {
        v64 = v62;
        v65 = *(_QWORD *)v173;
        do
        {
          for (i = 0; i != v64; ++i)
          {
            if (*(_QWORD *)v173 != v65)
              objc_enumerationMutation(v61);
            v67 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * i);
            objc_msgSend(v67, "name");
            v68 = objc_claimAutoreleasedReturnValue();
            if (v68)
            {
              v69 = (void *)v68;
              objc_msgSend(v67, "name");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = objc_msgSend(v164, "rangeOfString:", v70);

              v60 = (uint64_t)v63;
              if (v71 == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v162, "addObject:", v67);
            }
          }
          v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v172, v177, 16);
        }
        while (v64);
      }

      v72 = (void *)v60;
      v9 = v156;
      v16 = v167;
      if (objc_msgSend(v162, "count"))
      {
        v73 = !v165;
        objc_msgSend(v162, "objectAtIndex:", 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _textRepresentationForAttendee:includeEmailAddress:](v166, "_textRepresentationForAttendee:includeEmailAddress:", v74, v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v72, "appendAttributedString:", v75);
        v76 = objc_msgSend(v162, "count");
        if (v76 < 2)
        {
          v81 = v75;
          v79 = v166;
          v72 = v63;
        }
        else
        {
          v77 = v76;
          v78 = 1;
          v79 = v166;
          v72 = v63;
          do
          {
            objc_msgSend(v162, "objectAtIndex:", v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUIKEventDescriptionGenerator _textRepresentationForAttendee:includeEmailAddress:](v166, "_textRepresentationForAttendee:includeEmailAddress:", v80, v73);
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            v82 = objc_alloc(MEMORY[0x1E0CB3498]);
            -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (void *)objc_msgSend(v82, "initWithString:attributes:", CFSTR(", "), v83);
            objc_msgSend(v63, "appendAttributedString:", v84);

            objc_msgSend(v63, "appendAttributedString:", v81);
            ++v78;
            v75 = v81;
          }
          while (v77 != v78);
        }
        v90 = objc_alloc(MEMORY[0x1E0CB3498]);
        CUIKBundle();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("Invitees: "), &stru_1E6EBAE30, 0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v79, "_basicTextAttributes");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (void *)objc_msgSend(v90, "initWithString:attributes:", v92, v93);
        v16 = v167;
        objc_msgSend(v167, "appendAttributedString:", v94);

        objc_msgSend(v167, "appendAttributedString:", v72);
        v95 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v79, "_basicTextAttributes");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = (void *)objc_msgSend(v95, "initWithString:attributes:", CFSTR("\n"), v96);
        objc_msgSend(v167, "appendAttributedString:", v97);

        v9 = v156;
      }

      v57 = v158;
      v11 = v149;
      v8 = v151;
      v12 = v161;
      a4 = v153;
      v13 = v148;
    }
  }
  if (v12 && !v13)
  {
    CUIKBundle();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("Video Call:"), &stru_1E6EBAE30, 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 0uLL:
        v138 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "virtualConferenceTextRepresentation");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "stringWithFormat:", CFSTR("\n%@\n%@\n\n"), v99, v137);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "appendString:", v139);

        v16 = v167;
        goto LABEL_88;
      case 1uLL:
      case 3uLL:
        v154 = a4;
        v157 = v9;
        v150 = v11;
        v152 = v8;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@\n"), v99);
        v100 = objc_claimAutoreleasedReturnValue();

        v101 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = (void *)v100;
        v103 = (void *)objc_msgSend(v101, "initWithString:attributes:", v100, v102);
        objc_msgSend(v16, "appendAttributedString:", v103);

        objc_msgSend(v12, "title");
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        if (v104)
        {
          v105 = objc_alloc(MEMORY[0x1E0CB3498]);
          v106 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v12, "title");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (void *)objc_msgSend(v106, "initWithFormat:", CFSTR("%@\n\n"), v107);
          -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = (void *)objc_msgSend(v105, "initWithString:attributes:", v108, v109);

          v12 = v161;
          objc_msgSend(v16, "appendAttributedString:", v110);

        }
        v170 = 0u;
        v171 = 0u;
        v168 = 0u;
        v169 = 0u;
        objc_msgSend(v12, "joinMethods");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v168, v176, 16);
        if (v112)
        {
          v113 = v112;
          v114 = *(_QWORD *)v169;
          do
          {
            for (j = 0; j != v113; ++j)
            {
              if (*(_QWORD *)v169 != v114)
                objc_enumerationMutation(v111);
              v116 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * j);
              objc_msgSend(v116, "title");
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              if (v117)
              {
                v118 = objc_alloc(MEMORY[0x1E0CB3498]);
                v119 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v116, "title");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v121 = (void *)objc_msgSend(v119, "initWithFormat:", CFSTR("%@\n"), v120);
                -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = (void *)objc_msgSend(v118, "initWithString:attributes:", v121, v122);

                objc_msgSend(v167, "appendAttributedString:", v123);
              }
              objc_msgSend(v116, "URL");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = v124;
              if (v165)
                objc_msgSend(v124, "cal_ShortDisplayStringForURL");
              else
                objc_msgSend(v124, "absoluteString");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUIKEventDescriptionGenerator _attributedStringWithURL:title:](v166, "_attributedStringWithURL:title:", v125, v126);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v167, "appendAttributedString:", v127);
              v128 = objc_alloc(MEMORY[0x1E0CB3498]);
              -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = (void *)objc_msgSend(v128, "initWithString:attributes:", CFSTR("\n"), v129);
              objc_msgSend(v167, "appendAttributedString:", v130);

            }
            v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v168, v176, 16);
          }
          while (v113);
        }

        v12 = v161;
        objc_msgSend(v161, "conferenceDetails");
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        if (v131)
        {
          v132 = objc_alloc(MEMORY[0x1E0CB3498]);
          v133 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v161, "conferenceDetails");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = (void *)objc_msgSend(v133, "initWithFormat:", CFSTR("%@\n\n"), v134);
          -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = (void *)objc_msgSend(v132, "initWithString:attributes:", v135, v136);

          v12 = v161;
          v16 = v167;
          objc_msgSend(v167, "appendAttributedString:", v137);
          v11 = v150;
          v8 = v152;
          v9 = v157;
          v57 = v158;
          a4 = v154;
          v99 = v163;
LABEL_88:

        }
        else
        {
          v99 = v163;
          v11 = v150;
          v8 = v152;
          v9 = v157;
          v57 = v158;
          v16 = v167;
          a4 = v154;
        }
LABEL_89:

        break;
      case 2uLL:
        -[CUIKEventDescriptionGenerator _virtualConferenceHTMLRepresentation:isForEmail:](v166, "_virtualConferenceHTMLRepresentation:isForEmail:", v8, 0);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v137);
        goto LABEL_88;
      default:
        goto LABEL_89;
    }
  }
  if (v160)
  {
    switch(a4)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v160);
        goto LABEL_95;
      case 1uLL:
      case 3uLL:
        v140 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[CUIKEventDescriptionGenerator _basicTextAttributes](v166, "_basicTextAttributes");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = (void *)objc_msgSend(v140, "initWithString:attributes:", v160, v141);
        objc_msgSend(v16, "appendAttributedString:", v142);

        goto LABEL_96;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<br />"), v160);
LABEL_95:
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v141);
LABEL_96:

        break;
      default:
        break;
    }
  }

  return v16;
}

- (id)dateStringRepresentationForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(v3, "isReminderIntegrationEvent"))
    {
      v5 = (void *)MEMORY[0x1E0D0C2B0];
      objc_msgSend(v3, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateStringRepresentationForReminderStartDate:allDay:", v6, objc_msgSend(v3, "isAllDay"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "endDateUnadjustedForLegacyClients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v8 = objc_msgSend(v3, "isAllDay");
        objc_msgSend(v3, "timeZone");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D0C2B0], "dateStringRepresentationForEventCompontentsStartDate:endDate:allDay:timeZone:", v4, v6, v8, v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_showEventURLStringForEvent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "externalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_virtualConferenceUsesShortRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "joinMethods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v3, "conferenceDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_textRepresentationForAttendee:(id)a3 includeEmailAddress:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  void *v26;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3778];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", &stru_1E6EBAE30);
  objc_msgSend(v7, "name");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v4)
  {
    if (v9)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKEventDescriptionGenerator _basicTextAttributes](self, "_basicTextAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v13);
      objc_msgSend(v8, "appendAttributedString:", v14);

    }
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CUIKEventDescriptionGenerator _basicTextAttributes](self, "_basicTextAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", CFSTR("<"), v16);
    objc_msgSend(v8, "appendAttributedString:", v17);

    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CUIKEventDescriptionGenerator _urlAttributes:](self, "_urlAttributes:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v10, v19);
    objc_msgSend(v8, "appendAttributedString:", v20);

    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CUIKEventDescriptionGenerator _basicTextAttributes](self, "_basicTextAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR(">");
    v24 = v21;
    goto LABEL_8;
  }
  if (v9)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CUIKEventDescriptionGenerator _basicTextAttributes](self, "_basicTextAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v25;
    v23 = v9;
LABEL_8:
    v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v23, v22);
    objc_msgSend(v8, "appendAttributedString:", v26);

  }
  return v8;
}

- (id)_attributedStringWithURL:(id)a3 title:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[CUIKEventDescriptionGenerator _urlAttributes:](self, "_urlAttributes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v7);
  return v9;
}

- (id)_urlAttributes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = *MEMORY[0x1E0DC1160];
    v20[0] = a3;
    v4 = *MEMORY[0x1E0DC1248];
    v19[0] = v3;
    v19[1] = v4;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a3;
    objc_msgSend(v5, "numberWithInteger:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v7;
    v19[2] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v8;
    v19[3] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v20;
    v12 = v19;
    v13 = 4;
  }
  else
  {
    v17[0] = *MEMORY[0x1E0DC1248];
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v6 = 0;
    objc_msgSend(v14, "numberWithInteger:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    v17[2] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v18;
    v12 = v17;
    v13 = 3;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_basicTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_boldBasicTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 16.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)virtualConferenceEmailHTMLRepresentation:(id)a3
{
  return -[CUIKEventDescriptionGenerator _virtualConferenceHTMLRepresentation:isForEmail:](self, "_virtualConferenceHTMLRepresentation:isForEmail:", a3, 1);
}

- (id)_htmlStringWithURL:(id)a3 title:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<a href=%@>%@</a><br />"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_virtualConferenceHTMLRepresentation:(id)a3 isForEmail:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CUIKEventDescriptionGenerator *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
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
  void *v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "virtualConference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[CUIKEventDescriptionGenerator _virtualConferenceUsesShortRepresentation:](self, "_virtualConferenceUsesShortRepresentation:", v5))
    {
      CUIKBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Video Call: %@"), &stru_1E6EBAE30, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "joinMethods");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
        objc_msgSend(v10, "cal_ShortDisplayStringForURL");
      else
        objc_msgSend(v10, "absoluteString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKEventDescriptionGenerator _htmlStringWithURL:title:](self, "_htmlStringWithURL:title:", v10, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v33);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = self;
      v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      CUIKBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Video Call:"), &stru_1E6EBAE30, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<br />%@<br />"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v15;
      objc_msgSend(v11, "appendString:", v15);
      objc_msgSend(v5, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v5, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR("%@<br /><br />"), v17);

      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = v5;
      objc_msgSend(v5, "joinMethods");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v39 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v23, "title");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v23, "title");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "appendFormat:", CFSTR("%@<br />"), v25);

            }
            objc_msgSend(v23, "URL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (a4)
              objc_msgSend(v26, "cal_ShortDisplayStringForURL");
            else
              objc_msgSend(v26, "absoluteString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUIKEventDescriptionGenerator _htmlStringWithURL:title:](v12, "_htmlStringWithURL:title:", v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendString:", v29);
            objc_msgSend(v11, "appendString:", CFSTR("<br />"));

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v20);
      }

      v5 = v36;
      objc_msgSend(v36, "conferenceDetails");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v36, "conferenceDetails");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR("%@<br /><br />"), v31);

      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
