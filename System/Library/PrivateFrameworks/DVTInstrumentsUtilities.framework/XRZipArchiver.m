@implementation XRZipArchiver

+ (id)flatUnarchiveFileAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t open_filename;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  char v67;
  int next_header;
  int v69;
  void *v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (**v90)(_QWORD);
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  _QWORD v122[6];

  v7 = a3;
  v8 = a4;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentDirectoryPath(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v8, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v23, v29, (uint64_t)v28, 1, 0, 0);

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v8, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_changeCurrentDirectoryPath_(v34, v40, (uint64_t)v39, v41, v42);

  if ((v43 & 1) != 0)
  {
    v122[5] = 0;
    v47 = archive_read_new();
    archive_read_support_format_all();
    archive_read_support_filter_all();
    v122[0] = MEMORY[0x24BDAC760];
    v122[1] = 3221225472;
    v122[2] = sub_22634E834;
    v122[3] = &unk_24EDC2C78;
    v122[4] = v47;
    v120 = v7;
    v121 = MEMORY[0x227696724](v122);
    objc_msgSend_path(v7, v48, v49, v50, v51);
    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v52, v53, v54, v55, v56);
    open_filename = archive_read_open_filename();

    if ((_DWORD)open_filename)
    {
      v59 = archive_error_string();
      if (v59)
      {
        objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v58, v59, 1, v61);
        v65 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v120;
      }
      else
      {
        v7 = v120;
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v58, (uint64_t)CFSTR("Failed to open archive at URL: %@ with code: %d"), v60, v61, v120, open_filename);
        v65 = (id)objc_claimAutoreleasedReturnValue();
      }
      v90 = (void (**)(_QWORD))v121;
      if (a5)
      {
        objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v62, (uint64_t)CFSTR("%@"), v63, v64, v65);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_21:
      v90[2](v90);
LABEL_22:

      v66 = 0;
    }
    else
    {
      v65 = 0;
      v67 = 1;
      while (1)
      {
        next_header = archive_read_next_header();
        if (next_header == 1)
        {
          (*(void (**)(void))(v121 + 16))();
          v7 = v120;
          if (v65)
          {
            objc_msgSend_URLByAppendingPathComponent_(v8, v92, (uint64_t)v65, v93, v94);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v95, v96, v97, v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_changeCurrentDirectoryPath_(v99, v100, (uint64_t)v18, v101, v102);

          }
          else if (a5)
          {
            objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v92, (uint64_t)CFSTR("Unarchiving file failed at URL: %@"), v93, v94, v120);
            v66 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v66 = 0;
          }
          v90 = (void (**)(_QWORD))v121;
          goto LABEL_23;
        }
        v69 = next_header;
        if ((v67 & 1) != 0)
        {
          v70 = v18;
          v71 = (void *)MEMORY[0x24BDD17C8];
          v72 = archive_entry_pathname();
          objc_msgSend_stringWithCString_encoding_(v71, v73, v72, 1, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastPathComponent(v75, v76, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = objc_retainAutorelease(v80);
          objc_msgSend_UTF8String(v65, v81, v82, v83, v84);
          archive_entry_set_pathname();

          v18 = v70;
        }
        if (v69 < 0)
          break;
        v85 = archive_read_extract();
        v89 = v85;
        if ((v85 & 0x80000000) != 0)
        {
          v112 = archive_error_string();
          if (v112)
          {
            objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v111, v112, 1, v114);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v120;
          }
          else
          {
            v119 = v89;
            v7 = v120;
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v111, (uint64_t)CFSTR("Failed to extract archive at URL: %@ with code: %d"), v113, v114, v120, v119);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v90 = (void (**)(_QWORD))v121;
          if (a5)
          {
            objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v115, (uint64_t)CFSTR("%@"), v116, v117, v118);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          (*(void (**)(uint64_t))(v121 + 16))(v121);

          goto LABEL_22;
        }
        v67 = 0;
        if ((_DWORD)v85 == 1)
        {
          v7 = v120;
          if (a5)
          {
            objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v86, (uint64_t)CFSTR("Encountered end of file when extracting archive at URL: %@"), v87, v88, v120);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          v90 = (void (**)(_QWORD))v121;
          goto LABEL_21;
        }
      }
      v103 = (void *)MEMORY[0x24BDD17C8];
      v104 = archive_error_string();
      objc_msgSend_stringWithCString_encoding_(v103, v105, v104, 1, v106);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v107, (uint64_t)CFSTR("%@"), v108, v109, v110);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v90 = (void (**)(_QWORD))v121;
      (*(void (**)(uint64_t))(v121 + 16))(v121);

      v66 = 0;
      v7 = v120;
    }
