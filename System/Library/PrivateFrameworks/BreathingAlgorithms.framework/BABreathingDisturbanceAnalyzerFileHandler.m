@implementation BABreathingDisturbanceAnalyzerFileHandler

+ (void)deleteLogsForLiveOnUsers
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = CFSTR("/var/mobile/Library/Logs/HealthAlgorithms/BreathingAlgorithms");
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_23740B000, a2, OS_LOG_TYPE_ERROR, "failed to delete %{public}@ with error: %{public}@", (uint8_t *)&v2, 0x16u);
}

+ (id)filePath:(id)a3 withPrefixFilename:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "stringByAppendingString:", CFSTR("-breathing-disturbance.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)writeSamplesToJsonFile:(id)a3 withDateInterval:(id)a4 withOutputFilePath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t *v10;
  char v11;
  uint64_t *v12;
  void *v13;
  id v14;
  uint64_t *v15;
  char v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t *v30;
  id v31;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char *v41;
  char *v42;
  _BYTE v43[8];
  uint64_t *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[8];
  uint64_t *v50;
  _BYTE v51[8];
  uint64_t *v52;
  unsigned __int8 v53[8];
  uint64_t *v54;
  _BYTE v55[16];
  _BYTE *v56;
  char v57;
  _BYTE v58[16];
  _BYTE *v59;
  char v60;
  _BYTE v61[16];
  _BYTE *v62;
  char v63;
  _BYTE v64[16];
  _BYTE *v65;
  char v66;
  _BYTE v67[16];
  _BYTE *v68;
  char v69;
  _BYTE v70[8];
  double v71[2];
  char v72;
  char *v73[3];
  char v74;
  _QWORD v75[3];
  char v76;
  _BYTE v77[16];
  uint64_t v78;
  char v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v33 = a4;
  v32 = a5;
  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v53[0] = 0;
  v54 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v53);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v53);
  objc_msgSend(v33, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v7;
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v73[0] = (char *)objc_msgSend(v9, "UTF8String");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v51, v73);
  v10 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v53, "queryStart");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
  v11 = *(_BYTE *)v10;
  *(_BYTE *)v10 = v51[0];
  v51[0] = v11;
  v12 = (uint64_t *)v10[1];
  v10[1] = (uint64_t)v52;
  v52 = v12;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v52, v51[0]);

  objc_msgSend(v33, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v73[0] = (char *)objc_msgSend(v14, "UTF8String");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v49, v73);
  v15 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v53, "queryEnd");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v49);
  v16 = *(_BYTE *)v15;
  *(_BYTE *)v15 = v49[0];
  v49[0] = v16;
  v17 = (uint64_t *)v15[1];
  v15[1] = (uint64_t)v50;
  v50 = v17;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v15);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v49);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v50, v49[0]);

  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v31;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v80, 16);
  if (v18)
  {
    v35 = *(_QWORD *)v46;
    do
    {
      v19 = 0;
      v37 = v18;
      do
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v19);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[3],char [3],0>((uint64_t)v67, "bd");
        v68 = v67;
        v69 = 1;
        objc_msgSend(v20, "quantity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
        v39 = v21;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValueForUnit:");
        *(float *)&v22 = v22;
        v70[0] = 7;
        v71[0] = *(float *)&v22;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v70);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v70);
        *(_QWORD *)&v71[1] = v70;
        v72 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v73, (uint64_t)v67, 2, 1, 2);
        v73[2] = (char *)v73;
        v74 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[6],char [6],0>((uint64_t)v61, "start");
        v62 = v61;
        v63 = 1;
        objc_msgSend(v20, "startDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = (char *)objc_msgSend(v23, "UTF8String");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v64, &v42);
        v65 = v64;
        v66 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v75, (uint64_t)v61, 2, 1, 2);
        v75[2] = v75;
        v76 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[4],char [4],0>((uint64_t)v55, "end");
        v56 = v55;
        v57 = 1;
        objc_msgSend(v20, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v24);
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v41 = (char *)objc_msgSend(v25, "UTF8String");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)v58, &v41);
        v59 = v58;
        v60 = 1;
        v78 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v77, (uint64_t)v55, 2, 1, 2);
        v79 = 1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v43, (uint64_t)v73, 3, 1, 2);
        for (i = 0; i != -96; i -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v77[i]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v77[i + 8], v77[i]);
        }
        for (j = 0; j != -64; j -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v58[j]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v58[j + 8], v58[j]);
        }

        v7 = v36;
        for (k = 0; k != -64; k -= 32)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v64[k]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v64[k + 8], v64[k]);
        }

        for (m = 0; m != -8; m -= 4)
        {
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v70[m * 8]);
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v71[m], v70[m * 8]);
        }

        v30 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v53, "samples");
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::push_back((uint64_t)v30, (uint64_t)v43);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v43);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v44, v43[0]);
        ++v19;
      }
      while (v19 != v37);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v80, 16);
    }
    while (v18);
  }

  writeJsonFile((uint64_t)v53, v32);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v53);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v54, v53[0]);

}

