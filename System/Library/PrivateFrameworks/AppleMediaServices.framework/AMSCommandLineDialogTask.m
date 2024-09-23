@implementation AMSCommandLineDialogTask

- (AMSCommandLineDialogTask)initWithRequest:(id)a3
{
  id v5;
  AMSCommandLineDialogTask *v6;
  AMSCommandLineDialogTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCommandLineDialogTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_automaticButtonSelection = -1;
    v6->_dialogPadding = 2.0;
    v6->_maximumDialogWidth = 70.0;
    v6->_minimumDialogWidth = 40.0;
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)present
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AMSCommandLineDialogTask_present__block_invoke;
  v5[3] = &unk_1E25401E0;
  objc_copyWeak(&v6, &location);
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

AMSDialogResult *__35__AMSCommandLineDialogTask_present__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  __CFString *v95;
  void *v96;
  __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  void *v108;
  void *v109;
  void *v110;
  unint64_t v111;
  void *v112;
  void *v113;
  unint64_t v114;
  unint64_t v115;
  __CFString *v116;
  void *v117;
  void *v118;
  unint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  AMSDialogResult *v124;
  void *v125;
  AMSDialogResult *v126;
  void *v128;
  uint64_t v129;
  id WeakRetained;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint8_t v157[128];
  uint8_t buf[4];
  uint64_t v159;
  __int16 v160;
  void *v161;
  __int16 v162;
  void *v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "OSLogObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    objc_msgSend(WeakRetained, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v159 = v3;
    v160 = 2114;
    v161 = v5;
    v162 = 2114;
    v163 = v6;
    _os_log_impl(&dword_18C849000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting command line alert using request: %{public}@", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(WeakRetained, "dialogPadding");
  v11 = (uint64_t)(v10 * 2.0 + 2.0);
  objc_msgSend(WeakRetained, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length") + v11;

  objc_msgSend(WeakRetained, "minimumDialogWidth");
  if (v15 >= (double)v14)
    v16 = v15;
  else
    v16 = (double)v14;
  objc_msgSend(WeakRetained, "maximumDialogWidth");
  if (v17 >= (double)(uint64_t)v16)
    v18 = (double)(uint64_t)v16;
  else
    v18 = v17;
  objc_msgSend(WeakRetained, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length") + v11;

  objc_msgSend(WeakRetained, "minimumDialogWidth");
  if (v22 >= (double)v21)
    v23 = v22;
  else
    v23 = (double)v21;
  objc_msgSend(WeakRetained, "maximumDialogWidth");
  if (v24 >= (double)(uint64_t)v23)
    v25 = (double)(uint64_t)v23;
  else
    v25 = v24;
  objc_msgSend(WeakRetained, "minimumDialogWidth");
  v27 = v26;
  v135 = v9;
  if (v9 == 2)
  {
    v27 = v26 * 0.5;
    objc_msgSend(WeakRetained, "maximumDialogWidth");
    v29 = v28 * 0.5;
  }
  else
  {
    objc_msgSend(WeakRetained, "maximumDialogWidth");
    v29 = v30;
  }
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  objc_msgSend(WeakRetained, "request");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "buttonActions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v150, v157, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v151;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v151 != v36)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * i), "title");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "length") + v11;

        if (v39 <= (uint64_t)v27)
          v40 = (uint64_t)v27;
        else
          v40 = v39;
        if (v40 >= (uint64_t)v29)
          v40 = (uint64_t)v29;
        v41 = v40 - v11;
        if (v35 <= v41)
          v35 = v41;
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v150, v157, 16);
    }
    while (v34);
  }
  else
  {
    v35 = 0;
  }

  v42 = (uint64_t)v18;
  if ((uint64_t)v25 > (uint64_t)v18)
    v42 = (uint64_t)v25;
  v43 = v35 + v11;
  if (v135 == 2)
    v43 = 2 * (v35 + v11) - 1;
  if (v42 <= v43)
    v44 = v43;
  else
    v44 = v42;
  v45 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(WeakRetained, "_createHorizontolLineWithWidth:", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "appendString:", v46);

  objc_msgSend(WeakRetained, "request");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "title");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");
  v50 = v49 != 0;

  if (v49)
  {
    objc_msgSend(WeakRetained, "request");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "title");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", v52, v44, 1, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "appendString:", v53);

  }
  v129 = v44;
  objc_msgSend(WeakRetained, "request");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "message");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length");

  if (v56)
  {
    if (v49)
    {
      objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", CFSTR(" "), v44, 0, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "appendString:", v57);

    }
    objc_msgSend(WeakRetained, "request");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "message");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", v59, v44, 0, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "appendString:", v60);

    v50 = 1;
  }
  objc_msgSend(WeakRetained, "request");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "textFields");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (v63)
  {
    if (v50)
    {
      objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", CFSTR(" "), v44, 0, 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "appendString:", v64);

    }
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    objc_msgSend(WeakRetained, "request");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "textFields");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v146, v156, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v68; ++j)
        {
          if (*(_QWORD *)v147 != v69)
            objc_enumerationMutation(v66);
          objc_msgSend(WeakRetained, "_createTextfieldWithTextfield:width:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * j), v129);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "appendString:", v71);

        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v146, v156, 16);
      }
      while (v68);
    }

  }
  objc_msgSend(WeakRetained, "_createHorizontolLineWithWidth:", v129);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v45;
  objc_msgSend(v45, "appendString:", v72);

  v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend(WeakRetained, "request");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "buttonActions");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v142, v155, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v143;
    v78 = 1;
    do
    {
      for (k = 0; k != v76; ++k)
      {
        if (*(_QWORD *)v143 != v77)
          objc_enumerationMutation(v74);
        v80 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * k), "title");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "stringWithFormat:", CFSTR("(%ld) %@"), v78 + k, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "addObject:", v82);

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v142, v155, 16);
      v78 += k;
    }
    while (v76);
  }

  if (v135 == 2)
  {
    v83 = (double)v129 * 0.5;
    v84 = vcvtpd_s64_f64(v83);
    v85 = vcvtmd_s64_f64(v83);
    objc_msgSend(v137, "objectAtIndexedSubscript:", 0);
    v86 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "objectAtIndexedSubscript:", 1);
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = WeakRetained;
    v133 = v84;
    objc_msgSend(WeakRetained, "_createLinesFromText:width:", v86, v84);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = (void *)v87;
    v132 = v85;
    objc_msgSend(WeakRetained, "_createLinesFromText:width:", v87, v85);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "count");
    v136 = v90;
    v92 = objc_msgSend(v90, "count");
    if (v91 <= v92)
      v93 = v92;
    else
      v93 = v91;
    v131 = v93;
    if (v93 >= 1)
    {
      v94 = 0;
      v95 = CFSTR(" ");
      do
      {
        v96 = v95;
        if (v94 < objc_msgSend(v89, "count"))
        {
          objc_msgSend(v89, "objectAtIndexedSubscript:", v94);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v97 = v95;
        if (v94 < objc_msgSend(v136, "count"))
        {
          objc_msgSend(v136, "objectAtIndexedSubscript:", v94);
          v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", v96, v133, 1, 0);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", v95, v132, 1, 1);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "substringToIndex:", objc_msgSend(v98, "length") - 1);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v134, "appendFormat:", CFSTR("%@%@"), v100, v99);
        ++v94;
        v95 = v97;
      }
      while (v131 != v94);
    }
    objc_msgSend(WeakRetained, "_createHorizontolLineWithWidth:", v129);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v89;
    v103 = v134;
    objc_msgSend(v134, "appendString:", v101);

  }
  else
  {
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v86 = v137;
    v104 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v138, v154, 16);
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v139;
      v103 = v134;
      do
      {
        for (m = 0; m != v105; ++m)
        {
          if (*(_QWORD *)v139 != v106)
            objc_enumerationMutation(v86);
          objc_msgSend(WeakRetained, "_createText:width:centered:omitLeftPipe:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * m), v129, 1, 0);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "appendString:", v108);

          objc_msgSend(WeakRetained, "_createHorizontolLineWithWidth:", v129);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "appendString:", v109);

        }
        v105 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v138, v154, 16);
      }
      while (v105);
      v88 = WeakRetained;
    }
    else
    {
      v88 = WeakRetained;
      v103 = v134;
    }
  }

  objc_msgSend(v88, "_printMessage:", CFSTR("\n"));
  objc_msgSend(v88, "_printMessage:", v103);
  objc_msgSend(v88, "_printMessage:", CFSTR("\n"));
  objc_msgSend(v88, "_gatherTextfieldInput");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v110, "count"))
    goto LABEL_92;
  if (objc_msgSend(v88, "automaticButtonSelection") < 0)
    goto LABEL_92;
  v111 = objc_msgSend(v88, "automaticButtonSelection");
  objc_msgSend(v88, "request");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "buttonActions");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "count");

  if (v111 >= v114 || (v115 = objc_msgSend(v88, "automaticButtonSelection"), v115 == -1))
