@implementation CKPrettyError

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKPrettyError;
  -[CKPrettyError dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  if (byte_1EDF6A0E0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    objc_msgSend_setClassName_forClass_(v4, v8, (uint64_t)v6, v7);

  }
  v9.receiver = self;
  v9.super_class = (Class)CKPrettyError;
  -[CKPrettyError encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);

}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v17;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&v17);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v14, (uint64_t)v10, a4, 0, 0, 0, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 path:(id)a7 URL:(id)a8 description:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v23 = objc_msgSend_mutableCopy(a5, v20, v21, v22);
  v25 = (void *)v23;
  if (!v16 && !v17 && !v18 && !v19)
    goto LABEL_14;
  if (!v23)
  {
    v25 = (void *)objc_opt_new();
    if (!v16)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v16)
LABEL_7:
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v16, *MEMORY[0x1E0CB3388]);
LABEL_8:
  if (v17)
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v17, *MEMORY[0x1E0CB2AA0]);
  if (v18)
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v18, *MEMORY[0x1E0CB3308]);
  if (v19)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v19, *MEMORY[0x1E0CB2D50]);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v19, (uint64_t)CFSTR("CKErrorDescription"));
  }
LABEL_14:
  objc_msgSend_errorWithDomain_code_userInfo_(a1, v24, (uint64_t)v15, a4, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CKPrettyError;
  objc_msgSendSuper2(&v6, sel_errorWithDomain_code_userInfo_, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)CKPartialErrorDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  int isEqualToString;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  int v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  void *v116;

  objc_msgSend_domain(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v5, v6, (uint64_t)CFSTR("CKInternalErrorDomain"), v7);

  objc_msgSend_CKStringForWellKnownCKErrors(self, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37A0];
  v116 = (void *)v12;
  if (v12)
  {
    v17 = v12;
    if (isEqualToString)
      v18 = CFSTR("CKUnderlyingError");
    else
      v18 = CFSTR("CKError");
    v19 = objc_msgSend_code(self, v13, v14, v15);
    objc_msgSend_stringWithFormat_(v16, v20, (uint64_t)CFSTR("<%@ %p: \"%@\" (%ld"), v21, v18, self, v17, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_domain(self, v13, v14, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_code(self, v27, v28, v29);
    objc_msgSend_stringWithFormat_(v16, v31, (uint64_t)CFSTR("<NSError %p: (%@:%ld"), v32, self, v26, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_userInfo(self, v22, v23, v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v33, v34, *MEMORY[0x1E0CB3388], v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v36;
  if (v36)
  {
    objc_msgSend_domain(v36, v37, v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_isEqualToString_(v41, v42, (uint64_t)CFSTR("CKInternalErrorDomain"), v43);

    if (v44)
    {
      v48 = objc_msgSend_code(v40, v45, v46, v47);
      objc_msgSend_appendFormat_(v25, v49, (uint64_t)CFSTR("/%ld"), v50, v48);
    }
    else
    {
      objc_msgSend_domain(v40, v45, v46, v47);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_code(v40, v52, v53, v54);
      objc_msgSend_appendFormat_(v25, v56, (uint64_t)CFSTR("/%@:%ld"), v57, v51, v55);

    }
  }
  objc_msgSend_appendString_(v25, v37, (uint64_t)CFSTR(")"), v39);
  objc_msgSend_objectForKeyedSubscript_(v33, v58, (uint64_t)CFSTR("ServerErrorDescription"), v59);
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v63 = (void *)v60;
    objc_msgSend_appendFormat_(v25, v61, (uint64_t)CFSTR("; server message = \"%@\"), v62, v60);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend_objectForKeyedSubscript_(v33, v61, (uint64_t)CFSTR("CKErrorDescription"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63
    || (objc_msgSend_userInfo(v40, v64, v65, v66),
        v67 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v67, v68, *MEMORY[0x1E0CB2D50], v69),
        v63 = (void *)objc_claimAutoreleasedReturnValue(),
        v67,
        v63))
  {
    objc_msgSend_appendFormat_(v25, v64, (uint64_t)CFSTR("; \"%@\"), v66, v63);
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend_objectForKeyedSubscript_(v33, v64, (uint64_t)CFSTR("ClientEtag"), v66);
  v70 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v70;
  if (v70)
    objc_msgSend_appendFormat_(v25, v71, (uint64_t)CFSTR("; clientEtag = %@"), v72, v70);
  objc_msgSend_objectForKeyedSubscript_(v33, v71, (uint64_t)CFSTR("ServerEtag"), v72);
  v74 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)v74;
  if (v74)
    objc_msgSend_appendFormat_(v25, v75, (uint64_t)CFSTR("; serverEtag = %@"), v76, v74);
  objc_msgSend_objectForKeyedSubscript_(v33, v75, (uint64_t)CFSTR("OperationID"), v76);
  v78 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)v78;
  if (v78)
    objc_msgSend_appendFormat_(v25, v79, (uint64_t)CFSTR("; op = %@"), v80, v78);
  objc_msgSend_objectForKeyedSubscript_(v33, v79, (uint64_t)CFSTR("RequestUUID"), v80);
  v82 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v82;
  if (v82)
    objc_msgSend_appendFormat_(v25, v83, (uint64_t)CFSTR("; uuid = %@"), v84, v82);
  objc_msgSend_objectForKeyedSubscript_(v33, v83, *MEMORY[0x1E0CB3308], v84);
  v86 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v86;
  if (v86)
    objc_msgSend_appendFormat_(v25, v87, (uint64_t)CFSTR("; URL = %@"), v89, v86);
  objc_msgSend_domain(v40, v87, v88, v89);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend_isEqualToString_(v91, v92, *MEMORY[0x1E0CB32E8], v93);

  if (v94)
  {
    objc_msgSend_userInfo(v40, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v98, v99, (uint64_t)CFSTR("_NSURLErrorFailingURLSessionTaskErrorKey"), v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
      objc_msgSend_appendFormat_(v25, v102, (uint64_t)CFSTR("; task = %@"), v103, v101);

  }
  objc_msgSend_objectForKeyedSubscript_(v33, v95, (uint64_t)CFSTR("CKRetryAfter"), v97);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_doubleValue(v106, v104, v107, v105);
    objc_msgSend_appendFormat_(v25, v108, (uint64_t)CFSTR("; Retry after %0.1f seconds"), v109, v110);
  }
  objc_msgSend_objectForKeyedSubscript_(v33, v104, 0x1E1F6A0F0, v105);
  v111 = objc_claimAutoreleasedReturnValue();
  v114 = (void *)v111;
  if (v111)
    objc_msgSend_appendFormat_(v25, v112, (uint64_t)CFSTR("; SQLite error: %@"), v113, v111);

  return v25;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  CKPrettyError *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  CKPrettyError *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v74;
  id obj;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v4 = self;
  v81 = *MEMORY[0x1E0C80C00];
  objc_msgSend_CKPartialErrorDescription(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userInfo(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("ContainerID"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_userInfo(v4, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)CFSTR("ContainerID"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v5, v20, (uint64_t)CFSTR("; container ID = \"%@\"), v21, v19);

  }
  objc_msgSend_userInfo(v4, v13, v14, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("CKPartialErrors"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_24;
  objc_msgSend_appendFormat_(v5, v26, (uint64_t)CFSTR("; partial errors: {\n"), v27);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend_userInfo(v4, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)CFSTR("CKPartialErrors"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v76, (uint64_t)v80, 16);
  if (!v40)
  {

    goto LABEL_23;
  }
  v44 = v40;
  v45 = v5;
  v74 = 0;
  obj = v38;
  v46 = *(_QWORD *)v77;
  do
  {
    for (i = 0; i != v44; ++i)
    {
      if (*(_QWORD *)v77 != v46)
        objc_enumerationMutation(obj);
      v48 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      v49 = v4;
      objc_msgSend_userInfo(v4, v41, v42, v43);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v50, v51, (uint64_t)CFSTR("CKPartialErrors"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v53, v54, (uint64_t)v48, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend_code(v56, v57, v58, v59) == 22)
        {
          v74 = (v74 + 1);
          v4 = v49;
          goto LABEL_18;
        }
        objc_msgSend_CKPartialErrorDescription(v56, v60, v61, v62);
        v63 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_description(v56, v57, v58, v59);
        v63 = objc_claimAutoreleasedReturnValue();
      }
      v64 = (void *)v63;
      v4 = v49;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_ckShortDescription(v48, v65, v66, v67);
      else
        objc_msgSend_description(v48, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v45, v69, (uint64_t)CFSTR("\t%@ = %@>\n"), v70, v68, v64);

LABEL_18:
    }
    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v76, (uint64_t)v80, 16);
  }
  while (v44);

  v5 = v45;
  if ((_DWORD)v74)
    objc_msgSend_appendFormat_(v45, v71, (uint64_t)CFSTR("\t... %d \"Batch Request Failed\" CKErrors omitted ...\n"), v72, v74);
LABEL_23:
  objc_msgSend_appendFormat_(v5, v71, (uint64_t)CFSTR("}"), v72);
LABEL_24:
  objc_msgSend_appendString_(v5, v26, (uint64_t)CFSTR(">"), v27);
  return v5;
}

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 1);

}

+ (id)databaseCorruptError
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("SQLCode");
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, 11, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("SQLExtendedCode");
  v14[0] = v4;
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v14, (uint64_t)v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_format_(a1, v10, (uint64_t)CFSTR("CKInternalErrorDomain"), 1027, v9, CFSTR("%@"), CFSTR("database corrupt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorForSQLite:(sqlite3 *)a3 message:(id)a4 args:(char *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = sqlite3_errcode(a3);
  v10 = sqlite3_extended_errcode(a3);
  v11 = sqlite3_errmsg(a3);
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("SQLCode");
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v15, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v29[1] = CFSTR("SQLExtendedCode");
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v18, v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = CFSTR("SQLErrorMessage");
  v30[1] = v20;
  v30[2] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v30, (uint64_t)v29, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  v25 = (void *)objc_msgSend_initWithFormat_arguments_(v23, v24, (uint64_t)v8, (uint64_t)a5);

  objc_msgSend_errorWithDomain_code_userInfo_format_(a1, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 1027, v22, CFSTR("%@"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)errorForSQLite:(sqlite3 *)a3 message:(id)a4
{
  uint64_t v5;

  objc_msgSend_errorForSQLite_message_args_(a1, a2, (uint64_t)a3, (uint64_t)a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)testError
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)"testing", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("SQLCode");
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, 13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v16[1] = CFSTR("SQLExtendedCode");
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v8, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = CFSTR("SQLErrorMessage");
  v17[1] = v10;
  v17[2] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v17, (uint64_t)v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_format_(a1, v13, (uint64_t)CFSTR("CKInternalErrorDomain"), 1027, v12, CFSTR("%@"), CFSTR("test error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v14;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = [v6 alloc];
  v10 = (void *)objc_msgSend_initWithFormat_arguments_(v8, v9, (uint64_t)v7, (uint64_t)&v14);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v11, (uint64_t)CFSTR("CKErrorDomain"), a3, 0, 0, 0, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4 format:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v17;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a4;
  v11 = [v8 alloc];
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&v17);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v14, (uint64_t)CFSTR("CKErrorDomain"), a3, v10, 0, 0, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)itemErrorFromError:(id)a3 forID:(id)a4
{
  return (id)objc_msgSend_CKItemErrorForID_(a3, a2, (uint64_t)a4, (uint64_t)a4);
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 format:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v20;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = [v10 alloc];
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v20);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, v12, 0, 0, 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v20;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = [v10 alloc];
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v20);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, 0, 0, v12, 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 format:(id)a7
{
  uint64_t v8;

  objc_msgSend_errorWithDomain_code_userInfo_error_format_arguments_(a1, a2, (uint64_t)a3, a4, a5, a6, a7, &v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 format:(id)a7 arguments:(char *)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;

  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  v19 = [v14 alloc];
  v21 = (void *)objc_msgSend_initWithFormat_arguments_(v19, v20, (uint64_t)v15, (uint64_t)a8);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v22, (uint64_t)v18, a4, v17, v16, 0, 0, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 format:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v20;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = [v10 alloc];
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v20);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, 0, v12, 0, 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5 format:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v20;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = [v10 alloc];
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v20);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, 0, 0, 0, v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 path:(id)a6 format:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v23;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = [v12 alloc];
  v19 = (void *)objc_msgSend_initWithFormat_arguments_(v17, v18, (uint64_t)v13, (uint64_t)&v23);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v20, (uint64_t)v16, a4, 0, v15, v14, 0, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 URL:(id)a6 format:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v23;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = [v12 alloc];
  v19 = (void *)objc_msgSend_initWithFormat_arguments_(v17, v18, (uint64_t)v13, (uint64_t)&v23);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v20, (uint64_t)v16, a4, 0, v15, 0, v14, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)secureCodableError:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend_userInfo(v4, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v73, (uint64_t)v78, 16);
    if (v11)
    {
      v15 = v11;
      v16 = *(_QWORD *)v74;
      v67 = *MEMORY[0x1E0CB2F70];
      v68 = *MEMORY[0x1E0CB3388];
      v64 = v5;
      v65 = v4;
      v62 = *(_QWORD *)v74;
      v63 = v9;
      do
      {
        v17 = 0;
        v66 = v15;
        do
        {
          if (*(_QWORD *)v74 != v16)
            objc_enumerationMutation(v9);
          v18 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v17);
          objc_msgSend_userInfo(v4, v12, v13, v14, v62, v63);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v18, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend_isEqualToString_(v18, v23, v68, v24) & 1) != 0
            || objc_msgSend_isEqualToString_(v18, v25, (uint64_t)CFSTR("CKFunctionError"), v26))
          {
            objc_msgSend_secureCodableError_(a1, v25, (uint64_t)v22, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v5, v28, (uint64_t)v27, (uint64_t)v18);

          }
          else if (objc_msgSend_isEqualToString_(v18, v25, v67, v26))
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v29, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v33 = v22;
            v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v69, (uint64_t)v77, 16);
            if (v35)
            {
              v38 = v35;
              v39 = *(_QWORD *)v70;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v70 != v39)
                    objc_enumerationMutation(v33);
                  objc_msgSend_secureCodableError_(a1, v36, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i), v37);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObject_(v32, v42, (uint64_t)v41, v43);

                }
                v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v69, (uint64_t)v77, 16);
              }
              while (v38);
            }

            v5 = v64;
            objc_msgSend_setObject_forKeyedSubscript_(v64, v44, (uint64_t)v32, (uint64_t)v18);

            v4 = v65;
            v16 = v62;
            v9 = v63;
            v15 = v66;
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0
                 && objc_msgSend_supportsSecureCoding(v22, v45, v46, v47))
          {
            objc_msgSend_setObject_forKeyedSubscript_(v5, v48, (uint64_t)v22, (uint64_t)v18);
          }

          ++v17;
        }
        while (v17 != v15);
        v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v73, (uint64_t)v78, 16);
        v15 = v49;
      }
      while (v49);
    }

    v50 = objc_alloc((Class)a1);
    objc_msgSend_domain(v4, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_code(v4, v55, v56, v57);
    v60 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v50, v59, (uint64_t)v54, v58, v5);

  }
  else
  {
    v60 = 0;
  }

  return v60;
}

