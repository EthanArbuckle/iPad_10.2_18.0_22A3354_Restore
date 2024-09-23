@implementation CHStrokeClassificationResult

- (CHStrokeClassificationResult)init
{
  CHStrokeClassificationResult *v2;
  NSDictionary *v3;
  NSDictionary *strokeClassificationsByStrokeIdentifier;
  NSDictionary *v5;
  NSDictionary *substrokesByStrokeIdentifier;
  NSSet *v7;
  NSSet *nontextCandidates;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHStrokeClassificationResult;
  v2 = -[CHStrokeClassificationResult init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    strokeClassificationsByStrokeIdentifier = v2->_strokeClassificationsByStrokeIdentifier;
    v2->_strokeClassificationsByStrokeIdentifier = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    substrokesByStrokeIdentifier = v2->_substrokesByStrokeIdentifier;
    v2->_substrokesByStrokeIdentifier = v5;

    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    nontextCandidates = v2->_nontextCandidates;
    v2->_nontextCandidates = v7;

  }
  return v2;
}

- (CHStrokeClassificationResult)initWithStrokeClassificationsByStrokeIdentifier:(id)a3 scriptClassificationsByStrokeIdentifier:(id)a4 scriptClassificationRawResultsByStrokeIdentifier:(id)a5 substrokesByStrokeIdentifier:(id)a6 nontextCandidates:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CHStrokeClassificationResult *v22;
  uint64_t v23;
  NSDictionary *strokeClassificationsByStrokeIdentifier;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *scriptClassificationsByStrokeIdentifier;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSDictionary *scriptClassificationRawResultsByStrokeIdentifier;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSDictionary *substrokesByStrokeIdentifier;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSSet *nontextCandidates;
  objc_super v54;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v54.receiver = self;
  v54.super_class = (Class)CHStrokeClassificationResult;
  v22 = -[CHStrokeClassificationResult init](&v54, sel_init);
  if (v22)
  {
    v23 = objc_msgSend_copy(v12, v17, v18, v19, v20, v21);
    strokeClassificationsByStrokeIdentifier = v22->_strokeClassificationsByStrokeIdentifier;
    v22->_strokeClassificationsByStrokeIdentifier = (NSDictionary *)v23;

    v30 = objc_msgSend_copy(v13, v25, v26, v27, v28, v29);
    scriptClassificationsByStrokeIdentifier = v22->_scriptClassificationsByStrokeIdentifier;
    v22->_scriptClassificationsByStrokeIdentifier = (NSDictionary *)v30;

    v37 = objc_msgSend_copy(v14, v32, v33, v34, v35, v36);
    scriptClassificationRawResultsByStrokeIdentifier = v22->_scriptClassificationRawResultsByStrokeIdentifier;
    v22->_scriptClassificationRawResultsByStrokeIdentifier = (NSDictionary *)v37;

    v44 = objc_msgSend_copy(v15, v39, v40, v41, v42, v43);
    substrokesByStrokeIdentifier = v22->_substrokesByStrokeIdentifier;
    v22->_substrokesByStrokeIdentifier = (NSDictionary *)v44;

    v51 = objc_msgSend_copy(v16, v46, v47, v48, v49, v50);
    nontextCandidates = v22->_nontextCandidates;
    v22->_nontextCandidates = (NSSet *)v51;

  }
  return v22;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CHStrokeClassificationResult;
  -[CHStrokeClassificationResult description](&v34, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  objc_msgSend_textStrokeIdentifiers(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  objc_msgSend_stringByAppendingFormat_(v3, v28, (uint64_t)CFSTR(" Strokes: %ld, text strokes: %ld"), v29, v30, v31, v15, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (NSSet)textStrokeIdentifiers
{
  CHStrokeClassificationResult *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *textStrokeIdentifiers;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textStrokeIdentifiers)
  {
    objc_msgSend_strokeClassificationsByStrokeIdentifier(v2, v3, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keysOfEntriesPassingTest_(v8, v9, (uint64_t)&unk_1E77F3370, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    textStrokeIdentifiers = v2->_textStrokeIdentifiers;
    v2->_textStrokeIdentifiers = (NSSet *)v13;

  }
  objc_sync_exit(v2);

  return v2->_textStrokeIdentifiers;
}

- (BOOL)isEquivalentToStrokeClassificationResult:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
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
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
  objc_msgSend_strokeClassificationsByStrokeIdentifier(v4, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);

  if (v16 == v28)
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v29, v30, v31, v32, v33, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v34, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v82, (uint64_t)v86, 16, v42);
    if (v48)
    {
      v49 = *(_QWORD *)v83;
      while (2)
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v83 != v49)
            objc_enumerationMutation(v40);
          v51 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
          objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v43, v44, v45, v46, v47);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v52, v53, v51, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_strokeClassificationsByStrokeIdentifier(v4, v58, v59, v60, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v63, v64, v51, v65, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v74 = objc_msgSend_integerValue(v57, v69, v70, v71, v72, v73);
          LOBYTE(v74) = v74 == objc_msgSend_integerValue(v68, v75, v76, v77, v78, v79);

          if ((v74 & 1) == 0)
          {
            v80 = 0;
            goto LABEL_13;
          }
        }
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v82, (uint64_t)v86, 16, v47);
        if (v48)
          continue;
        break;
      }
    }
    v80 = 1;
