@implementation _EARAppLmArtifactUtils

+ (BOOL)addCustomPronsToUserProfile:(id)a3 artifact:(id)a4 configPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  std::string::size_type size;
  unint64_t v15;
  std::string *p_buf;
  void **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _EARWordPart *v24;
  void *v25;
  void *v26;
  _EARWordPart *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSObject *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _EARWordPart *v40;
  void *v41;
  _EARWordPart *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id obj;
  id obja;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *__p[2];
  unsigned __int8 v65;
  std::string buf;
  _EARWordPart *v67;
  _BYTE v68[128];
  _EARWordPart *v69;
  uint8_t v70[128];
  uint8_t v71[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v7 = a4;
  v8 = a5;
  v49 = v7;
  v47 = v8;
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v9;
  if (objc_msgSend(v7, "getLifeCycleStage") == 2)
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("ncs"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "custom-prons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasContent:", v10))
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "oov");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "hasContent:", v11);

  if ((v12 & 1) != 0)
  {
LABEL_7:
    v13 = objc_retainAutorelease(v8);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
    quasar::artifact::GetTargetLmeForAddingCustomProns((uint64_t)__p, &buf);
    if ((char)v65 < 0)
      operator delete(__p[0]);
    quasar::artifact::GetTargetLmeTagForAddingCustomProns(__p);
    size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = buf.__r_.__value_.__l.__size_;
    if (size)
    {
      v15 = v65;
      if ((v65 & 0x80u) != 0)
        v15 = (unint64_t)__p[1];
      if (v15)
      {
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_buf = &buf;
        else
          p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_buf);
        v54 = objc_claimAutoreleasedReturnValue();
        if ((v65 & 0x80u) == 0)
          v17 = __p;
        else
          v17 = (void **)__p[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "loadCustomPronData:ncsRoot:dataRoot:", v13, v50, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v19;
        if (v19)
        {
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          objc_msgSend(v19, "getProns");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          if (v20)
          {
            v51 = 0;
            v21 = *(_QWORD *)v61;
            do
            {
              v22 = 0;
              v51 += v20;
              do
              {
                if (*(_QWORD *)v61 != v21)
                  objc_enumerationMutation(obj);
                v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v22);
                v24 = [_EARWordPart alloc];
                objc_msgSend(v23, "orthography");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "prons");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = -[_EARWordPart initWithOrthography:pronunciations:tagName:frequency:](v24, "initWithOrthography:pronunciations:tagName:frequency:", v25, v26, v18, objc_msgSend(v23, "frequency"));

                v69 = v27;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "addWordWithParts:templateName:", v28, v54);

                ++v22;
              }
              while (v20 != v22);
              v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            }
            while (v20);
          }
          else
          {
            v51 = 0;
          }

          v7 = v49;
        }
        else
        {
          v51 = 0;
        }
        objc_msgSend(v7, "loadOovs");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v35;
        if (v35)
        {
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          obja = v35;
          v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v68, 16, v45, v46);
          if (v36)
          {
            v37 = *(_QWORD *)v57;
            do
            {
              v38 = 0;
              v51 += v36;
              do
              {
                if (*(_QWORD *)v57 != v37)
                  objc_enumerationMutation(obja);
                v39 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v38);
                v40 = [_EARWordPart alloc];
                objc_msgSend(MEMORY[0x1E0C99E60], "set");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = -[_EARWordPart initWithOrthography:pronunciations:tagName:frequency:](v40, "initWithOrthography:pronunciations:tagName:frequency:", v39, v41, v18, 1);

                v67 = v42;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "addWordWithParts:templateName:", v43, v54);

                ++v38;
              }
              while (v36 != v38);
              v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
            }
            while (v36);
          }

        }
        v34 = v51 != 0;

        v29 = v54;
        goto LABEL_52;
      }
      EarArtifactLogger();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v71 = 0;
        v30 = "LME tag empty";
        v31 = v29;
        v32 = 2;
        goto LABEL_37;
      }
    }
    else
    {
      EarArtifactLogger();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v71 = 138412290;
        v72 = v13;
        v30 = "LME template for adding artifact custom prons not present in %@ or is empty";
        v31 = v29;
        v32 = 12;
LABEL_37:
        _os_log_impl(&dword_1AD756000, v31, OS_LOG_TYPE_DEFAULT, v30, v71, v32);
      }
    }
    v34 = 0;
LABEL_52:

    if ((char)v65 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    goto LABEL_56;
  }
  EarArtifactLogger();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1AD756000, v33, OS_LOG_TYPE_DEFAULT, "No custom prons or OOVs present in artifact", (uint8_t *)&buf, 2u);
  }

  v34 = 0;
LABEL_56:

  return v34;
}

@end
