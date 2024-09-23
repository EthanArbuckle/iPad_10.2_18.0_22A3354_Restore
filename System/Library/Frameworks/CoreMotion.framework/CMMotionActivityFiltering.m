@implementation CMMotionActivityFiltering

- (CMMotionActivityFiltering)init
{
  CMMotionActivityFiltering *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMMotionActivityFiltering *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMMotionActivityFiltering;
  v2 = -[CMMotionActivityFiltering init](&v13, sel_init);
  v7 = v2;
  if (v2)
  {
    objc_msgSend_setTrueWalkInBout_(v2, v3, v4, v5, v6, 0.0);
    objc_msgSend_setTrueRunInBout_(v7, v8, v9, v10, v11, 0.0);
  }
  return v7;
}

+ (BOOL)isActivity:(id)a3 sustainedForAttribute:(int64_t)a4
{
  uint64_t v4;
  int v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t started;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
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
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  double v105;

  if (a4 == 1)
  {
    if ((objc_msgSend_unknown(a3, a2, (uint64_t)a3, 1, v4) & 1) != 0
      || (objc_msgSend_stationary(a3, v7, v8, v9, v10) & 1) != 0
      || (objc_msgSend_walking(a3, v7, v8, v9, v10) & 1) != 0
      || (objc_msgSend_running(a3, v7, v8, v9, v10) & 1) != 0
      || (objc_msgSend_cycling(a3, v7, v8, v9, v10) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v11 = objc_msgSend_automotive(a3, v7, v8, v9, v10) ^ 1;
    }
    if (objc_msgSend_unknown(a3, v7, v8, v9, v10))
    {
      v16 = (void *)objc_msgSend_endDate(a3, v12, v13, v14, v15);
      started = objc_msgSend_startDate(a3, v17, v18, v19, v20);
      objc_msgSend_timeIntervalSinceDate_(v16, v22, started, v23, v24);
      if (v25 >= 300.0)
        goto LABEL_23;
    }
    if (objc_msgSend_stationary(a3, v12, v13, v14, v15))
    {
      v30 = (void *)objc_msgSend_endDate(a3, v26, v27, v28, v29);
      v35 = objc_msgSend_startDate(a3, v31, v32, v33, v34);
      objc_msgSend_timeIntervalSinceDate_(v30, v36, v35, v37, v38);
      if (v39 >= 300.0)
        goto LABEL_23;
    }
    if (v11)
    {
      v40 = (void *)objc_msgSend_endDate(a3, v26, v27, v28, v29);
      v45 = objc_msgSend_startDate(a3, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceDate_(v40, v46, v45, v47, v48);
      if (v49 >= 300.0)
        goto LABEL_23;
    }
    if (objc_msgSend_walking(a3, v26, v27, v28, v29))
    {
      v54 = (void *)objc_msgSend_endDate(a3, v50, v51, v52, v53);
      v59 = objc_msgSend_startDate(a3, v55, v56, v57, v58);
      objc_msgSend_timeIntervalSinceDate_(v54, v60, v59, v61, v62);
      if (v63 >= 180.0)
        goto LABEL_23;
    }
    if (objc_msgSend_running(a3, v50, v51, v52, v53)
      && (v68 = (void *)objc_msgSend_endDate(a3, v64, v65, v66, v67),
          v73 = objc_msgSend_startDate(a3, v69, v70, v71, v72),
          objc_msgSend_timeIntervalSinceDate_(v68, v74, v73, v75, v76),
          v77 >= 120.0)
      || objc_msgSend_cycling(a3, v64, v65, v66, v67)
      && (v82 = (void *)objc_msgSend_endDate(a3, v78, v79, v80, v81),
          v87 = objc_msgSend_startDate(a3, v83, v84, v85, v86),
          objc_msgSend_timeIntervalSinceDate_(v82, v88, v87, v89, v90),
          v91 >= 300.0))
    {
LABEL_23:
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = objc_msgSend_automotive(a3, v78, v79, v80, v81);
      if (v5)
      {
        v96 = (void *)objc_msgSend_endDate(a3, v92, v93, v94, v95);
        v101 = objc_msgSend_startDate(a3, v97, v98, v99, v100);
        objc_msgSend_timeIntervalSinceDate_(v96, v102, v101, v103, v104);
        LOBYTE(v5) = v105 >= 30.0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = a4 == 0;
  }
  return v5;
}

+ (BOOL)isTimeFromActivity:(id)a3 toActivity:(id)a4 withinLimitForAttribute:(int64_t)a5
{
  int v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *started;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  double v106;

  if (a5 == 1)
  {
    if ((objc_msgSend_unknown(a3, a2, (uint64_t)a3, (uint64_t)a4, 1) & 1) != 0
      || (objc_msgSend_stationary(a3, v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend_walking(a3, v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend_running(a3, v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend_cycling(a3, v8, v9, v10, v11) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend_automotive(a3, v8, v9, v10, v11) ^ 1;
    }
    if (objc_msgSend_unknown(a3, v8, v9, v10, v11))
    {
      started = (void *)objc_msgSend_startDate(a4, v13, v14, v15, v16);
      v22 = objc_msgSend_endDate(a3, v18, v19, v20, v21);
      objc_msgSend_timeIntervalSinceDate_(started, v23, v22, v24, v25);
      if (v26 <= 300.0)
        goto LABEL_23;
    }
    if (objc_msgSend_stationary(a3, v13, v14, v15, v16))
    {
      v31 = (void *)objc_msgSend_startDate(a4, v27, v28, v29, v30);
      v36 = objc_msgSend_endDate(a3, v32, v33, v34, v35);
      objc_msgSend_timeIntervalSinceDate_(v31, v37, v36, v38, v39);
      if (v40 <= 300.0)
        goto LABEL_23;
    }
    if (v12)
    {
      v41 = (void *)objc_msgSend_startDate(a4, v27, v28, v29, v30);
      v46 = objc_msgSend_endDate(a3, v42, v43, v44, v45);
      objc_msgSend_timeIntervalSinceDate_(v41, v47, v46, v48, v49);
      if (v50 <= 300.0)
        goto LABEL_23;
    }
    if (objc_msgSend_walking(a3, v27, v28, v29, v30))
    {
      v55 = (void *)objc_msgSend_startDate(a4, v51, v52, v53, v54);
      v60 = objc_msgSend_endDate(a3, v56, v57, v58, v59);
      objc_msgSend_timeIntervalSinceDate_(v55, v61, v60, v62, v63);
      if (v64 <= 300.0)
        goto LABEL_23;
    }
    if (objc_msgSend_running(a3, v51, v52, v53, v54)
      && (v69 = (void *)objc_msgSend_startDate(a4, v65, v66, v67, v68),
          v74 = objc_msgSend_endDate(a3, v70, v71, v72, v73),
          objc_msgSend_timeIntervalSinceDate_(v69, v75, v74, v76, v77),
          v78 <= 300.0)
      || objc_msgSend_cycling(a3, v65, v66, v67, v68)
      && (v83 = (void *)objc_msgSend_startDate(a4, v79, v80, v81, v82),
          v88 = objc_msgSend_endDate(a3, v84, v85, v86, v87),
          objc_msgSend_timeIntervalSinceDate_(v83, v89, v88, v90, v91),
          v92 <= 300.0))
    {
LABEL_23:
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = objc_msgSend_automotive(a3, v79, v80, v81, v82);
      if (v5)
      {
        v97 = (void *)objc_msgSend_startDate(a4, v93, v94, v95, v96);
        v102 = objc_msgSend_endDate(a3, v98, v99, v100, v101);
        objc_msgSend_timeIntervalSinceDate_(v97, v103, v102, v104, v105);
        LOBYTE(v5) = v106 <= 300.0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = a5 == 0;
  }
  return v5;
}

- (void)evaluateNextActivity:(id)a3 attribute:(int64_t)a4 result:(id)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isActivity_sustainedForAttribute;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[9];
  _QWORD v24[2];
  uint64_t (*v25)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v26;
  id v27;
  CMMotionActivityFiltering *v28;

  if (objc_msgSend_automotive(a3, a2, (uint64_t)a3, a4, (uint64_t)a5))
    *(_DWORD *)objc_msgSend_motionActivity(a3, v9, v10, v11, v12) = 5;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = sub_18F461874;
  v26 = &unk_1E29559D0;
  v27 = a3;
  v28 = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18F461950;
  v23[3] = &unk_1E2958788;
  v23[4] = a5;
  v23[5] = a3;
  v23[7] = v24;
  v23[8] = a4;
  v23[6] = self;
  isActivity_sustainedForAttribute = objc_msgSend_isActivity_sustainedForAttribute_(CMMotionActivityFiltering, v9, (uint64_t)a3, a4, v12);
  v18 = objc_msgSend_count(a5, v14, v15, v16, v17);
  if ((isActivity_sustainedForAttribute & 1) != 0)
  {
    if (!v18 || (sub_18F461950((uint64_t)v23, v19, v20, v21, v22) & 1) == 0)
    {
      objc_msgSend_addObject_(a5, v19, (uint64_t)a3, v21, v22);
      ((void (*)(_QWORD *))v25)(v24);
    }
  }
  else if (v18)
  {
    sub_18F461950((uint64_t)v23, v19, v20, v21, v22);
  }
}

- (double)trueRunInBout
{
  return self->_trueRunInBout;
}

- (void)setTrueRunInBout:(double)a3
{
  self->_trueRunInBout = a3;
}

- (double)trueWalkInBout
{
  return self->_trueWalkInBout;
}

- (void)setTrueWalkInBout:(double)a3
{
  self->_trueWalkInBout = a3;
}

@end
