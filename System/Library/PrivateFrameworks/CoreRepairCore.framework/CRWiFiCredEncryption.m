@implementation CRWiFiCredEncryption

+ (id)encryptUserData:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  rsize_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  _BYTE __buf[16];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  arc4random_buf(__buf, 0x10uLL);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v4, (uint64_t)__buf, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    sub_21455C30C();
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDBCEC8];
      v11 = objc_msgSend_length(v3, v6, v7, v8);
      objc_msgSend_dataWithLength_(v10, v12, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v15, 16, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_retainAutorelease(v9);
      objc_msgSend_bytes(v18, v19, v20, v21);
      objc_msgSend_length(v18, v22, v23, v24);
      v90 = v5;
      v25 = objc_retainAutorelease(v5);
      objc_msgSend_bytes(v25, v26, v27, v28);
      objc_msgSend_length(v25, v29, v30, v31);
      v91 = v3;
      v32 = objc_retainAutorelease(v3);
      objc_msgSend_bytes(v32, v33, v34, v35);
      v39 = objc_msgSend_length(v32, v36, v37, v38);
      v40 = objc_retainAutorelease(v14);
      v44 = objc_msgSend_mutableBytes(v40, v41, v42, v43);
      v45 = objc_retainAutorelease(v17);
      v89 = objc_msgSend_mutableBytes(v45, v46, v47, v48);
      v88 = v39;
      v49 = CCCryptorGCMOneshotEncrypt();
      v50 = objc_retainAutorelease(v18);
      v54 = (void *)objc_msgSend_mutableBytes(v50, v51, v52, v53, v88, v44, v89, 16);
      v58 = objc_msgSend_length(v50, v55, v56, v57);
      memset_s(v54, 0x20uLL, 0, v58);
      if ((_DWORD)v49)
      {
        handleForCategory(0);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          sub_214571BE4(v49, v62, v63, v64, v65, v66, v67, v68);
        v69 = 0;
      }
      else
      {
        v70 = (void *)MEMORY[0x24BDBCEC8];
        v71 = objc_msgSend_length(v25, v59, v60, v61);
        v75 = objc_msgSend_length(v40, v72, v73, v74);
        objc_msgSend_dataWithCapacity_(v70, v76, v71 + v75 + 16, v77);
        v62 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendData_(v62, v78, (uint64_t)v45, v79);
        objc_msgSend_appendData_(v62, v80, (uint64_t)v25, v81);
        objc_msgSend_appendData_(v62, v82, (uint64_t)v40, v83);
        v69 = (void *)objc_msgSend_copy(v62, v84, v85, v86);
      }
      v5 = v90;
      v3 = v91;

    }
    else
    {
      handleForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_214571BB8();
      v69 = 0;
    }

  }
  else
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_214571B8C();
    v69 = 0;
  }

  return v69;
}

+ (id)decryptUserData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  rsize_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  void *v80;
  void *v81;

  v3 = a3;
  if ((unint64_t)objc_msgSend_length(v3, v4, v5, v6) > 0x1F)
  {
    objc_msgSend_subdataWithRange_(v3, v7, 0, 16);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_subdataWithRange_(v3, v10, 16, 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_length(v3, v12, v13, v14);
    objc_msgSend_subdataWithRange_(v3, v16, 32, v15 - 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_21455C30C();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDBCEC8];
      v23 = objc_msgSend_length(v17, v18, v19, v20);
      objc_msgSend_dataWithLength_(v22, v24, v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_retainAutorelease(v21);
      objc_msgSend_bytes(v27, v28, v29, v30);
      objc_msgSend_length(v27, v31, v32, v33);
      v81 = v11;
      v34 = objc_retainAutorelease(v11);
      objc_msgSend_bytes(v34, v35, v36, v37);
      objc_msgSend_length(v34, v38, v39, v40);
      v80 = v17;
      v41 = objc_retainAutorelease(v17);
      objc_msgSend_bytes(v41, v42, v43, v44);
      v48 = objc_msgSend_length(v41, v45, v46, v47);
      v49 = objc_retainAutorelease(v26);
      v53 = objc_msgSend_mutableBytes(v49, v50, v51, v52);
      v54 = objc_retainAutorelease(v8);
      v79 = objc_msgSend_bytes(v54, v55, v56, v57);
      v58 = CCCryptorGCMOneshotDecrypt();
      v59 = objc_retainAutorelease(v27);
      v63 = (void *)objc_msgSend_mutableBytes(v59, v60, v61, v62, v48, v53, v79, 16);
      v67 = objc_msgSend_length(v59, v64, v65, v66);
      memset_s(v63, 0x20uLL, 0, v67);
      if ((_DWORD)v58)
      {
        handleForCategory(0);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          sub_214571D04(v58, v71, v72, v73, v74, v75, v76, v77);

        v49 = 0;
      }
      v17 = v80;
      v11 = v81;
      v9 = (void *)objc_msgSend_copy(v49, v68, v69, v70);
    }
    else
    {
      handleForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_214571BB8();
      v9 = 0;
    }

  }
  else
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_214571CD8();
    v9 = 0;
  }

  return v9;
}

@end
