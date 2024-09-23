@implementation AVAssetWriterWritingHelper

- (AVAssetWriterWritingHelper)initWithConfigurationState:(id)a3 assetWriter:(id)a4
{
  return -[AVAssetWriterWritingHelper initWithConfigurationState:assetWriter:error:](self, "initWithConfigurationState:assetWriter:error:", a3, a4, 0);
}

- (AVAssetWriterWritingHelper)initWithConfigurationState:(id)a3 assetWriter:(id)a4 error:(id *)a5
{
  AVAssetWriterWritingHelper *v7;
  AVAssetWriterWritingHelper *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t i;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  AVAssetWriterFigAssetWriterNotificationHandler *v33;
  const __CFAllocator *v34;
  CFDictionaryRef v35;
  CFDictionaryRef v36;
  OpaqueFigAssetWriter *figAssetWriter;
  void (*v38)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef);
  const __CFAllocator *v39;
  CFDictionaryRef v40;
  CFDictionaryRef v41;
  OpaqueFigAssetWriter *v42;
  void (*v43)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef);
  const __CFAllocator *v44;
  CFDictionaryRef v45;
  CFDictionaryRef v46;
  uint64_t FigBaseObject;
  void (*v48)(uint64_t, _QWORD, CFDictionaryRef);
  const __CFAllocator *v49;
  CFDictionaryRef v50;
  CFDictionaryRef v51;
  uint64_t v52;
  void (*v53)(uint64_t, _QWORD, CFDictionaryRef);
  uint64_t v54;
  OpaqueFigAssetWriter *v55;
  uint64_t v56;
  void (*v57)(OpaqueFigAssetWriter *, _QWORD, uint64_t);
  OpaqueFigAssetWriter *v58;
  void (*v59)(OpaqueFigAssetWriter *, _QWORD, _QWORD);
  const __CFAllocator *v60;
  CFDictionaryRef v61;
  CFDictionaryRef v62;
  OpaqueFigAssetWriter *v63;
  void (*v64)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef);
  NSArray *v65;
  NSArray *v66;
  id v67;
  uint64_t v68;
  void (*v69)(uint64_t, _QWORD, id);
  int v70;
  OpaqueFigAssetWriter *v71;
  uint64_t v72;
  void (*v73)(OpaqueFigAssetWriter *, _QWORD, uint64_t);
  const void *v74;
  OpaqueFigAssetWriter *v75;
  void (*v76)(OpaqueFigAssetWriter *, _QWORD, const void *);
  OpaqueFigAssetWriter *v77;
  uint64_t v78;
  void (*v79)(OpaqueFigAssetWriter *, _QWORD, uint64_t);
  OpaqueFigAssetWriter *v80;
  uint64_t v81;
  void (*v82)(OpaqueFigAssetWriter *, _QWORD, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  OpaqueFigAssetWriter *v91;
  void (*v92)(OpaqueFigAssetWriter *, _QWORD, uint64_t);
  NSArray *v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t j;
  uint64_t v99;
  void (*v100)(uint64_t, _QWORD, _QWORD);
  NSArray *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  id v107;
  OpaqueFigAssetWriter *v108;
  void (*v109)(OpaqueFigAssetWriter *, _QWORD, id);
  uint64_t v110;
  void *v111;
  unint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  OpaqueFigAssetWriter *v117;
  void (*v118)(OpaqueFigAssetWriter *, uint64_t, uint64_t, void *);
  int v119;
  int v120;
  id *v121;
  __CFString *v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE time2[32];
  __int128 v133;
  _BYTE time1[32];
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  __int128 v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  objc_super v150;
  void *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;
  _QWORD v156[4];

  v156[1] = *MEMORY[0x1E0C80C00];
  v150.receiver = self;
  v150.super_class = (Class)AVAssetWriterWritingHelper;
  v151 = 0;
  v7 = -[AVAssetWriterHelper initWithConfigurationState:](&v150, sel_initWithConfigurationState_, a3);
  v8 = v7;
  if (!v7)
    goto LABEL_12;
  v9 = -[NSURL pathExtension](-[AVAssetWriterHelper outputURL](v7, "outputURL"), "pathExtension");
  if (v9 && objc_msgSend((id)AVUnsupportedOutputURLPathExtensions(), "containsObject:", v9))
  {
    v10 = -11843;
LABEL_5:
    v11 = 0;
    goto LABEL_10;
  }
  *(_QWORD *)time1 = 0;
  if (-[AVAssetWriterWritingHelper checkConfigurationToOutputSegmentDataReturningDebugDescription:](v8, "checkConfigurationToOutputSegmentDataReturningDebugDescription:", time1))
  {
    v12 = -[AVAssetWriterHelper outputURL](v8, "outputURL");
    -[AVAssetWriterHelper delegate](v8, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v120 = 1;
    else
      v120 = objc_opt_respondsToSelector();
    v121 = a5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v119 = 1;
    else
      v119 = objc_opt_respondsToSelector();
    v14 = (void *)MEMORY[0x1E0C99E08];
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAssetWriterHelper shouldOptimizeForNetworkUse](v8, "shouldOptimizeForNetworkUse"));
    v16 = (void *)objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E0CC3CE8], 0);
    v17 = (void *)MEMORY[0x1E0C99E08];
    v18 = -[AVMediaFileType figFormatReaderFileFormat](-[AVAssetWriterHelper mediaFileType](v8, "mediaFileType"), "figFormatReaderFileFormat");
    v123 = (void *)objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, *MEMORY[0x1E0CC4398], 0);
    CFRunLoopGetCurrent();
    v19 = -[AVAssetWriterHelper directoryForTemporaryFiles](v8, "directoryForTemporaryFiles");
    v122 = +[AVMediaFileType figFileTypeProfileFromAVFileTypeProfile:](AVMediaFileType, "figFileTypeProfileFromAVFileTypeProfile:", -[AVAssetWriterHelper outputFileTypeProfile](v8, "outputFileTypeProfile"));
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v20 = -[AVAssetWriterHelper inputs](v8, "inputs");
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v146, v154, 16);
    if (v21)
    {
      v22 = v21;
      LOBYTE(v23) = 0;
      v24 = *(_QWORD *)v147;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v147 != v24)
            objc_enumerationMutation(v20);
          if ((v23 & 1) != 0)
            v23 = 1;
          else
            v23 = objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * i), "expectsMediaDataInRealTime");
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v146, v154, 16);
      }
      while (v22);
      if (v19)
        goto LABEL_30;
    }
    else
    {
      v23 = 0;
      if (v19)
LABEL_30:
        objc_msgSend(v16, "setObject:forKey:", v19, *MEMORY[0x1E0CC5C58]);
    }
    if (v23)
      objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3CF0]);
    if (!FigGetCFPreferenceBooleanWithDefault())
    {
      v28 = 0;
      if (!v23)
        goto LABEL_52;
LABEL_48:
      if (-[AVAssetWriterWritingHelper isOutputFileOnExternalStorageDevice](v8, "isOutputFileOnExternalStorageDevice"))
      {
        if (-[AVAssetWriterWritingHelper hasProRes4KHighFPSVideoOutputSetting](v8, "hasProRes4KHighFPSVideoOutputSetting"))
        {
          v29 = -[AVAssetWriterWritingHelper storageSpacePreallocationSize](v8, "storageSpacePreallocationSize");
          if (v29)
            objc_msgSend(v16, "setObject:forKey:", v29, *MEMORY[0x1E0CC3D08]);
        }
      }
LABEL_52:
      if (-[AVAssetWriterHelper usesVirtualCaptureCard](v8, "usesVirtualCaptureCard"))
        objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3D00]);
      if (v122)
        objc_msgSend(v123, "setObject:forKey:", v122, *MEMORY[0x1E0CC4418]);
      v8->_figAssetWriterCallbackContextToken = (void *)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "registerCallbackContextObject:", a4);
      if (-[AVAssetWriterHelper requiresInProcessOperation](v8, "requiresInProcessOperation"))
      {
        if (v12)
        {
          v30 = FigAssetWriterCreateWithURL();
        }
        else
        {
          if (((v120 | v119) & 1) == 0)
            goto LABEL_67;
          v30 = FigAssetWriterCreateForWritingFragmentedData();
        }
      }
      else if (v12)
      {
        v30 = FigAssetWriterRemoteCreateWithURL();
      }
      else
      {
        if (((v120 | v119) & 1) == 0)
          goto LABEL_67;
        v30 = FigAssetWriterRemoteCreateForWritingFragmentedData();
      }
      v31 = v30;
      if ((_DWORD)v30)
      {

        v32 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v31);
        goto LABEL_161;
      }
