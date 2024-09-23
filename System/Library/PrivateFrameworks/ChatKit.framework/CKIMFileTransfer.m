@implementation CKIMFileTransfer

uint64_t __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_faultInAnimatedFlagImmediately");
}

void __27__CKIMFileTransfer_fileURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __29__CKIMFileTransfer_isSticker__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 14);
  return result;
}

uint64_t __48__CKIMFileTransfer_setHasFinalizedAnimatedFlag___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 13) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __51__CKIMFileTransfer__faultInAnimatedFlagImmediately__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 12) = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 13) = 1;
  return result;
}

uint64_t __38__CKIMFileTransfer_mediaObjectRemoved__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("CKFileTransferRemovedNotification"), *(_QWORD *)(a1 + 40));
}

void __24__CKIMFileTransfer_guid__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __35__CKIMFileTransfer_stickerUserInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__CKIMFileTransfer_filename__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)mediaObjectRemoved
{
  int *p_mediaObjectCount;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CKIMFileTransfer *v10;

  p_mediaObjectCount = &self->_mediaObjectCount;
  do
  {
    v4 = __ldxr((unsigned int *)p_mediaObjectCount);
    v5 = v4 - 1;
  }
  while (__stxr(v5, (unsigned int *)p_mediaObjectCount));
  if (!v5)
  {
    -[CKIMFileTransfer notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__CKIMFileTransfer_mediaObjectRemoved__block_invoke;
    v8[3] = &unk_1E274A108;
    v9 = v6;
    v10 = self;
    v7 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

- (NSURL)fileURL
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__CKIMFileTransfer_fileURL__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (BOOL)isSticker
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__CKIMFileTransfer_isSticker__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDictionary)stickerUserInfo
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CKIMFileTransfer_stickerUserInfo__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)mediaObjectAdded
{
  int *p_mediaObjectCount;
  unsigned int v3;

  p_mediaObjectCount = &self->_mediaObjectCount;
  do
    v3 = __ldxr((unsigned int *)p_mediaObjectCount);
  while (__stxr(v3 + 1, (unsigned int *)p_mediaObjectCount));
}

- (void)_reloadTransferAndDetermineIfUpdated:(BOOL *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t updateReason;
  _BOOL4 isFromMomentShare;
  _BOOL4 isScreenshot;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  unsigned int v27;
  int v28;
  NSURL *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  OS_dispatch_queue *isolationQueue;
  NSURL *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  uint64_t v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  uint64_t v69;
  void *v70;
  void *v71;
  int v72;
  BOOL v73;
  uint64_t v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  int64_t v82;
  _BOOL4 v83;
  _BOOL4 v84;
  _BOOL4 isDirectory;
  _BOOL4 hideAttachment;
  int64_t transferState;
  _BOOL4 restoring;
  _BOOL4 rejected;
  _BOOL4 fileURLFinalized;
  _BOOL4 fileDataReady;
  int64_t commSafetySensitive;
  _BOOL4 isSticker;
  unint64_t totalBytes;
  unint64_t currentBytes;
  BOOL IsFileURLFinalized;
  char v97;
  char v98;
  char v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  char v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  NSString *v118;
  void *v119;
  void *v120;
  void *v121;
  NSString *v122;
  NSString *v123;
  void *v124;
  void *v125;
  _QWORD block[5];
  _QWORD v128[5];
  NSURL *v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char v142;
  char v143;
  BOOL v144;
  BOOL v145;
  char v146;
  char v147;
  char v148;
  char v149;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    -[CKIMFileTransfer guid](self, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Tried to access IMFileTransfer %@ off of mainThread."), v6);

  }
  v7 = -[NSURL copy](self->_fileURL, "copy");
  v8 = -[NSString copy](self->_filename, "copy");
  v120 = (void *)-[NSError copy](self->_error, "copy");
  v125 = (void *)-[NSDictionary copy](self->_transcoderUserInfo, "copy");
  v124 = (void *)-[NSDictionary copy](self->_stickerUserInfo, "copy");
  totalBytes = self->_totalBytes;
  currentBytes = self->_currentBytes;
  isSticker = self->_isSticker;
  v123 = self->_adaptiveImageGlyphContentIdentifier;
  v122 = self->_adaptiveImageGlyphContentDescription;
  updateReason = self->_updateReason;
  commSafetySensitive = self->_commSafetySensitive;
  fileURLFinalized = self->_fileURLFinalized;
  fileDataReady = self->_fileDataReady;
  restoring = self->_restoring;
  rejected = self->_rejected;
  transferState = self->_transferState;
  v121 = (void *)-[NSDictionary copy](self->_attributionInfo, "copy");
  isDirectory = self->_isDirectory;
  hideAttachment = self->_hideAttachment;
  isFromMomentShare = self->_isFromMomentShare;
  v119 = (void *)-[NSURL copy](self->_shareURL, "copy");
  isScreenshot = self->_isScreenshot;
  v118 = self->_audioTranscriptionText;
  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer guid](self, "guid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transferForGUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKIMFileTransfer IMMessage](self, "IMMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filename");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transcoderUserInfo");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stickerUserInfo");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "totalBytes");
  v105 = objc_msgSend(v14, "currentBytes");
  v104 = objc_msgSend(v14, "isSticker");
  objc_msgSend(v14, "adaptiveImageGlyphContentIdentifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "adaptiveImageGlyphContentDescription");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v14, "commSafetySensitive");
  if (v14)
    v17 = objc_msgSend(v14, "transferState");
  else
    v17 = 6;
  objc_msgSend(v14, "attributionInfo");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v14, "hideAttachment");
  v98 = objc_msgSend(v14, "isDirectory");
  v97 = objc_msgSend(v14, "isFromMomentShare");
  IsFileURLFinalized = CKFileTransferIsFileURLFinalized(v17);
  v117 = (void *)v8;
  v82 = updateReason;
  v83 = isScreenshot;
  v84 = isFromMomentShare;
  v107 = v16;
  if (IsFileURLFinalized)
  {
    objc_msgSend(v14, "localURL");
    v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[CKIMFileTransfer fileManager](self, "fileManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](v18, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

    }
    else
    {
      v21 = 0;
    }
    -[CKIMFileTransfer syncController](self, "syncController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isRestoring");

    v25 = CKFileTransferRestoring(v21, v17 != 0, v27);
    if (objc_msgSend(v15, "isFromMe"))
      v28 = objc_msgSend(v15, "isSent") ^ 1;
    else
      v28 = 0;
    if (v17 != 6)
      v28 = 1;
    if (v21)
      v24 = v28;
    else
      v24 = 0;
  }
  else
  {
    v18 = self->_linkFileURL;
    if (v18)
    {
      -[CKIMFileTransfer fileManager](self, "fileManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](v18, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

      v25 = 0;
    }
    else
    {
      v25 = 0;
      v24 = 0;
    }
  }
  v116 = v15;
  if (v14 && (v17 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v29 = (NSURL *)v7;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = objc_msgSend(v14, "error");
    v32 = v30;
    v33 = CFSTR("IMFileTransferErrorDomain");
LABEL_30:
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, v31, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!v14
    || ((v24 | v25) & 1) == 0
    && !CKFileTransferIsDownloading(0, v17)
    && (objc_msgSend(v14, "_isMissingAndDownloadable") & 1) == 0)
  {
    v29 = (NSURL *)v7;
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = CFSTR("CKFileTransferErrorDomain");
    v31 = 0;
    goto LABEL_30;
  }
  v29 = (NSURL *)v7;
  v34 = 0;
LABEL_31:
  isolationQueue = self->_isolationQueue;
  v128[0] = MEMORY[0x1E0C809B0];
  v128[1] = 3221225472;
  v128[2] = __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke;
  v128[3] = &unk_1E2759CA0;
  v128[4] = self;
  v36 = v18;
  v129 = v36;
  v115 = v114;
  v130 = v115;
  v109 = v34;
  v131 = v109;
  v113 = v112;
  v132 = v113;
  v111 = v110;
  v133 = v111;
  v138 = v105;
  v139 = v107;
  v142 = v104;
  v108 = v101;
  v134 = v108;
  v106 = v103;
  v135 = v106;
  v140 = v102;
  v141 = v17;
  v143 = v24;
  v144 = IsFileURLFinalized;
  v145 = v17 == 8;
  v146 = v25;
  v37 = v100;
  v136 = v37;
  v147 = v99;
  v148 = v98;
  v149 = v97;
  v38 = v14;
  v137 = v38;
  ck_dispatch_isolated(isolationQueue, v128);
  if (v29 != v36 && (-[NSURL isEqual:](v29, "isEqual:", v36) & 1) == 0)
  {
    -[CKIMFileTransfer setHasFinalizedAnimatedFlag:](self, "setHasFinalizedAnimatedFlag:", 0);
    dispatch_get_global_queue(2, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke_2;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(v39, block);

  }
  v40 = v120;
  if (a3)
  {
    -[CKIMFileTransfer fileURL](self, "fileURL");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v29 == (NSURL *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[CKIMFileTransfer fileURL](self, "fileURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[NSURL isEqual:](v29, "isEqual:", v43);

      if (!v44)
      {
LABEL_75:
        v73 = 1;
LABEL_76:
        *a3 = v73;
        goto LABEL_77;
      }
    }
    -[CKIMFileTransfer filename](self, "filename");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v117 == (void *)v45)
    {

    }
    else
    {
      v46 = (void *)v45;
      -[CKIMFileTransfer filename](self, "filename");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v117, "isEqualToString:", v47);

      if (!v48)
        goto LABEL_75;
    }
    -[CKIMFileTransfer error](self, "error");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v120 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[CKIMFileTransfer error](self, "error");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v120, "isEqual:", v51);

      if (!v52)
        goto LABEL_75;
    }
    -[CKIMFileTransfer transcoderUserInfo](self, "transcoderUserInfo");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v125 == (void *)v53)
    {

    }
    else
    {
      v54 = (void *)v53;
      -[CKIMFileTransfer transcoderUserInfo](self, "transcoderUserInfo");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v125, "isEqualToDictionary:", v55);

      if (!v56)
        goto LABEL_75;
    }
    -[CKIMFileTransfer stickerUserInfo](self, "stickerUserInfo");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v124 == (void *)v57)
    {

    }
    else
    {
      v58 = (void *)v57;
      -[CKIMFileTransfer stickerUserInfo](self, "stickerUserInfo");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v124, "isEqualToDictionary:", v59);

      if (!v60)
        goto LABEL_75;
    }
    if (currentBytes != -[CKIMFileTransfer currentBytes](self, "currentBytes")
      || totalBytes != -[CKIMFileTransfer totalBytes](self, "totalBytes")
      || isSticker != -[CKIMFileTransfer isSticker](self, "isSticker"))
    {
      goto LABEL_75;
    }
    -[CKIMFileTransfer adaptiveImageGlyphContentIdentifier](self, "adaptiveImageGlyphContentIdentifier");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v123 == (NSString *)v61)
    {

    }
    else
    {
      v62 = (void *)v61;
      -[CKIMFileTransfer adaptiveImageGlyphContentIdentifier](self, "adaptiveImageGlyphContentIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[NSString isEqualToString:](v123, "isEqualToString:", v63);

      if (!v64)
        goto LABEL_75;
    }
    -[CKIMFileTransfer adaptiveImageGlyphContentDescription](self, "adaptiveImageGlyphContentDescription");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v122 == (NSString *)v65)
    {

    }
    else
    {
      v66 = (void *)v65;
      -[CKIMFileTransfer adaptiveImageGlyphContentDescription](self, "adaptiveImageGlyphContentDescription");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[NSString isEqualToString:](v122, "isEqualToString:", v67);

      if (!v68)
        goto LABEL_75;
    }
    if (commSafetySensitive != -[CKIMFileTransfer commSafetySensitive](self, "commSafetySensitive")
      || fileDataReady != -[CKIMFileTransfer isFileDataReady](self, "isFileDataReady")
      || fileURLFinalized != -[CKIMFileTransfer isFileURLFinalized](self, "isFileURLFinalized")
      || rejected != -[CKIMFileTransfer isRejected](self, "isRejected")
      || restoring != -[CKIMFileTransfer isRestoring](self, "isRestoring")
      || transferState != -[CKIMFileTransfer transferState](self, "transferState"))
    {
      goto LABEL_75;
    }
    -[CKIMFileTransfer attributionInfo](self, "attributionInfo");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v121 == (void *)v69)
    {

    }
    else
    {
      v70 = (void *)v69;
      -[CKIMFileTransfer attributionInfo](self, "attributionInfo");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v121, "isEqualToDictionary:", v71);

      if (!v72)
        goto LABEL_89;
    }
    if (hideAttachment != -[CKIMFileTransfer hideAttachment](self, "hideAttachment")
      || isDirectory != -[CKIMFileTransfer isDirectory](self, "isDirectory")
      || v84 != -[CKIMFileTransfer isFromMomentShare](self, "isFromMomentShare"))
    {
      goto LABEL_89;
    }
    -[CKIMFileTransfer shareURL](self, "shareURL");
    v74 = objc_claimAutoreleasedReturnValue();
    if (v119 == (void *)v74)
    {

    }
    else
    {
      v75 = (void *)v74;
      -[CKIMFileTransfer shareURL](self, "shareURL");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v119, "isEqual:", v76);

      if (!v77)
        goto LABEL_89;
    }
    if (v83 == -[CKIMFileTransfer isScreenshot](self, "isScreenshot"))
    {
      -[CKIMFileTransfer audioTranscriptionText](self, "audioTranscriptionText");
      v78 = objc_claimAutoreleasedReturnValue();
      if (v118 == (NSString *)v78)
      {

      }
      else
      {
        v79 = (void *)v78;
        -[CKIMFileTransfer audioTranscriptionText](self, "audioTranscriptionText");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = -[NSString isEqualToString:](v118, "isEqualToString:", v80);

        if (!v81)
          goto LABEL_89;
      }
      v73 = v82 != -[CKIMFileTransfer updateReason](self, "updateReason");
      goto LABEL_90;
    }
