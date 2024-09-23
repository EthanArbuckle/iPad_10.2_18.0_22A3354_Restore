@implementation CWFSensingParameters

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t matched;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend_numberOfReports(self, v5, v6, v7, v8);
  objc_msgSend_numberWithInteger_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("numberOfReports"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  matched = objc_msgSend_matchFrameType(self, v17, v18, v19, v20);
  objc_msgSend_numberWithInt_(v16, v22, matched, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)CFSTR("matchFrameType"), v27);

  objc_msgSend_matchMACAddresses(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)CFSTR("matchMACAddresses"), v34);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  v40 = objc_msgSend_timeout(self, v36, v37, v38, v39);
  objc_msgSend_numberWithInteger_(v35, v41, v40, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)CFSTR("timeout"), v46);

  v47 = (void *)MEMORY[0x1E0CB37E8];
  v52 = objc_msgSend_submitMetric(self, v48, v49, v50, v51);
  objc_msgSend_numberWithBool_(v47, v53, v52, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)CFSTR("submitMetric"), v58);

  v59 = (void *)MEMORY[0x1E0CB37E8];
  v64 = objc_msgSend_scheduleOnceAfter(self, v60, v61, v62, v63);
  objc_msgSend_numberWithInteger_(v59, v65, v64, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)CFSTR("scheduleOnceAfter"), v70);

  v71 = (void *)MEMORY[0x1E0CB37E8];
  v76 = objc_msgSend_scheduleDailyAt(self, v72, v73, v74, v75);
  objc_msgSend_numberWithInteger_(v71, v77, v76, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, (uint64_t)CFSTR("scheduleDailyAt"), v82);

  objc_msgSend_activityLabels(self, v83, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v88, (uint64_t)v87, (uint64_t)CFSTR("activityLabels"), v89);

  objc_msgSend_placeLabels(self, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v95, (uint64_t)v94, (uint64_t)CFSTR("placeLabels"), v96);

  objc_msgSend_comment(self, v97, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v102, (uint64_t)v101, (uint64_t)CFSTR("comment"), v103);

  sub_1B06475A8(v3, 0, 1u);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v104, (uint64_t)v107, v105, v106);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v108 = 0;
  }

  return v108;
}

- (CWFSensingParameters)init
{
  CWFSensingParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CWFSensingParameters;
  result = -[CWFSensingParameters init](&v3, sel_init);
  if (result)
  {
    result->_numberOfReports = 50;
    result->_matchFrameType = 1;
    result->_submitMetric = 0;
    *(_OWORD *)&result->_timeout = xmmword_1B0711BC0;
    result->_scheduleDailyAt = -2;
  }
  return result;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("numberOfReports=%ld, "), v8, v9, self->_numberOfReports);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR("matchFrameType=%d, "), v11, v12, self->_matchFrameType);
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR("matchMACAddresses="), v14, v15);
  if (objc_msgSend_count(self->_matchMACAddresses, v16, v17, v18, v19))
  {
    v23 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_matchMACAddresses, v20, v23, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CWFCorrectEthernetAddressString(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR("%@;"), v27, v28, v25);

      ++v23;
    }
    while (v23 < objc_msgSend_count(self->_matchMACAddresses, v29, v30, v31, v32));
  }
  objc_msgSend_appendFormat_(v6, v20, (uint64_t)CFSTR(", "), v21, v22);
  objc_msgSend_appendFormat_(v6, v33, (uint64_t)CFSTR("timeout=%ld, "), v34, v35, self->_timeout);
  objc_msgSend_appendFormat_(v6, v36, (uint64_t)CFSTR("submitMetric=%d, "), v37, v38, self->_submitMetric);
  objc_msgSend_appendFormat_(v6, v39, (uint64_t)CFSTR("scheduleOnceAfter=%ld, "), v40, v41, self->_scheduleOnceAfter);
  objc_msgSend_appendFormat_(v6, v42, (uint64_t)CFSTR("scheduleDailyAt=%ld, "), v43, v44, self->_scheduleDailyAt);
  objc_msgSend_appendFormat_(v6, v45, (uint64_t)CFSTR("activityLabels=%@, "), v46, v47, self->_activityLabels);
  objc_msgSend_appendFormat_(v6, v48, (uint64_t)CFSTR("placeLabels=%@, "), v49, v50, self->_placeLabels);
  objc_msgSend_appendFormat_(v6, v51, (uint64_t)CFSTR("comment=%@"), v52, v53, self->_comment);
  return (NSString *)v6;
}