LABEL_92:
    v115 = objc_msgSend(v88, "_gatherButtonInput");
  v116 = CFSTR("AMSDialogResultDismissIdentifier");
  if ((v115 & 0x8000000000000000) == 0)
  {
    objc_msgSend(WeakRetained, "request");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "buttonActions");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v118, "count");

    if (v115 < v119)
    {
      objc_msgSend(WeakRetained, "request");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "buttonActions");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "objectAtIndexedSubscript:", v115);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v122, "identifier");
      v123 = objc_claimAutoreleasedReturnValue();

      v116 = (__CFString *)v123;
    }
  }
  v124 = [AMSDialogResult alloc];
  objc_msgSend(WeakRetained, "request");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = -[AMSDialogResult initWithOriginalRequest:selectedActionIdentifier:](v124, "initWithOriginalRequest:selectedActionIdentifier:", v125, v116);

  -[AMSDialogResult setTextfieldValues:](v126, "setTextfieldValues:", v110);
  return v126;
}

- (id)_createHorizontolLineWithWidth:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(&stru_1E2548760, "stringByPaddingToLength:withString:startingAtIndex:", a3 - 2, CFSTR("-"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@ \n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createLinesFromText:(id)a3 width:(int64_t)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t j;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v6)
  {
    v7 = v6;
    v33 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("\n"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v35;
          v13 = 1;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v35 != v12)
                objc_enumerationMutation(v9);
              v15 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              if ((v13 & 1) == 0)
                objc_msgSend(v5, "addObject:", CFSTR("\n"));
              objc_msgSend(v5, "addObject:", v15);
              v13 = 0;
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            v13 = 0;
          }
          while (v11);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSCommandLineDialogTask dialogPadding](self, "dialogPadding");
  v18 = v17;
  v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(v5, "count"))
  {
    v20 = 0;
    v21 = a4 - (uint64_t)(v18 * 2.0 + 2.0);
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("\n"));
      v24 = objc_msgSend(v19, "length");
      v25 = objc_msgSend(v22, "length");
      if ((v23 & 1) != 0)
        break;
      if (v24 + v25 + 1 <= v21)
      {
        if (objc_msgSend(v19, "length"))
          objc_msgSend(v19, "appendString:", CFSTR(" "));
        objc_msgSend(v19, "appendString:", v22);
        goto LABEL_29;
      }
      objc_msgSend(v16, "addObject:", v19);
      if (objc_msgSend(v22, "length") > (unint64_t)v21)
      {
        objc_msgSend(v22, "substringToIndex:", v21 - 1);
        v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_25:
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), v22);

      v19 = (id)v27;
