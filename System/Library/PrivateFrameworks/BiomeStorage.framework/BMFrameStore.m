@implementation BMFrameStore

- (unsigned)writeFrameV2ForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7
{
  uint64_t v9;
  BMFrameStore *v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  char v28;
  double v29;
  double v30;
  double v31;
  id v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  double v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  int v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  _QWORD v62[2];
  unsigned int v63;
  unsigned int v64;
  _QWORD block[5];
  _BYTE buf[24];
  uint64_t v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v9 = *(_QWORD *)&a5;
  v74 = *MEMORY[0x1E0C80C00];
  v12 = self;
  objc_sync_enter(v12);
  if (a4 >> 31)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) writeFrameV2ForBytes:length:dataVersion:timestamp:outOffset:].cold.1(a4, v13);
LABEL_20:

LABEL_26:
    LOBYTE(v15) = 1;
    goto LABEL_27;
  }
  if (!a4)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.2();
    goto LABEL_20;
  }
  if ((unint64_t)(((_DWORD)a4 + 3) & 0xFFFFFFFC) + 56 > -[BMFrameStore frameStoreSize](v12, "frameStoreSize"))
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.3();

    LOBYTE(v15) = 3;
    goto LABEL_27;
  }
  -[BMFrameStore header](v12, "header");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "start");

  if (!v17)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.4();
    goto LABEL_20;
  }
  if (*(_DWORD *)(v17 + 16) != 10)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v67) = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__BMFrameStore_V2__writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset__onceToken != -1)
      dispatch_once(&writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset__onceToken, block);
    v21 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v20, v21))
    {
      v22 = *(_DWORD *)(v17 + 16);
      v23 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](v12, "segmentPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "privacyPathname:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = 10;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v22;
      *(_WORD *)&buf[14] = 2114;
      *(_QWORD *)&buf[16] = v25;
      _os_log_impl(&dword_1A95BD000, v20, v21, "Segment is the wrong version, expected: %d, found %d in segment: %{public}@", buf, 0x18u);

    }
    goto LABEL_26;
  }
  v18 = -[BMFrameStore atomicReadTotalFramesV2](v12, "atomicReadTotalFramesV2");
  v64 = v18;
  if (v18)
  {
    if ((_DWORD)-[BMFrameStore offsetTablePtrFromFrameNumberV2:](v12, "offsetTablePtrFromFrameNumberV2:", v18 - 1)[4] == 4)
    {
LABEL_43:
      LOBYTE(v15) = 2;
      goto LABEL_27;
    }
    v19 = v64;
  }
  else
  {
    v19 = 0;
  }
  v63 = -[BMFrameStore offsetOfFrameV2:](v12, "offsetOfFrameV2:", v19);
  -[BMFrameStore frames](v12, "frames");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isValidReadFromOffsetV2:withLength:currentFrameCount:", v63, ((_DWORD)a4 + 3) & 0xFFFFFFFC, v64);

  if ((v28 & 1) == 0)
  {
    -[BMFrameStore frames](v12, "frames");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isValidReadFromOffsetV2:withLength:currentFrameCount:", v63, 0, v64);

    if (v35)
    {
      *(_QWORD *)buf = 0x400000000;
      *(double *)&buf[8] = a6;
      -[BMFrameStore appendOffsetTableEntry:outOffsetForFrame:length:frameCount:](v12, "appendOffsetTableEntry:outOffsetForFrame:length:frameCount:", buf, 0, 0, &v64);
    }
    __biome_log_for_category();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[BMFrameStore appendFrameHeaderV1:offset:].cold.1();

    goto LABEL_43;
  }
  -[BMFrameStore lastAbsoluteTimestamp](v12, "lastAbsoluteTimestamp");
  if (v29 > a6)
  {
    -[BMFrameStore lastAbsoluteTimestamp](v12, "lastAbsoluteTimestamp");
    if (v30 - a6 >= 3.0)
      goto LABEL_35;
    v31 = CFAbsoluteTimeGetCurrent() - a6;
    if (v31 < 0.0)
      v31 = -v31;
    if (v31 > 60.0)
    {
LABEL_35:
      v32 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v32, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[BMFrameStore lastAbsoluteTimestamp](v12, "lastAbsoluteTimestamp");
        v51 = v50;
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a6);
        objc_msgSend(v32, "stringFromDate:", v52);
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v54 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[BMFrameStore lastAbsoluteTimestamp](v12, "lastAbsoluteTimestamp");
        v55 = (void *)objc_msgSend(v54, "initWithTimeIntervalSinceReferenceDate:");
        objc_msgSend(v32, "stringFromDate:", v55);
        v56 = (id)objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x1E0D01D10];
        -[BMFrameStore segmentPath](v12, "segmentPath");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "privacyPathname:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "-[BMFrameStore(V2) writeFrameV2ForBytes:length:dataVersion:timestamp:outOffset:]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = a6;
        *(_WORD *)&buf[22] = 2048;
        v67 = v51;
        v68 = 2112;
        v69 = v53;
        v70 = 2112;
        v71 = v56;
        v72 = 2114;
        v73 = v59;
        _os_log_error_impl(&dword_1A95BD000, v33, OS_LOG_TYPE_ERROR, "[%s] Frame should come in chronological order. Input %f < last %f, (%@ < %@) segment:%{public}@", buf, 0x3Eu);

      }
      goto LABEL_26;
    }
    -[BMFrameStore lastAbsoluteTimestamp](v12, "lastAbsoluteTimestamp");
    a6 = v37 + 0.0000001;
  }
  v62[0] = a4 + v63 + 8;
  *(double *)&v62[1] = a6;
  v15 = -[BMFrameStore appendOffsetTableEntry:outOffsetForFrame:length:frameCount:](v12, "appendOffsetTableEntry:outOffsetForFrame:length:frameCount:", v62, &v63, a4, &v64);
  if (v15)
  {
    __biome_log_for_category();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBMFrameWriteStatus(v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.5(v39, buf, v38);
    }

  }
  else
  {
    v61 = bm_generateChecksum((Bytef *)a3, a4) | (unint64_t)(v9 << 32);
    -[BMFrameStore frames](v12, "frames");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "writeBytes:toOffset:length:", &v61, v63, 8);

    -[BMFrameStore frames](v12, "frames");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "writeBytes:toOffset:length:", a3, v63 + 8, a4);

    v60 = v62[0];
    HIDWORD(v62[0]) = 1;
    v42 = v62[0];
    -[BMFrameStore frames](v12, "frames");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "size");
    v45 = v64;

    -[BMFrameStore frames](v12, "frames");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v44 - 16 * v45;
    v48 = objc_msgSend(v46, "atomicWriteEightBytes:toOffset:expected:", v42, v47, &v60);

    if (v48 != 1)
    {
      __biome_log_for_category();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v67) = v48;
        _os_log_error_impl(&dword_1A95BD000, v49, OS_LOG_TYPE_ERROR, "Unable to update status to written, someone else seems to have overwritten the value. We expect to see %llu, but instead are seeing %llu. The write status is %d", buf, 0x1Cu);
      }

      goto LABEL_26;
    }
    LOBYTE(v15) = 0;
    if (a7)
      *a7 = v47;
  }
LABEL_27:
  objc_sync_exit(v12);

  return v15;
}

- (void)enumerateWithOptionsV2:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5
{
  void (**v9)(id, NSObject *, char *);
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  os_log_type_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  $6904A10426020E4F4092C7509944103C *v20;
  void *v21;
  $6904A10426020E4F4092C7509944103C *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  os_log_type_t v28;
  unint64_t v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  os_log_type_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  unsigned int v43;
  double v44;
  double Current;
  double v46;
  int v47;
  uint64_t v48;
  $6904A10426020E4F4092C7509944103C *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  $6904A10426020E4F4092C7509944103C *v54;
  $6904A10426020E4F4092C7509944103C *v55;
  void *v56;
  uint64_t v57;
  unsigned int v58;
  void *v59;
  NSObject *v60;
  unint64_t v61;
  os_log_type_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint64_t v72;
  void *v73;
  double v74;
  void *v75;
  uint64_t *v76;
  id *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  os_log_type_t v81;
  void *v82;
  void *v83;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  BMFrame *v104;
  uint64_t v105;
  int v106;
  int v107;
  unint64_t v108;
  unint64_t v109;
  $6904A10426020E4F4092C7509944103C *context;
  void *contexta;
  int v112;
  unsigned int v113;
  $6904A10426020E4F4092C7509944103C *v114;
  unsigned int v115;
  unsigned int v116;
  uint64_t v117;
  _QWORD v118[5];
  int v119;
  id v120;
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD block[5];
  char v124;
  _QWORD v125[5];
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[5];
  _BYTE buf[36];
  __int16 v130;
  int v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, NSObject *, char *))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFrameStoreV2.m"), 838, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (a4 == 4294967294)
    goto LABEL_42;
  v10 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (!v10)
    goto LABEL_42;
  v11 = v10;
  if (-[BMFrameStore frameStoreSize](self, "frameStoreSize") < 16 * (unint64_t)v10)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke;
    v128[3] = &unk_1E5565DA8;
    v128[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken != -1)
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken, v128);
    v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v13))
    {
      v14 = -[BMFrameStore frameStoreSize](self, "frameStoreSize");
      v15 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "privacyPathname:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v11;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v14;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v17;
      _os_log_impl(&dword_1A95BD000, v12, v13, "enumerateWithOptions: frameStore has totalFrames: %d but file size is too small: %zu in segment: %{public}@", buf, 0x1Cu);

    }
LABEL_41:

    goto LABEL_42;
  }
  v18 = a3 & 8;
  if (a4 != 0xFFFFFFFF && a4)
  {
    LODWORD(v19) = -[BMFrameStore frameNumberFromOffsetToOffsetTableEntryV2:](self, "frameNumberFromOffsetToOffsetTableEntryV2:", a4);
    -[BMFrameStore frames](self, "frames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = ($6904A10426020E4F4092C7509944103C *)(objc_msgSend(v21, "start") + a4);

  }
  else
  {
    if ((a3 & 8) != 0)
      v19 = v11 - 1;
    else
      v19 = 0;
    v20 = -[BMFrameStore offsetTablePtrFromFrameNumberV2:](self, "offsetTablePtrFromFrameNumberV2:", v19);
  }
  if ((_DWORD)v19 == v11)
  {
    if ((a3 & 8) == 0)
      goto LABEL_42;
    LODWORD(v19) = v11 - 1;
    ++v20;
  }
  if ((v19 & 0x80000000) != 0 || v19 > v11)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_33;
    v127[3] = &unk_1E5565DA8;
    v127[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_32 != -1)
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_32, v127);
    v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v23))
    {
      v24 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "privacyPathname:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v11;
      *(_WORD *)&buf[24] = 2114;
      *(_QWORD *)&buf[26] = v26;
      _os_log_impl(&dword_1A95BD000, v12, v23, "enumerateWithOptions: offset:%zu outside of range for frames, mapping to frame: %d when segment has only %d frames in segment: %{public}@", buf, 0x22u);

    }
    goto LABEL_41;
  }
  v116 = v11 - 1;
  v22 = -[BMFrameStore offsetTablePtrFromFrameNumberV2:](self, "offsetTablePtrFromFrameNumberV2:");
  if (v22->var0.var0.var1 == 4)
  {
    ++v22;
    if ((a3 & 8) != 0 && v116 == (_DWORD)v19)
    {
      LODWORD(v19) = v11 - 2;
      ++v20;
    }
  }
  else
  {
    v116 = v11;
  }
  v27 = (v22->var0.var0.var0 + 3) & 0xFFFFFFFC;
  if (-[BMFrameStore frameStoreSize](self, "frameStoreSize") < v27)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_35;
    v126[3] = &unk_1E5565DA8;
    v126[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_34 != -1)
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_34, v126);
    v28 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v28))
    {
      v29 = -[BMFrameStore frameStoreSize](self, "frameStoreSize");
      v30 = v27;
      v31 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "privacyPathname:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v30;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v29;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v33;
      _os_log_impl(&dword_1A95BD000, v12, v28, "enumerateWithOptions: byteAfterLastFramesDataAtEnumerationStart: %u is larger than the segmentSize: %zu in segment: %{public}@", buf, 0x1Cu);

    }
    goto LABEL_41;
  }
  v34 = -[BMFrameStore offsetTableOffsetFromFrameNumberV2:](self, "offsetTableOffsetFromFrameNumberV2:", v116 - 1);
  v113 = v27;
  if (v34 < v27)
  {
    v35 = v34;
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_37;
    v125[3] = &unk_1E5565DA8;
    v125[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_36 != -1)
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_36, v125);
    v36 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v36))
    {
      v37 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "privacyPathname:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v113;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v35;
      *(_WORD *)&buf[14] = 2114;
      *(_QWORD *)&buf[16] = v39;
      _os_log_impl(&dword_1A95BD000, v12, v36, "enumerateWithOptions: byteAfterLastFramesDataAtEnumerationStart: %u is beyond the offset for the last table offset entry %u in segment: %{public}@", buf, 0x18u);

    }
    goto LABEL_41;
  }
  v124 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "timeIntervalSinceReferenceDate");
  v42 = v41;

  v107 = 0;
  v108 = a3;
  if (-[BMFrameStore permission](self, "permission"))
  {
    v43 = v113;
  }
  else
  {
    v43 = v113;
    if (-[BMFrameStore pruneOnAccess](self, "pruneOnAccess")
      && -[BMFrameStore filterByAgeOnRead](self, "filterByAgeOnRead")
      && (-[BMFrameStore maxAge](self, "maxAge"), v44 > 0.0))
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[BMFrameStore maxAge](self, "maxAge");
      v42 = Current - v46;
      v107 = 1;
    }
    else
    {
      v107 = 0;
    }
  }
  v47 = v19 - 1;
  v48 = 1;
  if ((a3 & 8) != 0)
    v48 = 0xFFFFFFFFFFFFFFFLL;
  v49 = &v20[v48];
  if (v18)
    v50 = -1;
  else
    v50 = 1;
  if (v18)
    v51 = 1;
  else
    v51 = 0xFFFFFFFFFFFFFFFLL;
  v109 = v18;
  v100 = v18 >> 3;
  if (v18)
    v47 = v19 + 1;
  v52 = (v47 + v50);
  v112 = v50;
  v53 = v47 + 2 * v50;
  v54 = &v49[v51];
  v55 = v49;
  v117 = v51 * 16;
  while (1)
  {
    v114 = v54;
    v115 = v53;
    v56 = (void *)MEMORY[0x1AF4163D4]();
    if ((v52 & 0x80000000) != 0 || v52 >= v116)
      goto LABEL_120;
    if ((_DWORD)v52)
    {
      v57 = v117;
      v58 = (*(unsigned int *)((char *)&v55[1].var0.var0.var0 + v117) + 3) & 0xFFFFFFFC;
    }
    else
    {
      v58 = 0;
      v57 = v117;
    }
    if (v58 < v43)
      goto LABEL_123;
    if (v58 == v43)
      goto LABEL_120;
    context = v49;
    v59 = v56;
    __biome_log_for_category();
    v60 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_39;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_38 != -1)
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_38, block);
    v61 = v109;
    v62 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v60, v62))
    {
      v63 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "privacyPathname:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v58;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v113;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v116;
      *(_WORD *)&buf[20] = 2112;
      *(_QWORD *)&buf[22] = v65;
      _os_log_impl(&dword_1A95BD000, v60, v62, "enumerateWithOptions: offset (%u) beyond the space used:%u by the currentFrameCount:%d  segment:%@", buf, 0x1Eu);

      v61 = v109;
    }

    v43 = v113;
    v57 = v117;
    v56 = v59;
    v49 = context;
    if (v61)
    {
LABEL_123:
      v66 = (uint64_t)v55 + v57;
      v67 = *(unsigned int *)((char *)&v55->var0.var0.var0 + v57);
      v68 = v67 - v58;
      if (v68 <= v43)
        break;
    }