LABEL_89:
    v73 = 1;
LABEL_90:
    v40 = v120;
    goto LABEL_76;
  }
LABEL_77:

}

- (void)setHasFinalizedAnimatedFlag:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CKIMFileTransfer isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CKIMFileTransfer_setHasFinalizedAnimatedFlag___block_invoke;
  v6[3] = &unk_1E274CA88;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_sync(v5, v6);

}

- (void)_faultInAnimatedFlagImmediately
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  char v9;

  -[CKIMFileTransfer filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMUTITypeForFilename();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (IMUTTypeIsSupportedAnimatedImage())
  {
    -[CKIMFileTransfer fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = IMFileURLIsActuallyAnimated();

  }
  else
  {
    v5 = 0;
  }
  -[CKIMFileTransfer isolationQueue](self, "isolationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKIMFileTransfer__faultInAnimatedFlagImmediately__block_invoke;
  block[3] = &unk_1E274CA88;
  block[4] = self;
  v9 = v5;
  dispatch_barrier_sync(v6, block);

}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (NSString)filename
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CKIMFileTransfer_filename__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (CKIMFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4
{
  id v6;
  id v7;
  CKIMFileTransfer *v8;
  uint64_t v9;
  NSString *guid;
  dispatch_queue_t v11;
  OS_dispatch_queue *isolationQueue;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 IsFileURLFinalized;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  NSURL *linkFileURL;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CKIMFileTransfer;
  v8 = -[CKIMFileTransfer init](&v31, sel_init);
  if (!v8)
    goto LABEL_18;
  v9 = objc_msgSend(v6, "copy");
  guid = v8->_guid;
  v8->_guid = (NSString *)v9;

  v8->_mediaObjectCount = 0;
  v11 = dispatch_queue_create("CKIMFileTransfer read/write isolation queue", MEMORY[0x1E0C80D50]);
  isolationQueue = v8->_isolationQueue;
  v8->_isolationQueue = (OS_dispatch_queue *)v11;

  -[CKIMFileTransfer imFileTransferCenter](v8, "imFileTransferCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer guid](v8, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transferForGUID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  IsFileURLFinalized = CKFileTransferIsFileURLFinalized(objc_msgSend(v15, "transferState"));
  if (objc_msgSend(v7, "isFromMe"))
    v17 = objc_msgSend(v7, "isSent");
  else
    v17 = 1;
  v18 = objc_msgSend(v15, "thumbnailExistsAtLocalPath");
  if (CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
  {
    objc_msgSend(v15, "localURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
LABEL_8:
    linkFileURL = v8->_linkFileURL;
    v8->_linkFileURL = (NSURL *)v20;
    goto LABEL_9;
  }
  if (((!IsFileURLFinalized | v17) & 1) == 0)
  {
    objc_msgSend(v15, "localURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKIMFileTransfer makeHardLink:](CKIMFileTransfer, "makeHardLink:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v18)
    goto LABEL_10;
  objc_msgSend(v15, "localURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKIMFileTransfer makeHardLink:](CKIMFileTransfer, "makeHardLink:", v19);
  v30 = objc_claimAutoreleasedReturnValue();
  linkFileURL = v8->_thumbnailURL;
  v8->_thumbnailURL = (NSURL *)v30;
LABEL_9:

LABEL_10:
  -[CKIMFileTransfer attributionInfo](v8, "attributionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(v15, "attributionInfo");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  -[CKIMFileTransfer setAttributionInfo:](v8, "setAttributionInfo:", v25);
  objc_msgSend(v15, "setAttributionInfo:", v25);
  -[CKIMFileTransfer setIMMessage:](v8, "setIMMessage:", v7);
  -[CKIMFileTransfer reloadTransfer](v8, "reloadTransfer");
  -[CKIMFileTransfer notificationCenter](v8, "notificationCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v8, sel_transferUpdated_, *MEMORY[0x1E0D35578], v15);
  -[CKIMFileTransfer syncController](v8, "syncController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isRestoring"))
  {
    v28 = -[CKIMFileTransfer isRestoring](v8, "isRestoring");

    if (v28)
      objc_msgSend(v26, "addObserver:selector:name:object:", v8, sel_attachmentRestored_, CFSTR("com.apple.ChatKit.attachmentRestoredNotification"), 0);
  }
  else
  {

  }
LABEL_18:

  return v8;
}

- (id)notificationCenter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (id)imFileTransferCenter
{
  return (id)objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
}

- (id)syncController
{
  return +[CKSyncController sharedInstance](CKSyncController, "sharedInstance");
}

- (NSString)guid
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__CKIMFileTransfer_guid__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setIMMessage:(id)a3
{
  IMMessage *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  IMMessage *imMessage;

  v4 = (IMMessage *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    -[CKIMFileTransfer guid](self, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Tried to change -[CKFileTransfer message] (%@) off of mainThread."), v7);

  }
  imMessage = self->_imMessage;
  self->_imMessage = v4;

}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)reloadTransfer
{
  -[CKIMFileTransfer _reloadTransferAndDetermineIfUpdated:](self, "_reloadTransferAndDetermineIfUpdated:", 0);
}

- (void)dealloc
{
  NSObject *v3;
  NSURL *fileURL;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *guid;
  NSURL *linkFileURL;
  void *v13;
  NSURL *v14;
  objc_super v15;
  uint8_t buf[4];
  NSURL *v17;
  __int16 v18;
  NSURL *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      fileURL = self->_fileURL;
      *(_DWORD *)buf = 138412290;
      v17 = fileURL;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "Transfer %@ removed.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v14 = self->_fileURL;
    _CKLog();
  }
  v5 = self->_guid;
  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer fileManager](self, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transferForGUID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_linkFileURL && (objc_msgSend(v8, "isSticker") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        guid = self->_guid;
        linkFileURL = self->_linkFileURL;
        *(_DWORD *)buf = 138412546;
        v17 = (NSURL *)guid;
        v18 = 2112;
        v19 = linkFileURL;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Remove hard link for %@ at %@.", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "removeItemAtURL:error:", self->_linkFileURL, 0, v14);
  }
  -[CKIMFileTransfer notificationCenter](self, "notificationCenter", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", self);

  v15.receiver = self;
  v15.super_class = (Class)CKIMFileTransfer;
  -[CKIMFileTransfer dealloc](&v15, sel_dealloc);
}

- (id)fileManager
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
}

- (NSDictionary)attributionInfo
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CKIMFileTransfer_attributionInfo__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (IMMessage)IMMessage
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99768];
    -[CKIMFileTransfer guid](self, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Tried to access -[CKFileTransfer message] (%@) off of mainThread."), v5);

  }
  return self->_imMessage;
}

- (NSURL)animatedImageCacheURL
{
  return self->_animatedImageCacheURL;
}

- (BOOL)fileIsAnimated
{
  NSObject *v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (!-[CKIMFileTransfer hasFinalizedAnimatedFlag](self, "hasFinalizedAnimatedFlag"))
    -[CKIMFileTransfer _faultInAnimatedFlagImmediately](self, "_faultInAnimatedFlagImmediately");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CKIMFileTransfer isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CKIMFileTransfer_fileIsAnimated__block_invoke;
  v6[3] = &unk_1E27564A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)hasFinalizedAnimatedFlag
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CKIMFileTransfer_hasFinalizedAnimatedFlag__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__CKIMFileTransfer_hasFinalizedAnimatedFlag__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 13);
  return result;
}

uint64_t __34__CKIMFileTransfer_fileIsAnimated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

void __35__CKIMFileTransfer_attributionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  v8 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = v11;

  v14 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 72);
  *(_QWORD *)(v15 + 72) = v14;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(a1 + 120);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = *(_BYTE *)(a1 + 144);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 80));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 88));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = *(_QWORD *)(a1 + 128);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = *(_BYTE *)(a1 + 145);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(a1 + 146);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = *(_BYTE *)(a1 + 147);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = *(_BYTE *)(a1 + 148);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = *(_QWORD *)(a1 + 136);
  v17 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 80);
  *(_QWORD *)(v18 + 80) = v17;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = *(_BYTE *)(a1 + 149);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = *(_BYTE *)(a1 + 150);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = *(_BYTE *)(a1 + 151);
  objc_msgSend(*(id *)(a1 + 104), "shareURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 152);
  *(_QWORD *)(v22 + 152) = v21;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 22) = objc_msgSend(*(id *)(a1 + 104), "isScreenshot");
  objc_msgSend(*(id *)(a1 + 104), "audioTranscriptionText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 160);
  *(_QWORD *)(v26 + 160) = v25;

  result = objc_msgSend(*(id *)(a1 + 104), "updateReason");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkFileURL, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->_audioTranscriptionText, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_imMessage, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_stickerUserInfo, 0);
  objc_storeStrong((id *)&self->_transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v16;
  _BOOL4 v17;
  id v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  objc_super v24;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKIMFileTransfer guid](self, "guid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transferForGUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "description");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[IMMessage description](self->_imMessage, "description");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v22 = CFSTR("<< Not Loggable On Main Thread >>");
    v20 = CFSTR("<< Not Loggable On Main Thread >>");
  }
  else
  {
    if (-[CKIMFileTransfer isDownloadable](self, "isDownloadable"))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v22 = v6;
    if (-[CKIMFileTransfer isDownloading](self, "isDownloading"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v20 = v7;
    v21 = CFSTR("<< Not Loggable Off Main Thread >>");
    v23 = CFSTR("<< Not Loggable Off Main Thread >>");
  }
  v18 = (id)MEMORY[0x1E0CB3940];
  v24.receiver = self;
  v24.super_class = (Class)CKIMFileTransfer;
  -[CKIMFileTransfer description](&v24, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CKIMFileTransfer isFileURLFinalized](self, "isFileURLFinalized");
  v16 = -[CKIMFileTransfer isFileDataReady](self, "isFileDataReady");
  v9 = -[CKIMFileTransfer isRestoring](self, "isRestoring");
  -[CKIMFileTransfer error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer linkFileURL](self, "linkFileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer filename](self, "filename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer transcoderUserInfo](self, "transcoderUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("[%@ [%@] isFileURLFinalized:%d isFileDataReady:%d isDownloadable:%@ isDownloading:%@ isRestoring:%d error:%@ fileURL:%@ linkFileURL:%@ filename:%@ transcoderUserInfo:%@ currentBytes:%llu totalBytes:%llu imMessage:%@]"), v8, v23, v17, v16, v22, v20, v9, v10, v11, v12, v13, v14, -[CKIMFileTransfer currentBytes](self, "currentBytes"), -[CKIMFileTransfer totalBytes](self, "totalBytes"), v21);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (CKIMFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[CKIMFileTransfer initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", a3, a4, a5, 0, 0, a6, v7);
}

- (CKIMFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSDictionary *v27;
  NSDictionary *attributionInfo;
  CKIMFileTransfer *v29;
  uint64_t v30;
  NSURL *linkFileURL;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v9 = a8;
  v44 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v39 = a4;
  v16 = a5;
  v38 = a6;
  v37 = a7;
  objc_msgSend(v15, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKIMFileTransfer linkFileURLWithFilename:](CKIMFileTransfer, "linkFileURLWithFilename:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v15;
      v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_DEBUG, "Create CKFileTransfer's hard link for %@ at %@.", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v33 = v15;
    v35 = v18;
    _CKLog();
  }
  -[CKIMFileTransfer fileManager](self, "fileManager", v33, v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByDeletingLastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);

  objc_msgSend(v20, "copyItemAtURL:toURL:error:", v15, v18, 0);
  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createNewOutgoingTransferWithLocalFileURL:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transferForGUID:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranscoderUserInfo:", v39);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v16;
      v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "set attributionInfo %@ for guid %@", buf, 0x16u);
    }

  }
  objc_msgSend(v24, "setAttributionInfo:", v16);
  objc_msgSend(v24, "setAdaptiveImageGlyphContentIdentifier:", v38);
  objc_msgSend(v24, "setAdaptiveImageGlyphContentDescription:", v37);
  objc_msgSend(v24, "setHideAttachment:", v9);
  objc_msgSend(v24, "setIsScreenshot:", a9);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v23;
      v42 = 2112;
      v43 = v15;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_DEBUG, "Generate IM guid %@ for %@.", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v34 = v23;
    v36 = v15;
    _CKLog();
  }
  objc_msgSend(v22, "registerTransferWithDaemon:", v23, v34, v36);
  v27 = (NSDictionary *)objc_msgSend(v16, "copy");
  attributionInfo = self->_attributionInfo;
  self->_attributionInfo = v27;

  v29 = -[CKIMFileTransfer initWithTransferGUID:imMessage:](self, "initWithTransferGUID:imMessage:", v23, 0);
  if (v29)
  {
    v30 = objc_msgSend(v18, "copy");
    linkFileURL = v29->_linkFileURL;
    v29->_linkFileURL = (NSURL *)v30;

    -[CKIMFileTransfer reloadTransfer](v29, "reloadTransfer");
  }

  return v29;
}

