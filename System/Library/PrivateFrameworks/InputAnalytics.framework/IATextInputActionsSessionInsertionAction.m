@implementation IATextInputActionsSessionInsertionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  int64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;

  v4 = a3;
  if (objc_msgSend_isMergeableWith_(self, v5, (uint64_t)v4, v6, v7))
  {
    objc_msgSend_asInsertion(v4, v8, v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v108 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v17 = objc_msgSend_insertedTextLength(self, v12, v13, v14, v15);
    v22 = objc_msgSend_insertedTextLength(v16, v18, v19, v20, v21);
    objc_msgSend_setInsertedTextLengthWithoutTracking_(self, v23, v22 + v17, v24, v25);
    v30 = objc_msgSend_inputActionCount(v16, v26, v27, v28, v29);
    v35 = objc_msgSend_inputActionCountFromMergedActions(self, v31, v32, v33, v34);
    objc_msgSend_setInputActionCountFromMergedActions_(self, v36, v35 + v30, v37, v38);
    v43 = objc_msgSend_withAlternativesCount(v16, v39, v40, v41, v42);
    v48 = objc_msgSend_withAlternativesCount(self, v44, v45, v46, v47);
    objc_msgSend_setWithAlternativesCount_(self, v49, v48 + v43, v50, v51);
    v56 = objc_msgSend_options(self, v52, v53, v54, v55);
    v61 = objc_msgSend_options(v16, v57, v58, v59, v60);
    objc_msgSend_setOptions_(self, v62, v61 | v56, v63, v64);
    v69 = objc_msgSend_insertedEmojiCount(v16, v65, v66, v67, v68);
    v74 = objc_msgSend_insertedEmojiCount(self, v70, v71, v72, v73);
    objc_msgSend_setInsertedEmojiCount_(self, v75, v74 + v69, v76, v77);
    v82 = objc_msgSend_insertedPunctuationCount(v16, v78, v79, v80, v81);
    v87 = objc_msgSend_insertedPunctuationCount(self, v83, v84, v85, v86);
    objc_msgSend_setInsertedPunctuationCount_(self, v88, v87 + v82, v89, v90);
    v95 = objc_msgSend_largestSingleInsertionLength(self, v91, v92, v93, v94);
    if (v95 <= objc_msgSend_insertedTextLength(v16, v96, v97, v98, v99))
      v104 = objc_msgSend_insertedTextLength(v16, v100, v101, v102, v103);
    else
      v104 = objc_msgSend_largestSingleInsertionLength(self, v100, v101, v102, v103);
    objc_msgSend_setLargestSingleInsertionLength_(self, v105, v104, v106, v107);
    objc_msgSend_inputMode(v4, v109, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_language(v113, v114, v115, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118)
    {

    }
    else
    {
      objc_msgSend_inputMode(v4, v119, v120, v121, v122);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_region(v127, v128, v129, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v132)
      {
LABEL_12:
        v108 = 1;
        goto LABEL_13;
      }
    }
    objc_msgSend_inputMode(v4, v123, v124, v125, v126);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (void *)objc_msgSend_copy(v133, v134, v135, v136, v137);
    objc_msgSend_setInputMode_(self, v139, (uint64_t)v138, v140, v141);

    goto LABEL_12;
  }
  v108 = 0;
LABEL_14:

  return v108;
}

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)IATextInputActionsSessionInsertionAction;
  -[IATextInputActionsSessionAction description](&v31, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_msgSend_withAlternativesCount(self, v10, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v9, v15, (uint64_t)CFSTR("withAlternativesCount=%lu"), v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_componentsJoinedByString_(v8, v22, (uint64_t)CFSTR(", "), v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v26, (uint64_t)CFSTR(", %@"), v27, v28, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (int64_t)inputActionCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = objc_msgSend_source(self, a2, v2, v3, v4);
  v11 = objc_msgSend_textInputActionsType(self, v7, v8, v9, v10);
  v14 = objc_msgSend_shouldSeparatelyTrackKeystrokesForSource_type_(IATextInputActionsSessionAction, v12, v6, v11, v13) ^ 1;
  return objc_msgSend_inputActionCountFromMergedActions(self, v15, v16, v17, v18) + v14;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)withAlternativesCount
{
  return self->_withAlternativesCount;
}

- (void)setWithAlternativesCount:(unint64_t)a3
{
  self->_withAlternativesCount = a3;
}

- (IATextInputActionsSessionInsertionAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionInsertionAction *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IATextInputActionsSessionInsertionAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("options"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend_longValue(v9, v10, v11, v12, v13);

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("withAlternativesCount"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_withAlternativesCount = objc_msgSend_unsignedLongValue(v17, v18, v19, v20, v21);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IATextInputActionsSessionInsertionAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, self->_options, v6, v7, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("options"), v10);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, self->_withAlternativesCount, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("withAlternativesCount"), v16);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
