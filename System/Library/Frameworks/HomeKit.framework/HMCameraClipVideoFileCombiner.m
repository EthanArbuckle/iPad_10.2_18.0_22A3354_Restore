@implementation HMCameraClipVideoFileCombiner

- (HMCameraClipVideoFileCombiner)initWithVideoFileURLs:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  HMCameraClipVideoFileCombiner *v9;
  HMCameraClipVideoFileCombiner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMCameraClipVideoFileCombiner;
  v9 = -[HMCameraClipVideoFileCombiner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoFileURLs, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)combineToOutputFileURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  HMCameraClipVideoFileCombiner *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  HMCameraClipVideoFileCombiner *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  HMCameraClipVideoFileCombiner *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t i;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMCameraClipVideoFileCombiner *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMCameraClipVideoFileCombiner *v50;
  NSObject *v51;
  void *v52;
  int v53;
  void *v54;
  HMCameraClipVideoFileCombiner *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMCameraClipVideoFileCombiner *v61;
  NSObject *v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  HMCameraClipVideoFileCombiner *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  HMCameraClipVideoFileCombiner *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  HMCameraClipVideoFileCombiner *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  HMCameraClipVideoFileCombiner *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  HMCameraClipVideoFileCombiner *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  void *v98;
  HMCameraClipVideoFileCombiner *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  HMCameraClipVideoFileCombiner *v103;
  NSObject *v104;
  void *v105;
  id v106;
  void (**v107)(id, _QWORD);
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  HMCameraClipVideoFileCombiner *v118;
  _QWORD block[4];
  id v120;
  HMCameraClipVideoFileCombiner *v121;
  id v122;
  void (**v123)(id, _QWORD);
  _QWORD v124[4];
  id v125;
  NSObject *v126;
  _QWORD v127[4];
  id v128;
  NSObject *v129;
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  id v136;
  unsigned __int8 v137;
  uint8_t v138[128];
  _BYTE buf[24];
  id v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Combining video files and outputting to file URL: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMCameraClipVideoFileCombiner videoFileURLs](v9, "videoFileURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = v9;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Asked to combine empty list of video file URLs", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v7[2](v7, 0);
    goto LABEL_83;
  }
  v137 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v15, &v137);

  if (v16)
  {
    v17 = v137;
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot combine to output file URL because it is a directory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id))v7)[2](v7, v23);
      goto LABEL_82;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Removing existing file at output file URL: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0;
    v30 = objc_msgSend(v29, "removeItemAtURL:error:", v6, &v136);
    v23 = v136;

    if ((v30 & 1) == 0)
    {
      v79 = (void *)MEMORY[0x1A1AC1AAC]();
      v80 = v19;
      HMFGetOSLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v82;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        v140 = v23;
        _os_log_impl(&dword_19B1B0000, v81, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove existing file at output file URL %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v79);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v83);

      goto LABEL_82;
    }

  }
  -[HMCameraClipVideoFileCombiner videoFileURLs](v9, "videoFileURLs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "na_map:", &__block_literal_global_4015);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v23 = v32;
  v107 = v7;
  v117 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v132, v138, 16);
  v118 = v9;
  v33 = 0;
  v34 = 0;
  if (!v117)
    goto LABEL_45;
  v116 = *(_QWORD *)v133;
  v114 = *MEMORY[0x1E0C8A808];
  v113 = *MEMORY[0x1E0C8A7A0];
  v106 = v6;
  v115 = v23;
  while (2)
  {
    v110 = v34;
    v111 = v33;
    for (i = 0; i != v117; ++i)
    {
      if (*(_QWORD *)v133 != v116)
        objc_enumerationMutation(v23);
      v36 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
      v37 = objc_alloc(MEMORY[0x1E0C8AFD0]);
      v131 = 0;
      v38 = (void *)objc_msgSend(v37, "initWithAsset:error:", v36, &v131);
      v39 = v131;
      if (!v38)
      {
        v75 = (void *)MEMORY[0x1A1AC1AAC]();
        v76 = v9;
        HMFGetOSLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v78;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          v140 = v39;
          _os_log_impl(&dword_19B1B0000, v77, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset reader with asset %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v75);
        ((void (**)(id, id))v7)[2](v7, v39);
        v66 = v23;
        v6 = v106;
        goto LABEL_80;
      }
      objc_msgSend(v36, "tracksWithMediaType:", v114);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        v43 = (void *)MEMORY[0x1A1AC1AAC]();
        v44 = v9;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_INFO, "%{public}@Skipping video for asset because no video track was found: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        v9 = v118;
LABEL_28:
        objc_msgSend(v36, "tracksWithMediaType:", v113);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v42, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v38, "canAddOutput:", v48))
          {
            v60 = (void *)MEMORY[0x1A1AC1AAC]();
            v61 = v9;
            HMFGetOSLogHandle();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v63;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2112;
              v140 = v38;
              _os_log_impl(&dword_19B1B0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Cannot add audio output %@ to reader %@", buf, 0x20u);

              v7 = v107;
            }

            objc_autoreleasePoolPop(v60);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *))v7)[2](v7, v59);
            v53 = 1;
            v9 = v118;
            goto LABEL_41;
          }
          objc_msgSend(v38, "addOutput:", v48);
          objc_msgSend(v108, "addObject:", v48);

        }
        else
        {
          v54 = (void *)MEMORY[0x1A1AC1AAC]();
          v55 = v9;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v57;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v36;
            _os_log_impl(&dword_19B1B0000, v56, OS_LOG_TYPE_INFO, "%{public}@Skipping audio for asset because no audio track was found: %@", buf, 0x16u);

            v7 = v107;
          }

          objc_autoreleasePoolPop(v54);
          v9 = v118;
        }
        objc_msgSend(v38, "startReading");
        objc_msgSend(v112, "addObject:", v38);
        objc_msgSend(v41, "formatDescriptions");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "firstObject");
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "formatDescriptions");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "firstObject");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v111 = v59;
LABEL_41:

        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v41, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "canAddOutput:", v42))
      {
        objc_msgSend(v38, "addOutput:", v42);
        objc_msgSend(v109, "addObject:", v42);

        goto LABEL_28;
      }
      v49 = (void *)MEMORY[0x1A1AC1AAC]();
      v50 = v9;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        v140 = v38;
        _os_log_impl(&dword_19B1B0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Cannot add video output %@ to reader %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v49);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v48);
      v53 = 1;
      v9 = v118;
