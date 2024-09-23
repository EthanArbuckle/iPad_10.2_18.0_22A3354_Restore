@implementation AlgosScoreDataCSV

- (AlgosScoreDataCSV)init
{
  AlgosScoreDataCSV *v2;
  void *v3;
  AlgosScoreDataCSV *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AlgosScoreDataCSV;
  v2 = -[AlgosScoreDataCSV init](&v5, sel_init);
  if (!v2)
    return v2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AlgosScoreDataCSV setStatsDict:](v2, "setStatsDict:", v3);

  result = (AlgosScoreDataCSV *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->csvData = 0;
    *(_QWORD *)&result->_debug = 0;
    v2->csvData = result;
    return v2;
  }
  __break(1u);
  return result;
}

- (void)clearStreamingData
{
  std::vector<AlgosScoreStreamCSVFrameRow>::__clear[abi:ne180100]((uint64_t *)self->csvData);
}

- (void)populateScore:(id)a3
{
  id v4;
  const AlgosScoreStreamCSVFrameRow **csvData;
  const AlgosScoreStreamCSVFrameRow *v6;
  const AlgosScoreStreamCSVFrameRow *v7;
  double v8;
  int v9;
  double v10;
  uint64_t v12;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  char *v19;
  int v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unsigned __int16 *v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v36;
  uint64_t v37;
  int v39;
  int v40;
  unsigned __int8 *v42;
  int v43;
  int v44;
  const AlgosScoreStreamCSVFrameRow *v46;
  const AlgosScoreStreamCSVFrameRow *v47;
  const char *v48;
  const AlgosScoreStreamCSVFrameRow **v49;
  std::regex_traits<char> v50[2];
  std::__shared_weak_count *v51;
  void *v52;
  uint64_t v53;
  unsigned __int8 v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  __int128 __p;
  _BYTE v61[25];
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;

  v4 = a3;
  objc_msgSend(v4, "clearStreamRows");
  csvData = (const AlgosScoreStreamCSVFrameRow **)self->csvData;
  v6 = *csvData;
  v7 = csvData[1];
  v49 = csvData;
  if (*csvData != v7)
  {
    do
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)&v52, v6);
      v8 = v56 / 1000.0;
      v9 = v54;
      v10 = v55 / 1000.0;
      if ((char)v54 < 0)
      {
        v12 = v53;
        if (v53 == 4)
        {
          if (*(_DWORD *)v52 == 1702125938)
            goto LABEL_24;
          v12 = v53;
        }
        else if (v53 == 5 && *(_DWORD *)v52 == 1918989427 && *((_BYTE *)v52 + 4) == 116)
        {
LABEL_25:
          objc_msgSend(v4, "addStreamStart:play:", 0.0, v56 / 1000.0);
          if (v8 > 0.5)
          {
            if (v10 == 0.0)
              v14 = v8;
            else
              v14 = v10;
            v15 = 0.0;
            v16 = v58;
            v17 = 0.1;
            goto LABEL_81;
          }
          goto LABEL_92;
        }
        if (!v12)
          goto LABEL_62;
      }
      else
      {
        if (!v54)
          goto LABEL_92;
        if (v54 == 4)
        {
          if ((_DWORD)v52 == 1702125938)
          {
LABEL_24:
            objc_msgSend(v4, "addStreamTierSwitch:end:quality:weight:", v8 - v10, v56 / 1000.0, v58, v57);
            goto LABEL_92;
          }
        }
        else if (v54 == 5 && (_DWORD)v52 == 1918989427 && BYTE4(v52) == 116)
        {
          goto LABEL_25;
        }
      }
      std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](v50, "stall-end-[0-9]+.*", 0);
      v18 = v54;
      if ((v54 & 0x80u) == 0)
        v19 = (char *)&v52;
      else
        v19 = (char *)v52;
      if ((v54 & 0x80u) != 0)
        v18 = v53;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      __p = 0u;
      memset(v61, 0, sizeof(v61));
      v20 = std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(v19, &v19[v18], (uint64_t)&__p, (uint64_t)v50, 0);
      if ((_QWORD)__p)
      {
        *((_QWORD *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      v21 = v51;
      if (v51)
      {
        p_shared_owners = (unint64_t *)&v51->__shared_owners_;
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      std::locale::~locale(&v50[0].__loc_);
      if (!v20)
      {
        v9 = v54;
        if ((char)v54 < 0)
        {
LABEL_62:
          v32 = v53;
          if (v53 == 5)
          {
            v31 = 1;
            v30 = (unsigned __int16 *)v52;
            goto LABEL_64;
          }
        }
        else
        {
          v30 = (unsigned __int16 *)&v52;
          if (v54 == 3)
            goto LABEL_84;
          v31 = 0;
          if (v54 != 5)
          {
            if (v54 != 13)
              goto LABEL_93;
LABEL_72:
            v36 = *(_QWORD *)v30;
            v37 = *(_QWORD *)((char *)v30 + 5);
            if (v36 == 0x65702D6465786966 && v37 == 0x79746C616E65702DLL)
            {
              objc_msgSend(v4, "addStreamPenalty:amount:", v8, v57);
              goto LABEL_92;
            }
            if (v31)
            {
              v32 = v53;
LABEL_78:
              if (v32 == 3)
              {
                v30 = (unsigned __int16 *)v52;
                goto LABEL_84;
              }
              goto LABEL_92;
            }
LABEL_82:
            if (v9 == 3)
            {
              v30 = (unsigned __int16 *)&v52;
LABEL_84:
              v39 = *v30;
              v40 = *((unsigned __int8 *)v30 + 2);
              if (v39 == 28261 && v40 == 100)
                objc_msgSend(v4, "addStreamEnd:", v8);
              goto LABEL_92;
            }
            goto LABEL_92;
          }
LABEL_64:
          v33 = *(_DWORD *)v30;
          v34 = *((unsigned __int8 *)v30 + 4);
          if (v33 == 1869771365 && v34 == 114)
          {
            objc_msgSend(v4, "addStreamFailure:weight:", v8, v57);
            goto LABEL_92;
          }
          if (!v31)
            goto LABEL_82;
          v32 = v53;
        }
        if (v32 != 13)
          goto LABEL_78;
        v31 = 1;
        v30 = (unsigned __int16 *)v52;
        goto LABEL_72;
      }
      std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](v50, ".*-startup.*", 0);
      v24 = v54;
      if ((v54 & 0x80u) == 0)
        v25 = (char *)&v52;
      else
        v25 = (char *)v52;
      if ((v54 & 0x80u) != 0)
        v24 = v53;
      v62 = 0;
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      __p = 0u;
      memset(v61, 0, sizeof(v61));
      v26 = std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(v25, &v25[v24], (uint64_t)&__p, (uint64_t)v50, 0);
      if ((_QWORD)__p)
      {
        *((_QWORD *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      v27 = v51;
      if (v51)
      {
        v28 = (unint64_t *)&v51->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      std::locale::~locale(&v50[0].__loc_);
      v15 = v8 - v10;
      v17 = v57;
      v16 = v58;
      if (!v26)
      {
        v14 = v8;
LABEL_81:
        objc_msgSend(v4, "addStreamStall:end:quality:weight:", v15, v14, v16, v17);
        goto LABEL_92;
      }
      objc_msgSend(v4, "addStreamStartupStall:end:quality:weight:", v15, v8, v58, v57);
LABEL_92:
      v9 = v54;
LABEL_93:
      if (v59)
      {
        if ((v9 & 0x80) != 0)
        {
          if (v53 == 5)
          {
            v42 = (unsigned __int8 *)v52;
            goto LABEL_99;
          }
        }
        else if (v9 == 5)
        {
          v42 = (unsigned __int8 *)&v52;
LABEL_99:
          v43 = *(_DWORD *)v42;
          v44 = v42[4];
          if (v43 == 1869771365 && v44 == 114)
            goto LABEL_104;
        }
        objc_msgSend(v4, "addStreamFailure:weight:", v8, v57);
        LOBYTE(v9) = v54;
      }
LABEL_104:
      if ((v9 & 0x80) != 0)
        operator delete(v52);
      v6 = (const AlgosScoreStreamCSVFrameRow *)((char *)v6 + 72);
    }
    while (v6 != v7);
  }
  if (-[AlgosScoreDataCSV debug](self, "debug") >= 2)
  {
    v46 = *v49;
    v47 = v49[1];
    if (*v49 != v47)
    {
      do
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)&__p, v46);
        AlgosScoreStreamCSVFrameRow::GetDescription((AlgosScoreStreamCSVFrameRow *)&__p, &v52);
        if ((v54 & 0x80u) == 0)
          v48 = (const char *)&v52;
        else
          v48 = (const char *)v52;
        puts(v48);
        if ((char)v54 < 0)
          operator delete(v52);
        if ((v61[7] & 0x80000000) != 0)
          operator delete((void *)__p);
        v46 = (const AlgosScoreStreamCSVFrameRow *)((char *)v46 + 72);
      }
      while (v46 != v47);
    }
  }

}

- (int)transformer
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Unimplemented Transformer"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)readData:(id)a3 catchException:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  FILE *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[AlgosScoreDataCSV setRawStreamData:](self, "setRawStreamData:", 0);
  +[AlgosScoreCSVReader csvReader:header:](AlgosScoreCSVReader, "csvReader:header:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AlgosScoreDataCSV debug](self, "debug"))
    printf("--> Read %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 4));
  if (-[AlgosScoreDataCSV debug](self, "debug") >= 2)
    objc_msgSend(v6, "debugPrint:", 10);
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (FILE *)*MEMORY[0x24BDAC8D8];
    objc_msgSend(v6, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v8, "ReadData: %s\n", (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4));

    v11 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v6, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("error");
    objc_msgSend(v6, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", CFSTR("ReaderError"), v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AlgosScoreDataCSV setRawStreamData:](self, "setRawStreamData:", v6);
    -[AlgosScoreDataCSV transformer](self, "transformer");

    if (-[AlgosScoreDataCSV debug](self, "debug"))
      AlgosScoreStreamCSVFrame::DebugPrint((AlgosScoreStreamCSVFrame *)self->csvData, 30);
    v16 = 0;
  }

  return v16;
}

- (id)readData:(id)a3
{
  -[AlgosScoreDataCSV readData:catchException:](self, "readData:catchException:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)readDirectoryAndScore:(id)a3 score:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  char v61;
  stat v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;
  const __CFString *v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v8 = a4;
  v44 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", CFSTR("continue_on_error"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v44, "objectForKey:", CFSTR("tracePath"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_retainAutorelease(v41);
  if (stat((const char *)objc_msgSend(v43, "cStringUsingEncoding:", 4), &v62))
  {
    v66 = CFSTR("error");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *__error());
    v67[0] = objc_claimAutoreleasedReturnValue();
    obj = (id)v67[0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v10);
LABEL_38:

LABEL_39:
    v22 = obj;
    goto LABEL_40;
  }
  v11 = v62.st_mode & 0xF000;
  if (v11 == 0x4000)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = *MEMORY[0x24BDBCC60];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __57__AlgosScoreDataCSV_readDirectoryAndScore_score_options___block_invoke;
    v60[3] = &__block_descriptor_33_e27_B24__0__NSURL_8__NSError_16l;
    v61 = v46;
    objc_msgSend(v42, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, v14, 0, v60);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v12 = v15;
    v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v57 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v19, "pathExtension");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("csv")))
          {
            v21 = objc_msgSend(v19, "isFileURL");

            if (v21)
              objc_msgSend(v51, "addObject:", v19);
          }
          else
          {

          }
        }
        v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v16);
    }

  }
  else
  {
    if (v11 != 0x8000)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v43);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObject:", v12);
  }