LABEL_67:
      if (v8->_figAssetWriter)
      {
        v33 = -[AVAssetWriterFigAssetWriterNotificationHandler initWithFigAssetWriter:]([AVAssetWriterFigAssetWriterNotificationHandler alloc], "initWithFigAssetWriter:", v8->_figAssetWriter);
        v8->_notificationHandler = v33;
        -[AVAssetWriterFigAssetWriterNotificationHandler setDelegate:](v33, "setDelegate:", v8);
        v144 = 0uLL;
        v145 = 0;
        -[AVAssetWriterHelper movieFragmentInterval](v8, "movieFragmentInterval");
        if ((BYTE12(v144) & 0x1D) == 1)
        {
          *(_OWORD *)time1 = v144;
          *(_QWORD *)&time1[16] = v145;
          *(_OWORD *)time2 = *MEMORY[0x1E0CA2E68];
          *(_QWORD *)&time2[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
          {
            v34 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            *(_OWORD *)time1 = v144;
            *(_QWORD *)&time1[16] = v145;
            v35 = CMTimeCopyAsDictionary((CMTime *)time1, v34);
            if (v35)
            {
              v36 = v35;
              figAssetWriter = v8->_figAssetWriter;
              v38 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 56);
              if (v38)
                v38(figAssetWriter, *MEMORY[0x1E0CC4488], v36);
              CFRelease(v36);
            }
          }
        }
        v142 = 0uLL;
        v143 = 0;
        -[AVAssetWriterHelper initialMovieFragmentInterval](v8, "initialMovieFragmentInterval");
        if ((BYTE12(v142) & 0x1D) == 1)
        {
          *(_OWORD *)time1 = v142;
          *(_QWORD *)&time1[16] = v143;
          *(_OWORD *)time2 = *MEMORY[0x1E0CA2E68];
          *(_QWORD *)&time2[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
          {
            v39 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            *(_OWORD *)time1 = v142;
            *(_QWORD *)&time1[16] = v143;
            v40 = CMTimeCopyAsDictionary((CMTime *)time1, v39);
            if (v40)
            {
              v41 = v40;
              v42 = v8->_figAssetWriter;
              v43 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 56);
              if (v43)
                v43(v42, *MEMORY[0x1E0CC4450], v41);
              CFRelease(v41);
            }
          }
        }
        v140 = 0uLL;
        v141 = 0;
        -[AVAssetWriterHelper preferredOutputSegmentInterval](v8, "preferredOutputSegmentInterval");
        *(_OWORD *)time1 = v140;
        *(_QWORD *)&time1[16] = v141;
        *(_OWORD *)time2 = *MEMORY[0x1E0CA2E10];
        *(_QWORD *)&time2[16] = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
        if (!CMTimeCompare((CMTime *)time1, (CMTime *)time2)
          || (BYTE12(v140) & 0x1D) == 1
          && (*(_OWORD *)time1 = v140,
              *(_QWORD *)&time1[16] = v141,
              *(_OWORD *)time2 = *MEMORY[0x1E0CA2E68],
              *(_QWORD *)&time2[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
              CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1))
        {
          v44 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          *(_OWORD *)time1 = v140;
          *(_QWORD *)&time1[16] = v141;
          v45 = CMTimeCopyAsDictionary((CMTime *)time1, v44);
          if (v45)
          {
            v46 = v45;
            FigBaseObject = FigAssetWriterGetFigBaseObject();
            v48 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
            if (v48)
              v48(FigBaseObject, *MEMORY[0x1E0CC3D28], v46);
            CFRelease(v46);
          }
        }
        v138 = 0uLL;
        v139 = 0;
        -[AVAssetWriterHelper initialSegmentStartTime](v8, "initialSegmentStartTime");
        if ((BYTE12(v138) & 0x1D) == 1)
        {
          v49 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          *(_OWORD *)time1 = v138;
          *(_QWORD *)&time1[16] = v139;
          v50 = CMTimeCopyAsDictionary((CMTime *)time1, v49);
          if (v50)
          {
            v51 = v50;
            v52 = FigAssetWriterGetFigBaseObject();
            v53 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
            if (v53)
              v53(v52, *MEMORY[0x1E0CC3D10], v51);
            CFRelease(v51);
          }
        }
        v54 = -[AVAssetWriterHelper initialMovieFragmentSequenceNumber](v8, "initialMovieFragmentSequenceNumber");
        if (v54 >= 1)
        {
          v55 = v8->_figAssetWriter;
          v56 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v54);
          v57 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 56);
          if (v57)
            v57(v55, *MEMORY[0x1E0CC44B0], v56);
        }
        if (-[AVAssetWriterHelper producesCombinableFragments](v8, "producesCombinableFragments"))
        {
          v58 = v8->_figAssetWriter;
          v59 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 56);
          if (v59)
            v59(v58, *MEMORY[0x1E0CC44C8], *MEMORY[0x1E0C9AE50]);
        }
        v136 = 0uLL;
        v137 = 0;
        -[AVAssetWriterHelper overallDurationHint](v8, "overallDurationHint");
        if ((BYTE12(v136) & 1) != 0)
        {
          v60 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          *(_OWORD *)time1 = v136;
          *(_QWORD *)&time1[16] = v137;
          v61 = CMTimeCopyAsDictionary((CMTime *)time1, v60);
          if (v61)
          {
            v62 = v61;
            v63 = v8->_figAssetWriter;
            v64 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 56);
            if (v64)
              v64(v63, *MEMORY[0x1E0CC4480], v62);
            CFRelease(v62);
          }
        }
        v65 = -[AVAssetWriterHelper metadata](v8, "metadata");
        if (v65)
        {
          v66 = v65;
          if (-[NSArray count](v65, "count"))
          {
            v67 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", v66);
            v68 = FigAssetWriterGetFigBaseObject();
            v69 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
            if (v69)
              v69(v68, *MEMORY[0x1E0CC3D20], v67);
          }
        }
        v70 = -[AVAssetWriterHelper movieTimeScale](v8, "movieTimeScale");
        if (v70)
        {
          v71 = v8->_figAssetWriter;
          v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v70);
          v73 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 56);
          if (v73)
            v73(v71, *MEMORY[0x1E0CC44A0], v72);
        }
        v135 = 0u;
        memset(time1, 0, sizeof(time1));
        -[AVAssetWriterHelper preferredTransform](v8, "preferredTransform");
        *(_OWORD *)time2 = *(_OWORD *)time1;
        *(_OWORD *)&time2[16] = *(_OWORD *)&time1[16];
        v133 = v135;
        v74 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
        v75 = v8->_figAssetWriter;
        v76 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 56);
        if (v76)
          v76(v75, *MEMORY[0x1E0CC4490], v74);
        if (v74)
          CFRelease(v74);
        -[AVAssetWriterHelper preferredVolume](v8, "preferredVolume");
        v77 = v8->_figAssetWriter;
        v78 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v79 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
        if (v79)
          v79(v77, *MEMORY[0x1E0CC44C0], v78);
        -[AVAssetWriterHelper preferredRate](v8, "preferredRate");
        v80 = v8->_figAssetWriter;
        v81 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v82 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
        if (v82)
          v82(v80, *MEMORY[0x1E0CC5F90], v81);
        v83 = -[AVAssetWriterHelper singlePassFileSize](v8, "singlePassFileSize");
        v84 = -[AVAssetWriterHelper singlePassMediaDataSize](v8, "singlePassMediaDataSize");
        if (v83)
        {
          v85 = v84;
          if (v84)
          {
            v86 = (void *)MEMORY[0x1E0C99D80];
            v87 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v83);
            v88 = *MEMORY[0x1E0CC4440];
            v89 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v85);
            v90 = objc_msgSend(v86, "dictionaryWithObjectsAndKeys:", v87, v88, v89, *MEMORY[0x1E0CC4438], 0);
            v91 = v8->_figAssetWriter;
            v92 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 56);
            if (v92)
              v92(v91, *MEMORY[0x1E0CC44E8], v90);
          }
        }
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v93 = -[AVAssetWriterHelper inputs](v8, "inputs");
        v94 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
        if (v94)
        {
          v95 = v94;
          LOBYTE(v96) = 0;
          v97 = *(_QWORD *)v129;
          do
          {
            for (j = 0; j != v95; ++j)
            {
              if (*(_QWORD *)v129 != v97)
                objc_enumerationMutation(v93);
              if ((v96 & 1) != 0)
                v96 = 1;
              else
                v96 = objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * j), "maximizePowerEfficiency");
            }
            v95 = -[NSArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
          }
          while (v95);
          if (v96)
          {
            v99 = FigAssetWriterGetFigBaseObject();
            v100 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
            if (v100)
              v100(v99, *MEMORY[0x1E0CC3D18], *MEMORY[0x1E0C9AE50]);
          }
        }
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v101 = -[AVAssetWriterHelper inputs](v8, "inputs");
        v102 = -[NSArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v124, v152, 16);
        if (v102)
        {
          v103 = v102;
          v104 = *(_QWORD *)v125;
LABEL_137:
          v105 = 0;
          while (1)
          {
            if (*(_QWORD *)v125 != v104)
              objc_enumerationMutation(v101);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * v105), "_prepareForWritingWithFigAssetWriter:mediaFileType:error:", v8->_figAssetWriter, -[AVAssetWriterHelper mediaFileType](v8, "mediaFileType"), &v151) & 1) == 0)break;
            if (v103 == ++v105)
            {
              v103 = -[NSArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v124, v152, 16);
              if (v103)
                goto LABEL_137;
              goto LABEL_143;
            }
          }
          a5 = v121;
          if (v151)
            goto LABEL_11;
          v10 = -11800;
          goto LABEL_5;
        }
