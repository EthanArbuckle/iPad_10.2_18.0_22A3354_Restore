@implementation IASTextInputActionsAnalyzerEntry

+ (id)generateAnalyzerEntryFromAction:(id)a3
{
  id v3;
  IASTextInputActionsAnalyzerEntry *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  IASTextInputActionsAnalyzerEntry *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  IASTextInputActionsAnalyzerEntry *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  IASTextInputActionsAnalyzerEntry *v138;

  v3 = a3;
  v4 = objc_alloc_init(IASTextInputActionsAnalyzerEntry);
  objc_msgSend_setNetCharacters_(v4, v5, 0, v6, v7);
  objc_msgSend_setUserRemovedCharacters_(v4, v8, 0, v9, v10);
  objc_msgSend_setNetEmojiCharacters_(v4, v11, 0, v12, v13);
  objc_msgSend_setUserRemovedEmojiCharacters_(v4, v14, 0, v15, v16);
  v21 = objc_msgSend_inputActionCount(v3, v17, v18, v19, v20);
  objc_msgSend_setInputActions_(v4, v22, v21, v23, v24);
  objc_msgSend_asInsertion(v3, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v29;
  if (v29)
  {
    v35 = objc_msgSend_insertedTextLength(v29, v30, v31, v32, v33);
    v40 = objc_msgSend_insertedEmojiCount(v34, v36, v37, v38, v39);
    objc_msgSend_setNetCharacters_(v4, v41, v35 - v40, v42, v43);
    objc_msgSend_setUserRemovedCharacters_(v4, v44, 0, v45, v46);
    v51 = objc_msgSend_insertedEmojiCount(v34, v47, v48, v49, v50);
    objc_msgSend_setNetEmojiCharacters_(v4, v52, v51, v53, v54);
    objc_msgSend_setUserRemovedEmojiCharacters_(v4, v55, 0, v56, v57);
    v58 = v4;
  }
  else
  {
    objc_msgSend_asDeletion(v3, v30, v31, v32, v33);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v59;
    if (v59)
    {
      v65 = objc_msgSend_removedTextLength(v59, v60, v61, v62, v63);
      v70 = v65 - objc_msgSend_removedEmojiCount(v64, v66, v67, v68, v69);
      objc_msgSend_setNetCharacters_(v4, v71, -v70, v72, v73);
      objc_msgSend_setUserRemovedCharacters_(v4, v74, v70, v75, v76);
      v81 = objc_msgSend_removedEmojiCount(v64, v77, v78, v79, v80);
      objc_msgSend_setNetEmojiCharacters_(v4, v82, -v81, v83, v84);
      v89 = objc_msgSend_removedEmojiCount(v64, v85, v86, v87, v88);
      objc_msgSend_setUserRemovedEmojiCharacters_(v4, v90, v89, v91, v92);
      v93 = v4;
    }
    else
    {
      objc_msgSend_asReplaceText(v3, v60, v61, v62, v63);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v94;
      if (v94)
      {
        v100 = objc_msgSend_insertedTextLength(v94, v95, v96, v97, v98);
        v105 = objc_msgSend_insertedEmojiCount(v99, v101, v102, v103, v104);
        v110 = objc_msgSend_removedTextLength(v99, v106, v107, v108, v109);
        v115 = objc_msgSend_removedEmojiCount(v99, v111, v112, v113, v114);
        objc_msgSend_setNetCharacters_(v4, v116, v100 - (v105 + v110) + v115, v117, v118);
        objc_msgSend_setUserRemovedCharacters_(v4, v119, 0, v120, v121);
        v126 = objc_msgSend_insertedEmojiCount(v99, v122, v123, v124, v125);
        v131 = objc_msgSend_removedEmojiCount(v99, v127, v128, v129, v130);
        objc_msgSend_setNetEmojiCharacters_(v4, v132, v126 - v131, v133, v134);
        objc_msgSend_setUserRemovedEmojiCharacters_(v4, v135, 0, v136, v137);
      }
      v138 = v4;

    }
  }

  return v4;
}

- (void)increaseWithEntry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  self->_netCharacters += objc_msgSend_netCharacters(v4, v5, v6, v7, v8);
  self->_userRemovedCharacters += objc_msgSend_userRemovedCharacters(v4, v9, v10, v11, v12);
  self->_netEmojiCharacters += objc_msgSend_netEmojiCharacters(v4, v13, v14, v15, v16);
  self->_userRemovedEmojiCharacters += objc_msgSend_userRemovedEmojiCharacters(v4, v17, v18, v19, v20);
  v25 = objc_msgSend_inputActions(v4, v21, v22, v23, v24);

  self->_inputActions += v25;
}

- (BOOL)isAllZeroes
{
  return !self->_netCharacters
      && !self->_userRemovedCharacters
      && !self->_netEmojiCharacters
      && !self->_userRemovedEmojiCharacters
      && self->_inputActions == 0;
}

- (int64_t)netCharacters
{
  return self->_netCharacters;
}

- (void)setNetCharacters:(int64_t)a3
{
  self->_netCharacters = a3;
}

- (int64_t)userRemovedCharacters
{
  return self->_userRemovedCharacters;
}

- (void)setUserRemovedCharacters:(int64_t)a3
{
  self->_userRemovedCharacters = a3;
}

- (int64_t)netEmojiCharacters
{
  return self->_netEmojiCharacters;
}

- (void)setNetEmojiCharacters:(int64_t)a3
{
  self->_netEmojiCharacters = a3;
}

- (int64_t)userRemovedEmojiCharacters
{
  return self->_userRemovedEmojiCharacters;
}

- (void)setUserRemovedEmojiCharacters:(int64_t)a3
{
  self->_userRemovedEmojiCharacters = a3;
}

- (int64_t)inputActions
{
  return self->_inputActions;
}

- (void)setInputActions:(int64_t)a3
{
  self->_inputActions = a3;
}

@end