LABEL_117:
    objc_autoreleasePoolPop(v56);
    v52 = (v52 + v112);
    v53 = v115 + v112;
    v55 = ($6904A10426020E4F4092C7509944103C *)((char *)v55 + v117);
    v49 = ($6904A10426020E4F4092C7509944103C *)((char *)v49 + v117);
    v54 = ($6904A10426020E4F4092C7509944103C *)((char *)v114 + v117);
    if (v124)
      goto LABEL_42;
  }
  v69 = *(unsigned int *)((char *)&v55->var0.var0.var1 + v57);
  switch((int)v69)
  {
    case 0:
      if (v67 != v58)
        goto LABEL_117;
      goto LABEL_119;
    case 1:
      if (!v107)
        goto LABEL_89;
      v74 = *(double *)((char *)&v55->var1 + v57);
      if (!v109 || v74 >= v42)
      {
        if (v74 < v42)
          goto LABEL_117;
LABEL_89:
        if (v124)
          goto LABEL_120;
        v103 = (uint64_t)v55 + v57;
        contexta = v56;
        v120 = 0;
        -[BMFrameStore frames](self, "frames");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v58;
        v76 = (uint64_t *)(objc_msgSend(v75, "start") + v58);

        v119 = 0;
        if ((_DWORD)v69 == 1)
          v77 = &v120;
        else
          v77 = 0;
        LOBYTE(v97) = (_DWORD)v69 == 1;
        v106 = v69;
        if (-[BMFrameStore isValidFrameV2:currentFrame:expectedState:copyOfData:frameState:frameSize:validations:enumerationOptions:errorCode:](self, "isValidFrameV2:currentFrame:expectedState:copyOfData:frameState:frameSize:validations:enumerationOptions:errorCode:", v76, v52, 1, v77, v69, v68, v97, v108, &v119))
        {
          -[BMFrameStore frames](self, "frames");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "start");

          if ((v115 & 0x80000000) != 0 || v115 > v116)
          {
            if (v109)
              v90 = 4294967294;
            else
              v90 = -[BMFrameStore offsetTableOffsetFromFrameNumberV2:](self, "offsetTableOffsetFromFrameNumberV2:", v116);
            v99 = v90;
            v80 = v117;
          }
          else
          {
            v80 = v117;
            v99 = (uint64_t)v114 + v117 - v79;
          }
          v105 = (uint64_t)v49 + v80 - v79;
          v102 = *v76;
          v104 = [BMFrame alloc];
          -[BMFrameStore backingFile](self, "backingFile");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "attributes");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "path");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = *(double *)((char *)&v55->var1 + v80);
          *(_QWORD *)buf = v102;
          memset(&buf[8], 0, 24);
          LODWORD(v98) = v106;
          v84 = -[BMFrame initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:](v104, "initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:", buf, v93, v120, v66, v105, v99, v94, 10, v98);

          v95 = v120;
          v120 = 0;

          v9[2](v9, v84, &v124);
        }
        else
        {
          v43 = v113;
          if (v119 == 5 && *(_DWORD *)(v103 + 4) != 1)
          {
LABEL_115:

LABEL_116:
            v56 = contexta;
            goto LABEL_117;
          }
          __biome_log_for_category();
          v84 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          buf[24] = 16;
          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_45;
          v118[3] = &unk_1E5565DA8;
          v118[4] = buf;
          if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_44 != -1)
            dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_44, v118);
          v85 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
          _Block_object_dispose(buf, 8);
          if (os_log_type_enabled(v84, v85))
          {
            v86 = v119;
            v87 = (void *)MEMORY[0x1E0D01D10];
            -[BMFrameStore segmentPath](self, "segmentPath");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "privacyPathname:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&buf[4] = v86;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v52;
            *(_WORD *)&buf[14] = 1024;
            *(_DWORD *)&buf[16] = v101;
            *(_WORD *)&buf[20] = 2114;
            *(_QWORD *)&buf[22] = v89;
            _os_log_impl(&dword_1A95BD000, v84, v85, "isValidFrame returned a %d error for frame number:%d at offset %u, skipping frame in segment: %{public}@", buf, 0x1Eu);

          }
        }
        v43 = v113;

        goto LABEL_115;
      }
LABEL_119:
      v124 = 1;
LABEL_120:
      objc_autoreleasePoolPop(v56);
LABEL_42:

      return;
    case 2:
      if ((v108 & 2) == 0)
        goto LABEL_117;
      goto LABEL_89;
    case 3:
      if ((v108 & 1) == 0)
        goto LABEL_117;
      goto LABEL_89;
    case 4:
      goto LABEL_119;
    case 5:
      contexta = v56;
      __biome_log_for_category();
      v70 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      buf[24] = 16;
      v122[0] = MEMORY[0x1E0C809B0];
      v122[1] = 3221225472;
      v122[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_41;
      v122[3] = &unk_1E5565DA8;
      v122[4] = buf;
      if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_40 != -1)
        dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_40, v122);
      v81 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (!os_log_type_enabled(v70, v81))
        goto LABEL_102;
      v82 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "privacyPathname:", v83);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v58;
      *(_WORD *)&buf[8] = 2114;
      *(_QWORD *)&buf[10] = v73;
      _os_log_impl(&dword_1A95BD000, v70, v81, "Found frame with state: BMFrameStateUnknown at offset:%u in segment: %{public}@", buf, 0x12u);

      goto LABEL_101;
    default:
      contexta = v56;
      __biome_log_for_category();
      v70 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      buf[24] = 16;
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_43;
      v121[3] = &unk_1E5565DA8;
      v121[4] = buf;
      if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_42 != -1)
        dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_42, v121);
      v71 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (!os_log_type_enabled(v70, v71))
        goto LABEL_102;
      -[BMFrameStore _printablePathV2](self, "_printablePathV2");
      v72 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v69;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v52;
      *(_WORD *)&buf[14] = 2114;
      *(_QWORD *)&buf[16] = v72;
      v73 = (void *)v72;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v58;
      *(_WORD *)&buf[30] = 1024;
      *(_DWORD *)&buf[32] = v68;
      v130 = 1024;
      v131 = v100;
      _os_log_impl(&dword_1A95BD000, v70, v71, "Unrecognized frame state: %d, frame number:%d, segment:%{public}@ offset:%u frame size:%u reverse:%d", buf, 0x2Au);
LABEL_101:

LABEL_102:
      v43 = v113;

      goto LABEL_116;
  }
}

- (unsigned)atomicReadTotalFramesV2
{
  void *v3;
  uint64_t v4;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  __int128 buf;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[BMFrameStore header](self, "header");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "start");

  if (*(_DWORD *)(v4 + 16) == 10)
    return atomic_load((unsigned int *)(v4 + 4));
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 16;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__BMFrameStore_V2__atomicReadTotalFramesV2__block_invoke;
  block[3] = &unk_1E5565DA8;
  block[4] = &buf;
  if (atomicReadTotalFramesV2_onceToken != -1)
    dispatch_once(&atomicReadTotalFramesV2_onceToken, block);
  v7 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (void *)MEMORY[0x1E0D01D10];
    -[BMFrameStore segmentPath](self, "segmentPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "privacyPathname:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A95BD000, v6, v7, "Seeking totalFrames but not a V2 frameStore: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  return 0;
}

- (BMMemoryMapping)header
{
  return self->_header;
}

- (unint64_t)frameStoreSize
{
  return self->_frameStoreSize;
}

- (int)frameNumberFromOffsetToOffsetTableEntryV2:(unsigned int)a3
{
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;

  -[BMFrameStore frames](self, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "size");

  if (v6 < a3)
    return -1;
  -[BMFrameStore frames](self, "frames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = ((objc_msgSend(v8, "size") - a3) >> 4) - 1;

  return v7;
}

- (BMMemoryMapping)frames
{
  return self->_frames;
}

- (void)enumerateWithOptions:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  unsigned int datastoreVersion;
  NSObject *v10;
  os_log_type_t v11;
  unsigned int v12;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    -[BMFrameStore enumerateWithOptionsV2:fromOffset:usingBlock:](self, "enumerateWithOptionsV2:fromOffset:usingBlock:", a3, a4, v8);
  }
  else if (datastoreVersion == 9)
  {
    -[BMFrameStore enumerateWithOptionsV1:fromOffset:usingBlock:](self, "enumerateWithOptionsV1:fromOffset:usingBlock:", a3, a4, v8);
  }
  else
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x2020000000;
    v17 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__BMFrameStore_enumerateWithOptions_fromOffset_usingBlock___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (enumerateWithOptions_fromOffset_usingBlock__onceToken != -1)
      dispatch_once(&enumerateWithOptions_fromOffset_usingBlock__onceToken, block);
    v11 = v15[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = self->_datastoreVersion;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1A95BD000, v10, v11, "-[BMFrameStore enumerateWithOptions:fromOffset:usingBlock:] called with unexpected dataVersion:%d", buf, 8u);
    }

  }
}

- (void)setPruneOnAccess:(BOOL)a3
{
  self->_pruneOnAccess = a3;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (void)setFilterByAgeOnRead:(BOOL)a3
{
  self->_filterByAgeOnRead = a3;
}

- (BMFrameStore)initWithFileHandleV2:(id)a3 permission:(unint64_t)a4
{
  NSObject *v4;
  id v7;
  BMFrameStore *v8;
  BMFrameStore *v9;
  BMFrameStore *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BMFrameStore *v16;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  unsigned int v24;
  unint64_t v25;
  BMMemoryMapping *v26;
  BMMemoryMapping *v27;
  unint64_t v28;
  uint64_t v29;
  BMMemoryMapping *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  void *v41;
  void *v42;
  char v43;
  int v44;
  os_log_type_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _DWORD *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  signed int v62;
  char v63;
  void *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  os_log_type_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  int v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD block[5];
  uint64_t v87;
  objc_super v88;
  _BYTE buf[28];
  __int16 v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v88.receiver = self;
  v88.super_class = (Class)BMFrameStore;
  v8 = -[BMFrameStore init](&v88, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_69:
    v10 = v9;
    goto LABEL_70;
  }
  -[BMFrameStore setBackingFile:](v8, "setBackingFile:", v7);
  -[BMFrameStore setDatastoreVersion:](v9, "setDatastoreVersion:", 10);
  v87 = 0;
  v95 = 0;
  v93 = 0u;
  v94 = 0u;
  v92 = 0u;
  if (!-[BMFrameStore getSegmentHeader:fromFileV2:fileSize:](v9, "getSegmentHeader:fromFileV2:fileSize:", &v92, v7, &v87))
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (initWithFileHandleV2_permission__onceToken != -1)
      dispatch_once(&initWithFileHandleV2_permission__onceToken, block);
    v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v4, v11))
      goto LABEL_11;
    v12 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(v7, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "privacyPathname:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl(&dword_1A95BD000, v4, v11, "Cannot create frame store from segment file: %{public}@", buf, 0xCu);

    goto LABEL_9;
  }
  -[BMFrameStore setDatastoreVersion:](v9, "setDatastoreVersion:", v93);
  if (-[BMFrameStore datastoreVersion](v9, "datastoreVersion") == 9)
  {
    v10 = -[BMFrameStore initWithFileHandleV1:permission:](v9, "initWithFileHandleV1:permission:", v7, a4);
LABEL_70:
    v9 = v10;
    v16 = v10;
    goto LABEL_71;
  }
  if ((_DWORD)v93 != 10)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_4;
    v85[3] = &unk_1E5565DA8;
    v85[4] = buf;
    if (initWithFileHandleV2_permission__onceToken_3 != -1)
      dispatch_once(&initWithFileHandleV2_permission__onceToken_3, v85);
    v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v4, v17))
    {
      v18 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore backingFile](v9, "backingFile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "privacyPathname:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v93;
      v24 = -[BMFrameStore datastoreVersion](v9, "datastoreVersion");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v23;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = v24;
      _os_log_impl(&dword_1A95BD000, v4, v17, "Segment version of %{public}@ doesn't match expected versions. Header set to %{public}d, preferred %{public}d.", buf, 0x18u);

    }
    goto LABEL_11;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 && !DWORD1(v92))
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) initWithFileHandleV2:permission:].cold.1(v9);
    goto LABEL_11;
  }
  v25 = (v87 + 7) & 0xFFFFFFFFFFFFFFF8;
  -[BMFrameStore setFrameStoreSize:](v9, "setFrameStoreSize:", v25);
  -[BMFrameStore setPermission:](v9, "setPermission:", a4);
  if (a4 == 2 || a4 == 1)
  {
    v26 = -[BMMemoryMapping initWithSize:protection:advice:offset:]([BMMemoryMapping alloc], "initWithSize:protection:advice:offset:", 32, 2, 1, 0);
    v27 = [BMMemoryMapping alloc];
    v28 = v25 - 32;
    v29 = 2;
  }
  else
  {
    if (a4)
      goto LABEL_27;
    v26 = -[BMMemoryMapping initWithSize:protection:advice:offset:]([BMMemoryMapping alloc], "initWithSize:protection:advice:offset:", 32, 1, 1, 0);
    v27 = [BMMemoryMapping alloc];
    v28 = v25 - 32;
    v29 = 1;
  }
  v30 = -[BMMemoryMapping initWithSize:protection:advice:offset:](v27, "initWithSize:protection:advice:offset:", v28, v29, 2, 32);
  *(_QWORD *)buf = v26;
  *(_QWORD *)&buf[8] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v4 = objc_claimAutoreleasedReturnValue();

LABEL_27:
  -[NSObject lastObject](v4, "lastObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrameStore setFrames:](v9, "setFrames:", v31);

  if ((unint64_t)-[NSObject count](v4, "count") >= 2)
  {
    -[NSObject firstObject](v4, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMFrameStore setHeader:](v9, "setHeader:", v32);

  }
  -[BMFrameStore header](v9, "header");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v33)
  {
    __biome_log_for_category();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[BMFrameStore initWithFileHandleV1:permission:].cold.5();

  }
  -[BMFrameStore header](v9, "header");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    -[BMFrameStore header](v9, "header");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMFrameStore backingFile](v9, "backingFile");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "mapWithFileHandle:fileSize:", v38, v25);

    if ((v39 & 1) == 0)
    {
      __biome_log_for_category();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[BMFrameStore(V2) initWithFileHandleV2:permission:].cold.4(v9);

    }
  }
  -[BMFrameStore frames](v9, "frames");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrameStore backingFile](v9, "backingFile");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v41, "mapWithFileHandle:fileSize:", v42, v25);

  if ((v43 & 1) == 0)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) initWithFileHandleV2:permission:].cold.3(v9);
    goto LABEL_10;
  }
  v44 = DWORD1(v92);
  if (a4 != 1 || !DWORD1(v92))
    goto LABEL_62;
  if (v25 < 16 * DWORD1(v92))
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_6;
    v84[3] = &unk_1E5565DA8;
    v84[4] = buf;
    if (initWithFileHandleV2_permission__onceToken_5 != -1)
      dispatch_once(&initWithFileHandleV2_permission__onceToken_5, v84);
    v45 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v45))
    {
      v46 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore backingFile](v9, "backingFile");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "attributes");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "path");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "privacyPathname:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v87;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = DWORD1(v92);
      _os_log_impl(&dword_1A95BD000, v15, v45, "Attempted to open %{public}@ for writing but the file size is: %zu, which lacks space for an offsetTable with %d frames", buf, 0x1Cu);

    }
    goto LABEL_10;
  }
  v51 = 16 * DWORD1(v92);
  -[BMFrameStore frames](v9, "frames");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (_DWORD *)(objc_msgSend(v52, "end") - v51);

  if (v53[1] == 4)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v54 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore backingFile](v9, "backingFile");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "attributes");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "path");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "privacyPathname:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v87;
      _os_log_impl(&dword_1A95BD000, v15, OS_LOG_TYPE_INFO, "Attempted to open %{public}@ for writing but the file is already full, and has an EOF, fileSize:%zu", buf, 0x16u);

    }
    goto LABEL_10;
  }
  v59 = *v53 + 3;
  -[BMFrameStore frames](v9, "frames");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "size");

  v62 = v59 & 0xFFFFFFFC;
  if (v59 < 0 != v63 || v61 - v51 < (unint64_t)v62)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 16;
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_8;
    v83[3] = &unk_1E5565DA8;
    v83[4] = buf;
    if (initWithFileHandleV2_permission__onceToken_7 != -1)
      dispatch_once(&initWithFileHandleV2_permission__onceToken_7, v83);
    v70 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v70))
    {
      v71 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore backingFile](v9, "backingFile");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "attributes");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "path");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "privacyPathname:", v80);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMFrameStore frames](v9, "frames");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "start");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v72;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v62;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = (char *)v53 - v74;
      v90 = 2048;
      v91 = v87;
      _os_log_impl(&dword_1A95BD000, v15, v70, "Segment %{public}@ indicates an endOfFrames value: %d in the last offsetTableEntry (offset): %ld beyond the data space size: %zu", buf, 0x26u);

    }
    goto LABEL_10;
  }
  -[BMFrameStore frames](v9, "frames");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "size") - v51 - v62;

  if (v65 > 0x17)
  {
    v44 = DWORD1(v92);
LABEL_62:
    if (v44)
    {
      v75 = 16 * v44;
      -[BMFrameStore frames](v9, "frames");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "end") - v75;

      -[BMFrameStore setLastAbsoluteTimestamp:](v9, "setLastAbsoluteTimestamp:", *(double *)(v77 + 8));
    }
    -[BMFrameStore lastAbsoluteTimestamp](v9, "lastAbsoluteTimestamp");
    if (!+[BMFrameStore expectedTimestamp:](BMFrameStore, "expectedTimestamp:"))
    {
      __biome_log_for_category();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        -[BMFrameStore(V2) initWithFileHandleV2:permission:].cold.2(v9);

      -[BMFrameStore setLastAbsoluteTimestamp:](v9, "setLastAbsoluteTimestamp:", CFAbsoluteTimeGetCurrent());
    }

    goto LABEL_69;
  }
  __biome_log_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    goto LABEL_10;
  v66 = (void *)MEMORY[0x1E0D01D10];
  -[BMFrameStore backingFile](v9, "backingFile");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "attributes");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "path");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "privacyPathname:", v69);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543874;
  *(_QWORD *)&buf[4] = v13;
  *(_WORD *)&buf[12] = 1024;
  *(_DWORD *)&buf[14] = v65;
  *(_WORD *)&buf[18] = 2048;
  *(_QWORD *)&buf[20] = v87;
  _os_log_impl(&dword_1A95BD000, v15, OS_LOG_TYPE_INFO, "Attempted to open %{public}@ for writing but the file is already full, remaining space:%d, fileSize:%zu", buf, 0x1Cu);