LABEL_143:
        v106 = v28;
        v107 = -[AVAssetWriterWritingHelper figTrackReferences](v8, "figTrackReferences");
        v108 = v8->_figAssetWriter;
        v109 = *(void (**)(OpaqueFigAssetWriter *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 56);
        if (v109)
          v109(v108, *MEMORY[0x1E0CC44D8], v107);
        v110 = objc_msgSend(v107, "objectForKey:", *MEMORY[0x1E0CC6270]);
        if (v110)
        {
          v111 = (void *)v110;
          if (-[AVAssetWriterWritingHelper isConfiguredForFragmentedMPEG4](v8, "isConfiguredForFragmentedMPEG4"))
          {
            if (objc_msgSend(v111, "count"))
            {
              v112 = 0;
              v113 = *MEMORY[0x1E0CC45C8];
              do
              {
                v114 = (void *)objc_msgSend(v111, "objectAtIndex:", v112);
                if (v114)
                {
                  v115 = objc_msgSend(v114, "intValue");
                  v116 = (void *)objc_msgSend(-[AVAssetWriterWritingHelper writerInputForTrackID:](v8, "writerInputForTrackID:", v115), "mediaDataLocation");
                  if ((objc_msgSend(v116, "isEqualToString:", CFSTR("AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData")) & 1) != 0|| objc_msgSend(v116, "isEqualToString:", CFSTR("AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData")))
                  {
                    v117 = v8->_figAssetWriter;
                    v118 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
                    if (v118)
                      v118(v117, v115, v113, &unk_1E30936A0);
                  }
                }
                v112 += 2;
              }
              while (v112 < objc_msgSend(v111, "count"));
            }
          }
        }
        if (v106)
          -[AVAssetWriterWritingHelper setAllInputsFigPreferredChunkAlignmentTo:](v8, "setAllInputsFigPreferredChunkAlignmentTo:", 0x4000);
        v8->_figAssetWriterAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avassetwriter.writing.assetwriteraccessqueue", 0);
LABEL_162:
        a5 = v121;
        if (!v121)
          return v8;
        goto LABEL_13;
      }

      v32 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