LABEL_23:

  }
  else if (a5)
  {
    objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v44, (uint64_t)CFSTR("Cannot unarchive file at URL: %@. Unable to change access output URL: %@"), v45, v46, v7, v8);
    v66 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = 0;
  }

  return v66;
}

+ (BOOL)flatArchiveFilesAtURLs:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  id v11;
  void (**v12)(_QWORD);
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  int v62;
  int v63;
  BOOL v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id *v70;
  id v71;
  void (**v72)(_QWORD);
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[5];
  stat v82;
  _BYTE v83[128];
  _BYTE v84[8192];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  memset(&v82, 0, sizeof(v82));
  v9 = archive_write_new();
  archive_write_set_format_zip();
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = sub_22634EC3C;
  v81[3] = &unk_24EDC2C78;
  v81[4] = v9;
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = sub_22634EC44;
  v78[3] = &unk_24EDC2CA0;
  v10 = (void (**)(_QWORD))(id)MEMORY[0x227696724](v81);
  v80 = v10;
  v11 = v8;
  v79 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x227696724](v78);
  objc_msgSend_path(v11, v13, v14, v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
  v22 = archive_write_open_filename();

  if ((_DWORD)v22)
  {
    v24 = archive_error_string();
    if (v24)
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v23, v24, 1, v26);
    else
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, (uint64_t)CFSTR("Failed to open archive for write at URL: %@ with code: %d"), v25, v26, v11, v22);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v65, (uint64_t)CFSTR("%@"), v66, v67, v68);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10[2](v10);

    v64 = 0;
  }
  else
  {
    v72 = v12;
    v73 = v11;
    v70 = a5;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v27 = v7;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v74, (uint64_t)v83, 16);
    if (v29)
    {
      v34 = v29;
      v35 = *(_QWORD *)v75;
      v71 = v7;
      while (2)
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v75 != v35)
            objc_enumerationMutation(v27);
          v37 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend_path(v37, v30, v31, v32, v33);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v43 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41, v42);
          if (stat(v43, &v82))
          {
            if (v70)
            {
              objc_msgSend_dvtiuErrorWithFormat_(MEMORY[0x24BDD1540], v44, (uint64_t)CFSTR("Cannot access information about file at URL: %@"), v45, v46, v37);
              *v70 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_22:
            v12 = v72;
            v72[2](v72);

            v64 = 0;
            v7 = v71;
            v11 = v73;
            goto LABEL_23;
          }
          archive_entry_new();
          objc_msgSend_lastPathComponent(v38, v47, v48, v49, v50);
          v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend_UTF8String(v51, v52, v53, v54, v55);
          archive_entry_set_pathname();

          archive_entry_set_size();
          archive_entry_set_filetype();
          archive_entry_set_perm();
          archive_write_header();
          v56 = objc_retainAutorelease(v38);
          v61 = (const char *)objc_msgSend_UTF8String(v56, v57, v58, v59, v60);
          v62 = open(v61, 0x1000000);
          if (v62 == -1)
            goto LABEL_22;
          v63 = v62;
          if (read(v62, v84, 0x2000uLL) >= 1)
          {
            do
              archive_write_data();
            while (read(v63, v84, 0x2000uLL) > 0);
          }
          close(v63);
          archive_entry_free();

        }
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v74, (uint64_t)v83, 16);
        v7 = v71;
        if (v34)
          continue;
        break;
      }
    }

    v10[2](v10);
    v64 = 1;
    v12 = v72;
    v11 = v73;
  }
LABEL_23:

  return v64;
}

@end