LABEL_9:
LABEL_10:

LABEL_11:
  v16 = 0;
LABEL_71:

  return v16;
}

- (BMFileHandle)backingFile
{
  return self->_backingFile;
}

- (void)setDatastoreVersion:(unsigned int)a3
{
  self->_datastoreVersion = a3;
}

- (NSString)segmentName
{
  void *v2;
  void *v3;

  -[BMFileHandle attributes](self->_backingFile, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- ($6904A10426020E4F4092C7509944103C)offsetTablePtrFromFrameNumberV2:(unsigned int)a3
{
  void *v4;
  $6904A10426020E4F4092C7509944103C *v5;

  -[BMFrameStore frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ($6904A10426020E4F4092C7509944103C *)(objc_msgSend(v4, "end") - 16 * (a3 + 1));

  return v5;
}

- (void)setLastAbsoluteTimestamp:(double)a3
{
  self->_lastAbsoluteTimestamp = a3;
}

- (double)lastAbsoluteTimestamp
{
  return self->_lastAbsoluteTimestamp;
}

- (unsigned)offsetTableOffsetFromFrameNumberV2:(unsigned int)a3
{
  void *v4;
  unsigned int v5;

  -[BMFrameStore frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "size") - 16 * a3 - 16;

  return v5;
}

- (unint64_t)permission
{
  return self->_permission;
}

- (BOOL)pruneOnAccess
{
  return self->_pruneOnAccess;
}

- (void)setPermission:(unint64_t)a3
{
  self->_permission = a3;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (void)setFrameStoreSize:(unint64_t)a3
{
  self->_frameStoreSize = a3;
}

+ (BOOL)expectedTimestamp:(double)a3
{
  return CFAbsoluteTimeGetCurrent() + 604800.0 > a3 && a3 >= 0.0;
}

- (void)setBackingFile:(id)a3
{
  objc_storeStrong((id *)&self->_backingFile, a3);
}

- (BOOL)getSegmentHeader:(id *)a3 fromFileV2:(id)a4 fileSize:(unint64_t *)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  ssize_t v10;
  uint64_t v11;
  __int128 *p_buf;
  BOOL v13;
  __int128 v15;
  stat v16;
  __int128 __buf;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  memset(&v16.st_size, 0, 48);
  if (fstat(objc_msgSend(v7, "fd", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v16))
  {
    __error();
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.6(v7);
LABEL_4:

LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  if (!v16.st_size)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.1(v7);
    goto LABEL_23;
  }
  if (v16.st_size <= 0x37uLL)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.2(v7);
LABEL_23:

    goto LABEL_24;
  }
  v20[0] = 0;
  v18 = 0u;
  v19 = 0u;
  __buf = 0u;
  v10 = pread(objc_msgSend(v7, "fd"), &__buf, 0x38uLL, 0);
  if (v10 < 0)
  {
    __error();
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.3(v7);
    goto LABEL_4;
  }
  if (v10 != 56)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.5(v7);
    goto LABEL_23;
  }
  v11 = 52;
  if ((_DWORD)v18 == 9)
  {
    p_buf = (__int128 *)((char *)v20 + 4);
  }
  else
  {
    v11 = 0;
    p_buf = &__buf;
  }
  if (*(_DWORD *)((char *)&__buf + v11) != *(_DWORD *)"SEGB")
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.4(p_buf, v7, v9);
    goto LABEL_23;
  }
  if (a5)
    *a5 = v16.st_size;
  if (a3)
  {
    v15 = v18;
    *(_OWORD *)a3->var0.var0 = __buf;
    *(_OWORD *)&a3->var2.var3 = v15;
    *((_OWORD *)&a3->var2 + 2) = v19;
    *((_QWORD *)&a3->var2 + 6) = v20[0];
  }
  v13 = 1;
LABEL_25:

  return v13;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (unsigned)offsetOfFrameV2:(unsigned int)a3
{
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  unsigned int *v14;
  unsigned int v15;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (!a3)
    return 0;
  v6 = v5;
  if (v5 < a3)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__BMFrameStore_V2__offsetOfFrameV2___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (offsetOfFrameV2__onceToken != -1)
      dispatch_once(&offsetOfFrameV2__onceToken, block);
    v8 = v18[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "privacyPathname:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v18) = 1024;
      *(_DWORD *)((char *)&v18 + 2) = v6;
      HIWORD(v18) = 2114;
      v19 = (uint64_t)v11;
      _os_log_impl(&dword_1A95BD000, v7, v8, "offsetOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);

    }
    return 0;
  }
  -[BMFrameStore frames](self, "frames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (unsigned int *)(objc_msgSend(v13, "end") - 16 * a3);

  v15 = *v14;
  if (!*v14)
  {
    if (v14[1] == 4)
      v15 = -[BMFrameStore offsetOfFrameV2:](self, "offsetOfFrameV2:", a3 - 1);
    else
      v15 = 0;
  }
  return (v15 + 3) & 0xFFFFFFFC;
}

- (BOOL)filterByAgeOnRead
{
  return self->_filterByAgeOnRead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrintablePathV2, 0);
  objc_storeStrong((id *)&self->_backingFile, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_cachedPrintablePath, 0);
  objc_storeStrong((id *)&self->_framePointers, 0);
}

- (unsigned)appendOffsetTableEntry:(id *)a3 outOffsetForFrame:(unsigned int *)a4 length:(unsigned int)a5 frameCount:(unsigned int *)a6
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  CFAbsoluteTime Current;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  double var1;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  NSObject *v37;
  os_log_type_t v38;
  unsigned int v39;
  NSObject *v40;
  NSObject *v41;
  unsigned int v42;
  unsigned int *v43;
  uint64_t v44;
  _QWORD v45[2];
  _QWORD block[5];
  _BYTE buf[24];
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") != 10)
  {
    __biome_log_for_category();
    v37 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v48) = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__BMFrameStore_V2__appendOffsetTableEntry_outOffsetForFrame_length_frameCount___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (appendOffsetTableEntry_outOffsetForFrame_length_frameCount__onceToken != -1)
      dispatch_once(&appendOffsetTableEntry_outOffsetForFrame_length_frameCount__onceToken, block);
    v38 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v37, v38))
    {
      v39 = -[BMFrameStore datastoreVersion](self, "datastoreVersion");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v39;
      _os_log_impl(&dword_1A95BD000, v37, v38, "appendOffsetTable called with unexpected dataVersion:%d", buf, 8u);
    }

    return 1;
  }
  v43 = a4;
  v45[0] = 0;
  v45[1] = 0;
  LODWORD(v11) = *a6;
  -[BMFrameStore frames](self, "frames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "size") - 16 * (v11 + 1);

  -[BMFrameStore frames](self, "frames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "atomicWriteEightBytes:toOffset:expected:", a3->var0.var1, v13, v45);

  v42 = a5;
  if (v15 == 1)
  {
LABEL_11:
    if (v43)
      *v43 = a3->var0.var0.var0 - v42 - 8;
    -[BMFrameStore updateToMaxOfTotalFramesAnd:](self, "updateToMaxOfTotalFramesAnd:", (v11 + 1));
    *a6 = v11 + 1;
    -[BMFrameStore setLastAbsoluteTimestamp:](self, "setLastAbsoluteTimestamp:", a3->var1);
    var1 = a3->var1;
    v31 = v13 + 8;
    -[BMFrameStore frames](self, "frames");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(objc_msgSend(v32, "start") + v13 + 8);

    v44 = v33;
    -[BMFrameStore frames](self, "frames");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "atomicWriteEightBytes:toOffset:expected:", *(_QWORD *)&var1, v31, &v44);

    if (v35 == 1)
      return 2 * (a3->var0.var0.var1 == 4);
    __biome_log_for_category();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 1024;
      v48 = v35;
      _os_log_error_impl(&dword_1A95BD000, v40, OS_LOG_TYPE_ERROR, "Unable to update creationTimestamp. We expect to see %llu, but instead are seeing %llu. The write status is %d", buf, 0x1Cu);
    }

    return 1;
  }
  v16 = a5;
  v17 = a5 + 8;
  v18 = (v16 + 3) & 0xFFFFFFFC;
  while (HIDWORD(v45[0]) != 4)
  {
    v11 = (v11 + 1);
    -[BMFrameStore frames](self, "frames");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "end") - 16 * v11;

    v21 = *(double *)(v20 + 8);
    Current = CFAbsoluteTimeGetCurrent();
    if (v21 >= Current)
      Current = v21;
    a3->var1 = Current;
    v23 = (LODWORD(v45[0]) + 3) & 0xFFFFFFFC;
    a3->var0.var0.var0 = v17 + v23;
    v45[0] = 0;
    -[BMFrameStore frames](self, "frames");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isValidReadFromOffsetV2:withLength:currentFrameCount:", v23, v18, v11);

    if ((v25 & 1) == 0)
    {
      -[BMFrameStore frames](self, "frames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isValidReadFromOffsetV2:withLength:currentFrameCount:", v23, 0, v11);

      if (!v27)
      {
        __biome_log_for_category();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[BMFrameStore appendFrameHeaderV1:offset:].cold.1();

        return 2;
      }
      a3->var0.var1 = 0x400000000;
    }
    v13 -= 16;
    -[BMFrameStore frames](self, "frames");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "atomicWriteEightBytes:toOffset:expected:", a3->var0.var1, v13, v45);

    if (v29 == 1)
      goto LABEL_11;
  }
  return 2;
}

- (void)updateToMaxOfValueAtOffset:(unsigned int)a3 newValue:(int)a4
{
  void *v7;
  uint64_t v8;
  unsigned int *v9;
  int v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  unsigned int v14;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") == 10)
  {
    -[BMFrameStore header](self, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "start");

    v9 = (unsigned int *)(v8 + a3);
    v10 = atomic_load(v9);
    if (v10 < a4)
    {
      do
      {
        while (1)
        {
          v11 = __ldaxr(v9);
          if (v11 != v10)
            break;
          if (!__stlxr(a4, v9))
            return;
        }
        __clrex();
        v10 = v11;
      }
      while (v11 < a4);
    }
  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__BMFrameStore_V2__updateToMaxOfValueAtOffset_newValue___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (updateToMaxOfValueAtOffset_newValue__onceToken != -1)
      dispatch_once(&updateToMaxOfValueAtOffset_newValue__onceToken, block);
    v13 = v17[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v13))
    {
      v14 = -[BMFrameStore datastoreVersion](self, "datastoreVersion");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v14;
      _os_log_impl(&dword_1A95BD000, v12, v13, "updateToMaxOfValueAtOffset called with unexpected datastoreVersion:%d", buf, 8u);
    }

  }
}

- (void)updateToMaxOfTotalFramesAnd:(unsigned int)a3
{
  -[BMFrameStore updateToMaxOfValueAtOffset:newValue:](self, "updateToMaxOfValueAtOffset:newValue:", 4, *(_QWORD *)&a3);
}

- (unsigned)datastoreVersion
{
  return self->_datastoreVersion;
}

- (BOOL)isValidFrameV2:(void *)a3 currentFrame:(unsigned int)a4 expectedState:(unsigned int)a5 copyOfData:(id *)a6 frameState:(unsigned int)a7 frameSize:(unsigned int)a8 validations:(BOOL)a9 enumerationOptions:(unint64_t)a10 errorCode:(int *)a11
{
  uint64_t v11;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  BOOL v34;
  id v35;
  uLong Checksum;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  int v41;
  unsigned int v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  void *v48;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  _QWORD block[5];
  _BYTE buf[24];
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _QWORD v68[3];

  v11 = *(_QWORD *)&a8;
  v68[1] = *MEMORY[0x1E0C80C00];
  v15 = a3 & 3;
  if ((a3 & 3) != 0)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isValidFrameV2: Frame is not 4-byte aligned:%d"), a3);
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v67 = *MEMORY[0x1E0CB2D50];
    v68[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 1, v18);

  }
  else
  {
    v19 = 0;
  }
  v20 = v15 == 0;
  -[BMFrameStore frames](self, "frames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "end");

  if (!v20)
    goto LABEL_23;
  v23 = v22 - ((_QWORD)a3 + 8);
  if ((v23 & 0x8000000000000000) != 0 || v23 < v11)
  {
    -[BMFrameStore frames](self, "frames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "start");

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isValidFrameV2: Frame size:%d runs past the remaining free space in the segment:%td, frame intended to start at offset:%td"), v11, v23, (char *)a3 - v27);
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v65 = *MEMORY[0x1E0CB2D50];
    v66 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 2, v30);

LABEL_22:
    v19 = (void *)v31;
    goto LABEL_23;
  }
  if (a7 != a5 && a9)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (a5 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = *(&off_1E55660E0 + (int)a5);
    }
    if (a7 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), a7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = *(&off_1E55660E0 + (int)a7);
    }
    v38 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("isValidFrame: Unexpected frame state. Expected: %@, found: %@"), v25, v37);

    v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v39, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 3, v40);

    goto LABEL_22;
  }
  if (!a6)
    goto LABEL_16;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)a3 + 8, v11 - 8);
  v33 = *a6;
  *a6 = v32;

  v34 = 1;
  if (a5 - 1 > 1 || !a9)
    goto LABEL_40;
  v35 = *a6;
  Checksum = bm_generateChecksum((Bytef *)objc_msgSend(v35, "bytes"), (int)v11 - 8);

  if ((_DWORD)Checksum == *(_DWORD *)a3)
  {
LABEL_16:
    v34 = 1;
    goto LABEL_40;
  }
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Checksums don't match. Header: %u, Generated checksum: %u. Skipping frame."), *(unsigned int *)a3, Checksum);
  v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v61 = *MEMORY[0x1E0CB2D50];
  v62 = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v51, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 5, v52);

  v54 = *a6;
  *a6 = 0;

  v19 = (void *)v53;
LABEL_23:
  v41 = objc_msgSend(v19, "code");
  if (a11)
    *a11 = v41;
  if (v41 == 5 || v41 == 3)
  {
    v42 = -[BMFrameStore stateOfFrameV2:](self, "stateOfFrameV2:", a4);
    if ((a10 & 1) != 0 && v42 == 3 || (a10 & 2) != 0 && v42 == 2)
    {
      v43 = 0;
      v34 = 1;
    }
    else
    {
      v34 = 0;
      v43 = (v42 & 0xFFFFFFFE) != 2;
    }
  }
  else
  {
    v34 = 0;
    v43 = 1;
  }
  -[BMFrameStore frames](self, "frames");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "start");

  if (v43)
  {
    __biome_log_for_category();
    v46 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v60) = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__BMFrameStore_V2__isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode__onceToken != -1)
      dispatch_once(&isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode__onceToken, block);
    v47 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v46, v47))
    {
      -[BMFrameStore _printablePathV2](self, "_printablePathV2");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = (char *)a3 - v45;
      *(_WORD *)&buf[22] = 2112;
      v60 = v19;
      _os_log_impl(&dword_1A95BD000, v46, v47, "isValidFrame failed, path:%{public}@, offset:%td error:%@", buf, 0x20u);

    }
  }
LABEL_40:

  return v34;
}

- (unsigned)writeFrameForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7
{
  unsigned int datastoreVersion;
  NSObject *v10;
  os_log_type_t v11;
  unsigned int v12;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
    return -[BMFrameStore writeFrameV2ForBytes:length:dataVersion:timestamp:outOffset:](self, "writeFrameV2ForBytes:length:dataVersion:timestamp:outOffset:", a3, a4, *(_QWORD *)&a5, a7, a6);
  if (datastoreVersion == 9)
    return -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:](self, "writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:", a3, a4, *(_QWORD *)&a5, a7, a6);
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x2020000000;
  v17 = 16;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__BMFrameStore_writeFrameForBytes_length_dataVersion_timestamp_outOffset___block_invoke;
  block[3] = &unk_1E5565DA8;
  block[4] = buf;
  if (writeFrameForBytes_length_dataVersion_timestamp_outOffset__onceToken != -1)
    dispatch_once(&writeFrameForBytes_length_dataVersion_timestamp_outOffset__onceToken, block);
  v11 = v15[24];
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v10, v11))
  {
    v12 = self->_datastoreVersion;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v12;
    _os_log_impl(&dword_1A95BD000, v10, v11, "writeFrameForBytes with unexpected dataVersion:%d", buf, 8u);
  }

  return 1;
}

- (void)start
{
  return -[BMMemoryMapping start](self->_frames, "start");
}

- (void)dealloc
{
  objc_super v3;

  if (self->_permission)
    -[BMFrameStore sync](self, "sync");
  v3.receiver = self;
  v3.super_class = (Class)BMFrameStore;
  -[BMFrameStore dealloc](&v3, sel_dealloc);
}