LABEL_13:

  }
  else
  {
    v80 = 0;
  }

  return v80;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;

  v49 = a3;
  objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v49, v10, (uint64_t)v9, (uint64_t)CFSTR("strokeClassificationsByStrokeIdentifier"), v11, v12);

  objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v49, v19, (uint64_t)v18, (uint64_t)CFSTR("scriptClassificationsByStrokeIdentifier"), v20, v21);

  objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v49, v28, (uint64_t)v27, (uint64_t)CFSTR("scriptClassificationRawResultsByStrokeIdentifier"), v29, v30);

  objc_msgSend_substrokesByStrokeIdentifier(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v49, v37, (uint64_t)v36, (uint64_t)CFSTR("substrokesByStrokeIdentifier"), v38, v39);

  objc_msgSend_nontextCandidates(self, v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v49, v46, (uint64_t)v45, (uint64_t)CFSTR("nontextCandidates"), v47, v48);

}

- (CHStrokeClassificationResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  CHStrokeClassificationResult *v75;
  _QWORD v78[2];
  _QWORD v79[3];
  _QWORD v80[4];
  _QWORD v81[3];
  _QWORD v82[4];

  v82[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  v82[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v82, 3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("strokeClassificationsByStrokeIdentifier"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  v81[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v81, 3, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v18, v23, (uint64_t)v22, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v28, (uint64_t)v27, (uint64_t)CFSTR("scriptClassificationsByStrokeIdentifier"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0C99E60];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  v80[3] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v33, (uint64_t)v80, 4, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v32, v37, (uint64_t)v36, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v42, (uint64_t)v41, (uint64_t)CFSTR("substrokesByStrokeIdentifier"), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0C99E60];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  v79[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v47, (uint64_t)v79, 3, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v46, v51, (uint64_t)v50, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v56, (uint64_t)v55, (uint64_t)CFSTR("scriptClassificationRawResultsByStrokeIdentifier"), v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0C99E60];
  v78[0] = objc_opt_class();
  v78[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v61, (uint64_t)v78, 2, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v60, v65, (uint64_t)v64, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v70, (uint64_t)v69, (uint64_t)CFSTR("nontextCandidates"), v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = (CHStrokeClassificationResult *)objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(self, v74, (uint64_t)v17, (uint64_t)v31, (uint64_t)v59, (uint64_t)v45, v73);
  return v75;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHStrokeClassificationResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHStrokeClassificationResult *v11;
  NSDictionary *strokeClassificationsByStrokeIdentifier;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isEqual;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSDictionary *scriptClassificationsByStrokeIdentifier;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSDictionary *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSDictionary *scriptClassificationRawResultsByStrokeIdentifier;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSDictionary *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSDictionary *substrokesByStrokeIdentifier;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSDictionary *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSSet *nontextCandidates;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSSet *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHStrokeClassificationResult *)v4;
    v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
        objc_msgSend_strokeClassificationsByStrokeIdentifier(v5, v6, v7, v8, v9, v10);
        v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (strokeClassificationsByStrokeIdentifier == v18)
        {

        }
        else
        {
          objc_msgSend_strokeClassificationsByStrokeIdentifier(v11, v13, v14, v15, v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_strokeClassificationsByStrokeIdentifier, v21, v22, v23);

          if (!isEqual)
            goto LABEL_20;
        }
        scriptClassificationsByStrokeIdentifier = self->_scriptClassificationsByStrokeIdentifier;
        objc_msgSend_scriptClassificationsByStrokeIdentifier(v11, v25, v26, v27, v28, v29);
        v36 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (scriptClassificationsByStrokeIdentifier == v36)
        {

        }
        else
        {
          objc_msgSend_scriptClassificationsByStrokeIdentifier(v11, v31, v32, v33, v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_scriptClassificationsByStrokeIdentifier, v39, v40, v41);

          if (!v42)
            goto LABEL_20;
        }
        scriptClassificationRawResultsByStrokeIdentifier = self->_scriptClassificationRawResultsByStrokeIdentifier;
        objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v11, v43, v44, v45, v46, v47);
        v54 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (scriptClassificationRawResultsByStrokeIdentifier == v54)
        {

          goto LABEL_18;
        }
        objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v11, v49, v50, v51, v52, v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend_isEqual_(v55, v56, (uint64_t)self->_scriptClassificationRawResultsByStrokeIdentifier, v57, v58, v59);

        if (v60)
        {
LABEL_18:
          substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
          objc_msgSend_substrokesByStrokeIdentifier(v11, v61, v62, v63, v64, v65);
          v72 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          if (substrokesByStrokeIdentifier == v72)
          {

          }
          else
          {
            objc_msgSend_substrokesByStrokeIdentifier(v11, v67, v68, v69, v70, v71);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend_isEqual_(v73, v74, (uint64_t)self->_substrokesByStrokeIdentifier, v75, v76, v77);

            if (!v78)
              goto LABEL_20;
          }
          nontextCandidates = self->_nontextCandidates;
          objc_msgSend_nontextCandidates(v11, v79, v80, v81, v82, v83);
          v90 = (NSSet *)objc_claimAutoreleasedReturnValue();
          if (nontextCandidates == v90)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            objc_msgSend_nontextCandidates(v11, v85, v86, v87, v88, v89);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(self) = objc_msgSend_isEqual_(v91, v92, (uint64_t)self->_nontextCandidates, v93, v94, v95);

          }
          goto LABEL_26;
        }
LABEL_20:
        LOBYTE(self) = 0;
        goto LABEL_26;
      }
      LOBYTE(self) = 1;
    }
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(self) = 0;
LABEL_27:

  return (char)self;
}