LABEL_42:

      if (v53)
      {
        v23 = v115;
        v66 = v115;
        v6 = v106;
        goto LABEL_81;
      }
      v23 = v115;
    }
    v6 = v106;
    v34 = v110;
    v33 = v111;
    v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v132, v138, 16);
    if (v117)
      continue;
    break;
  }
LABEL_45:

  v64 = objc_alloc(MEMORY[0x1E0C8B018]);
  v65 = *MEMORY[0x1E0C8A2E0];
  v130 = 0;
  v39 = (id)objc_msgSend(v64, "initWithURL:fileType:error:", v6, v65, &v130);
  v66 = v130;
  if (v39)
  {
    if (!v34)
    {
      v88 = (void *)MEMORY[0x1A1AC1AAC]();
      v89 = v118;
      HMFGetOSLogHandle();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v91 = v33;
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v92;
        _os_log_impl(&dword_19B1B0000, v90, OS_LOG_TYPE_INFO, "%{public}@Skipping video input because no assets contained a video track", buf, 0xCu);

        v33 = v91;
      }

      objc_autoreleasePoolPop(v88);
      v68 = 0;
      if (v33)
        goto LABEL_65;
LABEL_49:
      v70 = (void *)MEMORY[0x1A1AC1AAC](v69);
      v71 = v118;
      HMFGetOSLogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v73;
        _os_log_impl(&dword_19B1B0000, v72, OS_LOG_TYPE_INFO, "%{public}@Skipping audio input because no assets contained an audio track", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v70);
      v74 = 0;
LABEL_67:
      objc_msgSend(v39, "startWriting");
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      objc_msgSend(v39, "startSessionAtSourceTime:", buf);
      v94 = dispatch_group_create();
      v95 = v94;
      v96 = MEMORY[0x1E0C809B0];
      if (v68)
      {
        dispatch_group_enter(v94);
        v127[0] = v96;
        v127[1] = 3221225472;
        v127[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_8;
        v127[3] = &unk_1E3AADDE0;
        v128 = v112;
        v129 = v95;
        -[HMCameraClipVideoFileCombiner writeSamplesFromOutputs:toInput:completion:](v118, "writeSamplesFromOutputs:toInput:completion:", v109, v68, v127);

      }
      if (v74)
      {
        dispatch_group_enter(v95);
        v124[0] = v96;
        v124[1] = 3221225472;
        v124[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_2;
        v124[3] = &unk_1E3AADDE0;
        v125 = v112;
        v126 = v95;
        -[HMCameraClipVideoFileCombiner writeSamplesFromOutputs:toInput:completion:](v118, "writeSamplesFromOutputs:toInput:completion:", v108, v74, v124);

      }
      -[HMCameraClipVideoFileCombiner queue](v118, "queue");
      v97 = objc_claimAutoreleasedReturnValue();
      block[0] = v96;
      block[1] = 3221225472;
      block[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_3;
      block[3] = &unk_1E3AB4D20;
      v120 = v39;
      v121 = v118;
      v122 = v6;
      v7 = v107;
      v123 = v107;
      dispatch_group_notify(v95, v97, block);

      goto LABEL_78;
    }
    v67 = objc_alloc(MEMORY[0x1E0C8B020]);
    v68 = (void *)objc_msgSend(v67, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A808], 0, v34);
    if (objc_msgSend(v39, "canAddInput:", v68))
    {
      v69 = objc_msgSend(v39, "addInput:", v68);
      if (!v33)
        goto LABEL_49;
LABEL_65:
      v93 = objc_alloc(MEMORY[0x1E0C8B020]);
      v74 = (void *)objc_msgSend(v93, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A7A0], 0, v33);
      if (objc_msgSend(v39, "canAddInput:", v74))
      {
        objc_msgSend(v39, "addInput:", v74);
        goto LABEL_67;
      }
      v102 = (void *)MEMORY[0x1A1AC1AAC]();
      v103 = v118;
      HMFGetOSLogHandle();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v105;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v74;
        *(_WORD *)&buf[22] = 2112;
        v140 = v39;
        _os_log_impl(&dword_19B1B0000, v104, OS_LOG_TYPE_ERROR, "%{public}@Cannot add audio input %@ to writer %@", buf, 0x20u);

        v7 = v107;
      }

      objc_autoreleasePoolPop(v102);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v95 = objc_claimAutoreleasedReturnValue();
      ((void (**)(id, NSObject *))v7)[2](v7, v95);
LABEL_78:

    }
    else
    {
      v98 = (void *)MEMORY[0x1A1AC1AAC]();
      v99 = v118;
      HMFGetOSLogHandle();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v101;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v68;
        *(_WORD *)&buf[22] = 2112;
        v140 = v39;
        _os_log_impl(&dword_19B1B0000, v100, OS_LOG_TYPE_ERROR, "%{public}@Cannot add video input %@ to writer %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v98);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v74);
    }

  }
  else
  {
    v84 = (void *)MEMORY[0x1A1AC1AAC]();
    v85 = v118;
    HMFGetOSLogHandle();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v87;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v140 = v66;
      _os_log_impl(&dword_19B1B0000, v86, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset writer with URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v84);
    ((void (**)(id, id))v7)[2](v7, v66);
    v39 = 0;
  }
