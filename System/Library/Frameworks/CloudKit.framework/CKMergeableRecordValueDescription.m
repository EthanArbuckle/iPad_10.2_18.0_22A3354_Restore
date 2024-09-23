@implementation CKMergeableRecordValueDescription

- (CKMergeableRecordValueDescription)initWithMergeableRecordValue:(id)a3 shortDescription:(BOOL)a4
{
  id v7;
  CKMergeableRecordValueDescription *v8;
  CKMergeableRecordValueDescription *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKMergeableRecordValueDescription;
  v8 = -[CKMergeableRecordValueDescription init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mergeableRecordValue, a3);
    v9->_shortDescription = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMergeableRecordValueDescription *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMergeableRecordValueDescription *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  id v9;

  v9 = a3;
  v7 = objc_msgSend_shortDescription(self, v4, v5, v6);
  objc_msgSend_CKDescribePropertiesUsing_includeDeltaContents_(self, v8, (uint64_t)v9, v7 ^ 1u);

}

- (void)CKDescribePropertiesUsing:(id)a3 includeDeltaContents:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
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
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t isValueIDKnownToServer;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  id v154;

  v4 = a4;
  v154 = a3;
  objc_msgSend_mergeableRecordValue(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueID(v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v154, v14, (uint64_t)CFSTR("valueID"), v13, 0);

  objc_msgSend_mergeableRecordValue(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend_isValueIDKnownToServer(v18, v19, v20, v21);

  if ((v13 & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_mergeableRecordValue(self, v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    isValueIDKnownToServer = objc_msgSend_isValueIDKnownToServer(v26, v27, v28, v29);
    objc_msgSend_numberWithBool_(v25, v31, isValueIDKnownToServer, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v154, v34, (uint64_t)CFSTR("isValueIDKnownToServer"), (uint64_t)v33, 0);

  }
  objc_msgSend_mergeableRecordValue(self, v22, v23, v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastKnownServerTimestampVector(v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v154, v40, (uint64_t)CFSTR("serverTimestamp"), (uint64_t)v39, 0);

  objc_msgSend_mergeableRecordValue(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deltasToSave(v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_count(v48, v49, v50, v51);

  if (v52)
  {
    if (v4)
    {
      objc_msgSend_mergeableRecordValue(self, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deltasToSave(v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProperty_value_shouldRedact_(v154, v61, (uint64_t)CFSTR("deltasToSave"), (uint64_t)v60, 0);
    }
    else
    {
      v62 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_mergeableRecordValue(self, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deltasToSave(v56, v63, v64, v65);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend_count(v60, v66, v67, v68);
      objc_msgSend_numberWithUnsignedInteger_(v62, v70, v69, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProperty_value_shouldRedact_(v154, v73, (uint64_t)CFSTR("deltasToSaveCount"), (uint64_t)v72, 0);

    }
  }
  objc_msgSend_mergeableRecordValue(self, v53, v54, v55);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unmergedDeltas(v74, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend_count(v78, v79, v80, v81);

  if (v82)
  {
    if (v4)
    {
      objc_msgSend_mergeableRecordValue(self, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unmergedDeltas(v86, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProperty_value_shouldRedact_(v154, v91, (uint64_t)CFSTR("unmergedDeltas"), (uint64_t)v90, 0);
    }
    else
    {
      v92 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_mergeableRecordValue(self, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unmergedDeltas(v86, v93, v94, v95);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend_count(v90, v96, v97, v98);
      objc_msgSend_numberWithUnsignedInteger_(v92, v100, v99, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProperty_value_shouldRedact_(v154, v103, (uint64_t)CFSTR("unmergedDeltasCount"), (uint64_t)v102, 0);

    }
  }
  objc_msgSend_mergeableRecordValue(self, v83, v84, v85);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend_encryptMetadataTernary(v104, v105, v106, v107);

  if (v108 != -1)
  {
    v112 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_mergeableRecordValue(self, v109, v110, v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend_encryptMetadata(v113, v114, v115, v116);
    objc_msgSend_numberWithBool_(v112, v118, v117, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v154, v121, (uint64_t)CFSTR("encryptMetadata"), (uint64_t)v120, 0);

  }
  objc_msgSend_mergeableRecordValue(self, v109, v110, v111);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pendingReplacementRequests(v122, v123, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend_count(v126, v127, v128, v129);

  if (v130)
  {
    objc_msgSend_mergeableRecordValue(self, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pendingReplacementRequests(v134, v135, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v154, v139, (uint64_t)CFSTR("replacementRequests"), (uint64_t)v138, 0);

  }
  v140 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_mergeableRecordValue(self, v131, v132, v133);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverDeltaMetadatas(v141, v142, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_msgSend_count(v145, v146, v147, v148);
  objc_msgSend_numberWithUnsignedInteger_(v140, v150, v149, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v154, v153, (uint64_t)CFSTR("serverDeltasCount"), (uint64_t)v152, 0);

}

- (CKMergeableRecordValue)mergeableRecordValue
{
  return self->_mergeableRecordValue;
}

- (BOOL)shortDescription
{
  return self->_shortDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableRecordValue, 0);
}

@end