- (CKIMFileTransfer)initWithStickerFileURL:(id)a3 transferUserInfo:(id)a4 attributionInfo:(id)a5 animatedImageCacheURL:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  CKIMFileTransfer *v22;
  NSObject *v23;
  uint64_t v24;
  NSURL *linkFileURL;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v27 = a6;
  v17 = a7;
  v18 = a8;
  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createNewOutgoingTransferWithLocalFileURL:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transferForGUID:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStickerUserInfo:", v15);
  objc_msgSend(v21, "setIsSticker:", 1);
  objc_msgSend(v21, "setAdaptiveImageGlyphContentIdentifier:", v17);
  objc_msgSend(v21, "setAdaptiveImageGlyphContentDescription:", v18);
  objc_msgSend(v21, "setAttributionInfo:", v16);
  v22 = -[CKIMFileTransfer initWithTransferGUID:imMessage:](self, "initWithTransferGUID:imMessage:", v20, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Generated file guid %@ for fileURL %@", buf, 0x16u);
    }

  }
  if (v22)
  {
    v24 = objc_msgSend(v14, "copy");
    linkFileURL = v22->_linkFileURL;
    v22->_linkFileURL = (NSURL *)v24;

    -[CKIMFileTransfer setAttributionInfo:](v22, "setAttributionInfo:", v16);
    -[CKIMFileTransfer setAnimatedImageCacheURL:](v22, "setAnimatedImageCacheURL:", v27);
    -[CKIMFileTransfer reloadTransfer](v22, "reloadTransfer");
  }

  return v22;
}

