@implementation CHTerminal

- (id)getValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isEqualToString;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;

  objc_msgSend_name(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("0"), v9, v10, v11);

  if ((isEqualToString & 1) != 0)
    return &unk_1E7828700;
  objc_msgSend_name(self, v13, v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)CFSTR("1"), v21, v22, v23);

  if ((v24 & 1) != 0)
    return &unk_1E7828718;
  objc_msgSend_name(self, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)CFSTR("2"), v32, v33, v34);

  if ((v35 & 1) != 0)
    return &unk_1E7828730;
  objc_msgSend_name(self, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_isEqualToString_(v41, v42, (uint64_t)CFSTR("3"), v43, v44, v45);

  if ((v46 & 1) != 0)
    return &unk_1E7828748;
  objc_msgSend_name(self, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_isEqualToString_(v52, v53, (uint64_t)CFSTR("4"), v54, v55, v56);

  if ((v57 & 1) != 0)
    return &unk_1E7828760;
  objc_msgSend_name(self, v58, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_isEqualToString_(v63, v64, (uint64_t)CFSTR("5"), v65, v66, v67);

  if ((v68 & 1) != 0)
    return &unk_1E7828778;
  objc_msgSend_name(self, v69, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_isEqualToString_(v74, v75, (uint64_t)CFSTR("6"), v76, v77, v78);

  if ((v79 & 1) != 0)
    return &unk_1E7828790;
  objc_msgSend_name(self, v80, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_isEqualToString_(v85, v86, (uint64_t)CFSTR("7"), v87, v88, v89);

  if ((v90 & 1) != 0)
    return &unk_1E78287A8;
  objc_msgSend_name(self, v91, v92, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend_isEqualToString_(v96, v97, (uint64_t)CFSTR("8"), v98, v99, v100);

  if ((v101 & 1) != 0)
    return &unk_1E78287C0;
  objc_msgSend_name(self, v102, v103, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend_isEqualToString_(v107, v108, (uint64_t)CFSTR("9"), v109, v110, v111);

  if ((v112 & 1) != 0)
    return &unk_1E78287D8;
  objc_msgSend_name(self, v113, v114, v115, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend_isEqualToString_(v118, v119, (uint64_t)CFSTR("e"), v120, v121, v122);

  if ((v123 & 1) != 0)
    return &unk_1E78296D0;
  objc_msgSend_name(self, v124, v125, v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend_isEqualToString_(v129, v130, (uint64_t)CFSTR("π"), v131, v132, v133);

  if (v134)
    return &unk_1E78296E0;
  else
    return 0;
}

- (id)getStringValue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isEqualToString;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  objc_msgSend_name(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)CFSTR("e"), v15, v16, v17);

  if ((isEqualToString & 1) != 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("%0.6f"), v21, v22, v23, 0x4005BF0A8B145769);
LABEL_5:
    v34 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v34;
    return v7;
  }
  objc_msgSend_name(self, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)CFSTR("π"), v26, v27, v28);

  if (v29)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("%0.6f"), v31, v32, v33, 0x400921FB54442D18);
    goto LABEL_5;
  }
  return v7;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_inputRange(self, v9, v10, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v7, v15, (uint64_t)CFSTR("[%@] : %lu"), v16, v17, v18, v8, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
