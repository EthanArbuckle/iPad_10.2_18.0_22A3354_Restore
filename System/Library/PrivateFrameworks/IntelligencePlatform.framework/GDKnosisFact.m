@implementation GDKnosisFact

- (GDKnosisFact)initWithFactId:(id)a3 score:(id)a4 subjectId:(id)a5 subjectAlias:(id)a6 subjectPopularity:(id)a7 subjectIsa:(id)a8 predicateId:(id)a9 predicateAlias:(id)a10 predicatePopularity:(id)a11 objectID:(id)a12 objectAlias:(id)a13 objectPopularity:(id)a14 qualifiers:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  const char *v32;
  uint64_t v33;
  GDKnosisFact *v34;
  uint64_t v35;
  NSString *factId;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSNumber *score;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSString *subjectId;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *subjectAlias;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSNumber *subjectPopularity;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSArray *subjectIsa;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSString *predicateId;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSArray *predicateAlias;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSNumber *predicatePopularity;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSString *objectID;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  NSArray *objectAlias;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  NSNumber *objectPopularity;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  NSArray *qualifiers;
  id v87;
  id v88;
  id v89;
  id v90;
  objc_super v91;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v90 = a7;
  v89 = a8;
  v24 = v21;
  v88 = a9;
  v25 = v22;
  v87 = a10;
  v26 = a11;
  v27 = v23;
  v28 = a12;
  v29 = a13;
  v30 = a14;
  v31 = a15;
  v91.receiver = self;
  v91.super_class = (Class)GDKnosisFact;
  v34 = -[GDKnosisFact init](&v91, sel_init);
  if (v34)
  {
    v35 = objc_msgSend_copy(v20, v32, v33);
    factId = v34->_factId;
    v34->_factId = (NSString *)v35;

    v39 = objc_msgSend_copy(v24, v37, v38);
    score = v34->_score;
    v34->_score = (NSNumber *)v39;

    v43 = objc_msgSend_copy(v25, v41, v42);
    subjectId = v34->_subjectId;
    v34->_subjectId = (NSString *)v43;

    v47 = objc_msgSend_copy(v27, v45, v46);
    subjectAlias = v34->_subjectAlias;
    v34->_subjectAlias = (NSArray *)v47;

    v51 = objc_msgSend_copy(v90, v49, v50);
    subjectPopularity = v34->_subjectPopularity;
    v34->_subjectPopularity = (NSNumber *)v51;

    v55 = objc_msgSend_copy(v89, v53, v54);
    subjectIsa = v34->_subjectIsa;
    v34->_subjectIsa = (NSArray *)v55;

    v59 = objc_msgSend_copy(v88, v57, v58);
    predicateId = v34->_predicateId;
    v34->_predicateId = (NSString *)v59;

    v63 = objc_msgSend_copy(v87, v61, v62);
    predicateAlias = v34->_predicateAlias;
    v34->_predicateAlias = (NSArray *)v63;

    v67 = objc_msgSend_copy(v26, v65, v66);
    predicatePopularity = v34->_predicatePopularity;
    v34->_predicatePopularity = (NSNumber *)v67;

    v71 = objc_msgSend_copy(v28, v69, v70);
    objectID = v34->_objectID;
    v34->_objectID = (NSString *)v71;

    v75 = objc_msgSend_copy(v29, v73, v74);
    objectAlias = v34->_objectAlias;
    v34->_objectAlias = (NSArray *)v75;

    v79 = objc_msgSend_copy(v30, v77, v78);
    objectPopularity = v34->_objectPopularity;
    v34->_objectPopularity = (NSNumber *)v79;

    v83 = objc_msgSend_copy(v31, v81, v82);
    qualifiers = v34->_qualifiers;
    v34->_qualifiers = (NSArray *)v83;

  }
  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *factId;
  id v5;
  void *v6;
  const char *v7;
  NSNumber *score;
  void *v9;
  const char *v10;
  NSString *subjectId;
  void *v12;
  const char *v13;
  NSArray *subjectAlias;
  void *v15;
  const char *v16;
  NSNumber *subjectPopularity;
  void *v18;
  const char *v19;
  NSArray *subjectIsa;
  void *v21;
  const char *v22;
  NSString *predicateId;
  void *v24;
  const char *v25;
  NSArray *predicateAlias;
  void *v27;
  const char *v28;
  NSNumber *predicatePopularity;
  void *v30;
  const char *v31;
  NSString *objectID;
  void *v33;
  const char *v34;
  NSArray *objectAlias;
  void *v36;
  const char *v37;
  NSNumber *objectPopularity;
  void *v39;
  const char *v40;
  NSArray *qualifiers;
  const char *v42;
  id v43;

  factId = self->_factId;
  v5 = a3;
  NSStringFromSelector(sel_factId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)factId, v6);

  score = self->_score;
  NSStringFromSelector(sel_score);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)score, v9);

  subjectId = self->_subjectId;
  NSStringFromSelector(sel_subjectId);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)subjectId, v12);

  subjectAlias = self->_subjectAlias;
  NSStringFromSelector(sel_subjectAlias);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)subjectAlias, v15);

  subjectPopularity = self->_subjectPopularity;
  NSStringFromSelector(sel_subjectPopularity);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)subjectPopularity, v18);

  subjectIsa = self->_subjectIsa;
  NSStringFromSelector(sel_subjectIsa);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)subjectIsa, v21);

  predicateId = self->_predicateId;
  NSStringFromSelector(sel_predicateId);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)predicateId, v24);

  predicateAlias = self->_predicateAlias;
  NSStringFromSelector(sel_predicateAlias);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)predicateAlias, v27);

  predicatePopularity = self->_predicatePopularity;
  NSStringFromSelector(sel_predicatePopularity);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)predicatePopularity, v30);

  objectID = self->_objectID;
  NSStringFromSelector(sel_objectID);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)objectID, v33);

  objectAlias = self->_objectAlias;
  NSStringFromSelector(sel_objectAlias);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v37, (uint64_t)objectAlias, v36);

  objectPopularity = self->_objectPopularity;
  NSStringFromSelector(sel_objectPopularity);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v40, (uint64_t)objectPopularity, v39);

  qualifiers = self->_qualifiers;
  NSStringFromSelector(sel_qualifiers);
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v42, (uint64_t)qualifiers, v43);

}