+ (id)undeprecatedDescriptionForError:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __CFString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;

  v7 = a3;
  if (v7)
  {
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v4, v5, v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v7, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v12;
    if (v12)
      objc_msgSend_appendString_(v8, v13, v12, v14);
    else
      objc_msgSend_appendString_(v8, v13, (uint64_t)CFSTR("Unknown error"), v14);
    objc_msgSend_userInfo(v7, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v19, v20, *MEMORY[0x1E0CB2AA0], v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend_appendFormat_(v8, v23, (uint64_t)CFSTR(" at path \"%@\"), v25, v22);
    objc_msgSend_userInfo(v7, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v26, v27, *MEMORY[0x1E0CB3308], v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend_appendFormat_(v8, v30, (uint64_t)CFSTR(" for URL \"%@\"), v32, v29);
    objc_msgSend_domain(v7, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_code(v7, v34, v35, v36);
    objc_msgSend_appendFormat_(v8, v38, (uint64_t)CFSTR(" (%@/%d)"), v39, v33, v37);

    objc_msgSend_userInfo(v7, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v43, v44, *MEMORY[0x1E0CB3388], v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend_undeprecatedDescriptionForError_(a1, v47, (uint64_t)v46, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v8, v51, (uint64_t)CFSTR(". Underlying error: %@"), v52, v50);

    }
    objc_msgSend_userInfo(v7, v47, v48, v49);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v53, v54, (uint64_t)CFSTR("kMMCSErrorUnderlyingErrorArrayKey"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v79 = v46;
      v80 = v29;
      v81 = v22;
      v82 = v15;
      v60 = objc_msgSend_count(v56, v57, v58, v59);
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v61, v62, v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60 >= 3)
        v67 = 3;
      else
        v67 = v60;
      if (v67)
      {
        for (i = 0; i != v67; ++i)
        {
          objc_msgSend_objectAtIndexedSubscript_(v56, v64, i, v65);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_undeprecatedDescriptionForError_(a1, v70, (uint64_t)v69, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v66, v73, (uint64_t)v72, v74);

        }
      }
      if (v60 > 3)
        objc_msgSend_addObject_(v66, v64, (uint64_t)CFSTR("..."), v65);
      objc_msgSend_componentsJoinedByString_(v66, v64, (uint64_t)CFSTR(", "), v65);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v8, v76, (uint64_t)CFSTR(". Underlying MMCS errors: [%@]"), v77, v75);

      v22 = v81;
      v15 = v82;
      v46 = v79;
      v29 = v80;
    }
    objc_msgSend_appendString_(v8, v57, (uint64_t)CFSTR("."), v59);

  }
  else
  {
    v8 = CFSTR("(null)");
  }

  return v8;
}

+ (id)combinedErrorFromErrors:(id)a3 topLevelErrorMessage:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void *v13;
  const char *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_18A8001B8;
  v28 = sub_18A8001C8;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A8001D0;
  v16[3] = &unk_1E1F66478;
  v8 = v7;
  v17 = v8;
  v18 = &v24;
  v19 = &v20;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v9, (uint64_t)v16, v10);
  if (*((_BYTE *)v21 + 24))
  {
    v12 = (id)v25[5];
  }
  else
  {
    v30 = CFSTR("CKPartialErrors");
    v31[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v31, (uint64_t)&v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v14, (uint64_t)CFSTR("CKErrorDomain"), 2, v13, CFSTR("%@"), v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

+ (id)errorForAccountStatus:(int64_t)a3
{
  void *v3;
  const __CFString *v4;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = CFSTR("Could not determine iCloud account status");
      goto LABEL_5;
    case 2:
      v4 = CFSTR("iCloud account is restricted");
      goto LABEL_5;
    case 3:
      v4 = CFSTR("iCloud account is not available");
LABEL_5:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, a2, (uint64_t)CFSTR("CKErrorDomain"), 9, v4);
      goto LABEL_7;
    case 4:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, a2, (uint64_t)CFSTR("CKErrorDomain"), 36, CFSTR("iCloud account is temporarily not available"));
LABEL_7:
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

@end
