@implementation DAContactSearchResultElement

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DAContactSearchResultElement firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAContactSearchResultElement lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAContactSearchResultElement displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAContactSearchResultElement emailAddress](self, "emailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ %@ (%@): %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqualToDAContactSearchResultElement:(id)a3
{
  DAContactSearchResultElement *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  int v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  int v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  int v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  char v169;

  v4 = (DAContactSearchResultElement *)a3;
  if (v4 == self)
    goto LABEL_69;
  -[DAContactSearchResultElement firstName](self, "firstName");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[DAContactSearchResultElement firstName](self, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement firstName](v4, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement lastName](self, "lastName");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[DAContactSearchResultElement lastName](self, "lastName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement lastName](v4, "lastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v14)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement emailAddress](self, "emailAddress");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[DAContactSearchResultElement emailAddress](self, "emailAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement emailAddress](v4, "emailAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement workPhone](self, "workPhone");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[DAContactSearchResultElement workPhone](self, "workPhone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement workPhone](v4, "workPhone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (!v24)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement mobilePhone](self, "mobilePhone");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[DAContactSearchResultElement mobilePhone](self, "mobilePhone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement mobilePhone](v4, "mobilePhone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToString:", v28);

    if (!v29)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement company](self, "company");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[DAContactSearchResultElement company](self, "company");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement company](v4, "company");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqualToString:", v33);

    if (!v34)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement title](self, "title");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[DAContactSearchResultElement title](self, "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement title](v4, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqualToString:", v38);

    if (!v39)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement alias](self, "alias");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[DAContactSearchResultElement alias](self, "alias");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement alias](v4, "alias");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqualToString:", v43);

    if (!v44)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement homePhone](self, "homePhone");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    -[DAContactSearchResultElement homePhone](self, "homePhone");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement homePhone](v4, "homePhone");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqualToString:", v48);

    if (!v49)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement office](self, "office");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[DAContactSearchResultElement office](self, "office");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement office](v4, "office");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqualToString:", v53);

    if (!v54)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement serverSource](self, "serverSource");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[DAContactSearchResultElement serverSource](self, "serverSource");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement serverSource](v4, "serverSource");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqualToString:", v58);

    if (!v59)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement recordName](self, "recordName");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[DAContactSearchResultElement recordName](self, "recordName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement recordName](v4, "recordName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqualToString:", v63);

    if (!v64)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement faxPhone](self, "faxPhone");
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    -[DAContactSearchResultElement faxPhone](self, "faxPhone");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement faxPhone](v4, "faxPhone");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "isEqualToString:", v68);

    if (!v69)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement department](self, "department");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    -[DAContactSearchResultElement department](self, "department");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement department](v4, "department");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "isEqualToString:", v73);

    if (!v74)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement street](self, "street");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[DAContactSearchResultElement street](self, "street");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement street](v4, "street");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqualToString:", v78);

    if (!v79)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement city](self, "city");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[DAContactSearchResultElement city](self, "city");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement city](v4, "city");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqualToString:", v83);

    if (!v84)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement state](self, "state");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    -[DAContactSearchResultElement state](self, "state");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement state](v4, "state");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqualToString:", v88);

    if (!v89)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement zip](self, "zip");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[DAContactSearchResultElement zip](self, "zip");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement zip](v4, "zip");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqualToString:", v93);

    if (!v94)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement country](self, "country");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    -[DAContactSearchResultElement country](self, "country");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement country](v4, "country");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v97, "isEqualToString:", v98);

    if (!v99)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement jpegPhoto](self, "jpegPhoto");
  v100 = objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    v101 = (void *)v100;
    -[DAContactSearchResultElement jpegPhoto](self, "jpegPhoto");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement jpegPhoto](v4, "jpegPhoto");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v102, "isEqualToData:", v103);

    if (!v104)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement imService](self, "imService");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[DAContactSearchResultElement imService](self, "imService");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement imService](v4, "imService");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqualToString:", v108);

    if (!v109)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement imUsername](self, "imUsername");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[DAContactSearchResultElement imUsername](self, "imUsername");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement imUsername](v4, "imUsername");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqualToString:", v113);

    if (!v114)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement uri](self, "uri");
  v115 = objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v116 = (void *)v115;
    -[DAContactSearchResultElement uri](self, "uri");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement uri](v4, "uri");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v117, "isEqualToString:", v118);

    if (!v119)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement buildingName](self, "buildingName");
  v120 = objc_claimAutoreleasedReturnValue();
  if (v120)
  {
    v121 = (void *)v120;
    -[DAContactSearchResultElement buildingName](self, "buildingName");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement buildingName](v4, "buildingName");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v122, "isEqualToString:", v123);

    if (!v124)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement appleFloor](self, "appleFloor");
  v125 = objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    v126 = (void *)v125;
    -[DAContactSearchResultElement appleFloor](self, "appleFloor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement appleFloor](v4, "appleFloor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v127, "isEqualToString:", v128);

    if (!v129)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement pagerNumber](self, "pagerNumber");
  v130 = objc_claimAutoreleasedReturnValue();
  if (v130)
  {
    v131 = (void *)v130;
    -[DAContactSearchResultElement pagerNumber](self, "pagerNumber");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement pagerNumber](v4, "pagerNumber");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v132, "isEqualToString:", v133);

    if (!v134)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement postalAddress](self, "postalAddress");
  v135 = objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    v136 = (void *)v135;
    -[DAContactSearchResultElement postalAddress](self, "postalAddress");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement postalAddress](v4, "postalAddress");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v137, "isEqualToString:", v138);

    if (!v139)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement homePostalAddress](self, "homePostalAddress");
  v140 = objc_claimAutoreleasedReturnValue();
  if (v140)
  {
    v141 = (void *)v140;
    -[DAContactSearchResultElement homePostalAddress](self, "homePostalAddress");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement homePostalAddress](v4, "homePostalAddress");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v142, "isEqualToString:", v143);

    if (!v144)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement principalPath](self, "principalPath");
  v145 = objc_claimAutoreleasedReturnValue();
  if (v145)
  {
    v146 = (void *)v145;
    -[DAContactSearchResultElement principalPath](self, "principalPath");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement principalPath](v4, "principalPath");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v147, "isEqualToString:", v148);

    if (!v149)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement iPhone](self, "iPhone");
  v150 = objc_claimAutoreleasedReturnValue();
  if (v150)
  {
    v151 = (void *)v150;
    -[DAContactSearchResultElement iPhone](self, "iPhone");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement iPhone](v4, "iPhone");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v152, "isEqualToString:", v153);

    if (!v154)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement mainPhone](self, "mainPhone");
  v155 = objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    v156 = (void *)v155;
    -[DAContactSearchResultElement mainPhone](self, "mainPhone");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement mainPhone](v4, "mainPhone");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend(v157, "isEqualToString:", v158);

    if (!v159)
      goto LABEL_68;
  }
  -[DAContactSearchResultElement workFaxPhone](self, "workFaxPhone");
  v160 = objc_claimAutoreleasedReturnValue();
  if (v160)
  {
    v161 = (void *)v160;
    -[DAContactSearchResultElement workFaxPhone](self, "workFaxPhone");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement workFaxPhone](v4, "workFaxPhone");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(v162, "isEqualToString:", v163);

    if (!v164)
    {
LABEL_68:
      v169 = 0;
      goto LABEL_70;
    }
  }
  -[DAContactSearchResultElement cuAddresses](self, "cuAddresses");
  v165 = objc_claimAutoreleasedReturnValue();
  if (!v165)
  {
LABEL_69:
    v169 = 1;
    goto LABEL_70;
  }
  v166 = (void *)v165;
  -[DAContactSearchResultElement cuAddresses](self, "cuAddresses");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAContactSearchResultElement cuAddresses](v4, "cuAddresses");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend(v167, "isEqual:", v168);