+ (void)writeAnalysisToJsonFile:(BABreathingDisturbanceAnalysis *)a3 withOutputFilePath:(id)a4
{
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  unsigned __int8 v8;
  uint64_t *v9;
  _BOOL8 var2;
  uint64_t *v11;
  unsigned __int8 v12;
  uint64_t *v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  unsigned __int8 v17;
  uint64_t *v18;
  void *v19;
  float v20;
  uint64_t *v21;
  uint64_t *v22;
  unsigned __int8 v23;
  uint64_t *v24;
  void *v25;
  float v26;
  uint64_t *v27;
  uint64_t *v28;
  unsigned __int8 v29;
  uint64_t *v30;
  void *v31;
  float v32;
  uint64_t *v33;
  uint64_t *v34;
  unsigned __int8 v35;
  uint64_t *v36;
  void *v37;
  float v38;
  uint64_t *v39;
  uint64_t *v40;
  unsigned __int8 v41;
  uint64_t *v42;
  void *v43;
  uint64_t *v44;
  uint64_t *v45;
  unsigned __int8 v46;
  uint64_t *v47;
  void *v48;
  float v49;
  uint64_t *v50;
  uint64_t *v51;
  unsigned __int8 v52;
  uint64_t *v53;
  void *v54;
  float v55;
  uint64_t *v56;
  uint64_t *v57;
  unsigned __int8 v58;
  uint64_t *v59;
  void *v60;
  float v61;
  uint64_t *v62;
  uint64_t *v63;
  unsigned __int8 v64;
  uint64_t *v65;
  void *v66;
  float v67;
  uint64_t *v68;
  uint64_t *v69;
  unsigned __int8 v70;
  uint64_t *v71;
  void *v72;
  float v73;
  uint64_t *v74;
  uint64_t *v75;
  unsigned __int8 v76;
  uint64_t *v77;
  unsigned __int8 v78[8];
  double v79;
  unsigned __int8 v80[8];
  double v81;
  unsigned __int8 v82[8];
  double v83;
  unsigned __int8 v84[8];
  double v85;
  unsigned __int8 v86[8];
  double v87;
  unsigned __int8 v88[8];
  uint64_t *v89;
  unsigned __int8 v90[8];
  double v91;
  unsigned __int8 v92[8];
  double v93;
  unsigned __int8 v94[8];
  double v95;
  unsigned __int8 v96[8];
  double v97;
  unsigned __int8 v98[8];
  uint64_t *v99;
  unsigned __int8 v100[8];
  uint64_t *v101;
  unsigned __int8 v102[8];
  uint64_t *v103;
  unsigned __int8 v104[8];
  uint64_t *v105;

  v5 = a4;
  v104[0] = 0;
  v105 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v104);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v104);
  objc_msgSend(a3->var0, "doubleValue");
  v102[0] = 7;
  v103 = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v102);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v102);
  v7 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "algorithmVersion");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v102);
  v8 = *(_BYTE *)v7;
  *(_BYTE *)v7 = v102[0];
  v102[0] = v8;
  v9 = (uint64_t *)v7[1];
  v7[1] = (uint64_t)v103;
  v103 = v9;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v7);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v102);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v103, v102[0]);
  var2 = a3->var2;
  v100[0] = 4;
  v101 = (uint64_t *)var2;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v100);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v100);
  v11 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "sleepApneaDetected");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v100);
  v12 = *(_BYTE *)v11;
  *(_BYTE *)v11 = v100[0];
  v100[0] = v12;
  v13 = (uint64_t *)v11[1];
  v11[1] = (uint64_t)v101;
  v101 = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v100);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v101, v100[0]);
  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("notification_status"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = 5;
  v99 = (uint64_t *)(int)objc_msgSend(v14, "intValue");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v98);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v98);
  v15 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v16 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v15, "notification_status");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v98);
  v17 = *(_BYTE *)v16;
  *(_BYTE *)v16 = v98[0];
  v98[0] = v17;
  v18 = (uint64_t *)v16[1];
  v16[1] = (uint64_t)v99;
  v99 = v18;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v16);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v98);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v99, v98[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("percent_bd_at_least_10"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v96[0] = 7;
  v97 = v20;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v96);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v96);
  v21 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v22 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v21, "percent_bd_at_least_10");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v96);
  v23 = *(_BYTE *)v22;
  *(_BYTE *)v22 = v96[0];
  v96[0] = v23;
  v24 = (uint64_t *)v22[1];
  *((double *)v22 + 1) = v97;
  v97 = *(double *)&v24;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v96);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v97, v96[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("percent_bd_at_least_11"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v94[0] = 7;
  v95 = v26;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v94);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v94);
  v27 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v28 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v27, "percent_bd_at_least_11");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v94);
  v29 = *(_BYTE *)v28;
  *(_BYTE *)v28 = v94[0];
  v94[0] = v29;
  v30 = (uint64_t *)v28[1];
  *((double *)v28 + 1) = v95;
  v95 = *(double *)&v30;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v94);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v95, v94[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("percent_bd_at_least_12"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v92[0] = 7;
  v93 = v32;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v92);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v92);
  v33 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v34 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v33, "percent_bd_at_least_12");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v92);
  v35 = *(_BYTE *)v34;
  *(_BYTE *)v34 = v92[0];
  v92[0] = v35;
  v36 = (uint64_t *)v34[1];
  *((double *)v34 + 1) = v93;
  v93 = *(double *)&v36;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v34);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v92);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v93, v92[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("percent_bd_at_least_13"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  v90[0] = 7;
  v91 = v38;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v90);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v90);
  v39 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v40 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v39, "percent_bd_at_least_13");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v90);
  v41 = *(_BYTE *)v40;
  *(_BYTE *)v40 = v90[0];
  v90[0] = v41;
  v42 = (uint64_t *)v40[1];
  *((double *)v40 + 1) = v91;
  v91 = *(double *)&v42;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v40);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v90);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v91, v90[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("bd_count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = 5;
  v89 = (uint64_t *)(int)objc_msgSend(v43, "intValue");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v88);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v88);
  v44 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v45 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v44, "bd_count");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v88);
  v46 = *(_BYTE *)v45;
  *(_BYTE *)v45 = v88[0];
  v88[0] = v46;
  v47 = (uint64_t *)v45[1];
  v45[1] = (uint64_t)v89;
  v89 = v47;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v45);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v88);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v89, v88[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("bd_median"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  v86[0] = 7;
  v87 = v49;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v86);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v86);
  v50 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v51 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v50, "bd_median");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v86);
  v52 = *(_BYTE *)v51;
  *(_BYTE *)v51 = v86[0];
  v86[0] = v52;
  v53 = (uint64_t *)v51[1];
  *((double *)v51 + 1) = v87;
  v87 = *(double *)&v53;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v86);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v87, v86[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("bd_mean"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  v84[0] = 7;
  v85 = v55;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v84);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v84);
  v56 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v57 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v56, "bd_mean");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v84);
  v58 = *(_BYTE *)v57;
  *(_BYTE *)v57 = v84[0];
  v84[0] = v58;
  v59 = (uint64_t *)v57[1];
  *((double *)v57 + 1) = v85;
  v85 = *(double *)&v59;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v57);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v84);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v85, v84[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("bd_standard_deviation"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "floatValue");
  v82[0] = 7;
  v83 = v61;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v82);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v82);
  v62 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v63 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v62, "bd_standard_deviation");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v82);
  v64 = *(_BYTE *)v63;
  *(_BYTE *)v63 = v82[0];
  v82[0] = v64;
  v65 = (uint64_t *)v63[1];
  *((double *)v63 + 1) = v83;
  v83 = *(double *)&v65;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v63);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v82);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v83, v82[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("bd_maximum"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "floatValue");
  v80[0] = 7;
  v81 = v67;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v80);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v80);
  v68 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v69 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v68, "bd_maximum");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v80);
  v70 = *(_BYTE *)v69;
  *(_BYTE *)v69 = v80[0];
  v80[0] = v70;
  v71 = (uint64_t *)v69[1];
  *((double *)v69 + 1) = v81;
  v81 = *(double *)&v71;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v69);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v80);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v81, v80[0]);

  objc_msgSend(a3->var1, "objectForKeyedSubscript:", CFSTR("bd_minimum"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "floatValue");
  v78[0] = 7;
  v79 = v73;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v78);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v78);
  v74 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(v104, "coreAnalytics");
  v75 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>((unsigned __int8 *)v74, "bd_minimum");
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v78);
  v76 = *(_BYTE *)v75;
  *(_BYTE *)v75 = v78[0];
  v78[0] = v76;
  v77 = (uint64_t *)v75[1];
  *((double *)v75 + 1) = v79;
  v79 = *(double *)&v77;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v75);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v78);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v79, v78[0]);

  writeJsonFile((uint64_t)v104, v5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v104);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v105, v104[0]);

}

@end