LABEL_161:
      v8 = 0;
      v151 = v32;
      goto LABEL_162;
    }
    if (v12)
      v26 = v23;
    else
      v26 = 0;
    if (v26 == 1
      && -[AVAssetWriterWritingHelper hasProResVideoOutputSetting](v8, "hasProResVideoOutputSetting")
      && -[AVAssetWriterWritingHelper areAllInputsPreferredMediaChunkAlignmentEqualTo:](v8, "areAllInputsPreferredMediaChunkAlignmentEqualTo:", 0))
    {
      v27 = 1;
    }
    else
    {
      v27 = 0;
      v28 = 0;
      if (!-[AVAssetWriterWritingHelper areAllInputsPreferredMediaChunkAlignmentEqualTo:](v8, "areAllInputsPreferredMediaChunkAlignmentEqualTo:", 0x4000))goto LABEL_43;
    }
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3CF8]);
    -[AVAssetWriterWritingHelper prepareEncodedSampleBuffersForPaddedWrites](v8, "prepareEncodedSampleBuffersForPaddedWrites");
    v28 = v27;
LABEL_43:
    if (!v23)
      goto LABEL_52;
    goto LABEL_48;
  }
  v155 = *MEMORY[0x1E0CB2938];
  v156[0] = *(_QWORD *)time1;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, &v155, 1);
  v10 = -11875;
LABEL_10:
  v151 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v10, v11);
LABEL_11:

  v8 = 0;
LABEL_12:
  if (a5)
LABEL_13:
    *a5 = v151;
  return v8;
}

- (id)writerInputForTrackID:(int)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[AVAssetWriterHelper inputs](self, "inputs", 0);
  v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "outputTrackID") == a3)
        {
          v5 = v9;
          return v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (BOOL)isConfiguredForFragmentedMPEG4
{
  NSString *v3;
  int v4;

  v3 = -[AVAssetWriterHelper outputFileTypeProfile](self, "outputFileTypeProfile");
  v4 = -[NSString isEqual:](-[AVMediaFileType UTI](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "UTI"), "isEqual:", CFSTR("public.mpeg-4"));
  if (v4)
    LOBYTE(v4) = -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("MPEG4AppleHLS"))
              || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("MPEG4CMAFCompliant"));
  return v4;
}

- (BOOL)checkConfigurationToOutputSegmentDataReturningDebugDescription:(id *)a3
{
  NSURL *v5;
  int v6;
  int v7;
  int v8;
  __CFString *v9;
  int v10;
  NSString *v11;
  int v12;
  CMTimeEpoch v13;
  int32_t v14;
  NSString *v15;
  __int128 v17;
  CMTime v18;
  CMTime time2;
  CMTime time1;
  CMTime v21;
  __CFString *v22;

  v5 = -[AVAssetWriterHelper outputURL](self, "outputURL");
  -[AVAssetWriterHelper delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 1;
  else
    v6 = objc_opt_respondsToSelector();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 1;
  else
    v7 = objc_opt_respondsToSelector();
  v22 = 0;
  v8 = v6 ^ 1;
  if (v5 && (v8 & 1) == 0)
  {
    LOBYTE(v8) = 0;
    v9 = CFSTR("The outputURL and the delegate method to output segment data cannot be specified at same time. Only one of them must be specified.");
    goto LABEL_52;
  }
  v10 = v7 ^ 1;
  if (v5 && (v10 & 1) == 0)
  {
    LOBYTE(v8) = 0;
    v9 = CFSTR("The outputURL and the delegate method to produce fragmented data cannot be specified at same time. Only one of them must be specified.");
    goto LABEL_52;
  }
  if (((v8 | v10) & 1) == 0)
  {
    LOBYTE(v8) = 0;
    v9 = CFSTR("The delegate method to output segment data and the delegate method to produce fragmented data cannot be specified at same time. Only one of them must be specified.");
    goto LABEL_52;
  }
  if (!((v5 != 0) | (v6 | v7) & 1))
  {
    LOBYTE(v8) = 0;
    v9 = CFSTR("Neither the outputURL nor the delegate method to output segment data is specified. One of them must be specified.");
    goto LABEL_52;
  }
  v11 = -[AVAssetWriterHelper outputFileTypeProfile](self, "outputFileTypeProfile");
  v12 = -[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("MPEG4AppleHLS"))
     || -[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("MPEG4CMAFCompliant"));
  memset(&v21, 0, sizeof(v21));
  if (self)
    -[AVAssetWriterHelper preferredOutputSegmentInterval](self, "preferredOutputSegmentInterval");
  time1 = v21;
  v17 = *MEMORY[0x1E0CA2E10];
  *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E10];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  time2.epoch = v13;
  if (!CMTimeCompare(&time1, &time2))
  {
    if ((v6 & 1) != 0)
      goto LABEL_28;
    if (v12)
      goto LABEL_43;
    goto LABEL_50;
  }
  if ((v21.flags & 0x1D) == 1)
  {
    time1 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    time2 = v21;
    v14 = CMTimeCompare(&time1, &time2);
    if ((v6 & 1) != 0)
    {
      if ((v14 & 0x80000000) == 0)
      {
        LOBYTE(v8) = 0;
        v9 = CFSTR("The value of the preferredOutputSegmentInterval property must be kCMTimeIndefinite or a positive numeric time to output segment data.");
        goto LABEL_52;
      }
LABEL_28:
      memset(&time1, 0, sizeof(time1));
      if (self)
        -[AVAssetWriterHelper initialSegmentStartTime](self, "initialSegmentStartTime");
      time2 = v21;
      *(_OWORD *)&v18.value = v17;
      v18.epoch = v13;
      if (CMTimeCompare(&time2, &v18) && (time1.flags & 0x1D) != 1)
      {
        LOBYTE(v8) = 0;
        v9 = CFSTR("The value of the initialSegmentStartTime property must be a numeric time to output segment data.");
        goto LABEL_52;
      }
      v15 = -[AVMediaFileType UTI](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "UTI");
      if (-[NSString isEqual:](v15, "isEqual:", CFSTR("public.mpeg-4")))
      {
        if (v12)
        {
          time2 = v21;
          LOBYTE(v8) = -[AVAssetWriterWritingHelper checkAVAssetWriterInputConfigurationToOutputSegmentDataForFragmentedMPEG4FileTypeProfile:preferredOutputSegmentInterval:returningDebugDescription:](self, "checkAVAssetWriterInputConfigurationToOutputSegmentDataForFragmentedMPEG4FileTypeProfile:preferredOutputSegmentInterval:returningDebugDescription:", v11, &time2, &v22);
          v9 = v22;
        }
        else
        {
          LOBYTE(v8) = 0;
          v9 = CFSTR("The value of the outputFileTypeProfile property must be file type profile AppleHLS or CMAFCompliant to output segment data.");
        }
        goto LABEL_52;
      }
      if ((-[NSString isEqual:](v15, "isEqual:", CFSTR("org.w3.webvtt")) & 1) == 0)
      {
        v9 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVAssetWriter does not supports file type %@ if the delegate method to output segment data is implemented."), v15);
        goto LABEL_44;
      }
LABEL_49:
      v9 = 0;
      LOBYTE(v8) = 1;
      goto LABEL_52;
    }
    if ((v12 & 1) != 0)
    {
LABEL_43:
      v9 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVAssetWriter supports file type profile %@ if the delegate method to output segment data is implemented. Please use -initWithContentType: initializer and implement -assetWriter:didOutputSegmentData:segmentType:segmentReport: or -assetWriter:didOutputSegmentData:segmentType: delegate method."), v11);
LABEL_44:
      LOBYTE(v8) = 0;
      goto LABEL_52;
    }
    if ((v14 & 0x80000000) == 0)
      goto LABEL_49;
LABEL_50:
    LOBYTE(v8) = 0;
    v9 = CFSTR("The preferredOutputSegmentInterval property is used if the delegate method to output segment data is implemented. Please use -initWithContentType: initializer and implemen -assetWriter:didOutputSegmentData:segmentType:segmentReport: or -assetWriter:didOutputSegmentData:segmentType: delegate method.");
    goto LABEL_52;
  }
  if ((v6 & 1) != 0)
    v9 = CFSTR("The value of the preferredOutputSegmentInterval property must be kCMTimeIndefinite or a positive numeric time to output segment data.");
  else
    v9 = 0;
  if (!(v6 & 1 | ((v12 & 1) == 0)))
    goto LABEL_43;
LABEL_52:
  *a3 = v9;
  return v8 & 1;
}