- (BOOL)isEqualToSensingParameters:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int64_t numberOfReports;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int matchFrameType;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *matchMACAddresses;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *comment;
  int64_t timeout;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int submitMetric;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t scheduleOnceAfter;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t scheduleDailyAt;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSArray *activityLabels;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSArray *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSArray *v68;
  uint64_t v69;
  NSArray *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  NSArray *placeLabels;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSArray *v84;
  uint64_t v85;
  NSArray *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  NSArray *v106;
  void *v107;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSArray *v113;
  void *v114;
  NSArray *v115;

  v6 = a3;
  numberOfReports = self->_numberOfReports;
  if (numberOfReports == objc_msgSend_numberOfReports(v6, v8, v9, v10, v11))
  {
    matchFrameType = self->_matchFrameType;
    if (matchFrameType == objc_msgSend_matchFrameType(v6, v12, v13, v14, v15))
    {
      matchMACAddresses = self->_matchMACAddresses;
      objc_msgSend_matchMACAddresses(v6, v17, v18, v19, v20);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (matchMACAddresses != v26)
      {
        if (!self->_matchMACAddresses
          || (objc_msgSend_matchMACAddresses(v6, v22, v23, v24, v25), (v27 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          LOBYTE(comment) = 0;
          goto LABEL_38;
        }
        v3 = (void *)v27;
        v32 = self->_matchMACAddresses;
        objc_msgSend_matchMACAddresses(v6, v28, v29, v30, v31);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34, v35))
        {
          LOBYTE(comment) = 0;
LABEL_37:

          goto LABEL_38;
        }
      }
      timeout = self->_timeout;
      if (timeout == objc_msgSend_timeout(v6, v22, v23, v24, v25))
      {
        submitMetric = self->_submitMetric;
        if (submitMetric == objc_msgSend_submitMetric(v6, v38, v39, v40, v41))
        {
          scheduleOnceAfter = self->_scheduleOnceAfter;
          if (scheduleOnceAfter == objc_msgSend_scheduleOnceAfter(v6, v43, v44, v45, v46))
          {
            scheduleDailyAt = self->_scheduleDailyAt;
            if (scheduleDailyAt == objc_msgSend_scheduleDailyAt(v6, v48, v49, v50, v51))
            {
              activityLabels = self->_activityLabels;
              objc_msgSend_activityLabels(v6, v53, v54, v55, v56);
              v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
              if (activityLabels == v62)
                goto LABEL_20;
              if (!self->_activityLabels
                || (objc_msgSend_activityLabels(v6, v58, v59, v60, v61), (v63 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                LOBYTE(comment) = 0;
                goto LABEL_51;
              }
              v114 = (void *)v63;
              v68 = self->_activityLabels;
              objc_msgSend_activityLabels(v6, v64, v65, v66, v67);
              v69 = objc_claimAutoreleasedReturnValue();
              v70 = v68;
              v71 = (void *)v69;
              if ((objc_msgSend_isEqual_(v70, v72, v69, v73, v74) & 1) != 0)
              {
                v112 = v71;
LABEL_20:
                placeLabels = self->_placeLabels;
                objc_msgSend_placeLabels(v6, v58, v59, v60, v61);
                v115 = (NSArray *)objc_claimAutoreleasedReturnValue();
                if (placeLabels != v115)
                {
                  if (self->_placeLabels)
                  {
                    objc_msgSend_placeLabels(v6, v76, v77, v78, v79);
                    comment = (void *)objc_claimAutoreleasedReturnValue();
                    if (comment)
                    {
                      v113 = activityLabels;
                      v84 = self->_placeLabels;
                      objc_msgSend_placeLabels(v6, v80, v81, v82, v83);
                      v85 = objc_claimAutoreleasedReturnValue();
                      v86 = v84;
                      v87 = (void *)v85;
                      if ((objc_msgSend_isEqual_(v86, v88, v85, v89, v90) & 1) == 0)
                      {

                        LOBYTE(comment) = 0;
                        goto LABEL_48;
                      }
                      v110 = v87;
                      v111 = comment;
LABEL_26:
                      comment = self->_comment;
                      objc_msgSend_comment(v6, v76, v77, v78, v79);
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      v96 = v91;
                      LOBYTE(comment) = comment == v91;
                      if ((_BYTE)comment || !self->_comment)
                      {

                        v106 = v115;
                        if (placeLabels == v115)
                        {
LABEL_33:
                          v107 = v112;
                          activityLabels = v113;
                          goto LABEL_42;
                        }
                      }
                      else
                      {
                        objc_msgSend_comment(v6, v92, v93, v94, v95);
                        v97 = objc_claimAutoreleasedReturnValue();
                        if (v97)
                        {
                          comment = self->_comment;
                          v109 = (void *)v97;
                          objc_msgSend_comment(v6, v98, v99, v100, v101);
                          v102 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(comment) = objc_msgSend_isEqual_(comment, v103, (uint64_t)v102, v104, v105);

                          if (placeLabels == v115)
                          {

                          }
                          else
                          {

                          }
LABEL_48:
                          if (v113 != v62)
                          {

                            goto LABEL_50;
                          }
                          goto LABEL_51;
                        }

                        v106 = v115;
                        if (placeLabels == v115)
                        {
                          LOBYTE(comment) = 0;
                          goto LABEL_33;
                        }
                      }

                      goto LABEL_33;
                    }
                  }
                  else
                  {
                    LOBYTE(comment) = 0;
                  }
                  v107 = v112;
                  v106 = v115;
LABEL_42:

                  if (activityLabels != v62)
                  {

LABEL_50:
                  }
LABEL_51:

LABEL_36:
                  if (matchMACAddresses != v26)
                    goto LABEL_37;
LABEL_38:

                  goto LABEL_39;
                }
                v113 = activityLabels;
                goto LABEL_26;
              }

            }
          }
        }
      }
      LOBYTE(comment) = 0;
      goto LABEL_36;
    }
  }
  LOBYTE(comment) = 0;
LABEL_39:

  return (char)comment;
}

- (BOOL)isEqual:(id)a3
{
  CWFSensingParameters *v4;
  CWFSensingParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToSensingParameters;

  v4 = (CWFSensingParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSensingParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSensingParameters = objc_msgSend_isEqualToSensingParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToSensingParameters = 0;
  }

  return isEqualToSensingParameters;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 submitMetric;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, self->_numberOfReports, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v11, self->_matchFrameType, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v14, v15, v16, v17, v18) ^ v10;
  v24 = objc_msgSend_hash(self->_matchMACAddresses, v20, v21, v22, v23);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v25, self->_timeout, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v19 ^ v24 ^ objc_msgSend_hash(v28, v29, v30, v31, v32);
  submitMetric = self->_submitMetric;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v35, self->_scheduleOnceAfter, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = submitMetric ^ objc_msgSend_hash(v38, v39, v40, v41, v42);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v44, self->_scheduleDailyAt, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v33 ^ v43 ^ objc_msgSend_hash(v47, v48, v49, v50, v51);
  v57 = objc_msgSend_hash(self->_activityLabels, v53, v54, v55, v56);
  v62 = v57 ^ objc_msgSend_hash(self->_placeLabels, v58, v59, v60, v61);
  v67 = v52 ^ v62 ^ objc_msgSend_hash(self->_comment, v63, v64, v65, v66);

  return v67;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFSensingParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setNumberOfReports_(v11, v12, self->_numberOfReports, v13, v14);
  objc_msgSend_setMatchFrameType_(v11, v15, self->_matchFrameType, v16, v17);
  objc_msgSend_setMatchMACAddresses_(v11, v18, (uint64_t)self->_matchMACAddresses, v19, v20);
  objc_msgSend_setTimeout_(v11, v21, self->_timeout, v22, v23);
  objc_msgSend_setSubmitMetric_(v11, v24, self->_submitMetric, v25, v26);
  objc_msgSend_setScheduleOnceAfter_(v11, v27, self->_scheduleOnceAfter, v28, v29);
  objc_msgSend_setScheduleDailyAt_(v11, v30, self->_scheduleDailyAt, v31, v32);
  objc_msgSend_setActivityLabels_(v11, v33, (uint64_t)self->_activityLabels, v34, v35);
  objc_msgSend_setPlaceLabels_(v11, v36, (uint64_t)self->_placeLabels, v37, v38);
  objc_msgSend_setComment_(v11, v39, (uint64_t)self->_comment, v40, v41);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t numberOfReports;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;

  numberOfReports = self->_numberOfReports;
  v25 = a3;
  objc_msgSend_encodeInteger_forKey_(v25, v5, numberOfReports, (uint64_t)CFSTR("_numberOfReports"), v6);
  objc_msgSend_encodeInteger_forKey_(v25, v7, self->_matchFrameType, (uint64_t)CFSTR("_matchFrameType"), v8);
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)self->_matchMACAddresses, (uint64_t)CFSTR("_matchMACAddresses"), v10);
  objc_msgSend_encodeInteger_forKey_(v25, v11, self->_timeout, (uint64_t)CFSTR("_timeout"), v12);
  objc_msgSend_encodeBool_forKey_(v25, v13, self->_submitMetric, (uint64_t)CFSTR("_submitMetric"), v14);
  objc_msgSend_encodeInteger_forKey_(v25, v15, self->_scheduleOnceAfter, (uint64_t)CFSTR("_scheduleOnceAfter"), v16);
  objc_msgSend_encodeInteger_forKey_(v25, v17, self->_scheduleDailyAt, (uint64_t)CFSTR("_scheduleDailyAt"), v18);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)self->_activityLabels, (uint64_t)CFSTR("_activityLabels"), v20);
  objc_msgSend_encodeObject_forKey_(v25, v21, (uint64_t)self->_placeLabels, (uint64_t)CFSTR("_placeLabels"), v22);
  objc_msgSend_encodeObject_forKey_(v25, v23, (uint64_t)self->_comment, (uint64_t)CFSTR("_comment"), v24);

}