- (BMFrameStore)initWithFileHandle:(id)a3 permission:(unint64_t)a4 datastoreVersion:(unint64_t)a5
{
  id v8;
  BMFrameStore *v9;
  BMFrameStore *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  _BYTE buf[24];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 == 10)
  {
    v9 = -[BMFrameStore initWithFileHandleV2:permission:](self, "initWithFileHandleV2:permission:", v8, a4);
    goto LABEL_5;
  }
  if (a5 == 9)
  {
    v9 = -[BMFrameStore initWithFileHandleV1:permission:](self, "initWithFileHandleV1:permission:", v8, a4);
LABEL_5:
    self = v9;
    v10 = self;
    goto LABEL_11;
  }
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 16;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BMFrameStore_initWithFileHandle_permission_datastoreVersion___block_invoke;
  block[3] = &unk_1E5565DA8;
  block[4] = buf;
  if (initWithFileHandle_permission_datastoreVersion__onceToken != -1)
    dispatch_once(&initWithFileHandle_permission_datastoreVersion__onceToken, block);
  v12 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(v8, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "privacyPathname:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a5;
    _os_log_impl(&dword_1A95BD000, v11, v12, "Segment version of %{public}@ doesn't match expected versions: %lu.", buf, 0x16u);

  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (int)firstFrameNumberForTimestampV2:(double)a3 reverse:(BOOL)a4
{
  int v4;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;

  v4 = a4;
  v7 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (v7)
  {
    v8 = v7;
    v9 = v7 - 1;
    -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", 0);
    if (v10 <= a3)
    {
      if (v10 == a3)
      {
        if (v4)
        {
          if ((int)v9 < 1)
          {
            LODWORD(v9) = 1;
          }
          else
          {
            v11 = v10;
            v9 = 1;
            while (1)
            {
              -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", v9);
              if (v12 != v11)
                break;
              v9 = (v9 + 1);
              if (v8 == (_DWORD)v9)
              {
                LODWORD(v9) = v8;
                break;
              }
            }
          }
          LODWORD(v9) = v9 - 1;
        }
        else
        {
          LODWORD(v9) = 0;
        }
      }
      else
      {
        -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", v9);
        if (v13 >= a3)
        {
          if (v13 == a3)
          {
            if ((v4 & 1) == 0)
            {
              v9 = v8 - 2;
              if ((int)(v8 - 2) >= 0)
              {
                v14 = v13;
                while (1)
                {
                  -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", v9);
                  if (v15 != v14)
                    break;
                  v16 = (int)v9 <= 0;
                  v9 = (v9 - 1);
                  if (v16)
                  {
                    LODWORD(v9) = -1;
                    break;
                  }
                }
              }
              LODWORD(v9) = v9 + 1;
            }
          }
          else
          {
            v18 = 0;
            if ((v9 & 0x80000000) != 0)
            {
LABEL_38:
              LODWORD(v9) = v18 - v4;
            }
            else
            {
              v19 = v9;
              while (1)
              {
                v20 = v19 - v18;
                if (v19 < v18)
                  ++v20;
                LODWORD(v21) = v18 + (v20 >> 1);
                -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", v21);
                v23 = v22;
                if (v22 == a3)
                  break;
                if (v22 < a3)
                  v18 = v21 + 1;
                else
                  v19 = v21 - 1;
                if (v19 < v18)
                  goto LABEL_38;
              }
              if ((v4 & 1) != 0)
              {
                if ((int)v21 > (int)v9)
                  LODWORD(v9) = v21;
                while ((_DWORD)v9 != (_DWORD)v21)
                {
                  v21 = (v21 + 1);
                  -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", v21);
                  if (v24 > v23)
                  {
                    LODWORD(v9) = v21 - 1;
                    return v9;
                  }
                }
              }
              else
              {
                do
                {
                  LODWORD(v9) = v21;
                  v25 = __OFSUB__((_DWORD)v21, 1);
                  v21 = (v21 - 1);
                  if ((int)v21 < 0 != v25)
                    break;
                  -[BMFrameStore creationTimeOfFrameV2:](self, "creationTimeOfFrameV2:", v21);
                }
                while (v26 >= v23);
              }
            }
          }
        }
        else if (!v4)
        {
          LODWORD(v9) = -1;
        }
      }
    }
    else
    {
      LODWORD(v9) = v4 << 31 >> 31;
    }
  }
  else
  {
    LODWORD(v9) = -1;
  }
  return v9;
}

- (double)creationTimeOfFrameV2:(unsigned int)a3
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  double v8;
  unsigned int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (v5 <= a3)
  {
    v9 = v5;
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__BMFrameStore_V2__creationTimeOfFrameV2___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (creationTimeOfFrameV2__onceToken != -1)
      dispatch_once(&creationTimeOfFrameV2__onceToken, block);
    v11 = v20[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "privacyPathname:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v9;
      HIWORD(v20) = 2114;
      v21 = (uint64_t)v14;
      _os_log_impl(&dword_1A95BD000, v10, v11, "creationTimeOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v8 = v16;

  }
  else
  {
    -[BMFrameStore frames](self, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "end") - 16 * (a3 + 1);

    return *(double *)(v7 + 8);
  }
  return v8;
}

- (void)sync
{
  BMFrameStore *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BMMemoryMapping sync](obj->_header, "sync");
  -[BMMemoryMapping sync](obj->_frames, "sync");
  objc_sync_exit(obj);

}

- (void)enumerateFromOffset:(unint64_t)a3 withCallback:(id)a4
{
  -[BMFrameStore enumerateWithOptions:fromOffset:usingBlock:](self, "enumerateWithOptions:fromOffset:usingBlock:", 0, a3, a4);
}

+ (unsigned)getSegmentVersion:(id)a3 config:(id)a4 stream:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  BMSegmentManager *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "resolvedPathWithStreamIdentifier:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D01D10], "isTestPathOverridden") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D01D18], "current"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "reliesOnDirectAccessForDomain:", objc_msgSend(v7, "domain")),
        v10,
        v11))
  {
    objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithDirectAccessToDirectory:cachingOptions:", v9, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v9, *MEMORY[0x1E0D01CB0], 0, geteuid());
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  v14 = -[BMSegmentManager initWithDirectory:fileManager:permission:config:]([BMSegmentManager alloc], "initWithDirectory:fileManager:permission:config:", v9, v12, 0, v7);
  -[BMSegmentManager path](v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fileHandleForFileAtPath:flags:protection:error:", v16, 0, objc_msgSend(MEMORY[0x1E0D01CF0], "biomeProtectionClassToOSProtectionClass:", objc_msgSend(v7, "protectionClass")), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  if (pread(objc_msgSend(v17, "fd", 0, 0), &v20, 0x38uLL, 0) < 0)
    v18 = -1;
  else
    v18 = v21;

  return v18;
}

- (BOOL)getSegmentHeader:(id *)a3 fromFileV1:(id)a4 fileSize:(unint64_t *)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  ssize_t v10;
  uint64_t v11;
  __int128 *p_buf;
  BOOL v13;
  __int128 v15;
  stat v16;
  __int128 __buf;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  memset(&v16.st_size, 0, 48);
  if (fstat(objc_msgSend(v7, "fd", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v16))
  {
    __error();
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.6();
LABEL_4:

LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  if (!v16.st_size)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.1(v7);
    goto LABEL_23;
  }
  if (v16.st_size <= 0x37uLL)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.2(v7);
LABEL_23:

    goto LABEL_24;
  }
  v20[0] = 0;
  v18 = 0u;
  v19 = 0u;
  __buf = 0u;
  v10 = pread(objc_msgSend(v7, "fd"), &__buf, 0x38uLL, 0);
  if (v10 < 0)
  {
    __error();
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.3();
    goto LABEL_4;
  }
  if (v10 != 56)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.5(v7);
    goto LABEL_23;
  }
  v11 = 52;
  if ((_DWORD)v18 == 9)
  {
    p_buf = (__int128 *)((char *)v20 + 4);
  }
  else
  {
    v11 = 0;
    p_buf = &__buf;
  }
  if (*(_DWORD *)((char *)&__buf + v11) != 1111967059)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.4(p_buf, v7, v9);
    goto LABEL_23;
  }
  if (a5)
    *a5 = v16.st_size;
  if (a3)
  {
    v15 = v18;
    *(_OWORD *)a3->var0.var0 = __buf;
    *(_OWORD *)&a3->var2.var3 = v15;
    *((_OWORD *)&a3->var2 + 2) = v19;
    *((_QWORD *)&a3->var2 + 6) = v20[0];
  }
  v13 = 1;
LABEL_25:

  return v13;
}

+ (BOOL)writeEmptyFrameStoreWithFileHandle:(id)a3 fileSize:(unint64_t)a4 datastoreVersion:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  os_log_type_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  _BYTE *v26;
  _QWORD block[5];
  stat v28;
  _BYTE buf[24];
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  memset(&v28, 0, sizeof(v28));
  if (!fstat(objc_msgSend(v7, "fd"), &v28))
  {
    if (v28.st_size)
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v30 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke;
      block[3] = &unk_1E5565DA8;
      block[4] = buf;
      if (writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken != -1)
        dispatch_once(&writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken, block);
      v10 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (void *)MEMORY[0x1E0D01D10];
        objc_msgSend(v7, "attributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "privacyPathname:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_1A95BD000, v9, v10, "Attempted to write a non-empty file %{public}@ with an empty frame store", buf, 0xCu);

      }
    }
    else
    {
      if (a5 - 11 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        __biome_log_for_category();
        v8 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v30 = 16;
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke_24;
        v25 = &unk_1E5565DA8;
        v26 = buf;
        if (writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken_23 != -1)
          dispatch_once(&writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken_23, &v22);
        v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v8, v17))
        {
          v18 = (void *)MEMORY[0x1E0D01D10];
          objc_msgSend(v7, "attributes", v22, v23, v24, v25, v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "privacyPathname:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = a5;
          _os_log_impl(&dword_1A95BD000, v8, v17, "Segment version of %{public}@ doesn't match expected versions: %lu.", buf, 0x16u);

        }
        goto LABEL_4;
      }
      *(_QWORD *)buf = -1;
      if (a5 == 10)
      {
        if (!objc_msgSend((id)objc_opt_class(), "writeEmptySegmentHeaderWithFileHandleV2:segmentHeaderSize:", v7, buf))goto LABEL_11;
      }
      else if (a5 == 9
             && (objc_msgSend((id)objc_opt_class(), "writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:", v7, buf) & 1) == 0)
      {
        goto LABEL_11;
      }
      if (*(_QWORD *)buf <= a4)
      {
        if (!ftruncate(objc_msgSend(v7, "fd"), a4))
        {
          v15 = 1;
          goto LABEL_12;
        }
        __error();
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[BMFrameStore writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:].cold.2();
      }
      else
      {
        __biome_log_for_category();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[BMFrameStore writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:].cold.1(v7);
      }
    }

    goto LABEL_11;
  }
  __error();
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.6();
LABEL_4:

LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

uint64_t __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke_24(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (BOOL)writeEmptySegmentHeaderWithFileHandleV1:(id)a3 segmentHeaderSize:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  size_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[16];
  _QWORD v20[2];
  int v21;
  _OWORD v22[2];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 56;
  objc_msgSend(v5, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  memset(v22, 0, sizeof(v22));
  v23 = 1111967059;
  v20[0] = 56;
  v20[1] = 0;
  v21 = 9;
  if (v8)
  {
    v10 = strlen((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    if (v10 >= 0x20)
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[BMFrameStore writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:].cold.2();

      v10 = 31;
    }
    __memcpy_chk();
    bzero((char *)v22 + v10, 32 - v10);
  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A95BD000, v12, OS_LOG_TYPE_INFO, "No segment name provided for the segment header", buf, 2u);
    }

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v20, 56);
  v18 = 0;
  v14 = objc_msgSend(v6, "overwriteWithData:error:", v13, &v18);
  v15 = v18;
  if (v15)
    v14 = 0;

  if ((v14 & 1) == 0)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[BMFrameStore writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:].cold.1(v6);

  }
  return v14;
}

uint64_t __63__BMFrameStore_initWithFileHandle_permission_datastoreVersion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BMFrameStore)initWithFileHandleV1:(id)a3 permission:(unint64_t)a4
{
  id v7;
  BMFrameStore *v8;
  BMFrameStore *v9;
  id *p_backingFile;
  int v11;
  BMFrameStore *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  os_log_type_t v27;
  void *v28;
  unsigned int datastoreVersion;
  BMFrameStore *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  BMMemoryMapping *frames;
  uint64_t v35;
  BMMemoryMapping *header;
  BMMemoryMapping *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  _QWORD v43[5];
  _QWORD block[5];
  unint64_t v45;
  objc_super v46;
  _BYTE buf[24];
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMFrameStore;
  v8 = -[BMFrameStore init](&v46, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_52;
  p_backingFile = (id *)&v8->_backingFile;
  objc_storeStrong((id *)&v8->_backingFile, a3);
  v9->_datastoreVersion = 9;
  v45 = 0;
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  if (!-[BMFrameStore getSegmentHeader:fromFileV1:fileSize:](v9, "getSegmentHeader:fromFileV1:fileSize:", &v49, v7, &v45))
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v48) = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (initWithFileHandleV1_permission__onceToken != -1)
      dispatch_once(&initWithFileHandleV1_permission__onceToken, block);
    v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_19;
    v15 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(v7, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "privacyPathname:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v18;
    v19 = "Cannot create frame store from segment file: %{public}@";
    v20 = v13;
    v21 = v14;
    v22 = 12;
    goto LABEL_17;
  }
  v11 = v50;
  v9->_datastoreVersion = v50;
  if (v11 != 9)
  {
    if (v11 == 10)
    {
      v12 = -[BMFrameStore initWithFileHandleV2:permission:](v9, "initWithFileHandleV2:permission:", v7, a4);
LABEL_53:
      v9 = v12;
      v30 = v12;
      goto LABEL_54;
    }
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v48) = 16;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke_27;
    v43[3] = &unk_1E5565DA8;
    v43[4] = buf;
    if (initWithFileHandleV1_permission__onceToken_26 != -1)
      dispatch_once(&initWithFileHandleV1_permission__onceToken_26, v43);
    v27 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v13, v27))
      goto LABEL_19;
    v28 = (void *)MEMORY[0x1E0D01D10];
    -[BMFileHandle attributes](v9->_backingFile, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "privacyPathname:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    datastoreVersion = v9->_datastoreVersion;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v50;
    *(_WORD *)&buf[18] = 1026;
    *(_DWORD *)&buf[20] = datastoreVersion;
    v19 = "Segment version of %{public}@ doesn't match expected versions. Header set to %{public}d, preferred %{public}d.";
    v20 = v13;
    v21 = v27;
    v22 = 24;
LABEL_17:
    _os_log_impl(&dword_1A95BD000, v20, v21, v19, buf, v22);

LABEL_18:
    goto LABEL_19;
  }
  v23 = v45;
  if ((unint64_t)v49 <= v45)
  {
    if (a4 == 1 && v45 - 1 < (unint64_t)v49)
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      v31 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(*p_backingFile, "attributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "privacyPathname:", v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2048;
      v48 = v45;
      _os_log_impl(&dword_1A95BD000, v13, OS_LOG_TYPE_INFO, "Attempted to open %{public}@ for writing but the file is already full, byteUsed:%llu, fileSize:%zu", buf, 0x20u);
      goto LABEL_25;
    }
    if (!((unint64_t)v49 | a4 & 0xFFFFFFFFFFFFFFFDLL))
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[BMFrameStore initWithFileHandleV1:permission:].cold.1((id *)&v9->_backingFile);
      goto LABEL_19;
    }
    v9->_frameStoreSize = v45;
    v9->_permission = a4;
    memoryMappingsForPermissionV1(a4, (uint64_t *)&v49, v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastObject");
    v33 = objc_claimAutoreleasedReturnValue();
    frames = v9->_frames;
    v9->_frames = (BMMemoryMapping *)v33;

    if ((unint64_t)objc_msgSend(v32, "count") >= 2)
    {
      objc_msgSend(v32, "firstObject");
      v35 = objc_claimAutoreleasedReturnValue();
      header = v9->_header;
      v9->_header = (BMMemoryMapping *)v35;

    }
    v37 = v9->_header;
    if (a4 && !v37)
    {
      __biome_log_for_category();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[BMFrameStore initWithFileHandleV1:permission:].cold.5();

      v37 = v9->_header;
    }
    if (v37 && !-[BMMemoryMapping mapWithFileHandle:fileSize:](v37, "mapWithFileHandle:fileSize:", *p_backingFile, v45))
    {
      __biome_log_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[BMFrameStore initWithFileHandleV1:permission:].cold.4();

    }
    if (!-[BMMemoryMapping mapWithFileHandle:fileSize:](v9->_frames, "mapWithFileHandle:fileSize:", v9->_backingFile, v45))
    {
      __biome_log_for_category();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[BMFrameStore initWithFileHandleV1:permission:].cold.3();

      goto LABEL_20;
    }
    if (v9->_datastoreVersion == 9)
      v9->_lastAbsoluteTimestamp = *((double *)&v49 + 1);
    if (!+[BMFrameStore expectedTimestamp:](BMFrameStore, "expectedTimestamp:"))
    {
      __biome_log_for_category();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[BMFrameStore initWithFileHandleV1:permission:].cold.2();

      v9->_lastAbsoluteTimestamp = CFAbsoluteTimeGetCurrent();
    }

LABEL_52:
    v12 = v9;
    goto LABEL_53;
  }
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(*p_backingFile, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "privacyPathname:", v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v49;
    *(_WORD *)&buf[22] = 2050;
    v48 = v45;
    _os_log_error_impl(&dword_1A95BD000, v13, OS_LOG_TYPE_ERROR, "Segment header in %{public}@ says file size is %{public}llu but that is larger than the actual file size(%{public}lu).", buf, 0x20u);
LABEL_25:

    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  v30 = 0;
LABEL_54:

  return v30;
}

