@implementation IATextInputActionsSessionDeletionAction

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
  unint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  int64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;

  v4 = a3;
  if (objc_msgSend_isMergeableWith_(self, v5, (uint64_t)v4, v6, v7))
  {
    objc_msgSend_asDeletion(v4, v8, v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v82 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v17 = objc_msgSend_removedTextLength(self, v12, v13, v14, v15);
    v22 = objc_msgSend_removedTextLength(v16, v18, v19, v20, v21);
    objc_msgSend_setRemovedTextLengthWithoutTracking_(self, v23, v22 + v17, v24, v25);
    v30 = objc_msgSend_inputActionCount(v16, v26, v27, v28, v29);
    v35 = objc_msgSend_inputActionCountFromMergedActions(self, v31, v32, v33, v34);
    objc_msgSend_setInputActionCountFromMergedActions_(self, v36, v35 + v30, v37, v38);
    v43 = objc_msgSend_options(self, v39, v40, v41, v42);
    v48 = objc_msgSend_options(v16, v44, v45, v46, v47);
    objc_msgSend_setOptions_(self, v49, v48 | v43, v50, v51);
    v56 = objc_msgSend_removedEmojiCount(v16, v52, v53, v54, v55);
    v61 = objc_msgSend_removedEmojiCount(self, v57, v58, v59, v60);
    objc_msgSend_setRemovedEmojiCount_(self, v62, v61 + v56, v63, v64);
    v69 = objc_msgSend_largestSingleDeletionLength(self, v65, v66, v67, v68);
    if (v69 <= objc_msgSend_removedTextLength(v16, v70, v71, v72, v73))
      v78 = objc_msgSend_removedTextLength(v16, v74, v75, v76, v77);
    else
      v78 = objc_msgSend_largestSingleDeletionLength(self, v74, v75, v76, v77);
    objc_msgSend_setLargestSingleDeletionLength_(self, v79, v78, v80, v81);
    objc_msgSend_inputMode(v4, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_language(v87, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {

    }
    else
    {
      objc_msgSend_inputMode(v4, v93, v94, v95, v96);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_region(v101, v102, v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v106)
      {
LABEL_12:
        v82 = 1;
        goto LABEL_13;
      }
    }
    objc_msgSend_inputMode(v4, v97, v98, v99, v100);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)objc_msgSend_copy(v107, v108, v109, v110, v111);
    objc_msgSend_setInputMode_(self, v113, (uint64_t)v112, v114, v115);

    goto LABEL_12;
  }
  v82 = 0;
LABEL_14:

  return v82;
}

- (BOOL)changedContent
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
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)IATextInputActionsSessionDeletionAction;
  -[IATextInputActionsSessionAction description](&v44, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_msgSend_removedTextLength(self, v10, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v9, v15, (uint64_t)CFSTR("removedTextLength=%lu"), v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v19, (uint64_t)v18, v20, v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  v27 = objc_msgSend_removedEmojiCount(self, v23, v24, v25, v26);
  objc_msgSend_stringWithFormat_(v22, v28, (uint64_t)CFSTR("removedEmojiCount=%lu"), v29, v30, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v32, (uint64_t)v31, v33, v34);

  objc_msgSend_componentsJoinedByString_(v8, v35, (uint64_t)CFSTR(", "), v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v39, (uint64_t)CFSTR(", %@"), v40, v41, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
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

- (IATextInputActionsSessionDeletionAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionDeletionAction *v5;
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
  v15.super_class = (Class)IATextInputActionsSessionDeletionAction;
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
  v11.super_class = (Class)IATextInputActionsSessionDeletionAction;
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