- (CWFSensingParameters)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CWFSensingParameters *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *matchMACAddresses;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSArray *activityLabels;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSArray *placeLabels;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  NSString *comment;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)CWFSensingParameters;
  v8 = -[CWFSensingParameters init](&v63, sel_init);
  if (v8)
  {
    v8->_numberOfReports = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("_numberOfReports"), v6, v7);
    v8->_matchFrameType = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("_matchFrameType"), v10, v11);
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v14, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("_matchMACAddresses"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    matchMACAddresses = v8->_matchMACAddresses;
    v8->_matchMACAddresses = (NSArray *)v21;

    v8->_timeout = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("_timeout"), v24, v25);
    v8->_submitMetric = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)CFSTR("_submitMetric"), v27, v28);
    v8->_scheduleOnceAfter = objc_msgSend_decodeIntegerForKey_(v4, v29, (uint64_t)CFSTR("_scheduleOnceAfter"), v30, v31);
    v8->_scheduleDailyAt = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)CFSTR("_scheduleDailyAt"), v33, v34);
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend_setWithObjects_(v35, v38, v36, v39, v40, v37, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v42, (uint64_t)v41, (uint64_t)CFSTR("_activityLabels"), v43);
    v44 = objc_claimAutoreleasedReturnValue();
    activityLabels = v8->_activityLabels;
    v8->_activityLabels = (NSArray *)v44;

    v46 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_class();
    v48 = objc_opt_class();
    objc_msgSend_setWithObjects_(v46, v49, v47, v50, v51, v48, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v53, (uint64_t)v52, (uint64_t)CFSTR("_placeLabels"), v54);
    v55 = objc_claimAutoreleasedReturnValue();
    placeLabels = v8->_placeLabels;
    v8->_placeLabels = (NSArray *)v55;

    v57 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, (uint64_t)CFSTR("_comment"), v59);
    v60 = objc_claimAutoreleasedReturnValue();
    comment = v8->_comment;
    v8->_comment = (NSString *)v60;

  }
  return v8;
}