- (NSDictionary)transcoderUserInfo
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CKIMFileTransfer_transcoderUserInfo__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __38__CKIMFileTransfer_transcoderUserInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSError)error
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__CKIMFileTransfer_error__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __25__CKIMFileTransfer_error__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)currentBytes
{
  NSObject *isolationQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__CKIMFileTransfer_currentBytes__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__CKIMFileTransfer_currentBytes__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (unint64_t)totalBytes
{
  NSObject *isolationQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CKIMFileTransfer_totalBytes__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__CKIMFileTransfer_totalBytes__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 96);
  return result;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CKIMFileTransfer_adaptiveImageGlyphContentIdentifier__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __55__CKIMFileTransfer_adaptiveImageGlyphContentIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (NSString)adaptiveImageGlyphContentDescription
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CKIMFileTransfer_adaptiveImageGlyphContentDescription__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __56__CKIMFileTransfer_adaptiveImageGlyphContentDescription__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (BOOL)hideAttachment
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CKIMFileTransfer_hideAttachment__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__CKIMFileTransfer_hideAttachment__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 19);
  return result;
}

- (BOOL)isDirectory
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__CKIMFileTransfer_isDirectory__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__CKIMFileTransfer_isDirectory__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

- (int64_t)commSafetySensitive
{
  NSObject *isolationQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CKIMFileTransfer_commSafetySensitive__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__CKIMFileTransfer_commSafetySensitive__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (BOOL)isFileURLFinalized
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CKIMFileTransfer_isFileURLFinalized__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__CKIMFileTransfer_isFileURLFinalized__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (BOOL)isRejected
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CKIMFileTransfer_isRejected__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__CKIMFileTransfer_isRejected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (BOOL)isFileDataReady
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CKIMFileTransfer_isFileDataReady__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__CKIMFileTransfer_isFileDataReady__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 15);
  return result;
}