uint64_t __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke_27(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (NSString)segmentPath
{
  void *v2;
  void *v3;

  -[BMFileHandle attributes](self->_backingFile, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_printablePath
{
  NSString *cachedPrintablePath;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  cachedPrintablePath = self->_cachedPrintablePath;
  if (!cachedPrintablePath)
  {
    v4 = (void *)MEMORY[0x1E0D01D10];
    -[BMFileHandle attributes](self->_backingFile, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privacyPathname:", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedPrintablePath;
    self->_cachedPrintablePath = v7;

    cachedPrintablePath = self->_cachedPrintablePath;
  }
  return cachedPrintablePath;
}

- (BOOL)isValidFrameV1:(void *)a3 expectedState:(unsigned int)a4 copyOfData:(id *)a5 frameStatus:(id)a6 validations:(BOOL)a7 enumerationOptions:(unint64_t)a8 errorCode:(int *)a9
{
  BMFrameStore *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BMMemoryMapping **p_frames;
  _BOOL4 v16;
  char *v20;
  id v21;
  __CFString *v22;
  char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  unsigned int v29;
  BOOL v30;
  id v31;
  uLong v32;
  __CFString *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  BOOL v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  unsigned int v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  char v52;
  _QWORD block[5];
  _BYTE buf[24];
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[3];

  v52 = a8;
  v10 = self;
  v63[1] = *MEMORY[0x1E0C80C00];
  if ((a3 & 7) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isValidFrame: Frame is not 8-byte aligned:%d"), a3);
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v62 = *MEMORY[0x1E0CB2D50];
    v63[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 1, v13);

    p_frames = &v10->_frames;
    -[BMMemoryMapping end](v10->_frames, "end");
    goto LABEL_19;
  }
  v16 = a7;
  p_frames = &self->_frames;
  v20 = -[BMMemoryMapping end](self->_frames, "end") - ((_QWORD)a3 + 32);
  if ((uint64_t)v20 < 0 || a6.var0 > (unint64_t)v20)
  {
    v23 = (char *)((char *)a3 - (char *)-[BMMemoryMapping start](*p_frames, "start"));
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("isValidFrame: Frame size:%d runs past the remaining free space in the segment:%td, frame intended to start at offset:%td"), a6, v20, v23);
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v60 = *MEMORY[0x1E0CB2D50];
    v61 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v10 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 2, v26);

    goto LABEL_19;
  }
  if (v16 && a6.var1 != a4)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (a4 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), a4);
      v10 = self;
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5565ED8[a4];
      v10 = self;
    }
    if (a6.var1 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), HIDWORD(*(unint64_t *)&a6));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E5565ED8[*(uint64_t *)&a6 >> 32];
    }
    v34 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("isValidFrame: Unexpected frame state. Expected: %@, found: %@"), v22, v33);

    v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v58 = *MEMORY[0x1E0CB2D50];
    v59 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v35, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 3, v36);

    goto LABEL_19;
  }
  if (a5)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)a3 + 32, a6.var0);
    v28 = *a5;
    *a5 = v27;

    v14 = 0;
    v29 = a4 - 1;
    v30 = 1;
    if (v29 <= 1 && v16)
    {
      v31 = *a5;
      v32 = crc32(0, (const Bytef *)objc_msgSend(v31, "bytes"), a6.var0);

LABEL_40:
      v10 = self;
      if (*((_DWORD *)a3 + 6) == (_DWORD)v32)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Checksums don't match. Header: %u, Generated checksum: %u. Skipping frame."), *((unsigned int *)a3 + 6), v32);
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v56 = *MEMORY[0x1E0CB2D50];
      v57 = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("com.apple.Biome.BMFramestore"), 5, v49);

      if (a5)
      {
        v50 = *a5;
        *a5 = 0;

      }
LABEL_19:
      v37 = objc_msgSend(v14, "code");
      if (a9)
        *a9 = v37;
      if (v37 == 3 || v37 == 5)
      {
        v38 = atomic_load((unint64_t *)a3);
        v39 = HIDWORD(v38);
        if ((v52 & 1) != 0 && (_DWORD)v39 == 3 || (v52 & 2) != 0 && (_DWORD)v39 == 2)
        {
          -[BMMemoryMapping start](*p_frames, "start");
          v30 = 1;
          goto LABEL_36;
        }
        v41 = (v39 & 0xFFFFFFFE) == 2;
        v40 = -[BMMemoryMapping start](*p_frames, "start");
        if (v41)
        {
LABEL_35:
          v30 = 0;
          goto LABEL_36;
        }
      }
      else
      {
        v40 = -[BMMemoryMapping start](*p_frames, "start");
      }
      __biome_log_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v55) = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __109__BMFrameStore_isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode___block_invoke;
      block[3] = &unk_1E5565DA8;
      block[4] = buf;
      if (isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode__onceToken != -1)
        dispatch_once(&isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode__onceToken, block);
      v43 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v42, v43))
      {
        -[BMFrameStore _printablePath](v10, "_printablePath");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = (char *)a3 - v40;
        *(_WORD *)&buf[22] = 2112;
        v55 = v14;
        _os_log_impl(&dword_1A95BD000, v42, v43, "isValidFrame failed, path:%{public}@, offset:%td error:%@", buf, 0x20u);

      }
      goto LABEL_35;
    }
  }
  else
  {
    v14 = 0;
    v46 = a4 - 1;
    v30 = 1;
    if (v46 <= 1 && v16)
    {
      v32 = crc32(0, (const Bytef *)a3 + 32, a6.var0);
      goto LABEL_40;
    }
  }
LABEL_36:

  return v30;
}

uint64_t __109__BMFrameStore_isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (id)frameWithOffsetV1:(unint64_t)a3 expectedState:(unsigned int)a4
{
  NSObject *v5;
  uint64_t v6;
  BMMemoryMapping **p_frames;
  BMFrame *v9;
  char *v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  _BOOL4 v15;
  char *v16;
  BMFrame *v17;
  void *v18;
  void *v19;
  id v20;
  char *v21;
  _BYTE *v22;
  uint64_t v23;
  _QWORD v24[2];
  __int128 v25;
  id v26;
  __int128 v27;

  if ((a3 & 7) != 0)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMFrameStore frameWithOffsetV1:expectedState:].cold.3();
LABEL_10:

    v9 = 0;
    return v9;
  }
  v6 = *(_QWORD *)&a4;
  p_frames = &self->_frames;
  if (-[BMMemoryMapping size](self->_frames, "size") < a3)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMFrameStore frameWithOffsetV1:expectedState:].cold.1();
    goto LABEL_10;
  }
  if (-[BMMemoryMapping size](*p_frames, "size") - a3 <= 0x1F)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMFrameStore frameWithOffsetV1:expectedState:].cold.2();
    goto LABEL_10;
  }
  v11 = (char *)(-[BMMemoryMapping start](self->_frames, "start") + a3);
  v12 = atomic_load((unint64_t *)v11);
  v13 = *((double *)v11 + 1);
  v27 = *((_OWORD *)v11 + 1);
  v26 = 0;
  if ((_DWORD)v6 == 3)
    v14 = 1;
  else
    v14 = 2 * ((_DWORD)v6 == 2);
  v15 = -[BMFrameStore isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:](self, "isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:", v11, v6, &v26, v12, 1, v14, 0);
  v9 = 0;
  if (v15)
  {
    v16 = &v11[-[BMFrameStore sizeToNextWord:]((uint64_t)self, v12)];
    v17 = [BMFrame alloc];
    -[BMFileHandle attributes](self->_backingFile, "attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    v21 = &v11[-(uint64_t)-[BMMemoryMapping start](self->_frames, "start")];
    v22 = -[BMMemoryMapping start](self->_frames, "start");
    v24[0] = v12;
    *(double *)&v24[1] = v13;
    v25 = v27;
    LODWORD(v23) = HIDWORD(v12);
    v9 = -[BMFrame initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:](v17, "initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:", v24, v19, v20, v11, v21, v16 - v22 + 32, v13, 9, v23);

  }
  return v9;
}

- (uint64_t)sizeToNextWord:(uint64_t)result
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (*(_DWORD *)(result + 28) != 9)
    {
      __biome_log_for_category();
      v4 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v9 = buf;
      v10 = 0x2020000000;
      v11 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__BMFrameStore_sizeToNextWord___block_invoke;
      block[3] = &unk_1E5565DA8;
      block[4] = buf;
      if (sizeToNextWord__onceToken != -1)
        dispatch_once(&sizeToNextWord__onceToken, block);
      v5 = v9[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v4, v5))
      {
        v6 = *(_DWORD *)(v3 + 28);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1A95BD000, v4, v5, "sizeToNextWord called with unexpected dataVersion:%d", buf, 8u);
      }

    }
    return (a2 + 7) & 0xFFFFFFF8;
  }
  return result;
}

- (id)frameWithOffset:(unint64_t)a3 expectedState:(unsigned int)a4
{
  unsigned int datastoreVersion;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  unsigned int v9;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    -[BMFrameStore frameWithOffsetV2:expectedState:](self, "frameWithOffsetV2:expectedState:", a3, *(_QWORD *)&a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (datastoreVersion == 9)
  {
    -[BMFrameStore frameWithOffsetV1:expectedState:](self, "frameWithOffsetV1:expectedState:", a3, *(_QWORD *)&a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x2020000000;
    v15 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BMFrameStore_frameWithOffset_expectedState___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (frameWithOffset_expectedState__onceToken != -1)
      dispatch_once(&frameWithOffset_expectedState__onceToken, block);
    v8 = v13[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v7, v8))
    {
      v9 = self->_datastoreVersion;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1A95BD000, v7, v8, "[BMFrameStore frameWithOffset:expectedState:] with unexpected dataVersion:%d", buf, 8u);
    }

    v6 = 0;
  }
  return v6;
}

uint64_t __46__BMFrameStore_frameWithOffset_expectedState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)updateFrameStoreIndex
{
  NSMutableOrderedSet *framePointers;
  void *v4;
  unint64_t *v5;
  _BYTE *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  unsigned int datastoreVersion;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *v12;
  _QWORD v13[5];
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_datastoreVersion == 9)
  {
    framePointers = self->_framePointers;
    if (framePointers)
    {
      if (-[NSMutableOrderedSet count](framePointers, "count"))
      {
        -[NSMutableOrderedSet lastObject](self->_framePointers, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (unint64_t *)objc_msgSend(v4, "unsignedLongValue");

        LODWORD(v4) = atomic_load(v5);
        v6 = -[BMMemoryMapping start](self->_frames, "start");
        v7 = (char *)v5 - v6 + -[BMFrameStore sizeToNextWord:]((uint64_t)self, (int)v4) + 32;
LABEL_12:
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __37__BMFrameStore_updateFrameStoreIndex__block_invoke_47;
        v13[3] = &unk_1E5565E40;
        v13[4] = self;
        -[BMFrameStore enumerateWithOptions:fromOffset:usingBlock:](self, "enumerateWithOptions:fromOffset:usingBlock:", 35, v7, v13);
        return;
      }
    }
    else
    {
      v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v12 = self->_framePointers;
      self->_framePointers = v11;

    }
    v7 = 0;
    goto LABEL_12;
  }
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x2020000000;
  v18 = 16;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__BMFrameStore_updateFrameStoreIndex__block_invoke;
  block[3] = &unk_1E5565DA8;
  block[4] = buf;
  if (updateFrameStoreIndex_onceToken != -1)
    dispatch_once(&updateFrameStoreIndex_onceToken, block);
  v9 = v16[24];
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v8, v9))
  {
    datastoreVersion = self->_datastoreVersion;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = datastoreVersion;
    _os_log_impl(&dword_1A95BD000, v8, v9, "updateFrameStoreIndex called with unexpected dataVersion:%d", buf, 8u);
  }

}

uint64_t __37__BMFrameStore_updateFrameStoreIndex__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

void __37__BMFrameStore_updateFrameStoreIndex__block_invoke_47(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a2, "framePtr"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (int64_t)getReverseOffsetIndex:(unint64_t)a3
{
  NSMutableOrderedSet *framePointers;
  NSMutableOrderedSet *v6;
  NSObject *v8;
  os_log_type_t v9;
  unsigned int datastoreVersion;
  void *v11;
  int64_t v12;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_datastoreVersion != 9)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x2020000000;
    v17 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__BMFrameStore_getReverseOffsetIndex___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (getReverseOffsetIndex__onceToken != -1)
      dispatch_once(&getReverseOffsetIndex__onceToken, block);
    v9 = v15[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1A95BD000, v8, v9, "updateFrameStoreIndex called with unexpected dataVersion:%d", buf, 8u);
    }

    return -1;
  }
  -[BMFrameStore updateFrameStoreIndex](self, "updateFrameStoreIndex");
  framePointers = self->_framePointers;
  if (!framePointers || !-[NSMutableOrderedSet count](framePointers, "count"))
    return -1;
  v6 = self->_framePointers;
  if (a3 == 0xFFFFFFFF)
    return -[NSMutableOrderedSet count](self->_framePointers, "count") - 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BMMemoryMapping start](self->_frames, "start") + a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSMutableOrderedSet indexOfObject:](v6, "indexOfObject:", v11);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  else
    return v12;
}

