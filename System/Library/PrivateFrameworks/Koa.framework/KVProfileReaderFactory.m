@implementation KVProfileReaderFactory

- (id)profileReaderForData:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  char *v38;
  unsigned int v39;
  unsigned int *v40;
  unint64_t v41;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  BOOL v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _DWORD *v51;
  unint64_t v52;
  unsigned int *v53;
  uint64_t v54;
  int *v55;
  unsigned __int16 *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  KVJSONProfileReader *v65;
  const char *v66;
  unsigned int *v68;
  void *v69;
  KVProfileInfo *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  unsigned __int16 *v77;
  KVEmbeddedProfileReader *v78;
  const char *v79;
  uint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  KVStreamProfileReader *v86;
  const char *v87;
  unsigned int *v88;
  _DWORD *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  __int128 v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  _QWORD v99[2];

  v99[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v5, v6, v7, v8))
  {
    v9 = objc_retainAutorelease(v5);
    v13 = *(_DWORD *)(objc_msgSend_bytes(v9, v10, v11, v12) + 4);
    v14 = objc_retainAutorelease(v9);
    v18 = v14;
    if (v13 == 844517451)
      v19 = (unsigned int *)objc_msgSend_bytes(v14, v15, v16, v17);
    else
      v19 = (unsigned int *)(objc_msgSend_bytes(v14, v15, v16, v17) + 4);
    v28 = *v19;
    v29 = objc_retainAutorelease(v18);
    v93 = objc_msgSend_bytes(v29, v30, v31, v32);
    v94 = objc_msgSend_length(v29, v33, v34, v35);
    v95 = xmmword_1B7111350;
    v96 = 0;
    v97 = 1;
    if (v94 >= 0x7FFFFFFF)
      __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
    v36 = (int *)((char *)v19 + v28);
    if (sub_1B70EEC48(&v93, (int *)((char *)v19 + v28)) && sub_1B70EED00((int *)((char *)v19 + v28), &v93, 4u))
    {
      v37 = *v36;
      v38 = (char *)v36 - v37;
      v39 = *(unsigned __int16 *)((char *)v36 - v37);
      if (v39 < 5 || !*((_WORD *)v38 + 2))
        goto LABEL_73;
      v40 = (unsigned int *)((char *)v36
                           + *((unsigned __int16 *)v38 + 2)
                           + *(unsigned int *)((char *)v36 + *((unsigned __int16 *)v38 + 2)));
      v41 = (unint64_t)v40 - v93;
      if (((((unint64_t)v40 - v93) & 3) == 0 || v97 == 0) && v94 >= 5 && v94 - 4 >= v41)
      {
        v43 = *v40;
        if (v43 <= 0x7FFFFFFE)
        {
          v44 = v43 + 4;
          v46 = v94 >= v44;
          v45 = v94 - v44;
          v46 = v45 != 0 && v46 && v45 >= v41;
          if (v46)
          {
LABEL_73:
            if (sub_1B70EED00((int *)((char *)v19 + v28), &v93, 6u))
            {
              if (v39 < 7)
                goto LABEL_61;
              if (!*((_WORD *)v38 + 3))
              {
                v48 = -v37;
                goto LABEL_35;
              }
              if (sub_1B70EEDC8((uint64_t)&v93, (unsigned int *)((char *)v36+ *((unsigned __int16 *)v38 + 3)+ *(unsigned int *)((char *)v36 + *((unsigned __int16 *)v38 + 3))), 4uLL, 0))
              {
                v37 = *v36;
                if (*(unsigned __int16 *)((char *)v36 - v37) >= 7u)
                {
                  v48 = -v37;
LABEL_35:
                  v49 = *(unsigned __int16 *)((char *)v36 + v48 + 6);
                  if (v49)
                  {
                    v50 = *(unsigned int *)((char *)v36 + v49);
                    v51 = (int *)((char *)v36 + v49 + v50);
                    if (*v51)
                    {
                      v52 = 0;
                      v88 = (unsigned int *)((char *)v36 + v49 + v50);
                      v89 = v51 + 1;
                      v92 = (uint64_t)v19 + v28 + v50 + v49 + 8;
                      while (1)
                      {
                        v53 = &v89[v52];
                        v54 = *v53;
                        v55 = (int *)((char *)v53 + v54);
                        if (!sub_1B70EEC48(&v93, (int *)((char *)v53 + v54)))
                          goto LABEL_59;
                        if (!sub_1B70EED00(v55, &v93, 4u))
                          goto LABEL_59;
                        v56 = (unsigned __int16 *)((char *)v55 - *v55);
                        if (*v56 >= 5u)
                        {
                          v57 = v56[2];
                          if (v57)
                          {
                            if (!sub_1B70EEDC8((uint64_t)&v93, (unsigned int *)((char *)v55 + v57 + *(unsigned int *)((char *)v55 + v57)), 1uLL, 0))goto LABEL_59;
                          }
                        }
                        if (!sub_1B70EED00(v55, &v93, 6u))
                          goto LABEL_59;
                        v58 = *v55;
                        if (*(unsigned __int16 *)((char *)v55 - v58) >= 7u)
                        {
                          if (!*(_WORD *)((char *)v55 - v58 + 6))
                            goto LABEL_74;
                          if (!sub_1B70EEDC8((uint64_t)&v93, (unsigned int *)((char *)v55+ *(unsigned __int16 *)((char *)v55 - v58 + 6)+ *(unsigned int *)((char *)v55+ *(unsigned __int16 *)((char *)v55 - v58 + 6))), 4uLL, 0))goto LABEL_59;
                          v58 = *v55;
                          if (*(unsigned __int16 *)((char *)v55 - v58) >= 7u)
                          {
LABEL_74:
                            v59 = *(unsigned __int16 *)((char *)v55 - v58 + 6);
                            if (v59)
                            {
                              v90 = (char *)v55 + v59;
                              v91 = *(unsigned int *)((char *)v55 + v59);
                              if (*(int *)((char *)v55 + v59 + v91))
                              {
                                v60 = 0;
                                v61 = (unsigned int *)(v92 + v54 + v91 + v59);
                                do
                                {
                                  v62 = *v61;
                                  if (!sub_1B70EEC48(&v93, (int *)((char *)v61 + v62)))
                                    goto LABEL_59;
                                  if (!sub_1B70EED00((int *)((char *)v61 + v62), &v93, 4u))
                                    goto LABEL_59;
                                  v63 = v62 - *(int *)((char *)v61 + v62);
                                  if (*(unsigned __int16 *)((char *)v61 + v63) >= 5u)
                                  {
                                    v64 = *(unsigned __int16 *)((char *)v61 + v63 + 4);
                                    if (v64)
                                    {
                                      if (!sub_1B70EEDC8((uint64_t)&v93, (unsigned int *)((char *)v61+ v62+ v64+ *(unsigned int *)((char *)v61 + v62 + v64)), 1uLL, 0))goto LABEL_59;
                                    }
                                  }
                                  LODWORD(v95) = v95 - 1;
                                  ++v60;
                                  ++v61;
                                }
                                while (v60 < *(unsigned int *)&v90[v91]);
                              }
                            }
                          }
                        }
                        LODWORD(v95) = v95 - 1;
                        ++v52;
                        v92 += 4;
                        if (v52 >= *v88)
                        {
                          LODWORD(v37) = *v36;
                          break;
                        }
                      }
                    }
                  }
                }
LABEL_61:
                LODWORD(v95) = v95 - 1;
                v68 = (unsigned int *)((char *)v36 + *(unsigned __int16 *)((char *)v36 - (int)v37 + 4));
                objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v47, (uint64_t)v68 + *v68 + 4, *(unsigned int *)((char *)v68 + *v68), 0);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = [KVProfileInfo alloc];
                v72 = (void *)objc_msgSend_initWithBuffer_error_(v70, v71, (uint64_t)v69, (uint64_t)a4);
                v76 = v72;
                if (v72)
                {
                  if (objc_msgSend_datasetCount(v72, v73, v74, v75)
                    && ((v77 = (unsigned __int16 *)((char *)v36 - *v36), *v77 < 7u) || !v77[3]))
                  {
                    v81 = objc_retainAutorelease(v29);
                    v85 = *(_DWORD *)objc_msgSend_bytes(v81, v82, v83, v84);
                    v86 = [KVStreamProfileReader alloc];
                    v80 = objc_msgSend_initWithData_profileInfo_offset_(v86, v87, (uint64_t)v81, (uint64_t)v76, (v85 + 4));
                  }
                  else
                  {
                    v78 = [KVEmbeddedProfileReader alloc];
                    v80 = objc_msgSend_initWithData_profile_profileInfo_(v78, v79, (uint64_t)v29, (uint64_t)v36, v76);
                  }
                  v27 = (void *)v80;
                }
                else
                {
                  v27 = 0;
                }

                goto LABEL_60;
              }
            }
          }
        }
      }
    }
LABEL_59:
    v65 = [KVJSONProfileReader alloc];
    v27 = (void *)objc_msgSend_initWithData_error_(v65, v66, (uint64_t)v29, (uint64_t)a4);
    goto LABEL_60;
  }
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v98 = *MEMORY[0x1E0CB2D50];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("Unexpected profile data: %@"), v8, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v99, (uint64_t)&v98, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v20, v24, (uint64_t)CFSTR("com.apple.koa.profile"), 2, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (a4 && v25)
    *a4 = objc_retainAutorelease(v25);

  v27 = 0;
LABEL_60:

  return v27;
}

@end