- (GDKnosisFact)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  GDKnosisFact *v104;
  void *v105;
  const char *v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  void *v111;
  const char *v112;
  const char *v113;
  void *v114;
  void *v115;
  const char *v116;
  const char *v117;
  void *v118;
  void *v119;
  const char *v120;
  const char *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  const char *v130;
  void *v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  GDKnosisFact *v144;
  uint64_t v145;
  const __CFString *v146;
  uint64_t v147;
  const __CFString *v148;
  uint64_t v149;
  const __CFString *v150;
  uint64_t v151;
  _QWORD v152[3];

  v152[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_factId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_score);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_error(v4, v15, v16);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      if (v107)
      {
        v14 = 0;
        v104 = 0;
LABEL_59:

        goto LABEL_60;
      }
      v115 = (void *)MEMORY[0x1E0CB35C8];
      v149 = *MEMORY[0x1E0CB2D50];
      v150 = CFSTR("GDKnosisFact score is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v108, (uint64_t)&v150, &v149, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v115, v116, (uint64_t)CFSTR("GDErrorDomain"), 9, v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v117, (uint64_t)v30);
      goto LABEL_26;
    }
    v17 = objc_opt_class();
    NSStringFromSelector(sel_subjectId);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v23 = (void *)MEMORY[0x1E0C99E60];
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      objc_msgSend_setWithObjects_(v23, v26, v24, v25, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_subjectAlias);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        objc_msgSend_error(v4, v31, v32);
        v114 = (void *)objc_claimAutoreleasedReturnValue();

        if (v114)
        {
          v30 = 0;
LABEL_26:
          v104 = 0;
LABEL_57:

          goto LABEL_58;
        }
      }
      v33 = objc_opt_class();
      NSStringFromSelector(sel_subjectPopularity);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36
        || (objc_msgSend_error(v4, v37, v38),
            v118 = (void *)objc_claimAutoreleasedReturnValue(),
            v118,
            !v118))
      {
        v144 = self;
        v39 = (void *)MEMORY[0x1E0C99E60];
        v40 = objc_opt_class();
        v41 = objc_opt_class();
        objc_msgSend_setWithObjects_(v39, v42, v40, v41, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_subjectIsa);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v43, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46
          || (objc_msgSend_error(v4, v47, v48),
              v122 = (void *)objc_claimAutoreleasedReturnValue(),
              v122,
              !v122))
        {
          v142 = v46;
          v49 = objc_opt_class();
          NSStringFromSelector(sel_predicateId);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v49, v50);
          v52 = objc_claimAutoreleasedReturnValue();

          v143 = (void *)v52;
          if (v52
            || (objc_msgSend_error(v4, v53, v54),
                v123 = (void *)objc_claimAutoreleasedReturnValue(),
                v123,
                !v123))
          {
            v55 = (void *)MEMORY[0x1E0C99E60];
            v56 = objc_opt_class();
            v57 = objc_opt_class();
            objc_msgSend_setWithObjects_(v55, v58, v56, v57, 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(sel_predicateAlias);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_decodeObjectOfClasses_forKey_(v4, v61, (uint64_t)v59, v60);
            v62 = objc_claimAutoreleasedReturnValue();

            v141 = (void *)v62;
            if (v62
              || (objc_msgSend_error(v4, v63, v64),
                  v124 = (void *)objc_claimAutoreleasedReturnValue(),
                  v124,
                  !v124))
            {
              v65 = objc_opt_class();
              NSStringFromSelector(sel_predicatePopularity);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v65, v66);
              v68 = objc_claimAutoreleasedReturnValue();

              v140 = (void *)v68;
              if (v68
                || (objc_msgSend_error(v4, v69, v70),
                    v125 = (void *)objc_claimAutoreleasedReturnValue(),
                    v125,
                    !v125))
              {
                v71 = objc_opt_class();
                NSStringFromSelector(sel_objectID);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v71, v72);
                v74 = objc_claimAutoreleasedReturnValue();

                v139 = (void *)v74;
                if (v74
                  || (objc_msgSend_error(v4, v75, v76),
                      v126 = (void *)objc_claimAutoreleasedReturnValue(),
                      v126,
                      !v126))
                {
                  v77 = (void *)MEMORY[0x1E0C99E60];
                  v78 = objc_opt_class();
                  v79 = objc_opt_class();
                  objc_msgSend_setWithObjects_(v77, v80, v78, v79, 0);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(sel_objectAlias);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v83, (uint64_t)v81, v82);
                  v84 = objc_claimAutoreleasedReturnValue();

                  v87 = v143;
                  v138 = (void *)v84;
                  if (v84
                    || (objc_msgSend_error(v4, v85, v86),
                        v127 = (void *)objc_claimAutoreleasedReturnValue(),
                        v127,
                        !v127))
                  {
                    v88 = objc_opt_class();
                    NSStringFromSelector(sel_objectPopularity);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v88, v89);
                    v91 = objc_claimAutoreleasedReturnValue();

                    v46 = v142;
                    v137 = (void *)v91;
                    if (v91
                      || (objc_msgSend_error(v4, v92, v93),
                          v128 = (void *)objc_claimAutoreleasedReturnValue(),
                          v128,
                          !v128))
                    {
                      v94 = (void *)MEMORY[0x1E0C99E60];
                      v95 = objc_opt_class();
                      v96 = objc_opt_class();
                      objc_msgSend_setWithObjects_(v94, v97, v95, v96, 0);
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(sel_qualifiers);
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v100, (uint64_t)v98, v99);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v101)
                      {
                        self = (GDKnosisFact *)(id)objc_msgSend_initWithFactId_score_subjectId_subjectAlias_subjectPopularity_subjectIsa_predicateId_predicateAlias_predicatePopularity_objectID_objectAlias_objectPopularity_qualifiers_(v144, v102, (uint64_t)v8, v14, v20, v30, v36, v142, v143, v141, v140, v139, v138, v137, v101);
                        v104 = self;
                      }
                      else
                      {
                        objc_msgSend_error(v4, v102, v103);
                        v129 = (void *)objc_claimAutoreleasedReturnValue();

                        self = v144;
                        if (!v129)
                        {
                          v131 = (void *)MEMORY[0x1E0CB35C8];
                          v145 = *MEMORY[0x1E0CB2D50];
                          v146 = CFSTR("GDKnosisFact qualifiers is nil");
                          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v130, (uint64_t)&v146, &v145, 1);
                          v132 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_errorWithDomain_code_userInfo_(v131, v133, (uint64_t)CFSTR("GDErrorDomain"), 9, v132);
                          v134 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_failWithError_(v4, v135, (uint64_t)v134);

                          self = v144;
                        }
                        v104 = 0;
                      }

                      v87 = v143;
                    }
                    else
                    {
                      v104 = 0;
                      self = v144;
                    }

                  }
                  else
                  {
                    v104 = 0;
                    self = v144;
                    v46 = v142;
                  }

                }
                else
                {
                  v104 = 0;
                  v87 = v143;
                  self = v144;
                  v46 = v142;
                }

              }
              else
              {
                v104 = 0;
                v87 = v143;
                self = v144;
                v46 = v142;
              }

            }
            else
            {
              v104 = 0;
              v87 = v143;
              self = v144;
              v46 = v142;
            }

          }
          else
          {
            v104 = 0;
            v87 = 0;
            self = v144;
          }

        }
        else
        {
          v104 = 0;
          self = v144;
        }

        goto LABEL_56;
      }
      v36 = 0;