uint64_t __38__BMFrameStore_getReverseOffsetIndex___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __59__BMFrameStore_enumerateWithOptions_fromOffset_usingBlock___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)enumerateWithOptionsV1:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5
{
  void (**v9)(id, void *, char *);
  unsigned int v10;
  unint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  unsigned int v14;
  NSObject *v15;
  os_log_type_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  int64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  unint64_t *v38;
  unint64_t *v39;
  uint64_t v40;
  void *v41;
  int64_t v42;
  unint64_t v43;
  unint64_t v44;
  double v45;
  unint64_t v46;
  char v47;
  int v48;
  char v49;
  NSObject *v50;
  os_log_type_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  BOOL v55;
  uint64_t v56;
  int v57;
  unint64_t *v58;
  unint64_t v59;
  unsigned int v60;
  unint64_t v61;
  _BOOL4 v62;
  __CFString *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  const __CFString *v70;
  unint64_t v71;
  id *v72;
  _BYTE *v73;
  NSObject *v74;
  os_log_type_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  os_log_type_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  BMFrame *v85;
  void *v86;
  void *v87;
  BMFrame *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  __CFString *v93;
  unint64_t v94;
  unsigned int v95;
  unsigned int v96;
  unint64_t *v97;
  __CFString *v98;
  char v99;
  int64_t v100;
  uint64_t v101;
  int v102;
  unint64_t v103;
  int64_t v104;
  int v105;
  void *context;
  unint64_t *v107;
  void *v108;
  unint64_t v109;
  int v110;
  int64_t v111;
  unint64_t v112;
  _QWORD v113[5];
  unsigned int v114;
  _QWORD block[5];
  _QWORD v116[5];
  _QWORD v117[5];
  __int128 v118;
  id v119;
  _QWORD v120[5];
  char v121;
  _QWORD v122[5];
  _QWORD v123[5];
  _QWORD v124[5];
  _BYTE buf[38];
  __int16 v126;
  int v127;
  __int16 v128;
  int v129;
  __int16 v130;
  const __CFString *v131;
  __int16 v132;
  __CFString *v133;
  __int16 v134;
  unint64_t v135;
  __int16 v136;
  uint64_t v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, void *, char *))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFrameStore.m"), 917, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (-[BMFrameStore bytesUsed](self, "bytesUsed") >= 0x38)
  {
    v10 = -[BMFrameStore bytesUsed](self, "bytesUsed");
    if (a4 != 4294967294)
    {
      if (a4 == 0xFFFFFFFF)
        v11 = 0;
      else
        v11 = a4;
      if ((v11 & 7) != 0)
      {
        __biome_log_for_category();
        v12 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        buf[24] = 16;
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke;
        v124[3] = &unk_1E5565DA8;
        v124[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken != -1)
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken, v124);
        v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v11;
          _os_log_impl(&dword_1A95BD000, v12, v13, "enumerateWithOptions: startingOffset (%lu) is not 8-byte aligned", buf, 0xCu);
        }

        goto LABEL_26;
      }
      v14 = v10;
      if (v11 == -[BMMemoryMapping size](self->_frames, "size"))
        goto LABEL_26;
      if (v11 > -[BMMemoryMapping size](self->_frames, "size"))
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        buf[24] = 16;
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_58;
        v123[3] = &unk_1E5565DA8;
        v123[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_57 != -1)
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_57, v123);
        v16 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v15, v16))
        {
          v17 = -[BMMemoryMapping size](self->_frames, "size");
          v18 = (void *)MEMORY[0x1E0D01D10];
          -[BMFrameStore segmentPath](self, "segmentPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "privacyPathname:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v20;
          _os_log_impl(&dword_1A95BD000, v15, v16, "enumerateWithOptions: offset (%lu) beyond segment size (%lu) segment:%@", buf, 0x20u);

        }
LABEL_25:

        goto LABEL_26;
      }
      v21 = v14 - 56;
      if (v11 > v21)
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        buf[24] = 16;
        v122[0] = MEMORY[0x1E0C809B0];
        v122[1] = 3221225472;
        v122[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_60;
        v122[3] = &unk_1E5565DA8;
        v122[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_59 != -1)
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_59, v122);
        v22 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v15, v22))
        {
          v23 = (void *)MEMORY[0x1E0D01D10];
          -[BMFrameStore segmentPath](self, "segmentPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "privacyPathname:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v21;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v25;
          _os_log_impl(&dword_1A95BD000, v15, v22, "enumerateWithOptions: offset (%lu) beyond the bytesUsed (%u) segment:%@", buf, 0x1Cu);

        }
        goto LABEL_25;
      }
      if (v11 == v21)
        goto LABEL_26;
      v121 = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      v28 = v27;

      v29 = -[BMMemoryMapping start](self->_frames, "start");
      v30 = a3 & 8;
      if (!self->_permission && self->_pruneOnAccess && self->_filterByAgeOnRead && self->_maxAge > 0.0)
      {
        v99 = 0;
        v28 = CFAbsoluteTimeGetCurrent() - self->_maxAge;
        if ((a3 & 8) != 0)
        {
LABEL_35:
          if (self->_permission)
          {
            v108 = v29;
            __biome_log_for_category();
            v32 = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            buf[24] = 16;
            v120[0] = MEMORY[0x1E0C809B0];
            v120[1] = 3221225472;
            v120[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_63;
            v120[3] = &unk_1E5565DA8;
            v120[4] = buf;
            if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_62 != -1)
              dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_62, v120);
            v33 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            if (!os_log_type_enabled(v32, v33))
              goto LABEL_41;
            *(_WORD *)buf = 0;
            v34 = "Use of reverse enumeration is only supported for reading.";
            v35 = v32;
            v36 = v33;
            v37 = 2;
          }
          else
          {
            v31 = -[BMFrameStore getReverseOffsetIndex:](self, "getReverseOffsetIndex:", a4);
            if (v31 != -1)
              goto LABEL_43;
            v108 = v29;
            __biome_log_for_category();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              goto LABEL_41;
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = a4;
            v34 = "Reverse enumeration offset not found %zu.";
            v35 = v32;
            v36 = OS_LOG_TYPE_INFO;
            v37 = 12;
          }
          _os_log_impl(&dword_1A95BD000, v35, v36, v34, buf, v37);
LABEL_41:

          v31 = -1;
          v29 = v108;
          goto LABEL_43;
        }
      }
      else
      {
        v99 = 1;
        if ((a3 & 8) != 0)
          goto LABEL_35;
      }
      v31 = -1;
LABEL_43:
      v104 = v31;
      if (v121)
        goto LABEL_26;
      v110 = 0;
      v38 = 0;
      v94 = v30 >> 3;
      v105 = 1;
      v103 = v21;
      while (1)
      {
        context = (void *)MEMORY[0x1AF4163D4]();
        v119 = 0;
        if (v30)
        {
          if (v104 < 0)
            goto LABEL_150;
          v39 = v38;
          -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_framePointers, "objectAtIndexedSubscript:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v41, "integerValue");

          --v104;
        }
        else
        {
          v39 = v38;
          if ((v110 & 1) != 0)
            v40 = (uint64_t)v38 + v11;
          else
            v40 = (uint64_t)v29 + v11;
        }
        v42 = v40 - (unint64_t)-[BMMemoryMapping start](self->_frames, "start");
        if (v42 >= v21 || (unint64_t)(-[BMMemoryMapping end](self->_frames, "end") - v40) < 0x20)
        {
LABEL_150:

          objc_autoreleasePoolPop(context);
          goto LABEL_26;
        }
        v43 = atomic_load((unint64_t *)v40);
        v44 = HIDWORD(v43);
        v118 = 0uLL;
        v45 = *(double *)(v40 + 8);
        v118 = *(_OWORD *)(v40 + 16);
        v46 = -[BMFrameStore sizeToNextWord:]((uint64_t)self, v43);
        v100 = v42;
        v102 = v44;
        switch((int)v44)
        {
          case 0:
            v47 = 1;
            v48 = 1;
            if (!(_DWORD)v46)
            {
              v121 = 1;
              v47 = 0;
            }
            break;
          case 1:
            v49 = v99;
            if (v45 >= v28)
              v49 = 1;
            v47 = v49 ^ 1;
            v48 = 1;
            if ((a3 & 8) != 0 && (v49 & 1) == 0)
            {
              v47 = 0;
              goto LABEL_70;
            }
            break;
          case 2:
            v48 = 1;
            v47 = (a3 & 2) == 0;
            break;
          case 3:
            v48 = 1;
            v47 = (a3 & 1) == 0;
            break;
          case 4:
            goto LABEL_69;
          case 5:
            __biome_log_for_category();
            v50 = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            buf[24] = 16;
            v117[0] = MEMORY[0x1E0C809B0];
            v117[1] = 3221225472;
            v117[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_65;
            v117[3] = &unk_1E5565DA8;
            v117[4] = buf;
            if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_64 != -1)
              dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_64, v117);
            v51 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            if (os_log_type_enabled(v50, v51))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A95BD000, v50, v51, "Found frame with state: BMFrameStateUnknown", buf, 2u);
            }

LABEL_69:
            v47 = 0;
            v48 = 1;
LABEL_70:
            v121 = 1;
            break;
          default:
            v47 = 0;
            v48 = 0;
            break;
        }
        v107 = (unint64_t *)v40;
        v109 = v40 + 32;
        v52 = -[BMFrameStore frameStoreSize](self, "frameStoreSize");
        v53 = v52;
        v54 = v110;
        v55 = (v110 & 1) == 0 || v52 >= v46;
        v56 = 8;
        if (v55)
          v56 = v46;
        v101 = v56;
        if (!v48 || v52 < v46)
          break;
        if ((v110 & 1) != 0)
          v57 = 0;
        else
          v57 = v110;
        if (v121)
        {
          v54 = v57;
          v29 = (void *)v109;
LABEL_128:
          if ((a3 & 0x10) != 0 || v53 >= v46 && (v102 == 1 || v102 == 4))
            goto LABEL_150;
          v110 = v54;
          if ((unint64_t)v29 - (unint64_t)-[BMMemoryMapping start](self->_frames, "start") + 8 >= v103)
            goto LABEL_150;
          v121 = 0;
          if ((v110 & 1) != 0)
          {
            v65 = 8;
            v21 = v103;
            v38 = v107;
          }
          else
          {
            __biome_log_for_category();
            v80 = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            buf[24] = 16;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_77;
            block[3] = &unk_1E5565DA8;
            block[4] = buf;
            v38 = v107;
            if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_76 != -1)
              dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_76, block);
            v81 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            v21 = v103;
            if (os_log_type_enabled(v80, v81))
            {
              -[BMFrameStore _printablePath](self, "_printablePath");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v82;
              _os_log_impl(&dword_1A95BD000, v80, v81, "After unrecognized frame in %{public}@, skipping ahead to find valid frames", buf, 0xCu);

              v38 = v107;
            }

            v110 = 1;
            v65 = 8;
            v29 = (void *)v109;
          }
          goto LABEL_140;
        }
        if ((v47 & 1) == 0)
        {
          v38 = v107;
          v71 = atomic_load(v107);
          v114 = 0;
          if ((a3 & 0x20) == 0 && HIDWORD(v71) == 1)
            v72 = &v119;
          else
            v72 = 0;
          v21 = v103;
          v65 = v56;
          if (-[BMFrameStore isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:](self, "isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:", v107, 1, v72, v71, &v114))
          {
            if ((v110 & 1) != 0)
            {
              v73 = -[BMMemoryMapping start](self->_frames, "start");
              __biome_log_for_category();
              v74 = objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              buf[24] = 16;
              v113[0] = MEMORY[0x1E0C809B0];
              v113[1] = 3221225472;
              v113[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_79;
              v113[3] = &unk_1E5565DA8;
              v113[4] = buf;
              if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_78 != -1)
                dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_78, v113);
              v75 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
              _Block_object_dispose(buf, 8);
              if (os_log_type_enabled(v74, v75))
              {
                v111 = (char *)v107 - v73;
                -[BMFrameStore _printablePath](self, "_printablePath");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v76;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v111;
                _os_log_impl(&dword_1A95BD000, v74, v75, "After a corrupted frame found a valid frame in %{public}@ at offset: %td", buf, 0x16u);

              }
            }
            if ((a3 & 8) != 0)
            {
              if (v104 < 0)
                goto LABEL_145;
              -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_framePointers, "objectAtIndexedSubscript:");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = objc_msgSend(v83, "integerValue");
              v112 = v84 - (unint64_t)-[BMMemoryMapping start](self->_frames, "start");

            }
            else
            {
              if ((char *)v109 < -[BMMemoryMapping end](self->_frames, "end") - v101)
              {
                v77 = v109 + v101 - (unint64_t)-[BMMemoryMapping start](self->_frames, "start");
                goto LABEL_146;
              }
LABEL_145:
              v77 = 4294967294;
LABEL_146:
              v112 = v77;
            }
            v85 = [BMFrame alloc];
            -[BMFileHandle attributes](self->_backingFile, "attributes");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "path");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = v71;
            *(double *)&buf[8] = v45;
            *(_OWORD *)&buf[16] = v118;
            LODWORD(v92) = HIDWORD(v71);
            v88 = -[BMFrame initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:](v85, "initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:", buf, v87, v119, v107, v100, v112, v45, 9, v92);

            v38 = v107;
            v89 = v119;
            v119 = 0;

            v9[2](v9, v88, &v121);
            v21 = v103;
LABEL_148:
            v29 = (void *)v109;
          }
          else
          {
            if ((a3 & 0x10) != 0)
              goto LABEL_148;
            v29 = (void *)v109;
            if (v114 <= 5 && ((1 << v114) & 0x2C) != 0)
            {
              if ((v57 & 1) == 0)
                v57 = 1;
              v65 = 8;
            }
          }

          v110 = v57;
          goto LABEL_141;
        }
        v110 = v57;
        v21 = v103;
        v38 = v107;
        v29 = (void *)v109;
        v65 = v56;
LABEL_140:

LABEL_141:
        objc_autoreleasePoolPop(context);
        ++v105;
        v11 = v65;
        v30 = a3 & 8;
        if (v121)
          goto LABEL_26;
      }
      if ((v110 & 1) != 0)
      {
        v29 = (void *)v109;
LABEL_127:
        v121 = 1;
        goto LABEL_128;
      }
      v58 = v39;
      if (v39)
      {
        v59 = atomic_load(v39);
        v60 = -[BMFrameStore sizeToNextWord:]((uint64_t)self, v59);
        v61 = HIDWORD(v59);
        v96 = v60;
        if (HIDWORD(v59) == 1)
        {
          *(_QWORD *)buf = 0;
          v95 = 1;
          v62 = -[BMFrameStore isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:](self, "isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:", v39, 1, buf, v59 | 0x100000000, 1, a3, 0);
          v63 = CFSTR("Not Valid");
          if (v62)
            v63 = CFSTR("Valid");
          v98 = v63;
          v64 = *(void **)buf;
          *(_QWORD *)buf = 0;

          goto LABEL_94;
        }
      }
      else
      {
        v96 = 0;
        LODWORD(v61) = 5;
      }
      v95 = v61;
      v98 = CFSTR("Not Checked");
LABEL_94:
      __biome_log_for_category();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        -[BMFrameStore _printablePath](self, "_printablePath");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v102;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v90;
        _os_log_error_impl(&dword_1A95BD000, v66, OS_LOG_TYPE_ERROR, "Unrecognized frame state:%d in segment: %{public}@", buf, 0x12u);

        v58 = v39;
      }

      __biome_log_for_category();
      v67 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      buf[24] = 16;
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_73;
      v116[3] = &unk_1E5565DA8;
      v116[4] = buf;
      v97 = v58;
      if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_72 != -1)
        dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_72, v116);
      v68 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v67, v68))
      {
        -[BMFrameStore _printablePath](self, "_printablePath");
        v69 = objc_claimAutoreleasedReturnValue();
        if (v97)
        {
          if (v95 >= 6)
          {
            v78 = v69;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMFrameStateUnknown(%lu)"), v95);
            v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v70 = v93;
            v69 = v78;
          }
          else
          {
            v70 = off_1E5565ED8[v95];
            v93 = (__CFString *)v70;
          }
        }
        else
        {
          v70 = CFSTR("no prev frame");
        }
        *(_DWORD *)buf = 67111426;
        *(_DWORD *)&buf[4] = v102;
        *(_WORD *)&buf[8] = 2114;
        v79 = (void *)v69;
        *(_QWORD *)&buf[10] = v69;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v100;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v101;
        v126 = 1024;
        v127 = v94;
        v128 = 1024;
        v129 = v105;
        v130 = 2114;
        v131 = v70;
        v132 = 2114;
        v133 = v98;
        v134 = 2048;
        v135 = v11;
        v136 = 2048;
        v137 = v96;
        _os_log_impl(&dword_1A95BD000, v67, v68, "Unrecognized frame state: %d, segment:%{public}@ frame offset:%td frame size:%zu reverse:%d, frameCount=%d, prevFrameState:%{public}@, prevFrameValid:%{public}@ prevLastSize/offset:%zu prevStateSize:%zu", buf, 0x5Au);
        if (v97)

      }
      v29 = (void *)v109;
      v54 = v110;
      goto LABEL_127;
    }
  }
LABEL_26:

}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_58(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_60(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_63(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_65(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_73(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_77(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_79(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)updateHeader
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 64), "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(&dword_1A95BD000, v0, OS_LOG_TYPE_DEBUG, "Frame store: %@, bytesUsed: %llu", v4, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

uint64_t __28__BMFrameStore_updateHeader__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

BOOL __28__BMFrameStore_updateHeader__block_invoke_80(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return a3 > a2;
}

BOOL __28__BMFrameStore_updateHeader__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)&a3 > *(double *)&a2;
}

- (unsigned)appendFrameHeaderV1:(id *)a3 offset:(unint64_t *)a4
{
  uint64_t v7;
  double v8;
  CFAbsoluteTime Current;
  unint64_t v10;
  unsigned int v11;
  double v12;
  double var0;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  NSObject *v19;
  os_log_type_t v20;
  unsigned int datastoreVersion;
  int v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[5];
  _BYTE buf[24];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_datastoreVersion != 9)
  {
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v29) = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__BMFrameStore_appendFrameHeaderV1_offset___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (appendFrameHeaderV1_offset__onceToken != -1)
      dispatch_once(&appendFrameHeaderV1_offset__onceToken, block);
    v20 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v19, v20))
    {
      datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1A95BD000, v19, v20, "-[BMFrameStore appendFrameHeaderV1:offset:] called with unexpected dataVersion:%d", buf, 8u);
    }

    return 1;
  }
  v26 = 0;
  v7 = -[BMFrameStore sizeToNextWord:]((uint64_t)self, a3->var0.var0.var0) + 32;
  if (-[BMMemoryMapping atomicWriteEightBytes:toOffset:expected:](self->_frames, "atomicWriteEightBytes:toOffset:expected:", a3->var0.var1, *a4, &v26) == 1)
  {
LABEL_10:
    -[BMMemoryMapping updateToMaxOfCurrentWriteOffsetAnd:](self->_frames, "updateToMaxOfCurrentWriteOffsetAnd:", v7 + *a4);
    self->_lastAbsoluteTimestamp = a3->var1.var0;
    var0 = a3->var1.var0;
    v14 = -[BMMemoryMapping start](self->_frames, "start");
    v15 = *a4;
    v16 = *(_QWORD *)&v14[*a4 + 8];
    v25 = v16;
    v17 = -[BMMemoryMapping atomicWriteEightBytes:toOffset:expected:](self->_frames, "atomicWriteEightBytes:toOffset:expected:", *(_QWORD *)&var0, v15 + 8, &v25);
    if (v17 == 1)
    {
      -[BMMemoryMapping writeBytes:toOffset:length:](self->_frames, "writeBytes:toOffset:length:", &a3->var1.var1, *a4 + 16, 16);
      return 2 * (a3->var0.var0.var1 == 4);
    }
    v22 = v17;
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 1024;
      v29 = v22;
      _os_log_error_impl(&dword_1A95BD000, v23, OS_LOG_TYPE_ERROR, "Unable to update creationTimestamp. We expect to see %llu, but instead are seeing %llu. The write status is %d", buf, 0x1Cu);
    }

    return 1;
  }
  while (1)
  {
    v8 = *(double *)(-[BMMemoryMapping start](self->_frames, "start") + *a4 + 8);
    Current = CFAbsoluteTimeGetCurrent();
    if (v8 >= Current)
      Current = v8;
    a3->var1.var0 = Current;
    a3->var1.var1 = Current;
    if (HIDWORD(v26) == 4)
      return 2;
    v10 = *a4;
    *a4 = v10 + -[BMFrameStore sizeToNextWord:]((uint64_t)self, v26) + 32;
    v26 = 0;
    if (!-[BMMemoryMapping isValidReadFromOffset:withLength:](self->_frames, "isValidReadFromOffset:withLength:"))
    {
      if (!-[BMMemoryMapping isValidReadFromOffset:withLength:](self->_frames, "isValidReadFromOffset:withLength:", *a4, 32))
      {
        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[BMFrameStore appendFrameHeaderV1:offset:].cold.1();

        return 2;
      }
      v11 = -[BMMemoryMapping size](self->_frames, "size") - *(_DWORD *)a4 - 32;
      v12 = a3->var1.var0;
      a3->var0.var0.var0 = v11;
      a3->var0.var0.var1 = 4;
      a3->var1.var1 = v12;
      *(_QWORD *)&a3->var1.var2 = 0;
    }
    if (-[BMMemoryMapping atomicWriteEightBytes:toOffset:expected:](self->_frames, "atomicWriteEightBytes:toOffset:expected:", a3->var0.var1, *a4, &v26) == 1)goto LABEL_10;
  }
}