LABEL_70:
  return v169;
}

- (BOOL)isEqual:(id)a3
{
  DAContactSearchResultElement *v4;
  DAContactSearchResultElement *v5;
  BOOL v6;

  v4 = (DAContactSearchResultElement *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[DAContactSearchResultElement isEqualToDAContactSearchResultElement:](self, "isEqualToDAContactSearchResultElement:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v40;

  v4 = a3;
  -[DAContactSearchResultElement displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DisplayNameKey"));

  -[DAContactSearchResultElement firstName](self, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("FirstNameKey"));

  -[DAContactSearchResultElement lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LastNameKey"));

  -[DAContactSearchResultElement emailAddress](self, "emailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("EmailAddressKey"));

  -[DAContactSearchResultElement workPhone](self, "workPhone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WorkPhoneKey"));

  -[DAContactSearchResultElement mobilePhone](self, "mobilePhone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("MobilePhoneKey"));

  -[DAContactSearchResultElement company](self, "company");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("CompanyKey"));

  -[DAContactSearchResultElement title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("TitleKey"));

  -[DAContactSearchResultElement alias](self, "alias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("AliasKey"));

  -[DAContactSearchResultElement homePhone](self, "homePhone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("HomePhoneKey"));

  -[DAContactSearchResultElement office](self, "office");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("OfficeKey"));

  -[DAContactSearchResultElement serverSource](self, "serverSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("ServerSourceKey"));

  -[DAContactSearchResultElement recordName](self, "recordName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("RecordNameKey"));

  -[DAContactSearchResultElement faxPhone](self, "faxPhone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("FaxPhoneKey"));

  -[DAContactSearchResultElement department](self, "department");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("DepartmentKey"));

  -[DAContactSearchResultElement street](self, "street");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("StreetKey"));

  -[DAContactSearchResultElement city](self, "city");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("CityKey"));

  -[DAContactSearchResultElement state](self, "state");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("StateKey"));

  -[DAContactSearchResultElement zip](self, "zip");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("ZipKey"));

  -[DAContactSearchResultElement country](self, "country");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("CountryKey"));

  -[DAContactSearchResultElement jpegPhoto](self, "jpegPhoto");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("JpegPhotoKey"));

  -[DAContactSearchResultElement imService](self, "imService");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("ImServiceKey"));

  -[DAContactSearchResultElement imUsername](self, "imUsername");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("ImUsernameKey"));

  -[DAContactSearchResultElement uri](self, "uri");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("UriKey"));

  -[DAContactSearchResultElement buildingName](self, "buildingName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("BuildingNameKey"));

  -[DAContactSearchResultElement appleFloor](self, "appleFloor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("AppleFloorKey"));

  -[DAContactSearchResultElement pagerNumber](self, "pagerNumber");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("PagerNumberKey"));

  -[DAContactSearchResultElement postalAddress](self, "postalAddress");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("PostalAddressKey"));

  -[DAContactSearchResultElement homePostalAddress](self, "homePostalAddress");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("HomePostalAddressKey"));

  -[DAContactSearchResultElement principalPath](self, "principalPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("PrincipalPathKey"));

  -[DAContactSearchResultElement preferredUserAddress](self, "preferredUserAddress");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("PreferredUserAddressKey"));

  -[DAContactSearchResultElement cuAddresses](self, "cuAddresses");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("CUAddressesKey"));

  -[DAContactSearchResultElement iPhone](self, "iPhone");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("IPhone"));

  -[DAContactSearchResultElement mainPhone](self, "mainPhone");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("MainPhone"));

  -[DAContactSearchResultElement workFaxPhone](self, "workFaxPhone");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("WorkFaxPhone"));

  -[DAContactSearchResultElement identifierOnServer](self, "identifierOnServer");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("IdentifierOnServerKey"));

}