- (BOOL)checkAVAssetWriterInputConfigurationToOutputSegmentDataForFragmentedMPEG4FileTypeProfile:(id)a3 preferredOutputSegmentInterval:(id *)a4 returningDebugDescription:(id *)a5
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CMTime time2;
  CMTime time1;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = -[AVAssetWriterHelper inputs](self, "inputs");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v29 = 0;
    v26 = 0;
    v27 = 0;
    v25 = 0;
    v28 = 0;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "outputSettings");
        v14 = (void *)objc_msgSend(v12, "mediaType");
        if ((objc_msgSend(v14, "isEqual:", CFSTR("vide")) & 1) != 0
          || (objc_msgSend(v14, "isEqual:", CFSTR("auxv")) & 1) != 0
          || objc_msgSend(v14, "isEqual:", CFSTR("scen")))
        {
          if (v13)
            ++v8;
          else
            ++v9;
        }
        else if (objc_msgSend(v14, "isEqual:", CFSTR("soun")))
        {
          if (v13)
            ++v29;
          else
            ++v27;
        }
        else if (objc_msgSend(v14, "isEqual:", CFSTR("clcp")))
        {
          if (v13)
            ++v26;
          else
            ++v25;
        }
        else
        {
          if (!objc_msgSend(v14, "isEqual:", CFSTR("meta")))
          {
            v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media type '%@' is not allowed for file type profile %@."), v14, a3);
            goto LABEL_66;
          }
          ++v28;
        }
        ++v11;
      }
      while (v7 != v11);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v7 = v15;
    }
    while (v15);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v29 = 0;
    v26 = 0;
    v27 = 0;
    v25 = 0;
    v28 = 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MPEG4CMAFCompliant")))
  {
    if (-[NSArray count](-[AVAssetWriterHelper inputs](self, "inputs"), "count") >= 2)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("More than one track is not allowed for file type profile %@."), a3, v20);
LABEL_66:
      v18 = 0;
      goto LABEL_67;
    }
    if (v25 + v26 >= 1)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Closed caption track is not allowed for file type profile %@."), a3, v20);
      goto LABEL_66;
    }
    if (v28 >= 1)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata track is not allowed for file type profile %@."), a3, v20);
      goto LABEL_66;
    }
  }
  v17 = v9 + v8;
  if (v9 + v8 > 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("More than one video track is not allowed for file type profile %@."), a3, v20);
    goto LABEL_66;
  }
  if (v27 + v29 >= 2)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("More than one audio track is not allowed for file type profile %@."), a3, v20);
    goto LABEL_66;
  }
  if (v25 + v26 >= 2)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("More than one closed caption track is not allowed for file type profile %@."), a3, v20);
    goto LABEL_66;
  }
  if (v28 >= 2)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("More than one metadata track is not allowed for file type profile %@."), a3, v20);
    goto LABEL_66;
  }
  if (!v17 && v25 + v26 >= 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Closed caption track must accompany video track for file type profile %@."), a3, v20);
    goto LABEL_66;
  }
  if (!((v27 + v29) | v17) && v28 >= 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata track must accompany video track or audio track for file type profile %@."), a3, v20);
    goto LABEL_66;
  }
  if (v8 >= 1 && v27 >= 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVAssetWriter does not support encoding of video track and passthrough of audio track at same time for file type profile %@. Please match both AVAssetWriterInput's output settings."), a3, v20);
    goto LABEL_66;
  }
  if (v29 >= 1 && v9 >= 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AVAssetWriter does not support encoding of audio track and passthrough of video track at same time for file type profile %@. Please match both AVAssetWriterInput's output settings."), a3, v20);
    goto LABEL_66;
  }
  if ((a4->var2 & 0x1D) == 1)
  {
    time1 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    time2 = (CMTime)*a4;
    if (CMTimeCompare(&time1, &time2) < 0 && v9 >= 1 && v27 >= 1)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("If the value of the preferredOutputSegmentInterval property is a positive numeric time, AVAssetWriter does not support passthrough of video track and audio track at same time for file type profile %@. Please specify a non-nil output settings dictionary for both AVAssetWriterInput. Otherwise, please add one of them."), a3, v20);
      goto LABEL_66;
    }
  }
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  if (!CMTimeCompare(&time1, &time2) && (v8 > 0 || v29 > 0 || v26 >= 1))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("If the value of the preferredOutputSegmentInterval property is kCMTimeIndefinite, AVAssetWriter only supports pssthrough for file type profile %@. Please specify nil for all AVAssetWriterInput's output settings."), a3, v20);
    goto LABEL_66;
  }
  v16 = 0;
  v18 = 1;
LABEL_67:
  *a5 = v16;
  return v18;
}

- (id)figTrackReferences
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  int v18;
  uint64_t v19;
  NSArray *obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = -[AVAssetWriterHelper inputs](self, "inputs");
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v38;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v3);
        v5 = objc_msgSend(v4, "outputTrackID");
        v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v7 = (void *)objc_msgSend(v4, "_trackReferences");
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v27 = v7;
        v25 = (id)objc_msgSend(v7, "keyEnumerator");
        v8 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v8)
        {
          v9 = v8;
          v26 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v34 != v26)
                objc_enumerationMutation(v25);
              v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              v12 = (void *)objc_msgSend(v28, "objectForKey:", v11);
              if (!v12)
              {
                v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                objc_msgSend(v28, "setObject:forKey:", v12, v11);
              }
              v13 = (void *)objc_msgSend(v27, "objectForKey:", v11);
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v30;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v30 != v16)
                      objc_enumerationMutation(v13);
                    v18 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "outputTrackID");
                    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
                    objc_msgSend(v12, "addObject:", v6);
                    objc_msgSend(v12, "addObject:", v19);
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
                }
                while (v15);
              }
            }
            v9 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v9);
        }
        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v23);
  }
  if (objc_msgSend(v28, "count"))
    return v28;
  else
    return 0;
}