uint64_t __43__BMFrameStore_appendFrameHeaderV1_offset___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)offsetIsStartOfFrameStore:(unint64_t)a3
{
  if (!a3)
    return 1;
  return -[BMFrameStore datastoreVersion](self, "datastoreVersion") == 10
      && -[BMFrameStore frameStoreSize](self, "frameStoreSize") - 48 == a3;
}

- (unsigned)writeFrameForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6
{
  return -[BMFrameStore writeFrameForBytes:length:dataVersion:timestamp:outOffset:](self, "writeFrameForBytes:length:dataVersion:timestamp:outOffset:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (unsigned)writeFrameV1ForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7
{
  BMFrameStore *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  double lastAbsoluteTimestamp;
  double v18;
  id v19;
  NSObject *v20;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v39[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  _BYTE buf[24];
  double v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = self;
  objc_sync_enter(v12);
  if (a4 >> 31)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.1(a4, v13, v14);
LABEL_25:

LABEL_26:
    LOBYTE(v16) = 1;
    goto LABEL_27;
  }
  if (!a4)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.2();
    goto LABEL_25;
  }
  if (a4 + 88 <= v12->_frameStoreSize)
  {
    if (!-[BMMemoryMapping start](v12->_header, "start"))
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.4();
      goto LABEL_25;
    }
    v38 = 0;
    v38 = -[BMMemoryMapping currentWriteOffset](v12->_frames, "currentWriteOffset");
    if (-[BMMemoryMapping isValidReadFromOffset:withLength:](v12->_frames, "isValidReadFromOffset:withLength:", v38, a4 + 32))
    {
      lastAbsoluteTimestamp = v12->_lastAbsoluteTimestamp;
      if (lastAbsoluteTimestamp > a6)
      {
        if (lastAbsoluteTimestamp - a6 >= 3.0)
          goto LABEL_20;
        v18 = CFAbsoluteTimeGetCurrent() - a6;
        if (v18 < 0.0)
          v18 = -v18;
        if (v18 > 60.0)
        {
LABEL_20:
          v19 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v19, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
          __biome_log_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v29 = v12->_lastAbsoluteTimestamp;
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a6);
            objc_msgSend(v19, "stringFromDate:", v30);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v12->_lastAbsoluteTimestamp);
            objc_msgSend(v19, "stringFromDate:", v32);
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x1E0D01D10];
            -[BMFrameStore segmentPath](v12, "segmentPath");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "privacyPathname:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = "-[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]";
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = a6;
            *(_WORD *)&buf[22] = 2048;
            v46 = v29;
            v47 = 2112;
            v48 = v31;
            v49 = 2112;
            v50 = v33;
            v51 = 2114;
            v52 = v36;
            _os_log_error_impl(&dword_1A95BD000, v20, OS_LOG_TYPE_ERROR, "[%s] Frame should come in chronological order. Input %f < last %f, (%@ < %@) segment:%{public}@", buf, 0x3Eu);

          }
          goto LABEL_26;
        }
        a6 = v12->_lastAbsoluteTimestamp + 0.0000001;
      }
      *(_DWORD *)buf = a4;
      *(_DWORD *)&buf[4] = 0;
      *(double *)&buf[8] = a6;
      *(double *)&buf[16] = a6;
      LODWORD(v46) = crc32(0, (const Bytef *)a3, a4);
      HIDWORD(v46) = a5;
      v16 = -[BMFrameStore appendFrameHeaderV1:offset:](v12, "appendFrameHeaderV1:offset:", buf, &v38);
      if (v16)
      {
        __biome_log_for_category();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromBMFrameWriteStatus(v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.5(v24, v39, v23);
        }

      }
      else
      {
        -[BMMemoryMapping writeBytes:toOffset:length:](v12->_frames, "writeBytes:toOffset:length:", a3, v38 + 32, a4);
        v37 = *(_QWORD *)buf;
        *(_DWORD *)&buf[4] = 1;
        v25 = *(_QWORD *)buf;
        v26 = -[BMMemoryMapping atomicWriteEightBytes:toOffset:expected:](v12->_frames, "atomicWriteEightBytes:toOffset:expected:", *(_QWORD *)buf, v38, &v37);
        -[BMFrameStore updateHeader](v12, "updateHeader");
        if (v26 != 1)
        {
          __biome_log_for_category();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v39 = 134218496;
            v40 = v37;
            v41 = 2048;
            v42 = v25;
            v43 = 1024;
            v44 = v26;
            _os_log_error_impl(&dword_1A95BD000, v28, OS_LOG_TYPE_ERROR, "Unable to update status to written, someone else seems to have overwritten the value. We expect to see %llu, but instead are seeing %llu. The write status is %d", v39, 0x1Cu);
          }

          goto LABEL_26;
        }
        if (a7)
        {
          v27 = -[BMMemoryMapping offset](v12->_frames, "offset");
          LOBYTE(v16) = 0;
          *a7 = v38 + v27;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
    }
    else
    {
      if (-[BMMemoryMapping isValidReadFromOffset:withLength:](v12->_frames, "isValidReadFromOffset:withLength:", v38, 32))
      {
        *(_DWORD *)buf = -[BMMemoryMapping freeSpace](v12->_frames, "freeSpace") - 32;
        *(_DWORD *)&buf[4] = 4;
        *(double *)&buf[8] = a6;
        *(double *)&buf[16] = a6;
        v46 = 0.0;
        -[BMFrameStore appendFrameHeaderV1:offset:](v12, "appendFrameHeaderV1:offset:", buf, &v38);
      }
      __biome_log_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BMFrameStore appendFrameHeaderV1:offset:].cold.1();

      LOBYTE(v16) = 2;
    }
  }
  else
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.3();

    LOBYTE(v16) = 3;
  }
LABEL_27:
  objc_sync_exit(v12);

  return v16;
}

uint64_t __74__BMFrameStore_writeFrameForBytes_length_dataVersion_timestamp_outOffset___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)markFrameAsRemoved:(id)a3
{
  id v4;
  unsigned int datastoreVersion;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD block[5];
  _BYTE buf[24];
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    -[BMFrameStore markFrameAsRemovedV2:](self, "markFrameAsRemovedV2:", v4);
  }
  else if (datastoreVersion == 9)
  {
    -[BMFrameStore markFrameAsRemovedV1:](self, "markFrameAsRemovedV1:", v4);
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v15 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__BMFrameStore_markFrameAsRemoved___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (markFrameAsRemoved__onceToken != -1)
      dispatch_once(&markFrameAsRemoved__onceToken, block);
    v7 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (void *)MEMORY[0x1E0D01D10];
      -[BMFileHandle attributes](self->_backingFile, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "privacyPathname:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_datastoreVersion;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1A95BD000, v6, v7, "Segment version of %{public}@ doesn't match expected versions: %lu.", buf, 0x16u);

    }
  }

}

uint64_t __35__BMFrameStore_markFrameAsRemoved___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)markFrameAsRemovedV1:(id)a3
{
  id v4;
  BMFrameStore *v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t *v8;
  rsize_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  errno_t v14;
  NSObject *v15;
  os_log_type_t v16;
  unint64_t v17;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = atomic_load((unint64_t *)objc_msgSend(v4, "framePtr"));
  v7 = (unint64_t *)objc_msgSend(v4, "framePtr");
  v8 = v7;
  v9 = v6;
  v10 = v6 | 0x200000000;
  do
  {
    v11 = __ldaxr(v7);
    if (v11 != v6)
    {
      __clrex();
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[BMFrameStore markFrameAsRemovedV1:].cold.2();
      goto LABEL_11;
    }
  }
  while (__stlxr(v10, v7));
  v12 = objc_msgSend(v4, "framePtr");
  v13 = objc_msgSend(v4, "framePtr");
  *(_DWORD *)(v12 + 24) = 0;
  v14 = memset_s((void *)(v13 + 32), v9, 0, v9);
  if (v14)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__BMFrameStore_markFrameAsRemovedV1___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (markFrameAsRemovedV1__onceToken != -1)
      dispatch_once(&markFrameAsRemovedV1__onceToken, block);
    v16 = v20[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v14;
      _os_log_impl(&dword_1A95BD000, v15, v16, "Failed to zero out memory. %{public, darwin.errno}d", buf, 8u);
    }
  }
  else
  {
    while (1)
    {
      v17 = __ldaxr(v8);
      if (v17 != v10)
        break;
      if (!__stlxr(v9 | 0x300000000, v8))
        goto LABEL_12;
    }
    __clrex();
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMFrameStore markFrameAsRemovedV1:].cold.1();
  }
LABEL_11:

LABEL_12:
  objc_sync_exit(v5);

}

uint64_t __37__BMFrameStore_markFrameAsRemovedV1___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __31__BMFrameStore_sizeToNextWord___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (unint64_t)maxEventsPerFrameStoreVersion:(unint64_t)a3 averageEventSize:(unint64_t)a4 segmentSize:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 3;
  if (a3 == 9)
    v5 = 7;
  v6 = -4;
  if (a3 == 9)
    v6 = -8;
  v7 = -32;
  if (a3 == 9)
    v7 = -56;
  v8 = 24;
  if (a3 == 9)
    v8 = 32;
  return (v7 + a5) / (v8 + ((v5 + a4) & v6));
}

- (NSString)cachedPrintablePathV2
{
  return self->_cachedPrintablePathV2;
}

- (void)setCachedPrintablePathV2:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPrintablePathV2, a3);
}

- (unsigned)bytesUsed
{
  NSObject *v4;
  os_log_type_t v5;
  unsigned int datastoreVersion;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") == 9)
    return -[BMFrameStore bytesUsedV1](self, "bytesUsedV1");
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") == 10)
    return -[BMFrameStore bytesUsedV2](self, "bytesUsedV2");
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x2020000000;
  v11 = 16;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__BMFrameStore_Inspection__bytesUsed__block_invoke;
  block[3] = &unk_1E5565DA8;
  block[4] = buf;
  if (bytesUsed_onceToken != -1)
    dispatch_once(&bytesUsed_onceToken, block);
  v5 = v9[24];
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v4, v5))
  {
    datastoreVersion = self->_datastoreVersion;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = datastoreVersion;
    _os_log_impl(&dword_1A95BD000, v4, v5, "bytesUsed called with a framestore with an unexpected datastoreVersion:%d", buf, 8u);
  }

  return -[BMFrameStore frameStoreSize](self, "frameStoreSize");
}

uint64_t __37__BMFrameStore_Inspection__bytesUsed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)bytesUsedV1
{
  NSObject *v4;
  os_log_type_t v5;
  BMMemoryMapping *header;
  _QWORD v7[5];
  uint64_t v8;
  _BYTE buf[24];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  if (-[BMMemoryMapping atomicReadAtOffset:value:](self->_header, "atomicReadAtOffset:value:", 0, &v8) == 1)
    return v8;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v10 = 16;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__BMFrameStore_Inspection__bytesUsedV1__block_invoke;
  v7[3] = &unk_1E5565DA8;
  v7[4] = buf;
  if (bytesUsedV1_onceToken != -1)
    dispatch_once(&bytesUsedV1_onceToken, v7);
  v5 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v4, v5))
  {
    header = self->_header;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = header;
    _os_log_impl(&dword_1A95BD000, v4, v5, "Unable to atomically read the bytesUsed value from the frame header %@ %@", buf, 0x16u);
  }

  return 0;
}

uint64_t __39__BMFrameStore_Inspection__bytesUsedV1__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)bytesUsedV2
{
  unsigned int v3;
  void *v4;
  _DWORD *v5;

  v3 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  -[BMFrameStore frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_DWORD *)(objc_msgSend(v4, "end") - (int)(16 * v3));

  return ((*v5 + 3) & 0xFFFFFFFC) + 16 * v3 + 32;
}

- (BOOL)isCheckSumValidAtOffsetV1:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  NSObject *v8;
  os_log_type_t v9;
  unsigned int datastoreVersion;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_datastoreVersion != 9)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x2020000000;
    v15 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__BMFrameStore_Inspection__isCheckSumValidAtOffsetV1___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (isCheckSumValidAtOffsetV1__onceToken != -1)
      dispatch_once(&isCheckSumValidAtOffsetV1__onceToken, block);
    v9 = v13[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1A95BD000, v8, v9, "isCheckSumValidAtOffsetV1 called with unexpected dataVersion:%d", buf, 8u);
    }

    return 0;
  }
  if ((a3 & 7) != 0)
    return 0;
  v5 = -[BMMemoryMapping start](self->_frames, "start") + a3;
  if ((char *)((unint64_t)v5 + 8) > -[BMMemoryMapping end](self->_frames, "end"))
    return 0;
  v6 = atomic_load((unint64_t *)v5);
  if (a3 + v6 > -[BMMemoryMapping size](self->_frames, "size"))
    return 0;
  return HIDWORD(v6) != 1 || *((_DWORD *)v5 + 6) == crc32(0, (const Bytef *)v5 + 32, v6);
}

uint64_t __54__BMFrameStore_Inspection__isCheckSumValidAtOffsetV1___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __43__BMFrameStore_V2__atomicReadTotalFramesV2__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (int)frameNumberFromFrameOffsetV2:(unsigned int)a3
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  signed int v8;
  signed int v9;
  int v10;
  unsigned int v11;

  v5 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (!(_DWORD)v5)
    return -1;
  v6 = v5;
  v7 = -1;
  if (-[BMFrameStore offsetOfFrameV2:](self, "offsetOfFrameV2:", v5) > a3)
  {
    v8 = v6 - 1;
    if ((v8 & 0x80000000) == 0)
    {
      v9 = 0;
      while (1)
      {
        v10 = v8 - v9;
        if (v8 < v9)
          ++v10;
        v7 = v9 + (v10 >> 1);
        v11 = -[BMFrameStore offsetOfFrameV2:](self, "offsetOfFrameV2:", v7);
        if (v11 == a3)
          break;
        if (v11 < a3)
          v9 = v7 + 1;
        else
          v8 = v7 - 1;
        if (v8 < v9)
          return -1;
      }
    }
  }
  return v7;
}

- (unsigned)frameOffsetFromOffsetTableV2:(id *)a3
{
  $6904A10426020E4F4092C7509944103C *v3;
  void *v4;
  uint64_t v5;

  v3 = a3 + 1;
  -[BMFrameStore frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "end");

  if (($6904A10426020E4F4092C7509944103C *)v5 == v3)
    return 0;
  else
    return (v3->var0.var0.var0 + 3) & 0xFFFFFFFC;
}