LABEL_29:

      if (++v20 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_30;
    }
    objc_msgSend(v16, "addObject:", v19);
    v26 = &stru_1E2548760;
LABEL_24:

    v22 = (void *)v26;
    goto LABEL_25;
  }
LABEL_30:
  if (objc_msgSend(v19, "length") || !objc_msgSend(v16, "count"))
    objc_msgSend(v16, "addObject:", v19);

  return v16;
}

- (id)_createText:(id)a3 width:(int64_t)a4 centered:(BOOL)a5 omitLeftPipe:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  double v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  unint64_t v22;
  double v23;
  unint64_t v24;
  __CFString *v25;
  void *v26;
  int64_t v28;
  id obj;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  AMSCommandLineDialogTask *v33;
  _BOOL4 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v6 = a6;
  v34 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[AMSCommandLineDialogTask dialogPadding](self, "dialogPadding");
  v11 = v10;
  v35 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v33 = self;
  -[AMSCommandLineDialogTask _createLinesFromText:width:](self, "_createLinesFromText:width:", v9, a4);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = CFSTR("|");
    if (v6)
      v15 = &stru_1E2548760;
    else
      v15 = CFSTR("|");
    v31 = (__CFString *)v15;
    v32 = *(_QWORD *)v37;
    v28 = a4 - (uint64_t)(v11 * 2.0 + 2.0);
    if (v6)
      v14 = CFSTR(" |");
    v30 = (__CFString *)v14;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[AMSCommandLineDialogTask dialogPadding](v33, "dialogPadding");
        objc_msgSend(&stru_1E2548760, "stringByPaddingToLength:withString:startingAtIndex:", (unint64_t)v18, CFSTR(" "), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v30;
        v21 = v31;
        v22 = objc_msgSend(v17, "length");
        if (v34)
        {
          v23 = ((double)v28 - (double)v22) * 0.5;
          v24 = vcvtpd_s64_f64(v23);
          objc_msgSend(&stru_1E2548760, "stringByPaddingToLength:withString:startingAtIndex:", vcvtmd_s64_f64(v23), CFSTR(" "), 0);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = v28 - v22;
          v25 = &stru_1E2548760;
        }
        objc_msgSend(&stru_1E2548760, "stringByPaddingToLength:withString:startingAtIndex:", v24, CFSTR(" "), 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "appendFormat:", CFSTR("%@%@%@%@%@%@%@\n"), v21, v19, v25, v17, v26, v19, v20);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);
  }

  return v35;
}