LABEL_19:
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v22 = v51;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v23)
  {
    obj = v22;
    v47 = *(_QWORD *)v53;
    while (2)
    {
      v48 = v23;
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v53 != v47)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AlgosScoreDataCSV readData:](self, "readData:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("error"));
          if ((v46 & 1) == 0)
          {

            goto LABEL_38;
          }
        }
        if (v8)
        {
          -[AlgosScoreDataCSV populateScore:](self, "populateScore:", v8);
          if (v49)
          {
            objc_msgSend(v25, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "lastPathComponent");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringByAppendingPathExtension:", CFSTR("trace"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "stringByAppendingPathComponent:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v8, "saveEventsToFile:", v31) & 1) != 0)
              printf("Trace in %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v31), "cStringUsingEncoding:", 4));
            else
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Couldn't write trace file to %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v31), "cStringUsingEncoding:", 4));

          }
          objc_msgSend(v25, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "scoreStreaming:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v33, CFSTR("score"));

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("score"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("stats"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[AlgosScoreDataCSV statsDict](self, "statsDict");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addEntriesFromDictionary:", v36);

          if (-[AlgosScoreDataCSV debug](self, "debug"))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("score"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("score"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "description");
            v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            printf("Score: %s\n", (const char *)objc_msgSend(v39, "cStringUsingEncoding:", 4));

          }
        }
        objc_msgSend(v50, "addObject:", v10);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v23)
        continue;
      goto LABEL_39;
    }
  }