- (unsigned)endOfFrameDataV2
{
  signed int v3;
  void *v4;
  _DWORD *v5;

  v3 = 16 * -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  -[BMFrameStore frames](self, "frames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_DWORD *)(objc_msgSend(v4, "end") - v3);

  return (*v5 + 3) & 0xFFFFFFFC;
}

- (int)eraseFrameAtOffsetTableV2:(id *)a3
{
  $6904A10426020E4F4092C7509944103C *v5;
  void *v6;
  unsigned int v7;
  rsize_t v8;
  void *v9;
  _DWORD *v10;
  int result;

  v5 = a3 + 1;
  -[BMFrameStore frames](self, "frames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (($6904A10426020E4F4092C7509944103C *)objc_msgSend(v6, "end") == v5)
    v7 = 0;
  else
    v7 = (v5->var0.var0.var0 + 3) & 0xFFFFFFFC;

  v8 = a3->var0.var0.var0 - v7 - 8;
  -[BMFrameStore frames](self, "frames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (_DWORD *)(objc_msgSend(v9, "start") + v7);

  result = memset_s(v10 + 2, v8, 0, v8);
  *v10 = 0;
  return result;
}

- (unsigned)stateOfFrameV2:(unsigned int)a3
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  unsigned int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (v5 <= a3)
  {
    v9 = v5;
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__BMFrameStore_V2__stateOfFrameV2___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (stateOfFrameV2__onceToken != -1)
      dispatch_once(&stateOfFrameV2__onceToken, block);
    v11 = v17[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "privacyPathname:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v9;
      HIWORD(v17) = 2114;
      v18 = (uint64_t)v14;
      _os_log_impl(&dword_1A95BD000, v10, v11, "stateOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);

    }
    return 5;
  }
  else
  {
    -[BMFrameStore frames](self, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "end") - 16 * (a3 + 1);

    return *(_DWORD *)(v7 + 4);
  }
}

uint64_t __35__BMFrameStore_V2__stateOfFrameV2___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __42__BMFrameStore_V2__creationTimeOfFrameV2___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)sizeOfFrameV2:(unsigned int)a3
{
  unsigned int v5;
  void *v6;
  unsigned int *v7;
  unsigned int result;
  unsigned int v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  if (v5 <= a3)
  {
    v9 = v5;
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__BMFrameStore_V2__sizeOfFrameV2___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (sizeOfFrameV2__onceToken != -1)
      dispatch_once(&sizeOfFrameV2__onceToken, block);
    v11 = v17[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (void *)MEMORY[0x1E0D01D10];
      -[BMFrameStore segmentPath](self, "segmentPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "privacyPathname:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v9;
      HIWORD(v17) = 2114;
      v18 = (uint64_t)v14;
      _os_log_impl(&dword_1A95BD000, v10, v11, "sizeOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);

    }
    return 0;
  }
  else
  {
    -[BMFrameStore frames](self, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unsigned int *)(objc_msgSend(v6, "end") - 16 * (a3 + 1));

    result = *v7;
    if (a3)
      result -= (v7[4] + 3) & 0xFFFFFFFC;
  }
  return result;
}

uint64_t __34__BMFrameStore_V2__sizeOfFrameV2___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __36__BMFrameStore_V2__offsetOfFrameV2___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (BOOL)writeEmptySegmentHeaderWithFileHandleV2:(id)a3 segmentHeaderSize:(unint64_t *)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;
  _DWORD v12[2];
  CFAbsoluteTime Current;
  __int128 v14;

  v5 = a3;
  if (a4)
    *a4 = 32;
  v12[0] = *(_DWORD *)"SEGB";
  v12[1] = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v14 = xmmword_1A95E5000;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12, 32);
  v11 = 0;
  v7 = objc_msgSend(v5, "overwriteWithData:error:", v6, &v11);
  v8 = v11;
  if (v8)
    v7 = 0;

  if ((v7 & 1) == 0)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMFrameStore writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:].cold.1(v5);

  }
  return v7;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (id)_printablePathV2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BMFrameStore cachedPrintablePathV2](self, "cachedPrintablePathV2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D01D10];
    -[BMFrameStore backingFile](self, "backingFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privacyPathname:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMFrameStore setCachedPrintablePathV2:](self, "setCachedPrintablePathV2:", v8);

  }
  return -[BMFrameStore cachedPrintablePathV2](self, "cachedPrintablePathV2");
}

uint64_t __135__BMFrameStore_V2__isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (id)frameWithOffsetV2:(unint64_t)a3 expectedState:(unsigned int)a4
{
  NSObject *v5;
  uint64_t v6;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  BMFrame *v14;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  BMFrame *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  double v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _BYTE buf[24];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((a3 & 3) != 0)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMFrameStore(V2) frameWithOffsetV2:expectedState:].cold.1();

LABEL_11:
    v14 = 0;
    return v14;
  }
  v6 = *(_QWORD *)&a4;
  v8 = -[BMFrameStore atomicReadTotalFramesV2](self, "atomicReadTotalFramesV2");
  v9 = a3;
  if (!a3)
  {
    -[BMFrameStore frames](self, "frames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "size") - 16;

  }
  -[BMFrameStore frames](self, "frames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "size") - 16 * v8;

  if (v9 < v12)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[BMFrameStore frames](self, "frames");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v34, "size") - 16 * v8;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v39) = v8;
      _os_log_error_impl(&dword_1A95BD000, v13, OS_LOG_TYPE_ERROR, "frameWithOffsetV2: offset (%lu) is above the offset table (%lu), totalFrames:%d", buf, 0x1Cu);

    }
    goto LABEL_11;
  }
  v16 = -[BMFrameStore frameNumberFromOffsetToOffsetTableEntryV2:](self, "frameNumberFromOffsetToOffsetTableEntryV2:", v9);
  v17 = -[BMFrameStore offsetOfFrameV2:](self, "offsetOfFrameV2:", v16);
  -[BMFrameStore frames](self, "frames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t *)(objc_msgSend(v18, "start") + v17);

  -[BMFrameStore frames](self, "frames");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "start") + v9;

  v37 = 0;
  v22 = 2 * ((_DWORD)v6 == 2);
  if ((_DWORD)v6 == 3)
    v22 = 1;
  LOBYTE(v35) = 1;
  v23 = -[BMFrameStore isValidFrameV2:currentFrame:expectedState:copyOfData:frameState:frameSize:validations:enumerationOptions:errorCode:](self, "isValidFrameV2:currentFrame:expectedState:copyOfData:frameState:frameSize:validations:enumerationOptions:errorCode:", v19, v16, v6, &v37, *(unsigned int *)(v21 + 4), *(_DWORD *)v21 - v17, v35, v22, 0);
  v14 = 0;
  if (v23)
  {
    v24 = *v19;
    v25 = [BMFrame alloc];
    -[BMFrameStore backingFile](self, "backingFile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v37;
    -[BMFrameStore frames](self, "frames");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "start");
    v32 = *(double *)(v21 + 8);
    v33 = *(_DWORD *)(v21 + 4);
    *(_QWORD *)buf = v24;
    *(_QWORD *)&buf[16] = 0;
    v39 = 0;
    *(_QWORD *)&buf[8] = 0;
    LODWORD(v36) = v33;
    v14 = -[BMFrame initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:](v25, "initWithHeader:storePath:data:framePtr:offset:nextOffset:timestamp:datastoreVersion:state:", buf, v28, v29, v21, a3, v21 - v31 + 16, v32, 10, v36);

  }
  return v14;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_33(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_35(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_37(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_39(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_41(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_43(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_45(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __56__BMFrameStore_V2__updateToMaxOfValueAtOffset_newValue___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)addToValueAtOffset:(unsigned int)a3 increment:(unsigned int)a4
{
  void *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  os_log_type_t v14;
  unsigned int v15;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") == 10)
  {
    -[BMFrameStore header](self, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "start");

    v9 = (unsigned int *)(v8 + a3);
    v10 = atomic_load(v9);
    if (a4)
    {
      while (1)
      {
        v11 = v10;
        v12 = v10 + a4;
        while (1)
        {
          v10 = __ldaxr(v9);
          if (v10 != v11)
            break;
          if (!__stlxr(v12, v9))
            return;
        }
        __clrex();
      }
    }
  }
  else
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__BMFrameStore_V2__addToValueAtOffset_increment___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (addToValueAtOffset_increment__onceToken != -1)
      dispatch_once(&addToValueAtOffset_increment__onceToken, block);
    v14 = v18[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v13, v14))
    {
      v15 = -[BMFrameStore datastoreVersion](self, "datastoreVersion");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v15;
      _os_log_impl(&dword_1A95BD000, v13, v14, "addToValueAtOffset called with unexpected datastoreVersion:%d", buf, 8u);
    }

  }
}

uint64_t __49__BMFrameStore_V2__addToValueAtOffset_increment___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)addToDeletedFrameCount:(unsigned int)a3
{
  -[BMFrameStore addToValueAtOffset:increment:](self, "addToValueAtOffset:increment:", 24, *(_QWORD *)&a3);
}

- (void)updateToMaxOfHighestDeletedFrameAnd:(unsigned int)a3
{
  -[BMFrameStore updateToMaxOfValueAtOffset:newValue:](self, "updateToMaxOfValueAtOffset:newValue:", 20, *(_QWORD *)&a3);
}

uint64_t __79__BMFrameStore_V2__appendOffsetTableEntry_outOffsetForFrame_length_frameCount___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __80__BMFrameStore_V2__writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)updateHighestDeletedFrameV2:(id)a3 addToDeletedFrameCount:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[BMFrameStore updateHighestDeletedFrame:](self, "updateHighestDeletedFrame:", a3);
  -[BMFrameStore addToDeletedFrameCount:](self, "addToDeletedFrameCount:", v4);
}

- (void)updateHighestDeletedFrame:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") == 10)
  {
    v4 = objc_msgSend(v7, "framePtr");
    -[BMFrameStore frames](self, "frames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 - objc_msgSend(v5, "start");

    -[BMFrameStore updateToMaxOfHighestDeletedFrameAnd:](self, "updateToMaxOfHighestDeletedFrameAnd:", -[BMFrameStore frameNumberFromOffsetToOffsetTableEntryV2:](self, "frameNumberFromOffsetToOffsetTableEntryV2:", v6));
  }

}

- (void)markFrameAsRemovedV2:(id)a3
{
  id v4;
  BMFrameStore *v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  NSObject *v13;
  os_log_type_t v14;
  unint64_t v15;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (unint64_t *)objc_msgSend(v4, "framePtr");
  v7 = v6;
  v8 = *v6;
  v9 = *v6;
  v10 = v9 | 0x200000000;
  do
  {
    v11 = __ldaxr(v6);
    if (v11 != v8)
    {
      __clrex();
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[BMFrameStore markFrameAsRemovedV1:].cold.2();
      goto LABEL_11;
    }
  }
  while (__stlxr(v10, v6));
  v12 = -[BMFrameStore eraseFrameAtOffsetTableV2:](v5, "eraseFrameAtOffsetTableV2:", v6);
  if (v12)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__BMFrameStore_V2__markFrameAsRemovedV2___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (markFrameAsRemovedV2__onceToken != -1)
      dispatch_once(&markFrameAsRemovedV2__onceToken, block);
    v14 = v18[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1A95BD000, v13, v14, "Failed to zero out memory. %{public, darwin.errno}d", buf, 8u);
    }
  }
  else
  {
    while (1)
    {
      v15 = __ldaxr(v7);
      if (v15 != v10)
        break;
      if (!__stlxr(v9 | 0x300000000, v7))
        goto LABEL_12;
    }
    __clrex();
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMFrameStore markFrameAsRemovedV1:].cold.1();
  }
LABEL_11:

LABEL_12:
  objc_sync_exit(v5);

}

uint64_t __41__BMFrameStore_V2__markFrameAsRemovedV2___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)isCheckSumValidAtOffsetV2:(unint64_t)a3 frameNumber:(int)a4
{
  uint64_t v4;
  char v5;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  os_log_type_t v15;
  unsigned int v16;
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (-[BMFrameStore datastoreVersion](self, "datastoreVersion") != 10)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x2020000000;
    v21 = 16;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__BMFrameStore_V2__isCheckSumValidAtOffsetV2_frameNumber___block_invoke;
    block[3] = &unk_1E5565DA8;
    block[4] = buf;
    if (isCheckSumValidAtOffsetV2_frameNumber__onceToken != -1)
      dispatch_once(&isCheckSumValidAtOffsetV2_frameNumber__onceToken, block);
    v15 = v19[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v14, v15))
    {
      v16 = -[BMFrameStore datastoreVersion](self, "datastoreVersion");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1A95BD000, v14, v15, "isCheckSumValidAtOffsetV2 called with unexpected dataVersion:%d", buf, 8u);
    }

    return 0;
  }
  if ((v5 & 7) != 0)
    return 0;
  v7 = -[BMFrameStore offsetOfFrameV2:](self, "offsetOfFrameV2:", v4);
  v8 = -[BMFrameStore sizeOfFrameV2:](self, "sizeOfFrameV2:", v4);
  -[BMFrameStore frames](self, "frames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "size");

  if (v10 < v8 + v7)
    return 0;
  -[BMFrameStore frames](self, "frames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "start");

  return -[BMFrameStore stateOfFrameV2:](self, "stateOfFrameV2:", v4) != 1
      || bm_generateChecksum((Bytef *)(v12 + v7 + 8), v8 - 8) == *(_DWORD *)(v12 + v7);
}

uint64_t __58__BMFrameStore_V2__isCheckSumValidAtOffsetV2_frameNumber___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)getSegmentHeader:(void *)a1 fromFileV1:fileSize:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v4, v5, "Segment file %{public}@ is invalid because the current size is 0 bytes", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)getSegmentHeader:(void *)a1 fromFileV1:fileSize:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v4, v5, "Segment file %{public}@ is invalid because the current size is less than a segment header.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)getSegmentHeader:fromFileV1:fileSize:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v4, v5, "Unable to read segment file segment header %{public}@ error %{darwin.errno}d.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)getSegmentHeader:(_DWORD *)a1 fromFileV1:(void *)a2 fileSize:(NSObject *)a3 .cold.4(_DWORD *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  _DWORD *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  v6 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a2, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyPathname:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 68290050;
  v10[1] = 4;
  v11 = 2082;
  v12 = a1;
  v13 = 1024;
  v14 = v5;
  v15 = 2114;
  v16 = v9;
  v17 = 1042;
  v18 = 4;
  v19 = 2082;
  v20 = "SEGB";
  _os_log_error_impl(&dword_1A95BD000, a3, OS_LOG_TYPE_ERROR, "Segment header magic '%{public}.4s' (0x%04X) in file %{public}@ doesn't match expected magic '%{public}.4s'.", (uint8_t *)v10, 0x32u);

}

- (void)getSegmentHeader:(void *)a1 fromFileV1:fileSize:.cold.5(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v4, v5, "Unable to read segment file's segment header %{public}@. Received data of %{public}d length.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)getSegmentHeader:fromFileV1:fileSize:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v4, v5, "Failed to fstat %{public}@ with error: %{darwin.errno}d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

+ (void)writeEmptyFrameStoreWithFileHandle:(void *)a1 fileSize:datastoreVersion:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v4, v5, "Invalid file size of %{public}@ since it is less than a valid segment header's size.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v4, v5, "Exception when truncating file %{public}@. %{darwin.errno}d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

+ (void)writeEmptySegmentHeaderWithFileHandleV1:(void *)a1 segmentHeaderSize:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v4, v5, "Could not write the segment header to %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

+ (void)writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  v3 = 2050;
  v4 = 31;
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, v0, v1, "Segment name is too large to store in the segment header. Truncating the segment name of %{public}zu to %{public}lu", v2);
  OUTLINED_FUNCTION_17();
}

- (void)initWithFileHandleV1:(id *)a1 permission:.cold.1(id *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v4, v5, "Not mapping an empty file %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithFileHandleV1:permission:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "_printablePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v2, v3, "Found a bad lastAbsoluteTimestamp in header for segment file %{public}@ time: %f", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithFileHandleV1:permission:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  v0 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(v1, "segmentPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "privacyPathname:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v4, v5, "Failed to map frames for %{public}@ with permission %lu", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithFileHandleV1:permission:.cold.4()
{
  void *v0;
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*v1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v4, v5, "Failed to map header for %{public}@ with permission %lu", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithFileHandleV1:permission:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "The Frame Header should never be nil when initializing with write or prune permissions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)frameWithOffsetV1:expectedState:.cold.1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(v0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v1, v2, "frameWithOffsetV1: offset (%lu) is beyond frame size (%lu)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_20();
}

- (void)frameWithOffsetV1:expectedState:.cold.2()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19(v0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v1, v2, "frameWithOffsetV1: current offset (%lu) leaves insufficient space in the segment size (%lu) for a BMFrameHeader", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_20();
}

- (void)frameWithOffsetV1:expectedState:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(&dword_1A95BD000, v0, OS_LOG_TYPE_ERROR, "frameWithOffsetV1: offset is not 8-byte aligned:%zu", v1, 0xCu);
  OUTLINED_FUNCTION_17();
}

- (void)appendFrameHeaderV1:offset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_15(&dword_1A95BD000, v0, v1, "No space left to write to the mapped region", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeFrameV1ForBytes:(uint64_t)a3 length:dataVersion:timestamp:outOffset:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134349312;
  v4 = a1;
  v5 = 2048;
  v6 = 0x7FFFFFFFLL;
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, a2, a3, "Sample too large %{public}zu but only %zu supported", (uint8_t *)&v3);
  OUTLINED_FUNCTION_17();
}

- (void)writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Sample is empty but only non-empty samples are supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Attempt to write data too large to fit in segment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Failed to find a segment header while writing. Dropping incoming data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeFrameV1ForBytes:(os_log_t)log length:dataVersion:timestamp:outOffset:.cold.5(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A95BD000, log, OS_LOG_TYPE_DEBUG, "Unable to write frame for reason: %@", buf, 0xCu);

}

- (void)markFrameAsRemovedV1:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Unable to mark frame as deleted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markFrameAsRemovedV1:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Unable to mark frame as pre-delete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