- (DAContactSearchResultElement)initWithCoder:(id)a3
{
  id v4;
  DAContactSearchResultElement *v5;
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
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DAContactSearchResultElement;
  v5 = -[DAContactSearchResultElement init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setDisplayName:](v5, "setDisplayName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstNameKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setFirstName:](v5, "setFirstName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setLastName:](v5, "setLastName:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EmailAddressKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setEmailAddress:](v5, "setEmailAddress:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WorkPhoneKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setWorkPhone:](v5, "setWorkPhone:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MobilePhoneKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setMobilePhone:](v5, "setMobilePhone:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CompanyKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setCompany:](v5, "setCompany:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TitleKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setTitle:](v5, "setTitle:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AliasKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setAlias:](v5, "setAlias:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomePhoneKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setHomePhone:](v5, "setHomePhone:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OfficeKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setOffice:](v5, "setOffice:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerSourceKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setServerSource:](v5, "setServerSource:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordNameKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setRecordName:](v5, "setRecordName:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FaxPhoneKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setFaxPhone:](v5, "setFaxPhone:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DepartmentKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setDepartment:](v5, "setDepartment:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StreetKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setStreet:](v5, "setStreet:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CityKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setCity:](v5, "setCity:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StateKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setState:](v5, "setState:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ZipKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setZip:](v5, "setZip:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CountryKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setCountry:](v5, "setCountry:", v25);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JpegPhotoKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setJpegPhoto:](v5, "setJpegPhoto:", v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImServiceKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setImService:](v5, "setImService:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ImUsernameKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setImUsername:](v5, "setImUsername:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UriKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setUri:](v5, "setUri:", v29);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BuildingNameKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setBuildingName:](v5, "setBuildingName:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleFloorKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setAppleFloor:](v5, "setAppleFloor:", v31);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PagerNumberKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setPagerNumber:](v5, "setPagerNumber:", v32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PostalAddressKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setPostalAddress:](v5, "setPostalAddress:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomePostalAddressKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setHomePostalAddress:](v5, "setHomePostalAddress:", v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrincipalPathKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setPrincipalPath:](v5, "setPrincipalPath:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreferredUserAddressKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setPreferredUserAddress:](v5, "setPreferredUserAddress:", v36);

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("CUAddressesKey"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setCuAddresses:](v5, "setCuAddresses:", v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IPhone"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setIPhone:](v5, "setIPhone:", v41);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MainPhone"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setMainPhone:](v5, "setMainPhone:", v42);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WorkFaxPhone"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setWorkFaxPhone:](v5, "setWorkFaxPhone:", v43);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentifierOnServerKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAContactSearchResultElement setIdentifierOnServer:](v5, "setIdentifierOnServer:", v44);

  }
  return v5;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)workPhone
{
  return self->_workPhone;
}

