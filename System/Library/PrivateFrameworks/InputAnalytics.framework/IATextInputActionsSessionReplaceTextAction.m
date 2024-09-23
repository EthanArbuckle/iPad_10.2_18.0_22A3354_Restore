@implementation IATextInputActionsSessionReplaceTextAction

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
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int64_t v105;
  unint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;

  v4 = a3;
  if (objc_msgSend_isMergeableWith_(self, v5, (uint64_t)v4, v6, v7))
  {
    objc_msgSend_asReplaceText(v4, v8, v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v105 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v17 = objc_msgSend_insertedTextLength(self, v12, v13, v14, v15);
    v22 = objc_msgSend_insertedTextLength(v16, v18, v19, v20, v21);
    objc_msgSend_setInsertedTextLengthWithoutTracking_(self, v23, v22 + v17, v24, v25);
    v30 = objc_msgSend_removedTextLength(self, v26, v27, v28, v29);
    v35 = objc_msgSend_removedTextLength(v16, v31, v32, v33, v34);
    objc_msgSend_setRemovedTextLengthWithoutTracking_(self, v36, v35 + v30, v37, v38);
    v43 = objc_msgSend_inputActionCount(v16, v39, v40, v41, v42);
    v48 = objc_msgSend_inputActionCountFromMergedActions(self, v44, v45, v46, v47);
    objc_msgSend_setInputActionCountFromMergedActions_(self, v49, v48 + v43, v50, v51);
    v56 = objc_msgSend_options(self, v52, v53, v54, v55);
    v61 = objc_msgSend_options(v16, v57, v58, v59, v60);
    objc_msgSend_setOptions_(self, v62, v61 | v56, v63, v64);
    v69 = objc_msgSend_removedEmojiCount(v16, v65, v66, v67, v68);
    v74 = objc_msgSend_removedEmojiCount(self, v70, v71, v72, v73);
    objc_msgSend_setRemovedEmojiCount_(self, v75, v74 + v69, v76, v77);
    v82 = objc_msgSend_insertedEmojiCount(v16, v78, v79, v80, v81);
    v87 = objc_msgSend_insertedEmojiCount(self, v83, v84, v85, v86);
    objc_msgSend_setInsertedEmojiCount_(self, v88, v87 + v82, v89, v90);
    v95 = objc_msgSend_netCharacterCount(v16, v91, v92, v93, v94);
    v100 = v95;
    if (v95 < 1)
    {
      if (v95 < 0)
      {
        v106 = objc_msgSend_largestSingleDeletionLength(self, v96, v97, v98, v99);
        v110 = -v100;
        if (v106 > -v100)
          v110 = objc_msgSend_largestSingleDeletionLength(self, v107, v110, v108, v109);
        objc_msgSend_setLargestSingleDeletionLength_(self, v107, v110, v108, v109);
      }
    }
    else
    {
      if (objc_msgSend_largestSingleInsertionLength(self, v96, v97, v98, v99) > (unint64_t)v95)
        v100 = objc_msgSend_largestSingleInsertionLength(self, v101, v102, v103, v104);
      objc_msgSend_setLargestSingleInsertionLength_(self, v101, v100, v103, v104);
    }
    objc_msgSend_inputMode(v4, v96, v97, v98, v99);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_language(v111, v112, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {

    }
    else
    {
      objc_msgSend_inputMode(v4, v117, v118, v119, v120);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_region(v125, v126, v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v130)
      {
LABEL_17:
        v105 = 1;
        goto LABEL_18;
      }
    }
    objc_msgSend_inputMode(v4, v121, v122, v123, v124);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = (void *)objc_msgSend_copy(v131, v132, v133, v134, v135);
    objc_msgSend_setInputMode_(self, v137, (uint64_t)v136, v138, v139);

    goto LABEL_17;
  }
  v105 = 0;
LABEL_19:

  return v105;
}

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (IATextInputActionsSessionReplaceTextAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionReplaceTextAction *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IATextInputActionsSessionReplaceTextAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("options"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend_longValue(v9, v10, v11, v12, v13);

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IATextInputActionsSessionReplaceTextAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, self->_options, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("options"), v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