- (id)_createTextfieldWithTextfield:(id)a3 width:(int64_t)a4
{
  id v6;
  id v7;
  double v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[AMSCommandLineDialogTask dialogPadding](self, "dialogPadding");
  v9 = a4 - (uint64_t)(v8 * 2.0 + 2.0);
  objc_msgSend(&stru_1E2548760, "stringByPaddingToLength:withString:startingAtIndex:", v9 - 2, CFSTR("-"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCommandLineDialogTask _createText:width:centered:omitLeftPipe:](self, "_createText:width:centered:omitLeftPipe:", v10, a4, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v23 = v6;
  if (v13)
  {
    objc_msgSend(v12, "stringWithFormat:", CFSTR("| %@"), v13, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "placeholder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("| %@"), v16, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "stringByPaddingToLength:withString:startingAtIndex:", v9 - 1, CFSTR(" "), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSCommandLineDialogTask _createText:width:centered:omitLeftPipe:](self, "_createText:width:centered:omitLeftPipe:", v18, a4, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v19);

  objc_msgSend(&stru_1E2548760, "stringByPaddingToLength:withString:startingAtIndex:", v9 - 2, CFSTR("-"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCommandLineDialogTask _createText:width:centered:omitLeftPipe:](self, "_createText:width:centered:omitLeftPipe:", v20, a4, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v21);

  return v7;
}

- (int64_t)_gatherButtonInput
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", CFSTR("NOTE: Skipping button input while running in unit tests.\n      Automatically selecting the first button...\n"));
    return 0;
  }
  -[AMSCommandLineDialogTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", CFSTR("Press <return> to continue..."));
    v12 = -[AMSCommandLineDialogTask _getUserInput](self, "_getUserInput");
    return 0;
  }
  while (1)
  {
    -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", CFSTR("Select a button: "));
    -[AMSCommandLineDialogTask _getUserInput](self, "_getUserInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    v8 = v7 - 1;
    if (v7 >= 1)
    {
      -[AMSCommandLineDialogTask request](self, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "buttonActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v8 < v11)
        break;
    }
    -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", CFSTR("Invalid input detected!\n"));

  }
  return v8;
}

- (id)_gatherTextfieldInput
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  AMSCommandLineDialogTask *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[1000];
  termios v36;
  termios v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
  {
    -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", CFSTR("NOTE: Skipping textfield input while running in unit tests.\n"));
    return 0;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[AMSCommandLineDialogTask request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (!v7)
    goto LABEL_23;
  v8 = v7;
  v9 = 0x1E0CB3000uLL;
  v30 = *(_QWORD *)v32;
  v27 = self;
  do
  {
    v10 = 0;
    v28 = v8;
    do
    {
      if (*(_QWORD *)v32 != v30)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      v14 = *(void **)(v9 + 2368);
      objc_msgSend(v11, "placeholder");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v13)
      {
        objc_msgSend(v11, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Enter response for '%@' textfield [%@]: "), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Enter response for '%@' textfield: "), v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", v18);
      if (objc_msgSend(v11, "secure"))
      {
        memset(&v37, 0, sizeof(v37));
        memset(&v36, 0, sizeof(v36));
        tcgetattr(0, &v37);
        v36 = v37;
        v37.c_lflag &= ~8uLL;
        tcsetattr(0, 0, &v37);
        scanf("%s", v35);
        objc_msgSend(*(id *)(v9 + 2368), "stringWithUTF8String:", v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        tcsetattr(0, 0, &v36);
        -[AMSCommandLineDialogTask _printMessage:](self, "_printMessage:", CFSTR("\n"));
      }
      else
      {
        -[AMSCommandLineDialogTask _getUserInput](self, "_getUserInput");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {

LABEL_18:
        goto LABEL_19;
      }
      v22 = v9;
      v23 = v4;
      objc_msgSend(v11, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (v25)
      {
        objc_msgSend(v11, "text");
        v20 = v19;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v23;
        v9 = v22;
        self = v27;
        v8 = v28;
        goto LABEL_18;
      }
      v4 = v23;
      v9 = v22;
      self = v27;
      v8 = v28;
LABEL_19:
      objc_msgSend(v4, "addObject:", v19);

      ++v10;
    }
    while (v8 != v10);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    v8 = v26;
  }
  while (v26);
LABEL_23:

  return v4;
}

- (id)_getUserInput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_printMessage:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeData:", v4);

}

- (AMSDialogRequest)request
{
  return self->_request;
}

- (double)maximumDialogWidth
{
  return self->_maximumDialogWidth;
}

- (void)setMaximumDialogWidth:(double)a3
{
  self->_maximumDialogWidth = a3;
}

- (double)minimumDialogWidth
{
  return self->_minimumDialogWidth;
}

- (void)setMinimumDialogWidth:(double)a3
{
  self->_minimumDialogWidth = a3;
}

- (double)dialogPadding
{
  return self->_dialogPadding;
}

- (void)setDialogPadding:(double)a3
{
  self->_dialogPadding = a3;
}

- (int64_t)automaticButtonSelection
{
  return self->_automaticButtonSelection;
}

- (void)setAutomaticButtonSelection:(int64_t)a3
{
  self->_automaticButtonSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