LABEL_30:
      v104 = 0;
LABEL_56:

      goto LABEL_57;
    }
    objc_msgSend_error(v4, v21, v22);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v109)
    {
      v119 = (void *)MEMORY[0x1E0CB35C8];
      v147 = *MEMORY[0x1E0CB2D50];
      v148 = CFSTR("GDKnosisFact subjectId is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v110, (uint64_t)&v148, &v147, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v119, v120, (uint64_t)CFSTR("GDErrorDomain"), 9, v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v121, (uint64_t)v36);
      goto LABEL_30;
    }
    v20 = 0;
LABEL_22:
    v104 = 0;
LABEL_58:

    goto LABEL_59;
  }
  objc_msgSend_error(v4, v9, v10);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v105)
  {
    v111 = (void *)MEMORY[0x1E0CB35C8];
    v151 = *MEMORY[0x1E0CB2D50];
    v152[0] = CFSTR("GDKnosisFact factId is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v106, (uint64_t)v152, &v151, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v111, v112, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v113, (uint64_t)v20);
    goto LABEL_22;
  }
  v104 = 0;
LABEL_60:

  return v104;
}

- (NSString)factId
{
  return self->_factId;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)subjectId
{
  return self->_subjectId;
}

- (NSArray)subjectAlias
{
  return self->_subjectAlias;
}

- (NSNumber)subjectPopularity
{
  return self->_subjectPopularity;
}

- (NSArray)subjectIsa
{
  return self->_subjectIsa;
}

- (NSString)predicateId
{
  return self->_predicateId;
}

- (NSArray)predicateAlias
{
  return self->_predicateAlias;
}

- (NSNumber)predicatePopularity
{
  return self->_predicatePopularity;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (NSArray)objectAlias
{
  return self->_objectAlias;
}

- (NSNumber)objectPopularity
{
  return self->_objectPopularity;
}

- (NSArray)qualifiers
{
  return self->_qualifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiers, 0);
  objc_storeStrong((id *)&self->_objectPopularity, 0);
  objc_storeStrong((id *)&self->_objectAlias, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_predicatePopularity, 0);
  objc_storeStrong((id *)&self->_predicateAlias, 0);
  objc_storeStrong((id *)&self->_predicateId, 0);
  objc_storeStrong((id *)&self->_subjectIsa, 0);
  objc_storeStrong((id *)&self->_subjectPopularity, 0);
  objc_storeStrong((id *)&self->_subjectAlias, 0);
  objc_storeStrong((id *)&self->_subjectId, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_factId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
