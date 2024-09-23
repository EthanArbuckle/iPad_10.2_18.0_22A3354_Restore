@implementation BUZipFileWriter

- (BUZipFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  return (BUZipFileWriter *)MEMORY[0x24BEDD108](self, sel_initWithURL_options_error_, a3);
}

- (BUZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BUZipFileWriter *v9;
  BUFileIOChannel *v10;
  const char *v11;
  uint64_t v12;
  BURandomWriteChannel *writeChannel;
  const char *v14;
  BURandomWriteChannel *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BUZipFileWriter;
  v9 = -[BUZipWriter initWithOptions:](&v23, sel_initWithOptions_, a4);
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [BUFileIOChannel alloc];
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = sub_212E5A280;
    v20 = &unk_24CEDA420;
    objc_copyWeak(&v21, &location);
    v12 = objc_msgSend_initForRandomWritingURL_error_cleanupHandler_(v10, v11, (uint64_t)v8, a5, &v17);
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = (BURandomWriteChannel *)v12;

    v15 = v9->_writeChannel;
    if (v15)
    {
      objc_msgSend_setLowWater_(v15, v14, -1, v17, v18, v19, v20);
    }
    else
    {

      v9 = 0;
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (BUZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4
{
  return (BUZipFileWriter *)MEMORY[0x24BEDD108](self, sel_initWithZipFileArchive_options_error_, a3);
}

- (BUZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  BUZipFileWriter *v12;
  uint64_t v13;
  BUZipFileWriter *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t Entry;
  const char *v19;
  BUFileIOChannel *v20;
  id *v21;
  const char *v22;
  uint64_t v23;
  BURandomWriteChannel *writeChannel;
  const char *v25;
  BURandomWriteChannel *v26;
  NSObject *v27;
  BURandomWriteChannel *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  BUZipFileWriter *v34;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  id obj;
  id location;
  _QWORD v43[4];
  BUZipFileWriter *v44;
  objc_super v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v8 = a3;
  objc_msgSend_URL(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = sub_212E5A5D4;
  v50 = sub_212E5A5E4;
  v51 = 0;
  v45.receiver = self;
  v45.super_class = (Class)BUZipFileWriter;
  v12 = -[BUZipWriter initWithOptions:](&v45, sel_initWithOptions_, a4);
  if (!v12)
  {
    v14 = 0;
    if (!a5)
      goto LABEL_8;
    goto LABEL_7;
  }
  v13 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_212E5A5EC;
  v43[3] = &unk_24CEDA448;
  v14 = v12;
  v44 = v14;
  objc_msgSend_enumerateEntriesUsingBlock_(v8, v15, (uint64_t)v43);
  Entry = objc_msgSend_endOfLastEntry(v8, v16, v17);
  objc_msgSend_setEntryInsertionOffset_(v14, v19, Entry);
  objc_initWeak(&location, v14);
  v20 = [BUFileIOChannel alloc];
  v21 = v47;
  obj = v47[5];
  v39[0] = v13;
  v39[1] = 3221225472;
  v39[2] = sub_212E5A5F4;
  v39[3] = &unk_24CEDA420;
  objc_copyWeak(&v40, &location);
  v23 = objc_msgSend_initForRandomReadingWritingURL_error_cleanupHandler_(v20, v22, (uint64_t)v11, &obj, v39);
  objc_storeStrong(v21 + 5, obj);
  writeChannel = v14->_writeChannel;
  v14->_writeChannel = (BURandomWriteChannel *)v23;

  v26 = v14->_writeChannel;
  if (v26)
  {
    objc_msgSend_setLowWater_(v26, v25, -1);
    v27 = dispatch_group_create();
    dispatch_group_enter(v27);
    v28 = v14->_writeChannel;
    v31 = objc_msgSend_endOfLastEntry(v8, v29, v30);
    v36[0] = v13;
    v36[1] = 3221225472;
    v36[2] = sub_212E5A660;
    v36[3] = &unk_24CEDA470;
    v38 = &v46;
    v32 = v27;
    v37 = v32;
    objc_msgSend_truncateToLength_completion_(v28, v33, v31, v36);
    dispatch_group_wait(v32, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (v47[5])
  {

    v14 = 0;
  }
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  if (a5)
LABEL_7:
    *a5 = objc_retainAutorelease(v47[5]);
LABEL_8:
  v34 = v14;
  _Block_object_dispose(&v46, 8);

  return v34;
}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  BUZipFileArchive *v15;
  const char *v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  id v25;
  const char *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  uint64_t v34;
  const char *v35;
  void (**v36)(_QWORD, _QWORD);
  void *v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend_isClosed(v10, v13, v14) & 1) != 0)
  {
    v15 = [BUZipFileArchive alloc];
    v45 = 0;
    v17 = (void *)objc_msgSend_initWithWriter_forReadingFromURL_options_error_(v15, v16, (uint64_t)v10, v11, a5, &v45);
    v18 = v45;
    if (v17)
    {
      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 0;
      v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v22 = objc_msgSend_entriesCount(v17, v20, v21);
      v24 = (void *)objc_msgSend_initWithCapacity_(v19, v23, v22);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = sub_212E5A90C;
      v38[3] = &unk_24CEDA498;
      v25 = v24;
      v39 = v25;
      v40 = &v41;
      objc_msgSend_enumerateEntriesUsingBlock_(v17, v26, (uint64_t)v38);
      objc_msgSend_sortUsingComparator_(v25, v27, (uint64_t)&unk_24CEDA4D8);
      objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x24BDD1768], v28, v42[3]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_copyRemainingEntries_fromArchive_progress_completionHandler_(self, v30, (uint64_t)v25, v17, v29, v12);

      _Block_object_dispose(&v41, 8);
    }
    else
    {
      v34 = MEMORY[0x2199A7288](v12);
      v36 = (void (**)(_QWORD, _QWORD))v34;
      if (v34)
      {
        if (v18)
        {
          (*(void (**)(uint64_t, id))(v34 + 16))(v34, v18);
        }
        else
        {
          objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v35, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v36)[2](v36, v37);

        }
      }

    }
  }
  else
  {
    v32 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A7288](v12);
    if (v32)
    {
      objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v31, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v32)[2](v32, v33);

    }
  }

}

- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  BUZipFileWriter *v40;
  id v41;
  id v42;
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_firstObject(v10, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend_removeObjectAtIndex_(v10, v16, 0);
    objc_msgSend_streamReadChannelForEntry_(v11, v18, (uint64_t)v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend_name(v17, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastModificationDate(v17, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_size(v17, v26, v27);
      v30 = objc_msgSend_CRC(v17, v28, v29);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = sub_212E5ABCC;
      v37[3] = &unk_24CEDA500;
      v43 = v13;
      v38 = v12;
      v39 = v17;
      v40 = self;
      v41 = v10;
      v42 = v11;
      objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion_(self, v31, (uint64_t)v22, 0, v25, v36, v30, v21, v37);

    }
    else
    {
      v34 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A7288](v13);
      if (v34)
      {
        objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v33, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v34)[2](v34, v35);

      }
    }
  }
  else
  {
    v32 = MEMORY[0x2199A7288](v13);
    v21 = (void *)v32;
    if (v32)
      (*(void (**)(uint64_t, _QWORD))(v32 + 16))(v32, 0);
  }

}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  void *v4;
  id writeChannelCompletionHandler;

  v4 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_writeChannelCompletionHandler = v4;

  return self->_writeChannel;
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  objc_msgSend_truncateToLength_completion_(self->_writeChannel, a2, a3, a4);
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_212E5AD74;
  v13[3] = &unk_24CEDA528;
  v14 = v10;
  v11 = v10;
  objc_msgSend_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler_(a1, v12, (uint64_t)a3, 0, a4, a5, v13);

}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  id v11;
  BUZipFileWriter *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  int ResourceValue_forKey_error;
  id v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  int v50;
  id v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  BUFileIOChannel *v76;
  id *v77;
  const char *v78;
  void *v79;
  const char *v80;
  char v81;
  id v82;
  const char *v83;
  void *v84;
  char v85;
  id v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *queue;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[4];
  id v108;
  uint64_t *v109;
  uint64_t v110;
  _QWORD v111[4];
  id v112;
  _QWORD *v113;
  uint64_t *v114;
  uint64_t v115;
  id v116;
  id v117;
  id obj;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  id v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  _QWORD block[4];
  id v137;
  id v138;
  id v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _QWORD v142[4];

  v142[2] = *MEMORY[0x24BDAC8D0];
  v97 = a3;
  v103 = a4;
  v11 = a5;
  queue = a6;
  v102 = a7;
  v12 = [BUZipFileWriter alloc];
  v139 = 0;
  v94 = v11;
  v104 = (void *)objc_msgSend_initWithURL_error_(v12, v13, (uint64_t)v11, &v139);
  v14 = v139;
  v95 = v14;
  if (v104)
  {
    objc_msgSend_path(v97, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17;
    if (!v103)
    {
      objc_msgSend_stringByDeletingLastPathComponent(v17, v18, v19);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    objc_msgSend_stringByStandardizingPath(v20, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_precomposedStringWithCanonicalMapping(v22, v23, v24);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = objc_msgSend_length(v93, v25, v26);
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x24BDBCC60];
    v31 = *MEMORY[0x24BDBCC48];
    v142[0] = *MEMORY[0x24BDBCC60];
    v142[1] = v31;
    v105 = v31;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v32, (uint64_t)v142, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v29, v34, (uint64_t)v97, v33, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v135[0] = 0;
    v135[1] = v135;
    v135[2] = 0x2020000000;
    v135[3] = 0;
    v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v37 = v35;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v131, v141, 16);
    if (v40)
    {
      v106 = 0;
      v41 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v132 != v41)
            objc_enumerationMutation(v37);
          v43 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
          v130 = 0;
          ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v43, v39, (uint64_t)&v130, v30, 0);
          v45 = v130;
          v48 = v45;
          if (ResourceValue_forKey_error && (objc_msgSend_BOOLValue(v45, v46, v47) & 1) == 0)
          {
            v129 = 0;
            v50 = objc_msgSend_getResourceValue_forKey_error_(v43, v49, (uint64_t)&v129, v105, 0);
            v51 = v129;
            v54 = v51;
            if (v50)
              v106 += objc_msgSend_unsignedLongLongValue(v51, v52, v53);
            objc_msgSend_addObject_(v36, v52, (uint64_t)v43);

          }
        }
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v39, (uint64_t)&v131, v141, 16);
      }
      while (v40);
    }
    else
    {
      v106 = 0;
    }

    v123 = 0;
    v124 = &v123;
    v125 = 0x3032000000;
    v126 = sub_212E5A5D4;
    v127 = sub_212E5A5E4;
    v128 = 0;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v57 = v36;
    v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v119, v140, 16);
    if (v59)
    {
      v99 = v100 + 1;
      v101 = *(_QWORD *)v120;
      v98 = *MEMORY[0x24BDBCBE0];
      while (2)
      {
        v62 = v59;
        for (j = 0; j != v62; ++j)
        {
          if (*(_QWORD *)v120 != v101)
            objc_enumerationMutation(v57);
          v64 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
          objc_msgSend_path(v64, v60, v61);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByStandardizingPath(v65, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_precomposedStringWithCanonicalMapping(v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_substringFromIndex_(v71, v72, v99);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103)
          {
            objc_msgSend_stringByAppendingPathComponent_(v103, v73, (uint64_t)v74);
            v75 = objc_claimAutoreleasedReturnValue();

            v74 = (void *)v75;
          }
          v76 = [BUFileIOChannel alloc];
          v77 = (id *)(v124 + 5);
          obj = (id)v124[5];
          v79 = (void *)objc_msgSend_initForReadingURL_error_(v76, v78, (uint64_t)v64, &obj);
          objc_storeStrong(v77, obj);
          if (!v79)
          {

            goto LABEL_35;
          }
          v117 = 0;
          v81 = objc_msgSend_getResourceValue_forKey_error_(v64, v80, (uint64_t)&v117, v105, 0);
          v82 = v117;
          v84 = v82;
          if ((v81 & 1) == 0)
          {

            v84 = 0;
          }
          v116 = 0;
          v85 = objc_msgSend_getResourceValue_forKey_error_(v64, v83, (uint64_t)&v116, v98, 0);
          v86 = v116;
          v89 = v86;
          if ((v85 & 1) == 0)
          {

            v89 = 0;
          }
          v90 = objc_msgSend_unsignedLongLongValue(v84, v87, v88);
          v111[0] = MEMORY[0x24BDAC760];
          v111[1] = 3221225472;
          v111[2] = sub_212E5B510;
          v111[3] = &unk_24CEDA550;
          v113 = v135;
          v112 = v102;
          v114 = &v123;
          v115 = v106;
          objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler_(v104, v91, (uint64_t)v74, 0, v89, v90, 0, v79, v111);

        }
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v119, v140, 16);
        if (v59)
          continue;
        break;
      }
    }
LABEL_35:

    v107[0] = MEMORY[0x24BDAC760];
    v107[1] = 3221225472;
    v107[2] = sub_212E5B5E8;
    v107[3] = &unk_24CEDA578;
    v108 = v102;
    v109 = &v123;
    v110 = v106;
    objc_msgSend_closeWithQueue_completion_(v104, v92, (uint64_t)queue, v107);

    _Block_object_dispose(&v123, 8);
    _Block_object_dispose(v135, 8);

    v56 = v93;
  }
  else
  {
    v55 = v14;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212E5B4D4;
    block[3] = &unk_24CED9B68;
    v138 = v102;
    v137 = v55;
    dispatch_async(queue, block);

    v56 = v138;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end