LABEL_80:

LABEL_81:
LABEL_82:

LABEL_83:
}

- (void)writeSamplesFromOutputs:(id)a3 toInput:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMCameraClipVideoFileCombiner *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  int v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  -[HMCameraClipVideoFileCombiner queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__HMCameraClipVideoFileCombiner_writeSamplesFromOutputs_toInput_completion___block_invoke;
  v15[3] = &unk_1E3AADE08;
  v12 = v9;
  v16 = v12;
  v20 = v21;
  v13 = v8;
  v17 = v13;
  v14 = v10;
  v18 = self;
  v19 = v14;
  objc_msgSend(v12, "requestMediaDataWhenReadyOnQueue:usingBlock:", v11, v15);

  _Block_object_dispose(v21, 8);
}

- (NSArray)videoFileURLs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_videoFileURLs, 0);
}

void __76__HMCameraClipVideoFileCombiner_writeSamplesFromOutputs_toInput_completion___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  opaqueCMSampleBuffer *v7;
  void *v8;
  void *v9;
  CMItemCount NumSamples;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  opaqueCMSampleBuffer *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  opaqueCMSampleBuffer *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
    return;
  v3 = *MEMORY[0x1E0C8A7A0];
  *(_QWORD *)&v2 = 138543618;
  v23 = v2;
  while (1)
  {
    v4 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (objc_msgSend(*(id *)(a1 + 40), "count", v23) <= v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copyNextSampleBuffer");
    if (!v6)
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      goto LABEL_13;
    }
    v7 = (opaqueCMSampleBuffer *)v6;
    objc_msgSend(v5, "track");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v3))
    {
      NumSamples = CMSampleBufferGetNumSamples(v7);

      if (!NumSamples)
      {
        v11 = (void *)MEMORY[0x1A1AC1AAC]();
        v12 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v25 = v14;
          v26 = 2048;
          v27 = v7;
          _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping audio sample buffer with no samples: %p", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        CFRelease(v7);
        goto LABEL_13;
      }
    }
    else
    {

    }
    v15 = objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v7);
    CFRelease(v7);
    if ((v15 & 1) == 0)
      break;
LABEL_13:

    if ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData") & 1) == 0)
      return;
  }
  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(opaqueCMSampleBuffer **)(a1 + 32);
    *(_DWORD *)buf = v23;
    v25 = v19;
    v26 = 2112;
    v27 = v20;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to append sample buffer to input %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
  v21 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_4;
  v6[3] = &unk_1E3AB4D20;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "finishWritingWithCompletionHandler:", v6);

}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2 == 2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v14 = 138543618;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully combined fragments to %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to combine fragments to %@: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

id __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C8B3C0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithURL:options:", v3, 0);

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1)
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_11);
  return (id)logCategory__hmf_once_v20;
}

void __44__HMCameraClipVideoFileCombiner_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20;
  logCategory__hmf_once_v20 = v0;

}

@end