- (BOOL)areAllInputsPreferredMediaChunkAlignmentEqualTo:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVAssetWriterHelper inputs](self, "inputs", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "preferredMediaChunkAlignment") != a3)
          return 0;
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 1;
}

- (void)setAllInputsFigPreferredChunkAlignmentTo:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OpaqueFigAssetWriter *figAssetWriter;
  uint64_t v12;
  void (*v13)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t);
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = -[AVAssetWriterHelper inputs](self, "inputs");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0CC4618];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "outputTrackID");
        figAssetWriter = self->_figAssetWriter;
        v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v13 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
        if (v13)
          v13(figAssetWriter, v10, v8, v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
}

- (void)prepareEncodedSampleBuffersForPaddedWrites
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[AVAssetWriterHelper inputs](self, "inputs", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "mediaType"), "isEqual:", CFSTR("vide")))
        {
          v8 = (void *)objc_msgSend(v7, "_outputSettingsObject");
          if (v8)
            objc_msgSend(v8, "setShouldPrepareEncodedSampleBuffersForPaddedWrites:", 1);
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
}

- (id)storageSpacePreallocationSize
{
  id result;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  result = -[AVAssetWriterHelper outputURL](self, "outputURL");
  if (result)
  {
    v3 = (void *)objc_msgSend(result, "URLByDeletingLastPathComponent");
    result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfFileSystemForPath:error:", objc_msgSend(v3, "path"), &v9);
    if (result)
    {
      result = (id)objc_msgSend(result, "objectForKey:", *MEMORY[0x1E0CB2B00]);
      if (result)
      {
        v4 = result;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = objc_msgSend(v4, "longLongValue");
          if (v5 >= 0)
            v6 = v5;
          else
            v6 = v5 + 1;
          v7 = v6 >> 1;
          if (v5 <= 0x8000000001)
            v8 = v7;
          else
            v8 = 0x4000000000;
          return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)hasProRes4KHighFPSVideoOutputSetting
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = -[AVAssetWriterHelper inputs](self, "inputs", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "mediaType"), "isEqual:", CFSTR("vide")))
        {
          v8 = (void *)objc_msgSend(v7, "_outputSettingsObject");
          if (v8)
          {
            if ((objc_msgSend(v8, "isProRes4KHighFPSSetting") & 1) != 0)
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)hasProResVideoOutputSetting
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = -[AVAssetWriterHelper inputs](self, "inputs", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "mediaType"), "isEqual:", CFSTR("vide")))
        {
          v8 = (void *)objc_msgSend(v7, "_outputSettingsObject");
          if (v8)
          {
            if ((objc_msgSend(v8, "isProRes") & 1) != 0)
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)isOutputFileOnExternalStorageDevice
{
  NSURL *v2;

  v2 = -[AVAssetWriterHelper outputURL](self, "outputURL");
  if (v2)
  {
    v2 = -[NSURL absoluteURL](v2, "absoluteURL");
    if (v2)
      LOBYTE(v2) = FigFileIsFileOnExternalStorageDevice() != 0;
  }
  return (char)v2;
}

- (void)dealloc
{
  OpaqueFigAssetWriter *figAssetWriter;
  NSObject *figAssetWriterAccessQueue;
  objc_super v5;

  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter)
    CFRelease(figAssetWriter);

  figAssetWriterAccessQueue = self->_figAssetWriterAccessQueue;
  if (figAssetWriterAccessQueue)
    dispatch_release(figAssetWriterAccessQueue);
  if (self->_figAssetWriterCallbackContextToken)
  {
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_figAssetWriterCallbackContextToken);
    self->_figAssetWriterCallbackContextToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterWritingHelper;
  -[AVAssetWriterHelper dealloc](&v5, sel_dealloc);
}

- (void)didReceiveFigAssetWriterNotificationWithSuccess:(BOOL)a3 error:(id)a4
{
  -[AVAssetWriterWritingHelper transitionToFailedStatusWithError:](self, "transitionToFailedStatusWithError:", a4);
}

- (int64_t)status
{
  return 1;
}

- (void)startSessionAtSourceTime:(id *)a3
{
  OpaqueFigAssetWriter *v5;
  OpaqueFigAssetWriter *v6;
  void (*v7)(OpaqueFigAssetWriter *, __int128 *);
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int64_t var3;
  __int128 v19;
  int64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[AVAssetWriterWritingHelper _retainedFigAssetWriter](self, "_retainedFigAssetWriter");
  if (v5)
  {
    v6 = v5;
    v17 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v7 = *(void (**)(OpaqueFigAssetWriter *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v7)
    {
      v19 = v17;
      v20 = var3;
      v7(v6, &v19);
    }
    self->_startSessionCalled = 1;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = -[AVAssetWriterHelper inputs](self, "inputs", 0);
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_didStartInitialSession");
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }
    CFRelease(v6);
  }
}

- (void)endSessionAtSourceTime:(id *)a3
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  OpaqueFigAssetWriter *v11;
  OpaqueFigAssetWriter *v12;
  uint64_t (*v13)(OpaqueFigAssetWriter *, __int128 *);
  int v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  int64_t var3;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = -[AVAssetWriterHelper inputs](self, "inputs");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "_prepareToEndSession");
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }
  v11 = -[AVAssetWriterWritingHelper _retainedFigAssetWriter](self, "_retainedFigAssetWriter");
  if (v11)
  {
    v12 = v11;
    v24 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v13 = *(uint64_t (**)(OpaqueFigAssetWriter *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                       + 112);
    if (v13)
    {
      v30 = v24;
      v31 = var3;
      v14 = v13(v12, &v30);
      CFRelease(v12);
      if (v14 == -12142)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99768];
        v17 = (objc_class *)objc_opt_class();
        v23 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithClassAndSelector(v17, a2, (uint64_t)CFSTR("Cannot end a session without first starting a session"), v18, v19, v20, v21, v22, v24), 0);
        objc_exception_throw(v23);
      }
    }
    else
    {
      CFRelease(v12);
    }
  }
}

