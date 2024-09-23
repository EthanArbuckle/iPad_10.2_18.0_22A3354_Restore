@implementation CKLStreamLogMessageObserver

- (id)_colorString:(id)a3 withForeground:(unint64_t)a4
{
  char v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  __CFString *v10;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend_colorOutput(self, v7, v8))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("%sm%@\x1B[0m"), off_1E7832AE8[v4 & 7], v6);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E7838F48;
  }

  return v10;
}

- (void)eventMatched:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  void *v94;
  const char *v95;
  id v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  void *v100;
  id v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;

  v128 = a3;
  objc_msgSend_processImagePath(v128, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__processNameForPath_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_senderImagePath(v128, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__processNameForPath_(self, v12, (uint64_t)v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_timeZone(v128, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_timeZone(v128, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formatter(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimeZone_(v19, v20, (uint64_t)v16);

  }
  objc_msgSend_composedMessage(v128, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasPrefix_(v21, v22, (uint64_t)CFSTR("SIM: ")))
  {
    objc_msgSend_substringFromIndex_(v21, v23, 5);
    v25 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v25;
  }
  v26 = objc_msgSend_colorOutput(self, v23, v24);
  v29 = (void *)MEMORY[0x1E0CB3940];
  if (v26)
  {
    v30 = objc_msgSend_threadIdentifier(v128, v27, v28);
    objc_msgSend_stringWithFormat_(v29, v31, (uint64_t)CFSTR("%lu"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_threadIdentifier(v128, v33, v34);
    objc_msgSend__colorString_withForeground_(self, v36, (uint64_t)v32, v35);
    v37 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0CB3940];
    v41 = objc_msgSend_activityIdentifier(v128, v39, v40);
    objc_msgSend_stringWithFormat_(v38, v42, (uint64_t)CFSTR("%lu"), v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend_activityIdentifier(v128, v44, v45);
    objc_msgSend__colorString_withForeground_(self, v47, (uint64_t)v43, v46);
    v48 = objc_claimAutoreleasedReturnValue();

    v49 = (void *)MEMORY[0x1E0CB3940];
    v52 = objc_msgSend_parentActivityIdentifier(v128, v50, v51);
    objc_msgSend_stringWithFormat_(v49, v53, (uint64_t)CFSTR("%lu"), v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_parentActivityIdentifier(v128, v55, v56);
    objc_msgSend__colorString_withForeground_(self, v58, (uint64_t)v54, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v125 = (void *)v48;
    v126 = (void *)v37;
    if (objc_msgSend_type(v128, v60, v61) == 1024
      && (objc_msgSend_logType(v128, v62, v63) == 16 || objc_msgSend_logType(v128, v64, v65) == 17))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v64, (uint64_t)CFSTR("💩💩💩%@"), v21);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__colorString_withForeground_(self, v67, (uint64_t)v66, 0);
      v68 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v68;
    }
    v123 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_formatter(self, v69, v70);
    v71 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(v128, v72, v73);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v71, v74, (uint64_t)v124);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_hash(v8, v76, v77);
    objc_msgSend__colorString_withForeground_(self, v79, (uint64_t)v8, v78);
    v127 = v8;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend_processIdentifier(v128, v81, v82);
    v86 = objc_msgSend_parentActivityIdentifier(v128, v84, v85);
    objc_msgSend__colorString_withForeground_(self, v87, (uint64_t)CFSTR("|"), v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend_activityIdentifier(v128, v89, v90);
    objc_msgSend__colorString_withForeground_(self, v92, (uint64_t)CFSTR("|"), v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v125;
    v96 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v123, v95, (uint64_t)CFSTR("\x1B[1m\x1B[37m%@\x1B[0m %@[%d:%@:%@:%@]%@%@ %@"), v75, v80, v83, v126, v125, v59, v88, v93, v21));
    v99 = (const char *)objc_msgSend_UTF8String(v96, v97, v98);
    puts(v99);

    v8 = v127;
    v100 = v126;
  }
  else
  {
    v101 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_formatter(self, v102, v103);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(v128, v104, v105);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromDate_(v100, v106, (uint64_t)v94);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend_processIdentifier(v128, v107, v108);
    v112 = objc_msgSend_threadIdentifier(v128, v110, v111);
    v115 = objc_msgSend_activityIdentifier(v128, v113, v114);
    v118 = objc_msgSend_parentActivityIdentifier(v128, v116, v117);
    v71 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v101, v119, (uint64_t)CFSTR("%@ %@[%d:%llu:%llu:%llu] %@"), v59, v8, v109, v112, v115, v118, v21));
    v122 = (const char *)objc_msgSend_UTF8String(v71, v120, v121);
    puts(v122);
  }

}

@end