- (BOOL)isRestoring
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__CKIMFileTransfer_isRestoring__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__CKIMFileTransfer_isRestoring__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 18);
  return result;
}

- (BOOL)isFromMomentShare
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CKIMFileTransfer_isFromMomentShare__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__CKIMFileTransfer_isFromMomentShare__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 21);
  return result;
}

- (int64_t)transferState
{
  NSObject *isolationQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CKIMFileTransfer_transferState__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__CKIMFileTransfer_transferState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  return result;
}

- (NSURL)shareURL
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__73;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CKIMFileTransfer_shareURL__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __28__CKIMFileTransfer_shareURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isThumbnail
{
  void *v3;
  void *v4;
  void *v5;

  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "transferState") == 9;
  return (char)v4;
}

- (BOOL)isDownloadable
{
  void *v3;
  void *v4;
  void *v5;

  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "_isMissingAndDownloadable");
  return (char)v4;
}

- (BOOL)isDownloading
{
  return CKFileTransferIsDownloading(-[CKIMFileTransfer isFileDataReady](self, "isFileDataReady"), -[CKIMFileTransfer transferState](self, "transferState"));
}

- (NSString)originalFilename
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKIMFileTransfer guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "originalFilename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isAdaptiveImageGlyph
{
  void *v2;
  BOOL v3;

  -[CKIMFileTransfer adaptiveImageGlyphContentIdentifier](self, "adaptiveImageGlyphContentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

+ (id)fileManager
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
}

- (void)transferUpdated:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CKIMFileTransfer transferState](self, "transferState");
  v11 = 0;
  -[CKIMFileTransfer _reloadTransferAndDetermineIfUpdated:](self, "_reloadTransferAndDetermineIfUpdated:", &v11);
  -[CKIMFileTransfer notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v11)
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("CKFileTransferUpdatedNotification"), self);
  if (!CKFileTransferIsFileURLFinalized(v5)
    && CKFileTransferIsFileURLFinalized(-[CKIMFileTransfer transferState](self, "transferState")))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[CKIMFileTransfer guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "Transfer %@ finished.", buf, 0xCu);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      -[CKIMFileTransfer guid](self, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _CKLog();

    }
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKFileTransferFinishedNotification"), self, v10);
  }

}