- (OpaqueFigAssetWriter)_retainedFigAssetWriter
{
  NSObject *figAssetWriterAccessQueue;
  OpaqueFigAssetWriter *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  figAssetWriterAccessQueue = self->_figAssetWriterAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__AVAssetWriterWritingHelper__retainedFigAssetWriter__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(figAssetWriterAccessQueue, v5);
  v3 = (OpaqueFigAssetWriter *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __53__AVAssetWriterWritingHelper__retainedFigAssetWriter__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)cancelWriting
{
  NSObject *figAssetWriterAccessQueue;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t);
  uint64_t v6;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (-[AVAssetWriterHelper _transitionToClientInitiatedTerminalStatus:](self, "_transitionToClientInitiatedTerminalStatus:", 4))
  {
    -[AVAssetWriterFigAssetWriterNotificationHandler setDelegate:](self->_notificationHandler, "setDelegate:", 0);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    figAssetWriterAccessQueue = self->_figAssetWriterAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AVAssetWriterWritingHelper_cancelWriting__block_invoke;
    block[3] = &unk_1E302FD60;
    block[4] = self;
    block[5] = &v8;
    dispatch_sync(figAssetWriterAccessQueue, block);
    FigBaseObject = FigAssetWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      v5 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v5)
        v5(FigBaseObject);
    }
    CFRelease((CFTypeRef)v9[3]);
    v6 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", -[AVAssetWriterHelper outputURL](self, "outputURL"), &v6);
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __43__AVAssetWriterWritingHelper_cancelWriting__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

- (void)finishWriting
{
  void *v3;
  AVBlockOperation *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  if (objc_msgSend(v3, "isEqual:", objc_msgSend(MEMORY[0x1E0CB3978], "mainThread")))
  {
    NSLog(CFSTR("WARNING: -finishWriting should not be called on the main thread."));
    v4 = [AVBlockOperation alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__AVAssetWriterWritingHelper_finishWriting__block_invoke;
    v9[3] = &unk_1E3032498;
    v9[4] = self;
    v5 = -[AVAssetWriterWritingHelper _makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:](self, "_makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:", -[AVBlockOperation initWithBlock:](v4, "initWithBlock:", v9));
    AVExecuteOperationsSynchronously((void *)objc_msgSend(v5, "arrayByAddingObject:", -[AVAssetWriterWritingHelper _transitionToFinishWritingHelperWithFinishWritingOperations:](self, "_transitionToFinishWritingHelperWithFinishWritingOperations:", v5)));
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v6 = -[AVAssetWriterWritingHelper _makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:](self, "_makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:", 0);
    v7 = -[AVAssetWriterWritingHelper _transitionToFinishWritingHelperWithFinishWritingOperations:](self, "_transitionToFinishWritingHelperWithFinishWritingOperations:", v6);
    objc_msgSend(v8, "setName:", CFSTR("com.apple.avfoundation.assetwriter.finishwriting"));
    objc_msgSend(v8, "addOperations:waitUntilFinished:", v6, 0);
    objc_msgSend(v8, "addOperation:", v7);
    objc_msgSend(v7, "waitUntilFinished");

  }
}

uint64_t __43__AVAssetWriterWritingHelper_finishWriting__block_invoke(uint64_t a1, _QWORD *a2)
{
  const void *v3;
  uint64_t (*v4)(const void *);
  uint64_t v5;
  uint64_t FigBaseObject;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;

  v3 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_retainedFigAssetWriter");
  v4 = *(uint64_t (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
  if (v4)
    v5 = v4(v3);
  else
    v5 = 4294954514;
  FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    v7 = FigBaseObject;
    v8 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v8)
      v8(v7);
  }
  if ((_DWORD)v5)
  {
    if (a2)
      *a2 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v5);
    v9 = 4;
  }
  else
  {
    v9 = 2;
  }
  CFRelease(v3);
  return v9;
}

- (void)finishWritingWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = +[AVGlobalOperationQueue defaultQueue](AVGlobalOperationQueue, "defaultQueue");
  v6 = -[AVAssetWriterWritingHelper _makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:](self, "_makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:", 0);
  v7 = -[AVAssetWriterWritingHelper _transitionToFinishWritingHelperWithFinishWritingOperations:](self, "_transitionToFinishWritingHelperWithFinishWritingOperations:", v6);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__AVAssetWriterWritingHelper_finishWritingWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E30324C0;
  v16[4] = a3;
  objc_msgSend(v7, "setCompletionBlock:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "enqueueOperation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }
  objc_msgSend(v5, "enqueueOperation:", v7);
}

uint64_t __65__AVAssetWriterWritingHelper_finishWritingWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:(id)a3
{
  void *v5;
  id v6;
  OpaqueFigAssetWriter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = -[AVWeakReference referencedObject](-[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"), "referencedObject");
  v7 = -[AVAssetWriterWritingHelper _retainedFigAssetWriter](self, "_retainedFigAssetWriter");
  v8 = objc_msgSend(v6, "finishWritingDelegate");
  if (!self->_startSessionCalled)
    goto LABEL_15;
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
    if (a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = objc_msgSend((id)objc_opt_class(), "finishWritingDelegateOperationWithAssetWriter:andFigAssetWriter:andDelegate:", v6, v7, v8);
  objc_msgSend(v5, "addObject:", v10);
  if (!a3)
LABEL_4:
    a3 = -[AVFigAssetWriterFinishWritingAsyncOperation initWithFigAssetWriter:]([AVFigAssetWriterFinishWritingAsyncOperation alloc], "initWithFigAssetWriter:", v7);
LABEL_5:
  objc_msgSend(v5, "addObject:", a3);
  objc_msgSend(a3, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finish writing file at %@, initiated by %@"), -[AVAssetWriterHelper outputURL](self, "outputURL"), v6));
  v11 = (void *)objc_msgSend((id)objc_opt_class(), "prepareInputsOperationsWithInputs:", -[AVAssetWriterHelper inputs](self, "inputs"));
  objc_msgSend(v5, "addObjectsFromArray:", v11);
  v12 = (void *)objc_msgSend((id)objc_opt_class(), "finalStepWorkaroundOperationWithFigAssetWriter:", v7);
  v19 = v5;
  objc_msgSend(v5, "addObject:", v12);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v9)
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "addDependency:", v10);
        objc_msgSend(a3, "addDependency:", v17);
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }
  objc_msgSend(v12, "addDependency:", a3);
  v5 = v19;
LABEL_15:
  if (v7)
    CFRelease(v7);
  return v5;
}

- (id)_transitionToFinishWritingHelperWithFinishWritingOperations:(id)a3
{
  AVAssetWriterFinishWritingHelper *v4;
  NSOperation *v5;
  id v6;

  v4 = -[AVAssetWriterFinishWritingHelper initWithConfigurationState:finishWritingOperations:figAssetWriterCallbackContextToken:figAssetWriter:]([AVAssetWriterFinishWritingHelper alloc], "initWithConfigurationState:finishWritingOperations:figAssetWriterCallbackContextToken:figAssetWriter:", -[AVAssetWriterHelper configurationState](self, "configurationState"), a3, self->_figAssetWriterCallbackContextToken, self->_figAssetWriter);
  self->_figAssetWriterCallbackContextToken = 0;
  v5 = -[AVAssetWriterFinishWritingHelper transitionToTerminalStatusOperation](v4, "transitionToTerminalStatusOperation");
  v6 = -[AVWeakReference referencedObject](-[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"), "referencedObject");
  -[AVAssetWriterFigAssetWriterNotificationHandler setDelegate:](self->_notificationHandler, "setDelegate:", 0);
  objc_msgSend(v6, "_setHelper:ifCurrentHelper:", v4, self);

  return v5;
}

+ (id)prepareInputsOperationsWithInputs:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  AVBlockOperation *v10;
  AVBlockOperation *v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = [AVBlockOperation alloc];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __64__AVAssetWriterWritingHelper_prepareInputsOperationsWithInputs___block_invoke;
        v13[3] = &unk_1E3032498;
        v13[4] = v9;
        v11 = -[AVBlockOperation initWithBlock:](v10, "initWithBlock:", v13);
        -[AVBlockOperation setName:](v11, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare for finishing input %@"), v9));
        objc_msgSend(v4, "addObject:", v11);

      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return v4;
}

uint64_t __64__AVAssetWriterWritingHelper_prepareInputsOperationsWithInputs___block_invoke(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_prepareToFinishWritingReturningError:", a2))
    return 2;
  else
    return 4;
}

+ (id)finishWritingDelegateOperationWithAssetWriter:(id)a3 andFigAssetWriter:(OpaqueFigAssetWriter *)a4 andDelegate:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVBlockOperation *v11;
  uint64_t v12;
  AVBlockOperation *v13;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[7];

  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = "assetWriter != nil";
    goto LABEL_6;
  }
  if (!a4)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = "figAssetWriter != NULL";
LABEL_6:
    v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, (uint64_t)a5, v5, v6, v7, (uint64_t)v17), 0);
    objc_exception_throw(v18);
  }
  CFRetain(a4);
  v11 = [AVBlockOperation alloc];
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke;
  v20[3] = &unk_1E30324E8;
  v20[4] = a5;
  v20[5] = a3;
  v20[6] = a4;
  v13 = -[AVBlockOperation initWithBlock:](v11, "initWithBlock:", v20);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke_2;
  v19[3] = &__block_descriptor_40_e5_v8__0l;
  v19[4] = a4;
  -[AVBlockOperation setCompletionBlock:](v13, "setCompletionBlock:", v19);
  -[AVBlockOperation setName:](v13, "setName:", CFSTR("Call finish-writing delegate"));
  return v13;
}