- (int64_t)numberOfReports
{
  return self->_numberOfReports;
}

- (void)setNumberOfReports:(int64_t)a3
{
  self->_numberOfReports = a3;
}

- (int)matchFrameType
{
  return self->_matchFrameType;
}

- (void)setMatchFrameType:(int)a3
{
  self->_matchFrameType = a3;
}

- (NSArray)matchMACAddresses
{
  return self->_matchMACAddresses;
}

- (void)setMatchMACAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int64_t)a3
{
  self->_timeout = a3;
}

- (BOOL)submitMetric
{
  return self->_submitMetric;
}

- (void)setSubmitMetric:(BOOL)a3
{
  self->_submitMetric = a3;
}

- (int64_t)scheduleOnceAfter
{
  return self->_scheduleOnceAfter;
}

- (void)setScheduleOnceAfter:(int64_t)a3
{
  self->_scheduleOnceAfter = a3;
}

- (int64_t)scheduleDailyAt
{
  return self->_scheduleDailyAt;
}

- (void)setScheduleDailyAt:(int64_t)a3
{
  self->_scheduleDailyAt = a3;
}

- (NSArray)activityLabels
{
  return self->_activityLabels;
}

- (void)setActivityLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)placeLabels
{
  return self->_placeLabels;
}

- (void)setPlaceLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_placeLabels, 0);
  objc_storeStrong((id *)&self->_activityLabels, 0);
  objc_storeStrong((id *)&self->_matchMACAddresses, 0);
}

@end
