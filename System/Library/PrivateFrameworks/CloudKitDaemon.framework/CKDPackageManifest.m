@implementation CKDPackageManifest

+ (BOOL)readContentsOfFile:(id)a3 intoPackage:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  id v26;
  id v27;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  BOOL v32;
  void *v33;
  id v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *Message;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  __int128 *p_buf;
  uint64_t *v71;
  uint64_t *v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[4];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  int v96;
  uint8_t v97[4];
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  id v102;
  __int128 buf;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isReadableFileAtPath_(v11, v12, (uint64_t)v7) & 1) != 0)
  {
    objc_msgSend_inputStreamWithFileAtPath_(MEMORY[0x1E0C99DB0], v13, (uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0D82BA0]);
    v17 = (void *)objc_msgSend_initWithStream_(v15, v16, (uint64_t)v14);
    objc_msgSend_open(v14, v18, v19);
    v20 = objc_opt_class();
    objc_msgSend_setClassOfNextMessage_(v17, v21, v20);
    v61 = v17;
    Message = (void *)objc_msgSend_nextMessage(v17, v22, v23);
    if (!Message)
    {
      if (a5)
      {
        objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v24, *MEMORY[0x1E0C947D8], 1000, v7, CFSTR("Failed reading package object from manifest"));
        v32 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
      }
      goto LABEL_34;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v104 = 0x2020000000;
    v105 = 0;
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v88[3] = 0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x2020000000;
    v87 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x2020000000;
    v83 = 0;
    v25 = (void *)objc_opt_new();
    v76 = 0;
    v77 = &v76;
    v78 = 0x2020000000;
    v79 = 0;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = sub_1BEBA3EE4;
    v63[3] = &unk_1E7836008;
    v26 = v8;
    v64 = v26;
    v65 = Message;
    v66 = v17;
    v69 = &v76;
    v27 = v7;
    v67 = v27;
    v60 = v25;
    v68 = v60;
    p_buf = &buf;
    v71 = &v80;
    v72 = &v93;
    v73 = v88;
    v74 = &v89;
    v75 = &v84;
    objc_msgSend_performTransactionBlock_(v26, v28, (uint64_t)v63);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      if (a5)
      {
        v31 = objc_retainAutorelease(v29);
        goto LABEL_6;
      }
LABEL_31:
      v32 = 0;
      goto LABEL_33;
    }
    v34 = v27;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v58 = v77[3];
      v59 = v85[3];
      *(_DWORD *)v97 = 134218498;
      v98 = v58;
      v99 = 2048;
      v100 = v59;
      v101 = 2112;
      v102 = v26;
      _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Read %ld items (%llu bytes) from manifest for package %@", v97, 0x20u);
    }
    if (*((_BYTE *)v81 + 24))
    {
      v90[3] = 0;
      v38 = *((_DWORD *)v94 + 6) + 1;
      *((_DWORD *)v94 + 6) = v38;
    }
    else
    {
      v38 = *((_DWORD *)v94 + 6);
      if (v90[3])
      {
        objc_msgSend_objectAtIndexedSubscript_(v60, v36, v38);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v45;
        if (a5)
        {
          v49 = (void *)MEMORY[0x1E0C94FF8];
          v50 = *((int *)v94 + 6);
          v51 = objc_msgSend_size(v45, v46, v47);
          objc_msgSend_errorWithDomain_code_path_format_(v49, v52, *MEMORY[0x1E0C947D8], 1000, v34, CFSTR("Package manifest is corrupt - section %lu contains %llu bytes, expected %llu bytes"), v50, v51, v90[3]);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_31;
      }
    }
    if (objc_msgSend_count(v60, v36, v37) == v38)
    {
      objc_msgSend_setSize_(v26, v39, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
      v32 = 1;
      goto LABEL_33;
    }
    if (!a5)
    {
      v32 = 0;
      goto LABEL_33;
    }
    v41 = (void *)MEMORY[0x1E0C94FF8];
    v42 = *((int *)v94 + 6);
    v43 = objc_msgSend_count(v60, v39, v40);
    objc_msgSend_errorWithDomain_code_path_format_(v41, v44, *MEMORY[0x1E0C947D8], 1000, v34, CFSTR("Package manifest is corrupt - Expected %lu sections, found %lu"), v42, v43);
    v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v32 = 0;
    *a5 = v31;
LABEL_33:

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(&buf, 8);
LABEL_34:

    goto LABEL_35;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C947D8], 1000, v7, CFSTR("File not readable"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v33 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v53 = v33;
    objc_msgSend_CKSanitizedPath(v7, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v56;
    _os_log_error_impl(&dword_1BE990000, v53, OS_LOG_TYPE_ERROR, "Couldn't read the package manifest at %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v32 = 0;
LABEL_35:

  return v32;
}

+ (id)packageInClientWithBasePath:(id)a3 contentsOfFile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0C94FC8];
  v9 = a4;
  objc_msgSend_packageInClientWithBasePath_error_(v8, v10, (uint64_t)a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend_readContentsOfFile_intoPackage_error_(a1, v12, (uint64_t)v9, v11, a5);

  if ((_DWORD)a5)
    v13 = v11;
  else
    v13 = 0;

  return v13;
}

+ (BOOL)writePackage:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  int v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  CKDPPackageManifestHeader *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  CKDPPackageManifestSection *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  id v65;
  void *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  CKDPPackageManifestItem *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  NSObject *log;
  id *v117;
  CKDPPackageManifestHeader *v118;
  void *v119;
  id v120;
  void *v121;
  id obj;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t buf[4];
  uint64_t v129;
  __int16 v130;
  id v131;
  __int16 v132;
  id v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_fileExistsAtPath_(v11, v12, (uint64_t)v8) & 1) != 0
    || (objc_msgSend_data(MEMORY[0x1E0C99D50], v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend_writeToFile_options_error_(v15, v16, (uint64_t)v8, 0, a5),
        v15,
        v17))
  {
    if ((objc_msgSend_isWritableFileAtPath_(v11, v13, (uint64_t)v8) & 1) != 0)
    {
      objc_msgSend_outputStreamToFileAtPath_append_(MEMORY[0x1E0C99E48], v18, (uint64_t)v8, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0D82BA8]);
      v22 = (void *)objc_msgSend_initWithOutputStream_(v20, v21, (uint64_t)v19);
      objc_msgSend_open(v19, v23, v24);
      v25 = objc_alloc_init(CKDPPackageManifestHeader);
      objc_msgSend_signature(v7, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSignature_(v25, v29, (uint64_t)v28);

      objc_msgSend_verificationKey(v7, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVerificationKey_(v25, v33, (uint64_t)v32);

      objc_msgSend_setVersion_(v25, v34, 1);
      if ((objc_msgSend_writeMessage_(v22, v35, (uint64_t)v25) & 1) != 0)
      {
        v117 = a5;
        v118 = v25;
        v123 = v22;
        v119 = v11;
        v120 = v8;
        v39 = objc_msgSend_sectionCount(v7, v36, v37);
        v121 = v19;
        if (v39 < 1)
        {
LABEL_21:
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v67 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v129 = v39;
            v130 = 2112;
            v131 = v7;
            _os_log_debug_impl(&dword_1BE990000, v67, OS_LOG_TYPE_DEBUG, "Wrote %ld sections to manifest for package %@", buf, 0x16u);
          }
          v70 = objc_msgSend_itemCount(v7, v68, v69);
          objc_msgSend_itemEnumerator(v7, v71, v72);
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v127 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v124, v134, 16);
          v112 = v70;
          if (v74)
          {
            v75 = v74;
            v76 = 0;
            v77 = 0;
            v78 = *(_QWORD *)v125;
            v79 = v70 - 1;
            v22 = v123;
            v115 = v7;
            v113 = v70 - 1;
LABEL_27:
            v80 = 0;
            v81 = v79 - v77;
            v114 = v75 + v77;
            while (1)
            {
              if (*(_QWORD *)v125 != v78)
                objc_enumerationMutation(obj);
              v82 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v80);
              v83 = (void *)MEMORY[0x1C3B83E24]();
              v84 = objc_alloc_init(CKDPPackageManifestItem);
              objc_msgSend_signature(v82, v85, v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setSignature_(v84, v88, (uint64_t)v87);

              v91 = objc_msgSend_size(v82, v89, v90);
              objc_msgSend_setSize_(v84, v92, v91);
              if (v81 == v80)
                objc_msgSend_setLastItem_(v84, v93, 1);
              if (!objc_msgSend_writeMessage_(v22, v93, (uint64_t)v84, v112))
                break;
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v95 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
              {
                log = v95;
                v101 = objc_msgSend_size(v82, v99, v100);
                objc_msgSend_signature(v82, v102, v103);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v129 = v101;
                v130 = 2112;
                v131 = v104;
                _os_log_debug_impl(&dword_1BE990000, log, OS_LOG_TYPE_DEBUG, "Wrote package item with size:%lld, signature:%@", buf, 0x16u);

                v22 = v123;
              }
              v76 += objc_msgSend_size(v82, v96, v97);

              objc_autoreleasePoolPop(v83);
              if (v75 == ++v80)
              {
                v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v124, v134, 16);
                v77 = v114;
                v7 = v115;
                v79 = v113;
                if (v75)
                  goto LABEL_27;
                goto LABEL_49;
              }
            }
            v8 = v120;
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v94, *MEMORY[0x1E0C947D8], 1000, v120, CFSTR("Failed writing item object to manifest"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v83);
            v7 = v115;
            if (!v105)
              goto LABEL_50;
            v19 = v121;
            v25 = v118;
            if (v117)
              *v117 = objc_retainAutorelease(v105);
            objc_msgSend_close(v121, v106, v107);

            LOBYTE(v17) = 0;
          }
          else
          {
            v76 = 0;
            v22 = v123;
LABEL_49:

            v8 = v120;
LABEL_50:
            v19 = v121;
            v25 = v118;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v108 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              v129 = v112;
              v130 = 2048;
              v131 = v76;
              v132 = 2112;
              v133 = v7;
              _os_log_debug_impl(&dword_1BE990000, v108, OS_LOG_TYPE_DEBUG, "Wrote %ld items (%llu bytes) to manifest for package %@", buf, 0x20u);
            }
            objc_msgSend_close(v121, v109, v110, v112);
            LOBYTE(v17) = 1;
          }
          v11 = v119;

        }
        else
        {
          v40 = 0;
          while (1)
          {
            objc_msgSend_sectionAtIndex_(v7, v38, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_alloc_init(CKDPPackageManifestSection);
            objc_msgSend_signature(v41, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSignature_(v42, v46, (uint64_t)v45);

            objc_msgSend_verificationKey(v41, v47, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setVerificationKey_(v42, v50, (uint64_t)v49);

            v53 = objc_msgSend_size(v41, v51, v52);
            objc_msgSend_setSize_(v42, v54, v53);
            if (v39 - 1 == v40)
              objc_msgSend_setLastSection_(v42, v55, 1);
            if ((objc_msgSend_writeMessage_(v123, v55, (uint64_t)v42) & 1) == 0)
              break;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v58 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              v59 = v58;
              v62 = objc_msgSend_size(v41, v60, v61);
              objc_msgSend_signature(v41, v63, v64);
              v65 = v7;
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v129 = v62;
              v130 = 2112;
              v131 = v66;
              _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Wrote package section with size:%lld, signature:%@", buf, 0x16u);

              v7 = v65;
              v19 = v121;

            }
            if (v39 == ++v40)
              goto LABEL_21;
          }
          if (v117)
          {
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v56, *MEMORY[0x1E0C947D8], 1000, v8, CFSTR("Failed writing section object to manifest"));
            *v117 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_close(v19, v56, v57);

          LOBYTE(v17) = 0;
          v25 = v118;
          v22 = v123;
        }
      }
      else if (a5)
      {
        objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v36, *MEMORY[0x1E0C947D8], 1000, v8, CFSTR("Failed writing package object to manifest"));
        LOBYTE(v17) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else if (a5)
    {
      objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v18, *MEMORY[0x1E0C947D8], 1000, v8, CFSTR("File not writable"));
      LOBYTE(v17) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

@end