LABEL_40:

  return v50;
}

uint64_t __57__AlgosScoreDataCSV_readDirectoryAndScore_score_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  FILE *v4;
  id v5;

  v4 = (FILE *)*MEMORY[0x24BDAC8D8];
  objc_msgSend(a3, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v4, "Enumeration: %s\n", (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

  return *(unsigned __int8 *)(a1 + 32);
}

- (void)dealloc
{
  void *csvData;
  objc_super v4;
  void **v5;

  csvData = self->csvData;
  if (csvData)
  {
    v5 = (void **)self->csvData;
    std::vector<AlgosScoreStreamCSVFrameRow>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x20BD3126C](csvData, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)AlgosScoreDataCSV;
  -[AlgosScoreDataCSV dealloc](&v4, sel_dealloc);
}

- (AlgosScoreCSVReader)rawStreamData
{
  return self->_rawStreamData;
}

- (void)setRawStreamData:(id)a3
{
  objc_storeStrong((id *)&self->_rawStreamData, a3);
}

- (NSMutableDictionary)statsDict
{
  return self->_statsDict;
}

- (void)setStatsDict:(id)a3
{
  objc_storeStrong((id *)&self->_statsDict, a3);
}

- (int)debug
{
  return self->_debug;
}

- (void)setDebug:(int)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsDict, 0);
  objc_storeStrong((id *)&self->_rawStreamData, 0);
}

@end