- (BOOL)isHighConfidenceForStrokesIdentifiers:(id)a3 script:(id)a4 confidenceThreshold:(double)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  double v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  BOOL v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v76;
  id obj;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v78 = a4;
  v76 = v8;
  if (objc_msgSend_count(v8, v9, v10, v11, v12, v13))
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v8;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v79, (uint64_t)v83, 16, v15);
    if (v21)
    {
      v22 = *(_QWORD *)v80;
      v23 = 0.0;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          while (1)
          {
            if (*(_QWORD *)v80 != v22)
              objc_enumerationMutation(obj);
            v26 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
            objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v16, v17, v18, v19, v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v27, v28, v26, v29, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend_integerValue(v32, v33, v34, v35, v36, v37);

            objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v39, v40, v41, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v44, v45, v26, v46, v47, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend_integerValue(v49, v50, v51, v52, v53, v54);

            if ((objc_msgSend_isMatchingStrokeClassification_scriptClassification_(CHStrokeUtilities, v56, v38, v55, v57, v58) & 1) == 0)break;
            objc_msgSend_scriptClassificationScoreForStrokeIdentifier_script_(self, v59, v26, (uint64_t)v78, v62, v63);
            v23 = v23 + v25;
            if (v21 == ++i)
              goto LABEL_13;
          }
          v64 = objc_msgSend_integerValue(v78, v59, v60, v61, v62, v63);
          if (objc_msgSend_isMatchingStrokeClassification_scriptClassification_(CHStrokeUtilities, v65, v38, v64, v66, v67))v68 = a5;
          else
            v68 = 0.0;
          v23 = v23 + v68;
        }