- (void)setWorkPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)mobilePhone
{
  return self->_mobilePhone;
}

- (void)setMobilePhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)company
{
  return self->_company;
}

- (void)setCompany:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)homePhone
{
  return self->_homePhone;
}

- (void)setHomePhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)office
{
  return self->_office;
}

- (void)setOffice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)serverSource
{
  return self->_serverSource;
}

- (void)setServerSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)faxPhone
{
  return self->_faxPhone;
}

- (void)setFaxPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)department
{
  return self->_department;
}

- (void)setDepartment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSData)jpegPhoto
{
  return self->_jpegPhoto;
}

- (void)setJpegPhoto:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)imService
{
  return self->_imService;
}

- (void)setImService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)imUsername
{
  return self->_imUsername;
}

- (void)setImUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)buildingName
{
  return self->_buildingName;
}

- (void)setBuildingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)appleFloor
{
  return self->_appleFloor;
}

- (void)setAppleFloor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)pagerNumber
{
  return self->_pagerNumber;
}

- (void)setPagerNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)homePostalAddress
{
  return self->_homePostalAddress;
}

- (void)setHomePostalAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (void)setPrincipalPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)preferredUserAddress
{
  return self->_preferredUserAddress;
}

- (void)setPreferredUserAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSArray)cuAddresses
{
  return self->_cuAddresses;
}

- (void)setCuAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)iPhone
{
  return self->_iPhone;
}

- (void)setIPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)mainPhone
{
  return self->_mainPhone;
}

- (void)setMainPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)workFaxPhone
{
  return self->_workFaxPhone;
}

- (void)setWorkFaxPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)identifierOnServer
{
  return self->_identifierOnServer;
}

- (void)setIdentifierOnServer:(id)a3
{
  objc_storeStrong((id *)&self->_identifierOnServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierOnServer, 0);
  objc_storeStrong((id *)&self->_workFaxPhone, 0);
  objc_storeStrong((id *)&self->_mainPhone, 0);
  objc_storeStrong((id *)&self->_iPhone, 0);
  objc_storeStrong((id *)&self->_cuAddresses, 0);
  objc_storeStrong((id *)&self->_preferredUserAddress, 0);
  objc_storeStrong((id *)&self->_principalPath, 0);
  objc_storeStrong((id *)&self->_homePostalAddress, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_pagerNumber, 0);
  objc_storeStrong((id *)&self->_appleFloor, 0);
  objc_storeStrong((id *)&self->_buildingName, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_imUsername, 0);
  objc_storeStrong((id *)&self->_imService, 0);
  objc_storeStrong((id *)&self->_jpegPhoto, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_department, 0);
  objc_storeStrong((id *)&self->_faxPhone, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_serverSource, 0);
  objc_storeStrong((id *)&self->_office, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_homePhone, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_company, 0);
  objc_storeStrong((id *)&self->_mobilePhone, 0);
  objc_storeStrong((id *)&self->_workPhone, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