- (void)fetchHighQualityFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CKIMFileTransfer imFileTransferCenter](self, "imFileTransferCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKIMFileTransfer guid](self, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transferForGUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __41__CKIMFileTransfer_fetchHighQualityFile___block_invoke;
      v8[3] = &unk_1E2759CC8;
      v9 = v4;
      objc_msgSend(v5, "fetchHighQualityVariantForTransfer:completion:", v7, v8);

    }
    else if (v4)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __41__CKIMFileTransfer_fetchHighQualityFile___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v9 = v5;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v8);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
    }
    v6 = v9;
  }

}

- (void)attachmentRestored:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKIMFileTransfer isRestoring](self, "isRestoring"))
  {
    -[CKIMFileTransfer reloadTransfer](self, "reloadTransfer");
    if (!-[CKIMFileTransfer isRestoring](self, "isRestoring"))
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          -[CKIMFileTransfer guid](self, "guid");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v10 = v6;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "Transfer %@ restored.", buf, 0xCu);

        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        -[CKIMFileTransfer guid](self, "guid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLog();

      }
      -[CKIMFileTransfer notificationCenter](self, "notificationCenter", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("com.apple.ChatKit.attachmentRestoredNotification"), 0);
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKFileTransferRestoredNotification"), self);

    }
  }

}

+ (id)linkFileURLWithFilename:(id)a3
{
  return CKAttachmentLinkFileURL(a3);
}

+ (id)makeHardLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "linkFileURLWithFilename:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v12 = 138412546;
          v13 = v5;
          v14 = 2112;
          v15 = v6;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Create CKFileTransfer's hard link for %@ at %@.", (uint8_t *)&v12, 0x16u);
        }

      }
      objc_msgSend(a1, "fileManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

      objc_msgSend(v9, "copyItemAtURL:toURL:error:", v5, v6, 0);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setFileIsAnimated:(BOOL)a3
{
  self->_fileIsAnimated = a3;
}

- (int64_t)updateReason
{
  return self->_updateReason;
}

- (void)setUpdateReason:(int64_t)a3
{
  self->_updateReason = a3;
}

- (void)setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (NSString)audioTranscriptionText
{
  return self->_audioTranscriptionText;
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (void)setAnimatedImageCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (NSURL)linkFileURL
{
  return self->_linkFileURL;
}

- (void)setLinkFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

@end