LABEL_13:
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v79, (uint64_t)v83, 16, v20);
      }
      while (v21);
    }
    else
    {
      v23 = 0.0;
    }

    v69 = v23 / (double)(unint64_t)objc_msgSend_count(obj, v70, v71, v72, v73, v74) >= a5;
  }
  else
  {
    v69 = 0;
  }

  return v69;
}

- (double)scriptClassificationScoreForStrokeIdentifier:(id)a3 script:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  float v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
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
  float v75;
  float v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  double v94;

  v6 = a3;
  v7 = a4;
  objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v6, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_integerValue(v18, v19, v20, v21, v22, v23);

  objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)v6, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_scriptClassificationAtIndex_(v35, v36, 0, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_integerValue(v40, v41, v42, v43, v44, v45);

  objc_msgSend_scriptProbabilityAtIndex_(v35, v47, 0, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v51, v52, v53, v54, v55, v56);
  v58 = v57;

  objc_msgSend_probabilityByScriptClassifications(v35, v59, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v7, v66, v67, v68);
  v69 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue((void *)v69, v70, v71, v72, v73, v74);
  v76 = v75;

  objc_msgSend_orderedScriptClassification(v35, v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v69) = objc_msgSend_containsObject_(v82, v83, (uint64_t)v7, v84, v85, v86);

  v92 = 0.0;
  if ((v69 & 1) != 0)
  {
    v93 = objc_msgSend_integerValue(v7, v87, v88, v89, v90, v91);
    v92 = v76;
    if (v46 != v24)
    {
      v94 = v58;
      if (v93 == v46)
      {
        if (v46 == 11)
          v92 = v58;
        else
          v92 = 0.0;
      }
      else
      {
        if (v93 != v24)
          v94 = -0.0;
        v92 = v94 + v92;
      }
    }
  }

  return v92;
}

- (NSDictionary)strokeClassificationsByStrokeIdentifier
{
  return self->_strokeClassificationsByStrokeIdentifier;
}

- (NSDictionary)scriptClassificationsByStrokeIdentifier
{
  return self->_scriptClassificationsByStrokeIdentifier;
}

- (NSDictionary)scriptClassificationRawResultsByStrokeIdentifier
{
  return self->_scriptClassificationRawResultsByStrokeIdentifier;
}

- (NSDictionary)substrokesByStrokeIdentifier
{
  return self->_substrokesByStrokeIdentifier;
}

- (NSSet)nontextCandidates
{
  return self->_nontextCandidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nontextCandidates, 0);
  objc_storeStrong((id *)&self->_substrokesByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationRawResultsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeClassificationsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_textStrokeIdentifiers, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CHMutableStrokeClassificationResult *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;

  v4 = [CHMutableStrokeClassificationResult alloc];
  objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substrokesByStrokeIdentifier(self, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nontextCandidates(self, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(v4, v35, (uint64_t)v10, (uint64_t)v16, (uint64_t)v22, (uint64_t)v28, v34);

  return v36;
}

@end