uint64_t __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFAllocator *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *);
  uint64_t Count;
  uint64_t v12;
  CFMutableArrayRef Mutable;
  __CFArray *v14;
  CFIndex j;
  const void *ValueAtIndex;
  int v17;
  CFTypeRef v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, __CFArray *);
  int v23;
  uint64_t v25;
  id obj;
  uint64_t v27;
  CFTypeRef cf;
  CFArrayRef theArray;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)objc_msgSend(*(id *)(a1 + 40), "inputs");
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v31;
      v27 = *MEMORY[0x1E0CC4590];
      v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v25 = *MEMORY[0x1E0CC4658];
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v31 != v4)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          theArray = 0;
          v8 = *(_QWORD *)(a1 + 48);
          v9 = objc_msgSend(v7, "outputTrackID");
          v10 = *(void (**)(uint64_t, uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 160);
          if (v10)
            v10(v8, v9, v27, v5, &theArray);
          if (theArray)
          {
            Count = CFArrayGetCount(theArray);
            if (Count >= 1)
            {
              v12 = Count;
              Mutable = CFArrayCreateMutable(v5, Count, MEMORY[0x1E0C9B378]);
              if (Mutable)
              {
                v14 = Mutable;
                for (j = 0; j != v12; ++j)
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(theArray, j);
                  cf = 0;
                  v17 = objc_msgSend(*(id *)(a1 + 32), "assetWriterInput:shouldReplaceFormatDescription:replacementFormatDescription:", v7, ValueAtIndex, &cf);
                  v18 = cf;
                  if (v17)
                    v19 = cf == 0;
                  else
                    v19 = 1;
                  if (v19)
                    v18 = ValueAtIndex;
                  CFArraySetValueAtIndex(v14, j, v18);
                  if (cf)
                    CFRelease(cf);
                }
                v20 = *(_QWORD *)(a1 + 48);
                v21 = objc_msgSend(v7, "outputTrackID");
                v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __CFArray *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
                v23 = v22 ? v22(v20, v21, v25, v14) : -12782;
                CFRelease(v14);
                CFRelease(theArray);
                if (v23)
                  return 4;
              }
            }
          }
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v3)
          continue;
        break;
      }
    }
  }
  return 2;
}

void __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

+ (id)finalStepWorkaroundOperationWithFigAssetWriter:(OpaqueFigAssetWriter *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVBlockOperation *v9;
  uint64_t v10;
  AVBlockOperation *v11;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  if (!a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"figAssetWriter != NULL"), 0);
    objc_exception_throw(v13);
  }
  CFRetain(a3);
  v9 = [AVBlockOperation alloc];
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke;
  v15[3] = &__block_descriptor_40_e9_q16__0__8l;
  v15[4] = a3;
  v11 = -[AVBlockOperation initWithBlock:](v9, "initWithBlock:", v15);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke_2;
  v14[3] = &__block_descriptor_40_e5_v8__0l;
  v14[4] = a3;
  -[AVBlockOperation setCompletionBlock:](v11, "setCompletionBlock:", v14);
  -[AVBlockOperation setName:](v11, "setName:", CFSTR("Invalidate FigAssetWriter, to ensure that audio files are finalized properly"));
  return v11;
}

uint64_t __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke()
{
  uint64_t FigBaseObject;
  uint64_t v1;
  void (*v2)(uint64_t);

  FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    v1 = FigBaseObject;
    v2 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v2)
      v2(v1);
  }
  return 2;
}

void __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)transitionToFailedStatusWithError:(id)a3
{
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  objc_super v8;

  FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    v6 = FigBaseObject;
    v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v7)
      v7(v6);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterWritingHelper;
  -[AVAssetWriterHelper transitionToFailedStatusWithError:](&v8, sel_transitionToFailedStatusWithError_, a3);
}

- (void)flushSegment
{
  OpaqueFigAssetWriter *v2;
  OpaqueFigAssetWriter *v3;
  void (*v4)(OpaqueFigAssetWriter *);

  v2 = -[AVAssetWriterWritingHelper _retainedFigAssetWriter](self, "_retainedFigAssetWriter");
  if (v2)
  {
    v3 = v2;
    v4 = *(void (**)(OpaqueFigAssetWriter *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 168);
    if (v4)
      v4(v3);
    CFRelease(v3);
  }
}

- (BOOL)_isDefunct
{
  OpaqueFigAssetWriter *figAssetWriter;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAssetWriter *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  figAssetWriter = self->_figAssetWriter;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAssetWriter *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(figAssetWriter, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

@end
