void mediatedPixelBufferAttributesChanged(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPixelBufferAttributeMediatorPixelBufferAttributesDidChangeNotification"), a2, objc_msgSend(a2, "mediatedPixelBufferAttributes"));
  objc_autoreleasePoolPop(v3);
}

void __avplayer_fpNotificationCallback_block_invoke(uint64_t a1)
{
  const void *v2;
  char v3;
  int v4;
  char *v5;
  _QWORD *v6;
  void *v7;
  float v8;
  uint64_t v9;
  int v10;
  char v11;
  const void *v12;
  int v13;
  id v14;
  float v15;
  float v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  int v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  void *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  void *v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  const void *v62;
  const void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const void *v67;
  CFTypeID v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  int v72;
  uint64_t v73;
  NSObject *v74;
  int v75;
  CFBooleanRef v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  char v96;
  uint64_t v97;
  NSObject *v98;
  uint64_t v99;
  int v100;
  int v101;
  uint64_t v102;
  NSObject *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  void *context;
  _QWORD v109[4];
  __int128 v110;
  id v111;
  float v112;
  char v113;
  char v114;
  _QWORD block[8];
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  CFBooleanRef BOOLean[2];
  uint64_t v121;
  char v122;
  _QWORD v123[7];
  char v124;
  _QWORD v125[6];
  _QWORD v126[5];
  char v127;
  _QWORD v128[5];
  char v129;
  _QWORD v130[6];
  BOOL v131;
  _QWORD v132[5];
  char v133;
  _QWORD v134[5];
  char v135;
  _QWORD v136[5];
  char v137;
  _QWORD v138[5];
  char v139;
  _QWORD v140[5];
  char v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[5];
  char v147;
  _BYTE v148[128];
  const __CFString *v149;
  const __CFString *v150;
  const __CFString *v151;
  _QWORD v152[3];

  v152[1] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1940343FC]();
  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_copyFigPlayer");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_hasCurrentInterstitialEvent");
  v4 = CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57C8]);
  v5 = "n't change once set";
  v6 = (_QWORD *)MEMORY[0x1E0CC5890];
  if (v4)
    goto LABEL_2;
  if (!CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57F8]))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5798]))
    {
      v22 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5880]);
      if (v22)
        v23 = objc_msgSend(v22, "BOOLValue");
      else
        v23 = objc_msgSend(*(id *)(a1 + 32), "_isMuted");
      v33 = v23;
      v15 = 0.0;
      if (v23 == objc_msgSend(*(id *)(a1 + 32), "isMuted"))
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        goto LABEL_58;
      }
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("muted"));
      v34 = *(_QWORD *)(a1 + 32);
      v35 = *(NSObject **)(*(_QWORD *)(v34 + 8) + 56);
      v146[0] = MEMORY[0x1E0C809B0];
      v146[1] = 3221225472;
      v146[2] = __avplayer_fpNotificationCallback_block_invoke_2;
      v146[3] = &unk_1E302FD38;
      v146[4] = v34;
      v147 = v33;
      av_readwrite_dispatch_queue_write(v35, v146);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("muted"));
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_36;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5760]))
    {
      v25 = *(_QWORD **)(a1 + 32);
      if (*(_BYTE *)(v25[1] + 88))
        objc_msgSend(v25, "_logPerformanceDataForPreviousItem");
      v26 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC58C0]);
      v27 = *(_QWORD **)(a1 + 32);
      v28 = v27[1];
      v12 = *(const void **)(v28 + 736);
      if (v12)
      {
        *(_QWORD *)(v28 + 736) = 0;
        v27 = *(_QWORD **)(a1 + 32);
      }
      v29 = objc_msgSend((id)objc_msgSend(v27, "currentItem"), "_copyFigPlaybackItem");
      if ((const void *)v29 == v12)
      {
        v43 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v44 = *(_QWORD *)(a1 + 32);
        if (v26)
        {
          v45 = *(_QWORD *)(a1 + 56);
        }
        else
        {
          v151 = CFSTR("ReasonForCurrentItemDidChange");
          v152[0] = CFSTR("ReasonUnknown");
          v45 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
        }
        objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("AVPlayerCurrentItemDidChangeNotification"), v44, v45);
        goto LABEL_73;
      }
      v30 = (const void *)v29;
      if (v26
        && ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0CC5680]) & 1) != 0
         || objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0CC5688])))
      {
        v31 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v32 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_advanceCurrentItemAccordingToFigPlaybackItem:", v12);
        v31 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v32 = *(_QWORD *)(a1 + 32);
        if (!v26)
        {
          v149 = CFSTR("ReasonForCurrentItemDidChange");
          v150 = CFSTR("ReasonUnknown");
          v46 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
          goto LABEL_57;
        }
      }
      v46 = *(_QWORD *)(a1 + 56);
LABEL_57:
      objc_msgSend(v31, "postNotificationName:object:userInfo:", CFSTR("AVPlayerCurrentItemDidChangeNotification"), v32, v46);
      v10 = 0;
      v11 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0.0;
      v12 = v30;
      goto LABEL_58;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57F0]))
    {
      v36 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5BF8]);
      v37 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v142 = 0u;
      v143 = 0u;
      v144 = 0u;
      v145 = 0u;
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v142, v148, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v143;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v143 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v42 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", v41);
              if (v42)
                objc_msgSend(v37, "addObject:", v42);
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v142, v148, 16);
        }
        while (v38);
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "_setTimedMetadata:", v37);
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0.0;
      v5 = "appIdentifier can't change once set" + 16;
      goto LABEL_58;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57D0]))
      goto LABEL_83;
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57D8]))
    {
      v65 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5BC8]);
      v66 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11912, 0);
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("status"));
      objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", v66);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("status"));
      objc_msgSend(*(id *)(a1 + 32), "cancelPendingPrerolls");
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "cancelPendingSeeks");
      AVMediaStatePurgePostMediaStateWasPurgedNotificationForObject(*(_QWORD *)(a1 + 32), v65);
      goto LABEL_6;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA4B88]))
    {
LABEL_83:
      if (objc_msgSend(*(id *)(a1 + 32), "status") != 2)
      {
        v64 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0);
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("status"));
        objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", v64);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("status"));
      }
      objc_msgSend(*(id *)(a1 + 32), "cancelPendingPrerolls");
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "cancelPendingSeeks");
      goto LABEL_6;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57E8]))
    {
      v67 = *(const void **)(a1 + 56);
      if (v67)
      {
        v68 = CFGetTypeID(v67);
        if (v68 == CFDictionaryGetTypeID())
        {
          LODWORD(BOOLean[0]) = 0;
          FigCFDictionaryGetInt32IfPresent();
        }
      }
      v69 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
      if (objc_msgSend(*(id *)(a1 + 32), "status") != 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("status"));
        objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", v69);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("status"));
      }
      objc_msgSend(*(id *)(a1 + 32), "cancelPendingPrerolls");
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "cancelPendingSeeks");
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0.0;
LABEL_36:
      v5 = "n't change once set";
      goto LABEL_58;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5780]))
    {
      LOBYTE(BOOLean[0]) = 0;
      if (FigCFDictionaryGetBooleanIfPresent())
      {
        v70 = *(_QWORD *)(a1 + 32);
        v71 = *(NSObject **)(*(_QWORD *)(v70 + 8) + 56);
        v140[0] = MEMORY[0x1E0C809B0];
        v140[1] = 3221225472;
        v140[2] = __avplayer_fpNotificationCallback_block_invoke_3;
        v140[3] = &unk_1E302FD38;
        v140[4] = v70;
        v141 = (char)BOOLean[0];
        av_readwrite_dispatch_queue_write(v71, v140);
        objc_msgSend(*(id *)(a1 + 32), "_canOverlapPlaybackConditionsChanged");
      }
      goto LABEL_129;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5778]))
    {
      v72 = objc_msgSend(*(id *)(a1 + 32), "_airPlayVideoActive");
      if (v72 != objc_msgSend(*(id *)(a1 + 32), "_isAirPlayVideoActive"))
      {
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("airPlayVideoActive"));
        v73 = *(_QWORD *)(a1 + 32);
        v74 = *(NSObject **)(*(_QWORD *)(v73 + 8) + 56);
        v138[0] = MEMORY[0x1E0C809B0];
        v138[1] = 3221225472;
        v138[2] = __avplayer_fpNotificationCallback_block_invoke_4;
        v138[3] = &unk_1E302FD38;
        v138[4] = v73;
        v139 = v72;
        av_readwrite_dispatch_queue_write(v74, v138);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("airPlayVideoActive"));
      }
      BOOLean[0] = 0;
      v75 = FigPlayerCopyProperty(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728), *MEMORY[0x1E0CC5A30], *MEMORY[0x1E0C9AE00], (uint64_t)BOOLean);
      v76 = BOOLean[0];
      if (!v75 && BOOLean[0])
      {
        if (CFBooleanGetValue(BOOLean[0]))
          v72 = 1;
        v76 = BOOLean[0];
      }
      if (v76)
      {
        CFRelease(v76);
        BOOLean[0] = 0;
      }
      if (v72 != objc_msgSend(*(id *)(a1 + 32), "isExternalPlaybackActive"))
      {
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("externalPlaybackActive"));
        v77 = *(_QWORD *)(a1 + 32);
        v78 = *(NSObject **)(*(_QWORD *)(v77 + 8) + 56);
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = __avplayer_fpNotificationCallback_block_invoke_5;
        v136[3] = &unk_1E302FD38;
        v136[4] = v77;
        v137 = v72;
        av_readwrite_dispatch_queue_write(v78, v136);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("externalPlaybackActive"));
      }
      goto LABEL_129;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57A0]))
    {
      LOBYTE(BOOLean[0]) = 0;
      FigCFDictionaryGetBooleanIfPresent();
      if (objc_msgSend(*(id *)(a1 + 32), "_isPIPModePossible"))
      {
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("PIPModePossible"));
        v79 = *(_QWORD *)(a1 + 32);
        v80 = *(NSObject **)(*(_QWORD *)(v79 + 8) + 56);
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __avplayer_fpNotificationCallback_block_invoke_6;
        v134[3] = &unk_1E302FD38;
        v134[4] = v79;
        v135 = 0;
        av_readwrite_dispatch_queue_write(v80, v134);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("PIPModePossible"));
      }
      goto LABEL_129;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5788]))
    {
      v81 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5878]);
      if ((objc_msgSend(*(id *)(a1 + 32), "_airPlayVideoActive") & 1) != 0
        || objc_msgSend(v81, "BOOLValue"))
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "isExternalPlaybackActive") & 1) == 0)
        {
          LOBYTE(v82) = 1;
LABEL_125:
          objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("externalPlaybackActive"));
          v86 = *(_QWORD *)(a1 + 32);
          v87 = *(NSObject **)(*(_QWORD *)(v86 + 8) + 56);
          v132[0] = MEMORY[0x1E0C809B0];
          v132[1] = 3221225472;
          v132[2] = __avplayer_fpNotificationCallback_block_invoke_7;
          v132[3] = &unk_1E302FD38;
          v132[4] = v86;
          v133 = v82;
          av_readwrite_dispatch_queue_write(v87, v132);
          objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("externalPlaybackActive"));
        }
      }
      else
      {
        v82 = objc_msgSend(*(id *)(a1 + 32), "_externalPlaybackActive");
        if (v82 != objc_msgSend(*(id *)(a1 + 32), "isExternalPlaybackActive"))
          goto LABEL_125;
      }
    }
    else
    {
      if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57B8]))
      {
        v83 = *(void **)(a1 + 32);
        v84 = *(_QWORD *)(a1 + 56);
        v85 = 1;
      }
      else
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57C0]))
        {
          if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5770]))
          {
            v88 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5868]);
            v89 = *(void **)(a1 + 32);
            if (v88)
              v90 = objc_msgSend(v89, "_extractFPExternalProtectionStatus:");
            else
              v90 = objc_msgSend(v89, "_externalProtectionStatusCopiedFromFig");
            v93 = v90;
            v15 = 0.0;
            if ((v90 != 0) != objc_msgSend(*(id *)(a1 + 32), "outputObscuredDueToInsufficientExternalProtection"))
            {
              objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("outputObscuredDueToInsufficientExternalProtection"));
              v94 = *(_QWORD *)(a1 + 32);
              v95 = *(NSObject **)(*(_QWORD *)(v94 + 8) + 56);
              v130[0] = MEMORY[0x1E0C809B0];
              v130[1] = 3221225472;
              v130[2] = __avplayer_fpNotificationCallback_block_invoke_8;
              v130[3] = &unk_1E3031B80;
              v131 = v93 != 0;
              v130[4] = v94;
              v130[5] = v93;
              av_readwrite_dispatch_queue_write(v95, v130);
              objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("outputObscuredDueToInsufficientExternalProtection"));
            }
          }
          else if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5768]))
          {
            v91 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5860]);
            if (v91)
              v92 = objc_msgSend(v91, "BOOLValue");
            else
              v92 = objc_msgSend(*(id *)(a1 + 32), "_isDisplayingClosedCaptions");
            v96 = v92;
            v15 = 0.0;
            if (v92 != objc_msgSend(*(id *)(a1 + 32), "isDisplayingClosedCaptions"))
            {
              objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isDisplayingClosedCaptions"));
              v97 = *(_QWORD *)(a1 + 32);
              v98 = *(NSObject **)(*(_QWORD *)(v97 + 8) + 56);
              v128[0] = MEMORY[0x1E0C809B0];
              v128[1] = 3221225472;
              v128[2] = __avplayer_fpNotificationCallback_block_invoke_9;
              v128[3] = &unk_1E302FD38;
              v128[4] = v97;
              v129 = v96;
              av_readwrite_dispatch_queue_write(v98, v128);
              objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isDisplayingClosedCaptions"));
              v99 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerIsDisplayingClosedCaptionsDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v99);
            }
          }
          else
          {
            if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57A8]))
            {
              v17 = 0;
              v11 = 0;
              v15 = 0.0;
              goto LABEL_12;
            }
            v100 = CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57E0]);
            v6 = (_QWORD *)MEMORY[0x1E0CC5890];
            if (v100)
            {
LABEL_2:
              v7 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *v6);
              if (v7)
                objc_msgSend(v7, "floatValue");
              else
                objc_msgSend(*(id *)(a1 + 32), "_rate");
              v15 = v8;
              objc_msgSend(*(id *)(a1 + 32), "rate");
              v17 = v15 != v16;
              if (v4)
              {
                v11 = 0;
                v13 = 0;
                v14 = 0;
                v10 = 0;
                v12 = 0;
                if (v15 == v16)
                  goto LABEL_58;
                goto LABEL_20;
              }
              v11 = 1;
LABEL_12:
              v18 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5888]);
              v123[0] = MEMORY[0x1E0C809B0];
              v123[1] = 3221225472;
              v123[2] = __avplayer_fpNotificationCallback_block_invoke_12;
              v123[3] = &unk_1E3031BA8;
              v124 = v3;
              v19 = *(_QWORD *)(a1 + 40);
              v123[4] = v18;
              v123[5] = v19;
              v123[6] = v2;
              v14 = (id)objc_msgSend(v123, "copy");
              BOOLean[0] = 0;
              BOOLean[1] = (CFBooleanRef)BOOLean;
              v121 = 0x2020000000;
              v122 = 0;
              v116 = 0;
              v117 = &v116;
              v118 = 0x2020000000;
              v119 = 0;
              v20 = *(_QWORD *)(a1 + 32);
              v21 = *(NSObject **)(*(_QWORD *)(v20 + 8) + 56);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __avplayer_fpNotificationCallback_block_invoke_13;
              block[3] = &unk_1E3031B08;
              block[4] = v20;
              block[5] = v14;
              block[6] = BOOLean;
              block[7] = &v116;
              av_readwrite_dispatch_queue_read(v21, block);
              if (*((_BYTE *)BOOLean[1] + 24))
              {
                _Block_object_dispose(&v116, 8);
                _Block_object_dispose(BOOLean, 8);
              }
              else
              {
                v24 = *((unsigned __int8 *)v117 + 24);
                _Block_object_dispose(&v116, 8);
                _Block_object_dispose(BOOLean, 8);
                if (!v24)
                {
                  v10 = 0;
                  if (v17)
                  {
                    v13 = 0;
                    goto LABEL_19;
                  }
                  v12 = 0;
                  v13 = 0;
LABEL_22:
                  v5 = "n't change once set";
                  goto LABEL_58;
                }
              }
              objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("timeControlStatus"));
              objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
              v13 = 1;
              if (v17)
              {
LABEL_19:
                v5 = "n't change once set";
LABEL_20:
                objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("rate"));
                v12 = 0;
                v10 = 1;
                goto LABEL_58;
              }
              v10 = 0;
              v12 = 0;
              goto LABEL_22;
            }
            if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC57B0]))
            {
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerPlaybackWasInterruptedNotification"), *(_QWORD *)(a1 + 32), 0);
              goto LABEL_129;
            }
            if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5758]))
            {
              v101 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5858]), "BOOLValue");
              v15 = 0.0;
              if (v101 != objc_msgSend(*(id *)(a1 + 32), "isSilencedDueToConflictWithOtherPlayback"))
              {
                objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isSilencedDueToConflictWithOtherPlayback"));
                v102 = *(_QWORD *)(a1 + 32);
                v103 = *(NSObject **)(*(_QWORD *)(v102 + 8) + 56);
                v126[0] = MEMORY[0x1E0C809B0];
                v126[1] = 3221225472;
                v126[2] = __avplayer_fpNotificationCallback_block_invoke_10;
                v126[3] = &unk_1E302FD38;
                v126[4] = v102;
                v127 = v101;
                av_readwrite_dispatch_queue_write(v103, v126);
                objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isSilencedDueToConflictWithOtherPlayback"));
              }
            }
            else
            {
              v15 = 0.0;
              if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CC5790]))
              {
                v104 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC58A0]);
                v105 = objc_msgSend(*(id *)(a1 + 32), "mxSessionID");
                if (v104 != (void *)v105 && (objc_msgSend(v104, "isEqual:", v105) & 1) == 0)
                {
                  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("mxSessionID"));
                  v106 = *(_QWORD *)(a1 + 32);
                  v107 = *(NSObject **)(*(_QWORD *)(v106 + 8) + 56);
                  v125[0] = MEMORY[0x1E0C809B0];
                  v125[1] = 3221225472;
                  v125[2] = __avplayer_fpNotificationCallback_block_invoke_11;
                  v125[3] = &unk_1E302FCE8;
                  v125[4] = v106;
                  v125[5] = v104;
                  av_readwrite_dispatch_queue_write(v107, v125);
                  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("mxSessionID"));
                }
              }
            }
          }
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          goto LABEL_22;
        }
        v83 = *(void **)(a1 + 32);
        v84 = *(_QWORD *)(a1 + 56);
        v85 = 0;
      }
      objc_msgSend(v83, "prerollOperationDidComplete:notificationPayload:", v85, v84);
    }
LABEL_129:
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0.0;
    goto LABEL_22;
  }
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("AVController_Volume")), CFSTR("_AVPlayer_Volume"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("_AVPlayer_VolumeDidChangeNotification"), *(_QWORD *)(a1 + 32), v9);
LABEL_6:
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0.0;
LABEL_58:
  v109[0] = MEMORY[0x1E0C809B0];
  v47 = *(_OWORD *)(a1 + 32);
  v48 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
  v109[1] = *((_QWORD *)v5 + 424);
  v109[2] = __avplayer_fpNotificationCallback_block_invoke_14;
  v109[3] = &unk_1E3031BD0;
  v113 = v10;
  v112 = v15;
  v110 = v47;
  v114 = v13;
  v111 = v14;
  av_readwrite_dispatch_queue_write(v48, v109);
  if (v10)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5890]), "floatValue");
    v50 = v49;
    v51 = *MEMORY[0x1E0CC58C8];
    v52 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC58C8]), "intValue");
    v53 = objc_msgSend(*(id *)(a1 + 32), "_isInterstitialPlayer");
    if (v52 == 33)
      v54 = v53;
    else
      v54 = 0;
    if (v54 == 1)
    {
      v55 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_weakReferenceToPrimaryPlayer"), "referencedObject");
      *(_OWORD *)BOOLean = *MEMORY[0x1E0CA2E18];
      v121 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      objc_msgSend(v55, "_handleSetRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", BOOLean, 0, 33, 0, COERCE_DOUBLE(__PAIR64__(HIDWORD(BOOLean[0]), v50)));
    }
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("rate"));
    v56 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC58B8]);
    v57 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v51), "intValue");
    if ((v11 & (v57 == 0)) != 0)
      v58 = 2;
    else
      v58 = v57;
    v59 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E0CC5850]);
    if (v59)
      v60 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v59);
    else
      v60 = 0;
    v61 = objc_msgSend(*(id *)(a1 + 32), "_rateDidChangeNotificationPayloadForFigRateChangeReason:rateChangeIdentifier:rateChangeOriginator:", v58, v56, v60);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVPlayerRateDidChangeNotification"), *(_QWORD *)(a1 + 32), v61);
  }
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("timeControlStatus"));
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  }
LABEL_73:
  if (v12)
    CFRelease(v12);
  v62 = *(const void **)(a1 + 48);
  if (v62)
    CFRelease(v62);
  v63 = *(const void **)(a1 + 56);
  if (v63)
    CFRelease(v63);
  if (v2)
    CFRelease(v2);
  objc_autoreleasePoolPop(context);
}

void sub_1933B0048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1933B0454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVLayerTransformForPlacement@<X0>(void *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  void *v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;

  v10 = (_OWORD *)MEMORY[0x1E0CD2610];
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)(a3 + 80) = v11;
  v12 = v10[7];
  *(_OWORD *)(a3 + 96) = v10[6];
  *(_OWORD *)(a3 + 112) = v12;
  v13 = v10[1];
  *(_OWORD *)a3 = *v10;
  *(_OWORD *)(a3 + 16) = v13;
  v14 = v10[3];
  *(_OWORD *)(a3 + 32) = v10[2];
  *(_OWORD *)(a3 + 48) = v14;
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a4 != *MEMORY[0x1E0C9D820] || a5 != v15)
  {
    v19 = result;
    if (!a2 || (a6 == *MEMORY[0x1E0C9D820] ? (v20 = a7 == v15) : (v20 = 0), !v20))
    {
      result = (void *)objc_msgSend(result, "isEqualToString:", CFSTR("AVLayerVideoGravityResize"));
      if ((_DWORD)result)
      {
        v21 = a6 / a4;
        v22 = a7 / a5;
      }
      else
      {
        result = (void *)objc_msgSend(v19, "isEqualToString:", CFSTR("AVLayerVideoGravityResizeAspectFill"));
        v23 = fmin(a6 / a4, a7 / a5);
        v22 = fmax(a6 / a4, a7 / a5);
        if ((_DWORD)result)
          v21 = v22;
        else
          v21 = v23;
        if (!(_DWORD)result)
          v22 = v23;
      }
      *(double *)a3 = v21;
      *(double *)(a3 + 40) = v22;
    }
  }
  return result;
}

void sub_1933B0C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void AVSerializeOnQueueAsyncIfNecessary(NSObject *a1, void (**a2)(_QWORD))
{
  if (dispatch_get_current_queue() == a1
    || a1 == MEMORY[0x1E0C80D38] && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    a2[2](a2);
  }
  else
  {
    dispatch_async(a1, a2);
  }
}

void sub_1933B0DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B1004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B11D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVLayerVideoRectForPlayerLayerBoundsPresentationSizeAndVideoGravity(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  AVLayerScaledPresentationSizeForPlayerLayerBoundsPresentationSizeAndVideoGravity(a1, a2, a3, a4, a5, a6, a7);
}

double AVLayerScaledPresentationSizeForPlayerLayerBoundsPresentationSizeAndVideoGravity(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  CATransform3D v10;
  CGAffineTransform v11;
  CATransform3D v12;

  memset(&v12, 0, sizeof(v12));
  AVLayerTransformForPlacement(a1, 0, (uint64_t)&v12, a6, a7, a4, a5);
  v10 = v12;
  memset(&v11, 0, sizeof(v11));
  CATransform3DGetAffineTransform(&v11, &v10);
  return a7 * v11.c + v11.a * a6;
}

void sub_1933B18C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void chapterItem_handleFigChapterLoadingNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  void *v7;
  int v8;
  CFTypeID v9;
  const void *v10;
  const void *v11;
  const void *Value;
  const void *v13;
  const void *v14;
  const void *v15;
  CFTypeID v16;
  CFTypeID v18;
  CFTypeID v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CFTypeID v24;
  CFTypeID TypeID;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFNumber *v29;
  const __CFNumber *v30;
  CFTypeID v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t valuePtr;

  v7 = (void *)MEMORY[0x1940343FC]();
  v8 = FigCFEqual();
  if (!v8 && !FigCFEqual())
  {
    if (!FigCFEqual())
      goto LABEL_24;
    v27 = a2;
    v28 = 268435459;
    goto LABEL_23;
  }
  if (a5)
  {
    v9 = CFGetTypeID(a5);
    if (v9 == CFDictionaryGetTypeID())
    {
      v10 = (const void *)*MEMORY[0x1E0CC38F8];
      v11 = (const void *)*MEMORY[0x1E0CC38E0];
      Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC38F0]);
      v13 = CFDictionaryGetValue((CFDictionaryRef)a5, v10);
      v14 = CFDictionaryGetValue((CFDictionaryRef)a5, v11);
      if (Value)
      {
        v15 = v14;
        v16 = CFGetTypeID(Value);
        if (v16 == CFNumberGetTypeID() && v13 != 0)
        {
          v18 = CFGetTypeID(v13);
          if (v18 == CFNumberGetTypeID())
          {
            if (v15)
            {
              v19 = CFGetTypeID(v15);
              if (v19 == CFNumberGetTypeID())
              {
                v34 = 0;
                valuePtr = 0;
                v33 = 0;
                CFNumberGetValue((CFNumberRef)Value, kCFNumberLongType, &valuePtr);
                CFNumberGetValue((CFNumberRef)v13, kCFNumberLongType, &v34);
                CFNumberGetValue((CFNumberRef)v15, kCFNumberLongType, &v33);
                v20 = valuePtr;
                if (v20 == objc_msgSend(a2, "_chapterGroupIndex"))
                {
                  v21 = v34;
                  if (v21 == objc_msgSend(a2, "_chapterIndex") && v33 >= 1)
                  {
                    if (v8)
                    {
                      v22 = (void *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC38E8]);
                      if (v22)
                      {
                        v23 = v22;
                        v24 = CFGetTypeID(v22);
                        TypeID = CFArrayGetTypeID();
                        v26 = objc_msgSend(v23, "count");
                        if (v24 == TypeID)
                        {
                          if (v26)
                          {
                            objc_msgSend(a2, "_takeValueFrom:", objc_msgSend(v23, "objectAtIndex:", 0));
                            goto LABEL_24;
                          }
                        }
                      }
                      v27 = a2;
                      v28 = 0;
                    }
                    else
                    {
                      v29 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC3908]);
                      v32 = 0;
                      if (v29 && (v30 = v29, v31 = CFGetTypeID(v29), v31 == CFNumberGetTypeID()))
                      {
                        CFNumberGetValue(v30, kCFNumberSInt32Type, &v32);
                        v28 = v32;
                      }
                      else
                      {
                        v28 = 0;
                      }
                      v27 = a2;
                    }
LABEL_23:
                    objc_msgSend(v27, "_setValueStatus:figErrorCode:", 3, v28);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
  objc_autoreleasePoolPop(v7);
}

void sub_1933B1F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B20E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B2224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double getVideoPresentationBounds(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  CATransform3D v12;
  CGAffineTransform v13;
  CATransform3D v14;

  memset(&v14, 0, sizeof(v14));
  AVLayerTransformForPlacement(a1, 0, (uint64_t)&v14, a2, a3, a6, a7);
  v12 = v14;
  memset(&v13, 0, sizeof(v13));
  CATransform3DGetAffineTransform(&v13, &v12);
  return a4 + (a6 - (a3 * v13.c + v13.a * a2)) * 0.5;
}

void sub_1933B2554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B26F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B2BF0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void sub_1933B2C38()
{
  JUMPOUT(0x1933B2C28);
}

void sub_1933B2D10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1933B318C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void AVFigRouteDiscovererAvailableRoutesChanged(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_availableRoutesChanged");
  objc_autoreleasePoolPop(v3);
}

void sub_1933B37B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B38D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933B3988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B3A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B3F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B4350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1933B4594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __avplayer_fpNotificationCallback_block_invoke_14(uint64_t a1, double a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488);
  if (*(_BYTE *)(a1 + 60))
  {
    LODWORD(a2) = *(_DWORD *)(a1 + 56);
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488), "rateStateBySettingRate:nameForLogging:", *(_QWORD *)(a1 + 40), a2);
  }
  if (*(_BYTE *)(a1 + 61))
    v3 = (void *)(*(uint64_t (**)(_QWORD, void *, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176) != 0);
  if (*(_BYTE *)(a1 + 60) || *(_BYTE *)(a1 + 61))
  {
    if (dword_1ECDECF38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = v3;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488) = v3;
  }
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_13(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1[4] + 8) + 488);
  v3 = objc_msgSend(v2, "timeControlStatus");
  v4 = (void *)objc_msgSend(v2, "reasonForWaitingToPlay");
  v5 = (void *)(*(uint64_t (**)(_QWORD, void *, BOOL))(a1[5] + 16))(a1[5], v2, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 176) != 0);
  v6 = objc_msgSend(v5, "timeControlStatus");
  result = objc_msgSend(v5, "reasonForWaitingToPlay");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3 != v6;
  if (v4 == (void *)result)
  {
    v8 = 0;
  }
  else
  {
    result = objc_msgSend(v4, "isEqual:", result);
    v8 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v8;
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(a2, "rateStateByUpdatingBasedOnFigPlayerPlaybackState:hasCurrentInterstitialEvent:nameForLogging:", objc_msgSend(v4, "intValue"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(a2, "rateStateByUpdatingBasedOnFigPlayer:hasCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(_QWORD *)(a1 + 48), a3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t AVOutputDeviceVolumeControlTypeFromFigType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_19357D288[a1 - 1];
}

void avplayeritem_figassetNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  _QWORD v18[7];
  BOOL v19;
  char v20;
  char v21;

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a2, "_copyStateDispatchQueue");
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3678]))
    goto LABEL_13;
  CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CC3900]);
  v10 = FigCFEqual();
  if (v10)
  {
    objc_msgSend(a2, "_markAsReadyForInspectionOfDuration");
LABEL_4:
    v11 = 0;
    v12 = 0;
    goto LABEL_5;
  }
  if (FigCFEqual() && objc_msgSend((id)objc_msgSend(a2, "asset"), "_isStreaming"))
  {
    objc_msgSend(a2, "_markAsReadyForInspectionOfTracks");
    v12 = 0;
    v11 = 1;
  }
  else
  {
    if (!FigCFEqual())
      goto LABEL_4;
    objc_msgSend(a2, "_markFigAssetAsReadyForInspectionOfMediaSelectionOptions");
    v11 = 0;
    v12 = 1;
  }
LABEL_5:
  if (v10)
    v13 = 1;
  else
    v13 = v11;
  if ((v13 | v12) != 1 || v9 == 0)
  {
LABEL_13:
    if (!v9)
      goto LABEL_25;
    goto LABEL_24;
  }
  v15 = objc_msgSend(a2, "_player");
  v16 = (const void *)v15;
  if (v11)
  {
    v17 = objc_msgSend(a2, "_tracks");
    if (!v16)
      goto LABEL_23;
    goto LABEL_22;
  }
  v17 = 0;
  if (v15)
LABEL_22:
    CFRetain(v16);
LABEL_23:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __avplayeritem_figassetNotificationCallback_block_invoke;
  v18[3] = &unk_1E30321B0;
  v19 = v10 != 0;
  v20 = v11;
  v18[4] = a2;
  v18[5] = v17;
  v21 = v12;
  v18[6] = v16;
  dispatch_async(v9, v18);
LABEL_24:
  dispatch_release(v9);
LABEL_25:
  objc_autoreleasePoolPop(v8);
}

void avplayeritem_fpItemNotificationCallback(uint64_t a1, void *a2, const void *a3, const void *a4, const void *a5)
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[10];

  v9 = (void *)MEMORY[0x1940343FC]();
  v10 = objc_msgSend(a2, "_player");
  if (a3)
    CFRetain(a3);
  if (a5)
    CFRetain(a5);
  if (a4)
    CFRetain(a4);
  v11 = objc_msgSend(a2, "_copyStateDispatchQueue");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __avplayeritem_fpItemNotificationCallback_block_invoke;
  v12[3] = &unk_1E3032188;
  v12[4] = a2;
  v12[5] = v10;
  v12[6] = v11;
  v12[7] = a3;
  v12[8] = a5;
  v12[9] = a4;
  dispatch_async(v11, v12);
  dispatch_release(v11);
  objc_autoreleasePoolPop(v9);
}

void sub_1933B5870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVStringForOSType(unsigned int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[5];
  unsigned int v6;

  v1 = bswap32(a1);
  v2 = 3;
  if (HIBYTE(a1))
    v2 = 4;
  v3 = v2 - (a1 < 0x10000) - (a1 < 0x100) - (a1 == 0);
  v6 = v1;
  __strncpy_chk();
  v5[v3] = 0;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, 30);
}

uint64_t AVOutputDeviceGetDeviceTypeAndSubTypeFromRouteDescriptor(const __CFDictionary *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0D487B0]);
  CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0D488B8]);
  CFDictionaryGetValue(a1, CFSTR("IsContinuityScreenOutput"));
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v7 = 0;
    v8 = 18;
    goto LABEL_17;
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v8 = 1;
    v7 = 14;
    goto LABEL_17;
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v7 = 1;
    v8 = 1;
    goto LABEL_17;
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v8 = 3;
LABEL_9:
    v7 = 1;
    goto LABEL_17;
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v8 = 4;
LABEL_12:
    v7 = 2;
    goto LABEL_17;
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v8 = 4;
    v7 = 3;
  }
  else
  {
    result = FigCFEqual();
    if ((_DWORD)result)
    {
      v8 = 3;
      v7 = 4;
    }
    else
    {
      result = FigCFEqual();
      if ((_DWORD)result)
      {
        v8 = 1;
        goto LABEL_12;
      }
      result = FigCFEqual();
      if ((_DWORD)result || (result = FigCFEqual(), (_DWORD)result))
      {
        v8 = 4;
        v7 = 5;
      }
      else
      {
        result = FigCFEqual();
        if ((_DWORD)result)
        {
          v8 = 4;
          v7 = 6;
        }
        else
        {
          result = FigCFEqual();
          if ((_DWORD)result)
          {
            v8 = 4;
            v7 = 7;
          }
          else if (FigCFEqual())
          {
            CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0D48830]);
            result = FigCFEqual();
            if ((_DWORD)result || (result = FigCFEqual(), (_DWORD)result))
            {
              v8 = 0;
              goto LABEL_9;
            }
            result = FigCFEqual();
            if ((_DWORD)result)
            {
              v8 = 0;
              v7 = 11;
            }
            else
            {
              result = FigCFEqual();
              if ((_DWORD)result)
              {
                v8 = 0;
                v7 = 16;
              }
              else
              {
                result = FigCFEqual();
                if ((_DWORD)result)
                {
                  v8 = 0;
                  v7 = 17;
                }
                else
                {
                  result = FigCFEqual();
                  if ((_DWORD)result)
                  {
                    v8 = 0;
                    v7 = 13;
                  }
                  else
                  {
                    result = FigCFEqual();
                    if ((_DWORD)result)
                    {
                      v8 = 0;
                      v7 = 12;
                    }
                    else
                    {
                      result = FigCFEqual();
                      if ((_DWORD)result)
                      {
                        v8 = 0;
                        v7 = 18;
                      }
                      else
                      {
                        result = FigCFEqual();
                        if ((_DWORD)result)
                        {
                          v8 = 0;
                          v7 = 19;
                        }
                        else
                        {
                          result = FigCFEqual();
                          if ((_DWORD)result)
                          {
                            v8 = 0;
                            v7 = 20;
                          }
                          else
                          {
                            result = FigCFEqual();
                            if ((_DWORD)result || (result = FigCFEqual(), (_DWORD)result))
                            {
                              v8 = 0;
                              v7 = 15;
                            }
                            else
                            {
                              result = FigCFEqual();
                              v8 = 0;
                              v7 = 15;
                              if (!(_DWORD)result)
                                v7 = 0;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          else
          {
            result = FigCFEqual();
            if ((_DWORD)result)
            {
              v8 = 4;
              v7 = 8;
            }
            else
            {
              result = FigCFEqual();
              if ((_DWORD)result)
              {
                v8 = 1;
                v7 = 9;
              }
              else
              {
                result = FigCFEqual();
                if ((_DWORD)result)
                {
                  v8 = 4;
                  v7 = 10;
                }
                else
                {
                  result = FigCFEqual();
                  if ((_DWORD)result)
                  {
                    v7 = 0;
                    v8 = 2;
                  }
                  else
                  {
                    result = FigCFEqual();
                    v8 = (_DWORD)result != 0;
                    v7 = 3;
                    if (!(_DWORD)result)
                      v7 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_17:
  if (a2)
    *a2 = v8;
  if (a3)
    *a3 = v7;
  return result;
}

void sub_1933B63C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void avplayer_fpNotificationCallback(uint64_t a1, _QWORD *a2, const void *a3, uint64_t a4, const void *a5)
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[8];

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a2, "_nameForLogging");
  if (a3)
    CFRetain(a3);
  if (a5)
    CFRetain(a5);
  v10 = *(NSObject **)(a2[1] + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __avplayer_fpNotificationCallback_block_invoke;
  v11[3] = &unk_1E3031B58;
  v11[6] = a3;
  v11[7] = a5;
  v11[4] = a2;
  v11[5] = v9;
  dispatch_async(v10, v11);
  objc_autoreleasePoolPop(v8);
}

void sub_1933B689C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B6948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B6BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B7054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t avplayer_interstitial_WrapperToPlayer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(*(_QWORD *)(a3 + 8) + 728);
}

void sub_1933B7A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B7D98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1933B83B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B89E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 248), 8);
  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Block_object_dispose((const void *)(v40 - 152), 8);
  _Block_object_dispose((const void *)(v40 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1933B8B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B8C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B8CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B8EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B8F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B9000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B90AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B9338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933B9650(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t AVRequireConcreteObject(void *a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  id v7;
  void *v8;
  uint64_t v9;
  NSString *v10;
  objc_class *v11;

  result = objc_opt_class();
  if (result == a3)
  {
    v7 = a1;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = NSStringFromSelector(a2);
    v11 = (objc_class *)objc_opt_class();
    return objc_msgSend(v8, "raise:format:", v9, CFSTR("*** initialization method -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!"), v10, NSStringFromClass(v11));
  }
  return result;
}

void sub_1933B9B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVPlayerGetFigPlayerTypeForAsset(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[7];

  v4 = objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("streaming"), 0);
  v5 = v4;
  if (a1 && v4 < 2)
  {
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("streaming"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __AVPlayerGetFigPlayerTypeForAsset_block_invoke;
    v9[3] = &unk_1E3031AB8;
    v9[5] = a2;
    v9[6] = v5;
    v9[4] = a1;
    return objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v9);
  }
  else
  {
    if (v4 <= 1)
      v5 = objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("streaming"), 0);
    if (v5 == 2)
      v8 = objc_msgSend(a1, "_isStreaming");
    else
      v8 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v8);
  }
}

void __avplayeritem_figassetNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const void *v4;
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1940343FC]();
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    v5 = *MEMORY[0x1E0CA2E18];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v3, "_informObserversAboutAvailabilityOfDuration:", &v5);
  }
  if (*(_BYTE *)(a1 + 57))
    objc_msgSend(*(id *)(a1 + 32), "_informObserversAboutAvailabilityOfTracks:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 58))
    objc_msgSend(*(id *)(a1 + 32), "_informObserversAboutAvailabilityOfCurrentMediaSelection");
  objc_autoreleasePoolPop(v2);
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
}

void sub_1933BA79C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_1933BAAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_1933BABB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933BAC9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t AVOutputDeviceIsConversationDetectionFeatureEnabled()
{
  return _os_feature_enabled_impl();
}

void sub_1933BB0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_9(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 962) = 1;
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__19(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__20(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__28(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__31(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__32(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__33(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__34(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__35(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__36(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__37(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__41(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__43(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__44(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__36(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__40(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__45(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void *AVOutputDeviceDescriptionsFromFigDescriptions(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  AVClusterComponentOutputDeviceDescription *v17;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return 0;
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v23 = *(_QWORD *)v25;
    v21 = *MEMORY[0x1E0CA3870];
    v22 = *MEMORY[0x1E0CA3878];
    v5 = *MEMORY[0x1E0CA3880];
    v6 = *MEMORY[0x1E0CA3850];
    v7 = *MEMORY[0x1E0CA3858];
    obj = a1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "objectForKeyedSubscript:", v22);
        v11 = objc_msgSend(v9, "objectForKeyedSubscript:", v21);
        v12 = objc_msgSend(v9, "objectForKeyedSubscript:", v5);
        v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v6), "BOOLValue");
        v14 = AVOutputDeviceSubTypeFromFigSubType(v12);
        v15 = objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        if (v10)
          v16 = v11 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          v17 = -[AVClusterComponentOutputDeviceDescription initWithDeviceID:deviceName:deviceSubType:isClusterLeader:modelID:]([AVClusterComponentOutputDeviceDescription alloc], "initWithDeviceID:deviceName:deviceSubType:isClusterLeader:modelID:", v10, v11, v14, v13, v15);
          objc_msgSend(v19, "addObject:", v17);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }
  return v19;
}

BOOL addObjectToArray(void *a1, uint64_t a2)
{
  int v4;

  v4 = objc_msgSend(a1, "count");
  if (a2 && (objc_msgSend(a1, "containsObject:", a2) & 1) == 0)
    objc_msgSend(a1, "addObject:", a2);
  return v4 != objc_msgSend(a1, "count");
}

void handleFigAssetLoadingNotification(uint64_t a1, void *a2, const void *a3, uint64_t a4, uint64_t *a5)
{
  void *v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeID v11;
  const void *Value;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  const void *v23;
  os_log_type_t type;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a2, "_loadingMutex");
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3648]))
  {
LABEL_7:
    a5 = 0;
    goto LABEL_8;
  }
  if (dword_1ECDECF18)
  {
    v25 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    v11 = CFGetTypeID(a5);
    if (v11 == CFDictionaryGetTypeID())
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC38D0]);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __handleFigAssetLoadingNotification_block_invoke;
      v22 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v23 = Value;
      a5 = &v19;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:
  MEMORY[0x194033BF8](v9);
  v13 = (void *)objc_msgSend(a2, "_loadingBatches");
  v14 = v13;
  if (a5)
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", a5);
  v15 = objc_msgSend(v14, "indexesOfObjectsPassingTest:", &__block_literal_global_426, v17, v18, v19, v20, v21, v22, v23);
  v16 = objc_msgSend(v14, "objectsAtIndexes:", v15);
  objc_msgSend(v14, "removeObjectsAtIndexes:", v15);
  MEMORY[0x194033C04](v9);
  objc_msgSend(a2, "_invokeCompletionHandlerForLoadingBatches:", v16);
  objc_autoreleasePoolPop(v8);
}

dispatch_queue_t av_readwrite_dispatch_queue_create(const char *a1)
{
  NSObject *v2;

  v2 = dispatch_queue_attr_make_with_overcommit();
  return dispatch_queue_create(a1, v2);
}

void sub_1933BDF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_1933BE0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933BE964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVOutputContextUsesRouteConfigUpdatedNotification()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UseRouteConfigUpdatedNotification"), CFSTR("com.apple.avfoundation"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 0;
  return !v1;
}

uint64_t AVDefaultRoutingContextFactory()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UseFigRoutingContextResilientRemote"), CFSTR("com.apple.avfoundation"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 0;
  if (v1)
    return FigRemoteRoutingContextFactoryGetCurrent();
  else
    return FigResilientRemoteRoutingContextFactoryGetCurrent();
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 965) = result;
  return result;
}

void sub_1933BFD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C06B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (AVFCaptureLibrary_sOnce != -1)
    dispatch_once(&AVFCaptureLibrary_sOnce, &__block_literal_global_366);
  softLinkAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription = (uint64_t (*)())dlsym((void *)AVFCaptureLibrary_sLib, "AVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription)(a1, a2, a3);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 965) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 967) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 966) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 964) = result;
  return result;
}

uint64_t __handleFigAssetLoadingNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKey:", CFSTR("AVAsynchronousLoadingPropertyBatchIDKey"));
  if (FigCFEqual())
  {
    if (dword_1ECDECF18)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a2, "removeObjectForKey:", CFSTR("AVAsynchronousLoadingPropertyBatchIDKey"), v9, v10);
    *a4 = 1;
  }
  objc_msgSend(a2, "objectForKey:", CFSTR("AVAsynchronousLoadingTrackPropertyBatchIDKey"));
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    if (dword_1ECDECF18)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    result = objc_msgSend(a2, "removeObjectForKey:", CFSTR("AVAsynchronousLoadingTrackPropertyBatchIDKey"), v9, v10);
    *a4 = 1;
  }
  return result;
}

void sub_1933C0F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVLanguageCodeFromExtendedLanguageTag(void *a1)
{
  return objc_msgSend((id)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-")), "firstObject");
}

uint64_t AVExtendedLanguageTagFromLocale(void *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "localeIdentifier");
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C997E8]), "isEqualToString:", CFSTR("root")))v2 = (void *)objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("root"), CFSTR("und"));
  return objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
}

__CFString *AVOutputDeviceHeadTrackedSpatialAudioModeFromFigMode(const __CFNumber *a1)
{
  __CFString *v1;
  __CFString **v2;
  int valuePtr;

  v1 = AVOutputDeviceHeadTrackedSpatialAudioModeNever;
  if (a1)
  {
    valuePtr = 0;
    if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr))
    {
      switch(valuePtr)
      {
        case 0:
          return AVOutputDeviceHeadTrackedSpatialAudioModeNever;
        case 1:
          v2 = &AVOutputDeviceHeadTrackedSpatialAudioModeAutomatic;
          goto LABEL_8;
        case 2:
          v2 = &AVOutputDeviceHeadTrackedSpatialAudioModeAlways;
          goto LABEL_8;
        case 3:
          v2 = &AVOutputDeviceHeadTrackedSpatialAudioModeMultichannelOnly;
LABEL_8:
          v1 = *v2;
          break;
        default:
          return v1;
      }
    }
  }
  return v1;
}

void handleAndReflectFigAssetNotification(uint64_t a1, void *a2, const void *a3)
{
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3688]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3690]))
  {
    if (dword_1ECDECF18)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = objc_msgSend(a2, "_loadingMutex", v10, v11);
    MEMORY[0x194033BF8]();
    v8 = (void *)objc_msgSend(a2, "_loadingBatches");
    v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
    objc_msgSend(v8, "removeAllObjects");
    MEMORY[0x194033C04](v7);
    objc_msgSend(a2, "_invokeCompletionHandlerForLoadingBatches:", v9);
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  objc_autoreleasePoolPop(v5);
}

const __CFString *AVOutputDeviceAVFListeningModeForFigListeningMode(int a1)
{
  const __CFString *result;
  __CFString **v4;

  result = 0;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      v4 = AVOutputDeviceBluetoothListeningModeNormal;
      goto LABEL_8;
    case 2:
      v4 = AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation;
      goto LABEL_8;
    case 3:
      v4 = AVOutputDeviceBluetoothListeningModeAudioTransparency;
LABEL_8:
      result = *v4;
      break;
    default:
      if (((a1 == 4) & _os_feature_enabled_impl()) != 0)
        result = CFSTR("AVOutputDeviceBluetoothListeningModeAutomatic");
      else
        result = 0;
      break;
  }
  return result;
}

void sub_1933C5C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C5F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C6004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C694C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

AVSerializedMostlySynchronousReentrantBlockScheduler *AVMakeBlockSchedulerThatSerializesBlocksPrefersSynchronousExecutionAndAllowsReentrantExecution()
{
  return objc_alloc_init(AVSerializedMostlySynchronousReentrantBlockScheduler);
}

void sub_1933C72EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double __getDisplayScale_block_invoke()
{
  void *v0;
  double result;
  float v2;
  id v3;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "floatValue");
    *(double *)&sMaxDisplayScale = v2;

  }
  return result;
}

CFDictionaryRef NSDictionaryFromCMTime(CMTime *a1)
{
  const __CFAllocator *v1;
  CMTime v3;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = *a1;
  return CMTimeCopyAsDictionary(&v3, v1);
}

void sub_1933C7AB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1933C7D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C813C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C8204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C82B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C8378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_22(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 968) = 1;
  return result;
}

void sub_1933C8670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C8884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C9140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933C942C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933C9A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVAssetUTIsAreComplementary(void *a1, void *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v4 = a2 != 0;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a2);
        if ((objc_msgSend(a1, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
          return 0;
      }
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  return v4;
}

void sub_1933CBA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVVideoOutputSettingsValidPixelBufferAttributesKeys()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CA9040], *MEMORY[0x1E0CA9008], *MEMORY[0x1E0CA90E0], *MEMORY[0x1E0CA8FD8], *MEMORY[0x1E0CA8FB0], *MEMORY[0x1E0CA8FC0], *MEMORY[0x1E0CA8FB8], *MEMORY[0x1E0CA8FA0], *MEMORY[0x1E0CA8F68], *MEMORY[0x1E0CA8F70], *MEMORY[0x1E0CA8F78], *MEMORY[0x1E0CA9020], *MEMORY[0x1E0CA9048], *MEMORY[0x1E0CA8FF0], *MEMORY[0x1E0CA9028], *MEMORY[0x1E0CA9010], *MEMORY[0x1E0CA90C8],
           *MEMORY[0x1E0CA8F88],
           *MEMORY[0x1E0CA9038],
           *MEMORY[0x1E0CA8F98],
           *MEMORY[0x1E0CA8F80],
           *MEMORY[0x1E0CA9078],
           0);
}

uint64_t figCustomURLHandlerHandleAuthenticationChallenge(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, _QWORD, uint64_t), uint64_t a6)
{
  uint64_t v8;
  unsigned __int8 v10;

  v10 = 0;
  v8 = objc_msgSend(a1, "_handleAuthChallenge:requestID:canHandleRequestOut:", a3, a4, &v10);
  return a5(a6, v10, v8);
}

BOOL AVOutputDeviceImplIsMutedForEndpointID(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t, uint64_t, char *);
  char v6;

  v6 = 0;
  v4 = *(void (**)(uint64_t, uint64_t, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 160);
  if (!v4)
    return 0;
  v4(a1, a2, &v6);
  return v6 != 0;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_15(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 960) = 0;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_3(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 944) = result;
  return result;
}

void sub_1933CCB44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933CCD54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1933CCE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933CCEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933CD06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVFigRouteDiscovererFactoryCreateRouteDiscovererWithType(void *a1, int a2)
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  uint64_t v5;
  CFTypeRef cf;
  int valuePtr;

  valuePtr = a2;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  v4 = CFDictionaryCreate(v3, MEMORY[0x1E0D48B58], &cf, 1, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v5 = objc_msgSend(a1, "createRouteDiscovererWithAllocator:options:", v3, v4);
  if (v4)
    CFRelease(v4);
  if (cf)
    CFRelease(cf);
  return v5;
}

AVFigRemoteRouteDiscovererFactory *AVFigRouteDiscovererFactoryGetCurrent()
{
  AVFigRemoteRouteDiscovererFactory *v0;
  AVFigRemoteRouteDiscovererFactory *result;

  v0 = objc_alloc_init(AVFigRemoteRouteDiscovererFactory);
  result = (AVFigRemoteRouteDiscovererFactory *)dispatch_get_specific(CFSTR("AVCurrentRouteDiscovererFactoryKey"));
  if (!result)
    return v0;
  return result;
}

id __ensureDictionariesOfFigPropertiesForKeys_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;

  v0 = *MEMORY[0x1E0CC3A80];
  v1 = *MEMORY[0x1E0CC39F8];
  v2 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3928], *MEMORY[0x1E0CC3A80], *MEMORY[0x1E0CC3A08], *MEMORY[0x1E0CC3A78], *MEMORY[0x1E0CC3AB0], *MEMORY[0x1E0CC39F8], *MEMORY[0x1E0CC39E8], *MEMORY[0x1E0CC3910], *MEMORY[0x1E0CC39D0], 0);
  v3 = *MEMORY[0x1E0CC3920];
  v4 = *MEMORY[0x1E0CC3AA8];
  v5 = *MEMORY[0x1E0CC3AA0];
  v6 = *MEMORY[0x1E0CC3918];
  sFigAssetMediaSelectionProperties = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3920], *MEMORY[0x1E0CC3AA8], *MEMORY[0x1E0CC5F78], *MEMORY[0x1E0CC3AA0], *MEMORY[0x1E0CC3918], CFSTR("LocalizedMSODisplayNames"), 0);
  v49 = *MEMORY[0x1E0CC6028];
  sFigAssetTrackMediaSelectionProperties = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FE8], *MEMORY[0x1E0CC5FF0], *MEMORY[0x1E0CC6008], *MEMORY[0x1E0CC5FE0], *MEMORY[0x1E0CC5FF8], *MEMORY[0x1E0CC3C70], *MEMORY[0x1E0CC5FB8], *MEMORY[0x1E0CC5FC0], *MEMORY[0x1E0CC3C68], *MEMORY[0x1E0CC3C30], *MEMORY[0x1E0CC3C60], *MEMORY[0x1E0CC6028], *MEMORY[0x1E0CC3C48], 0);
  if (AVUseBackwardCompatibleID3MetadataReader())
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v2);
    objc_msgSend(v7, "removeObject:", v1);
    v46 = v7;
    objc_msgSend(v7, "addObject:", *MEMORY[0x1E0CC3A00]);
  }
  else
  {
    v46 = (void *)v2;
  }
  v48 = (void *)MEMORY[0x1E0C99D80];
  v47 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F60], 0);
  v45 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC39E0], 0);
  v44 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("playbackCapabilities"));
  v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC39F0], 0);
  v43 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F90], 0);
  v42 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FA0], 0);
  v41 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FA8], 0);
  v40 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F98], 0);
  v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
  v38 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A70], 0);
  v37 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v36 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v35 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F58], 0);
  v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F70], 0);
  v33 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3950], 0);
  v32 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v1, 0);
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3948], *MEMORY[0x1E0CC5F50], 0);
  v30 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"));
  v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"));
  v28 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"));
  v8 = *MEMORY[0x1E0CC3A68];
  v27 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A68], 0);
  v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A60], 0);
  v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, *MEMORY[0x1E0CC3A40], 0);
  v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, v8, v0, 0);
  v23 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, v8, v0, 0);
  v22 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, v8, v0, 0);
  v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3940], 0);
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3958], 0);
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3998], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, 0);
  v9 = *MEMORY[0x1E0CC3A28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A28], 0);
  v10 = *MEMORY[0x1E0CC3A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A30], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, v10, v9, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A18], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A88], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC39B8], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A90], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v11 = *MEMORY[0x1E0CC39C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC39C8], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v11, 0);
  v12 = *MEMORY[0x1E0CC3980];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3980], 0);
  v13 = *MEMORY[0x1E0CC3968];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3968], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v12, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v13, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC39C0], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC39D8], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A48], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3AB8], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A50], v9, v10, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F68], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F48], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3A38], 0);
  v14 = *MEMORY[0x1E0CC3930];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3930], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v14, *MEMORY[0x1E0CC3A58], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5F80], 0);
  sFigAssetPropertiesForKeys = (uint64_t)objc_retain((id)objc_msgSend(v48, "dictionaryWithObjectsAndKeys:", v47, CFSTR("duration"), v45, CFSTR("variants"), v44, CFSTR("playbackCapabilities"), v29, CFSTR("contentKeySpecifiersEligibleForPreloading"), v43, CFSTR("preferredRate"), v42, CFSTR("preferredVolume"), v41, CFSTR("preferredSoundCheckVolumeNormalization"), v40, CFSTR("preferredTransform"), v39,
                                                          CFSTR("naturalSize"),
                                                          v38,
                                                          CFSTR("providesPreciseDurationAndTiming"),
                                                          v37,
                                                          CFSTR("referenceRestrictions"),
                                                          v36,
                                                          CFSTR("tracks"),
                                                          v35,
                                                          CFSTR("creationDate"),
                                                          v34,
                                                          CFSTR("lyrics"),
                                                          v33,
                                                          CFSTR("commonMetadata"),
                                                          v46,
                                                          CFSTR("availableMetadataFormats"),
                                                          v46,
                                                          CFSTR("metadata"),
                                                          v32,
                                                          CFSTR("ID3Metadata"),
                                                          v31,
                                                          CFSTR("availableChapterLocales"),
                                                          v30,
                                                          CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"),
                                                          v18,
                                                          CFSTR("preferredMediaSelection"),
                                                          v28,
                                                          CFSTR("allMediaSelections"),
                                                          v27,
                                                          CFSTR("hasProtectedContent"),
                                                          v26,
                                                          CFSTR("originalNetworkContentURL"),
                                                          v25,
                                                          CFSTR("playable"),
                                                          v24,
                                                          CFSTR("exportable"),
                                                          v23,
                                                          CFSTR("readable"),
                                                          v22,
                                                          CFSTR("composable"),
                                                          v21,
                                                          CFSTR("compatibleWithSavedPhotosAlbum"),
                                                          v20,
                                                          CFSTR("compatibleWithAirPlayVideo"),
                                                          v19));
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v49, 0);
  result = (id)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, CFSTR("tracks"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6048], 0), CFSTR("naturalSize"), 0);
  sFigAssetTrackPropertiesForKeys = (uint64_t)result;
  return result;
}

void *AVOutputDeviceSupportedListeningModesForFigListeningModes(char a1)
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("AVOutputDeviceBluetoothListeningModeNormal"));
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation"));
  if ((a1 & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("AVOutputDeviceBluetoothListeningModeAudioTransparency"));
  v4 = _os_feature_enabled_impl();
  if ((a1 & 4) != 0 && v4)
    objc_msgSend(v3, "addObject:", CFSTR("AVOutputDeviceBluetoothListeningModeAutomatic"));
  return v3;
}

uint64_t AVUseBackwardCompatibleID3MetadataReader()
{
  return dyld_program_sdk_at_least() ^ 1;
}

uint64_t AVCreateRouteDiscovererWithType(int a1)
{
  AVFigRemoteRouteDiscovererFactory *Current;

  Current = AVFigRouteDiscovererFactoryGetCurrent();
  return AVFigRouteDiscovererFactoryCreateRouteDiscovererWithType(Current, a1);
}

void sub_1933D0960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D0E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1933D103C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1933D11B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AVTwoPartKeyPath *AVTwoPartKeyPathMake(uint64_t a1, uint64_t a2)
{
  return -[AVTwoPartKeyPath initWithTopLevelPropertyKey:secondLevelPropertyKey:]([AVTwoPartKeyPath alloc], "initWithTopLevelPropertyKey:secondLevelPropertyKey:", a1, a2);
}

_QWORD *avurlasset_setupGuts(_QWORD *a1, void *a2, void *a3, id a4, uint64_t a5)
{
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  AVURLAssetInternal *v13;
  AVURLAssetInternal *v14;
  uint64_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  char v19;
  void *v21;
  char v22;
  uint64_t v23;
  AVUnreachableAssetInspectorLoader *v24;
  id v25;
  AVUnreachableAssetInspectorLoader *v26;
  AVUnreachableAssetInspectorLoader *v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  CFTypeRef cf;

  v41 = a5;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v10 = objc_msgSend(a3, "valueForKey:", CFSTR("AVURLAssetInspectorLoaderKey"));
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetDownloadTokenKey"));
  v12 = (void *)v11;
  if (!a2 && !v11 && !v10)
    goto LABEL_14;
  v13 = objc_alloc_init(AVURLAssetInternal);
  if (!v13)
    goto LABEL_14;
  v14 = v13;
  v15 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetLoggingIdentifier"));
  if (v15)
    objc_msgSend(a1, "_setLoggingIdentifier:", v15);
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetHasSecurityScopedURLKey")), "BOOLValue"))v14->requiresSecurityScopeRelease = objc_msgSend(a2, "startAccessingSecurityScopedResource");
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = dispatch_queue_create("com.apple.avurlasset.tracks", v16);
  v14->tracksAccessQueue = (OS_dispatch_queue *)v17;
  if (v17)
  {
    a1[2] = CFRetain(v14);
    v14->URLRequestHelper = -[AVAssetClientURLRequestHelper initWithAsset:]([AVAssetClientURLRequestHelper alloc], "initWithAsset:", a1);
    v14->makeOneResourceLoaderOnly = objc_alloc_init(AVDispatchOnce);
    v14->makeOneAssetDownloadCacheOnly = objc_alloc_init(AVDispatchOnce);
    v18 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("AVURLAssetAllowsExpensiveNetworkAccessKey"));
    if (v18)
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = 1;
    v14->allowsExpensiveNetworkAccess = v19;
    v21 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("AVURLAssetAllowsConstrainedNetworkAccessKey"));
    if (v21)
      v22 = objc_msgSend(v21, "BOOLValue");
    else
      v22 = 1;
    v14->allowsConstrainedNetworkAccess = v22;
    if (v12)
    {
      objc_msgSend(v12, "unsignedLongLongValue");
      cf = 0;
      if (+[AVAsset _assetCreationOptionsRequiresInProcessOperation:](AVAsset, "_assetCreationOptionsRequiresInProcessOperation:", a3))
      {
        v23 = FigAssetCopyAssetWithDownloadToken();
      }
      else
      {
        v23 = FigAssetRemoteCopyAssetWithDownloadToken();
      }
      v24 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", v23, 0);
      objc_msgSend(a1, "_setAssetInspectorLoader:", v24);

      v14->URL = (NSURL *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_assetInspectorLoader"), "URL"), "copy");
      if (cf)
        CFRelease(cf);
    }
    else if (v10)
    {
      objc_msgSend(a1, "_setAssetInspectorLoader:", v10);
      v14->URL = (NSURL *)objc_msgSend(a2, "copy");
    }
    else
    {
      cf = 0;
      if (!a4)
      {
        a4 = +[AVURLAsset _getFigAssetCreationOptionsFromURLAssetInitializationOptions:assetLoggingIdentifier:figAssetCreationFlags:error:](AVURLAsset, "_getFigAssetCreationOptionsFromURLAssetInitializationOptions:assetLoggingIdentifier:figAssetCreationFlags:error:", a3, objc_msgSend(a1, "_nameForLogging"), &v41, &cf);
        if (!a4)
        {
          if (objc_msgSend((id)cf, "code") == -11999)
          {
            if (*v9 == 1)
              kdebug_trace();
            v29 = a1;
            v30 = (void *)objc_msgSend((id)objc_msgSend((id)cf, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
            v31 = objc_msgSend(v30, "reason");
            v32 = (void *)MEMORY[0x1E0C99DA0];
            v38 = objc_msgSend(v30, "name");
            if (v31)
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v31);
            v39 = (void *)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v38, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, sel_initWithURL_options_, (uint64_t)CFSTR("Cannot honor specified AVURLAsset initialization options for AVURLAsset <%p>%@"), v33, v34, v35, v36, v37, (uint64_t)a1), 0);
            objc_exception_throw(v39);
          }
          a4 = 0;
        }
      }
      v40 = 0;
      v25 = objc_alloc((Class)objc_msgSend(a1, "_classForFigAssetInspectorLoader"));
      v26 = (AVUnreachableAssetInspectorLoader *)objc_msgSend(v25, "initWithURL:figAssetCreationFlags:figAssetCreationOptions:avAssetInitializationOptions:forAsset:figErr:", a2, v41, a4, a3, a1, &v40);
      if (!v26)
      {
        v27 = [AVUnreachableAssetInspectorLoader alloc];
        v26 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:](v27, "initWithFigError:userInfo:", v40, 0);
      }
      v14->customURLBridgeForNSURLProtocol = -[AVAssetCustomURLBridgeForNSURLProtocol initWithFigAsset:]([AVAssetCustomURLBridgeForNSURLProtocol alloc], "initWithFigAsset:", -[AVAssetInspectorLoader _figAsset](v26, "_figAsset"));
      v14->customURLAuthenticationUsingKeychain = -[AVAssetCustomURLAuthentication initWithFigAsset:]([AVAssetCustomURLAuthentication alloc], "initWithFigAsset:", -[AVAssetInspectorLoader _figAsset](v26, "_figAsset"));
      v14->URL = (NSURL *)objc_msgSend(a2, "copy");
      v14->initializationOptions = (NSDictionary *)objc_msgSend(a3, "copy");
      objc_msgSend(a1, "_setAssetInspectorLoader:", v26);

    }
    v28 = objc_msgSend(a3, "objectForKey:", CFSTR("AVURLAssetRemoteCustomURLHandlerContextKey"));
    if (v28)
      objc_msgSend(a1, "_resourceLoaderWithRemoteHandlerContext:", v28);
    if (*v9 == 1)
    {
      strncpy((char *)&cf, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "loggingIdentifier"), "description"), "UTF8String"), 8uLL);
      kdebug_trace();
    }
  }
  else
  {
LABEL_14:
    if (*v9 == 1)
      kdebug_trace();

    return 0;
  }
  return a1;
}

void sub_1933D299C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_1933D2C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1933D2DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1933D2ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1933D3188(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1933D3864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_30(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 966) = 1;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1000) = result;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_2(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 460);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

void sub_1933D48E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D5798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D5870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D5960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D5ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D6584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D6A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D6CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D6E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D6ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D6F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D70EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D72F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D73AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D747C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D754C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D761C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D76D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D777C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D79E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D7F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D80D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D82D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1933D8E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933D8F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figLoaderNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSString *const *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3668]))
  {
    v9 = (void *)MEMORY[0x1E0CB37C0];
    v10 = CFSTR("AVURLAssetDownloadCompleteSuccessNotification");
LABEL_3:
    v11 = a2;
    v12 = 0;
LABEL_17:
    v16 = objc_msgSend(v9, "notificationWithName:object:userInfo:", v10, v11, v12);
    v17 = (void *)MEMORY[0x1E0CB37D0];
LABEL_18:
    objc_msgSend((id)objc_msgSend(v17, "defaultCenter"), "postNotification:", v16);
    goto LABEL_19;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3660]))
  {
    v13 = objc_msgSend(a2, "_errorForFigNotificationPayload:key:", a5, *MEMORY[0x1E0CC3908]);
    v14 = (void *)MEMORY[0x1E0CB37C0];
    if (v13)
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("AVURLAssetDownloadCompleteNotificationErrorKey"));
    else
      v12 = 0;
    v10 = CFSTR("AVURLAssetDownloadCompleteFailedNotification");
LABEL_16:
    v9 = v14;
    v11 = a2;
    goto LABEL_17;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3688]))
  {
    v15 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0);
    v14 = (void *)MEMORY[0x1E0CB37C0];
    if (v15)
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, CFSTR("AVAssetMediaServicesWereResetErrorKey"));
    else
      v12 = 0;
    v10 = CFSTR("AVAssetMediaServicesWereResetNotification");
    goto LABEL_16;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3690]))
  {
    AVMediaStatePurgePostMediaStateWasPurgedNotificationForObject(a2, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3BF0]));
    goto LABEL_19;
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3680]))
    goto LABEL_19;
  v18 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3900]);
  if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CC5F60]))
  {
    if (objc_msgSend((id)objc_opt_class(), "expectsPropertyRevisedNotifications"))
    {
      v19 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVAssetDurationDidChangeNotification"), a2, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v19);
      if (objc_msgSend(a2, "_needsLegacyChangeNotifications"))
      {
        v20 = (void *)MEMORY[0x1E0CB37C0];
        v21 = &AVFragmentedMovieDurationDidChangeNotification;
LABEL_25:
        v16 = objc_msgSend(v20, "notificationWithName:object:userInfo:", *v21, a2, 0);
        v17 = (void *)MEMORY[0x1E0CB37D0];
        goto LABEL_18;
      }
    }
  }
  else
  {
    if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CC3948]) & 1) != 0
      || objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CC5F50]))
    {
      v9 = (void *)MEMORY[0x1E0CB37C0];
      v10 = CFSTR("AVAssetChapterMetadataGroupsDidChangeNotification");
      goto LABEL_3;
    }
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CC5F78]))
    {
      v9 = (void *)MEMORY[0x1E0CB37C0];
      v10 = CFSTR("AVAssetMediaSelectionGroupsDidChangeNotification");
      goto LABEL_3;
    }
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CC3980]))
    {
      v22 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVAssetWasDefragmentedNotification"), a2, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v22);
      if (!objc_msgSend(a2, "_needsLegacyChangeNotifications"))
        goto LABEL_19;
      v20 = (void *)MEMORY[0x1E0CB37C0];
      v21 = &AVFragmentedMovieWasDefragmentedNotification;
      goto LABEL_25;
    }
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CC3968]))
    {
      v23 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVAssetContainsFragmentsDidChangeNotification"), a2, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v23);
      if (objc_msgSend(a2, "_needsLegacyChangeNotifications"))
      {
        v20 = (void *)MEMORY[0x1E0CB37C0];
        v21 = &AVFragmentedMovieContainsMovieFragmentsDidChangeNotification;
        goto LABEL_25;
      }
    }
  }
LABEL_19:
  objc_autoreleasePoolPop(v8);
}

void sub_1933D9C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DA3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1933DA4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __avplayeritem_fpItemNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  CFTypeID v4;
  void *v5;
  void *v6;
  CFTypeID v7;
  const __CFDictionary *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int32_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFDictionary *v20;
  CMTimeValue v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  const __CFDictionary *v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  const void *v48;
  const void *v49;
  const void *v50;
  const void *v51;
  CFTypeID v52;
  CMTimeFlags v53;
  CMTimeEpoch v54;
  const __CFDictionary *v55;
  const __CFDictionary *v56;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  void *v59;
  const __CFString *v60;
  uint64_t v61;
  NSObject *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  char v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  const __CFDictionary *v87;
  CMTimeValue v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  uint64_t v93;
  const __CFString *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  NSObject *v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  _QWORD *v106;
  const __CFDictionary *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  _QWORD *v116;
  uint64_t v117;
  void *v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  unsigned int v125;
  const __CFString *v126;
  const void *v127;
  CFTypeID v128;
  const __CFNumber *v129;
  const __CFNumber *v130;
  CFTypeID v131;
  void *v132;
  uint64_t value_low;
  uint64_t v134;
  uint64_t v135;
  const void *v136;
  CFTypeID v137;
  const __CFNumber *v138;
  const __CFNumber *v139;
  CFTypeID v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  NSObject *v156;
  uint64_t v157;
  uint64_t v158;
  _QWORD v159[6];
  _QWORD v160[5];
  _QWORD v161[6];
  _QWORD v162[6];
  _QWORD v163[6];
  _QWORD v164[6];
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _QWORD v177[5];
  _QWORD v178[5];
  _QWORD v179[5];
  CMTime v180;
  _QWORD v181[8];
  _QWORD v182[5];
  __int128 v183;
  _QWORD v184[6];
  _QWORD v185[5];
  _QWORD v186[5];
  _QWORD v187[7];
  _QWORD v188[5];
  _QWORD v189[5];
  _QWORD v190[5];
  _QWORD v191[5];
  _QWORD v192[6];
  CMTimeScale timescale;
  CMTimeFlags v194;
  CMTimeEpoch v195;
  CMTimeValue value;
  CMTimeScale v197;
  CMTimeFlags v198;
  CMTimeEpoch v199;
  _QWORD v200[6];
  _QWORD v201[6];
  _QWORD v202[6];
  _QWORD v203[6];
  _QWORD v204[5];
  __int128 v205;
  _QWORD block[5];
  CMTime v207;
  CMTime valuePtr;
  CMTime time2;
  CMTime time1;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1940343FC]();
  if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DC8]))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DD0]))
    {
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForBasicInspection");
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForInspectionOfDuration");
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForInspectionOfPresentationSize");
      v8 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EE0]);
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (v8)
      {
        CMTimeMakeFromDictionary(&valuePtr, v8);
      }
      else
      {
        v15 = *(void **)(a1 + 32);
        if (v15)
          objc_msgSend(v15, "_duration");
      }
      time1 = valuePtr;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
      v16 = CMTimeCompare(&time1, &time2);
      v17 = MEMORY[0x1E0C809B0];
      if (v16)
      {
        time1 = valuePtr;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
        if (CMTimeCompare(&time1, &time2))
        {
          objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("duration"));
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(NSObject **)(*(_QWORD *)(v18 + 8) + 16);
          block[0] = v17;
          block[1] = 3221225472;
          block[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_2;
          block[3] = &unk_1E3031E68;
          v207 = valuePtr;
          block[4] = v18;
          av_readwrite_dispatch_queue_write(v19, block);
          objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("duration"));
        }
      }
      *(_OWORD *)&time1.value = *MEMORY[0x1E0C9D820];
      v20 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4ED0]);
      if (!v20 || !CGSizeMakeWithDictionaryRepresentation(v20, (CGSize *)&time1))
      {
        objc_msgSend(*(id *)(a1 + 32), "_presentationSize");
        time1.value = v21;
        *(_QWORD *)&time1.timescale = v22;
      }
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("presentationSize"));
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(NSObject **)(*(_QWORD *)(v23 + 8) + 16);
      v204[0] = v17;
      v204[1] = 3221225472;
      v204[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_3;
      v204[3] = &unk_1E30314D8;
      v204[4] = v23;
      v205 = *(_OWORD *)&time1.value;
      av_readwrite_dispatch_queue_write(v24, v204);
      objc_msgSend(*(id *)(a1 + 40), "_noteNewPresentationSizeForPlayerItem:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("presentationSize"));
      v25 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemPresentationSizeDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v25);
      v26 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F48]);
      if (v26)
      {
        v27 = v26;
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasEnabledAudio"));
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(NSObject **)(*(_QWORD *)(v28 + 8) + 16);
        v203[0] = v17;
        v203[1] = 3221225472;
        v203[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_4;
        v203[3] = &unk_1E302FCE8;
        v203[4] = v28;
        v203[5] = v27;
        av_readwrite_dispatch_queue_write(v29, v203);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("hasEnabledAudio"));
      }
      v30 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F50]);
      if (v30)
      {
        v31 = v30;
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasEnabledVideo"));
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(NSObject **)(*(_QWORD *)(v32 + 8) + 16);
        v202[0] = v17;
        v202[1] = 3221225472;
        v202[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_5;
        v202[3] = &unk_1E302FCE8;
        v202[4] = v32;
        v202[5] = v31;
        av_readwrite_dispatch_queue_write(v33, v202);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("hasEnabledVideo"));
      }
      v34 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F40]);
      if (v34)
      {
        v35 = v34;
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasVideo"));
        v36 = *(_QWORD *)(a1 + 32);
        v37 = *(NSObject **)(*(_QWORD *)(v36 + 8) + 16);
        v201[0] = v17;
        v201[1] = 3221225472;
        v201[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_6;
        v201[3] = &unk_1E302FCE8;
        v201[4] = v36;
        v201[5] = v35;
        av_readwrite_dispatch_queue_write(v37, v201);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("hasVideo"));
      }
      v38 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4ED8]);
      if (!v38)
        v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isNonForcedSubtitleDisplayEnabled"));
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("nonForcedSubtitleDisplayEnabled"));
      v39 = *(_QWORD *)(a1 + 32);
      v40 = *(NSObject **)(*(_QWORD *)(v39 + 8) + 16);
      v200[0] = v17;
      v200[1] = 3221225472;
      v200[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_7;
      v200[3] = &unk_1E302FCE8;
      v200[4] = v39;
      v200[5] = v38;
      av_readwrite_dispatch_queue_write(v40, v200);
      objc_msgSend(*(id *)(a1 + 40), "_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("nonForcedSubtitleDisplayEnabled"));
      v41 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemNonForcedSubtitleDisplayEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v41);
      objc_msgSend(*(id *)(a1 + 32), "_setAssetToAssetWithFigPlaybackItemIfAppropriate");
      objc_msgSend(*(id *)(a1 + 32), "_updateTimebase");
      objc_msgSend(*(id *)(a1 + 32), "_updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:updateStatusToReadyToPlay:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "status") != 1);
      objc_msgSend(*(id *)(a1 + 40), "_itemIsReadyToPlay:", *(_QWORD *)(a1 + 32));
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E60]))
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateTimebase");
      if (!objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_player"), "currentItem")))goto LABEL_51;
      v9 = objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)MEMORY[0x1E0CB37C0];
      v11 = *(_QWORD *)(a1 + 32);
      v12 = CFSTR("AVPlayerItemTimebaseChangedNotification");
      goto LABEL_16;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D20])
      || CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D18]))
    {
      v43 = objc_msgSend(*(id *)(a1 + 32), "_playbackItemNotificationPayloadToError:", *(_QWORD *)(a1 + 64));
      if (v43)
      {
LABEL_41:
        objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", v43);
        v44 = *(_QWORD **)(a1 + 32);
LABEL_50:
        objc_msgSend(v44, "_invokeReadyForEnqueueingHandlers");
        goto LABEL_51;
      }
LABEL_40:
      v43 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
      goto LABEL_41;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E28]))
    {
      v51 = *(const void **)(a1 + 64);
      if (v51)
      {
        v52 = CFGetTypeID(v51);
        if (v52 == CFDictionaryGetTypeID())
        {
          LODWORD(valuePtr.value) = 0;
          FigCFDictionaryGetInt32IfPresent();
        }
      }
      goto LABEL_40;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D98]))
    {
      time1.value = *MEMORY[0x1E0CA2E18];
      v53 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
      time1.timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
      v54 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      time2.value = time1.value;
      time2.timescale = time1.timescale;
      v55 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EF0]);
      v56 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EC8]);
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForInspectionOfRecommendedTimeOffsetFromLive");
      epoch = v54;
      flags = v53;
      if (v55)
      {
        CMTimeMakeFromDictionary(&valuePtr, v55);
        time1.value = valuePtr.value;
        flags = valuePtr.flags;
        time1.timescale = valuePtr.timescale;
        epoch = valuePtr.epoch;
      }
      if ((flags & 1) == 0)
      {
        v59 = *(void **)(a1 + 32);
        if (v59)
        {
          objc_msgSend(v59, "_recommendedTimeOffsetFromLive");
          flags = valuePtr.flags;
          epoch = valuePtr.epoch;
        }
        else
        {
          epoch = 0;
          flags = 0;
          memset(&valuePtr, 0, sizeof(valuePtr));
        }
        time1.value = valuePtr.value;
        time1.timescale = valuePtr.timescale;
      }
      if (v56)
      {
        CMTimeMakeFromDictionary(&valuePtr, v56);
        time2.value = valuePtr.value;
        v53 = valuePtr.flags;
        time2.timescale = valuePtr.timescale;
        v54 = valuePtr.epoch;
      }
      v65 = *(_QWORD **)(a1 + 32);
      if ((v53 & 1) == 0)
      {
        if (v65)
        {
          objc_msgSend(v65, "_configuredTimeOffsetFromLive");
          v53 = valuePtr.flags;
          v54 = valuePtr.epoch;
          v65 = *(_QWORD **)(a1 + 32);
        }
        else
        {
          v54 = 0;
          v53 = 0;
          memset(&valuePtr, 0, sizeof(valuePtr));
        }
        time2.value = valuePtr.value;
        time2.timescale = valuePtr.timescale;
      }
      v66 = *(NSObject **)(v65[1] + 16);
      v192[0] = MEMORY[0x1E0C809B0];
      v192[1] = 3221225472;
      v192[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_8;
      v192[3] = &unk_1E3032160;
      v192[4] = v65;
      v192[5] = time1.value;
      timescale = time1.timescale;
      v194 = flags;
      v195 = epoch;
      value = time2.value;
      v197 = time2.timescale;
      v198 = v53;
      v199 = v54;
      av_readwrite_dispatch_queue_write(v66, v192);
      v9 = objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)MEMORY[0x1E0CB37C0];
      v11 = *(_QWORD *)(a1 + 32);
      v12 = CFSTR("AVPlayerItemRecommendedTimeOffsetFromLiveDidChangeNotification");
      goto LABEL_16;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E38]))
    {
      v60 = CFSTR("playbackLikelyToKeepUp");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("playbackLikelyToKeepUp"));
      v61 = *(_QWORD *)(a1 + 32);
      v62 = *(NSObject **)(*(_QWORD *)(v61 + 8) + 16);
      v191[0] = MEMORY[0x1E0C809B0];
      v191[1] = 3221225472;
      v191[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_9;
      v191[3] = &unk_1E302FA10;
      v191[4] = v61;
      v63 = v191;
LABEL_87:
      av_readwrite_dispatch_queue_write(v62, v63);
      v69 = *(void **)(a1 + 32);
      v70 = v60;
      goto LABEL_88;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E48]))
    {
      v60 = CFSTR("playbackLikelyToKeepUp");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("playbackLikelyToKeepUp"));
      v64 = *(_QWORD *)(a1 + 32);
      v62 = *(NSObject **)(*(_QWORD *)(v64 + 8) + 16);
      v190[0] = MEMORY[0x1E0C809B0];
      v190[1] = 3221225472;
      v190[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_10;
      v190[3] = &unk_1E302FA10;
      v190[4] = v64;
      v63 = v190;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E40]))
    {
      v60 = CFSTR("playbackBufferEmpty");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("playbackBufferEmpty"));
      v67 = *(_QWORD *)(a1 + 32);
      v62 = *(NSObject **)(*(_QWORD *)(v67 + 8) + 16);
      v189[0] = MEMORY[0x1E0C809B0];
      v189[1] = 3221225472;
      v189[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_11;
      v189[3] = &unk_1E302FA10;
      v189[4] = v67;
      v63 = v189;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E30]))
    {
      v60 = CFSTR("playbackBufferFull");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("playbackBufferFull"));
      v68 = *(_QWORD *)(a1 + 32);
      v62 = *(NSObject **)(*(_QWORD *)(v68 + 8) + 16);
      v188[0] = MEMORY[0x1E0C809B0];
      v188[1] = 3221225472;
      v188[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_12;
      v188[3] = &unk_1E302FA10;
      v188[4] = v68;
      v63 = v188;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DB0]))
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)MEMORY[0x1E0CB37C0];
      v11 = *(_QWORD *)(a1 + 32);
      v12 = CFSTR("AVPlayerItemPlaybackStalledNotification");
LABEL_16:
      v13 = objc_msgSend(v10, "notificationWithName:object:", v12, v11);
      v14 = (void *)v9;
LABEL_17:
      objc_msgSend(v14, "postNotification:", v13);
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E10]))
    {
      v71 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EF8]);
      v72 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC5450]);
      v73 = *(void **)(a1 + 32);
      if (v71)
        v74 = objc_msgSend(v73, "_seekableTimeRangesFromFPSeekableTimeIntervals:", v71);
      else
        v74 = objc_msgSend(v73, "_seekableTimeRanges");
      v84 = v74;
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("seekableTimeRanges"));
      if (v72)
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("seekableTimeRangesLastModifiedTime"));
      v85 = *(_QWORD *)(a1 + 32);
      v86 = *(NSObject **)(*(_QWORD *)(v85 + 8) + 16);
      v187[0] = MEMORY[0x1E0C809B0];
      v187[1] = 3221225472;
      v187[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_13;
      v187[3] = &unk_1E302FD88;
      v187[4] = v85;
      v187[5] = v84;
      v187[6] = v72;
      av_readwrite_dispatch_queue_write(v86, v187);
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("seekableTimeRanges"));
      if (!v72)
        goto LABEL_51;
      v69 = *(void **)(a1 + 32);
      v70 = CFSTR("seekableTimeRangesLastModifiedTime");
LABEL_88:
      objc_msgSend(v69, "didChangeValueForKey:", v70);
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DA8]))
    {
      v75 = (void *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EA8]);
      v76 = objc_msgSend(v75, "isEqual:", *MEMORY[0x1E0CC4C80]);
      if (objc_msgSend(*(id *)(a1 + 32), "isPlaybackBufferFull") && (v76 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("playbackBufferFull"));
        v77 = *(_QWORD *)(a1 + 32);
        v78 = *(NSObject **)(*(_QWORD *)(v77 + 8) + 16);
        v186[0] = MEMORY[0x1E0C809B0];
        v186[1] = 3221225472;
        v186[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_14;
        v186[3] = &unk_1E302FA10;
        v186[4] = v77;
        av_readwrite_dispatch_queue_write(v78, v186);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("playbackBufferFull"));
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isPlaybackBufferEmpty"))
      {
        objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("playbackBufferEmpty"));
        v79 = *(_QWORD *)(a1 + 32);
        v80 = *(NSObject **)(*(_QWORD *)(v79 + 8) + 16);
        v185[0] = MEMORY[0x1E0C809B0];
        v185[1] = 3221225472;
        v185[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_15;
        v185[3] = &unk_1E302FA10;
        v185[4] = v79;
        av_readwrite_dispatch_queue_write(v80, v185);
        objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("playbackBufferEmpty"));
      }
      v81 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EE8]);
      v82 = *(void **)(a1 + 32);
      if (v81)
        v83 = objc_msgSend(v82, "_loadedTimeRangesFromFPPlaybableTimeIntervals:");
      else
        v83 = objc_msgSend(v82, "_loadedTimeRanges");
      v97 = v83;
      v98 = CFSTR("loadedTimeRanges");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("loadedTimeRanges"));
      v99 = *(_QWORD *)(a1 + 32);
      v100 = *(NSObject **)(*(_QWORD *)(v99 + 8) + 16);
      v184[0] = MEMORY[0x1E0C809B0];
      v184[1] = 3221225472;
      v184[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_16;
      v184[3] = &unk_1E302FCE8;
      v184[4] = v99;
      v184[5] = v97;
      v101 = v184;
LABEL_116:
      av_readwrite_dispatch_queue_write(v100, v101);
      v69 = *(void **)(a1 + 32);
      v70 = v98;
      goto LABEL_88;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D00]))
    {
      *(_OWORD *)&valuePtr.value = *MEMORY[0x1E0C9D820];
      v87 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4ED0]);
      if (!v87 || !CGSizeMakeWithDictionaryRepresentation(v87, (CGSize *)&valuePtr))
      {
        objc_msgSend(*(id *)(a1 + 32), "_presentationSize");
        valuePtr.value = v88;
        *(_QWORD *)&valuePtr.timescale = v89;
      }
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForInspectionOfPresentationSize");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("presentationSize"));
      v90 = *(_QWORD *)(a1 + 32);
      v91 = *(NSObject **)(*(_QWORD *)(v90 + 8) + 16);
      v182[0] = MEMORY[0x1E0C809B0];
      v182[1] = 3221225472;
      v182[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_17;
      v182[3] = &unk_1E30314D8;
      v182[4] = v90;
      v183 = *(_OWORD *)&valuePtr.value;
      av_readwrite_dispatch_queue_write(v91, v182);
      objc_msgSend(*(id *)(a1 + 40), "_noteNewPresentationSizeForPlayerItem:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("presentationSize"));
      v92 = (void *)MEMORY[0x1E0CB37C0];
      v93 = *(_QWORD *)(a1 + 32);
      v94 = CFSTR("AVPlayerItemPresentationSizeDidChangeNotification");
      goto LABEL_112;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E68]))
    {
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForInspectionOfTracks");
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "_isStreaming")
        && +[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem](AVPlayerItem, "_forStreamingItemsVendAssetWithFigPlaybackItem"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_markAssetWithFigPlaybackItemAsNeedingNewTracks");
      }
      v102 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F20]);
      v103 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F08]);
      dispatch_retain(*(dispatch_object_t *)(a1 + 48));
      v104 = *(_QWORD *)(a1 + 32);
      v105 = *(NSObject **)(*(_QWORD *)(v104 + 8) + 40);
      v181[0] = MEMORY[0x1E0C809B0];
      v181[1] = 3221225472;
      v181[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_18;
      v181[3] = &unk_1E3030F90;
      v181[4] = v102;
      v181[5] = v104;
      v181[6] = *(_QWORD *)(a1 + 48);
      v181[7] = v103;
      v106 = v181;
      goto LABEL_122;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D10]))
    {
      objc_msgSend(*(id *)(a1 + 32), "_markAsReadyForInspectionOfDuration");
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "_isStreaming")
        && !+[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem](AVPlayerItem, "_forStreamingItemsVendAssetWithFigPlaybackItem"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_markAsNeedingNewAssetWithFigPlaybackItem");
      }
      memset(&valuePtr, 0, sizeof(valuePtr));
      v107 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EE0]);
      if (v107)
      {
        CMTimeMakeFromDictionary(&valuePtr, v107);
      }
      else
      {
        v109 = *(void **)(a1 + 32);
        if (v109)
          objc_msgSend(v109, "_duration");
        else
          memset(&time1, 0, sizeof(time1));
        valuePtr = time1;
      }
      v60 = CFSTR("duration");
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("duration"));
      v113 = *(_QWORD *)(a1 + 32);
      v62 = *(NSObject **)(*(_QWORD *)(v113 + 8) + 16);
      v179[0] = MEMORY[0x1E0C809B0];
      v179[1] = 3221225472;
      v179[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_21;
      v179[3] = &unk_1E3031E68;
      v180 = valuePtr;
      v179[4] = v113;
      v63 = v179;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4CF0]))
    {
      v108 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v108, "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlayerItemDidPlayToEndTimeNotification"), *(_QWORD *)(a1 + 32)));
      if (objc_msgSend(*(id *)(a1 + 40), "_shouldLogPerformanceData")
        && objc_msgSend(*(id *)(a1 + 40), "actionAtItemEnd"))
      {
        objc_msgSend(*(id *)(a1 + 40), "_logPerformanceDataForCurrentItem");
      }
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D28]))
    {
      v110 = objc_msgSend(*(id *)(a1 + 32), "_playbackItemNotificationPayloadToError:", *(_QWORD *)(a1 + 64));
      if (objc_msgSend(*(id *)(a1 + 40), "_shouldLogPerformanceData")
        && objc_msgSend(*(id *)(a1 + 40), "actionAtItemEnd"))
      {
        objc_msgSend(*(id *)(a1 + 40), "_logPerformanceDataForCurrentItem");
      }
      v111 = (void *)MEMORY[0x1E0CB37C0];
      v112 = *(_QWORD *)(a1 + 32);
      if (v110)
        v95 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v110, CFSTR("AVPlayerItemFailedToPlayToEndTimeErrorKey"));
      else
        v95 = 0;
      v94 = CFSTR("AVPlayerItemFailedToPlayToEndTimeNotification");
      v92 = v111;
      v93 = v112;
      goto LABEL_113;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D30]))
    {
      v114 = *(_QWORD *)(a1 + 32);
      v115 = *(NSObject **)(*(_QWORD *)(v114 + 8) + 16);
      v178[0] = MEMORY[0x1E0C809B0];
      v178[1] = 3221225472;
      v178[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_22;
      v178[3] = &unk_1E302FA10;
      v178[4] = v114;
      v116 = v178;
LABEL_150:
      av_readwrite_dispatch_queue_write(v115, v116);
      v92 = (void *)MEMORY[0x1E0CB37C0];
      v93 = *(_QWORD *)(a1 + 32);
      v94 = CFSTR("AVPlayerItemHasEnqueuedVideoFrameDidChangeNotification");
      goto LABEL_112;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4CF8]))
    {
      v117 = *(_QWORD *)(a1 + 32);
      v115 = *(NSObject **)(*(_QWORD *)(v117 + 8) + 16);
      v177[0] = MEMORY[0x1E0C809B0];
      v177[1] = 3221225472;
      v177[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_23;
      v177[3] = &unk_1E302FA10;
      v177[4] = v117;
      v116 = v177;
      goto LABEL_150;
    }
    if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E58]))
    {
      if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D88]))
      {
        v92 = (void *)MEMORY[0x1E0CB37C0];
        v93 = *(_QWORD *)(a1 + 32);
        v94 = CFSTR("AVPlayerItemNewAccessLogEntry");
        goto LABEL_112;
      }
      if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D90]))
      {
        v92 = (void *)MEMORY[0x1E0CB37C0];
        v93 = *(_QWORD *)(a1 + 32);
        v94 = CFSTR("AVPlayerItemNewErrorLogEntry");
        goto LABEL_112;
      }
      if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E00]))
      {
        v119 = objc_msgSend(*(id *)(a1 + 32), "_timeJumpedNotificationIncludesExtendedDiagnosticPayload");
        v120 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EA0]);
        v121 = v120;
        if ((v119 & 1) != 0 || v120)
        {
          v122 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          if (v121)
          {
            v123 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v121);
            if (v123)
            {
              v124 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_playbackCoordinator"), "participantForIdentifier:", v123);
              if (v124)
                objc_msgSend(v122, "setObject:forKey:", v124, CFSTR("AVPlayerItemTimeJumpedOriginatingParticipantKey"));
            }
          }
          if (v119)
          {
            v125 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4FC0]), "integerValue")- 1;
            if (v125 > 5)
              v126 = CFSTR("AVPlayerItemTimeJumpedReasonUnknown");
            else
              v126 = off_1E30321F0[v125];
            objc_msgSend(v122, "setObject:forKey:", v126, CFSTR("AVPlayerItemTimeJumpedReasonKey"));
          }
          v135 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemTimeJumpedNotification"), *(_QWORD *)(a1 + 32), v122);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v135);
        }
        v136 = *(const void **)(a1 + 64);
        if (!v136)
          goto LABEL_51;
        v137 = CFGetTypeID(v136);
        if (v137 != CFDictionaryGetTypeID())
          goto LABEL_51;
        v138 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E0CC4FB8]);
        if (!v138)
          goto LABEL_51;
        v139 = v138;
        v140 = CFGetTypeID(v138);
        if (v140 != CFNumberGetTypeID())
          goto LABEL_51;
        LODWORD(valuePtr.value) = 0;
        CFNumberGetValue(v139, kCFNumberSInt32Type, &valuePtr);
        v132 = *(void **)(a1 + 32);
        value_low = LODWORD(valuePtr.value);
        v134 = 1;
      }
      else
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E08]))
        {
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D50]))
          {
            objc_msgSend(*(id *)(a1 + 40), "_setFigPlaybackItemToMakeCurrent:", *(_QWORD *)(a1 + 72));
            v92 = (void *)MEMORY[0x1E0CB37C0];
            v93 = *(_QWORD *)(a1 + 32);
            v94 = CFSTR("AVPlayerItemBecameCurrentNotification");
            goto LABEL_112;
          }
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D58]))
          {
            v92 = (void *)MEMORY[0x1E0CB37C0];
            v93 = *(_QWORD *)(a1 + 32);
            v94 = CFSTR("AVPlayerItemStoppedBeingCurrentNotification");
            goto LABEL_112;
          }
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D60]))
          {
            objc_msgSend(*(id *)(a1 + 32), "_removeInterstitialEventCollector");
            v92 = (void *)MEMORY[0x1E0CB37C0];
            v93 = *(_QWORD *)(a1 + 32);
            v94 = CFSTR("AVPlayerItemWasRemovedFromPlayQueueNotification");
            goto LABEL_112;
          }
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4CD8]))
          {
            objc_msgSend(*(id *)(a1 + 32), "_updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:updateStatusToReadyToPlay:", *(_QWORD *)(a1 + 64), 0);
            v92 = (void *)MEMORY[0x1E0CB37C0];
            v93 = *(_QWORD *)(a1 + 32);
            v94 = CFSTR("AVPlayerItemVariantChangedNotification");
            goto LABEL_112;
          }
          if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4CE8]))
          {
            if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D08]))
            {
              v141 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4ED8]);
              if (!v141)
                v141 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isNonForcedSubtitleDisplayEnabled"));
              objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("nonForcedSubtitleDisplayEnabled"));
              v142 = *(_QWORD *)(a1 + 32);
              v143 = *(NSObject **)(*(_QWORD *)(v142 + 8) + 16);
              v164[0] = MEMORY[0x1E0C809B0];
              v164[1] = 3221225472;
              v164[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_24;
              v164[3] = &unk_1E302FCE8;
              v164[4] = v142;
              v164[5] = v141;
              av_readwrite_dispatch_queue_write(v143, v164);
              objc_msgSend(*(id *)(a1 + 40), "_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:", *(_QWORD *)(a1 + 32));
              objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("nonForcedSubtitleDisplayEnabled"));
              v144 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemNonForcedSubtitleDisplayEnabledDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v144);
            }
            else
            {
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DE8]))
              {
                v146 = *(_QWORD *)(a1 + 32);
                v105 = *(NSObject **)(*(_QWORD *)(v146 + 8) + 40);
                v163[0] = MEMORY[0x1E0C809B0];
                v163[1] = 3221225472;
                v163[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_25;
                v163[3] = &unk_1E302FCE8;
                v147 = *(_QWORD *)(a1 + 48);
                v163[4] = v146;
                v163[5] = v147;
                v106 = v163;
LABEL_122:
                dispatch_async(v105, v106);
                goto LABEL_51;
              }
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D40]))
              {
                v148 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F48]);
                if (!v148)
                  v148 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_hasEnabledAudio"));
                v98 = CFSTR("hasEnabledAudio");
                objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasEnabledAudio"));
                v149 = *(_QWORD *)(a1 + 32);
                v100 = *(NSObject **)(*(_QWORD *)(v149 + 8) + 16);
                v162[0] = MEMORY[0x1E0C809B0];
                v162[1] = 3221225472;
                v162[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_28;
                v162[3] = &unk_1E302FCE8;
                v162[4] = v149;
                v162[5] = v148;
                v101 = v162;
                goto LABEL_116;
              }
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D48]))
              {
                v150 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F50]);
                if (!v150)
                  v150 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_hasEnabledVideo"));
                v98 = CFSTR("hasEnabledVideo");
                objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasEnabledVideo"));
                v151 = *(_QWORD *)(a1 + 32);
                v100 = *(NSObject **)(*(_QWORD *)(v151 + 8) + 16);
                v161[0] = MEMORY[0x1E0C809B0];
                v161[1] = 3221225472;
                v161[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_29;
                v161[3] = &unk_1E302FCE8;
                v161[4] = v151;
                v161[5] = v150;
                v101 = v161;
                goto LABEL_116;
              }
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4D38]))
              {
                v60 = CFSTR("hasVideo");
                objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("hasVideo"));
                v152 = *(_QWORD *)(a1 + 32);
                v62 = *(NSObject **)(*(_QWORD *)(v152 + 8) + 16);
                v160[0] = MEMORY[0x1E0C809B0];
                v160[1] = 3221225472;
                v160[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_30;
                v160[3] = &unk_1E302FA10;
                v160[4] = v152;
                v63 = v160;
                goto LABEL_87;
              }
              if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E18]))
              {
                if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4E20]))
                {
                  v153 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F98]);
                  v154 = MEMORY[0x1E0C9AAA0];
                  if (v153)
                    v154 = v153;
                  v155 = *(_QWORD *)(a1 + 32);
                  v156 = *(NSObject **)(*(_QWORD *)(v155 + 8) + 16);
                  v159[0] = MEMORY[0x1E0C809B0];
                  v159[1] = 3221225472;
                  v159[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_31;
                  v159[3] = &unk_1E302FCE8;
                  v159[4] = v155;
                  v159[5] = v154;
                  av_readwrite_dispatch_queue_write(v156, v159);
                  v92 = (void *)MEMORY[0x1E0CB37C0];
                  v93 = *(_QWORD *)(a1 + 32);
                  v94 = CFSTR("AVPlayerItemSpatialAudioRenderingDidChangeNotification");
                }
                else
                {
                  if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4CD0]))
                  {
                    objc_msgSend(*(id *)(a1 + 32), "_updateAllowedAudioSpatializationFormatsFromFigItem");
                    goto LABEL_51;
                  }
                  if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DB8]))
                  {
                    v92 = (void *)MEMORY[0x1E0CB37C0];
                    v93 = *(_QWORD *)(a1 + 32);
                    v94 = CFSTR("AVPlayerItemReachedTimeToPauseBufferingNotification");
                  }
                  else
                  {
                    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DC0]))
                    {
                      v157 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F38]);
                      v95 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v157, CFSTR("AVPlayerItemTimeToPausePlaybackKey"), 0);
                      v92 = (void *)MEMORY[0x1E0CB37C0];
                      v93 = *(_QWORD *)(a1 + 32);
                      v94 = CFSTR("AVPlayerItemReachedTimeToPausePlaybackNotification");
                      goto LABEL_113;
                    }
                    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC4DA0]))
                    {
                      v92 = (void *)MEMORY[0x1E0CB37C0];
                      v93 = *(_QWORD *)(a1 + 32);
                      v94 = CFSTR("AVPlayerItemOverlappedPlaybackWillBeginNotification");
                    }
                    else
                    {
                      if (!CFEqual(*(CFTypeRef *)(a1 + 56), CFSTR("OverlappedPlaybackItemDidComplete")))
                      {
                        if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CC57D8]))
                        {
                          v158 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC5BC8]);
                          objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11912, 0));
                          AVMediaStatePurgePostMediaStateWasPurgedNotificationForObject(*(_QWORD *)(a1 + 32), v158);
                        }
                        else if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E0CA4B88]))
                        {
                          objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0));
                        }
                        goto LABEL_51;
                      }
                      v92 = (void *)MEMORY[0x1E0CB37C0];
                      v93 = *(_QWORD *)(a1 + 32);
                      v94 = CFSTR("AVPlayerItemOverlappedPlaybackDidCompleteNotification");
                    }
                  }
                }
LABEL_112:
                v95 = 0;
LABEL_113:
                v96 = objc_msgSend(v92, "notificationWithName:object:userInfo:", v94, v93, v95);
                v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v13 = v96;
                goto LABEL_17;
              }
            }
          }
          v145 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4F00]);
          if (v145)
            objc_msgSend(*(id *)(a1 + 32), "_setCurrentMediaSelection:", objc_msgSend(*(id *)(a1 + 32), "_currentMediaSelectionFromFigSelectedMediaArray:", v145));
          goto LABEL_51;
        }
        v127 = *(const void **)(a1 + 64);
        if (!v127)
          goto LABEL_51;
        v128 = CFGetTypeID(v127);
        if (v128 != CFDictionaryGetTypeID())
          goto LABEL_51;
        v129 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E0CC4FB8]);
        if (!v129)
          goto LABEL_51;
        v130 = v129;
        v131 = CFGetTypeID(v129);
        if (v131 != CFNumberGetTypeID())
          goto LABEL_51;
        LODWORD(valuePtr.value) = 0;
        CFNumberGetValue(v130, kCFNumberSInt32Type, &valuePtr);
        v132 = *(void **)(a1 + 32);
        value_low = LODWORD(valuePtr.value);
        v134 = 0;
      }
      objc_msgSend(v132, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", value_low, v134);
      goto LABEL_51;
    }
    v118 = *(void **)(a1 + 32);
    if (v118)
    {
      objc_msgSend(v118, "loopTimeRange");
      v93 = *(_QWORD *)(a1 + 32);
      if ((BYTE12(v174) & 1) != 0)
      {
        if (v93)
        {
          objc_msgSend(*(id *)(a1 + 32), "loopTimeRange");
          v93 = *(_QWORD *)(a1 + 32);
          if ((BYTE4(v173) & 1) != 0)
          {
            if (!v93)
            {
              v169 = 0u;
              v170 = 0u;
              v168 = 0u;
              goto LABEL_179;
            }
            objc_msgSend(*(id *)(a1 + 32), "loopTimeRange");
            v93 = *(_QWORD *)(a1 + 32);
            if (!*((_QWORD *)&v170 + 1))
            {
              if (v93)
              {
                objc_msgSend(*(id *)(a1 + 32), "loopTimeRange");
                if ((*((_QWORD *)&v166 + 1) & 0x8000000000000000) == 0)
                  goto LABEL_51;
                v93 = *(_QWORD *)(a1 + 32);
                goto LABEL_167;
              }
LABEL_179:
              v166 = 0u;
              v167 = 0u;
              v165 = 0u;
              goto LABEL_51;
            }
          }
        }
        else
        {
          v172 = 0u;
          v173 = 0u;
          v171 = 0u;
        }
      }
    }
    else
    {
      v93 = 0;
      v175 = 0u;
      v176 = 0u;
      v174 = 0u;
    }
LABEL_167:
    v92 = (void *)MEMORY[0x1E0CB37C0];
    v94 = CFSTR("AVPlayerItemTimeJumpedNotification");
    goto LABEL_112;
  }
  valuePtr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v3 = *(const void **)(a1 + 64);
  if (!v3 || (v4 = CFGetTypeID(v3), v4 != CFDictionaryGetTypeID()))
  {
LABEL_46:
    v46 = *(void **)(a1 + 32);
    time1 = valuePtr;
    objc_msgSend(v46, "_respondToBecomingReadyForBasicInspectionWithDuration:", &time1);
    goto LABEL_47;
  }
  v5 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E0CC4F78]);
  if (!v5)
  {
    v42 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0CC4EE0]);
    if (v42)
    {
      CMTimeMakeFromDictionary(&valuePtr, v42);
    }
    else
    {
      v45 = *(void **)(a1 + 32);
      if (v45)
        objc_msgSend(v45, "_duration");
      else
        memset(&time1, 0, sizeof(time1));
      valuePtr = time1;
    }
    goto LABEL_46;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 == CFArrayGetTypeID())
  {
    if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CC5188]))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1384) = 1;
    if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CC50A8]))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1385) = 1;
  }
LABEL_47:
  if (objc_msgSend(*(id *)(a1 + 32), "_isReadyForBasicInspection"))
  {
    v44 = *(_QWORD **)(a1 + 32);
    v47 = v44[1];
    if (*(_BYTE *)(v47 + 1384))
    {
      if (*(_BYTE *)(v47 + 1385))
        goto LABEL_50;
    }
  }
LABEL_51:
  objc_autoreleasePoolPop(v2);
  v48 = *(const void **)(a1 + 56);
  if (v48)
    CFRelease(v48);
  v49 = *(const void **)(a1 + 64);
  if (v49)
    CFRelease(v49);
  v50 = *(const void **)(a1 + 72);
  if (v50)
    CFRelease(v50);
}

void sub_1933DC604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DC6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DC760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DC80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DCC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DCDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DD040(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1933DD3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 AVTimebaseObserver_figTimebaseGetTime@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  int32_t v3;
  __n128 *v4;
  __n128 result;
  CMTime v6;
  CMTime time1;
  CMTime v8;
  char v9;

  v9 = 0;
  memset(&v8, 0, sizeof(v8));
  CMTimebaseGetTimeClampedAboveAnchorTime();
  v2 = (__n128 *)MEMORY[0x1E0CA2E68];
  if ((unsigned __int128)0 >> 96 != 1)
    v8 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (v8.epoch)
    v8 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  time1 = v8;
  v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v3 = CMTimeCompare(&time1, &v6);
  v4 = (__n128 *)&v8;
  if (v3 < 0)
    v4 = v2;
  result = *v4;
  *a1 = *v4;
  a1[1].n128_u64[0] = v4[1].n128_u64[0];
  return result;
}

void playerItem_createDefaultProxyTimebase()
{
  const __CFAllocator *v0;
  OpaqueCMClock *HostTimeClock;
  CMTimebaseRef timebaseOut;

  timebaseOut = 0;
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  HostTimeClock = CMClockGetHostTimeClock();
  if (!CMTimebaseCreateWithSourceClock(v0, HostTimeClock, &timebaseOut))
    CMTimebaseCreateReadOnlyTimebase();
  if (timebaseOut)
    CFRelease(timebaseOut);
}

double AVPlayerItemGetFigPlayerSnapTimesForTimeAndTolerances(CMTime *a1, CMTime *a2, CMTime *a3, CMTime *a4, CMTime *a5)
{
  double result;
  CMTime v10;
  CMTime rhs;
  CMTime lhs;
  CMTime v13;

  memset(&v13, 0, sizeof(v13));
  lhs = *a1;
  rhs = *a2;
  CMTimeSubtract(&v13, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  rhs = *a1;
  v10 = *a3;
  CMTimeAdd(&lhs, &rhs, &v10);
  if (a4)
  {
    result = *(double *)&v13.value;
    *a4 = v13;
  }
  if (a5)
  {
    result = *(double *)&lhs.value;
    *a5 = lhs;
  }
  return result;
}

uint64_t AVPlayerItemGetFigPlayerSetTimeFlagsForTolerances(CMTime *a1, CMTime *a2)
{
  CMTimeEpoch v3;
  uint64_t v4;
  __int128 v6;
  CMTime time2;
  CMTime time1;

  v6 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&time1.value = *MEMORY[0x1E0CA2E68];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  time1.epoch = v3;
  time2 = *a1;
  v4 = 3;
  if (!CMTimeCompare(&time1, &time2))
  {
    *(_OWORD *)&time1.value = v6;
    time1.epoch = v3;
    time2 = *a2;
    if (CMTimeCompare(&time1, &time2))
      return 3;
    else
      return 5;
  }
  return v4;
}

uint64_t AVOSTypeForString(void *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = 0;
  v2 = objc_msgSend(a1, "length");
  if (v2 >= 4)
    v3 = 4;
  else
    v3 = v2;
  objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v5 - v3 + 4, 0, v3, 0);
  return bswap32(v5);
}

void sub_1933DF9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DFF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933DFFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E00B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void customURLHandlerHandleRequestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v12 = (void *)MEMORY[0x1940343FC]();
  v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a1, "_customURLHandler") == a2)
  {
    objc_msgSend(a1, "_handleRequest:requestID:willHandleRequest:", a3, a4, &v15);
    v13 = 0;
    v14 = v15;
  }
  else
  {
    v13 = FigSignalErrorAt();
    v14 = 0;
  }
  a5(a6, v14, v13);
  objc_autoreleasePoolPop(v12);
}

void customURLHandlerHandleRequestCallback_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v12 = (void *)MEMORY[0x1940343FC]();
  v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_handleRequest:withRequestID:fromHandler:willHandleRequest:", a3, a4, a2, &v15);
    v13 = 0;
    v14 = v15;
  }
  else
  {
    v13 = FigSignalErrorAt();
    v14 = 0;
  }
  a5(a6, v14, v13);
  objc_autoreleasePoolPop(v12);
}

void sub_1933E08E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E09A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E0B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E0BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E0D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E10FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double MidX;
  CGFloat MidY;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  height = boundingRect.size.height;
  width = boundingRect.size.width;
  y = boundingRect.origin.y;
  x = boundingRect.origin.x;
  v6 = aspectRatio.height;
  v7 = aspectRatio.width;
  v16 = boundingRect.size.width / aspectRatio.width;
  v8 = boundingRect.size.height / aspectRatio.height;
  MidX = CGRectGetMidX(boundingRect);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  v11 = fmin(v16, v8);
  v12 = v7 * v11;
  v13 = v6 * v11;
  v14 = MidY + v6 * v11 * -0.5;
  v15 = MidX + v12 * -0.5;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_17(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 944) = result;
  return result;
}

void sub_1933E1618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E1DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E2174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E2240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E32FC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x420], 8);
  _Unwind_Resume(a1);
}

void sub_1933E3400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E34AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E3558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E3A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E3AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E3D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E3DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E3E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E4088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E4250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E4404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1933E46C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933E478C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E4A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E4B14(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933E5000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void *__avplayeritem_fpItemNotificationCallback_block_invoke_13(uint64_t a1)
{
  void *result;
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 984) = objc_msgSend(*(id *)(a1 + 40), "copy");
  result = *(void **)(a1 + 48);
  if (result)
  {
    result = (void *)objc_msgSend(result, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 992) = v3;
  }
  return result;
}

void sub_1933E5F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933E649C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVRunLoopConditionSignal(void *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "setSignaled:", 1);
  objc_autoreleasePoolPop(v2);
}

void sub_1933E6CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t addToHDRModes(const __CFNumber *a1, _QWORD *a2)
{
  uint64_t result;
  int valuePtr;

  valuePtr = 0;
  result = CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr);
  if ((valuePtr - 2) <= 3)
    *a2 |= qword_19357CDC0[valuePtr - 2];
  return result;
}

void handleFigAssetTrackNotification(uint64_t a1, void *a2, const void *a3, uint64_t a4, const void *a5)
{
  void *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  CFTypeID v12;
  const void *Value;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a2, "_loadingMutex");
  v10 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3BF8]);
  v11 = 0;
  if (a5 && v10)
  {
    v12 = CFGetTypeID(a5);
    if (v12 == CFDictionaryGetTypeID())
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC38D0]);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __handleFigAssetTrackNotification_block_invoke;
      v18[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v18[4] = Value;
      v11 = v18;
    }
    else
    {
      v11 = 0;
    }
  }
  MEMORY[0x194033BF8](v9);
  v14 = (void *)objc_msgSend(a2, "_loadingBatches");
  v15 = v14;
  if (v11)
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v11);
  v16 = objc_msgSend(v15, "indexesOfObjectsPassingTest:", &__block_literal_global_376);
  v17 = objc_msgSend(v15, "objectsAtIndexes:", v16);
  objc_msgSend(v15, "removeObjectsAtIndexes:", v16);
  MEMORY[0x194033C04](v9);
  objc_msgSend(a2, "_invokeCompletionHandlerForLoadingBatches:", v17);
  objc_autoreleasePoolPop(v8);
}

void sub_1933E7514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVSynthesizeAVMediaCharacteristicsFromFigValues(void *a1, int a2)
{
  void *v4;
  uint64_t v5;
  int v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "addObjectsFromArray:", AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(a1));
  v5 = 0;
  if (a2 <= 1952807027)
  {
    if (a2 != 1835365473)
    {
      v6 = 1935832172;
      goto LABEL_6;
    }
LABEL_7:
    v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("AVMediaCharacteristicFrameBased"));
    goto LABEL_8;
  }
  if (a2 == 1986618469)
    goto LABEL_7;
  v6 = 1952807028;
LABEL_6:
  if (a2 == v6)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v4, "addObjectsFromArray:", v5);
  return v4;
}

void *AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "addObject:", AVTranslateFigMediaCharacteristicToAVMediaCharacteristic(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)));
      }
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return v2;
}

uint64_t AVTranslateFigMediaCharacteristicToAVMediaCharacteristic(uint64_t a1)
{
  uint64_t result;

  if (AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDictOnce != -1)
    dispatch_once(&AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDictOnce, &__block_literal_global_19);
  result = objc_msgSend((id)AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDict, "objectForKey:", a1);
  if (!result)
    return a1;
  return result;
}

void *AVAllAvailableNSBundleCompatibleLanguageTagsForObjects(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(a1);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0 && (v8 = objc_msgSend(v7, "unicodeLanguageIdentifier")) != 0
          || (objc_opt_respondsToSelector() & 1) != 0 && (v8 = objc_msgSend(v7, "unicodeLanguageCode")) != 0)
        {
          v9 = v8;
          if ((objc_msgSend(v2, "containsObject:", v8) & 1) == 0)
            objc_msgSend(v2, "addObject:", v9);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  return v2;
}

void sub_1933EACB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1933EB81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EB9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EBB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EBC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EBD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EBEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EBF84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t needsTaggedRanges()
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

void sub_1933EC1EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933EC520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EC660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EC7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EC8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EC9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933ECB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933ECC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933ECDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933ECEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_12(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 961) = 1;
  return result;
}

void sub_1933ED1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AVOutputContextGetDefaultDeviceTranslator(uint64_t a1)
{
  _BOOL4 v2;
  __objc2_class **v3;

  v2 = +[AVOutputDevice prefersRouteDescriptors](AVOutputDevice, "prefersRouteDescriptors");
  v3 = off_1E302A4F8;
  if (!v2)
    v3 = off_1E302A4E0;
  return (id)objc_msgSend(objc_alloc(*v3), "initForUsingRouteConfigUpdatedNotification:", a1);
}

void sub_1933EDCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EE664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVEnsureNotOnMainThread(void (**a1)(_QWORD))
{
  NSObject *global_queue;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, a1);
  }
  else
  {
    a1[2](a1);
  }
}

void sub_1933EEA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EEADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EEB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EEC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933EF5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVTimebaseObserver_timebaseNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  v5 = (void *)MEMORY[0x1940343FC]();
  v6 = *(NSObject **)(a2 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AVTimebaseObserver_timebaseNotificationCallback_block_invoke;
  v7[3] = &unk_1E302FE78;
  v7[4] = a2;
  v7[5] = a3;
  dispatch_async(v6, v7);
  objc_autoreleasePoolPop(v5);
}

uint64_t customURLAuthHandlerHandleRequestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a1, "_authHandler") == a2)
  {
    v12 = FigCustomURLRequestInfoCopyNSURLAuthenticationChallenge();
    if (!(_DWORD)v12)
    {
      objc_msgSend(a1, "_poseAuthenticationChallengeWithRequestInfo:requestID:challenge:", a3, a4, 0);
      v13 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v12 = FigSignalErrorAt();
  }
  v13 = 0;
LABEL_6:

  return a5(a6, v13, v12);
}

void sub_1933EFC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVLocalizedErrorWithUnderlyingOSStatus(signed int a1, id a2)
{
  uint64_t v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  char v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v4 = *MEMORY[0x1E0CB3388];
  if (!objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CB3388]))
  {
    if (a2)
      v5 = (id)objc_msgSend(a2, "mutableCopy");
    else
      v5 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    a2 = v5;
    objc_msgSend(v5, "setObject:forKey:", AVOSStatusToNSError(a1, 0), v4);
  }
  v6 = CFSTR("AVFoundationErrorDomain");
  v7 = -11822;
  if (a1 > -12815)
  {
    if (a1 > -12150)
    {
      if (a1 <= -1207)
      {
        if (a1 <= -12084)
        {
          switch(a1)
          {
            case -12149:
            case -12148:
            case -12143:
            case -12124:
            case -12115:
              goto LABEL_132;
            case -12147:
            case -12145:
            case -12144:
            case -12142:
            case -12141:
            case -12140:
            case -12139:
            case -12138:
            case -12136:
            case -12135:
            case -12131:
            case -12130:
            case -12129:
            case -12128:
            case -12127:
            case -12126:
            case -12123:
            case -12122:
            case -12121:
            case -12120:
              goto LABEL_249;
            case -12146:
            case -12133:
            case -12132:
            case -12117:
            case -12116:
              v7 = -11831;
              goto LABEL_262;
            case -12137:
              goto LABEL_90;
            case -12134:
            case -12119:
            case -12118:
              goto LABEL_138;
            case -12125:
LABEL_53:
              v7 = -11847;
              goto LABEL_262;
            default:
              switch(a1)
              {
                case -12109:
                  goto LABEL_124;
                case -12108:
                case -12107:
                case -12106:
                case -12105:
                case -12104:
                case -12102:
                  goto LABEL_249;
                case -12103:
                  goto LABEL_175;
                case -12101:
                  goto LABEL_158;
                case -12100:
                  goto LABEL_137;
                default:
                  if (a1 != -12084)
                    goto LABEL_249;
                  goto LABEL_53;
              }
          }
        }
        if (a1 <= -3008)
        {
          if ((a1 + 6690) > 0x1C || ((1 << (a1 + 34)) & 0x10000003) == 0)
          {
            v10 = -12083;
            goto LABEL_156;
          }
          goto LABEL_137;
        }
        if ((a1 + 3007) >= 8 && a1 != -2000)
          goto LABEL_249;
      }
      else
      {
        if (a1 > 1)
        {
          if (a1 > 268435458)
          {
            if (a1 > 561606516)
            {
              if (a1 == 561606517)
                goto LABEL_173;
              if (a1 == 1650549857)
              {
LABEL_90:
                v7 = -11821;
                goto LABEL_262;
              }
              goto LABEL_249;
            }
            if (a1 != 268435459)
            {
              if (a1 != 560226676)
                goto LABEL_249;
LABEL_24:
              v7 = -11855;
              goto LABEL_262;
            }
            goto LABEL_157;
          }
          if (a1 == 2)
          {
LABEL_113:
            v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
            v7 = -1100;
            goto LABEL_262;
          }
          if (a1 != 12)
          {
            if (a1 != 28)
              goto LABEL_249;
LABEL_79:
            v7 = -11807;
            goto LABEL_262;
          }
          goto LABEL_137;
        }
        if ((a1 + 1021) >= 0x16 && (a1 + 1206) >= 7 && (a1 + 1103) >= 4)
          goto LABEL_249;
      }
      v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
      v7 = a1;
      goto LABEL_262;
    }
    if (a1 > -12534)
    {
      if (a1 <= -12414)
      {
        if (a1 > -12451)
        {
          switch(a1)
          {
            case -12436:
            case -12435:
              goto LABEL_124;
            case -12434:
              goto LABEL_137;
            case -12433:
            case -12432:
              goto LABEL_249;
            case -12431:
LABEL_115:
              v7 = -11832;
              break;
            case -12430:
LABEL_174:
              v7 = -11869;
              break;
            default:
              v13 = -12450;
              goto LABEL_190;
          }
        }
        else
        {
          v7 = -11858;
          v6 = CFSTR("Source frame missing");
          switch(a1)
          {
            case -12509:
              v6 = CFSTR("No custom callbacks");
              goto LABEL_258;
            case -12508:
              v6 = CFSTR("Frame was cancelled");
              goto LABEL_258;
            case -12507:
              v6 = CFSTR("No output callback");
              goto LABEL_258;
            case -12506:
              v6 = CFSTR("Blitting failed");
              goto LABEL_258;
            case -12505:
              v6 = CFSTR("Invalid composition instruction");
              goto LABEL_258;
            case -12504:
              v6 = CFSTR("Invalid parameter");
              goto LABEL_258;
            case -12503:
              v6 = CFSTR("Destination frame unsupported format");
              goto LABEL_258;
            case -12502:
              v6 = CFSTR("Source frame unsupported format");
              goto LABEL_258;
            case -12501:
              v6 = CFSTR("Render dimensions unknown");
              goto LABEL_258;
            case -12500:
              goto LABEL_258;
            case -12499:
            case -12498:
            case -12497:
            case -12496:
            case -12495:
            case -12494:
              goto LABEL_249;
            case -12493:
              goto LABEL_191;
            default:
              if (a1 != -12533)
                goto LABEL_249;
              v7 = -11903;
              break;
          }
        }
        goto LABEL_262;
      }
      if (a1 <= -12205)
      {
        switch(a1)
        {
          case -12413:
            goto LABEL_262;
          case -12412:
LABEL_158:
            v7 = -11823;
            break;
          case -12411:
          case -12401:
            goto LABEL_137;
          case -12410:
          case -12409:
          case -12408:
          case -12406:
          case -12405:
          case -12404:
          case -12402:
            goto LABEL_249;
          case -12407:
LABEL_124:
            v7 = -11838;
            break;
          case -12403:
LABEL_175:
            v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
            v7 = -3001;
            break;
          default:
            v13 = -12282;
LABEL_190:
            if (a1 != v13)
              goto LABEL_249;
LABEL_191:
            v6 = CFSTR("AVFoundationErrorDomain");
            v7 = -11842;
            break;
        }
        goto LABEL_262;
      }
      if (a1 > -12179)
      {
        if (a1 > -12167)
        {
          if (a1 != -12166)
          {
            v9 = -12161;
            goto LABEL_171;
          }
          goto LABEL_173;
        }
        if (a1 != -12178)
        {
          if (a1 == -12167)
          {
LABEL_112:
            v7 = -11839;
            goto LABEL_262;
          }
          goto LABEL_249;
        }
        goto LABEL_157;
      }
      if (a1 == -12204)
      {
        v6 = (__CFString *)*MEMORY[0x1E0CB28A8];
        v7 = 513;
        goto LABEL_262;
      }
      if (a1 == -12203)
      {
        v6 = (__CFString *)*MEMORY[0x1E0CB28A8];
        v7 = 257;
        goto LABEL_262;
      }
      v10 = -12184;
LABEL_156:
      if (a1 != v10)
        goto LABEL_249;
      goto LABEL_157;
    }
    if (a1 > -12652)
    {
      switch(a1)
      {
        case -12651:
          v7 = -11861;
          break;
        case -12650:
        case -12649:
        case -12648:
        case -12647:
        case -12646:
        case -12645:
        case -12644:
        case -12643:
        case -12642:
        case -12641:
        case -12640:
        case -12637:
          goto LABEL_249;
        case -12639:
          v7 = -11906;
          v6 = CFSTR("Media writing - predetermined file size too small");
          goto LABEL_258;
        case -12638:
          v7 = -11907;
          v6 = CFSTR("Media writing - predetermined media data size too small");
          goto LABEL_258;
        case -12636:
          goto LABEL_137;
        case -12635:
          v7 = -11800;
          v6 = CFSTR("Media writing - invalid edit");
          goto LABEL_258;
        case -12634:
          v7 = -11800;
          v6 = CFSTR("Media writing - invalid format");
          goto LABEL_258;
        case -12633:
          v7 = -11800;
          v6 = CFSTR("Media writing - invalid timestamp");
          goto LABEL_258;
        case -12632:
          v7 = -11800;
          v6 = CFSTR("Media writing - no such track");
          goto LABEL_258;
        case -12631:
          v7 = -11800;
          v6 = CFSTR("Media writing - read only property");
          goto LABEL_258;
        case -12630:
          v7 = -11800;
          v6 = CFSTR("Media writing - no such property");
          goto LABEL_258;
        default:
          switch(a1)
          {
            case -12556:
              goto LABEL_157;
            case -12555:
              v7 = -11862;
              break;
            case -12553:
            case -12551:
            case -12550:
              v7 = -11880;
              break;
            case -12541:
              goto LABEL_79;
            case -12540:
              v7 = -11900;
              break;
            default:
              goto LABEL_249;
          }
          break;
      }
      goto LABEL_262;
    }
    if (a1 > -12745)
    {
      switch(a1)
      {
        case -12719:
          v7 = -11800;
          v6 = CFSTR("Media format - slice has an invalid value");
          goto LABEL_258;
        case -12718:
          goto LABEL_249;
        case -12717:
          v7 = -11800;
          v6 = CFSTR("Media format - sample description is unsupported for the specified format flavor");
          goto LABEL_258;
        case -12716:
          v7 = -11800;
          v6 = CFSTR("Media format - format description has an incompatible format (e.g. unknown format / incompatible atom)");
          goto LABEL_258;
        case -12715:
          v7 = -11800;
          v6 = CFSTR("Media format - format description is invalid (e.g. invalid size)");
          goto LABEL_258;
        case -12714:
          v7 = -11800;
          v6 = CFSTR("Media format - sample description is invalid (e.g. invalid size)");
          goto LABEL_258;
        case -12713:
          goto LABEL_137;
        case -12712:
          v7 = -11800;
          v6 = CFSTR("Media format - invalid parameter");
          goto LABEL_258;
        default:
          switch(a1)
          {
            case -12668:
            case -12661:
              goto LABEL_37;
            case -12667:
            case -12666:
            case -12665:
            case -12663:
            case -12662:
              goto LABEL_249;
            case -12664:
              goto LABEL_137;
            case -12660:
              v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
              v7 = -1102;
              break;
            default:
              v12 = -12744;
              goto LABEL_247;
          }
          break;
      }
      goto LABEL_262;
    }
    if (a1 == -12814)
    {
      v7 = -11800;
      v6 = CFSTR("CoreAnimation image queue is full");
      goto LABEL_258;
    }
    if (a1 != -12786)
    {
      if (a1 != -12763)
        goto LABEL_249;
      v7 = -11862;
      v6 = CFSTR("Cannot append media data after ending session");
      goto LABEL_258;
    }
LABEL_137:
    v7 = -11801;
    goto LABEL_262;
  }
  if (a1 > -16451)
  {
    if (a1 <= -15433)
    {
      if (a1 > -16126)
      {
        if (a1 <= -15842)
        {
          switch(a1)
          {
            case -16121:
            case -16120:
            case -16111:
            case -16110:
            case -16101:
            case -16100:
              goto LABEL_53;
            case -16119:
            case -16118:
            case -16117:
            case -16116:
            case -16115:
            case -16112:
            case -16109:
            case -16108:
            case -16107:
            case -16106:
            case -16105:
            case -16104:
            case -16103:
              goto LABEL_249;
            case -16114:
              v7 = -11875;
              v6 = CFSTR("Value for kVTDecompressionPropertyKey_RequestedMVHEVCVideoLayerIDs does not match content");
              goto LABEL_258;
            case -16113:
              v7 = -11875;
              v6 = CFSTR("Can only use kVTDecompressionPropertyKey_RequestedMVHEVCVideoLayerIDs for MV-HEVC video");
              goto LABEL_258;
            case -16102:
              goto LABEL_124;
            default:
              if (a1 != -16125)
                goto LABEL_249;
              v7 = -11862;
              v6 = CFSTR("Cannot append tagged buffer that contains no CVPixelBuffers");
              break;
          }
          goto LABEL_258;
        }
        if ((a1 + 15519) < 5 || (a1 + 15811) < 2)
        {
LABEL_93:
          v7 = -11848;
          goto LABEL_262;
        }
        if (a1 != -15841)
          goto LABEL_249;
        goto LABEL_181;
      }
      if (a1 <= -16223)
      {
        switch(a1)
        {
          case -16434:
          case -16405:
            goto LABEL_157;
          case -16433:
          case -16430:
          case -16429:
          case -16428:
          case -16427:
          case -16426:
          case -16425:
          case -16424:
          case -16423:
          case -16421:
          case -16420:
          case -16416:
          case -16415:
          case -16408:
          case -16407:
          case -16406:
          case -16404:
          case -16403:
            goto LABEL_249;
          case -16432:
            goto LABEL_262;
          case -16431:
          case -16422:
            goto LABEL_124;
          case -16419:
            v7 = -11859;
            break;
          case -16418:
            v7 = -11805;
            break;
          case -16417:
            v7 = -11904;
            break;
          case -16414:
            v7 = -11818;
            break;
          case -16413:
            v7 = -11810;
            break;
          case -16412:
            v7 = -11811;
            break;
          case -16411:
            goto LABEL_79;
          case -16410:
            goto LABEL_158;
          case -16409:
            v7 = -11803;
            break;
          case -16402:
            goto LABEL_53;
          default:
            if (a1 != -16450)
              goto LABEL_249;
            v7 = -11808;
            break;
        }
        goto LABEL_262;
      }
      if (a1 == -16222)
      {
        v7 = -11856;
        goto LABEL_262;
      }
      if (a1 == -16180)
      {
        v7 = -11858;
        v6 = CFSTR("Custom compositor failed with client NSError");
        goto LABEL_258;
      }
      v10 = -16155;
      goto LABEL_156;
    }
    if (a1 > -12889)
    {
      if (a1 <= -12849)
      {
        switch(a1)
        {
          case -12888:
          case -12887:
            v7 = -11866;
            break;
          case -12886:
            v7 = -11853;
            v6 = CFSTR("JSON format error");
            goto LABEL_258;
          case -12885:
            goto LABEL_87;
          case -12884:
            goto LABEL_37;
          case -12880:
            v7 = -11867;
            break;
          case -12875:
            v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
            v7 = -1001;
            break;
          case -12873:
            v7 = -11849;
            break;
          case -12867:
            goto LABEL_115;
          case -12864:
            goto LABEL_174;
          case -12862:
            goto LABEL_137;
          default:
            goto LABEL_249;
        }
        goto LABEL_262;
      }
      if (a1 == -12848)
      {
        v7 = -11829;
        goto LABEL_262;
      }
      if (a1 == -12847)
      {
LABEL_138:
        v7 = -11828;
        goto LABEL_262;
      }
      v11 = -12846;
    }
    else
    {
      if (a1 > -12940)
      {
        switch(a1)
        {
          case -12939:
            v7 = -11850;
            break;
          case -12938:
            goto LABEL_113;
          case -12937:
            goto LABEL_120;
          case -12935:
            v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
            v7 = -1;
            break;
          case -12929:
            v7 = -11857;
            break;
          case -12926:
            v7 = -11882;
            break;
          case -12925:
            goto LABEL_93;
          case -12915:
            v7 = -11840;
            break;
          case -12913:
            goto LABEL_112;
          case -12912:
            v7 = -11883;
            break;
          case -12911:
          case -12909:
            goto LABEL_90;
          case -12910:
            goto LABEL_24;
          case -12908:
            a2 = (id)ensureUserInfoDictionaryContainsObjectForKey(a2, (uint64_t)CFSTR("vide"));
            v7 = -11834;
            break;
          case -12906:
            a2 = (id)ensureUserInfoDictionaryContainsObjectForKey(a2, (uint64_t)CFSTR("vide"));
            v7 = -11833;
            break;
          default:
            goto LABEL_249;
        }
        goto LABEL_262;
      }
      if (a1 == -15432)
      {
LABEL_132:
        v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
        v7 = -3000;
        goto LABEL_262;
      }
      if (a1 == -15430)
      {
        v7 = -11911;
        goto LABEL_262;
      }
      v11 = -12953;
    }
    if (a1 != v11)
      goto LABEL_249;
    goto LABEL_137;
  }
  if (a1 <= -17544)
  {
    if (a1 <= -42006)
    {
      if (a1 <= -42598)
      {
        v8 = a1 - 71;
        if ((a1 + 42681) > 0xD)
        {
LABEL_15:
          if (a1 == -536870208)
          {
            v7 = -11804;
            goto LABEL_262;
          }
          v9 = -42783;
LABEL_171:
          if (a1 == v9)
            goto LABEL_172;
          goto LABEL_249;
        }
        if (((1 << v8) & 0x21C1) == 0)
        {
          if (((1 << v8) & 0x206) != 0)
          {
LABEL_172:
            v7 = -11836;
            goto LABEL_262;
          }
          if (a1 != -42676)
            goto LABEL_15;
          goto LABEL_137;
        }
LABEL_173:
        v7 = -11835;
        goto LABEL_262;
      }
      if ((a1 + 42597) <= 0xD)
      {
        if (((1 << (a1 + 101)) & 0x1F87) != 0)
          goto LABEL_173;
        if (a1 == -42584)
        {
LABEL_87:
          v7 = -11863;
          goto LABEL_262;
        }
      }
LABEL_249:
      if ((a1 + 11999) >= 0xC8)
        v14 = -11800;
      else
        v14 = a1;
      v7 = v14;
LABEL_261:
      v6 = CFSTR("AVFoundationErrorDomain");
      goto LABEL_262;
    }
    if (a1 <= -19033)
    {
      if (a1 <= -19231)
      {
        if ((a1 + 42005) < 2)
          goto LABEL_173;
        if (a1 == -19232)
        {
          v7 = -11800;
          v6 = CFSTR("CoreAnimation image queue does not support this image type");
        }
        else
        {
          if (a1 != -19231)
            goto LABEL_249;
          v7 = -11800;
          v6 = CFSTR("CoreAnimation image queue registration failed");
        }
        goto LABEL_258;
      }
      if (a1 == -19230)
      {
        v7 = -11800;
        v6 = CFSTR("CoreAnimation image queue does not support this pixel format");
        goto LABEL_258;
      }
      if (a1 != -19163)
      {
        if (a1 != -19034)
          goto LABEL_249;
        v7 = -11862;
        v6 = CFSTR("Cannot append tagged buffer group due to left and right view IDs mismatch");
        goto LABEL_258;
      }
LABEL_181:
      v7 = -11879;
      goto LABEL_262;
    }
    if (a1 <= -17773)
    {
      if (a1 == -19032)
      {
        v7 = -11862;
        v6 = CFSTR("Values for kVTCompressionPropertyKey_MVHEVCVideoLayerIDs are invalid");
        goto LABEL_258;
      }
      if (a1 == -19031)
      {
        v7 = -11862;
        v6 = CFSTR("Value at index 0 for kVTCompressionPropertyKey_MVHEVCVideoLayerIDs is not 0");
        goto LABEL_258;
      }
      v10 = -17774;
      goto LABEL_156;
    }
    if ((a1 + 17693) < 2 || a1 == -17772)
    {
      v7 = -11877;
      goto LABEL_262;
    }
    if (a1 != -17698)
      goto LABEL_249;
    v7 = -11862;
    v6 = CFSTR("Cannot append tagged buffer group due to video layer IDs mismatch");
LABEL_258:
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v16 = *MEMORY[0x1E0C9AFA8];
    v17 = objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0C9AFA8]);
    if (v17)
      objc_msgSend(v15, "appendFormat:", CFSTR("%@, "), v17);
    objc_msgSend(v15, "appendString:", v6);
    a2 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(a2, "setObject:forKey:", v15, v16);
    goto LABEL_261;
  }
  if (a1 > -16851)
  {
    if (a1 <= -16823)
    {
      if ((a1 + 16850) >= 6)
      {
        if ((a1 + 16844) < 5)
        {
LABEL_120:
          v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
          v7 = -1013;
          goto LABEL_262;
        }
        goto LABEL_249;
      }
LABEL_37:
      v6 = (__CFString *)*MEMORY[0x1E0CB32E8];
      v7 = -1008;
      goto LABEL_262;
    }
    if (a1 > -16541)
    {
      if (a1 > -16455)
      {
        if (a1 == -16454)
        {
          v7 = -11837;
          goto LABEL_262;
        }
        if (a1 == -16451)
        {
          v7 = -11817;
          goto LABEL_262;
        }
      }
      else if (a1 == -16540 || a1 == -16530)
      {
        v7 = -11846;
        goto LABEL_262;
      }
      goto LABEL_249;
    }
    if (a1 != -16822)
    {
      if (a1 == -16751)
      {
        v7 = -11878;
        goto LABEL_262;
      }
      v12 = -16750;
LABEL_247:
      if (a1 == v12)
      {
        v7 = -11881;
        goto LABEL_262;
      }
      goto LABEL_249;
    }
LABEL_157:
    v7 = -11819;
    goto LABEL_262;
  }
  if (a1 > -17227)
  {
    if (a1 > -16979)
    {
      switch(a1)
      {
        case -16978:
          goto LABEL_157;
        case -16977:
          goto LABEL_90;
        case -16976:
          goto LABEL_124;
        case -16975:
          v7 = -11843;
          break;
        case -16970:
          goto LABEL_137;
        default:
          goto LABEL_249;
      }
      goto LABEL_262;
    }
    if (a1 == -17226)
    {
      v7 = -11870;
      goto LABEL_262;
    }
    if (a1 == -17223)
    {
      v7 = -11868;
      goto LABEL_262;
    }
    v10 = -17221;
    goto LABEL_156;
  }
  if (a1 <= -17509)
  {
    if (a1 == -17543)
    {
      v7 = -11876;
      v6 = CFSTR("Media writing - segment is not allowed to star with a non-sync sample.");
    }
    else
    {
      if (a1 != -17540)
        goto LABEL_249;
      v7 = -11800;
      v6 = CFSTR("iTT requires languageCode or extendedLanguageTag property to be set");
    }
    goto LABEL_258;
  }
  switch(a1)
  {
    case -17508:
      goto LABEL_113;
    case -17507:
      v7 = -11884;
      break;
    case -17506:
    case -17501:
      goto LABEL_137;
    case -17505:
    case -17504:
    case -17503:
    case -17502:
      goto LABEL_249;
    default:
      if (a1 == -17391)
      {
        v7 = -11871;
      }
      else
      {
        if (a1 != -17390)
          goto LABEL_249;
        v7 = -11841;
      }
      break;
  }
LABEL_262:
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return AVLocalizedError(v6, v7, a2);
}

uint64_t AVOSStatusToNSError(signed int a1, void *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  signed int v9;

  v2 = a2;
  v4 = 0;
  v9 = a1;
  v5 = *MEMORY[0x1E0CB2FE0];
  v6 = *MEMORY[0x1E0CB2F90];
  while (*((unsigned __int8 *)&v9 + v4) - 127 >= 0xFFFFFFA1)
  {
    if (++v4 == 4)
    {
      v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
      objc_msgSend(v2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), AVStringForOSType(a1)), CFSTR("AVErrorFourCharCode"));
      break;
    }
  }
  if ((a1 - 1) >= 0x6A)
    v7 = v6;
  else
    v7 = v5;
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, a1, v2);
}

void *AVLocalizedStringFromTableWithBundleIdentifier(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  void *v3;

  if (!a3)
    a3 = CFSTR("com.apple.AVFCore");
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", a3), "localizedStringForKey:value:table:", a1, CFSTR("xxxxDefaultValuexxxx"), a2);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("xxxxDefaultValuexxxx")))
    return 0;
  else
    return v3;
}

uint64_t AVLocalizedError(void *a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (objc_msgSend(a1, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", a1, a2, objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB3308])), "userInfo"), "mutableCopy");
    objc_msgSend(v6, "addEntriesFromDictionary:", a3);
    a3 = v6;
  }
  v7 = 0;
  v8 = CFSTR("AVErrorUnknown");
  v9 = 0;
  v10 = 0;
  switch(a2)
  {
    case -11999:
      v8 = CFSTR("AVErrorClientProgrammingError");
      goto LABEL_90;
    case -11998:
    case -11997:
    case -11996:
    case -11995:
    case -11994:
    case -11993:
    case -11992:
    case -11991:
    case -11990:
    case -11989:
    case -11988:
    case -11987:
    case -11986:
    case -11985:
    case -11984:
    case -11983:
    case -11982:
    case -11981:
    case -11980:
    case -11979:
    case -11978:
    case -11977:
    case -11976:
    case -11975:
    case -11974:
    case -11973:
    case -11972:
    case -11971:
    case -11970:
    case -11969:
    case -11968:
    case -11967:
    case -11966:
    case -11965:
    case -11964:
    case -11963:
    case -11962:
    case -11961:
    case -11960:
    case -11959:
    case -11958:
    case -11957:
    case -11956:
    case -11955:
    case -11954:
    case -11953:
    case -11952:
    case -11951:
    case -11950:
    case -11949:
    case -11948:
    case -11947:
    case -11946:
    case -11945:
    case -11944:
    case -11943:
    case -11942:
    case -11941:
    case -11940:
    case -11939:
    case -11938:
    case -11937:
    case -11936:
    case -11935:
    case -11934:
    case -11933:
    case -11932:
    case -11931:
    case -11930:
    case -11929:
    case -11928:
    case -11927:
    case -11926:
    case -11925:
    case -11924:
    case -11923:
    case -11922:
    case -11921:
    case -11920:
    case -11919:
    case -11918:
    case -11917:
    case -11916:
    case -11915:
    case -11914:
    case -11913:
    case -11912:
    case -11905:
    case -11902:
    case -11901:
    case -11899:
    case -11898:
    case -11897:
    case -11896:
    case -11895:
    case -11894:
    case -11893:
    case -11892:
    case -11891:
    case -11890:
    case -11889:
    case -11888:
    case -11887:
    case -11886:
    case -11885:
    case -11879:
    case -11874:
    case -11860:
    case -11851:
    case -11845:
    case -11844:
    case -11816:
    case -11802:
      goto LABEL_114;
    case -11911:
      v8 = CFSTR("AVErrorPointlessOverCapture");
      goto LABEL_90;
    case -11910:
      v8 = CFSTR("AVErrorOperationRequiresBothBudsInEar");
      goto LABEL_90;
    case -11909:
      v8 = CFSTR("AVErrorIncorrectPassword");
      goto LABEL_90;
    case -11908:
      v8 = CFSTR("AVErrorIncorrectPIN");
      goto LABEL_90;
    case -11907:
      v8 = CFSTR("AVErrorMediaDataWritingExceededPredeterminedSize");
      goto LABEL_90;
    case -11906:
      v8 = CFSTR("AVErrorFileWritingExceededPredeterminedSize");
      goto LABEL_90;
    case -11904:
      v8 = CFSTR("AVErrorRecordingNotAllowedWhenMultipleAppsAreForeground");
      goto LABEL_90;
    case -11903:
      v8 = CFSTR("AVErrorFileChecksumFailed");
      goto LABEL_90;
    case -11900:
      v8 = CFSTR("AVErrorInvalidFileAtDownloadDestinationURL");
      goto LABEL_90;
    case -11884:
      v8 = CFSTR("AVErrorSandboxExtensionDenied");
      goto LABEL_90;
    case -11883:
      v8 = CFSTR("AVErrorEncodeFailed");
      goto LABEL_90;
    case -11882:
      v8 = CFSTR("AVErrorAirPlayReceiverTemporarilyUnavailable");
      goto LABEL_90;
    case -11881:
      v8 = CFSTR("AVErrorFailedToLoadSampleData");
      goto LABEL_90;
    case -11880:
      v8 = CFSTR("AVErrorInvalidSampleCursor");
      goto LABEL_90;
    case -11878:
      v8 = CFSTR("AVErrorOperationCancelled");
      goto LABEL_90;
    case -11877:
      v8 = CFSTR("AVErrorRosettaNotInstalled");
      goto LABEL_90;
    case -11876:
      v8 = CFSTR("AVErrorSegmentStartedWithNonSyncSample");
      goto LABEL_90;
    case -11875:
      v8 = CFSTR("AVErrorIncorrectlyConfigured");
      goto LABEL_90;
    case -11873:
      v8 = CFSTR("AVErrorUnsupportedDeviceActiveFormat");
      goto LABEL_90;
    case -11872:
      v8 = CFSTR("AVErrorSessionHardwareCostOverage");
      goto LABEL_90;
    case -11871:
      v8 = CFSTR("AVErrorOperationNotSupportedForPreset");
      goto LABEL_90;
    case -11870:
      v8 = CFSTR("AVErrorExternalPlaybackNotSupportedForAsset");
      goto LABEL_90;
    case -11869:
      v8 = CFSTR("AVErrorNoSourceTrack");
      goto LABEL_90;
    case -11868:
      v8 = CFSTR("AVErrorNoCompatibleAlternatesForExternalDisplay");
      goto LABEL_90;
    case -11867:
      v8 = CFSTR("AVErrorNoLongerPlayable");
      goto LABEL_90;
    case -11866:
      v8 = CFSTR("AVErrorContentNotUpdated");
      goto LABEL_90;
    case -11865:
      v8 = CFSTR("AVErrorMalformedDepth");
      goto LABEL_90;
    case -11864:
      v8 = CFSTR("AVErrorFormatUnsupported");
      goto LABEL_90;
    case -11863:
      v8 = CFSTR("AVErrorContentIsUnavailable");
      goto LABEL_90;
    case -11862:
      v8 = CFSTR("AVErrorOperationNotAllowed");
      goto LABEL_90;
    case -11861:
      v8 = CFSTR("AVErrorUnsupportedOutputSettings");
      goto LABEL_90;
    case -11859:
      v8 = CFSTR("AVErrorRecordingAlreadyInProgress");
      goto LABEL_90;
    case -11858:
      v8 = CFSTR("AVErrorVideoCompositorFailed");
      goto LABEL_90;
    case -11857:
      v8 = CFSTR("AVErrorAirPlayReceiverRequiresInternet");
      goto LABEL_90;
    case -11856:
      v8 = CFSTR("AVErrorAirPlayControllerRequiresInternet");
      goto LABEL_90;
    case -11855:
      v8 = CFSTR("AVErrorUndecodableMediaData");
      goto LABEL_90;
    case -11854:
      v8 = CFSTR("AVErrorFileTypeDoesNotSupportSampleReferences");
      goto LABEL_90;
    case -11853:
      v8 = CFSTR("AVErrorFailedToParse");
      goto LABEL_90;
    case -11852:
      v8 = CFSTR("AVErrorApplicationIsNotAuthorizedToUseDevice");
      goto LABEL_90;
    case -11850:
      v8 = CFSTR("AVErrorServerIncorrectlyConfigured");
      goto LABEL_90;
    case -11849:
      v8 = CFSTR("AVErrorFailedToLoadMediaData");
      goto LABEL_90;
    case -11848:
      v8 = CFSTR("AVErrorIncompatibleAsset");
      goto LABEL_90;
    case -11847:
      v8 = CFSTR("AVErrorOperationInterrupted");
      goto LABEL_90;
    case -11846:
      v8 = CFSTR("AVErrorTorchLevelUnavailable");
      goto LABEL_90;
    case -11843:
      v8 = CFSTR("AVErrorInvalidOutputURLPathExtension");
      goto LABEL_90;
    case -11842:
      v8 = CFSTR("AVErrorReferenceForbiddenByReferencePolicy");
      goto LABEL_90;
    case -11841:
      v8 = CFSTR("AVErrorInvalidVideoComposition");
      goto LABEL_90;
    case -11840:
      v8 = CFSTR("AVErrorEncoderTemporarilyUnavailable");
      goto LABEL_90;
    case -11839:
      v8 = CFSTR("AVErrorDecoderTemporarilyUnavailable");
      goto LABEL_90;
    case -11838:
      v8 = CFSTR("AVErrorOperationNotSupportedForAsset");
      goto LABEL_90;
    case -11837:
      v8 = CFSTR("AVErrorDeviceIsNotAvailableInBackground");
      goto LABEL_90;
    case -11836:
      v8 = CFSTR("AVErrorApplicationIsNotAuthorized");
      goto LABEL_90;
    case -11835:
      v8 = CFSTR("AVErrorContentIsNotAuthorized");
      goto LABEL_90;
    case -11834:
      v8 = CFSTR("AVErrorEncoderNotFound");
      goto LABEL_90;
    case -11833:
      v8 = CFSTR("AVErrorDecoderNotFound");
      goto LABEL_90;
    case -11832:
      v8 = CFSTR("AVErrorNoImageAtTime");
      goto LABEL_90;
    case -11831:
      v8 = CFSTR("AVErrorContentIsProtected");
      goto LABEL_90;
    case -11830:
      v8 = CFSTR("AVErrorMaximumStillImageCaptureRequestsExceeded");
      goto LABEL_90;
    case -11829:
      v8 = CFSTR("AVErrorFileFailedToParse");
      goto LABEL_90;
    case -11828:
      v8 = CFSTR("AVErrorFileFormatNotRecognized");
      goto LABEL_90;
    case -11827:
      v8 = CFSTR("AVErrorInvalidCompositionTrackSegmentSourceDuration");
      goto LABEL_90;
    case -11826:
      v8 = CFSTR("AVErrorInvalidCompositionTrackSegmentSourceStartTime");
      goto LABEL_90;
    case -11825:
      v8 = CFSTR("AVErrorInvalidCompositionTrackSegmentDuration");
      goto LABEL_90;
    case -11824:
      v8 = CFSTR("AVErrorCompositionTrackSegmentsNotContiguous");
      goto LABEL_90;
    case -11823:
      v8 = CFSTR("AVErrorFileAlreadyExists");
      goto LABEL_90;
    case -11822:
      v8 = CFSTR("AVErrorInvalidSourceMedia");
      goto LABEL_90;
    case -11821:
      v8 = CFSTR("AVErrorDecodeFailed");
      goto LABEL_90;
    case -11820:
      v8 = CFSTR("AVErrorExportFailed");
      goto LABEL_90;
    case -11819:
      v8 = CFSTR("AVErrorMediaServicesWereReset");
      goto LABEL_90;
    case -11818:
      v8 = CFSTR("AVErrorSessionWasInterrupted");
      goto LABEL_90;
    case -11817:
      v8 = CFSTR("AVErrorDeviceLockedForConfigurationByAnotherProcess");
      goto LABEL_90;
    case -11815:
      v8 = CFSTR("AVErrorDeviceInUseByAnotherApplication");
      goto LABEL_90;
    case -11814:
      v8 = CFSTR("AVErrorDeviceNotConnected");
      goto LABEL_90;
    case -11813:
      v8 = CFSTR("AVErrorMaximumNumberOfSamplesForFileFormatReached");
      goto LABEL_90;
    case -11812:
      v8 = CFSTR("AVErrorMediaDiscontinuity");
      goto LABEL_90;
    case -11811:
      v8 = CFSTR("AVErrorMaximumFileSizeReached");
      goto LABEL_90;
    case -11810:
      v8 = CFSTR("AVErrorMaximumDurationReached");
      goto LABEL_90;
    case -11809:
      v8 = CFSTR("AVErrorMediaChanged");
      goto LABEL_90;
    case -11808:
      v8 = CFSTR("AVErrorDeviceWasDisconnected");
      goto LABEL_90;
    case -11807:
      v8 = CFSTR("AVErrorDiskFull");
      goto LABEL_90;
    case -11806:
      v8 = CFSTR("AVErrorSessionConfigurationChanged");
      goto LABEL_90;
    case -11805:
      v8 = CFSTR("AVErrorNoDataCaptured");
      goto LABEL_90;
    case -11804:
      v8 = CFSTR("AVErrorDeviceAlreadyUsedByAnotherSession");
      goto LABEL_90;
    case -11803:
      v8 = CFSTR("AVErrorSessionNotRunning");
      goto LABEL_90;
    case -11801:
      v8 = CFSTR("AVErrorOutOfMemory");
      goto LABEL_90;
    case -11800:
LABEL_90:
      v11 = (void *)objc_msgSend(a1, "stringByAppendingFormat:", CFSTR("_%@"), v8);
      v10 = v11;
      if (!v11)
      {
        v7 = 0;
        v9 = 0;
        goto LABEL_114;
      }
      v7 = AVLocalizedStringFromTable(objc_msgSend(v11, "stringByAppendingString:", CFSTR("_Description")), (uint64_t)CFSTR("AVError"));
      v9 = AVLocalizedStringFromTable(objc_msgSend(v10, "stringByAppendingString:", CFSTR("_FailureReason")), (uint64_t)CFSTR("AVError"));
      v10 = AVLocalizedStringFromTable(objc_msgSend(v10, "stringByAppendingString:", CFSTR("_RecoverySuggestion")), (uint64_t)CFSTR("AVError"));
      if (!objc_msgSend(a1, "isEqualToString:", CFSTR("AVFoundationErrorDomain")))
        goto LABEL_114;
      if (a2 <= -11818)
      {
        if (a2 == -11854)
        {
          v23 = objc_msgSend(a3, "objectForKey:", CFSTR("AVErrorFileTypeKey"));
          if (v23)
          {
            v24 = v23;
            v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v23), "localizedDescription");
            if (v25)
              v26 = v25;
            else
              v26 = v24;
          }
          else
          {
            v26 = 0;
          }
          if (v9)
          {
            v13 = (void *)MEMORY[0x1E0CB3940];
            v28 = v26;
            v29 = 0;
            goto LABEL_112;
          }
          goto LABEL_114;
        }
        if (a2 != -11852)
        {
          if (a2 == -11837)
          {
            v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVErrorDeviceKey")), "localizedName");
            v29 = 0;
            if (v7)
              v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), &v29, v12);
            if (v9)
              goto LABEL_111;
          }
          goto LABEL_114;
        }
      }
      else
      {
        if (a2 > -11805)
        {
          if (a2 == -11804)
          {
            v27 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVErrorDeviceKey")), "localizedName");
            if (v10)
            {
              v29 = 0;
              v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v29, v27);
            }
          }
          else if (a2 == -11800)
          {
            v21 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB3388]);
            v22 = v21 ? objc_msgSend(v21, "code") : 4294955496;
            if (v9)
            {
              v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%d"), &v29, v22, 0);
              goto LABEL_113;
            }
          }
          goto LABEL_114;
        }
        if (a2 != -11817 && a2 != -11815)
          goto LABEL_114;
      }
      v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVErrorDeviceKey")), "localizedName");
      if (v7)
      {
        v29 = 0;
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), &v29, v12);
      }
      if (v10)
      {
        v29 = 0;
        v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v29, v12);
      }
      if (v9)
      {
        v29 = 0;
LABEL_111:
        v13 = (void *)MEMORY[0x1E0CB3940];
        v28 = v12;
LABEL_112:
        v14 = objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v29, v28, v29);
LABEL_113:
        v9 = (void *)v14;
      }
LABEL_114:
      if (a3)
        v15 = (id)objc_msgSend(a3, "mutableCopy");
      else
        v15 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v16 = v15;
      if (v7)
      {
        v17 = *MEMORY[0x1E0CB2D50];
        if (!objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2D50]))
          objc_msgSend(v16, "setObject:forKey:", v7, v17);
      }
      if (v9)
      {
        v18 = *MEMORY[0x1E0CB2D68];
        if (!objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2D68]))
          objc_msgSend(v16, "setObject:forKey:", v9, v18);
      }
      if (v10)
      {
        v19 = *MEMORY[0x1E0CB2D80];
        if (!objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2D80]))
          objc_msgSend(v16, "setObject:forKey:", v10, v19);
      }
      return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a1, a2, v16);
    default:
      v9 = 0;
      v10 = 0;
      goto LABEL_114;
  }
}

void *AVLocalizedStringFromTable(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AVFCore")), "localizedStringForKey:value:table:", a1, CFSTR("xxxxDefaultValuexxxx"), a2);
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("xxxxDefaultValuexxxx")))
    return 0;
  else
    return v2;
}

void sub_1933F2164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F2514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F26C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F27A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F2FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_31(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1088) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 967) = result;
  return result;
}

void sub_1933F3254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F3324(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933F3478(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1933F3CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_gAVOutputDeviceRouteDiscoverer_Once != -1)
    dispatch_once(&AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_gAVOutputDeviceRouteDiscoverer_Once, &__block_literal_global_21);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_block_invoke_2;
  v4[3] = &unk_1E3031EB8;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)gAVOutputDeviceRouteDiscovererQueue, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void figCustomURLHandlerHandleRequestForNSURLSession(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _QWORD, uint64_t), uint64_t a6)
{
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;

  v11 = (void *)MEMORY[0x1940343FC]();
  v13 = 0;
  v12 = objc_msgSend(a1, "_handleRequest:requestID:canHandleRequestOut:", a3, a4, &v13);
  a5(a6, v13, v12);
  objc_autoreleasePoolPop(v11);
}

uint64_t __getTypeAccessMutex_block_invoke()
{
  uint64_t result;

  result = FigReentrantMutexCreate();
  getTypeAccessMutex_sTypeAccessMutex = result;
  return result;
}

void sub_1933F4C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1933F5248(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1933F5548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F56D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F57A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F6414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1933F64FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F6710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F68DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ensureSupportedFormatsChangedNotificationRegistered_block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  objc_opt_class();
  return CMNotificationCenterAddListener();
}

uint64_t publicCriteriaAreExceptional(void *a1, void *a2, void *a3, void *a4, const __CFString **a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  __int128 v27;
  __int128 v28;
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
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(a1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if (!a5)
      return 1;
    v26 = CFSTR("preferredLanguages must contain only items of type NSString");
  }
  else
  {
LABEL_9:
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
LABEL_11:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(a2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v15)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      if (!a5)
        return 1;
      v26 = CFSTR("preferredMediaCharacteristics must contain only items of type NSString");
    }
    else
    {
LABEL_17:
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
LABEL_19:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(a3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
            if (v19)
              goto LABEL_19;
            goto LABEL_25;
          }
        }
        if (!a5)
          return 1;
        v26 = CFSTR("principalMediaCharacteristics must contain only items of type NSString");
      }
      else
      {
LABEL_25:
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        result = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
        if (!result)
          return result;
        v23 = result;
        v24 = *(_QWORD *)v28;
LABEL_27:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(a4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (v23 == ++v25)
          {
            v23 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
            result = 0;
            if (v23)
              goto LABEL_27;
            return result;
          }
        }
        if (!a5)
          return 1;
        v26 = CFSTR("premiumMediaCharacteristics must contain only items of type NSString");
      }
    }
  }
  *a5 = v26;
  return 1;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __n128 *v3;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 436;
  v2 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)v1 = v2;
  v3 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 412);
  result = *(__n128 *)(a1 + 64);
  v3[1].n128_u64[0] = *(_QWORD *)(a1 + 80);
  *v3 = result;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_21(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 460);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_20(uint64_t a1)
{
  id v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 144) = objc_msgSend(*(id *)(a1 + 40), "copy");
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1352);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1352) = objc_msgSend(*(id *)(a1 + 48), "copy");

}

void __avplayeritem_fpItemNotificationCallback_block_invoke_19(uint64_t a1)
{
  void *v2;
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("tracks"));
  block[0] = MEMORY[0x1E0C809B0];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  block[1] = 3221225472;
  block[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_20;
  block[3] = &unk_1E302FD88;
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 48);
  av_readwrite_dispatch_queue_write(v4, block);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("tracks"));
  v5 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemTracksDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);
  objc_autoreleasePoolPop(v2);
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_18(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[7];

  v2 = (void *)MEMORY[0x1940343FC]();
  v4 = a1[4];
  v3 = (_QWORD *)a1[5];
  if (v4)
    v5 = objc_msgSend(v3, "_tracksWithFPTrackIDArray:fromFigPlaybackItem:", v4, *(_QWORD *)(v3[1] + 120));
  else
    v5 = objc_msgSend(v3, "_tracks");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_19;
  block[3] = &unk_1E302FD88;
  v6 = a1[6];
  block[4] = a1[5];
  block[5] = v5;
  block[6] = a1[7];
  dispatch_async(v6, block);
  v7 = a1[6];
  if (v7)
    dispatch_release(v7);
  objc_autoreleasePoolPop(v2);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_14(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 961) = 0;
  return result;
}

void *AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "addObject:", AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)));
      }
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return v2;
}

uint64_t AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(uint64_t a1)
{
  uint64_t result;

  if (AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDictOnce != -1)
    dispatch_once(&AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDictOnce, &__block_literal_global_8);
  result = objc_msgSend((id)AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDict, "objectForKey:", a1);
  if (!result)
    return a1;
  return result;
}

void AVPlayerItemVideoOutput_timebaseNotificationCallback(uint64_t a1, uint64_t a2, const void *a3)
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];

  v5 = (void *)MEMORY[0x1940343FC]();
  v6 = *(_QWORD *)(a2 + 16);
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA2E78]))
  {
    v7 = *(NSObject **)(v6 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __AVPlayerItemVideoOutput_timebaseNotificationCallback_block_invoke;
    v8[3] = &unk_1E302FCE8;
    v8[4] = v6;
    v8[5] = a2;
    dispatch_sync(v7, v8);
  }
  objc_autoreleasePoolPop(v5);
}

void *AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(void *result)
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(result, "isEqualToString:", CFSTR("AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted")))
    {
      v2 = MEMORY[0x1E0CA53A0];
      return *(void **)v2;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("AVCoordinatedPlaybackSuspensionReasonStallRecovery")))
    {
      v2 = MEMORY[0x1E0CA53D0];
      return *(void **)v2;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial")))
    {
      v2 = MEMORY[0x1E0CA53B8];
      return *(void **)v2;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("AVCoordinatedPlaybackSuspensionReasonUserActionRequired")))
    {
      v2 = MEMORY[0x1E0CA53D8];
      return *(void **)v2;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible")))
    {
      v2 = MEMORY[0x1E0CA53B0];
      return *(void **)v2;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime")))return (void *)*MEMORY[0x1E0CA53A8];
    else
      return v1;
  }
  return result;
}

void AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue(void *a1, NSObject *a2, uint64_t a3)
{
  BOOL v6;
  _QWORD block[7];
  dispatch_object_t v8;
  id v9;

  v8 = 0;
  v9 = 0;
  objc_msgSend(a1, "getRetainedDelegate:retainedDelegateQueue:", &v9, &v8);
  if (v8)
    v6 = v8 == a2;
  else
    v6 = 1;
  if (v6)
  {
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v9);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue_block_invoke;
    block[3] = &unk_1E3031070;
    block[4] = a1;
    block[5] = v8;
    block[6] = a3;
    dispatch_async(v8, block);
  }

  if (v8)
    dispatch_release(v8);
}

void AVFigPlaybackItemNotificationCallback_TaggedMetadataArrayChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_updateTaggedMetadataArray:", objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F18]));
  objc_autoreleasePoolPop(v7);
}

void sub_1933F9C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F9D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933F9FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1933FA0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FA2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FA4D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1933FAA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FBAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FBB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FD980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FDA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FDD48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1933FDF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FE03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1933FFB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1933FFFD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934004A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDiscovererFactorySetFactoryForQueue(NSObject *a1, void *a2)
{
  dispatch_queue_set_specific(a1, CFSTR("AVCurrentRouteDiscovererFactoryKey"), a2, AVFigRouteDiscovererFactoryReleaseObject);
}

id _animationByTransformingValues(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (id)objc_msgSend(a1, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "fromValue");
    v5 = objc_msgSend(v3, "toValue");
    v6 = objc_msgSend(v3, "byValue");
    if (v4)
      objc_msgSend(v3, "setFromValue:", (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v4));
    if (v5)
      objc_msgSend(v3, "setToValue:", (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5));
    if (v6)
      objc_msgSend(v3, "setByValue:", (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v6));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v3, "values");
      if (v7)
      {
        v8 = v7;
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v8);
              objc_msgSend(v9, "addObject:", (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++)));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v11);
        }
        objc_msgSend(v3, "setValues:", v9);
      }
    }
  }
  return v3;
}

void sub_193403640(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_193403D74(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void *AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(void *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "sublayers");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v5, "addEntriesFromDictionary:", AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), objc_msgSend(a2, "indexPathByAddingIndex:", objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9)))));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v5, "setObject:forKey:", a1, a2);
    }
  }
  return v5;
}

void sub_1934045A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934052C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _avplLoopingItemFailedToPlayToEndTimeNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  if (a4
    && objc_msgSend((id)objc_msgSend(a2, "loopingPlayerItems"), "indexOfObjectIdenticalTo:", a4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a2, "_changeStatusToFailedWithError:", objc_msgSend(a5, "objectForKey:", CFSTR("AVPlayerItemFailedToPlayToEndTimeErrorKey")));
    objc_msgSend(a2, "_turnOffLooping");
  }
  objc_autoreleasePoolPop(v8);
}

void sub_193405BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193405D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193405E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934061A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CMTimeEpoch CMTimeHash(CMTime *a1)
{
  CMTimeFlags flags;
  CMTime v3;
  CMTime v4;

  flags = a1->flags;
  if ((~flags & 5) == 0)
    return 1;
  if ((~flags & 9) == 0)
    return 2;
  if ((~flags & 0x11) == 0)
    return 3;
  if ((a1->flags & 0x1D) != 1)
    return 0;
  memset(&v4, 0, sizeof(v4));
  v3 = *a1;
  CMTimeConvertScale(&v4, &v3, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v4.epoch ^ v4.value;
}

void sub_1934081F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19340833C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934085DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t handleCaptionConversionWarning(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "referencedObject"), "_issueWarningForFigDictionary:", a1);
  return 0;
}

void sub_1934088CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934089D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19340D7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19340D9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19340DB64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t initAVMetadataMakeMetadataObjectFromBoxedMetadata(uint64_t a1, uint64_t a2, __int128 *a3, __int128 *a4)
{
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  if (AVFCaptureLibrary_sOnce != -1)
    dispatch_once(&AVFCaptureLibrary_sOnce, &__block_literal_global_366);
  softLinkAVMetadataMakeMetadataObjectFromBoxedMetadata[0] = (uint64_t (*)())dlsym((void *)AVFCaptureLibrary_sLib, "AVMetadataMakeMetadataObjectFromBoxedMetadata");
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  v9 = *a4;
  v10 = *((_QWORD *)a4 + 2);
  return ((uint64_t (*)(uint64_t, uint64_t, __int128 *, __int128 *))softLinkAVMetadataMakeMetadataObjectFromBoxedMetadata[0])(a1, a2, &v11, &v9);
}

uint64_t initAVMetadataMakeDependentSpecificationsForValue(uint64_t a1)
{
  if (AVFCaptureLibrary_sOnce != -1)
    dispatch_once(&AVFCaptureLibrary_sOnce, &__block_literal_global_366);
  softLinkAVMetadataMakeDependentSpecificationsForValue[0] = (uint64_t (*)())dlsym((void *)AVFCaptureLibrary_sLib, "AVMetadataMakeDependentSpecificationsForValue");
  return ((uint64_t (*)(uint64_t))softLinkAVMetadataMakeDependentSpecificationsForValue[0])(a1);
}

uint64_t appendCaptionGroupToQueue(const __CFArray *a1, _OWORD *a2, void *a3)
{
  void *v6;
  CFIndex Count;
  void *v8;
  uint64_t v9;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v11;
  CFIndex v12;
  const void *ValueAtIndex;
  id v14;
  uint64_t CMBaseObject;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  uint64_t v17;
  const void *Value;
  const void *v19;
  void *v20;
  AVCaptionGroup *v21;
  __int128 v22;
  uint64_t v23;
  _OWORD *v25;
  void *context;
  void *key;
  uint64_t v28;
  _OWORD v29[3];
  CFTypeRef cf;

  v6 = (void *)MEMORY[0x1940343FC]();
  cf = 0;
  Count = CFArrayGetCount(a1);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
  v9 = *MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Count, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v11 = Mutable;
    v25 = a2;
    context = v6;
    if (Count)
    {
      v12 = 0;
      v28 = *MEMORY[0x1E0CA3360];
      key = (void *)*MEMORY[0x1E0CA3550];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, v12);
        v14 = (id)objc_msgSend(a3, "pairedAVCaptionForFigCaption:", ValueAtIndex);
        if (!v14)
        {
          v14 = +[AVCaption captionFromFigCaption:](AVCaption, "captionFromFigCaption:", ValueAtIndex);
          if (objc_msgSend(a3, "validationDelegate"))
          {
            if (cf)
            {
              CFRelease(cf);
              cf = 0;
            }
            CMBaseObject = FigCaptionGetCMBaseObject();
            v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
            if (!v16)
            {
              v23 = 4294954514;
              goto LABEL_17;
            }
            v17 = v16(CMBaseObject, v28, v9, &cf);
            if ((_DWORD)v17)
            {
              v23 = v17;
              goto LABEL_17;
            }
            if (cf)
            {
              Value = CFDictionaryGetValue((CFDictionaryRef)cf, key);
              if (Value)
              {
                v19 = Value;
                v20 = (void *)objc_msgSend(a3, "validationDelegate");
                if (v20)
                  objc_msgSend(v20, "captionAdaptor:didVendCaption:skippingUnsupportedSourceSyntaxElements:", a3, v14, v19);
              }
            }
          }
        }
        objc_msgSend(v8, "addObject:", v14, v25);
        CFDictionaryAddValue(v11, ValueAtIndex, v14);
        ++v12;
      }
      while (Count != v12);
    }
    v21 = [AVCaptionGroup alloc];
    v22 = v25[1];
    v29[0] = *v25;
    v29[1] = v22;
    v29[2] = v25[2];
    objc_msgSend(a3, "appendOutputCaptionGroup:", -[AVCaptionGroup initWithCaptions:timeRange:](v21, "initWithCaptions:timeRange:", v8, v29));
    objc_msgSend(a3, "setFigCaptionToAVCaptionMapping:", v11);
    v23 = 0;
LABEL_17:
    CFRelease(v11);
    v6 = context;
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v23 = FigSignalErrorAt();
  }
  objc_autoreleasePoolPop(v6);
  return v23;
}

void sub_19340F984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19340F9DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAssetShouldPreferNominalDurations(void *a1, uint64_t a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "objectForKey:", a2);
  if (v2)
    return objc_msgSend(v2, "BOOLValue");
  else
    return dyld_program_sdk_at_least() ^ 1;
}

uint64_t figAssetCreationFlagsForAssetReferenceRestrictionsAsNumber(void *a1)
{
  if (a1)
    return 4 * (objc_msgSend(a1, "unsignedIntegerValue") & 0xF);
  else
    return 8;
}

void sub_193412618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t figAssetCreationFlagsForAssetReferenceRestrictions(char a1)
{
  return 4 * (a1 & 0xF);
}

uint64_t figAssetDefaultCreationFlags()
{
  return 8;
}

void avasset_formatsChangedNotificationCallback()
{
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  MEMORY[0x194033A30](getTypeAccessMutex_sTypeAccessMutex);

  gUTTypes = 0;
  gFileUTTypes = 0;

  gStreamingUTTypes = 0;
  gFigMIMETypes = 0;
  if (getTypeAccessMutex_onceToken != -1)
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_853);
  JUMPOUT(0x194033A48);
}

void aig_didGenerateCGImage(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_didGenerateCGImage:", a5);
  objc_autoreleasePoolPop(v7);
}

void aig_failedToGenerateCGImage(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_failedToGenerateCGImage:", a5);
  objc_autoreleasePoolPop(v7);
}

void aig_serverDied(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_serverDied");
  objc_autoreleasePoolPop(v3);
}

void sub_1934160EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void assetTrackNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3C00]))
  {
    v9 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3900]);
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC6078]))
    {
      if (objc_msgSend((id)objc_opt_class(), "expectsPropertyRevisedNotifications"))
      {
        v10 = (void *)MEMORY[0x1E0CB37C0];
        v11 = CFSTR("AVAssetTrackTimeRangeDidChangeNotification");
LABEL_17:
        v14 = objc_msgSend(v10, "notificationWithName:object:userInfo:", v11, a2, 0);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v14);
      }
    }
    else if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3C10]) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3C50]))
    {
      if (objc_msgSend((id)objc_opt_class(), "expectsPropertyRevisedNotifications"))
      {
        v12 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVAssetTrackSegmentsDidChangeNotification"), a2, 0);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v12);
      }
      if (objc_msgSend((id)objc_msgSend(a2, "asset"), "_needsLegacyChangeNotifications"))
      {
        v13 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVFragmentedMovieTrackTimeRangeDidChangeNotification"), a2, 0);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v13);
        v10 = (void *)MEMORY[0x1E0CB37C0];
        v11 = CFSTR("AVFragmentedMovieTrackSegmentsDidChangeNotification");
        goto LABEL_17;
      }
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3C70]))
      {
        v10 = (void *)MEMORY[0x1E0CB37C0];
        v11 = CFSTR("AVAssetTrackTrackAssociationsDidChangeNotification");
        goto LABEL_17;
      }
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3C60]) & 1) != 0
        || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3C68]) & 1) != 0
        || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3C30]))
      {
        v10 = (void *)MEMORY[0x1E0CB37C0];
        v11 = CFSTR("AVAssetTrackMetadataDidChangeNotification");
        goto LABEL_17;
      }
    }
  }
  objc_autoreleasePoolPop(v8);
}

AVCaptionDimension AVCaptionDimensionMake(CGFloat value, AVCaptionUnitsType units)
{
  AVCaptionDimension result;

  result.units = units;
  result.value = value;
  return result;
}

AVCaptionPoint *__cdecl AVCaptionPointMake(AVCaptionPoint *__return_ptr retstr, AVCaptionDimension x, AVCaptionDimension y)
{
  retstr->x = x;
  retstr->y = y;
  return *(AVCaptionPoint **)&x.value;
}

AVCaptionSize *__cdecl AVCaptionSizeMake(AVCaptionSize *__return_ptr retstr, AVCaptionDimension width, AVCaptionDimension height)
{
  retstr->width = width;
  retstr->height = height;
  return *(AVCaptionSize **)&width.value;
}

uint64_t _convertFigGeometryDimensionToAVCaptionDimension(uint64_t a1, uint64_t a2)
{
  if (a2 == 2 || a2 == 1)
    return FigGeometryDimensionMake();
  else
    return *MEMORY[0x1E0CA4AC8];
}

void avplayer_iapdNotificationCallback(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[4];
  char v11;

  v4 = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a2);
  if (v4)
  {
    v5 = v4;
    if (a3)
      CFRetain(a3);
    v6 = objc_msgSend((id)objc_opt_class(), "isIAPDExtendedModeActive");
    if (AVPlayerInitializeIAPD_onceToken != -1)
      dispatch_once(&AVPlayerInitializeIAPD_onceToken, &__block_literal_global_1125);
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __AVPlayerSetCachedIAPDModeActive_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v11 = v6;
    av_readwrite_dispatch_queue_write((dispatch_queue_t)sAVPlayerIAPDReadWriteQueue, block);
    v8 = *(NSObject **)(*(_QWORD *)(v5 + 8) + 32);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __avplayer_iapdNotificationCallback_block_invoke;
    v9[3] = &unk_1E302FE78;
    v9[4] = v5;
    v9[5] = a3;
    dispatch_async(v8, v9);
  }
}

void sub_19341F354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19341F7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVPlayerFindItemMatchingFigPlaybackItem(void *a1, const void *a2, _QWORD *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  const void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a1);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "_copyFigPlaybackItem");
        if ((const void *)v12 == a2)
        {
          if (a2)
            CFRelease(a2);
          if (a3 && v11)
            *a3 = v6;
          return v11;
        }
        v13 = (const void *)v12;
        objc_msgSend(v6, "addObject:", v11);
        if (v13)
          CFRelease(v13);
      }
      v8 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  return 0;
}

uint64_t FigPlayerCopyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  FigBaseObject = FigPlayerGetFigBaseObject();
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v8)
    return v8(FigBaseObject, a2, a3, a4);
  else
    return 4294954514;
}

void sub_193420BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934211F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193421698(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_193421EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934223BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934229EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193422D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342308C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934232D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934237F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934238BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193423B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193423E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193424320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193424638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193424A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_193424CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_193425464(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void avplayer_fpInterstitialCoordinatorNotificationCallback(uint64_t a1, _QWORD *a2, const void *a3, uint64_t a4, const void *a5)
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[8];

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a2, "_nameForLogging");
  if (a3)
    CFRetain(a3);
  if (a5)
    CFRetain(a5);
  v10 = *(NSObject **)(a2[1] + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke;
  v11[3] = &unk_1E3031B58;
  v11[4] = a2;
  v11[5] = v9;
  v11[6] = a3;
  v11[7] = a5;
  dispatch_async(v10, v11);
  objc_autoreleasePoolPop(v8);
}

void sub_193425B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t avplayer_displayModeChanged()
{
  return +[AVPlayer checkForAvailableHDRModesChanges](AVPlayer, "checkForAvailableHDRModesChanges");
}

void sub_193425D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193425F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193426218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934265A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193426834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193426C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193427828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193427A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193427EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193428174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934284C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193428750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934289DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193428CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193428FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193429208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342949C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193429728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193429918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193429B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193429DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342A0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342A338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342A5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342A6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342A940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342ABA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342AC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342AEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342AFF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19342B364(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19342B610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342B948(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19342BC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19342BEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342BFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342C3F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19342C5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342CB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  NSObject *v7;
  const void *v8;
  const void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v11[4];
  __int128 v12;
  _QWORD *v13;
  _QWORD block[8];
  _QWORD v15[4];
  __int128 v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1940343FC]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "_hasCurrentInterstitialEvent");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_2;
  v15[3] = &unk_1E3031AE0;
  v17 = v3;
  v16 = *(_OWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(v16 + 8) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_3;
  block[3] = &unk_1E3031B08;
  block[4] = v16;
  block[5] = v15;
  block[6] = &v22;
  block[7] = &v18;
  av_readwrite_dispatch_queue_read(v5, block);
  if (*((_BYTE *)v23 + 24) || *((_BYTE *)v19 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("timeControlStatus"));
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
    v11[0] = v4;
    v6 = *(_OWORD *)(a1 + 32);
    v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
    v11[1] = 3221225472;
    v11[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_4;
    v11[3] = &unk_1E3031B30;
    v13 = v15;
    v12 = v6;
    av_readwrite_dispatch_queue_write(v7, v11);
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("timeControlStatus"));
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("reasonForWaitingToPlay"));
  }
  else if (dword_1ECDECF38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  objc_autoreleasePoolPop(v2);
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 56);
  if (v9)
    CFRelease(v9);
}

void sub_19342CE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "rateStateByUpdatingBasedOnFigPlayer:hasCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728), a3, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  char v8;

  v2 = *(void **)(*(_QWORD *)(a1[4] + 8) + 488);
  v3 = objc_msgSend(v2, "timeControlStatus");
  v4 = (void *)objc_msgSend(v2, "reasonForWaitingToPlay");
  v5 = (void *)(*(uint64_t (**)(_QWORD, void *, BOOL))(a1[5] + 16))(a1[5], v2, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 176) != 0);
  v6 = objc_msgSend(v5, "timeControlStatus");
  result = objc_msgSend(v5, "reasonForWaitingToPlay");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3 != v6;
  if (v4 == (void *)result)
  {
    v8 = 0;
  }
  else
  {
    result = objc_msgSend(v4, "isEqual:", result);
    v8 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v8;
  return result;
}

void __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;

  v2 = (void *)(*(uint64_t (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 176) != 0);
  if (dword_1ECDECF38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 488) = v2;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 395) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 468) = *(_BYTE *)(result + 40) != 0;
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 467) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 466) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 464) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_7(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 466) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 470) = *(_BYTE *)(result + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 472) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_9(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 465) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_10(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 557) = *(_BYTE *)(result + 40) != 0;
  return result;
}

id __avplayer_fpNotificationCallback_block_invoke_11(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 560) = result;
  return result;
}

void __avplayer_iapdNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  const void *v4;
  void (*v5[5])(_QWORD);

  v2 = (void *)MEMORY[0x1940343FC]();
  v3 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v3[1] + 728) && objc_msgSend((id)objc_msgSend(v3, "_videoLayers"), "count"))
  {
    v5[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(_QWORD))3221225472;
    v5[2] = __avplayer_iapdNotificationCallback_block_invoke_2;
    v5[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v5[4] = *(void (**)(_QWORD))(a1 + 32);
    AVEnsureNotOnMainThread(v5);
  }
  objc_autoreleasePoolPop(v2);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

void __avplayer_iapdNotificationCallback_block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldDetachVideoLayersFromFigPlayer");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(v3 + 8) + 32);
  if (v2)
  {
    v8 = MEMORY[0x1E0C809B0];
    v5 = __avplayer_iapdNotificationCallback_block_invoke_3;
    v6 = &v8;
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v5 = __avplayer_iapdNotificationCallback_block_invoke_4;
    v6 = &v7;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_1E302FA10;
  v6[4] = v3;
  AVSerializeOnQueueAsyncIfNecessary(v4, (void (**)(_QWORD))v6);
}

uint64_t __avplayer_iapdNotificationCallback_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_detachVideoLayersFromFigPlayer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 728));
}

uint64_t __avplayer_iapdNotificationCallback_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attachVideoLayersToFigPlayer");
}

id avplayer_interstitial_WrapperToPlayerItem(uint64_t a1, uint64_t a2, void *a3)
{
  if (objc_msgSend(a3, "_isFigItemConfigured"))
    return (id)objc_msgSend(a3, "_copyFigPlaybackItem");
  else
    return 0;
}

uint64_t avplayer_interstitial_WrapperToEvent(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "figEvent");
}

id avplayer_interstitial_WrapperToEventPrimaryItem(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "primaryItem");
  if (objc_msgSend(v3, "_isFigItemConfigured"))
    return (id)objc_msgSend(v3, "_copyFigPlaybackItem");
  else
    return 0;
}

uint64_t avplayer_interstitial_PlayerItemWrapperToFigAsset(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
    return objc_msgSend((id)objc_msgSend(a3, "asset"), "_figAsset");
  else
    return 0;
}

uint64_t avplayer_interstitial_CreateWrapEvent(uint64_t a1, uint64_t a2, uint64_t a3, const __CFArray *a4, _QWORD *a5)
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFArray *v12;
  CFIndex Count;
  void *v14;
  uint64_t CMBaseObject;
  uint64_t (*v16)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v17;
  BOOL v18;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeRef cf;

  v8 = (void *)FigPlayerInterstitialEventCopyPrimaryItem();
  v9 = (void *)objc_msgSend(v8, "asset");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "httpSessionIdentifier");
  else
    v10 = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (const __CFArray *)FigPlayerInterstitialEventCopyInterstitialAssetURLs();
  if (a4 && CFArrayGetCount(a4) > 0 || (a4 = v12) != 0)
    Count = CFArrayGetCount(a4);
  else
    Count = 0;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  cf = 0;
  objc_msgSend(v9, "_figAsset");
  if (!v8)
  {
    v17 = 4294951625;
    if (!v12)
      return v17;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("AVURLAssetPrimarySessionIdentifierKey"));
  CMBaseObject = FigAssetGetCMBaseObject();
  v16 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v16)
  {
    v17 = v16(CMBaseObject, *MEMORY[0x1E0CC39A0], *MEMORY[0x1E0C9AE00], &cf);
    if ((_DWORD)v17)
      v18 = 1;
    else
      v18 = cf == 0;
    if (!v18)
    {
      objc_msgSend(v11, "setObject:forKey:");
      if (cf)
        CFRelease(cf);
      v17 = 0;
    }
  }
  else
  {
    v17 = 4294954514;
  }
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
      if (ValueAtIndex)
        objc_msgSend(v14, "addObject:", +[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", ValueAtIndex, v11)));
    }
  }
  *a5 = -[AVPlayerInterstitialEvent initWithPrimaryItemAndFigEvent:templateItems:figEvent:]([AVPlayerInterstitialEvent alloc], "initWithPrimaryItemAndFigEvent:templateItems:figEvent:", v8, v14, a3);
  CFRelease(v8);
  if (v12)
LABEL_27:
    CFRelease(v12);
  return v17;
}

uint64_t avplayer_interstitial_CreateAndEnqueueItems(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 *a9, uint64_t a10, __CFArray **a11)
{
  void *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  __CFArray *theArray;
  id obj;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v15 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  if ((void *)objc_msgSend(a2, "_interstitialPlayerIfCreated") == a4)
  {
    if (a8)
      objc_msgSend(v15, "setMultichannelAudioStrategy:", a8);
    theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v17 = (void *)objc_msgSend(a3, "_internalTemplateItems");
    v36 = objc_msgSend(a3, "_participatesInCoordinatedPlayback");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v17;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v18)
    {
      v19 = v18;
      v21 = *(_QWORD *)v46;
      v34 = a7;
      v35 = a5;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(obj);
          if (a10)
          {
            --a10;
            continue;
          }
          v23 = v15;
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v25 = (void *)objc_msgSend(v24, "asset");
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v26 = (void *)objc_msgSend(v25, "creationOptions");
          else
            v26 = 0;
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "objectForKey:", CFSTR("AVURLAssetPrimarySessionIdentifierKey")), "UUIDString"), "isEqualToString:", a6))
          {
            if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE2B82F0))
            {
              v28 = (void *)objc_msgSend(v25, "contentKeySession");
              if (v26)
                goto LABEL_18;
LABEL_20:
              v29 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            }
            else
            {
              v28 = 0;
              if (!v26)
                goto LABEL_20;
LABEL_18:
              v29 = (id)objc_msgSend(v26, "mutableCopy");
            }
            v30 = v29;
            v15 = v23;
            objc_msgSend(v29, "setValue:forKey:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a6), CFSTR("AVURLAssetPrimarySessionIdentifierKey"));
            v31 = (id)objc_msgSend(v24, "copyWithZone:newAssetOptions:", 0, v30);
            v27 = v31;
            if (v28)
              objc_msgSend(v28, "addContentKeyRecipient:", objc_msgSend(v31, "asset"));
            a7 = v34;
            a5 = v35;
            goto LABEL_24;
          }
          v27 = (id)objc_msgSend(v24, "copy");
          v15 = v23;
LABEL_24:
          objc_msgSend(v27, "setAutomaticallyHandlesInterstitialEvents:", 0);
          objc_msgSend(v27, "_setTemplatePlayerItem:", v24);
          objc_msgSend(v27, "_setInterstitialEventID:", a5);
          objc_msgSend(v27, "_setCoordinatorIdentifier:", a7);
          objc_msgSend(v27, "_setParticipatesInCoordinatedPlayback:", v36);
          CFArrayAppendValue(theArray, v27);
          if ((*((_BYTE *)a9 + 12) & 1) != 0)
          {
            v43 = *a9;
            v44 = *((_QWORD *)a9 + 2);
            v41 = *MEMORY[0x1E0CA2E68];
            v42 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            v39 = v41;
            v40 = v42;
            objc_msgSend(v27, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v43, &v41, &v39, 0);
            v32 = MEMORY[0x1E0CA2E18];
            *a9 = *MEMORY[0x1E0CA2E18];
            *((_QWORD *)a9 + 2) = *(_QWORD *)(v32 + 16);
          }
          objc_msgSend(v15, "insertItem:afterItem:", v27, 0);
          a10 = 0;
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v19);
    }
    *a11 = theArray;
  }
  return 0;
}

uint64_t avplayer_interstitial_DequeueItem(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if ((void *)objc_msgSend(a2, "_interstitialPlayerIfCreated") == a4)
    objc_msgSend(a4, "removeItem:", a3);
  return 0;
}

uint64_t avplayer_interstitial_ShowInterstitialInstead(double a1, uint64_t a2, void *a3, int a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (void *)objc_msgSend(a3, "_avPlayerLayers");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    LOBYTE(v11) = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "_setShowInterstitialInstead:afterDelay:", a4 != 0, a1);
        if ((v11 & 1) != 0)
          v11 = objc_msgSend(v13, "_showInterstitialInstead");
        else
          v11 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = (void *)objc_msgSend(a3, "_playerCaptionLayers", 0);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "_setShowInterstitialInstead:", a4 != 0);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }
  return v11;
}

uint64_t avplayer_playbackcoordinator_SetPlaybackCoordinatorInterstitialActive(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  v4 = (void *)objc_msgSend(a2, "_playbackCoordinatorWithoutTriggeringFullSetup");
  if (v4)
    objc_msgSend(v4, "_setInterstitialActive:", a3);
  return 0;
}

void sub_19342E0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342E850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342E94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342EB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19342EE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avplayerinterstitialeventmonitor_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;

  v8 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC56D0]))
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)MEMORY[0x1E0CB37C0];
    v11 = CFSTR("EventsDidChangeNotification");
LABEL_5:
    v12 = objc_msgSend(v10, "notificationWithName:object:", v11, a2);
    v13 = (void *)v9;
LABEL_6:
    objc_msgSend(v13, "postNotification:", v12);
    goto LABEL_7;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC56C8]))
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)MEMORY[0x1E0CB37C0];
    v11 = CFSTR("CurrentEventDidChangeNotification");
    goto LABEL_5;
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC56D8]))
  {
    if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC56A8]))
      goto LABEL_7;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (id)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC56B8]), "copy");
    objc_msgSend(v16, "setImmutable");
    v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC56C0]), "intValue");
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("AssetListResponseStatusDidChangeEventKey"));
    if (v17 == 2)
    {
      v19 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC56B0]);
      objc_msgSend(v15, "setObject:forKey:", &unk_1E3093670, CFSTR("AssetListResponseStatusDidChangeStatusKey"));
      v20 = CFSTR("AssetListResponseStatusDidChangeErrorKey");
      v21 = v15;
      v18 = (void *)v19;
    }
    else
    {
      if (v17 == 1)
      {
        v18 = &unk_1E3093658;
      }
      else
      {
        if (v17)
        {
LABEL_20:
          v22 = objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v12 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AssetListResponseStatusDidChangeNotification"), a2, v15);
          v13 = (void *)v22;
          goto LABEL_6;
        }
        v18 = &unk_1E3093640;
      }
      v20 = CFSTR("AssetListResponseStatusDidChangeStatusKey");
      v21 = v15;
    }
    objc_msgSend(v21, "setObject:forKey:", v18, v20);
    goto LABEL_20;
  }
  v14 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC56A0]);
  objc_msgSend(a2, "_removeMonitorListeners");
  if (v14)
    objc_msgSend(a2, "_addMonitorListeners:", v14);
LABEL_7:
  objc_autoreleasePoolPop(v8);
}

void sub_193430264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193430440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934306C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343091C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_193430DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CMTime v12;
  CMTime v13;

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F58]);
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F38]));
  v10 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F60]);
  v11 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F68]);
  v12 = v13;
  objc_msgSend(a2, "_figPlaybackItem:didOutputAttributedStrings:nativeSampleBuffers:atItemTime:withLegibleOutputsDictionaryKey:", a4, v9, v11, &v12, v10);
  objc_autoreleasePoolPop(v8);
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputWasFlushed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figPlaybackItem:didFlushLegibleOutputWithDictionaryKey:", a4, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F60]));
  objc_autoreleasePoolPop(v8);
}

void AVFigPlaybackItemNotificationCallback_MetadataOutputChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F70]);
  v10 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4FB0]);
  objc_msgSend(a2, "_figPlaybackItem:didOutputSampleBuffers:fromTrackWithID:forMetadataOutputWithDictionaryKey:", a4, v10, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4FC8]), "unsignedIntValue"), v9);
  objc_autoreleasePoolPop(v8);
}

void AVFigPlaybackItemNotificationCallback_MetadataOutputWasFlushed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figPlaybackItem:didFlushMetadataOutputWithDictionaryKey:", a4, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F70]));
  objc_autoreleasePoolPop(v8);
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  CGPoint *v13;
  AVRenderedCaptionImage *v14;
  uint64_t v15;
  CGPoint point;
  CMTimeEpoch epoch;
  CMTime v19;

  v7 = (void *)MEMORY[0x1940343FC]();
  v8 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F88]);
  v9 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F90]);
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeFromDictionary(&v19, (CFDictionaryRef)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F38]));
  v10 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F80]);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    v13 = (CGPoint *)MEMORY[0x1E0C9D538];
    do
    {
      point.x = 0.0;
      point.y = 0.0;
      if (v9 && objc_msgSend(v9, "count"))
        CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), &point);
      else
        point = *v13;
      v14 = [AVRenderedCaptionImage alloc];
      v15 = objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      objc_msgSend(v11, "addObject:", -[AVRenderedCaptionImage initWithPixelBuffer:atPosition:](v14, "initWithPixelBuffer:atPosition:", v15, point.x, point.y));
      ++v12;
    }
    while (v12 < objc_msgSend(v8, "count"));
  }
  point = *(CGPoint *)&v19.value;
  epoch = v19.epoch;
  objc_msgSend(a2, "_figPlaybackItem:didOutputRenderedCaptionImages:atItemTime:withRenderedLegibleOutputsDictionaryKey:", a4, v11, &point, v10);
  objc_autoreleasePoolPop(v7);
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputWasFlushed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figPlaybackItem:didFlushRenderedLegibleOutputWithDictionaryKey:", a4, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F80]));
  objc_autoreleasePoolPop(v8);
}

void cmTimebaseNotificationCallback_TimeJumped(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1940343FC]();
  v4 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemTimeJumpedNotification"), a2, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v4);
  objc_autoreleasePoolPop(v3);
}

void sub_193431AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193431C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193431E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193431F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193431FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193432170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193432238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934327A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193432978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193433CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193434000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193434284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934344E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193434740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343499C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193434BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193434E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193435600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193435BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193435E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193436084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343630C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934365AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193436A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193437578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_193437AFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_193438338(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_193438524(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934386F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_193438808(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934389AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193438D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193438EE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19343929C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343938C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_193439474(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934396FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193439964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193439A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343A5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19343ABB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343BCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343C0D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19343C420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343C580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343C8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343DAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343E210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343E720(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19343E984(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19343EC08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19343F000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343F3A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19343F674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343F838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343F9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343FB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343FDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19343FF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934400F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193440B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193440E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_10(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 962) = 0;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_11(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 960) = 1;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_23(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 968) = 0;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 964) = result;
  return result;
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isExternalProtectionRequiredForPlaybackInternal");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_26;
  v4[3] = &unk_1E302FCE8;
  v3 = *(NSObject **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  dispatch_async(v3, v4);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_26(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("_externalProtectionRequiredForPlayback"));
  v5[0] = MEMORY[0x1E0C809B0];
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  v5[1] = 3221225472;
  v5[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_27;
  v5[3] = &unk_1E302FCE8;
  v6 = v2;
  av_readwrite_dispatch_queue_write(v3, v5);
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("_externalProtectionRequiredForPlayback"));
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 969) = result;
  return result;
}

void sub_19344189C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193442254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193443260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193443558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVTelemetryGenerateID()
{
  return 0;
}

AVCompositionTrackSegmentInternal *AVCompositionTrackSegmentCreateIvars(void *a1, int a2)
{
  AVCompositionTrackSegmentInternal *v4;

  v4 = objc_alloc_init(AVCompositionTrackSegmentInternal);
  if (v4)
  {
    v4->editAssetURL = (NSURL *)objc_msgSend(a1, "copy");
    v4->editAssetTrackID = a2;
    CFRetain(v4);
  }
  return v4;
}

void AVAssetReaderHandleServerDiedNotification(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_handleServerDiedNotification");
  objc_autoreleasePoolPop(v3);
}

void sub_19344E014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19344E1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19344E368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figAssetReaderSampleBufferDidBecomeAvailable(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figAssetReaderSampleBufferDidBecomeAvailableForExtractionID:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3B28]), "integerValue"));
  objc_autoreleasePoolPop(v7);
}

void figAssetReaderDecodeError(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figAssetReaderDecodeError");
  objc_autoreleasePoolPop(v3);
}

void figAssetReaderFailed(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figAssetReaderFailed");
  objc_autoreleasePoolPop(v3);
}

void figAssetReaderServerConnectionDied(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figAssetReaderServerConnectionDied");
  objc_autoreleasePoolPop(v3);
}

uint64_t AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(void *a1)
{
  uint64_t v2;

  if (objc_msgSend(a1, "isEqualToString:", CFSTR("Spectral")))
  {
    v2 = MEMORY[0x1E0CC3B80];
    return *(_QWORD *)v2;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("TimeDomain")))
  {
    v2 = MEMORY[0x1E0CC3B88];
    return *(_QWORD *)v2;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("Varispeed")))
  {
    v2 = MEMORY[0x1E0CC3B90];
    return *(_QWORD *)v2;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("LowQualityZeroLatency")))
    return *MEMORY[0x1E0CC3B78];
  else
    return 0;
}

BOOL isSupportedStereoMultiviewCodec(int a1)
{
  _BOOL8 result;
  int v3;

  result = 0;
  if (a1 <= 1836415072)
  {
    if (a1 > 1751479856)
    {
      if (a1 == 1751479857)
        return VTIsStereoMVHEVCDecodeSupported() != 0;
      v3 = 1752589105;
    }
    else
    {
      if (a1 == 1667790435)
        return VTIsStereoMVHEVCDecodeSupported() != 0;
      v3 = 1718908520;
    }
LABEL_13:
    if (a1 != v3)
      return result;
    return VTIsStereoMVHEVCDecodeSupported() != 0;
  }
  if (a1 <= 1902667125)
  {
    if (a1 == 1836415073)
      return VTIsStereoMVHEVCDecodeSupported() != 0;
    v3 = 1869117027;
    goto LABEL_13;
  }
  if (a1 != 1902667126 && a1 != 1902998904)
  {
    v3 = 1902671459;
    goto LABEL_13;
  }
  return VTIsStereoMVHEVCDecodeSupported() != 0;
}

uint64_t AVLoadValueAsynchronously(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v7[7];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a2;
  v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AVLoadValuesAsynchronously_block_invoke;
  v7[3] = &unk_1E3031070;
  v7[4] = v5;
  v7[5] = a1;
  v7[6] = a3;
  return objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:", v5, v7);
}

uint64_t AVLoadValuesAsynchronously(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __AVLoadValuesAsynchronously_block_invoke;
  v4[3] = &unk_1E3031070;
  v4[4] = a2;
  v4[5] = a1;
  v4[6] = a3;
  return objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:", a2, v4);
}

void sub_19345702C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193457158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVAssetWriterFigAssetWriterHandleServerDiedNotification(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_handleServerDiedNotification");
  objc_autoreleasePoolPop(v3);
}

void AVAssetWriterFigAssetWriterHandleCompletedNotification(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_handleCompletedWritingNotification");
  objc_autoreleasePoolPop(v3);
}

void AVAssetWriterFigAssetWriterHandleFailedNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  CFTypeID TypeID;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = (void *)MEMORY[0x1940343FC]();
  if (!a5
    || (TypeID = CFDictionaryGetTypeID(), TypeID != CFGetTypeID(a5))
    || (v9 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3CA8])) == 0
    || (v10 = (void *)v9, (objc_opt_respondsToSelector() & 1) == 0)
    || (v11 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", objc_msgSend(v10, "intValue"))) == 0)
  {
    v11 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
  }
  objc_msgSend(a2, "_handleFailedNotificationWithError:", v11);
  objc_autoreleasePoolPop(v7);
}

uint64_t aw_FragmentedHeaderDataCallback(OpaqueCMBlockBuffer *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t CFDataWithBlockBufferNoCopy;
  uint64_t v9;
  CMBlockBufferRef blockBufferOut;

  v4 = (void *)MEMORY[0x1940343FC]();
  v5 = (void *)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a2);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(v5, "delegate");
    blockBufferOut = 0;
    if (!CMBlockBufferIsRangeContiguous(a1, 0, 0)
      && (CFDataWithBlockBufferNoCopy = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, 0, &blockBufferOut), (_DWORD)CFDataWithBlockBufferNoCopy)|| (CFDataWithBlockBufferNoCopy = FigCreateCFDataWithBlockBufferNoCopy(), (_DWORD)CFDataWithBlockBufferNoCopy))
    {
      v9 = CFDataWithBlockBufferNoCopy;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "assetWriter:didOutputSegmentData:segmentType:segmentReport:", v6, 0, 1, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "assetWriter:didOutputSegmentData:segmentType:", v6, 0, 1);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "assetWriter:didProduceFragmentedHeaderData:", v6, 0);
      }
      v9 = 0;
    }
    if (blockBufferOut)
      CFRelease(blockBufferOut);
  }
  else
  {
    v9 = 0;
  }
  objc_autoreleasePoolPop(v4);
  return v9;
}

uint64_t aw_FragmentedMediaDataCallback(OpaqueCMBlockBuffer *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t CFDataWithBlockBufferNoCopy;
  AVAssetSegmentReport *v11;
  uint64_t v12;
  CMBlockBufferRef blockBufferOut;

  v6 = (void *)MEMORY[0x1940343FC]();
  v7 = (void *)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a3);
  if (!v7)
  {
    v12 = 0;
    goto LABEL_16;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(v7, "delegate");
  blockBufferOut = 0;
  if (CMBlockBufferIsRangeContiguous(a1, 0, 0)
    || (CFDataWithBlockBufferNoCopy = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, 0, &blockBufferOut), !(_DWORD)CFDataWithBlockBufferNoCopy))
  {
    CFDataWithBlockBufferNoCopy = FigCreateCFDataWithBlockBufferNoCopy();
    if (!(_DWORD)CFDataWithBlockBufferNoCopy)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = -[AVAssetSegmentReport initWithFigSegmentReportDictionary:]([AVAssetSegmentReport alloc], "initWithFigSegmentReportDictionary:", a2);
        objc_msgSend(v9, "assetWriter:didOutputSegmentData:segmentType:segmentReport:", v8, 0, 2, v11);
LABEL_12:

        goto LABEL_13;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "assetWriter:didOutputSegmentData:segmentType:", v8, 0, 2);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = -[AVFragmentedMediaDataReport initWithFigFragmentedMediaDataReportDictionary:]([AVFragmentedMediaDataReport alloc], "initWithFigFragmentedMediaDataReportDictionary:", a2);
        objc_msgSend(v9, "assetWriter:didProduceFragmentedMediaData:fragmentedMediaDataReport:", v8, 0, v11);
        goto LABEL_12;
      }
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
  }
  v12 = CFDataWithBlockBufferNoCopy;
LABEL_14:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
LABEL_16:
  objc_autoreleasePoolPop(v6);
  return v12;
}

void sub_19345C5D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t AVExecuteOperationsSynchronously(void *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(a1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_msgSend(v6, "isFinished") & 1) == 0)
        {
          AVExecuteOperationsSynchronously(objc_msgSend(v6, "dependencies"));
          objc_msgSend(v6, "start");
          objc_msgSend(v6, "waitUntilFinished");
        }
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t AVAssetWriterCanAddPassthroughInputWithMediaTypeToAssetWriterWithFileType(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0C99D80];
  v15 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), CFSTR("vide"), CFSTR("text"), CFSTR("clcp"), CFSTR("sbtl"), CFSTR("tmcd"), CFSTR("meta"), CFSTR("hapt"), CFSTR("auxv"), CFSTR("scen"), 0);
  v14 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), CFSTR("vide"), CFSTR("text"), CFSTR("clcp"), CFSTR("sbtl"), CFSTR("meta"), 0);
  v13 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), CFSTR("vide"), CFSTR("text"), CFSTR("clcp"), CFSTR("sbtl"), 0);
  v12 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), CFSTR("vide"), CFSTR("text"), CFSTR("clcp"), CFSTR("sbtl"), CFSTR("hapt"), 0);
  v11 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), CFSTR("vide"), CFSTR("text"), CFSTR("clcp"), CFSTR("sbtl"), CFSTR("tmcd"), CFSTR("meta"), CFSTR("hapt"), CFSTR("auxv"), CFSTR("scen"), 0);
  v10 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), CFSTR("vide"), CFSTR("text"), 0);
  v9 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), 0);
  v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), 0);
  v7 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), 0);
  v2 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), 0);
  v3 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("soun"), 0);
  v4 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("clcp"));
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v15, CFSTR("com.apple.quicktime-movie"), v14, CFSTR("public.mpeg-4"), v13, CFSTR("com.apple.m4v-video"), v12, CFSTR("com.apple.m4a-audio"), v11, CFSTR("com.apple.immersive-video"), v10, CFSTR("public.3gpp"), v9, CFSTR("com.apple.coreaudio-format"), v8,
                       CFSTR("com.microsoft.waveform-audio"),
                       v7,
                       CFSTR("public.aiff-audio"),
                       v2,
                       CFSTR("public.aifc-audio"),
                       v3,
                       CFSTR("org.3gpp.adaptive-multi-rate-audio"),
                       v4,
                       CFSTR("com.apple.itunes-timed-text"),
                       v5,
                       CFSTR("com.scenarist.closed-caption"),
                       objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("text")),
                       CFSTR("org.w3.webvtt"),
                       0),
                 "objectForKey:",
                 objc_msgSend(a2, "UTI")),
           "containsObject:",
           a1);
}

void sub_193463170(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_193463334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVRoutingSessionManagerCurrentSessionChanged(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVRoutingSessionManagerCurrentSessionDidChangeNotification"), a2, v6, v7);
  objc_autoreleasePoolPop(v3);
}

void AVRoutingSessionManagerLikelyDestinationsChanged(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVRoutingSessionManagerLikelyExternalDestinationsDidChangeNotification"), a2, v7, v9);
  if (dword_1EE2B0210)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVRoutingSessionManagerAllLikelyDestinationsDidChangeNotification"), a2, v8, v10);
  objc_autoreleasePoolPop(v3);
}

void *AVRoutingSessionManagerGetLikelyDestinationsFromFig(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned int (*v5)(uint64_t, CFArrayRef *);
  CFIndex i;
  CFIndex Count;
  AVRoutingSessionDestination *v8;
  CFArrayRef theArray;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  theArray = 0;
  v5 = *(unsigned int (**)(uint64_t, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v5 && !v5(a1, &theArray))
  {
    for (i = 0; ; ++i)
    {
      Count = (CFIndex)theArray;
      if (theArray)
        Count = CFArrayGetCount(theArray);
      if (i >= Count)
        break;
      v8 = -[AVRoutingSessionDestination initWithFigRoutingSessionDestination:]([AVRoutingSessionDestination alloc], "initWithFigRoutingSessionDestination:", CFArrayGetValueAtIndex(theArray, i));
      if ((*(unsigned int (**)(uint64_t, AVRoutingSessionDestination *))(a2 + 16))(a2, v8))
        objc_msgSend(v4, "addObject:", v8);

    }
  }
  if (theArray)
    CFRelease(theArray);
  return v4;
}

void AVRoutingSessionManagerStartHighConfidenceDestinationComplete(void *a1, signed int a2)
{
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = (void *)MEMORY[0x1940343FC]();
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler((uint64_t)a1, a2);

  objc_autoreleasePoolPop(v4);
}

void AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler(uint64_t a1, signed int a2)
{
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  NSObject *v7;

  v4 = (void *)MEMORY[0x1940343FC]();
  if (dword_1EE2B0210)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a2)
  {
    v6 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
    if (!a1)
      goto LABEL_10;
  }
  else
  {
    v6 = 0;
    if (!a1)
      goto LABEL_10;
  }
  if (dword_1EE2B0210)
  {
    v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 16))(a1, v6);
LABEL_10:
  objc_autoreleasePoolPop(v4);
}

void sub_1934662D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934678A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934679F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934690B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934691F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19346937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193469614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figAssetWriterTrackDidDropBelowLowWaterLevel(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_figAssetWriterDidDropBelowLowWaterLevelForTrackID:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3CB8]), "integerValue"));
  objc_autoreleasePoolPop(v7);
}

void sub_19346FC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVAssetWriterInputFigAssetWriterEndPassOperationPassFinished(int a1, void *a2, int a3, int a4, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  __int128 *v14;
  unint64_t v15;
  __int128 v16;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CC3CA0]);
  v8 = (const void *)*MEMORY[0x1E0C9AE50];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CC3CB0]);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "length");
    v13 = objc_msgSend(v11, "bytes");
    if (v12 >= 0x30)
    {
      v14 = (__int128 *)v13;
      v15 = v12 / 0x30;
      do
      {
        v16 = v14[1];
        v19 = *v14;
        v20 = v16;
        v21 = v14[2];
        v18[0] = v19;
        v18[1] = v16;
        v18[2] = v21;
        objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", v18));
        v14 += 3;
        --v15;
      }
      while (v15);
    }
  }
  return objc_msgSend(a2, "_notifyWhetherMorePassesAreNeeded:timeRanges:forTrackWithID:", Value == v8, v9, objc_msgSend((id)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CC3CB8]), "integerValue"));
}

id NSArrayFromCGAffineTransform()
{
  return (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
}

void *NSArrayFromRGBAComponents(float a1, float a2, float a3, float a4)
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  *(float *)&v9 = a4;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9));
  *(float *)&v10 = a1;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10));
  *(float *)&v11 = a2;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11));
  *(float *)&v12 = a3;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12));
  return v8;
}

unint64_t NSArrayGetRGBAComponents(void *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  unint64_t result;
  int v11;
  int v12;
  int v13;
  int v14;

  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
  {
    *a5 = 0;
    result = objc_msgSend(a1, "count");
    if (result < 4)
      return result;
    result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 0), "floatValue");
    *a5 = v11;
  }
  else
  {
    result = objc_msgSend(a1, "count");
    if (result < 4)
      return result;
  }
  if (a2)
  {
    result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 1), "floatValue");
    *a2 = v12;
  }
  if (a3)
  {
    result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 2), "floatValue");
    *a3 = v13;
  }
  if (a4)
  {
    result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 3), "floatValue");
    *a4 = v14;
  }
  return result;
}

id _rampArrayWithTimeRangesAsValues(void *a1)
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  CMTimeRange v7;
  CMTimeRange v8;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v3 = objc_msgSend(a1, "count");
  if (v3 >= 2)
  {
    v4 = v3 >> 1;
    v5 = 1;
    do
    {
      memset(&v8, 0, sizeof(v8));
      CMTimeRangeMakeFromDictionary(&v8, (CFDictionaryRef)objc_msgSend(a1, "objectAtIndex:", v5 - 1));
      v7 = v8;
      objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v7));
      objc_msgSend(v2, "addObject:", objc_msgSend(a1, "objectAtIndex:", v5));
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return v2;
}

id _rampArrayWithTimeRangesAsDictionaries(void *a1)
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v3 = objc_msgSend(a1, "count");
  if (v3 >= 2)
  {
    v4 = v3 >> 1;
    v5 = 1;
    v6 = 0uLL;
    do
    {
      v11 = v6;
      v12 = v6;
      v10 = v6;
      v7 = (void *)objc_msgSend(a1, "objectAtIndex:", v5 - 1);
      if (v7)
      {
        objc_msgSend(v7, "CMTimeRangeValue");
      }
      else
      {
        v11 = 0u;
        v12 = 0u;
        v10 = 0u;
      }
      v9[0] = v10;
      v9[1] = v11;
      v9[2] = v12;
      objc_msgSend(v2, "addObject:", AVDictionaryWithTimeRange(v9));
      objc_msgSend(v2, "addObject:", objc_msgSend(a1, "objectAtIndex:", v5));
      v5 += 2;
      --v4;
      v6 = 0uLL;
    }
    while (v4);
  }
  return v2;
}

void sub_1934731A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_193473A24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19347437C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t trackLayerSort(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, "layer");
  v4 = objc_msgSend(a2, "layer");
  if (v3 < v4)
    return -1;
  else
    return v3 > v4;
}

void *AVVideoCompositionSerializeSourceTrackWindows(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFAllocator *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  CFDictionaryRef v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime time;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v2)
  {
    v3 = v2;
    v19 = *(_QWORD *)v26;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v17 = *MEMORY[0x1E0CC62D0];
    v18 = *MEMORY[0x1E0CC62E0];
    v15 = *MEMORY[0x1E0CC62D8];
    v16 = *MEMORY[0x1E0CC62C0];
    v5 = *MEMORY[0x1E0CC62C8];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(a1);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", v7, v15, v16, v17, v18);
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "durationBefore");
          v10 = CMTimeCopyAsDictionary(&time, v4);
          objc_msgSend(v9, "durationAfter");
          v11 = CMTimeCopyAsDictionary(&v23, v4);
          objc_msgSend(v9, "durationBeforeWhenSeeking");
          v12 = CMTimeCopyAsDictionary(&v22, v4);
          objc_msgSend(v9, "durationAfterWhenSeeking");
        }
        else
        {
          memset(&time, 0, sizeof(time));
          v10 = CMTimeCopyAsDictionary(&time, v4);
          memset(&v23, 0, sizeof(v23));
          v11 = CMTimeCopyAsDictionary(&v23, v4);
          memset(&v22, 0, sizeof(v22));
          v12 = CMTimeCopyAsDictionary(&v22, v4);
          memset(&v21, 0, sizeof(v21));
        }
        v13 = CMTimeCopyAsDictionary(&v21, v4);
        v29[0] = v18;
        v29[1] = v17;
        v30[0] = v7;
        v30[1] = v10;
        v29[2] = v16;
        v29[3] = v15;
        v30[2] = v11;
        v30[3] = v12;
        v29[4] = v5;
        v30[4] = v13;
        objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5));
        if (v10)
          CFRelease(v10);
        if (v11)
          CFRelease(v11);
        if (v12)
          CFRelease(v12);
        if (v13)
          CFRelease(v13);
      }
      v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v3);
  }
  return v20;
}

void __getPerFrameHDRDisplayMetadataDefault_block_invoke()
{
  CFPropertyListRef v0;
  const void *v1;
  CFTypeID v2;
  const __CFString *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v0 = CFPreferencesCopyValue(CFSTR("videoCompositionHDRDisplayMetadata"), CFSTR("com.apple.avfoundation"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 != CFStringGetTypeID())
    {
LABEL_10:
      CFRelease(v1);
      return;
    }
    if (FigCFEqual())
    {
      v3 = CFSTR("PerFrameHDRDisplayMetadataPolicy_Generate");
    }
    else
    {
      if (!FigCFEqual())
        goto LABEL_8;
      v3 = CFSTR("PerFrameHDRDisplayMetadataPolicy_Propagate");
    }
    getPerFrameHDRDisplayMetadataDefault_sDefaultPerFrameHDRDisplayMetadataPolicy = (uint64_t)v3;
LABEL_8:
    if (dword_1EE2B0170)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_10;
  }
}

double avvc_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  double v16;
  __int128 v17;
  __int128 v18;
  double result;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v4 = *(double *)(a1 + 8);
  v5 = *(double *)(a1 + 16);
  v6 = *(double *)(a1 + 24);
  v7 = sqrt(v4 * v4 + *(double *)a1 * *(double *)a1);
  v8 = sqrt(v6 * v6 + v5 * v5);
  v9 = *(double *)a1 * v6 - v5 * v4;
  v10 = -v8;
  v11 = -v7;
  if (*(double *)a1 < v6)
    v10 = v8;
  else
    v11 = v7;
  if (v9 < 0.0)
    v12 = v11;
  else
    v12 = v7;
  if (v9 < 0.0)
    v13 = v10;
  else
    v13 = v8;
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v14;
  *(_OWORD *)&v20.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, 1.0 / v12, 1.0 / v13);
  v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  v16 = atan2(*(long double *)(a1 + 8), *(long double *)a1);
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v21, &v20, -v16);
  v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  *(double *)a2 = v12;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  *(_QWORD *)(a2 + 24) = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 64) = result;
  return result;
}

void AVExportSessionDetermineCompatibilityOfExportPresetCompletionHandler(void (**a1)(_QWORD, _QWORD), int a2)
{
  ((void (**)(_QWORD, BOOL))a1)[2](a1, a2 != 0);

}

void AVExportSessionEstimateMaximumDurationCompletionHandler(_QWORD *a1, __int128 *a2, __CFError *a3)
{
  __CFError *ErrorFromCFError;
  void (*v6)(_QWORD *, __int128 *, __CFError *);
  __int128 v7;
  uint64_t v8;

  ErrorFromCFError = avAssetExportSession_GetErrorFromCFError(a3);
  v6 = (void (*)(_QWORD *, __int128 *, __CFError *))a1[2];
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v6(a1, &v7, ErrorFromCFError);

}

void AVExportSessionEstimateOutputFileLengthCompletionHandler(void (**a1)(_QWORD, _QWORD, _QWORD), uint64_t a2, __CFError *a3)
{
  __CFError *ErrorFromCFError;

  ErrorFromCFError = avAssetExportSession_GetErrorFromCFError(a3);
  ((void (**)(_QWORD, uint64_t, __CFError *))a1)[2](a1, a2, ErrorFromCFError);

}

uint64_t AVAssetExportSessionPropertyChangeCallback(void *a1, int a2)
{
  const __CFString *v4;
  uint64_t result;

  if (FigCFEqual())
  {
    v4 = CFSTR("error");
  }
  else
  {
    result = FigCFEqual();
    if (!(_DWORD)result)
      return result;
    v4 = CFSTR("status");
  }
  if (a2)
    return objc_msgSend(a1, "didChangeValueForKey:", v4);
  else
    return objc_msgSend(a1, "willChangeValueForKey:", v4);
}

void AVExportSessionDetermineCompatibilityOfFileTypesCompletionHandler(void (**a1)(void))
{
  a1[2]();

}

__CFError *avAssetExportSession_GetErrorFromCFError(__CFError *result)
{
  __CFError *v1;

  if (result)
  {
    v1 = result;
    CFErrorGetDomain(result);
    if (FigCFEqual())
      return (__CFError *)AVLocalizedErrorWithUnderlyingOSStatus(-[__CFError code](v1, "code"), (id)-[__CFError userInfo](v1, "userInfo"));
    else
      return (__CFError *)(id)-[__CFError copy](v1, "copy");
  }
  return result;
}

void sub_19347CF88(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t AVAssetExportSessionGetFigRemakerAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(void *a1)
{
  uint64_t v2;

  if (objc_msgSend(a1, "isEqualToString:", CFSTR("Spectral")))
  {
    v2 = MEMORY[0x1E0CC5C68];
    return *(_QWORD *)v2;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("TimeDomain")))
  {
    v2 = MEMORY[0x1E0CC5C70];
    return *(_QWORD *)v2;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("Varispeed")))
  {
    v2 = MEMORY[0x1E0CC5C78];
    return *(_QWORD *)v2;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("LowQualityZeroLatency")))
    return *MEMORY[0x1E0CC5C60];
  else
    return 0;
}

uint64_t avAssetExportSession_IsVideoCompositionValidForAssetWithTimeRange(void *a1, _OWORD *a2)
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  _OWORD v8[3];

  v4 = objc_msgSend(a1, "asset");
  v5 = (void *)objc_msgSend(a1, "videoComposition");
  v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  v8[2] = a2[2];
  return objc_msgSend(v5, "isValidForAsset:timeRange:validationDelegate:", v4, v8, 0);
}

uint64_t avAssetExportSession_VideoCompositionOutputColorPropertiesWithCustomCompositor(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 8) + 56), "videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:", *(_QWORD *)(*(_QWORD *)(result + 8) + 48), a2, a3, a4, a5, a6);
  return result;
}

uint64_t avAssetExportSession_CustomVideoCompositorSessionGetAndClearClientError(uint64_t result)
{
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 8) + 48), "getAndClearClientError");
  return result;
}

void sub_19347F6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19347FD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  id *v32;
  id *v33;
  id *v34;

  objc_destroyWeak(v33);
  objc_destroyWeak(v34);
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVDelegatingPlaybackCoordinatorSetRateAndAnchorTimeCallback(void *a1, uint64_t a2, uint64_t a3, __int128 *a4, __int128 *a5, uint64_t a6, float a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v18;
  AVDelegatingPlaybackCoordinatorPlayCommand *v19;
  AVDelegatingPlaybackCoordinatorPlayCommand *v20;
  void *v21;
  _QWORD v22[6];
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v18 = (void *)MEMORY[0x1940343FC]();
  if (a1)
  {
    if (a6)
    {
      a6 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a6));
      objc_msgSend(a1, "_prepareToInitiatePlayback");
    }
    v19 = [AVDelegatingPlaybackCoordinatorPlayCommand alloc];
    v25 = *a4;
    v26 = *((_QWORD *)a4 + 2);
    v23 = *a5;
    v24 = *((_QWORD *)a5 + 2);
    v20 = -[AVDelegatingPlaybackCoordinatorPlayCommand initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:rate:itemTime:hostClockTime:](v19, "initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:rate:itemTime:hostClockTime:", a1, a6, a2, a3, &v25, &v23, COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(a7))));
    v21 = (void *)objc_msgSend(a1, "playbackControlDelegate");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __AVDelegatingPlaybackCoordinatorSetRateAndAnchorTimeCallback_block_invoke;
    v22[3] = &__block_descriptor_48_e5_v8__0l;
    v22[4] = a11;
    v22[5] = a10;
    objc_msgSend(v21, "playbackCoordinator:didIssuePlayCommand:completionHandler:", a1, v20, v22);

  }
  objc_autoreleasePoolPop(v18);
}

void AVDelegatingPlaybackCoordinatorJumpToTimeCallback(void *a1, uint64_t a2, uint64_t a3, __int128 *a4, float a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  void *v20;
  AVDelegatingPlaybackCoordinatorSeekCommand *v21;
  AVDelegatingPlaybackCoordinatorSeekCommand *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[6];
  __int128 v26;
  uint64_t v27;

  v20 = (void *)MEMORY[0x1940343FC]();
  if (a1)
  {
    if (a8)
    {
      a8 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a8));
      if (a7)
        objc_msgSend(a1, "_prepareToInitiatePlayback");
    }
    v21 = [AVDelegatingPlaybackCoordinatorSeekCommand alloc];
    v26 = *a4;
    v27 = *((_QWORD *)a4 + 2);
    LOBYTE(v24) = a7 != 0;
    v22 = -[AVDelegatingPlaybackCoordinatorSeekCommand initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:itemTime:shouldPause:shouldBufferInAnticipationOfPlayback:anticipatedPlaybackRate:completionDueDate:](v21, "initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:itemTime:shouldPause:shouldBufferInAnticipationOfPlayback:anticipatedPlaybackRate:completionDueDate:", a1, a8, a2, a3, &v26, COERCE_DOUBLE(__PAIR64__(DWORD1(v26), LODWORD(a5))), v24, a9);
    v23 = (void *)objc_msgSend(a1, "playbackControlDelegate");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __AVDelegatingPlaybackCoordinatorJumpToTimeCallback_block_invoke;
    v25[3] = &__block_descriptor_48_e5_v8__0l;
    v25[4] = a12;
    v25[5] = a11;
    objc_msgSend(v23, "playbackCoordinator:didIssueSeekCommand:completionHandler:", a1, v22, v25);

  }
  objc_autoreleasePoolPop(v20);
}

void AVDelegatingPlaybackCoordinatorPauseCallback(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, float a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v17;
  AVDelegatingPlaybackCoordinatorPauseCommand *v18;
  double v19;
  AVDelegatingPlaybackCoordinatorPauseCommand *v20;
  void *v21;
  _QWORD v22[6];

  v17 = (void *)MEMORY[0x1940343FC]();
  if (a1)
  {
    if (a5)
    {
      a5 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a5));
      if (a4)
        objc_msgSend(a1, "_prepareToInitiatePlayback");
    }
    v18 = [AVDelegatingPlaybackCoordinatorPauseCommand alloc];
    *(float *)&v19 = a6;
    v20 = -[AVDelegatingPlaybackCoordinatorPauseCommand initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:shouldBufferInAnticipationOfPlayback:anticipatedPlaybackRate:](v18, "initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:shouldBufferInAnticipationOfPlayback:anticipatedPlaybackRate:", a1, a5, a2, a3, a4 != 0, v19);
    v21 = (void *)objc_msgSend(a1, "playbackControlDelegate");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __AVDelegatingPlaybackCoordinatorPauseCallback_block_invoke;
    v22[3] = &__block_descriptor_48_e5_v8__0l;
    v22[4] = a10;
    v22[5] = a9;
    objc_msgSend(v21, "playbackCoordinator:didIssuePauseCommand:completionHandler:", a1, v20, v22);

  }
  objc_autoreleasePoolPop(v17);
}

void AVDelegatingPlaybackCoordinatorPrepareToSetRateCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v17;
  AVDelegatingPlaybackCoordinatorBufferingCommand *v18;
  double v19;
  AVDelegatingPlaybackCoordinatorBufferingCommand *v20;
  void *v21;
  _QWORD v22[6];

  v17 = (void *)MEMORY[0x1940343FC]();
  if (a1)
  {
    if (a4)
    {
      a4 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a4));
      objc_msgSend(a1, "_prepareToInitiatePlayback");
    }
    v18 = [AVDelegatingPlaybackCoordinatorBufferingCommand alloc];
    *(float *)&v19 = a6;
    v20 = -[AVDelegatingPlaybackCoordinatorBufferingCommand initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:anticipatedPlaybackRate:completionDueDate:](v18, "initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:anticipatedPlaybackRate:completionDueDate:", a1, a4, a2, a3, a5, v19);
    v21 = (void *)objc_msgSend(a1, "playbackControlDelegate");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __AVDelegatingPlaybackCoordinatorPrepareToSetRateCallback_block_invoke;
    v22[3] = &__block_descriptor_48_e5_v8__0l;
    v22[4] = a9;
    v22[5] = a8;
    objc_msgSend(v21, "playbackCoordinator:didIssueBufferingCommand:completionHandler:", a1, v20, v22);

  }
  objc_autoreleasePoolPop(v17);
}

void AVDelegatingPlaybackCoordinatorBroadcastTimelineStateCallback(void *a1, void *a2)
{
  void *v4;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = (void *)MEMORY[0x1940343FC]();
  v5 = (void *)objc_msgSend(a1, "coordinationMediumDelegate");
  objc_msgSend(a1, "_updateTransportControlStateDictionaryWithTransportControlState:", a2);
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "playbackCoordinator:broadcastTransportControlStateDictionary:forItemWithIdentifier:", a1, a2, objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5418]));
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(a1, "setCoordinationMediumDelegate:", 0);
  }
  objc_autoreleasePoolPop(v4);
}

void AVDelegatingPlaybackCoordinatorBroadcastParticipantStateCallback(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = (void *)MEMORY[0x1940343FC]();
  v5 = (void *)objc_msgSend(a1, "coordinationMediumDelegate");
  objc_msgSend(a1, "_updateParticipantStateDictionaryWithParticipantState:", a2);
  objc_msgSend(a1, "_removeUnusedTransportControlStates");
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "playbackCoordinator:broadcastLocalParticipantStateDictionary:", a1, a2);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(a1, "setCoordinationMediumDelegate:", 0);
  }
  objc_autoreleasePoolPop(v4);
}

void AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v12[27];

  v12[26] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a1, "coordinationMediumDelegate");
  if (a1 && (v10 = (void *)v9, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback_block_invoke;
    v12[3] = &unk_1E30314D8;
    v12[4] = a1;
    v12[5] = a4;
    v12[6] = a3;
    objc_msgSend(v10, "playbackCoordinator:reloadTransportControlStateForItemWithIdentifier:completionHandler:", a1, a2, v12);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(a1, "setCoordinationMediumDelegate:", 0);
    a4(a3);
  }
  objc_autoreleasePoolPop(v8);
}

void sub_193480C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934810EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19348121C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193481328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934816A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193481858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193481960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193481EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934821D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193482388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193482D50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_193482E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193483204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193483564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193483A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193483CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193484AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_193485198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193485C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193485D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193485E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVExportSettingsForOutputSettingsPreset(uint64_t a1)
{
  uint64_t result;

  result = exportSettings_exportPresetForOutputSettingsPreset(a1);
  if (result)
    return FigExportSettingsForExportPreset();
  return result;
}

uint64_t exportSettings_exportPresetForOutputSettingsPreset(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("AVAssetExportPreset640x480"), CFSTR("AVOutputSettingsPreset640x480"), CFSTR("AVAssetExportPreset960x540"), CFSTR("AVOutputSettingsPreset960x540"), CFSTR("AVAssetExportPreset1280x720"), CFSTR("AVOutputSettingsPreset1280x720"), CFSTR("AVAssetExportPreset1920x1080"), CFSTR("AVOutputSettingsPreset1920x1080"), CFSTR("AVAssetExportPreset3840x2160"), CFSTR("AVOutputSettingsPreset3840x2160"), CFSTR("AVAssetExportPresetHEVC1920x1080"), CFSTR("AVOutputSettingsPresetHEVC1920x1080"), CFSTR("AVAssetExportPresetHEVC1920x1080WithAlpha"), CFSTR("AVOutputSettingsPresetHEVC1920x1080WithAlpha"), CFSTR("AVAssetExportPresetHEVC3840x2160"), CFSTR("AVOutputSettingsPresetHEVC3840x2160"),
                 CFSTR("AVAssetExportPresetHEVC3840x2160WithAlpha"),
                 CFSTR("AVOutputSettingsPresetHEVC3840x2160WithAlpha"),
                 CFSTR("AVAssetExportPresetMVHEVC960x960"),
                 CFSTR("AVOutputSettingsPresetMVHEVC960x960"),
                 CFSTR("AVAssetExportPresetMVHEVC1440x1440"),
                 CFSTR("AVOutputSettingsPresetMVHEVC1440x1440"),
                 0),
           "objectForKey:",
           a1);
}

uint64_t AVExportSettingsAverageBitRateForSourceAndExportPresetWithEncoderSpecification(int a1, int a2, int a3, CMVideoFormatDescriptionRef videoDesc)
{
  if (!videoDesc)
    return 0;
  CMVideoFormatDescriptionGetDimensions(videoDesc);
  CMFormatDescriptionGetExtension(videoDesc, (CFStringRef)*MEMORY[0x1E0CA8E98]);
  return (int)FigExportSettingsAverageBitRateForSourceAndExportPreset();
}

uint64_t AVExportSettingsAverageBitRateForSourceAndOutputSettingsPreset(int a1, int a2, uint64_t a3, const opaqueCMFormatDescription *a4)
{
  int v7;

  v7 = exportSettings_exportPresetForOutputSettingsPreset(a3);
  return AVExportSettingsAverageBitRateForSourceAndExportPresetWithEncoderSpecification(a1, a2, v7, a4);
}

id AVExportSettingsEffectiveColorPropertyForPresetAndInputOutputFormat()
{
  return (id)FigExportSettings_CopyEffectiveColorPropertyForPresetAndInputOutputFormat();
}

void avqsbar_figRendererNowBelowLowWaterLevelNotificationHandler(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_triggerMediaRequestCallback");
  objc_autoreleasePoolPop(v3);
}

void avqsbar_figRendererWasFlushedAutomaticallyNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const __CFDictionary *Value;
  CMTime v9;
  CMTime v10;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = (const __CFDictionary *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CC5D08]);
  memset(&v10, 0, sizeof(v10));
  CMTimeMakeFromDictionary(&v10, Value);
  v9 = v10;
  objc_msgSend(a2, "_wasFlushedAutomaticallyAtTime:", &v9);
  objc_autoreleasePoolPop(v7);
}

void avqsbar_figRendererRebuildCouldBenefitFidelityNotificationHandler(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVSampleBufferAudioRendererOutputConfigurationDidChangeNotification"), a2);
  objc_autoreleasePoolPop(v3);
}

void avqsbar_figRendererServerDied(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_transitionToStatus:error:", 2, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0));
  objc_autoreleasePoolPop(v3);
}

void AVSampleBufferAudioRendererFlushFromMediaTimeCallback(int a1, void (**a2)(_QWORD, _QWORD))
{
  ((void (**)(_QWORD, BOOL))a2)[2](a2, a1 == 0);

}

void sub_193489014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934891CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193489368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t setup(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x1E0CC3EE0]);
  v4 = FigCPEProtectorRemoteCreateForScheme();
  if ((_DWORD)v4)
  {
    v5 = v4;
    goto LABEL_3;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  v5 = CMNotificationCenterAddListener();
  if ((_DWORD)v5)
LABEL_3:
    teardown(a1);
  return v5;
}

void teardown(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterBarrier();
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void NotificationHandler(uint64_t a1, uint64_t a2, const void *a3)
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  v5 = (void *)MEMORY[0x1940343FC]();
  CFRetain(a3);
  v6 = *(NSObject **)(a2 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __NotificationHandler_block_invoke;
  v7[3] = &unk_1E302FE78;
  v7[4] = a2;
  v7[5] = a3;
  dispatch_async(v6, v7);
  objc_autoreleasePoolPop(v5);
}

void sub_19348A87C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19348AB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348AC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplHandleEvent(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v6 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4)
  {
    if (FigCFEqual())
    {
      objc_msgSend(a4, "_didReceiveData:", a3);
    }
    else if (FigCFEqual())
    {
      objc_msgSend(a4, "_didCloseCommunicationChannel");
    }
  }
  objc_autoreleasePoolPop(v6);
}

void AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplSendDataCompletion(signed int a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;

  v5 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a1)
  {
    v7 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = AVLocalizedErrorWithUnderlyingOSStatus(a1, 0);
  if (a3)
LABEL_5:
    a3[2](a3, v7);
LABEL_6:

  objc_autoreleasePoolPop(v5);
}

void sub_19348C1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348C808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348CAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348CBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348DA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348DC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19348DEE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19348E01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348E784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19348EAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t AVNSLocalesMatchAccordingToRFC4647FilteringRules(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return AVNSLanguageIdentifiersMatchAccordingToRFC4647FilteringRules((void *)objc_msgSend(a1, "localeIdentifier"), (void *)objc_msgSend(a2, "localeIdentifier"));
}

uint64_t AVNSLanguageIdentifiersMatchAccordingToRFC4647FilteringRules(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1 == a2)
    return 1;
  v2 = a2;
  if (a1)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a1);
    if (!v2)
      goto LABEL_5;
    goto LABEL_4;
  }
  v3 = 0;
  if (a2)
LABEL_4:
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v2);
LABEL_5:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_7:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(v3);
    v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
    result = objc_msgSend(v2, "objectForKey:", v8);
    if (!result)
      return result;
    result = objc_msgSend((id)result, "isEqual:", objc_msgSend(v3, "objectForKey:", v8));
    if (!(_DWORD)result)
      return result;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      result = 1;
      if (v5)
        goto LABEL_7;
      return result;
    }
  }
}

CFLocaleIdentifier AVLanguageCodeFromPackedLanguageCode(CFLocaleIdentifier result)
{
  unsigned int v1;
  CFLocaleIdentifier v2;
  unsigned __int16 valuePtr;

  valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt16Type, &valuePtr);
    v1 = valuePtr;
    if (valuePtr == 0x7FFF)
      return CFSTR("und");
    if (valuePtr > 0x3FFu)
      return (CFLocaleIdentifier)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c"), (v1 >> 10) | 0x60, (v1 >> 5) & 0x1F | 0x60, v1 & 0x1F | 0x60);
    result = CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], valuePtr, -1);
    if (!result)
      return result;
    v2 = result;
    valuePtr = FigMetadataGetPackedISO639_2TFromLocaleIdentifier();
    CFRelease(v2);
    v1 = valuePtr;
    if (valuePtr < 0x400u)
      return 0;
    else
      return (CFLocaleIdentifier)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c"), (v1 >> 10) | 0x60, (v1 >> 5) & 0x1F | 0x60, v1 & 0x1F | 0x60);
  }
  return result;
}

uint64_t AVIsSpecialSpokenExtendedLanguageTag(void *a1)
{
  uint64_t v2;
  void *v3;

  if (!objc_msgSend(a1, "compare:options:", CFSTR("cmn"), 1))
    return 0;
  v2 = objc_msgSend((id)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-")), "firstObject");
  if (!v2)
    return 0;
  v3 = (void *)v2;
  if (AVIsSpecialSpokenExtendedLanguageTag_sInitLangCodesOnce != -1)
    dispatch_once(&AVIsSpecialSpokenExtendedLanguageTag_sInitLangCodesOnce, &__block_literal_global_16);
  return objc_msgSend((id)AVIsSpecialSpokenExtendedLanguageTag_sSpecialSpokenLanguageCodes, "containsObject:", objc_msgSend(v3, "lowercaseString"));
}

void AVExternalPlaybackMonitorAirPlayVideoActiveChanged(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1EE2B0150)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v5, v6), "postNotificationName:object:", CFSTR("AVExternalPlaybackMonitorAirPlayVideoActiveDidChangeNotification"), a2);
  objc_autoreleasePoolPop(v3);
}

void AVExternalPlaybackMonitorAirPlayVideoPlayingChanged(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1EE2B0150)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v5, v6), "postNotificationName:object:", CFSTR("AVExternalPlaybackMonitorAirPlayVideoPlayingDidChangeNotification"), a2);
  objc_autoreleasePoolPop(v3);
}

void AVSampleBufferVideoOutput_figVCAvailableImmediate(uint64_t a1, __int128 *a2, char a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  __int128 v14;
  uint64_t v15;

  v6 = objc_msgSend(a4, "referencedObject");
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(v6 + 8);
    v9 = *(NSObject **)(v8 + 32);
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke;
    block[3] = &unk_1E3031E68;
    block[4] = v8;
    v14 = *a2;
    v15 = *((_QWORD *)a2 + 2);
    dispatch_sync(v9, block);
    if ((a3 & 1) != 0)
    {
      v11 = *(NSObject **)(v8 + 32);
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke_2;
      v12[3] = &unk_1E302FA10;
      v12[4] = v7;
      dispatch_sync(v11, v12);
    }
  }
}

void sub_1934900BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193490500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

dispatch_queue_t __createDispatchQueueOnce_block_invoke()
{
  dispatch_queue_t result;

  result = av_readwrite_dispatch_queue_create("com.apple.avuxmdisplaymanager");
  sAVUXMDisplayManagerQueue = (uint64_t)result;
  return result;
}

void sub_193490990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_193490AE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_193490B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_193490B9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

AVSynchronousBlockScheduler *AVMakeBlockSchedulerThatExecutesBlocksSynchronously()
{
  return objc_alloc_init(AVSynchronousBlockScheduler);
}

uint64_t AVUnsupportedOutputURLPathExtensions()
{
  if (AVUnsupportedOutputURLPathExtensions_createExtensionListOnce != -1)
    dispatch_once(&AVUnsupportedOutputURLPathExtensions_createExtensionListOnce, &__block_literal_global_10);
  return AVUnsupportedOutputURLPathExtensions_sUnsupportedExtensionList;
}

id AVMediaSubtypeDescriptionStringForFormatDescription(const opaqueCMFormatDescription *a1)
{
  CMFormatDescriptionGetMediaSubType(a1);
  CMFormatDescriptionGetMediaType(a1);
  MTCopyStringsForMediaTypeAndSubType();
  return 0;
}

CFDictionaryRef AVDictionaryWithTime(CMTime *a1)
{
  const __CFAllocator *v1;
  CMTime v3;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = *a1;
  return CMTimeCopyAsDictionary(&v3, v1);
}

CFDictionaryRef AVDictionaryWithTimeRange(_OWORD *a1)
{
  const __CFAllocator *v1;
  __int128 v2;
  CMTimeRange v4;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = a1[1];
  *(_OWORD *)&v4.start.value = *a1;
  *(_OWORD *)&v4.start.epoch = v2;
  *(_OWORD *)&v4.duration.timescale = a1[2];
  return CMTimeRangeCopyAsDictionary(&v4, v1);
}

void *AVRampsIncludesRampThatOverlapsTimeRange(void *result, __int128 *a2)
{
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (result)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __AVRampsIncludesRampThatOverlapsTimeRange_block_invoke;
    v3[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
    v2 = a2[1];
    v4 = *a2;
    v5 = v2;
    v6 = a2[2];
    return (void *)(objc_msgSend(result, "indexOfObjectPassingTest:", v3) != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

void *AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange(void *result, __int128 *a2)
{
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (result)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_block_invoke;
    v3[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
    v2 = a2[1];
    v4 = *a2;
    v5 = v2;
    v6 = a2[2];
    return (void *)(objc_msgSend(result, "indexOfObjectPassingTest:", v3) != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t AVFileNameWithExtensionThatAccordsWithUTI(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (!a2)
    return (uint64_t)a1;
  v4 = objc_msgSend(a1, "pathExtension");
  if (v4)
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v4), "identifier");
  if ((objc_msgSend(a2, "isEqualToString:", v4) & 1) == 0
    && (v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2), "preferredFilenameExtension")) != 0)
  {
    return objc_msgSend((id)objc_msgSend(a1, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", v5);
  }
  else
  {
    return (uint64_t)a1;
  }
}

uint64_t AVSerializedAtomDataFromFormatDescription(void *a1)
{
  CFArrayRef v1;
  CFArrayRef v2;
  uint64_t v3;
  void *values;

  values = a1;
  if (!a1)
    return 0;
  v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  if (!v1)
    return 0;
  v2 = v1;
  if (FigRemote_CreateSerializedAtomDataForFormatDescriptions())
    v3 = 0;
  else
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", 0, 0);
  CFRelease(v2);
  return v3;
}

void *AVFormatDescriptionFromSerializedAtomData(void *a1)
{
  void *v1;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "bytes");
    objc_msgSend(v1, "length");
    FigRemote_CreateFormatDescriptionArrayFromSerializedAtomData();
    return 0;
  }
  return v1;
}

void AVResetMediaServices()
{
  dispatch_queue_t v0;
  NSObject *v1;
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = dispatch_queue_create("com.apple.avfoundation.settings", MEMORY[0x1E0C80D50]);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)MEMORY[0x1E0C99E20];
    if (audiomxd_enabled())
      v3 = CFSTR("audiomxd");
    else
      v3 = CFSTR("mediaserverd");
    if (_os_feature_enabled_impl())
      v4 = CFSTR("cameracaptured");
    else
      v4 = CFSTR("mediaserverd");
    v5 = CFSTR("mediaplaybackd");
    if (FigRemote_ShouldConnectToMediaplaybackd())
      v6 = CFSTR("mediaplaybackd");
    else
      v6 = CFSTR("mediaserverd");
    if (VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode()
      || VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode())
    {
      v5 = CFSTR("videocodecd");
    }
    else if (!FigRemote_ShouldConnectToMediaplaybackd())
    {
      v5 = CFSTR("mediaserverd");
    }
    v7 = CFSTR("mediaparserd");
    if (!FigRemote_ShouldConnectToMediaparserdForFileParsing()
      && !FigRemote_ShouldConnectToMediaparserdFile_OptIn())
    {
      v7 = CFSTR("mediaserverd");
    }
    v8 = (void *)objc_msgSend(v2, "setWithObjects:", CFSTR("mediaserverd"), v3, v4, v6, v5, v7, 0);
    if (objc_msgSend(v8, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        v12 = MEMORY[0x1E0C809B0];
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
            block[0] = v12;
            block[1] = 3221225472;
            block[2] = __AVResetMediaServices_block_invoke;
            block[3] = &unk_1E302FA10;
            block[4] = v14;
            dispatch_async(v1, block);
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }
    }
    else
    {
      FigSignalErrorAt();
    }
    dispatch_release(v1);
  }
  else
  {
    FigSignalErrorAt();
  }
}

uint64_t initSFTerminateProcessNamed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (SettingsFoundationLibrary_sOnce != -1)
    dispatch_once(&SettingsFoundationLibrary_sOnce, &__block_literal_global_50);
  softLinkSFTerminateProcessNamed = (uint64_t (*)())dlsym((void *)SettingsFoundationLibrary_sLib, "SFTerminateProcessNamed");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFTerminateProcessNamed)(a1, a2, a3);
}

void sub_193498FBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934992BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934993E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19349950C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193499638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19349978C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934998FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDescriptorOutputDeviceImplCanSetEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_canSetEndpointVolumeDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRouteDescriptorOutputDeviceImplEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_volumeDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRouteDescriptorOutputDeviceImplEndpointVolumeControlTypeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_endpointVolumeControlTypeDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRouteDescriptorOutputDeviceImplEndpointMutedDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_mutedDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRouteDescriptorOutputDeviceImplEndpointCanMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_canMuteDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRouteDescriptorOutputDeviceImplEndpointRoomVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  objc_msgSend(a2, "_volumeForEndpointDidChange:forRoomID:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E80]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRouteDescriptorOutputDeviceImplRouteDescriptionEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  const void *v9;
  const void *v10;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, CFSTR("configUpdateReasonEndpointDescriptorChanged_RouteDescriptor"));
  v9 = CFDictionaryGetValue(a5, CFSTR("configUpdateReasonEndpointDescriptorChanged_RouteNotification"));
  v10 = CFDictionaryGetValue(a5, CFSTR("configUpdateReasonEndpointDescriptorChanged_RoutePayload"));
  objc_msgSend(a2, "_routeDescriptionDidChange:", Value);
  objc_msgSend(a2, "_handleRouteDescriptionEvent:payload:", v9, v10);
  objc_autoreleasePoolPop(v7);
}

void sub_19349AD2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19349AE38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19349C97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19349CDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19349CEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19349D128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19349D2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19349D474(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19349D584(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t AVOutputDeviceGetFigRouteDescriptor(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t result;

  if (a1)
  {
    v3 = a1;
    v4 = (void *)objc_msgSend(a1, "impl");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a1 = (void *)objc_msgSend(v4, "routeDescriptor");
    }
    else
    {
      result = objc_msgSend(v3, "isEqual:", +[AVOutputDevice sharedLocalDevice](AVOutputDevice, "sharedLocalDevice"));
      if (!(_DWORD)result)
        return result;
      a1 = 0;
    }
  }
  *a2 = a1;
  return 1;
}

__CFDictionary *AVCreateFigRouteDescriptorFromOutputDeviceDescription(void *a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend(a1, "deviceName"))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48A28], (const void *)objc_msgSend(a1, "deviceName"));
  if (objc_msgSend(a1, "deviceID"))
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48A50], (const void *)objc_msgSend(a1, "deviceID"));
  return Mutable;
}

uint64_t AVSuccinctRouteDescriptorDescription(const __CFDictionary *a1)
{
  const void *Value;
  uint64_t v4;

  if (!a1)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), 0, v4);
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0D48A28]);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(name: %@, ID: %@)"), Value, CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0D48A50]));
}

uint64_t AVSuccinctRouteDescriptorsDescription(const __CFArray *a1)
{
  void *v2;
  CFIndex v3;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = 0;
  if (!a1)
    goto LABEL_3;
LABEL_2:
  for (i = CFArrayGetCount(a1); v3 < i; i = 0)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v3);
    objc_msgSend(v2, "addObject:", AVSuccinctRouteDescriptorDescription(ValueAtIndex));
    ++v3;
    if (a1)
      goto LABEL_2;
LABEL_3:
    ;
  }
  return objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
}

void AVOutputDeviceRouteDiscovererServerDeathNotificationCallback(uint64_t a1, NSObject *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = (void *)MEMORY[0x1940343FC]();
  if (gAVOutputDeviceRouteDiscovererQueue == a2)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      a2 = gAVOutputDeviceRouteDiscovererQueue;
    }
    dispatch_async(a2, &__block_literal_global_488);
  }
  objc_autoreleasePoolPop(v3);
}

BOOL ErrorIsAVFoundationError(int a1)
{
  return (a1 + 11999) < 0xC8;
}

uint64_t ensureUserInfoDictionaryContainsObjectForKey(void *a1, uint64_t a2)
{
  void *v3;

  if (!a1)
    return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("AVErrorMediaTypeKey"));
  v3 = a1;
  if (!objc_msgSend(a1, "objectForKey:", CFSTR("AVErrorMediaTypeKey")))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    objc_msgSend(v3, "setObject:forKey:", a2, CFSTR("AVErrorMediaTypeKey"));
  }
  return (uint64_t)v3;
}

uint64_t AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(signed int a1, void *a2, void *a3, int a4)
{
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[2];

  v6 = a2;
  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CB3388];
  if (!objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CB3388]))
  {
    if (!a3)
      goto LABEL_9;
    if (!a4
      || !objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("AVFoundationErrorDomain")))
    {
      goto LABEL_8;
    }
    do
    {
      if (objc_msgSend(a3, "code") != -11800)
        break;
      a3 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", v8);
    }
    while ((objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("AVFoundationErrorDomain")) & 1) != 0);
    if (!a3)
    {
LABEL_9:
      v9 = 0;
    }
    else
    {
LABEL_8:
      v12 = v8;
      v13[0] = a3;
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    }
    v10 = AVOSStatusToNSError(a1, v9);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    objc_msgSend(v6, "setObject:forKey:", v10, v8);
  }
  return AVLocalizedErrorWithUnderlyingOSStatus(a1, v6);
}

uint64_t AVErrorWithNSErrorAndOSStatus(uint64_t a1, signed int a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v7;
  void *v8;

  if (!a1)
    return AVLocalizedErrorWithUnderlyingOSStatus(a2, a3);
  v4 = a1;
  if (a3)
    v5 = (id)objc_msgSend(a3, "mutableCopy");
  else
    v5 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v7 = v5;
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CB3388]);
  v8 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(a2, v7);
  if (!objc_msgSend((id)objc_msgSend(v8, "domain"), "isEqualToString:", CFSTR("AVFoundationErrorDomain"))
    || objc_msgSend(v8, "code") != -11800)
  {
    return (uint64_t)v8;
  }
  return v4;
}

uint64_t AVErrorForClientProgrammingError(uint64_t a1)
{
  return AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11999, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1, CFSTR("AVErrorExceptionKey")));
}

void sub_19349E6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19349E984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19349EFB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t metadataSupplierResourceLifeCycleCallback(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "resourceLifeCycleHandler");
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

void sub_19349F940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__92(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose__93(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

uint64_t CMTagCollectionCreateWithVideoOutputPreset(const __CFAllocator *a1, int a2, CMTagCollectionRef *newCollectionOut)
{
  __int128 *v3;
  __int128 v4;
  __int128 v6;
  CMTag tags;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    v3 = (__int128 *)MEMORY[0x1E0CA2830];
    goto LABEL_5;
  }
  if (!a2)
  {
    v3 = (__int128 *)MEMORY[0x1E0CA2840];
LABEL_5:
    v6 = *v3;
    tags = (CMTag)*MEMORY[0x1E0CA2800];
    v8 = v6;
    v4 = *MEMORY[0x1E0CA2828];
    v9 = *MEMORY[0x1E0CA2808];
    v10 = v4;
    return CMTagCollectionCreate(a1, &tags, 4, newCollectionOut);
  }
  return FigSignalErrorAt();
}

void figPlaybackItemTrackSampleBufferDidBecomeAvailable(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  uint64_t v8;

  v7 = (void *)MEMORY[0x1940343FC]();
  v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4FC8]), "integerValue");
  objc_msgSend(a2, "_figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID:extractionID:", v8, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F30]), "integerValue"));
  objc_autoreleasePoolPop(v7);
}

void figPlaybackItemTrackResetSampleBufferExtraction(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  uint64_t v8;

  v7 = (void *)MEMORY[0x1940343FC]();
  v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4FC8]), "integerValue");
  objc_msgSend(a2, "_figPlaybackItemTrackOutputSequenceWasFlushedForTrackID:extractionID:", v8, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC4F30]), "integerValue"));
  objc_autoreleasePoolPop(v7);
}

uint64_t AVOutputDeviceFigListeningModeForAVFListeningMode(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVOutputDeviceBluetoothListeningModeNormal")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVOutputDeviceBluetoothListeningModeAudioTransparency")) & 1) != 0)
    return 3;
  if (_os_feature_enabled_impl()
    && (objc_msgSend(a1, "isEqualToString:", CFSTR("AVOutputDeviceBluetoothListeningModeAutomatic")) & 1) != 0)
  {
    return 4;
  }
  return 0;
}

uint64_t AVOutputDeviceSubTypeFromFigSubType(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "isEqualToString:", *MEMORY[0x1E0CA4908]) & 1) != 0)
    {
      return 1;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA4910]) & 1) != 0)
    {
      return 11;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA4900]) & 1) != 0)
    {
      return 16;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA4918]) & 1) != 0)
    {
      return 17;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA48E8]) & 1) != 0)
    {
      return 12;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA48C0]) & 1) != 0)
    {
      return 13;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA48F8]) & 1) != 0)
    {
      return 18;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA4928]) & 1) != 0)
    {
      return 19;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("EndpointSubType_visionOS")) & 1) != 0)
    {
      return 20;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA48C8]) & 1) != 0
           || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA48E0]) & 1) != 0)
    {
      return 15;
    }
    else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA48D8]))
    {
      return 15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t AVOutputDeviceNotificationFromFigNotification(uint64_t a1)
{
  if (AVOutputDeviceNotificationFromFigNotification_createFigToAVFNotificationMappingOnce != -1)
    dispatch_once(&AVOutputDeviceNotificationFromFigNotification_createFigToAVFNotificationMappingOnce, &__block_literal_global_22);
  return objc_msgSend((id)AVOutputDeviceNotificationFromFigNotification_figToAVFNotificationMapping, "objectForKey:", a1);
}

uint64_t AVOutputDeviceElectronicTollCollectionStateFromVehicleInfo(void *a1)
{
  void *v1;

  if (!a1)
    return 1;
  v1 = (void *)objc_msgSend(a1, "valueForKey:", *MEMORY[0x1E0CA49B0]);
  if (!v1)
    return 1;
  if (objc_msgSend((id)objc_msgSend(v1, "valueForKey:", CFSTR("active")), "BOOLValue"))
    return 2;
  return 3;
}

uint64_t AVOutputDeviceNavigationAidedDrivingStateFromVehicleInfo(void *a1)
{
  void *v1;

  if (!a1)
    return 1;
  v1 = (void *)objc_msgSend(a1, "valueForKey:", *MEMORY[0x1E0CA49B8]);
  if (!v1)
    return 1;
  if (objc_msgSend((id)objc_msgSend(v1, "valueForKey:", CFSTR("active")), "BOOLValue"))
    return 2;
  return 3;
}

uint64_t AVOutputDeviceTransportTypeFromFigTransportType()
{
  if (FigCFEqual())
    return 1;
  if (FigCFEqual())
    return 2;
  if (FigCFEqual() || FigCFEqual())
    return 3;
  return 0;
}

uint64_t AVOutputDeviceSetDisplayCornerMasksEndpoint(uint64_t a1, uint64_t a2)
{
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);

  CMBaseObject = FigEndpointGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    return v4(CMBaseObject, *MEMORY[0x1E0CA41C0], a2);
  else
    return 4294954514;
}

void *AVOutputDeviceAVOutputDeviceIconsFromOEMIcons(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AVOutputDeviceIcon *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(a1);
        v7 = -[AVOutputDeviceIcon initWithDict:]([AVOutputDeviceIcon alloc], "initWithDict:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        objc_msgSend(v2, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  return v2;
}

void *AVOutputDeviceAVOutputDeviceScreenInfoFromFigScreens(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AVOutputDeviceScreenInfo *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(a1);
        v7 = -[AVOutputDeviceScreenInfo initWithDict:]([AVOutputDeviceScreenInfo alloc], "initWithDict:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        objc_msgSend(v2, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  return v2;
}

void *AVOutputDeviceMakeAVOutputDeviceHIDsFromFigHIDs(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVOutputDeviceHID *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a1;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0CA39B8];
    v9 = *MEMORY[0x1E0CA39B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v11 = -[AVOutputDeviceHID initWithUUID:screenUUID:endpoint:]([AVOutputDeviceHID alloc], "initWithUUID:screenUUID:endpoint:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "objectForKey:", v8), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "objectForKey:", v9), a2);
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return v4;
}

uint64_t AVOutputDeviceAuthenticationTypeFromFigAuthenticationType()
{
  if (FigCFEqual())
    return 1;
  else
    return 2 * (FigCFEqual() != 0);
}

uint64_t AVOutputDeviceRequestViewAreaForFigEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  if (!a1)
    return 4294950576;
  FigEndpointExtendedGetClassID();
  if (!CMBaseObjectIsMemberOfClass())
    return 4294950576;
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 112);
  if (v6)
    return v6(a1, a2, a3);
  else
    return 4294954514;
}

uint64_t AVOutputDeviceRequestCarUIForEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  if (!a1)
    return 4294950576;
  FigEndpointExtendedGetClassID();
  if (!CMBaseObjectIsMemberOfClass())
    return 4294950576;
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 8);
  if (v6)
    return v6(a1, a2, a3);
  else
    return 4294954514;
}

uint64_t AVOutputDeviceTakeScreenForClient(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  if (!a1)
    return 4294950576;
  FigEndpointExtendedGetClassID();
  if (!CMBaseObjectIsMemberOfClass())
    return 4294950576;
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 32);
  if (v6)
    return v6(a1, a2, a3);
  else
    return 4294954514;
}

uint64_t AVOutputDeviceSetAlternateSiriOnEndpoint(uint64_t a1, int a2)
{
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  CMBaseObject = FigEndpointGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v4)
    return 4294954514;
  if (a2)
    v5 = *MEMORY[0x1E0C9AE50];
  else
    v5 = *MEMORY[0x1E0C9AE40];
  return v4(CMBaseObject, *MEMORY[0x1E0CA4108], v5);
}

id AVOutputDeviceGetCurrentScreenViewAreaFromEndpoint(void *a1, uint64_t a2)
{
  void *v3;
  void (*v4)(void *, uint64_t, void **);
  void *v6;

  v6 = 0;
  if (a1)
  {
    v3 = a1;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass()
      && (v4 = *(void (**)(void *, uint64_t, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 120)) != 0)
    {
      v4(v3, a2, &v6);
      a1 = v6;
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

id AVOutputDeviceGetDisplayCornerMasksFromEndpoint()
{
  uint64_t CMBaseObject;
  void (*v1)(uint64_t, _QWORD, _QWORD, void **);
  void *v2;
  void *v4;

  v4 = 0;
  CMBaseObject = FigEndpointGetCMBaseObject();
  v1 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v1)
  {
    v1(CMBaseObject, *MEMORY[0x1E0CA41C0], *MEMORY[0x1E0C9AE00], &v4);
    v2 = v4;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t AVOutputDeviceGetSiriRequestedActionFromFigAction()
{
  if (FigCFEqual())
    return 0;
  if (FigCFEqual())
    return 2;
  if (FigCFEqual())
    return 1;
  return 3;
}

void AVFigEndpointOutputDeviceImplCanSetEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canSetEndpointVolumeDidChangeForEndpointWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigEndpointOutputDeviceImplEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_volumeDidChangeForEndpointWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigEndpointOutputDeviceImplEndpointVolumeControlTypeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_endpointVolumeControlTypeDidChangeForEndpointWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigEndpointOutputDeviceImplEndpointMutedDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_mutedDidChangeForEndpointWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigEndpointOutputDeviceImplEndpointCanMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canMuteDidChangeForEndpointWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigEndpointOutputDeviceImplEndpointRoomVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E10]);
  objc_msgSend(a2, "_volumeForEndpointDidChange:forRoomID:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E80]));
  objc_autoreleasePoolPop(v7);
}

uint64_t AVOutputDeviceSetAllowsHeadTrackedSpatialAudioOnEndpoint(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CMBaseObject;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  v2 = *MEMORY[0x1E0CA4100];
  if (a2)
    v3 = (uint64_t *)MEMORY[0x1E0C9AE50];
  else
    v3 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v4 = *v3;
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMBaseObject = FigEndpointGetCMBaseObject();
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    return v7(CMBaseObject, v2, v4);
  else
    return 4294954514;
}

uint64_t AVOutputDeviceSetHeadTrackedSpatialAudioModeOnEndpoint(uint64_t a1, void *a2)
{
  uint64_t SInt32;
  const void *v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t CMBaseObject;
  uint64_t (*v8)(uint64_t, uint64_t, const void *);
  uint64_t v9;

  if ((objc_msgSend(a2, "isEqualToString:", AVOutputDeviceHeadTrackedSpatialAudioModeNever) & 1) == 0
    && (objc_msgSend(a2, "isEqualToString:", AVOutputDeviceHeadTrackedSpatialAudioModeAlways) & 1) == 0
    && (objc_msgSend(a2, "isEqualToString:", AVOutputDeviceHeadTrackedSpatialAudioModeAutomatic) & 1) == 0
    && !objc_msgSend(a2, "isEqualToString:", AVOutputDeviceHeadTrackedSpatialAudioModeMultichannelOnly))
  {
    return 0;
  }
  SInt32 = FigCFNumberCreateSInt32();
  if (!SInt32)
    return 0;
  v4 = (const void *)SInt32;
  v5 = *MEMORY[0x1E0CA4248];
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMBaseObject = FigEndpointGetCMBaseObject();
  v8 = *(uint64_t (**)(uint64_t, uint64_t, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v8)
    v9 = v8(CMBaseObject, v5, v4);
  else
    v9 = 4294954514;
  CFRelease(v4);
  return v9;
}

uint64_t AVOutputDeviceSetSecondDisplayEnabledOnEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  v7 = CFSTR("disable");
  if (a3)
    v7 = CFSTR("enable");
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output device %@ screen %@"), a2, v7);
  if (!a1 || (FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    a1 = 0;
  if (a3)
  {
    if (dword_1ECDECED8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 16);
    if (!v11)
      return 4294954514;
  }
  else
  {
    if (dword_1ECDECED8)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 24);
    if (!v11)
      return 4294954514;
  }
  return v11(a1, v6, v8);
}

void AVOutputDeviceSetSecondDisplayModeOnEndpoint(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  CFMutableDictionaryRef Mutable;
  AVFigEndpointSecondDisplayModeToken *v8;
  _QWORD *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, CFMutableDictionaryRef, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  os_log_type_t type;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1 || (FigEndpointExtendedGetClassID(), v6 = a1, !CMBaseObjectIsMemberOfClass()))
    v6 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v8 = -[AVFigEndpointSecondDisplayModeToken initWithEndpoint:]([AVFigEndpointSecondDisplayModeToken alloc], "initWithEndpoint:", a1);
  objc_msgSend(a2, "isEqualToString:", CFSTR("AVOutputDeviceSecondDisplayModeDefault"));
  FigCFDictionarySetInt64();
  v9 = (_QWORD *)MEMORY[0x1E0CA4660];
  if (dword_1ECDECED8)
  {
    v17 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __AVOutputDeviceSetSecondDisplayModeOnEndpoint_block_invoke;
  v15[3] = &unk_1E3033F48;
  v15[4] = v8;
  v15[5] = a3;
  v11 = objc_msgSend(v15, "copy", v13, v14);
  v12 = *(void (**)(uint64_t, _QWORD, CFMutableDictionaryRef, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 72);
  if (v12)
    v12(v6, *v9, Mutable, AVOutputDeviceEndpointSendCommandCompleted, v11);

  if (Mutable)
    CFRelease(Mutable);
}

void AVOutputDeviceSetMediaRemoteDataOnEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  CFMutableDictionaryRef Mutable;
  _QWORD *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, CFMutableDictionaryRef, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t);
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  os_log_type_t type;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1 || (v4 = a1, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    v4 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  FigCFDictionarySetValue();
  v6 = (_QWORD *)MEMORY[0x1E0CA4658];
  if (dword_1ECDECED8)
  {
    v14 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __AVOutputDeviceSetMediaRemoteDataOnEndpoint_block_invoke;
  v12[3] = &unk_1E3033F20;
  v12[4] = a3;
  v8 = objc_msgSend(v12, "copy", v10, v11);
  v9 = *(void (**)(uint64_t, _QWORD, CFMutableDictionaryRef, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 72);
  if (v9)
    v9(v4, *v6, Mutable, AVOutputDeviceEndpointSendCommandCompleted, v8);
  if (Mutable)
    CFRelease(Mutable);
}

void AVOutputDeviceEndpointSendCommandCompleted(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD))
{
  a4[2](a4);

}

uint64_t AVOutputDeviceSuggestUIWithURLSAndCompletionHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t result;
  uint64_t (*v10)(uint64_t, const __CFString *, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_log_type_t type;
  int v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a1 || (v5 = a1, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    v5 = 0;
  v16 = CFSTR("urls");
  v17[0] = a2;
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  if (dword_1ECDECED8)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __AVOutputDeviceSuggestUIWithURLSAndCompletionHandler_block_invoke;
  v13[3] = &unk_1E3033F20;
  v13[4] = a3;
  v8 = objc_msgSend(v13, "copy", v11, v12);
  result = CMBaseObjectGetVTable();
  v10 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t))(*(_QWORD *)(result + 24) + 72);
  if (v10)
    return v10(v5, CFSTR("suggestUI"), v6, AVOutputDeviceEndpointSendCommandCompleted, v8);
  return result;
}

uint64_t AVOutputDevicePerformHapticFeedback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t result;
  uint64_t (*v12)(uint64_t, const __CFString *, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  os_log_type_t type;
  int v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!a1 || (v7 = a1, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
    v7 = 0;
  v18[0] = CFSTR("uuid");
  v18[1] = CFSTR("hapticFeedbackType");
  v19[0] = a2;
  v19[1] = a3;
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  if (dword_1ECDECED8)
  {
    v17 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __AVOutputDevicePerformHapticFeedback_block_invoke;
  v15[3] = &unk_1E3033F20;
  v15[4] = a4;
  v10 = objc_msgSend(v15, "copy", v13, v14);
  result = CMBaseObjectGetVTable();
  v12 = *(uint64_t (**)(uint64_t, const __CFString *, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, void (**)(_QWORD)), uint64_t))(*(_QWORD *)(result + 24) + 72);
  if (v12)
    return v12(v7, CFSTR("performHapticFeedback"), v8, AVOutputDeviceEndpointSendCommandCompleted, v10);
  return result;
}

uint64_t AVOutputDeviceImplChangeVolumeByCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t (*v8)(uint64_t, uint64_t, float);

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(uint64_t, uint64_t, float))(*(_QWORD *)(result + 16) + 56);
  if (v8)
    return v8(a1, a2, (float)a3);
  return result;
}

uint64_t AVOutputDeviceImplChangeRoomVolumeForEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, float);

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = CMBaseObjectGetVTable();
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, float))(*(_QWORD *)(result + 16) + 208);
  if (v10)
    return v10(a1, a2, a3, a4);
  return result;
}

BOOL AVOutputDeviceImplCanMuteForEndpointID(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void (*v5)(uint64_t, uint64_t, char *);
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = *(void (**)(uint64_t, uint64_t, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 192);
  if (!v5)
    return 0;
  v5(a1, a2, &v7);
  return v7 != 0;
}

uint64_t AVOutputDeviceImplSetMutedForEndpointID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 152);
  if (v8)
    return v8(a1, a2, a3);
  return result;
}

uint64_t AVOutputDeviceGetFigEndpoint(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t result;

  if (a1)
  {
    v3 = a1;
    v4 = (void *)objc_msgSend(a1, "figEndpointOutputDeviceImpl");
    if (v4)
    {
      a1 = (void *)objc_msgSend(v4, "figEndpoint");
    }
    else
    {
      result = objc_msgSend(v3, "isEqual:", +[AVOutputDevice sharedLocalDevice](AVOutputDevice, "sharedLocalDevice"));
      if (!(_DWORD)result)
        return result;
      a1 = 0;
    }
  }
  *a2 = a1;
  return 1;
}

uint64_t AVSuccinctEndpointDescription(uint64_t a1)
{
  uint64_t v1;
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v4;
  CFTypeRef v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v9;
  CFTypeRef v10;
  uint64_t v11;
  CFTypeRef v12;
  CFTypeRef cf;

  v12 = 0;
  cf = 0;
  if (!a1)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), 0);
  v1 = *MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v4 = v3(CMBaseObject, *MEMORY[0x1E0CA4348], v1, &cf);
    if (!(_DWORD)v4)
      goto LABEL_10;
  }
  else
  {
    v4 = 4294954514;
  }
  v6 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(error %d)"), v4);
  if (v6)
    v6 = CFRetain(v6);
  cf = v6;
LABEL_10:
  v7 = FigEndpointGetCMBaseObject();
  v8 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v8)
  {
    v9 = 4294954514;
    goto LABEL_14;
  }
  v9 = v8(v7, *MEMORY[0x1E0CA4258], v1, &v12);
  if ((_DWORD)v9)
  {
LABEL_14:
    v10 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(error %d)"), v9);
    if (v10)
      v10 = CFRetain(v10);
    v12 = v10;
    goto LABEL_17;
  }
  v10 = v12;
LABEL_17:
  v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(name: %@, ID: %@)"), cf, v10);
  if (cf)
    CFRelease(cf);
  if (v12)
    CFRelease(v12);
  return v11;
}

uint64_t AVSuccinctEndpointsDescription(const __CFArray *a1)
{
  void *v2;
  CFIndex v3;
  CFIndex i;
  const void *ValueAtIndex;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = 0;
  if (!a1)
    goto LABEL_3;
LABEL_2:
  for (i = CFArrayGetCount(a1); v3 < i; i = 0)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v3);
    objc_msgSend(v2, "addObject:", AVSuccinctEndpointDescription((uint64_t)ValueAtIndex));
    ++v3;
    if (a1)
      goto LABEL_2;
LABEL_3:
    ;
  }
  return objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
}

void AVFigEndpointOutputDeviceImplFigEndpointNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_handleFigEndpointEvent:payload:", a3, a5);
  objc_autoreleasePoolPop(v8);
}

void FigCFRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

CFTypeRef FigCFRetain(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void sub_1934A793C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t figCustomURLHandlerRequestCancelledForNSURLSession(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "_cancelRequestID:", a4);
}

uint64_t figCustomURLHandlerHandleRequestForNSURLProtocol(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  return a5(a6, 1, objc_msgSend(a1, "_handleRequest:requestID:"));
}

uint64_t figCustomURLHandlerRequestCancelledForNSURLProtocol(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "_cancelRequestID:", a4);
}

void SetHeaderFieldToCFHTTPMessageApplierFunc(CFStringRef headerField, CFStringRef value, CFHTTPMessageRef message)
{
  CFHTTPMessageSetHeaderFieldValue(message, headerField, value);
}

const void *AVNSURLProtocolWillCopyAndSendRequest(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  char v5;
  const void *result;

  v5 = objc_msgSend((id)objc_msgSend(a4, "bridge"), "_willSendRequest:request:redirectionResponse:", a4, a2, a3);
  result = 0;
  if (a2)
  {
    if ((v5 & 1) == 0)
    {
      CFRetain(a2);
      return a2;
    }
  }
  return result;
}

uint64_t AVNSURLProtocolDidReceiveResponse(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a3, "bridge"), "_didReceiveResponse:response:", a3, a2);
}

uint64_t AVNSURLProtocolDidReceiveData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend((id)objc_msgSend(a4, "bridge"), "_didReceiveData:data:", a4, a2);
}

void *AVNSURLProtocolDidFinishLoading(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "bridge");
  if (result)
  {
    objc_msgSend(result, "reportSuccessfulURLLoad");
    return (void *)objc_msgSend((id)objc_msgSend(a2, "bridge"), "_didFinish:error:", a2, 0);
  }
  return result;
}

uint64_t AVNSURLProtocolDidFail(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a3, "bridge"), "_didFinish:error:", a3, a2);
}

uint64_t avacu_getLengthsfromContentRange(uint64_t a1, uint64_t *a2, _QWORD *a3, _BYTE *a4)
{
  void *v7;
  uint64_t result;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
  v13 = 0;
  v14 = 0;
  v11 = 0;
  v12 = 0;
  objc_msgSend(v7, "scanString:intoString:", CFSTR("bytes"), &v14);
  if (!v14)
    return 0;
  result = objc_msgSend(v7, "scanUnsignedLongLong:", &v13);
  if (!(_DWORD)result)
    return result;
  objc_msgSend(v7, "scanString:intoString:", CFSTR("-"), &v14);
  if (!v14)
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_10;
  }
  result = objc_msgSend(v7, "scanUnsignedLongLong:", &v12);
  if (!(_DWORD)result)
    return result;
  if (v12 < v13)
    return 0;
  v9 = v12 - v13 + 1;
  objc_msgSend(v7, "scanString:intoString:", CFSTR("/"), &v14);
  if (v14)
  {
    v10 = objc_msgSend(v7, "scanUnsignedLongLong:", &v11);
    if ((v10 & 1) == 0)
    {
      result = objc_msgSend(v7, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*")), 0);
      if (!(_DWORD)result)
        return result;
    }
    result = objc_msgSend(v7, "isAtEnd");
    if (!(_DWORD)result)
      return result;
  }
  else
  {
    v10 = 0;
  }
LABEL_10:
  if (a2)
    *a2 = v9;
  if (a3)
    *a3 = v11;
  if (a4)
    *a4 = v10;
  return 1;
}

CGFloat AVOutputDeviceViewAreaInfoNSRectFromDictionary(const __CFDictionary *a1)
{
  CGSize v1;
  CGRect v3;

  memset(&v3, 0, sizeof(v3));
  if (!CGRectMakeWithDictionaryRepresentation(a1, &v3))
  {
    v1 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v3.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v3.size = v1;
  }
  return v3.origin.x;
}

void sub_1934ACDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934AD4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934B0A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934B0F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934B1058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934B1698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSystemRemotePoolOutputDeviceCommunicationChannelManagerDidReceiveData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  const void *v9;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48BF0]);
  v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C20]);
  objc_msgSend(a2, "_didReceiveData:fromDeviceWithID:fromChannelWithUUID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C18]), v9, Value);
  objc_autoreleasePoolPop(v7);
}

void AVSystemRemotePoolOutputDeviceCommunicationChannelManagerDidCloseCommChannel(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48BF0]);
  objc_msgSend(a2, "_didCloseCommChannelWithUUID:forDeviceWithID:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C20]));
  objc_autoreleasePoolPop(v7);
}

void sub_1934B1A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934B2554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934B2880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSystemRemotePoolOutputDeviceCommunicationChannelSendDataCompletion(uint64_t a1, uint64_t a2, signed int a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;

  v6 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECED8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a3)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  if (a4)
LABEL_5:
    a4[2](a4, v8);
LABEL_6:

  objc_autoreleasePoolPop(v6);
}

void sub_1934B2FEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1934B30A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B33D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1934B3474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVMutableMovieTrack;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1934B358C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void mutableMovieTrackNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = a2;
  if (v9)
  {
    if (a3)
    {
      v10 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3C00]);
      if (a5)
      {
        if (v10)
        {
          objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3900]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11
            && ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CC3C60]) & 1) != 0
             || (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CC3C68]) & 1) != 0
             || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CC3C30])))
          {
            objc_msgSend(v9, "_signalMetadataUpdated");
          }

        }
      }
    }
  }

  objc_autoreleasePoolPop(v8);
}

void sub_1934B3688(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B3754(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B37A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1934B3878(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B42F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1934B46E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1934B47F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B4884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1934B4C50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B5074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1934B5390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1934B5888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1934B5DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1934B6048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1934B6420(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1934B65CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1934B66B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1934B67FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1934B6968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t AVMediaSubtypesForAC3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x1E0C99D20];
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1633889587);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1885430579);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2053202739);
  return objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1902207795), 0);
}

uint64_t AVMediaSubtypesForEnhancedAC3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x1E0C99D20];
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1700998451);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1885692723);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2053464883);
  return objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1902469939), 0);
}

uint64_t AVMediaTypesForCaptionEditing()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("text");
  v1[1] = CFSTR("clcp");
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 2);
}

void *AVSampleBufferGenerator_remapSampleBufferTiming(void *result, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  CMTime v4[2];

  if (result)
  {
    memset(&v4[1], 0, sizeof(CMTime));
    objc_msgSend(result, "overrideTime");
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v4[0] = v4[1];
      return (void *)CMSampleBufferSetOutputPresentationTimeStamp(a3, v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_1934B771C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void AVSampleBufferGenerator_dataBecameReady(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v5 = (void *)MEMORY[0x1940343FC]();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AVSampleBufferGenerator_dataBecameReady_block_invoke;
  v7[3] = &unk_1E3031EB8;
  v7[4] = &v8;
  v7[5] = a4;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, v7);
  v6 = v9[5];
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);

  }
  _Block_object_dispose(&v8, 8);
  objc_autoreleasePoolPop(v5);
}

void sub_1934B789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSampleBufferGenerator_dataFailed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const __CFNumber *Value;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[6];
  signed int valuePtr;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v7 = (void *)MEMORY[0x1940343FC]();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  v18 = 0;
  valuePtr = 0;
  if (a5)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CA27C0]);
    if (Value)
      CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __AVSampleBufferGenerator_dataFailed_block_invoke;
  block[3] = &unk_1E3031EB8;
  block[4] = &v13;
  block[5] = a4;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, block);
  v9 = v14[5];
  if (v9)
  {
    v10 = AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16))(v9, 0, v10);

  }
  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v7);
}

void sub_1934B79D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSampleBufferGeneratorBatch_BatchCompleted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v6 = (void *)MEMORY[0x1940343FC]();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__26;
  v18 = __Block_byref_object_dispose__26;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __AVSampleBufferGeneratorBatch_BatchCompleted_block_invoke;
  v9[3] = &unk_1E3032B20;
  v9[4] = a2;
  v9[5] = &v14;
  v9[6] = &v10;
  v9[7] = a4;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGeneratorBatch_DispatchQueue, v9);
  if (v15[5])
  {
    v7 = *((_DWORD *)v11 + 6);
    if (v7 == 3)
    {
      v8 = -11881;
    }
    else
    {
      if (v7 != 4)
      {
LABEL_7:
        (*(void (**)(void))(v15[5] + 16))();

        goto LABEL_8;
      }
      v8 = -11878;
    }
    AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v8, 0);
    goto LABEL_7;
  }
LABEL_8:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  objc_autoreleasePoolPop(v6);
}

void sub_1934B8094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934BB450(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934BC4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934BC5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934BCB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void avWaitForNotificationOrDeallocationOperationNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;

  v6 = (void *)MEMORY[0x1940343FC]();
  if (objc_msgSend(a2, "_monitoredObject") == a4)
    objc_msgSend(a2, "_signalMonitoringIsFinishedIfNeeded");
  objc_autoreleasePoolPop(v6);
}

uint64_t ___avDepartureAnnouncingObjectMonitorAnnounceDeparture_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v1, "monitoredObjectHasDeparted");
  return result;
}

void handlePlaybackItemNotification(uint64_t a1, void *a2, const void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8;
  void *v9;
  CFTypeID v10;
  const void *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFTypeID v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFTypeID v21;
  const void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unsigned int valuePtr;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a2, "_loadingMutex");
  v9 = (void *)MEMORY[0x1940343FC]();
  MEMORY[0x194033BF8](v8);
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC4D18]))
  {
    valuePtr = 0;
    if (!a5)
      goto LABEL_9;
    v10 = CFGetTypeID(a5);
    if (v10 != CFDictionaryGetTypeID())
      goto LABEL_9;
    Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC4F78]);
    if (Value)
    {
      CFGetTypeID(Value);
      CFArrayGetTypeID();
    }
    v12 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC4FA0]);
    if (v12 && (v13 = v12, v14 = CFGetTypeID(v12), v14 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v13, kCFNumberSInt32Type, &valuePtr);
      v15 = valuePtr;
    }
    else
    {
LABEL_9:
      v15 = 0;
    }
    objc_msgSend(a2, "_updateStatusWhileMutexLocked:figErrorCode:", 3, v15);
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC4DC8]))
  {
    objc_msgSend(a2, "_updateStatusWhileMutexLocked:figErrorCode:", 2, 0);
    if (a5)
    {
      v21 = CFGetTypeID(a5);
      if (v21 == CFDictionaryGetTypeID())
      {
        v22 = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CC4F78]);
        if (v22)
        {
          CFGetTypeID(v22);
          CFArrayGetTypeID();
        }
      }
    }
  }
  v16 = (void *)objc_msgSend(a2, "_getAndPruneCompletionsWhileMutexLocked");
  MEMORY[0x194033C04](v8);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++) + 16))();
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }
  objc_autoreleasePoolPop(v9);
}

void __getDictionaryOfSpecialLoadingMethodsForKeys_block_invoke()
{
  if (!getDictionaryOfSpecialLoadingMethodsForKeys_sSpecialLoadingMethodsForKeys)
    getDictionaryOfSpecialLoadingMethodsForKeys_sSpecialLoadingMethodsForKeys = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

void __getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_block_invoke()
{
  uint64_t v0;
  char *v1;

  if (!getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_sSpecialPlaybackItemGettersForKeyValueStatus)
  {
    v1 = sel__statusOfValueForKeyThatIsAlwaysLoaded;
    v0 = objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v1, ":");
    getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_sSpecialPlaybackItemGettersForKeyValueStatus = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("URL"), v0, CFSTR("assetCache"), v0, CFSTR("shouldMatchDataInCacheByURLPathComponentOnly"), v0, CFSTR("shouldMatchDataInCacheByURLWithoutQueryComponent"), v0, CFSTR("cacheKey"), v0, CFSTR("downloadDestinationURL"), v0, CFSTR("downloadToken"), v0, CFSTR("isProxy"), 0);
  }
}

BOOL __handleFigAssetLoadingNotification_block_invoke_424(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "count") < 2;
}

uint64_t dictionaryOfFigAssetTrackPropertiesForTrackKeys(int a1)
{
  uint64_t *v2;

  if (dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce != -1)
    dispatch_once(&dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce, &__block_literal_global_31);
  v2 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys;
  if (!a1)
    v2 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys;
  return *v2;
}

uint64_t __dictionaryOfFigAssetTrackPropertiesForTrackKeys_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v42 = (void *)MEMORY[0x1E0C99D80];
  v41 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v40 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v39 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v0 = *MEMORY[0x1E0CC5FE8];
  v38 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FE8], 0);
  v1 = *MEMORY[0x1E0CC3C48];
  v37 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C48], 0);
  v36 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C40], 0);
  v35 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v1, 0);
  v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FF0], 0);
  v33 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6000], 0);
  v32 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6080], 0);
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6078], 0);
  v30 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6038], 0);
  v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6030], 0);
  v28 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v27 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6050], 0);
  v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FD8], 0);
  v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6060], 0);
  v2 = *MEMORY[0x1E0CC6008];
  v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6008], 0);
  v23 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6028], 0);
  v3 = *MEMORY[0x1E0CC5FE0];
  v22 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FE0], 0);
  v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6048], 0);
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FD0], 0);
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6068], 0);
  v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6088], 0);
  v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6020], 0);
  v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6058], 0);
  v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6040], 0);
  v4 = *MEMORY[0x1E0CC3C50];
  v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C50], 0);
  v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C18], 0);
  v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C28], 0);
  v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FC0], 0);
  v5 = *MEMORY[0x1E0CC5FB8];
  v6 = *MEMORY[0x1E0CC3C68];
  v7 = *MEMORY[0x1E0CC3C60];
  v8 = *MEMORY[0x1E0CC3C30];
  v9 = *MEMORY[0x1E0CC3C20];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FB8], *MEMORY[0x1E0CC3C68], *MEMORY[0x1E0CC3C60], *MEMORY[0x1E0CC3C30], *MEMORY[0x1E0CC3C20], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, v6, v7, v8, v9, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6010], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FB0], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FC8], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC6070], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC5FF8], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v2, v3, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v0, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v0, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C70], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C58], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C78], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CC3C08], 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys = (uint64_t)(id)objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v41, CFSTR("asset"), v40, CFSTR("trackID"), v39, CFSTR("mediaType"), v38, CFSTR("formatDescriptions"), v37, CFSTR("playable"), v36, CFSTR("decodable"), v35, CFSTR("playabilityValidationResult"), v34, CFSTR("enabled"), v33, CFSTR("selfContained"), v32, CFSTR("totalSampleDataLength"), v31, CFSTR("timeRange"), v30, CFSTR("mediaPresentationTimeRange"), v29, CFSTR("mediaDecodeTimeRange"), v28, CFSTR("requiresFrameReordering"), v27, CFSTR("naturalTimeScale"), v26, CFSTR("estimatedDataRate"), v25, CFSTR("peakDataRate"), v24, CFSTR("languageCode"), v23, CFSTR("mediaCharacteristics"), v22, CFSTR("extendedLanguageTag"), v21, CFSTR("naturalSize"), v20, CFSTR("dimensions"), v19, CFSTR("preferredTransform"), v18, CFSTR("preferredVolume"), v17, CFSTR("loudnessInfo"), v16, CFSTR("nominalFrameRate"), v15, CFSTR("minFrameDuration"), v14, CFSTR("segments"), v13, CFSTR("segmentsExcludeAudioPrimingAndRemainderDurations"), v12, CFSTR("gaplessSourceTimeRange"), v11);
  dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys);
  v43[0] = *MEMORY[0x1E0CC3C10];
  return objc_msgSend((id)dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1), CFSTR("segments"));
}

void handleFigAssetNotification(uint64_t a1, void *a2, const void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3688]))
  {
    v6 = objc_msgSend(a2, "_loadingMutex");
    MEMORY[0x194033BF8]();
    v7 = (void *)objc_msgSend(a2, "_loadingBatches");
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
    objc_msgSend(v7, "removeAllObjects");
    MEMORY[0x194033C04](v6);
    objc_msgSend(a2, "_invokeCompletionHandlerForLoadingBatches:", v8);
  }
  objc_autoreleasePoolPop(v5);
}

uint64_t __handleFigAssetTrackNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  objc_msgSend(a2, "objectForKey:", 0x1E30483F8);
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    result = objc_msgSend(a2, "removeObjectForKey:", 0x1E30483F8);
    *a4 = 1;
  }
  return result;
}

BOOL __handleFigAssetTrackNotification_block_invoke_2(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "count") < 2;
}

uint64_t AVFullMethodName(objc_class *a1, const char *a2)
{
  objc_class *v4;
  objc_class *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSString *v10;

  v4 = (objc_class *)objc_opt_class();
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
    v7 = (const __CFString *)NSStringFromClass(v4);
  else
    v7 = CFSTR("Nil");
  v10 = NSStringFromSelector(a2);
  v8 = 45;
  if (v5 == a1)
    v8 = 43;
  return objc_msgSend(v6, "stringWithFormat:", CFSTR("%c[%@ %@]"), v8, v7, v10);
}

uint64_t AVFullMethodNameFromClass(objc_class *a1, const char *a2)
{
  void *v4;
  Method ClassMethod;
  const __CFString *v6;
  uint64_t v7;
  NSString *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  ClassMethod = class_getClassMethod(a1, a2);
  if (a1)
    v6 = (const __CFString *)NSStringFromClass(a1);
  else
    v6 = CFSTR("Nil");
  v9 = NSStringFromSelector(a2);
  v7 = 43;
  if (!ClassMethod)
    v7 = 45;
  return objc_msgSend(v4, "stringWithFormat:", CFSTR("%c[%@ %@]"), v7, v6, v9);
}

uint64_t AVRequestConcreteImplementation(objc_class *a1, const char *a2, objc_class *a3)
{
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = *MEMORY[0x1E0C99778];
  if (v6 == a3)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("*** -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!"), v8, v7);
  else
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("*** -%@ only defined for abstract class.  Define %@!"), v8, AVFullMethodName(a1, a2));
}

const __CFString *AVLocalizedStringFromTableWithLocale(uint64_t a1, uint64_t a2, void *a3)
{
  return AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(a1, a2, a3, 0);
}

const __CFString *AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(uint64_t a1, uint64_t a2, void *a3, CFStringRef bundleID)
{
  void *BundleWithIdentifier;
  id v9;
  const __CFString *v10;
  void *v11;

  if (!a3)
    goto LABEL_7;
  if (CFBundleGetBundleWithIdentifier(bundleID)
    || (BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.AVFCore"))) != 0)
  {
    objc_msgSend(a3, "localeIdentifier");
    BundleWithIdentifier = (void *)CFBundleCopyLocalizedStringForLocalization();
  }
  v9 = BundleWithIdentifier;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("xxxxDefaultValuexxxx")) & 1) != 0 || !v9)
  {
LABEL_7:
    if (bundleID)
      v10 = bundleID;
    else
      v10 = CFSTR("com.apple.AVFCore");
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v10), "localizedStringForKey:value:table:", a1, CFSTR("xxxxDefaultValuexxxx"), a2);
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("xxxxDefaultValuexxxx")))
      v9 = 0;
    else
      v9 = v11;
  }
  if (v9)
    return (const __CFString *)v9;
  else
    return &stru_1E303A378;
}

void sub_1934C4B24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1934C500C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934C59A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1934C5C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectEndpointOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectEndpointOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CF0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectEndpointOperation_block_invoke_8;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Select endpoint %@ on routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectRouteDescriptorOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectRouteDescriptorOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CF0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectRouteDescriptorOperation_block_invoke_12;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Select route descriptor %@ on routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectEndpointsOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectEndpointsOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CF0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectEndpointsOperation_block_invoke_15;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Select endpoints %@ on routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectRouteDescriptorsOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectRouteDescriptorsOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CF0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectRouteDescriptorsOperation_block_invoke_18;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Select route descriptors %@ on routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeAddEndpointOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeAddEndpointOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CE8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeAddEndpointOperation_block_invoke_21;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add endpoint %@ to routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeAddRouteDescriptorOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeAddRouteDescriptorOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      a2 = CFRetain(a2);
    if (a3)
      a3 = CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CE8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeAddRouteDescriptorOperation_block_invoke_24;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add route descriptor %@ to routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeRemoveEndpointOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeRemoveEndpointOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CE8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeRemoveEndpointOperation_block_invoke_27;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Remove endpoint %@ from routing context %@"), a2, cf));
  return v12;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeRemoveRouteDescriptorOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  uint64_t v7;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v8;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v9;
  AVFigRoutingContextRouteChangeOperation *v10;
  uint64_t v11;
  AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  if (a4)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __AVMakeRemoveRouteDescriptorOperation_block_invoke;
    v15[3] = &unk_1E3034780;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    v9 = -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation initWithRoutingContext:routeChangeID:routeChangeBlock:](v8, "initWithRoutingContext:routeChangeID:routeChangeBlock:", cf, v7, v15);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    if (a2)
      CFRetain(a2);
    if (a3)
      CFRetain(a3);
    v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    v11 = *MEMORY[0x1E0D48CE8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __AVMakeRemoveRouteDescriptorOperation_block_invoke_30;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    v14[4] = a2;
    v14[5] = cf;
    v14[6] = a3;
    v9 = -[AVFigRoutingContextRouteChangeOperation initWithRoutingContext:successNotification:routeChangeBlock:](v10, "initWithRoutingContext:successNotification:routeChangeBlock:", cf, v11, v14);
  }
  v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Remove route descriptor %@ from routing context %@"), a2, cf));
  return v12;
}

void AVSendCommandCompletion(uint64_t a1, const __CFDictionary *a2, signed int a3, void *a4)
{
  uint64_t v7;
  void *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v10;
  NSObject *v11;
  AVFigRoutingContextCommandOutputDeviceConfiguration *v12;

  v7 = MEMORY[0x1940343FC]();
  v8 = (void *)v7;
  if (a2)
  {
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA3920]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA3938]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA38F0]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA3900]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA3928]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA3930]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E0CA3918]);
    if (dword_1EE2B0190)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else if (dword_1EE2B0190)
  {
    v10 = (void *)v7;
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v8 = v10;
    if (a3)
      goto LABEL_7;
LABEL_9:
    v12 = -[AVFigRoutingContextCommandOutputDeviceConfiguration initWithRoutingContextComandResponse:]([AVFigRoutingContextCommandOutputDeviceConfiguration alloc], "initWithRoutingContextComandResponse:", a2);
    objc_msgSend(a4, "setFinalConfiguration:", v12);
    objc_msgSend(a4, "markAsCompleted");

    goto LABEL_10;
  }
  if (!a3)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(a4, "markAsFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(a3, 0));
LABEL_10:

  objc_autoreleasePoolPop(v8);
}

void AVFigRoutingContextRouteChangeOperationRouteChangeStarted(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_routeChangeStartedWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C30]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRoutingContextRouteChangeOperationRouteChangeEnded(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C30]);
  objc_msgSend(a2, "_routeChangeWithID:endedWithReason:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C28]));
  objc_autoreleasePoolPop(v7);
}

void AVFigRoutingContextRouteChangeOperationRouteChangeComplete(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_routeChangeComplete");
  objc_autoreleasePoolPop(v3);
}

void sub_1934CA388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934CA788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934CA8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVRouteConfigUpdatedFigRoutingContextRouteChangeOperationRouteConfigUpdated(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  const void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C38]);
  v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C48]);
  if (dword_1EE2B0190)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!FigCFEqual() && !FigCFEqual())
    objc_msgSend(a2, "_routeConfigUpdateWithID:endedWithReason:", Value, v9);
  objc_autoreleasePoolPop(v7);
}

void sub_1934CAED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVNSValueWithCGPoint(double a1, double a2)
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
}

uint64_t AVNSValueWithCGRect(double a1, double a2, double a3, double a4)
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

uint64_t AVNSValueWithCGSize(double a1, double a2)
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGSize=dd}");
}

BOOL AVCGPointFromNSValue(void *a1, _OWORD *a2)
{
  int v4;
  __int128 v6;

  v6 = *MEMORY[0x1E0C9D538];
  v4 = strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGPoint=dd}");
  if (!v4)
  {
    objc_msgSend(a1, "getValue:", &v6);
    if (!a2)
      return v4 == 0;
    goto LABEL_3;
  }
  if (a2)
LABEL_3:
    *a2 = v6;
  return v4 == 0;
}

BOOL AVCGRectFromNSValue(void *a1, _OWORD *a2)
{
  __int128 v4;
  int v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = v4;
  v5 = strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
  if (!v5)
  {
    objc_msgSend(a1, "getValue:", &v8);
    if (!a2)
      return v5 == 0;
    goto LABEL_3;
  }
  if (a2)
  {
LABEL_3:
    v6 = v9;
    *a2 = v8;
    a2[1] = v6;
  }
  return v5 == 0;
}

BOOL AVCGSizeFromNSValue(void *a1, _OWORD *a2)
{
  int v4;
  __int128 v6;

  v6 = *MEMORY[0x1E0C9D820];
  v4 = strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGSize=dd}");
  if (!v4)
  {
    objc_msgSend(a1, "getValue:", &v6);
    if (!a2)
      return v4 == 0;
    goto LABEL_3;
  }
  if (a2)
LABEL_3:
    *a2 = v6;
  return v4 == 0;
}

void sub_1934CBA6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t AVMethodExceptionReasonWithObjectAndSelector(objc_class *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** %@"), AVFullMethodName(a1, a2)), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &a9));
}

uint64_t AVMethodExceptionReasonWithClassAndSelector(objc_class *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** %@"), AVFullMethodNameFromClass(a1, a2)), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &a9));
}

void sub_1934D153C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_DWORD *AVCopyBestAudioChannelLayoutFromFormatDescription(const opaqueCMFormatDescription *a1, size_t *a2)
{
  const AudioFormatListItem *RichestDecodableFormat;
  AudioChannelLayoutTag mChannelLayoutTag;
  _DWORD *v6;
  _DWORD *v7;
  const AudioChannelLayout *ChannelLayout;
  _DWORD *v9;
  size_t sizeOut;

  sizeOut = 0;
  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(a1);
  if (RichestDecodableFormat)
  {
    mChannelLayoutTag = RichestDecodableFormat->mChannelLayoutTag;
    if (mChannelLayoutTag != -65536)
    {
      sizeOut = 12;
      v6 = malloc_type_malloc(0xCuLL, 0x4E69D805uLL);
      if (v6)
      {
        v7 = v6;
        v6[1] = 0;
        v6[2] = 0;
        *v6 = mChannelLayoutTag;
        if (!a2)
          return v7;
        goto LABEL_10;
      }
    }
  }
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(a1, &sizeOut);
  if (!sizeOut)
  {
    v7 = 0;
    if (!a2)
      return v7;
    goto LABEL_10;
  }
  v9 = malloc_type_malloc(sizeOut, 0x5A60B01FuLL);
  v7 = v9;
  if (v9)
    memcpy(v9, ChannelLayout, sizeOut);
  if (a2)
LABEL_10:
    *a2 = sizeOut;
  return v7;
}

void *AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoPixelAspectRatioHorizontalSpacingKey"));
  v4 = objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoPixelAspectRatioVerticalSpacingKey"));
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0CA8E60]);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0CA8E70]);
  return v2;
}

void *AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoCleanApertureWidthKey"));
  v4 = objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoCleanApertureHeightKey"));
  v5 = objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoCleanApertureHorizontalOffsetKey"));
  v6 = objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoCleanApertureVerticalOffsetKey"));
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0CA8D60]);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0CA8D40]);
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x1E0CA8D48]);
  if (v6)
    objc_msgSend(v2, "setObject:forKey:", v6, *MEMORY[0x1E0CA8D58]);
  return v2;
}

void *getLoadedTimeRangesFromTimeIntervals(void *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CMTimeEpoch v9;
  uint64_t i;
  void *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  __int128 v15;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange rhs;
  CMTime lhs;
  CMTime v20;
  CMTime v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!a1)
    return 0;
  v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = *MEMORY[0x1E0CC4FD8];
    v8 = *MEMORY[0x1E0CC4FD0];
    v15 = *MEMORY[0x1E0CA2E68];
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(a1);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        *(_OWORD *)&v21.value = v15;
        v21.epoch = v9;
        *(_OWORD *)&v20.value = v15;
        v20.epoch = v9;
        v12 = (const __CFDictionary *)objc_msgSend(v11, "objectForKey:", v7, v15);
        v13 = (const __CFDictionary *)objc_msgSend(v11, "objectForKey:", v8);
        if (v12)
          CMTimeMakeFromDictionary(&v21, v12);
        if (v13)
        {
          CMTimeMakeFromDictionary(&lhs, v13);
          rhs.start = v21;
          CMTimeSubtract(&v20, &lhs, &rhs.start);
        }
        memset(&rhs, 0, sizeof(rhs));
        start.start = v21;
        duration = v20;
        CMTimeRangeMake(&rhs, &start.start, &duration);
        start = rhs;
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &start));
      }
      v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }
  return v3;
}

void sub_1934DD2E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t encoderExistsForFormat(int a1)
{
  _BOOL8 v1;
  int *v3;
  unint64_t v4;
  int *v5;
  int v6;
  UInt32 outPropertyDataSize;

  if (a1 == 1819304813)
    return 1;
  outPropertyDataSize = 0;
  v1 = 0;
  if (!AudioFormatGetPropertyInfo(0x61636F66u, 0, 0, &outPropertyDataSize))
  {
    v3 = (int *)malloc_type_malloc(outPropertyDataSize, 0xFAFB1EFDuLL);
    v1 = 0;
    if (!AudioFormatGetProperty(0x61636F66u, 0, 0, &outPropertyDataSize, v3))
    {
      if (outPropertyDataSize >= 4)
      {
        v4 = ((unint64_t)outPropertyDataSize >> 2) - 1;
        v5 = v3;
        do
        {
          v6 = *v5++;
          v1 = v6 == a1;
        }
        while (v6 != a1 && v4-- != 0);
      }
      else
      {
        v1 = 0;
      }
    }
    free(v3);
  }
  return v1;
}

uint64_t audioChannelLayoutChannelCount(void *inSpecifier, UInt32 a2)
{
  UInt32 ioPropertyDataSize;
  unsigned int outPropertyData;

  outPropertyData = 0;
  ioPropertyDataSize = 4;
  if (AudioFormatGetProperty(0x6E63686Du, a2, inSpecifier, &ioPropertyDataSize, &outPropertyData))
    return 0;
  else
    return outPropertyData;
}

unsigned int *copyAudioChannelLayoutFromData(void *a1, unint64_t *a2)
{
  size_t v4;
  unsigned int *v5;
  unint64_t v6;

  if (!a1 || !objc_msgSend(a1, "length"))
  {
    v6 = 0;
    v5 = 0;
    if (!a2)
      return v5;
    goto LABEL_9;
  }
  v4 = objc_msgSend(a1, "length");
  v5 = (unsigned int *)malloc_type_malloc(v4, 0xA17C52CFuLL);
  if (!v5)
  {
    v6 = 0;
    if (!a2)
      return v5;
    goto LABEL_9;
  }
  objc_msgSend(a1, "getBytes:length:", v5, v4);
  v6 = 20 * v5[2] + 12;
  if (v4 < v6)
    v6 = v4;
  if (a2)
LABEL_9:
    *a2 = v6;
  return v5;
}

_DWORD *copyDefaultChannelLayoutForChannelCount(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  _DWORD *result;
  int v5;

  if (a1 == 2)
  {
    v3 = 12;
    result = malloc_type_calloc(1uLL, 0xCuLL, 0xDAACE931uLL);
    v5 = 6619138;
LABEL_5:
    *result = v5;
    if (!a2)
      return result;
    goto LABEL_6;
  }
  if (a1 == 1)
  {
    v3 = 12;
    result = malloc_type_calloc(1uLL, 0xCuLL, 0xDAACE931uLL);
    v5 = 6553601;
    goto LABEL_5;
  }
  v3 = 0;
  result = 0;
  if (!a2)
    return result;
LABEL_6:
  *a2 = v3;
  return result;
}

BOOL AVVideoOutputSettingsValidateAVPixelAspectRatioDictionaryAndReturnVTPixelAspectRatioDictionary(void *a1, _QWORD *a2, const __CFString **a3)
{
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _BOOL8 result;
  void *v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    result = 0;
    v8 = CFSTR("Value for AVVideoPixelAspectRatioKey must be an instance of NSDictionary");
    goto LABEL_5;
  }
  v6 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVVideoPixelAspectRatioHorizontalSpacingKey"), CFSTR("AVVideoPixelAspectRatioVerticalSpacingKey"), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a1, "allKeys"));
  objc_msgSend(v7, "minusSet:", v6);
  if (objc_msgSend(v7, "count"))
  {
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dictionary for AVVideoPixelAspectRatioKey contains one or more unrecognized keys: %@"), objc_msgSend((id)objc_msgSend(v7, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
    result = 0;
LABEL_5:
    *a3 = v8;
    return result;
  }
  v10 = AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(a1);
  result = AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(v10, a3);
  if (result)
  {
    *a2 = v10;
    return 1;
  }
  return result;
}

BOOL AVVideoOutputSettingsValidateAVCleanApertureDictionaryAndReturnVTCleanApertureDictionary(void *a1, void *a2, void *a3, _QWORD *a4, const __CFString **a5)
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  _BOOL8 result;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVVideoCleanApertureWidthKey"), CFSTR("AVVideoCleanApertureHeightKey"), CFSTR("AVVideoCleanApertureHorizontalOffsetKey"), CFSTR("AVVideoCleanApertureVerticalOffsetKey"), 0);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a1, "allKeys"));
    objc_msgSend(v11, "minusSet:", v10);
    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dictionary for AVVideoCleanApertureKey contains one or more unrecognized keys: %@"), objc_msgSend((id)objc_msgSend(v11, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
      v13 = 0;
      *a5 = (const __CFString *)v12;
    }
    else
    {
      v15 = AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(a1);
      v22 = 0;
      v23 = 0;
      v20 = 0;
      v21 = 0;
      v16 = AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(v15, &v23, &v22, &v21, &v20, a5);
      v17 = v16;
      if (!a2)
        goto LABEL_11;
      if (!a3)
        goto LABEL_11;
      if (!v16)
        goto LABEL_11;
      v18 = objc_msgSend(a2, "integerValue");
      v19 = objc_msgSend(a3, "integerValue");
      v24.size.width = (double)v18;
      v24.size.height = (double)v19;
      v25.size.width = (double)v23;
      v25.origin.x = (double)v18 * 0.5 - (double)v23 * 0.5 + (double)v21;
      v25.size.height = (double)v22;
      v25.origin.y = (double)v19 * 0.5 - (double)v22 * 0.5 + (double)v20;
      v24.origin.x = 0.0;
      v24.origin.y = 0.0;
      if (!CGRectContainsRect(v24, v25))
      {
        v13 = 0;
        *a5 = CFSTR("Clean aperture region must be contained within the bounds specified by width & height");
      }
      else
      {
LABEL_11:
        if (v17)
        {
          *a4 = v15;
          v13 = 1;
        }
        else
        {
          v13 = 0;
        }
      }
    }
    return v13 != 0;
  }
  else
  {
    result = 0;
    *a5 = CFSTR("Value for AVVideoCleanApertureKey must be an instance of NSDictionary");
  }
  return result;
}

uint64_t AVVideoOutputSettingsValidateVideoColorProperties(void *a1, const __CFString **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(a1, "objectForKey:", CFSTR("ColorPrimaries"));
    v5 = objc_msgSend(a1, "objectForKey:", CFSTR("TransferFunction"));
    v6 = objc_msgSend(a1, "objectForKey:", CFSTR("YCbCrMatrix"));
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    v8 = v7 || v6 == 0;
    if (v8 || (v9 = v6, objc_msgSend(a1, "count") != 3))
    {
      v12 = CFSTR("Dictionary for AVVideoColorPropertiesKey must contain all three color keys (AVVideoColorPrimariesKey, AVVideoTransferFunctionKey, AVVideoYCbCrMatrixKey) and it may not contain any other keys");
    }
    else
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ITU_R_709_2"), CFSTR("SMPTE_C"), CFSTR("P3_D65"), CFSTR("ITU_R_2020"), 0);
      if (objc_msgSend(v10, "containsObject:", v4))
      {
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ITU_R_709_2"), CFSTR("SMPTE_ST_2084_PQ"), CFSTR("ITU_R_2100_HLG"), CFSTR("Linear"), CFSTR("IEC_sRGB"), 0);
        if (objc_msgSend(v10, "containsObject:", v5))
        {
          v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ITU_R_709_2"), CFSTR("ITU_R_601_4"), CFSTR("ITU_R_2020"), 0);
          if ((objc_msgSend(v10, "containsObject:", v9) & 1) != 0)
            return 1;
          v13 = CFSTR("Value for AVVideoYCbCrMatrixKey must be one of: %@");
        }
        else
        {
          v13 = CFSTR("Value for AVVideoTransferFunctionKey must be one of: %@");
        }
      }
      else
      {
        v13 = CFSTR("Value for AVVideoColorPrimariesKey must be one of: %@");
      }
      v12 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, objc_msgSend((id)objc_msgSend(v10, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
    }
  }
  else
  {
    v12 = CFSTR("Dictionary for AVVideoColorPropertiesKey must be an NSDictionary");
  }
  v11 = 0;
  if (a2)
    *a2 = v12;
  return v11;
}

BOOL AVVideoOutputSettingsValidateMinimumFrameDuration(const __CFDictionary *a1, const __CFString **a2)
{
  int32_t v4;
  BOOL v5;
  _BOOL8 result;
  const __CFString *v7;
  CMTime v8;
  CMTime time1;
  CMTime v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    result = 0;
    v7 = CFSTR("Dictionary for AVVideoMinimumFrameDuration must be an NSDictionary");
    if (!a2)
      return result;
    goto LABEL_10;
  }
  memset(&v10, 0, sizeof(v10));
  CMTimeMakeFromDictionary(&v10, a1);
  if ((v10.flags & 0x1D) != 1)
  {
    result = 0;
    v7 = CFSTR("AVVideoMinimumFrameDuration must be numeric");
    if (!a2)
      return result;
    goto LABEL_10;
  }
  time1 = v10;
  v8 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v4 = CMTimeCompare(&time1, &v8);
  v5 = v4 <= 0;
  result = v4 > 0;
  v7 = CFSTR("AVVideoMinimumFrameDuration must be greater than kCMTimeZero");
  if (!v5)
    v7 = 0;
  if (a2)
  {
LABEL_10:
    if (!result)
      *a2 = v7;
  }
  return result;
}

uint64_t AVVideoOutputSettingsValidateFrameRateConversionAlgorithm(void *a1, const __CFString **a2)
{
  uint64_t result;
  const __CFString *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    result = 0;
    v5 = CFSTR("String for AVVideoFrameRateConversionAlgorithm must be an NSString");
    if (!a2)
      return result;
    goto LABEL_9;
  }
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmFast")) & 1) != 0)
    return 1;
  result = objc_msgSend(a1, "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmPrecise"));
  v5 = CFSTR("AVVideoFrameRateConversionAlgorithm must be either AVVideoFrameRateConversionAlgorithmFast or AVVideoFrameRateConversionAlgorithmPrecise");
  if ((_DWORD)result)
    v5 = 0;
  if (a2)
  {
LABEL_9:
    if ((result & 1) == 0)
    {
      result = 0;
      *a2 = v5;
    }
  }
  return result;
}

BOOL AVVideoOutputSettingsValidateEmitSequencesAtSyncFramesOnly(void *a1, const __CFString **a2)
{
  uint64_t v4;
  BOOL v5;
  _BOOL8 result;
  const __CFString *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    result = 0;
    v7 = CFSTR("AVVideoEmitSequencesAtSyncFramesOnly must be an NSNumber");
    if (!a2)
      return result;
    goto LABEL_7;
  }
  v4 = objc_msgSend(a1, "integerValue");
  v5 = v4 <= 0;
  result = v4 > 0;
  v7 = CFSTR("AVVideoEmitSequencesAtSyncFramesOnly must be greater than zero");
  if (!v5)
    v7 = 0;
  if (a2)
  {
LABEL_7:
    if (!result)
      *a2 = v7;
  }
  return result;
}

BOOL AVVideoOutputSettingsExtractPixelAspectRatioAndCleanApertureFromAVVideoSettingsDictionary(void *a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v31;

  v31 = 0;
  v12 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoCompressionPropertiesKey"));
  v13 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoPixelAspectRatioKey"));
  if (v13)
    v14 = AVVideoOutputSettingsValidateAVPixelAspectRatioDictionaryAndReturnVTPixelAspectRatioDictionary(v13, a4, &v31);
  else
    v14 = 1;
  v15 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("AVVideoCleanApertureKey"));
  if (v14 && v15)
    v14 = AVVideoOutputSettingsValidateAVCleanApertureDictionaryAndReturnVTCleanApertureDictionary(v15, a2, a3, a5, &v31);
  if (!v14 || !v12)
    goto LABEL_49;
  v16 = objc_msgSend(v12, "objectForKey:", CFSTR("AVVideoPixelAspectRatioKey"));
  if (v16)
  {
    if (*a4)
    {
      v14 = 0;
      v17 = CFSTR("AVVideoPixelAspectRatioKey can only be specified at the top level of the dictionary or in the AVVideoCompressionPropertiesKey sub-dictionary, not both");
LABEL_17:
      v31 = v17;
      goto LABEL_18;
    }
    v18 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      v17 = CFSTR("Value for AVVideoPixelAspectRatioKey must be an instance of NSDictionary");
      goto LABEL_17;
    }
    v19 = AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(v18);
    if (!AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(v19, &v31))
    {
      v14 = 0;
      goto LABEL_18;
    }
    *a4 = v19;
  }
  v14 = 1;
LABEL_18:
  v20 = objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CED140]);
  if (v14)
  {
    v21 = (void *)v20;
    if (v20)
    {
      if (*a4)
      {
        v22 = CFSTR("Pixel aspect ratio can only be specified once");
LABEL_33:
        v31 = v22;
        goto LABEL_34;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = CFSTR("Value for pixel aspect ratio must be an instance of NSDictionary");
        goto LABEL_33;
      }
      if (!AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(v21, &v31))
      {
LABEL_34:
        objc_msgSend(v12, "objectForKey:", CFSTR("AVVideoCleanApertureKey"));
        goto LABEL_35;
      }
      *a4 = v21;
      v14 = 1;
    }
  }
  v23 = objc_msgSend(v12, "objectForKey:", CFSTR("AVVideoCleanApertureKey"));
  if (v14)
  {
    v24 = (void *)v23;
    if (v23)
    {
      if (*a5)
      {
        v14 = 0;
        v25 = CFSTR("AVVideoCleanApertureKey can only be specified at the top level of the dictionary or in the AVVideoCompressionPropertiesKey sub-dictionary, not both");
LABEL_38:
        v31 = v25;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
        v25 = CFSTR("Value for AVVideoCleanApertureKey must be an instance of NSDictionary");
        goto LABEL_38;
      }
      v26 = AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(v24);
      if (!AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(v26, 0, 0, 0, 0, &v31))
      {
LABEL_35:
        v14 = 0;
        goto LABEL_39;
      }
      *a5 = v26;
      v14 = 1;
    }
  }
LABEL_39:
  v27 = objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CECF38]);
  if (v14)
  {
    v28 = (void *)v27;
    if (v27)
    {
      if (*a5)
      {
        v14 = 0;
        v29 = CFSTR("Clean aperture can only be specified once");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(v28, 0, 0, 0, 0, &v31))
          {
            *a5 = v28;
            v14 = 1;
            if (!a6)
              return v14;
          }
          else
          {
            v14 = 0;
            if (!a6)
              return v14;
          }
          goto LABEL_50;
        }
        v14 = 0;
        v29 = CFSTR("Value for clean aperture must be an instance of NSDictionary");
      }
      v31 = v29;
    }
  }
LABEL_49:
  if (a6)
LABEL_50:
    *a6 = v31;
  return v14;
}

BOOL AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(void *a1, const __CFString **a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _BOOL8 result;
  const __CFString *v9;

  v4 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CA8E60]);
  v5 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CA8E70]);
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    result = 0;
    v9 = CFSTR("Dictionary for AVVideoPixelAspectRatioKey must contain NSNumber values for both AVVideoPixelAspectRatioHorizontalSpacingKey and AVVideoPixelAspectRatioVerticalSpacingKey");
    if (!a2)
      return result;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "integerValue") < 1)
  {
    result = 0;
    v9 = CFSTR("Dictionary for AVVideoPixelAspectRatioKey must specify a positive value for AVVideoPixelAspectRatioHorizontalSpacingKey");
    if (!a2)
      return result;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v5, "integerValue");
  v7 = v6 <= 0;
  result = v6 > 0;
  v9 = CFSTR("Dictionary for AVVideoPixelAspectRatioKey must specify a positive value for AVVideoPixelAspectRatioVerticalSpacingKey");
  if (!v7)
    v9 = 0;
  if (a2)
  {
LABEL_9:
    if (!result)
      *a2 = v9;
  }
  return result;
}

uint64_t AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, const __CFString **a6)
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  const __CFString *v22;

  v12 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CA8D60]);
  v13 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CA8D40]);
  v14 = (void *)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CA8D48]);
  v15 = objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CA8D58]);
  if (v12)
  {
    if (v13)
    {
      if (v14)
      {
        v16 = (void *)v15;
        if (v15)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  v17 = objc_msgSend(v12, "integerValue");
                  v18 = objc_msgSend(v13, "integerValue");
                  v19 = objc_msgSend(v14, "integerValue");
                  v20 = objc_msgSend(v16, "integerValue");
                  if (v17 < 1)
                  {
                    v22 = CFSTR("Dictionary for AVVideoCleanApertureKey must specify a positive value for AVVideoCleanApertureWidthKey");
                  }
                  else
                  {
                    if (v18 >= 1)
                    {
                      if (a2)
                        *a2 = v17;
                      if (a3)
                        *a3 = v18;
                      if (a4)
                        *a4 = v19;
                      if (a5)
                        *a5 = v20;
                      return 1;
                    }
                    v22 = CFSTR("Dictionary for AVVideoCleanApertureKey must specify a positive value for AVVideoCleanApertureHeightKey");
                  }
                }
                else
                {
                  v22 = CFSTR("Value for AVVideoCleanApertureVerticalOffsetKey must be an instance of NSNumber");
                }
              }
              else
              {
                v22 = CFSTR("Value for AVVideoCleanApertureHorizontalOffsetKey must be an instance of NSNumber");
              }
            }
            else
            {
              v22 = CFSTR("Value for AVVideoCleanApertureHeightKey must be an instance of NSNumber");
            }
          }
          else
          {
            v22 = CFSTR("Value for AVVideoCleanApertureWidthKey must be an instance of NSNumber");
          }
        }
        else
        {
          v22 = CFSTR("Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureVerticalOffsetKey");
        }
      }
      else
      {
        v22 = CFSTR("Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureHorizontalOffsetKey");
      }
    }
    else
    {
      v22 = CFSTR("Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureHeightKey");
    }
  }
  else
  {
    v22 = CFSTR("Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureWidthKey");
  }
  result = 0;
  if (a6)
    *a6 = v22;
  return result;
}

__CFString *AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(__CFString *result)
{
  __CFString *v1;

  if (result)
  {
    v1 = result;
    if ((-[__CFString isEqualToString:](result, "isEqualToString:", *MEMORY[0x1E0CA53A0]) & 1) != 0)
    {
      return CFSTR("AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted");
    }
    else if ((-[__CFString isEqualToString:](v1, "isEqualToString:", *MEMORY[0x1E0CA53D0]) & 1) != 0)
    {
      return CFSTR("AVCoordinatedPlaybackSuspensionReasonStallRecovery");
    }
    else if ((-[__CFString isEqualToString:](v1, "isEqualToString:", *MEMORY[0x1E0CA53B8]) & 1) != 0)
    {
      return CFSTR("AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial");
    }
    else if ((-[__CFString isEqualToString:](v1, "isEqualToString:", *MEMORY[0x1E0CA53D8]) & 1) != 0)
    {
      return CFSTR("AVCoordinatedPlaybackSuspensionReasonUserActionRequired");
    }
    else if ((-[__CFString isEqualToString:](v1, "isEqualToString:", *MEMORY[0x1E0CA53B0]) & 1) != 0)
    {
      return CFSTR("AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible");
    }
    else if (-[__CFString isEqualToString:](v1, "isEqualToString:", *MEMORY[0x1E0CA53A8]))
    {
      return CFSTR("AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime");
    }
    else
    {
      return v1;
    }
  }
  return result;
}

uint64_t AVPlaybackCoordinatorArrayContainsSameElementsAsArray(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a1);
  return objc_msgSend(v3, "isEqualToSet:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a2));
}

void *AVPlaybackCoordinatorArrayMinusArray(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  objc_msgSend(v3, "removeObjectsInArray:", a2);
  return v3;
}

id AVPlaybackCoordinatorGetNSUUIDFromCFUUID(CFUUIDRef uuid)
{
  CFStringRef v1;
  void *v2;

  if (uuid)
  {
    v1 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], uuid);
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v1);
    if (v1)
      CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

CFUUIDRef AVPlaybackCoordinatorCreateCFUUIDFromNSUUID(CFUUIDRef result)
{
  if (result)
    return CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)-[__CFUUID UUIDString](result, "UUIDString"));
  return result;
}

id AVPlaybackCoordinatorMakeUserInfoForDidIssueCommandToPlaybackObjectNotification(void *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5310]);
  v4 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5308]);
  v5 = objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5318]);
  v6 = objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5320]);
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA5400]) & 1) != 0)
  {
    v7 = CFSTR("AVPlaybackCoordinatorPlaybackObjectCommandSetRate");
    if (!v3)
      goto LABEL_12;
LABEL_11:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3), CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyParticipantUUID"));
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA5410]) & 1) != 0)
  {
    v7 = CFSTR("AVPlaybackCoordinatorPlaybackObjectCommandSetTime");
    if (v3)
      goto LABEL_11;
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA5408]))
      v7 = CFSTR("AVPlaybackCoordinatorPlaybackObjectCommandSetRateAndTime");
    else
      v7 = 0;
    if (v3)
      goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyCommand"));
  if (v5)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyRate"));
  if (v6)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyTime"));
  return v2;
}

void sub_1934E5728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVPlayerPlaybackCoordinatorBroadcastTransportControlStateCallback(void *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1940343FC]();
  v5 = (void *)objc_msgSend(a1, "coordinationMediumDelegate");
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Identifier"));
  objc_msgSend(a1, "_updateTransportControlStateDictionaryWithTransportControlState:", a2);
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "playbackCoordinator:broadcastTransportControlStateDictionary:forItemWithIdentifier:", a1, a2, objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA5418]));
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(a1, "setCoordinationMediumDelegate:", 0);
  }
  objc_msgSend((id)objc_msgSend(a1, "interstitialPlaybackCoordinator", v8, v9), "_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:", v6);
  objc_msgSend((id)objc_msgSend(a1, "primaryPlaybackCoordinatorForInterstitial"), "_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:", v6);
  objc_autoreleasePoolPop(v4);
}

void AVPlayerPlaybackCoordinatorBroadcastParticipantStateCallback(void *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1940343FC]();
  v5 = (void *)objc_msgSend(a1, "coordinationMediumDelegate");
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UUID"));
  objc_msgSend(a1, "_updateParticipantStateDictionaryWithParticipantState:", a2);
  objc_msgSend(a1, "_removeUnusedTransportControlStates");
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "playbackCoordinator:broadcastLocalParticipantStateDictionary:", a1, a2);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(a1, "setCoordinationMediumDelegate:", 0);
  }
  objc_msgSend((id)objc_msgSend(a1, "interstitialPlaybackCoordinator", v8, v9), "_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:", v6);
  objc_msgSend((id)objc_msgSend(a1, "primaryPlaybackCoordinatorForInterstitial"), "_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:", v6);
  objc_autoreleasePoolPop(v4);
}

void AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v12[27];

  v12[26] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1940343FC]();
  v9 = objc_msgSend(a1, "coordinationMediumDelegate");
  if (a1 && (v10 = (void *)v9, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke;
    v12[3] = &unk_1E30314D8;
    v12[4] = a1;
    v12[5] = a4;
    v12[6] = a3;
    objc_msgSend(v10, "playbackCoordinator:reloadTransportControlStateForItemWithIdentifier:completionHandler:", a1, a2, v12);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(a1, "setCoordinationMediumDelegate:", 0);
    a4(a3);
  }
  objc_autoreleasePoolPop(v8);
}

void sub_1934E5E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E5F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E6154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934E6508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E6620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E68D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934E6A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934E6E34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934E6F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E72B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E742C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E7F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E83B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E8914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E8BBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934E8CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E949C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934E9868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934EA204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *audioValueRangeArrayWithAudioValueRanges(uint64_t a1, uint64_t a2)
{
  void *v4;
  double *v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a2 >= 1)
  {
    v5 = (double *)(a1 + 8);
    do
    {
      objc_msgSend(v4, "addObject:", +[AVFloat64Range float64RangeWithAudioValueRange:](AVFloat64Range, "float64RangeWithAudioValueRange:", *(v5 - 1), *v5));
      v5 += 2;
      --a2;
    }
    while (a2);
  }
  return v4;
}

uint64_t indexOfValueInAudioValueRangeArray(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    goto LABEL_26;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v17;
LABEL_3:
  v10 = 0;
  v11 = v8;
  while (1)
  {
    if (*(_QWORD *)v17 != v9)
      objc_enumerationMutation(a1);
    v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
    objc_msgSend(v8, "minimum");
    if (v12 > a3)
      break;
    objc_msgSend(v8, "maximum");
    if (v13 >= a3)
    {
      if (v8)
        return objc_msgSend(a1, "indexOfObject:", v8);
      break;
    }
    ++v10;
    v11 = v8;
    if (v7 == v10)
    {
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v11 = v8;
      if (v7)
        goto LABEL_3;
      break;
    }
  }
  if (v11)
  {
    v14 = objc_msgSend(a1, "indexOfObject:", v11);
    if (a2 != -1)
    {
      if (a2 == 1)
      {
        if (v14 < objc_msgSend(a1, "count") - 1)
          ++v14;
      }
      else
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  else
  {
LABEL_26:
    if (objc_msgSend(a1, "count"))
      return 0;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v14;
}

void sub_1934EC5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934ECA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avad_downloadSuccessCallback(void *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_downloadSuccessCallback");
  objc_autoreleasePoolPop(v2);
}

void avad_downloadFailureCallback(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_downloadFailureCallbackWithError:", a3);
  objc_autoreleasePoolPop(v5);
}

void avad_loadedTimeRangeChangedCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;

  v11 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange:currentLoadedTimeRanges:timeRangeExpectedToLoad:selectedMediaArray:", a3, a4, a5, a6);
  objc_autoreleasePoolPop(v11);
}

void avad_didResolveMediaSelection(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_sendDidResolveMediaSelectionWithMediaSelection:", a3);
  objc_autoreleasePoolPop(v5);
}

void avad_didFinishDownloadForMediaSelection(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_sendDidFinishDownloadForMediaSelectionWithMediaSelection:", a3);
  objc_autoreleasePoolPop(v5);
}

void avad_progressUpdate(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_sendProgessUpdateWithExpectedBytesToDownload:bytesDownloaded:", a3, a4);
  objc_autoreleasePoolPop(v7);
}

void avad_willDownloadAlternates(void *a1, uint64_t a2, const __CFArray *a3)
{
  void *v5;
  void *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  AVAssetVariant *v10;
  AVAssetVariant *v11;

  v5 = (void *)MEMORY[0x1940343FC]();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a3)
  {
    Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      v8 = Count;
      for (i = 0; i != v8; ++i)
      {
        v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", CFArrayGetValueAtIndex(a3, i));
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v6, "addObject:", v10);

        }
      }
    }
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(a1, "_sendWillDownloadVariants:", v6);
  objc_autoreleasePoolPop(v5);
}

void sub_1934EED34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avAssetDownloadSession_figAssetNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = (void *)MEMORY[0x1940343FC]();
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3678]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3670]))
    {
      CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CC3900]);
      if (!FigCFEqual() && !FigCFEqual() && !FigCFEqual())
        goto LABEL_18;
    }
    else
    {
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3668]))
      {
        v10 = a2;
        v11 = 3;
        v12 = 0;
LABEL_17:
        objc_msgSend(v10, "_transitionToTerminalStatus:error:", v11, v12);
        goto LABEL_18;
      }
      if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3660]))
      {
        if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3688]))
          goto LABEL_18;
        v9 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0);
        goto LABEL_16;
      }
    }
    v9 = objc_msgSend(a2, "_errorFromAssetNotificationPayload:", a5);
LABEL_16:
    v12 = v9;
    v10 = a2;
    v11 = 4;
    goto LABEL_17;
  }
  CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CC3900]);
  if (FigCFEqual())
  {
    objc_msgSend(a2, "_primeCacheOnDispatchQueue");
    goto LABEL_18;
  }
  if (FigCFEqual())
  {
    v9 = objc_msgSend(a2, "_verifyDownloadConfigurationForAssetType");
    if (v9)
      goto LABEL_16;
  }
LABEL_18:
  objc_autoreleasePoolPop(v8);
}

void avAssetDownloadSession_figPlaybackItemNotificationCallback(uint64_t a1, void *a2, const void *a3)
{
  void *v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD, char *);
  signed int v10;
  BOOL v11;
  signed int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;

  v5 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC4CE0]))
  {
    v16 = 0;
    objc_msgSend(a2, "_playbackItem");
    FigBaseObject = FigPlaybackItemGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC5128], *MEMORY[0x1E0C9AE50]);
    v8 = objc_msgSend(a2, "_playbackItem");
    v9 = *(uint64_t (**)(uint64_t, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v9)
    {
      v10 = v9(v8, 0, &v16);
      if (v10)
        v11 = 1;
      else
        v11 = v16 == 0;
      if (!v11)
        goto LABEL_13;
      v12 = v10;
      if (!v10)
        goto LABEL_19;
    }
    else
    {
      v12 = -12782;
    }
    if (objc_msgSend(a2, "URL"))
    {
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = objc_msgSend(a2, "URL");
      v15 = (void *)objc_msgSend(v13, "dictionaryWithObject:forKey:", v14, *MEMORY[0x1E0CB3308]);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(a2, "_transitionToTerminalStatus:error:", 4, AVLocalizedErrorWithUnderlyingOSStatus(v12, v15));
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC4DC8]))
  {
LABEL_13:
    objc_msgSend(a2, "_readyForInspection");
  }
LABEL_19:
  objc_autoreleasePoolPop(v5);
}

void AVPlayerItemVideoOutput_figVCSequentialAvailableCallback(uint64_t a1, __int128 *a2, char a3, void *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  _QWORD block[6];
  _QWORD v16[5];

  v7 = (void *)MEMORY[0x1940343FC]();
  v8 = objc_msgSend(a4, "referencedObject");
  if (v8)
  {
    v9 = *(_QWORD *)(v8 + 16);
    if (*(_BYTE *)(v9 + 108))
    {
      v10 = *(NSObject **)(v9 + 56);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke;
      v16[3] = &unk_1E302FA10;
      v16[4] = v8;
      v11 = v16;
    }
    else
    {
      v10 = *(NSObject **)(v9 + 56);
      if ((a3 & 1) != 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_2;
        block[3] = &unk_1E302FCE8;
        block[4] = v9;
        block[5] = v8;
        v11 = block;
      }
      else
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_3;
        v12[3] = &unk_1E3031E68;
        v12[4] = v9;
        v13 = *a2;
        v14 = *((_QWORD *)a2 + 2);
        v11 = v12;
      }
    }
    dispatch_sync(v10, v11);
  }
  objc_autoreleasePoolPop(v7);
}

dispatch_time_t AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(uint64_t a1, CMTime *a2, Float64 a3)
{
  const void *v5;
  CMClockRef HostTimeClock;
  OpaqueCMClock *v7;
  CMTime v9;
  CMTime v10;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v14;
  CMTime v15;

  v15 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  memset(&v14, 0, sizeof(v14));
  v5 = *(const void **)(a1 + 8);
  HostTimeClock = CMClockGetHostTimeClock();
  time = *a2;
  CMSyncConvertTime(&v14, &time, v5, HostTimeClock);
  memset(&time, 0, sizeof(time));
  CMTimeMakeWithSeconds(&time, a3, 1000);
  lhs = v14;
  rhs = time;
  CMTimeSubtract(&v15, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  v7 = CMClockGetHostTimeClock();
  CMClockGetTime(&v10, v7);
  rhs = v15;
  CMTimeSubtract(&lhs, &rhs, &v10);
  rhs = lhs;
  CMTimeConvertScale(&v9, &rhs, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return dispatch_time(0, v9.value & ~(v9.value >> 63));
}

void sub_1934F0DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F0FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F17A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _targetReadOnlyTimebaseAtDummyTimebase()
{
  OpaqueCMClock *HostTimeClock;
  CMTimebaseRef timebaseOut;

  timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  if (!CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut))
    FigReadOnlyTimebaseSetTargetTimebase();
  if (timebaseOut)
    CFRelease(timebaseOut);
}

void sub_1934F19B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934F1AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F1DC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1934F22B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934F24A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F2D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F3538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1934F391C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F3AA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934F3DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F3EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F4158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F48E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F4B48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1934F4DBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1934F4FC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t _enqueueSingleSampleBufferStatic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)a3, "_enqueueSingleSampleBuffer:bufferEnqueueingInfo:", a1, *(_QWORD *)(a3 + 8));
  else
    return FigSignalErrorAt();
}

void sub_1934F54FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1934F5818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__70(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose__71(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void sub_1934F5DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F6058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F637C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F65A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934F6790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934F69B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F6BBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1934F6FB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934F7254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F74C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F7650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1934F7804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934F7AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934F7D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934F817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F8328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F84FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934F88D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F8A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F8B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934F8C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void _figVideoQueueDidDropBelowLowWaterLevel(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_refreshAboveHighWaterLevel");
  objc_autoreleasePoolPop(v3);
}

void _figVideoQueueDecodeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  signed int v8;
  uint64_t v9;
  const __CFDictionary *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CMTime v17;
  CMTime v18;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC63F0]), "intValue");
    v9 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC63E8]);
    v10 = (const __CFDictionary *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC63F8]);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v11, "setObject:forKey:", CFSTR("vide"), CFSTR("AVErrorMediaTypeKey"));
  if (v9)
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9), CFSTR("AVErrorMediaSubTypeKey"));
  if (v10)
  {
    memset(&v18, 0, sizeof(v18));
    CMTimeMakeFromDictionary(&v18, v10);
    v17 = v18;
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v17), CFSTR("AVErrorPresentationTimeStampKey"));
  }
  v12 = AVLocalizedErrorWithUnderlyingOSStatus(v8, v11);
  v13 = (void *)MEMORY[0x1E0CB37C0];
  if (v12)
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, CFSTR("AVSampleBufferVideoRendererDidFailToDecodeNotificationErrorKey"));
  else
    v14 = 0;
  v15 = objc_msgSend(v13, "notificationWithName:object:userInfo:", CFSTR("AVSampleBufferVideoRendererDidFailToDecodeNotification"), a2, v14);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v15);
  if (v12)
    v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, CFSTR("AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey"));
  else
    v16 = 0;
  objc_msgSend(a2, "_fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:", CFSTR("AVSampleBufferDisplayLayerFailedToDecodeNotification"), v16);
  objc_autoreleasePoolPop(v7);
}

void _figVideoQueueFlushComplete(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_flushComplete");
  objc_autoreleasePoolPop(v3);
}

void _figVideoQueueCompletedDecodeForPreroll(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  uint64_t v8;

  v7 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC6400]), "intValue");
  else
    v8 = 0;
  objc_msgSend(a2, "_completedDecodeForPrerollForRequestID:", v8);
  objc_autoreleasePoolPop(v7);
}

void _figVideoQueueExternalProtectionStatusChanged(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  void *v6;
  const void *v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = a2[17];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___figVideoQueueExternalProtectionStatusChanged_block_invoke;
  block[3] = &unk_1E3031F48;
  block[5] = &v13;
  block[6] = a4;
  block[4] = &v9;
  dispatch_sync(v5, block);
  if (!*((_DWORD *)v10 + 6))
  {
    v6 = (void *)objc_msgSend((id)v14[3], "valueForKey:", *MEMORY[0x1E0CC63D0]);
    objc_msgSend(a2, "_setOutputObscuredDueToInsufficientExternalProtection:", objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CC63D8]));
  }
  v7 = (const void *)v14[3];
  if (v7)
    CFRelease(v7);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

void sub_1934F9254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void _figVideoQueueFailed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const __CFNumber *Value;
  const __CFNumber *v9;
  CFTypeID v10;
  uint64_t v11;
  signed int valuePtr;

  v7 = (void *)MEMORY[0x1940343FC]();
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0CC63F0]);
  if (Value && (v9 = Value, v10 = CFGetTypeID(Value), v10 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
    v11 = AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a2, "_setStatus:error:", 2, v11);
  objc_autoreleasePoolPop(v7);
}

void _figVideoQueueServerConnectionDied(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_setStatus:error:", 2, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0));
  objc_autoreleasePoolPop(v3);
}

void _figVideoQueueServerDependencyLost(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_setStatus:error:", 2, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0));
  objc_autoreleasePoolPop(v3);
}

void _figVideoQueueLostDecoderState(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_setRequiresFlushToResumeDecoding:", 1);
  objc_autoreleasePoolPop(v3);
}

void _figVideoQueueFirstVideoFrameEnqueued(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "setReadyForDisplayWithoutKVO:", 1);
  if (dword_1EE2B01F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_autoreleasePoolPop(v3);
}

uint64_t ___figVideoQueueExternalProtectionStatusChanged_block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, uint64_t);

  result = a1[6];
  if (result)
  {
    v3 = *(_QWORD *)(a1[5] + 8);
    CMBaseObject = FigVideoQueueGetCMBaseObject();
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
      result = v5(CMBaseObject, *MEMORY[0x1E0CC6430], *MEMORY[0x1E0C9AE00], v3 + 24);
    else
      result = 4294954514;
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

void sub_1934F9BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934F9FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1934FA140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FA330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1934FA554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1934FAC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FADB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void customURLHandlerRequestCancelled(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a1, "_customURLHandler") == a2)
    objc_msgSend(a1, "_cancelRequest:requestID:", a3, a4);
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v8);
}

void customURLAuthHandlerRequestCancelled(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a1, "_authHandler") == a2)
    objc_msgSend(a1, "_cancelRequest:requestID:", a3, a4);
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v8);
}

uint64_t avarl_createAndInstallRemoteHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD, uint64_t);
  uint64_t v10;

  if (!a1)
    return 0;
  v8 = FigCustomURLHandlerRemoteCreateWithID();
  if ((_DWORD)v8)
    return v8;
  v9 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v9)
    return 4294954514;
  v10 = v9(a3, 0, a4);
  if (!(_DWORD)v10)
    *a5 = 0;
  return v10;
}

void sub_1934FB728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FB960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FBAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FBEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FC348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FC650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FC794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVCanWriteFilesToDirectoryAtURL(void *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  uint64_t v12;
  id v13;

  if (!a1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL AVCanWriteFilesToDirectoryAtURL(NSURL *, NSError **)"), CFSTR("AVFileSystemUtilities.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryURL != nil"));
  }
  v13 = 0;
  v4 = objc_msgSend(a1, "URLByAppendingPathComponent:", CFSTR("TemporaryFileForAVFoundation"));
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "data"), "writeToURL:options:error:", v4, 0, &v13);
  if ((_DWORD)v5)
  {
    v12 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v4, &v12);
  }
  else
  {
    v6 = (void *)objc_msgSend(v13, "domain");
    v7 = *MEMORY[0x1E0CB28A8];
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(v13, "code") == 4)
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(v13, "userInfo"), "mutableCopy");
      objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x1E0CB2AA0]);
      v9 = *MEMORY[0x1E0CB3308];
      objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x1E0CB3308]);
      objc_msgSend(v8, "setObject:forKey:", a1, v9);
      v13 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, 4, v8);

    }
    if (a2)
      *a2 = v13;
  }
  return v5;
}

void avrendersynchronizer_timebaseRateChanged(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_updateRateFromTimebase");
  objc_autoreleasePoolPop(v3);
}

void sub_1934FE874(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1934FECE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1934FEF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FF0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1934FF2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v1 = *(void **)(a1 + 72);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v1);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v5)
          {
            if (objc_msgSend((id)objc_msgSend(v9, "_sampleBufferVideoRenderer"), "_STSLabel"))
              v5 = v9;
            else
              v5 = 0;
          }
          if (!v4)
            v4 = v9;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && !v6)
          {
            if (objc_msgSend(v9, "_STSLabel"))
              v6 = (uint64_t)v9;
            else
              v6 = 0;
          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  v10 = *(void **)(a1 + 104);
  if (v10)
  {
    v10 = (void *)objc_msgSend(v10, "_STSLabel");
    if (v10)
      v10 = *(void **)(a1 + 104);
    else
      *(_QWORD *)(a1 + 104) = 0;
  }
  if (objc_msgSend(v10, "_displayLayer") && v6)
    goto LABEL_29;
  v11 = *(void **)(a1 + 104);
  if (!v11)
  {
    if (!v6)
    {
      if (v5)
      {
        v19 = v5;
      }
      else
      {
        objc_msgSend(v4, "setSTSLabel:", +[AVSampleBufferRenderSynchronizer _makeSTSLabel](AVSampleBufferRenderSynchronizer, "_makeSTSLabel"));
        v19 = v4;
      }
      v6 = objc_msgSend(v19, "_sampleBufferVideoRenderer");
    }
LABEL_29:
    *(_QWORD *)(a1 + 104) = v6;
    v11 = (void *)v6;
  }
  v12 = objc_msgSend(v11, "_STSLabel");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = *(void **)(a1 + 72);
  result = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (result)
  {
    v15 = result;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v18, "setSTSLabel:", v12);
        ++v17;
      }
      while (v15 != v17);
      result = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v15 = result;
    }
    while (result);
  }
  return result;
}

void sub_1934FF8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

id avrendersynchronize_getTimebaseObserverForRenderer(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
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
  v4 = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        if (objc_msgSend(v8, "objectForKey:", CFSTR("renderer")) == a1)
        {
          v4 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("onceTimebaseObserver"));
          return v4;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v4 = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

id avrendersynchronize_getClientCompletionHandlerForRenderer(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
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
  v4 = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        if (objc_msgSend(v8, "objectForKey:", CFSTR("renderer")) == a1)
        {
          v4 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("clientCompletionHandler"));
          return v4;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v4 = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

uint64_t avrendersynchronize_removeTimebaseObserverForRenderer(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        result = objc_msgSend(v8, "objectForKey:", CFSTR("renderer"));
        if (result == a1)
        {
          if (v8)
            return objc_msgSend(a2, "removeObject:", v8);
          return result;
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

void sub_1935001AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void avrendersynchronize_performRendererRemoval(uint64_t a1, void *a2)
{
  id TimebaseObserverForRenderer;
  id ClientCompletionHandlerForRenderer;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[9];
  CFTypeRef v13;

  v13 = 0;
  TimebaseObserverForRenderer = avrendersynchronize_getTimebaseObserverForRenderer((uint64_t)a2, *(void **)(a1 + 80));
  ClientCompletionHandlerForRenderer = avrendersynchronize_getClientCompletionHandlerForRenderer((uint64_t)a2, *(void **)(a1 + 80));
  avrendersynchronize_removeTimebaseObserverForRenderer((uint64_t)a2, *(void **)(a1 + 80));
  objc_msgSend(a2, "copyFigSampleBufferAudioRenderer:", &v13);
  objc_msgSend(a2, "setRenderSynchronizer:error:", 0, 0);
  objc_msgSend(*(id *)(a1 + 72), "removeObject:", a2);
  v6 = +[AVSampleBufferRenderSynchronizer _videoRendererForRenderer:](AVSampleBufferRenderSynchronizer, "_videoRendererForRenderer:", a2);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v6));
    if (v7 == *(id *)(a1 + 104))
      *(_QWORD *)(a1 + 104) = 0;
  }
  avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(a1);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(NSObject **)(a1 + 64);
  if (v8)
    CFRetain(*(CFTypeRef *)(a1 + 96));
  if (v13)
    CFRetain(v13);
  dispatch_retain(v9);
  v10 = TimebaseObserverForRenderer;
  v11 = *(NSObject **)(a1 + 88);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __avrendersynchronize_performRendererRemoval_block_invoke;
  v12[3] = &unk_1E3035438;
  v12[7] = v13;
  v12[8] = v8;
  v12[5] = TimebaseObserverForRenderer;
  v12[6] = ClientCompletionHandlerForRenderer;
  v12[4] = v9;
  dispatch_async(v11, v12);
  if (v13)
    CFRelease(v13);
}

BOOL avsbrs_rendererIsAudioRenderer(void *a1)
{
  CFTypeRef v1;
  CFTypeRef cf;

  cf = 0;
  objc_msgSend(a1, "copyFigSampleBufferAudioRenderer:", &cf);
  v1 = cf;
  if (cf)
    CFRelease(cf);
  return v1 != 0;
}

void __avrendersynchronize_performRendererRemoval_block_invoke(_QWORD *VTable)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  void *v5;
  NSObject *v6;
  const void *v7;
  const void *v8;
  _QWORD block[5];

  v1 = VTable;
  v2 = VTable[7];
  if (v2)
  {
    v3 = VTable[8];
    VTable = (_QWORD *)CMBaseObjectGetVTable();
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(VTable[2] + 16);
    if (v4)
      VTable = (_QWORD *)v4(v3, v2);
  }
  if (v1[6])
  {
    v5 = (void *)MEMORY[0x1940343FC](VTable);
    (*(void (**)(void))(v1[6] + 16))();
    objc_autoreleasePoolPop(v5);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __avrendersynchronize_performRendererRemoval_block_invoke_2;
  block[3] = &unk_1E302FA10;
  v6 = v1[4];
  block[4] = v1[5];
  dispatch_async(v6, block);
  v7 = (const void *)v1[8];
  if (v7)
    CFRelease(v7);
  v8 = (const void *)v1[7];
  if (v8)
    CFRelease(v8);
  dispatch_release((dispatch_object_t)v1[4]);
}

void __avrendersynchronize_performRendererRemoval_block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void sub_193502D70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1935030D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193503208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_193503354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193503528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19350367C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1935037B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDiscovererRoutePresentChanged(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_routePresentChanged");
  objc_autoreleasePoolPop(v3);
}

void AVFigRouteDiscovererRouteServerDied(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECE78)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_serverDied", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigRouteDiscovererEndpointDescriptorChanged(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_endpointDescriptorChanged");
  objc_autoreleasePoolPop(v3);
}

id timeline_WrapSegment(uint64_t a1)
{
  return -[AVPlayerItemSegment _initWithFigSegment:]([AVPlayerItemSegment alloc], "_initWithFigSegment:", a1);
}

void avitemintegratedtimeline_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  void *v8;
  void *v9;
  int v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = (void *)MEMORY[0x1940343FC]();
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC46F8]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC46E8]))
    {
      v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC46D0]), "integerValue");
      v17 = a2;
      v18 = 1;
    }
    else
    {
      if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC46F0]))
        goto LABEL_23;
      v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC46D0]), "integerValue");
      v17 = a2;
      v18 = 0;
    }
    objc_msgSend(v17, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v16, v18);
    goto LABEL_23;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC46E0]), "integerValue");
  v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC46D8]), "BOOLValue");
  v12 = CFSTR("AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonSegmentsChanged");
  if (v10 == 2)
    v12 = CFSTR("AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonCurrentSegmentChanged");
  if (v10 == 3)
    v13 = CFSTR("AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonLoadedTimeRangesChanged");
  else
    v13 = v12;
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonKey"));
  objc_msgSend(a2, "_issueCachedSeekIfNecessary");
  if (v10 != 2 && v11 == 0)
  {
    if (v10 == 1)
      objc_msgSend(a2, "_ensureObserversHandleSnapshotSegmentsChanged");
  }
  else
  {
    if (objc_msgSend(a2, "_currentSegmentTypeOfCurrentSnapshot"))
      v15 = objc_msgSend((id)objc_msgSend(a2, "_interstitialPlayer"), "currentItem");
    else
      v15 = objc_msgSend(a2, "_primaryItem");
    objc_msgSend(a2, "_ensureObserversAreScheduledForItem:", v15);
  }
  v19 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlayerIntegratedTimelineSnapshotsOutOfSyncNotification"), a2, v9);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v19);
LABEL_23:
  objc_autoreleasePoolPop(v8);
}

void avitemintegratedtimeline_interstitialPlayer_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, void *a4, void *a5)
{
  void *v9;

  v9 = (void *)MEMORY[0x1940343FC]();
  if (CFEqual(a3, CFSTR("AVPlayerCurrentItemDidChangeNotification"))
    && objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("ReasonForCurrentItemDidChange")), "isEqual:", CFSTR("ReasonAdvanceAtEnd"))&& objc_msgSend(a2, "_currentSegmentTypeOfCurrentSnapshot") == 1)
  {
    objc_msgSend(a2, "_ensureObserversAreScheduledForItem:", objc_msgSend(a4, "currentItem"));
  }
  objc_autoreleasePoolPop(v9);
}

void sub_19350943C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19350DFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figEndpointNotificationCallback(uint64_t a1, _QWORD *a2, void *a3, uint64_t a4, void *a5)
{
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[8];
  _QWORD block[5];

  v8 = (_QWORD *)a2[1];
  v9 = (void *)MEMORY[0x1940343FC]();
  if (figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce != -1)
    dispatch_once(&figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce, &__block_literal_global_36);
  v10 = objc_msgSend((id)figEndpointNotificationCallback_figToAVFNotificationMapping, "objectForKey:", a3);
  if (v10)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", v10, a2, a5);
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA3B88]))
  {
    AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0);
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA3AF8]))
  {
    v11 = v8[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __figEndpointNotificationCallback_block_invoke_2;
    block[3] = &unk_1E302FA10;
    block[4] = v8;
    dispatch_sync(v11, block);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = CFSTR("ExternalDevice_MFiCertificateSerialNumberChangedNotification");
LABEL_9:
    objc_msgSend(v12, "postNotificationName:object:", v13, a2);
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA3BA8]))
  {
    v14 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA49A8]);
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E0CA49B0]))
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ExternalDevice_ElectronicTollCollectionChangedNotification"), a2);
      if (objc_msgSend(v15, "valueForKey:", *MEMORY[0x1E0CA49B8]))
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = CFSTR("ExternalDevice_NavigationAidedDrivingChangedNotification");
        goto LABEL_9;
      }
    }
  }
  else
  {
    v16 = (void *)v8[2];
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA3BD0]))
    {
      if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v16, "iOSUIRequestedForApplicationURL:", objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA49C0]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA3B90]))
    {
      if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA46A0]);
        if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CA4690]) & 1) != 0)
        {
          v18 = 0;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CA4680]) & 1) != 0)
        {
          v18 = 1;
        }
        else if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CA4688]))
        {
          v18 = 2;
        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(v16, "siriRequestedWithAction:", v18);
      }
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CA3BB0]))
    {
      v19 = a2;
      v20 = a5;
      v21 = v8[10];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __figEndpointNotificationCallback_block_invoke_3;
      v22[3] = &unk_1E3030F90;
      v22[4] = v8;
      v22[5] = a5;
      v22[6] = v16;
      v22[7] = a2;
      dispatch_async(v21, v22);
    }
  }
LABEL_10:
  objc_autoreleasePoolPop(v9);
}

uint64_t __figEndpointNotificationCallback_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("ExternalDevice_ScreenBecameAvailable"), *MEMORY[0x1E0CA3830], CFSTR("ExternalDevice_ScreenBecameUnavailable"), *MEMORY[0x1E0CA3838], CFSTR("ExternalDevice_OwnsTurnByTurnNavigationChangedNotification"), *MEMORY[0x1E0CA3848], CFSTR("ExternalDevice_NightModeChangedNotification"), *MEMORY[0x1E0CA3B78], CFSTR("ExternalDevice_LimitedUIChangedNotification"), *MEMORY[0x1E0CA3B68], CFSTR("ExternalDevice_PerformanceReportNotificationPosted"), *MEMORY[0x1E0CA3B80], 0);
  figEndpointNotificationCallback_figToAVFNotificationMapping = result;
  return result;
}

void __figEndpointNotificationCallback_block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  }
}

void __figEndpointNotificationCallback_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("uuid")));
  if (*(_QWORD *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "setViewAreaIndex:andAdjacentViewAreas:forScreenID:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("viewAreaIndex")), "integerValue"), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("adjacentViewAreas")), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("uuid")));

}

void sub_19350F36C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  _Unwind_Resume(exception_object);
}

void sub_19350FA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19350FD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 232), 8);
  _Block_object_dispose((const void *)(v29 - 200), 8);
  _Block_object_dispose((const void *)(v29 - 152), 8);
  _Unwind_Resume(a1);
}

void _customCompositorPropertyChangedNotificationReceived(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a2, "_customCompositorFigPropertyDidChange");
  objc_autoreleasePoolPop(v3);
}

uint64_t _customCompositorShouldCancelPendingFramesCallback(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x1940343FC]();
  v3 = (void *)objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "_customCompositorShouldCancelPendingFrames");
  else
    v5 = 0;
  v6 = v4;
  objc_autoreleasePoolPop(v2);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldCancelPendingFramesCallback_block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = v4;
  dispatch_async(global_queue, block);
  return v5;
}

uint64_t _customCompositorShouldAnticipateRendering(uint64_t a1, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5)
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *global_queue;
  _QWORD block[5];
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v10 = (void *)MEMORY[0x1940343FC]();
  v11 = (void *)objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  v12 = v11;
  if (v11)
  {
    v24 = *a2;
    v25 = *((_QWORD *)a2 + 2);
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    v20 = *a4;
    v21 = *((_QWORD *)a4 + 2);
    v18 = *a5;
    v19 = *((_QWORD *)a5 + 2);
    v13 = objc_msgSend(v11, "_customCompositorShouldAnticipateRenderingFromTime:toTime:andThenFromTime:toTime:", &v24, &v22, &v20, &v18);
  }
  else
  {
    v13 = 0;
  }
  v14 = v12;
  objc_autoreleasePoolPop(v10);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldAnticipateRendering_block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = v12;
  dispatch_async(global_queue, block);
  return v13;
}

uint64_t _customCompositorShouldPrerollForRendering(uint64_t a1, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5, int a6)
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *global_queue;
  _QWORD block[5];
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v12 = (void *)MEMORY[0x1940343FC]();
  v13 = (void *)objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  v14 = v13;
  if (v13)
  {
    v26 = *a2;
    v27 = *((_QWORD *)a2 + 2);
    v24 = *a3;
    v25 = *((_QWORD *)a3 + 2);
    v22 = *a4;
    v23 = *((_QWORD *)a4 + 2);
    v20 = *a5;
    v21 = *((_QWORD *)a5 + 2);
    v15 = objc_msgSend(v13, "_customCompositorShouldPrerollForRenderingFromTime:toTime:andThenFromTime:toTime:requestID:", &v26, &v24, &v22, &v20, a6);
  }
  else
  {
    v15 = 0;
  }
  v16 = v14;
  objc_autoreleasePoolPop(v12);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldPrerollForRendering_block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = v14;
  dispatch_async(global_queue, block);
  return v15;
}

uint64_t _customCompositorShouldRenderFrameFromWindowCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6)
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *global_queue;
  _QWORD block[5];
  __int128 v22;
  uint64_t v23;

  v12 = (void *)MEMORY[0x1940343FC]();
  v13 = (void *)objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  v14 = v13;
  if (v13)
  {
    if (a2)
      v15 = a2;
    else
      v15 = MEMORY[0x1E0C9AA70];
    if (a3)
      v16 = a3;
    else
      v16 = MEMORY[0x1E0C9AA70];
    v22 = *a5;
    v23 = *((_QWORD *)a5 + 2);
    v17 = objc_msgSend(v13, "_compositionFrame:atTime:requiresRenderUsingSources:requiresSampleBuffersUsingSources:withInstruction:", a6, &v22, v15, v16, a4);
  }
  else
  {
    v17 = 0;
  }
  v18 = v14;
  objc_autoreleasePoolPop(v12);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldRenderFrameFromWindowCallback_block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = v14;
  dispatch_async(global_queue, block);
  return v17;
}

void ___customCompositorShouldCancelPendingFramesCallback_block_invoke(uint64_t a1)
{

}

void ___customCompositorShouldAnticipateRendering_block_invoke(uint64_t a1)
{

}

void ___customCompositorShouldPrerollForRendering_block_invoke(uint64_t a1)
{

}

void ___customCompositorShouldRenderFrameFromWindowCallback_block_invoke(uint64_t a1)
{

}

uint64_t GetBitDepthFromPixelFormatType(OSType pixelFormat)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  uint64_t UInt64;

  v1 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], pixelFormat);
  if (!v1)
    return 0;
  v2 = v1;
  if (CFDictionaryGetValue(v1, (const void *)*MEMORY[0x1E0CA90F0]))
    UInt64 = FigCFNumberGetUInt64();
  else
    UInt64 = 0;
  CFRelease(v2);
  return UInt64;
}

uint64_t AVOutputContextCreatePlatformDependentScreenOrVideoRoutingContext(void *a1, uint64_t a2)
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v7;

  v7 = 0;
  v4 = (__CFString *)objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  v5 = *MEMORY[0x1E0C9AE00];
  if (v4 == CFSTR("AVPlatformIdentifierMacOS"))
    objc_msgSend(a1, "createVideoContextWithAllocator:options:context:", v5, a2, &v7);
  else
    objc_msgSend(a1, "createPerAppSecondDisplayContextWithAllocator:options:context:", v5, a2, &v7);
  return v7;
}

void AVFigRoutingContextSystemPickerVideoRouteChanged(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_systemPickerVideoRouteChanged", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigRoutingContextRouteConfigUpdated(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C38]);
  v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C48]);
  v10 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C40]);
  v11 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C08]);
  v12 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C00]);
  v13 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48BF8]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_routeConfigUpdatedWithID:reason:initiator:endedError:deviceID:previousDeviceIDs:", Value, v9, v10, v11, v12, v13, v15, v16);
  objc_autoreleasePoolPop(v7);
}

void AVFigRoutingContextCurrentRouteChanged(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_currentRouteChanged", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigRoutingContextRouteChangeStarted(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C30]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_routeChangeStartedWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigRoutingContextRouteChangeEnded(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  const void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C30]);
  v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C28]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_routeChangeEndedWithID:reason:", Value, v9, v11, v12);
  objc_autoreleasePoolPop(v7);
}

void AVFigRoutingContextGroupConfigurationChanged(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_groupConfigurationChanged", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigRoutingContextServerConnectionDied(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_serverConnectionDied", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigRoutingContextRemoteControlChannelAvailabilityChanged(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_remoteControlChannelAvailabilityChanged", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigRoutingContextPredictedSelectedRouteDescriptorChanged(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_predictedSelectedRouteDescriptorChanged", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void AVFigVolumeControllerCanUseForRoutingContextDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canUseForRoutingContextDidChangeForRoutingContextWIthID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigVolumeControllerCanSetMasterVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canSetMasterVolumeDidChangeForRoutingContextWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigVolumeControllerMasterVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_masterVolumeDidChangeForRoutingContextWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigVolumeControllerMasterVolumeControlTypeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_masterVolumeControlTypeDidChangeForRoutingContextWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigVolumeControllerCanMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canMuteDidChangeForRoutingContextWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void AVFigVolumeControllerMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48E18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_muteDidChangeForRoutingContextWithID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void sub_1935154FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19351599C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(__CFDictionary *a1, const void *a2)
{
  if (!a2)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  CFDictionarySetValue(a1, CFSTR("showErrorPromptDictionaryToEcho"), a2);
  return 1;
}

void AVOutputContextSendCommandCompletion(uint64_t a1, uint64_t a2, signed int a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  uint64_t v7;

  v6 = (void *)MEMORY[0x1940343FC]();
  if (a3)
    v7 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  else
    v7 = 0;
  a4[2](a4, v7);

  objc_autoreleasePoolPop(v6);
}

void AVCommChannelDidReceiveData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  const void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48BF0]);
  v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48C18]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_didReceiveData:fromCommChannelUUID:", v9, Value, v11, v12);
  objc_autoreleasePoolPop(v7);
}

void AVCommChannelDidClose(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const void *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48BF0]);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "didCloseCommChannelUUID:", Value, v10, v11);
  objc_autoreleasePoolPop(v7);
}

void sub_1935178EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193517E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_193518074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVFigRoutingContextSendDataCompletion(uint64_t a1, uint64_t a2, signed int a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;

  v6 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a3)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  if (a4)
LABEL_5:
    a4[2](a4, v8);
LABEL_6:

  objc_autoreleasePoolPop(v6);
}

void AVOutputContextManagerServerConnectionDied(uint64_t a1, NSObject *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (sSharedAgentQueue == a2)
  {
    dispatch_async(a2, &__block_literal_global_356);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVFigEndpointUIAgentOutputContextManagerSharedEndpointUIAgentDidChangeNotification"), 0);
  }
  objc_autoreleasePoolPop(v3);
}

void AVOutputContextManagerShowErrorPrompt(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const __CFDictionary *Value;
  const void *v9;
  const void *v10;
  const void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = (const __CFDictionary *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48AC8]);
  v9 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D48B48]);
  v10 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D48AF8]);
  v11 = CFDictionaryGetValue(a5, CFSTR("echoedDictionary"));
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_showErrorPromptForRouteDescriptor:reason:didFailToConnectToOutputDeviceDictionary:", v9, v10, v11, v13, v14);
  objc_autoreleasePoolPop(v7);
}

uint64_t AVGetValidAudioTimePitchAlgorithms()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("LowQualityZeroLatency"), CFSTR("Spectral"), CFSTR("TimeDomain"), CFSTR("Varispeed"), 0);
}

void sub_19351A024(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351A0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351A1DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351A3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19351A4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19351A6F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

AVMovieInternal *_createMovieStorageWithLoader(void *a1)
{
  id v2;
  AVMovieInternal *v3;
  AVMovieInternal *v4;
  AVDispatchOnce *v5;
  AVDispatchOnce *makeTracksArrayOnce;

  v2 = a1;
  if (v2)
  {
    v3 = objc_alloc_init(AVMovieInternal);
    v4 = v3;
    if (v3)
    {
      objc_storeStrong((id *)&v3->loader, a1);
      v5 = objc_alloc_init(AVDispatchOnce);
      makeTracksArrayOnce = v4->makeTracksArrayOnce;
      v4->makeTracksArrayOnce = v5;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_19351A7AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351A820(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351A9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id _movieOptionsDictionaryToFigAssetOptionsDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int ShouldPreferNominalDurations;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  objc_msgSend(v3, "objectForKey:", CFSTR("AVMovieReferenceRestrictionsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = figAssetCreationFlagsForAssetReferenceRestrictionsAsNumber(v5);
  ShouldPreferNominalDurations = AVAssetShouldPreferNominalDurations(v3, (uint64_t)CFSTR("AVAssetPreferNominalDurationsKey"));
  v8 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CC37C8]);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0CC4298]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, *MEMORY[0x1E0CC3788]);
  objc_msgSend(v3, "objectForKey:", CFSTR("AVMovieShouldPrepareToOptimizeForExclusivePlaybackKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x1E0CC3848]);
  objc_msgSend(v3, "objectForKey:", CFSTR("AVMovieShouldSupportAliasDataReferencesKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, *MEMORY[0x1E0CC3898]);
  objc_msgSend(v3, "objectForKey:", 0x1E30399D8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, *MEMORY[0x1E0CC3850]);
  v14 = v6 | 0x100;
  if (!ShouldPreferNominalDurations)
    v14 = v6;
  *a2 |= v14;

  return v4;
}

void sub_19351AC08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19351ACD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351AF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19351B0E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19351B1CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351B3C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19351B4D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351B5A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351B634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AVMovie;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19351B6FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351B8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19351BA30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351BBDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351BD4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _figOptionsFromAVMovieOptions(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AVAssetShouldPreferNominalDurations(v1, (uint64_t)CFSTR("AVAssetPreferNominalDurationsKey")))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC4860]);

  }
  else
  {
    v2 = v1;
  }
  return v2;
}

void sub_19351BDE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351BF58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351C138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351C390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19351C4E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351C79C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t _configureFigObjects(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD, uint64_t *);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t CMBaseObject;
  void (*v10)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v17;
  void (*v18)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v23;
  void (*v24)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v25;
  void (*v26)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v27;
  void (*v28)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  uint64_t v35;

  v3 = a2;
  if (a1 && (v4 = *a1) != 0)
  {
    v5 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v5)
    {
      v6 = v5(v4, 0, 0, a1 + 1);
      if ((_DWORD)v6)
      {
        v7 = 0;
      }
      else
      {
        v35 = 0;
        _movieOptionsDictionaryToFigAssetOptionsDictionary(v3, &v35);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *MEMORY[0x1E0C9AE00];
        v6 = FigAssetRemoteCreateWithFormatReader();
        if (!(_DWORD)v6)
        {
          cf = 0;
          CMBaseObject = FigAssetGetCMBaseObject();
          v10 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v10)
            v10(CMBaseObject, *MEMORY[0x1E0CC3AA8], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v11 = FigAssetGetCMBaseObject();
          v12 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v12)
            v12(v11, *MEMORY[0x1E0CC5F60], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v13 = FigAssetGetCMBaseObject();
          v14 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v14)
            v14(v13, *MEMORY[0x1E0CC3948], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v15 = FigAssetGetCMBaseObject();
          v16 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v16)
            v16(v15, *MEMORY[0x1E0CC5F50], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v17 = FigAssetGetCMBaseObject();
          v18 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v18)
            v18(v17, *MEMORY[0x1E0CC5F78], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v19 = FigAssetGetCMBaseObject();
          v20 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v20)
            v20(v19, *MEMORY[0x1E0CC3950], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v21 = FigAssetGetCMBaseObject();
          v22 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v22)
            v22(v21, *MEMORY[0x1E0CC3A80], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v23 = FigAssetGetCMBaseObject();
          v24 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v24)
            v24(v23, *MEMORY[0x1E0CC3A78], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v25 = FigAssetGetCMBaseObject();
          v26 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v26)
            v26(v25, *MEMORY[0x1E0CC3A08], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v27 = FigAssetGetCMBaseObject();
          v28 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v28)
            v28(v27, *MEMORY[0x1E0CC3AB0], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v29 = FigAssetGetCMBaseObject();
          v30 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v30)
            v30(v29, *MEMORY[0x1E0CC39F8], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v31 = FigAssetGetCMBaseObject();
          v32 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
          if (v32)
            v32(v31, *MEMORY[0x1E0CC39E8], v8, &cf);
          if (cf)
          {
            CFRelease(cf);
            v6 = 0;
            cf = 0;
          }
          else
          {
            v6 = 0;
          }
        }
      }
    }
    else
    {
      v7 = 0;
      v6 = 4294954514;
    }
  }
  else
  {
    v7 = 0;
    v6 = 4294954516;
  }

  return v6;
}

void sub_19351CC44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

AVMutableMovieInternal *_createMutableMovieStorageWithFigObjects(uint64_t a1)
{
  AVMutableMovieInternal *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *trackWaitingSemaphore;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *metadataWaitingSemaphore;
  OpaqueFigMutableMovie *v7;
  OpaqueFigFormatReader *v8;
  OpaqueFigAsset *v9;
  AVDispatchOnce *v10;
  AVDispatchOnce *makeTracksArrayOnce;

  v2 = objc_alloc_init(AVMutableMovieInternal);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    trackWaitingSemaphore = v2->trackWaitingSemaphore;
    v2->trackWaitingSemaphore = (OS_dispatch_semaphore *)v3;

    if (v2->trackWaitingSemaphore)
    {
      v5 = dispatch_semaphore_create(0);
      metadataWaitingSemaphore = v2->metadataWaitingSemaphore;
      v2->metadataWaitingSemaphore = (OS_dispatch_semaphore *)v5;

      if (v2->metadataWaitingSemaphore)
      {
        v7 = *(OpaqueFigMutableMovie **)a1;
        if (*(_QWORD *)a1)
          v7 = (OpaqueFigMutableMovie *)CFRetain(v7);
        v2->figMutableMovie = v7;
        v8 = *(OpaqueFigFormatReader **)(a1 + 8);
        if (v8)
          v8 = (OpaqueFigFormatReader *)CFRetain(v8);
        v2->formatReader = v8;
        v9 = *(OpaqueFigAsset **)(a1 + 16);
        if (v9)
          v9 = (OpaqueFigAsset *)CFRetain(v9);
        v2->figAsset = v9;
        v10 = objc_alloc_init(AVDispatchOnce);
        makeTracksArrayOnce = v2->makeTracksArrayOnce;
        v2->makeTracksArrayOnce = v10;

      }
    }
  }
  return v2;
}

void sub_19351CD10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351CD84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351D088(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19351D158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351D370(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351D5FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (v1)

  _Unwind_Resume(a1);
}

void sub_19351D6F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351D7D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351D8F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v1;

  _Unwind_Resume(a1);
}

void sub_19351D9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void mutableMovieNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    if (a3)
    {
      v7 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC3680]);
      if (a5)
      {
        if (v7)
        {
          objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC3900]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
          {
            if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC3AA8]))
              objc_msgSend(v10, "_signalTracksUpdated");
            if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3950]) & 1) != 0
              || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3A80]) & 1) != 0
              || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3A78]) & 1) != 0
              || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3A08]) & 1) != 0
              || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC3AB0]) & 1) != 0
              || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC39F8]) & 1) != 0
              || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CC39E8]))
            {
              objc_msgSend(v10, "_signalMetadataUpdated");
            }
          }

        }
      }
    }
  }

}

void sub_19351DB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19351DC24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19351DCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVMutableMovie;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19351DD80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351DE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351DF20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351E1E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19351E258(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351E5CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19351EDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19351EED4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351F66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19351FAC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351FC54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19351FE5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_193520528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19352079C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_193520B50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_193520CF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_193520DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t __runningAnInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  runningAnInternalBuild_internalBuild = result;
  return result;
}

void avcks_didProvideKeyRequest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v10;

  v10 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "didProvideKeyRequestWithBoss:keySpecifier:requestID:renewalRequest:supportsOfflineKey:", a2, a3, a4, 0, a5 != 0);
  objc_autoreleasePoolPop(v10);
}

void avcks_didProvideRenewalKeyRequest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v10;

  v10 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "didProvideKeyRequestWithBoss:keySpecifier:requestID:renewalRequest:supportsOfflineKey:", a2, a3, a4, 1, a5 != 0);
  objc_autoreleasePoolPop(v10);
}

void avcks_didUpdatePersistableKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;

  v6 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "_handleUpdateToPersistentKey:forKeyIdentifier:", a4, FigContentKeySpecifierGetIdentifier());
  objc_autoreleasePoolPop(v6);
}

void avcks_contentKeyRequestDidSucceed(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;

  v10 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "contentKeyRequestDidSucceedWithBoss:keySpecifier:requestID:cryptor:", a2, a3, a4, a5);
  objc_autoreleasePoolPop(v10);
}

void avcks_contentKeyRequestDidFail(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend((id)objc_msgSend(a1, "keyRequestByID:", a4), "_handleKeyResponseError:", a5);
  objc_msgSend(a1, "removeResourcesForID:", a4);
  objc_autoreleasePoolPop(v8);
}

void avcks_externalProtectionStateChangedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(a1, "externalProtectionStateChangedCallbackWithBoss:keySpecifier:", a2, a3);
  objc_autoreleasePoolPop(v6);
}

void sub_1935290BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t avcks_decodeInitializationDataAndCopyInformation(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, _QWORD *a6)
{
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v11 = objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a1, 0, &v38);
  if (!v11)
    goto LABEL_34;
  v12 = (void *)v11;
  objc_opt_class();
  v31 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    v32 = 0;
    v15 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_34:
    v30 = 0;
    v18 = 0;
    v33 = 0;
    goto LABEL_35;
  }
  v16 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sinf"));
  v15 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("codc"));
  v32 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mtyp"));
  v14 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cont"));
  v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pssh"));
  if (!v16)
  {
    v12 = 0;
    v17 = 1;
    goto LABEL_9;
  }
  v12 = (void *)v16;
  a2 = v31;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = v14;
    v30 = v15;
    v18 = v32;
    goto LABEL_35;
  }
  v17 = 0;
LABEL_9:
  v33 = v14;
  v30 = v15;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_51:
      a2 = v31;
      v18 = v32;
      goto LABEL_35;
    }
  }
  v18 = v32;
  if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!v33 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!v13)
      {
        v19 = 0;
        if ((v17 & 1) == 0)
        {
LABEL_19:
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (result)
          {
            v21 = result;
            v27 = a4;
            v28 = a5;
            v29 = a6;
            v22 = 0;
            v23 = *(_QWORD *)v35;
            while (2)
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v35 != v23)
                  objc_enumerationMutation(v12);
                v25 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "dataUsingEncoding:", 4, v27, v28, v29);
                if (!v25)
                {
                  result = 4294955465;
                  goto LABEL_38;
                }
                result = (uint64_t)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v25, 0);
                if (!result)
                  goto LABEL_38;
                v26 = result;
                if (!v22)
                  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                objc_msgSend(v22, "addObject:", v26);
                ++v24;
              }
              while (v21 != v24);
              result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
              v21 = result;
              if (result)
                continue;
              break;
            }
LABEL_38:
            a5 = v28;
            a6 = v29;
            a4 = v27;
LABEL_39:
            a2 = v31;
            v18 = v32;
            if (!v31)
              goto LABEL_41;
            goto LABEL_40;
          }
LABEL_33:
          v22 = 0;
          goto LABEL_39;
        }
LABEL_32:
        result = 0;
        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", objc_msgSend(v13, "dataUsingEncoding:", 4), 0);
        if (v19)
        {
          if ((v17 & 1) == 0)
            goto LABEL_19;
          goto LABEL_32;
        }
      }
    }
    goto LABEL_51;
  }
  a2 = v31;
LABEL_35:
  result = FigSignalErrorAt();
  v22 = 0;
  v19 = 0;
  if (a2)
LABEL_40:
    *a2 = v22;
LABEL_41:
  if (a3)
    *a3 = v30;
  if (a4)
    *a4 = v18;
  if (a5)
    *a5 = v33;
  if (a6)
    *a6 = v19;
  return result;
}

void sub_19352C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19352C564(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19352CC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19352CE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_19352E468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19352E898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19352EFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1935308C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_193530AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void avckrg_keyResponseErrorCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;

  v8 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleKeyResponseError:forCryptorUUID:andCryptorKeyRequestID:", a4, a2, a3);
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v8);
}

void avckrg_keyResponseSuccessfullyProcessedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleKeyResponseSuccessfullyProcessedForCryptorUUID:andCryptorKeyRequestID:", a2, a3);
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v6);
}

void avckrg_persistentKeyUpdatedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleUpdateToPersistentKey:forKeyIdentifier:", a3, a2);
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v6);
}

void avckrg_secureStopDidFinalizeRecordCallback(void *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleSecureStopDidFinalizeRecordCallback");
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v2);
}

void avckrg_externalProtectionStateChangedCallback(void *a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)MEMORY[0x1940343FC]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier:", a2);
  else
    FigSignalErrorAt();
  objc_autoreleasePoolPop(v4);
}

void sub_193530F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1935311BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL AVSampleBufferAttachContentKey(CMSampleBufferRef sbuf, AVContentKey *contentKey, NSError **outError)
{
  const opaqueCMFormatDescription *FormatDescription;
  FourCharCode MediaSubType;
  CMMediaType MediaType;
  OpaqueFigCPECryptor *v8;
  _QWORD *v9;
  void (*v10)(OpaqueFigCPECryptor *, _QWORD, uint64_t, _QWORD, uint64_t *);
  NSError *v11;
  uint64_t v13;

  FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  if (!-[AVContentKey cryptor](contentKey, "cryptor"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Content key is not valid"), 0));
  MediaSubType = CMFormatDescriptionGetMediaSubType(FormatDescription);
  MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  if (-[NSString isEqual:](-[AVContentKeySpecifier keySystem](-[AVContentKey contentKeySpecifier](contentKey, "contentKeySpecifier"), "keySystem"), "isEqual:", CFSTR("FairPlayStreaming")))
  {
    if (MediaSubType == 1903587385)
      goto LABEL_8;
    if (clientCanDecryptContentKey_getBrowserEngineOnce != -1)
      dispatch_once(&clientCanDecryptContentKey_getBrowserEngineOnce, &__block_literal_global_42);
    if (!clientCanDecryptContentKey_browserEngineAllowedToDecrypt && MediaType == 1936684398)
    {
LABEL_8:
      v8 = -[AVContentKey cryptor](contentKey, "cryptor");
      v13 = *MEMORY[0x1E0C9AE40];
      v9 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
      if (*v9 >= 6uLL)
      {
        v10 = (void (*)(OpaqueFigCPECryptor *, _QWORD, uint64_t, _QWORD, uint64_t *))v9[19];
        if (v10)
          v10(v8, *MEMORY[0x1E0CA3198], 1903587385, *MEMORY[0x1E0C9AE00], &v13);
      }
      if (FigCFEqual())
      {
LABEL_12:
        FigSampleBufferSetDecryptor();
        v11 = 0;
        if (!outError)
          return v11 == 0;
        goto LABEL_16;
      }
    }
    else if (clientCanDecryptContentKey_browserEngineAllowedToDecrypt)
    {
      goto LABEL_12;
    }
  }
  v11 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(-12161, 0);
  if (outError)
LABEL_16:
    *outError = v11;
  return v11 == 0;
}

void __clientCanDecryptContentKey_block_invoke()
{
  __SecTask *v0;
  CFTypeRef v1;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v1 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.coremedia.allow-fps-attachment"), 0);
  clientCanDecryptContentKey_browserEngineAllowedToDecrypt = FigIsSecTaskGPUExtensionOfBrowserEngine() | (v1 == (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  if (v1)
    CFRelease(v1);
  if (v0)
    CFRelease(v0);
}

void AVOutputDeviceAuthorizationSessionShowAuthPrompt(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  void *v7;
  const __CFDictionary *Value;
  const void *v9;
  const void *v10;
  const __CFBoolean *v11;
  const void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1940343FC]();
  Value = (const __CFDictionary *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E0D48AC0]);
  v9 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D48B50]);
  v10 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D48B48]);
  v11 = (const __CFBoolean *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D48AF0]);
  v12 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0D48AF8]);
  if (dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_showAuthPromptWithUniqueID:routeDescriptor:pinMode:reason:", v9, v10, CFBooleanGetValue(v11) != 0, v12, v14, v15);
  objc_autoreleasePoolPop(v7);
}

void AVOutputDeviceAuthorizationSessionShowFinishedWithPrompt(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1940343FC]();
  if (dword_1EE2B01D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_finishedWithPrompt", v5, v6);
  objc_autoreleasePoolPop(v3);
}

void sub_193532BE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_193532CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initDADiscoveryConfiguration()
{
  Class result;

  if (DeviceAccessLibrary_sOnce != -1)
    dispatch_once(&DeviceAccessLibrary_sOnce, &__block_literal_global_62);
  result = objc_getClass("DADiscoveryConfiguration");
  classDADiscoveryConfiguration = (uint64_t)result;
  getDADiscoveryConfigurationClass = DADiscoveryConfigurationFunction;
  return result;
}

uint64_t DADiscoveryConfigurationFunction()
{
  return classDADiscoveryConfiguration;
}

Class initDADiscovery()
{
  Class result;

  if (DeviceAccessLibrary_sOnce != -1)
    dispatch_once(&DeviceAccessLibrary_sOnce, &__block_literal_global_62);
  result = objc_getClass("DADiscovery");
  classDADiscovery = (uint64_t)result;
  getDADiscoveryClass[0] = DADiscoveryFunction;
  return result;
}

uint64_t DADiscoveryFunction()
{
  return classDADiscovery;
}

uint64_t _figManifoldDiscoveredNewTrackInStream(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  return objc_msgSend(a2, "_figManifold:discoveredNewTrackID:mediaType:", a1, a4, AVStringForOSType(a3));
}

uint64_t _figManifoldAllNewTracksReady(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_figManifoldAllNewTracksReady:", a1);
}

uint64_t _figManifoldError()
{
  return 0;
}

uint64_t _figManifoldFormatDescriptionOrDecryptorDidChange(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a3, "_figManifold:formatDescription:orDecryptorDidChange:forTrackID:", a1, a4, a5, a2);
}

uint64_t _figManifoldPushedSampleBuffer(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(a3, "_figManifold:pushedSampleBuffer:trackID:flags:", a1, a6, a2, a4);
}

uint64_t _figManifoldTrackDidEnd(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_figManifold:trackDidEnd:", a1, a2);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1E0C91EB8](inAudioConverter);
}

OSStatus AudioConverterGetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C91ED8](inAudioConverter, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioConverterGetPropertyInfo(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *outSize, Boolean *outWritable)
{
  return MEMORY[0x1E0C91EE0](inAudioConverter, *(_QWORD *)&inPropertyID, outSize, outWritable);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1E0C91EF8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioFileGetGlobalInfo(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C91F38](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetGlobalInfoSize(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *outDataSize)
{
  return MEMORY[0x1E0C91F40](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, outDataSize);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C91FC8](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFormatGetPropertyInfo(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *outPropertyDataSize)
{
  return MEMORY[0x1E0C91FD0](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, outPropertyDataSize);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0CD2600](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1E0C98060]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1E0C927E8](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x1E0C927F8](message, headerField);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92838](alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x1E0C92848](response);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x1E0C92868](message, headerField, value);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(CFAllocatorRef allocator, LangCode lcode, RegionCode rcode)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A8](allocator, lcode, rcode);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CFURLConnectionCancel()
{
  return MEMORY[0x1E0C92928]();
}

uint64_t CFURLConnectionCreate()
{
  return MEMORY[0x1E0C92930]();
}

uint64_t CFURLConnectionScheduleWithRunLoop()
{
  return MEMORY[0x1E0C92948]();
}

uint64_t CFURLConnectionStart()
{
  return MEMORY[0x1E0C92958]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1E0C99478](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

uint64_t CFURLRequestCopyAllHTTPHeaderFields()
{
  return MEMORY[0x1E0C929A0]();
}

uint64_t CFURLRequestCreateHTTPRequest()
{
  return MEMORY[0x1E0C929B8]();
}

uint64_t CFURLRequestGetURL()
{
  return MEMORY[0x1E0C929E0]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1E0C92A68]();
}

uint64_t CFURLResponseGetMIMEType()
{
  return MEMORY[0x1E0C92A70]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCA0](gray, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1E0C9BD98](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

OSStatus CMAudioFormatDescriptionCreateSummary(CFAllocatorRef allocator, CFArrayRef formatDescriptionArray, uint32_t flags, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EA88](allocator, formatDescriptionArray, *(_QWORD *)&flags, formatDescriptionOut);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1E0C9EAA0](desc, sizeOut);
}

const AudioFormatListItem *__cdecl CMAudioFormatDescriptionGetRichestDecodableFormat(CMAudioFormatDescriptionRef desc)
{
  return (const AudioFormatListItem *)MEMORY[0x1E0C9EAC8](desc);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

uint64_t CMBaseObjectIsMemberOfClass()
{
  return MEMORY[0x1E0C9EB38]();
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1E0C9EB50](theBuffer, targetBBuf, offsetToData, dataLength, *(_QWORD *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1E0C9EB68](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB70](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB78](structureAllocator, *(_QWORD *)&subBlockCapacity, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB80](structureAllocator, bufferReference, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1E0C9EBC0](theBuffer, offset, length);
}

uint64_t CMByteStreamCreateForBlockBuffer()
{
  return MEMORY[0x1E0C9ED00]();
}

uint64_t CMByteStreamGetCMBaseObject()
{
  return MEMORY[0x1E0C9ED18]();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1E0C9ED40]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1E0C9ED48](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x1E0C9ED60](retstr, hostTime);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1E0C9EDB8](formatDescription, otherFormatDescription);
}

Boolean CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription, CFTypeRef formatDescriptionExtensionKeysToIgnore, CFTypeRef sampleDescriptionExtensionAtomKeysToIgnore)
{
  return MEMORY[0x1E0C9EDC0](formatDescription, otherFormatDescription, formatDescriptionExtensionKeysToIgnore, sampleDescriptionExtensionAtomKeysToIgnore);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9EDD0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDE0](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1E0C9EDE8]();
}

uint64_t CMFormatDescriptionGetWidestColorPropertiesFromFormatDescriptions()
{
  return MEMORY[0x1E0C9EDF0]();
}

uint64_t CMFormatDescriptionGetWidestGamutAndLargestDynamicRangeColorPropertiesFromFormatDescriptions()
{
  return MEMORY[0x1E0C9EDF8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

OSStatus CMMetadataCreateIdentifierForKeyAndKeySpace(CFAllocatorRef allocator, CFTypeRef key, CFStringRef keySpace, CFStringRef *identifierOut)
{
  return MEMORY[0x1E0C9EE38](allocator, key, keySpace, identifierOut);
}

OSStatus CMMetadataCreateKeyFromIdentifier(CFAllocatorRef allocator, CFStringRef identifier, CFTypeRef *keyOut)
{
  return MEMORY[0x1E0C9EE40](allocator, identifier, keyOut);
}

OSStatus CMMetadataCreateKeySpaceFromIdentifier(CFAllocatorRef allocator, CFStringRef identifier, CFStringRef *keySpaceOut)
{
  return MEMORY[0x1E0C9EE48](allocator, identifier, keySpaceOut);
}

Boolean CMMetadataDataTypeRegistryDataTypeConformsToDataType(CFStringRef dataType, CFStringRef conformsToDataType)
{
  return MEMORY[0x1E0C9EE50](dataType, conformsToDataType);
}

CFStringRef CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(CFStringRef dataType)
{
  return (CFStringRef)MEMORY[0x1E0C9EE58](dataType);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9EE90](allocator, *(_QWORD *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1E0C9EEB8]();
}

uint64_t CMNotificationCenterBarrier()
{
  return MEMORY[0x1E0C9EEC0]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1E0C9EEC8]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x1E0C9EED0]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1E0C9EEE8]();
}

OSStatus CMSampleBufferCallForEachSample(CMSampleBufferRef sbuf, OSStatus (__cdecl *callback)(CMSampleBufferRef, CMItemCount, void *), void *refcon)
{
  return MEMORY[0x1E0C9EF28](sbuf, callback, refcon);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EF90](sbuf);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFC8](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF8](retstr, sbuf);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1E0C9F018](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1E0C9F028](sbuf, sampleIndex, timingInfoOut);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F040](sbuf);
}

Boolean CMSampleBufferHasDataFailed(CMSampleBufferRef sbuf, OSStatus *statusOut)
{
  return MEMORY[0x1E0C9F050](sbuf, statusOut);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x1E0C9F0A8](sbuf, outputPresentationTimeStamp);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x1E0C9F130](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

OSStatus CMTagCollectionCreate(CFAllocatorRef allocator, const CMTag *tags, CMItemCount tagCount, CMTagCollectionRef *newCollectionOut)
{
  return MEMORY[0x1E0C9F178](allocator, tags, tagCount, newCollectionOut);
}

CFTypeID CMTagCollectionGetTypeID(void)
{
  return MEMORY[0x1E0C9F1A8]();
}

OSStatus CMTextFormatDescriptionGetDisplayFlags(CMFormatDescriptionRef desc, CMTextDisplayFlags *displayFlagsOut)
{
  return MEMORY[0x1E0C9F278](desc, displayFlagsOut);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1E0C9F290](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

CMTime *__cdecl CMTimeFoldIntoRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *foldRange)
{
  return (CMTime *)MEMORY[0x1E0C9F308](retstr, time, foldRange);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x1E0C9F340](retstr, t, fromRange, toRange);
}

CFDictionaryRef CMTimeMappingCopyAsDictionary(CMTimeMapping *mapping, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F348](mapping, allocator);
}

CMTimeMapping *__cdecl CMTimeMappingMake(CMTimeMapping *__return_ptr retstr, CMTimeRange *source, CMTimeRange *target)
{
  return (CMTimeMapping *)MEMORY[0x1E0C9F358](retstr, source, target);
}

CMTimeMapping *__cdecl CMTimeMappingMakeFromDictionary(CMTimeMapping *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeMapping *)MEMORY[0x1E0C9F368](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F370](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F388](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1E0C9F3A8](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMTimebaseAddTimerDispatchSource(CMTimebaseRef timebase, dispatch_source_t timerSource)
{
  return MEMORY[0x1E0C9F418](timebase, timerSource);
}

uint64_t CMTimebaseCreateLoopingTimebase()
{
  return MEMORY[0x1E0C9F440]();
}

uint64_t CMTimebaseCreateReadOnlyTimebase()
{
  return MEMORY[0x1E0C9F448]();
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return MEMORY[0x1E0C9F450](allocator, sourceClock, timebaseOut);
}

Float64 CMTimebaseGetRate(CMTimebaseRef timebase)
{
  Float64 result;

  MEMORY[0x1E0C9F468](timebase);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x1E0C9F470](retstr, timebase);
}

uint64_t CMTimebaseGetTimeClampedAboveAnchorTime()
{
  return MEMORY[0x1E0C9F480]();
}

OSStatus CMTimebaseRemoveTimerDispatchSource(CMTimebaseRef timebase, dispatch_source_t timerSource)
{
  return MEMORY[0x1E0C9F4B0](timebase, timerSource);
}

OSStatus CMTimebaseSetRate(CMTimebaseRef timebase, Float64 rate)
{
  return MEMORY[0x1E0C9F4C0](timebase, rate);
}

OSStatus CMTimebaseSetTime(CMTimebaseRef timebase, CMTime *time)
{
  return MEMORY[0x1E0C9F4E8](timebase, time);
}

OSStatus CMTimebaseSetTimerDispatchSourceNextFireTime(CMTimebaseRef timebase, dispatch_source_t timerSource, CMTime *fireTime, uint32_t flags)
{
  return MEMORY[0x1E0C9F4F0](timebase, timerSource, fireTime, *(_QWORD *)&flags);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x1E0C9F580](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.height = v4;
  result.width = v3;
  return result;
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1E0C9F588]();
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1E0CA8B78](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B88](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x1E0CA8BC8](pixelBufferPool);
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1E0CA8BD0](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8C08](allocator, *(_QWORD *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1E0CA8C10]();
}

uint64_t FCSupport_CopyChapterTimeRangesForChapterGroup()
{
  return MEMORY[0x1E0CC2590]();
}

uint64_t FPSupport_CreateAllVideoRangesSupportedByDisplays()
{
  return MEMORY[0x1E0CC25A0]();
}

uint64_t FPSupport_CreateDestinationPixelBufferAttributes()
{
  return MEMORY[0x1E0CC25A8]();
}

uint64_t FPSupport_GetCurrentDisplayModeVideoRangeAndSizeAndFrameRate()
{
  return MEMORY[0x1E0CC25C0]();
}

uint64_t FPSupport_GetDisplayVideoRangeNotificationSingleton()
{
  return MEMORY[0x1E0CC25C8]();
}

uint64_t FPSupport_GetModeString()
{
  return MEMORY[0x1E0CC25D0]();
}

uint64_t FPSupport_IncrementSeekID()
{
  return MEMORY[0x1E0CC25D8]();
}

uint64_t FPSupport_InitialSeekIDForSource()
{
  return MEMORY[0x1E0CC25E0]();
}

uint64_t FPSupport_SeekIDGetSource()
{
  return MEMORY[0x1E0CC25E8]();
}

uint64_t FigAlternateCopyAsXPCObjectWithContext()
{
  return MEMORY[0x1E0CC2620]();
}

uint64_t FigAlternateCreateWithXPCObject()
{
  return MEMORY[0x1E0CC2628]();
}

uint64_t FigAssetCacheInspectorCreate_Remote()
{
  return MEMORY[0x1E0CC2630]();
}

uint64_t FigAssetCacheInspectorGetCMBaseObject()
{
  return MEMORY[0x1E0CC2638]();
}

uint64_t FigAssetCopyAssetWithDownloadToken()
{
  return MEMORY[0x1E0CC2640]();
}

uint64_t FigAssetCreateOptionsDictFromPList()
{
  return MEMORY[0x1E0CC2648]();
}

uint64_t FigAssetCreatePListFromOptionsDict()
{
  return MEMORY[0x1E0CC2650]();
}

uint64_t FigAssetCreateWithBlockBuffer()
{
  return MEMORY[0x1E0CC2658]();
}

uint64_t FigAssetCreateWithByteStream()
{
  return MEMORY[0x1E0CC2660]();
}

uint64_t FigAssetCreateWithURL()
{
  return MEMORY[0x1E0CC2668]();
}

uint64_t FigAssetDownloadStorageManagementCopyExpirationDateForAssetAtURL()
{
  return MEMORY[0x1E0CC2670]();
}

uint64_t FigAssetDownloadStorageManagementCopyPriorityForAssetAtURL()
{
  return MEMORY[0x1E0CC2678]();
}

uint64_t FigAssetDownloadStorageManagementSetExpirationDateForAssetAtURL()
{
  return MEMORY[0x1E0CC2680]();
}

uint64_t FigAssetDownloadStorageManagementSetPriorityForAssetAtURL()
{
  return MEMORY[0x1E0CC2688]();
}

uint64_t FigAssetDownloaderGetCMBaseObject()
{
  return MEMORY[0x1E0CC2690]();
}

uint64_t FigAssetDownloaderRegisterDestinationLocation()
{
  return MEMORY[0x1E0CC2698]();
}

uint64_t FigAssetExportSessionCancelExport()
{
  return MEMORY[0x1E0CC26A0]();
}

uint64_t FigAssetExportSessionCopyProperty()
{
  return MEMORY[0x1E0CC26A8]();
}

uint64_t FigAssetExportSessionCreateWithAsset()
{
  return MEMORY[0x1E0CC26B0]();
}

uint64_t FigAssetExportSessionDetermineCompatibilityOfExportPreset()
{
  return MEMORY[0x1E0CC26B8]();
}

uint64_t FigAssetExportSessionDetermineCompatibleFileTypes()
{
  return MEMORY[0x1E0CC26C0]();
}

uint64_t FigAssetExportSessionEstimateMaximumDurationWithCompletionHandler()
{
  return MEMORY[0x1E0CC26C8]();
}

uint64_t FigAssetExportSessionEstimateOutputFileLengthWithCompletionHandler()
{
  return MEMORY[0x1E0CC26D0]();
}

uint64_t FigAssetExportSessionExportAsynchronously()
{
  return MEMORY[0x1E0CC26D8]();
}

uint64_t FigAssetExportSessionExportGetPresetsCompatibleWithFigAsset()
{
  return MEMORY[0x1E0CC26E0]();
}

uint64_t FigAssetExportSessionGetAllPresets()
{
  return MEMORY[0x1E0CC26E8]();
}

uint64_t FigAssetExportSessionGetEstimatedOutputFileLength()
{
  return MEMORY[0x1E0CC26F0]();
}

uint64_t FigAssetExportSessionGetMaximumDuration()
{
  return MEMORY[0x1E0CC26F8]();
}

uint64_t FigAssetExportSessionProperty_GetAudioMix_CFDictionaryValueCallBacks()
{
  return MEMORY[0x1E0CC2700]();
}

uint64_t FigAssetExportSessionSetProperty()
{
  return MEMORY[0x1E0CC2708]();
}

uint64_t FigAssetExportSessionVideoCompositionCreate()
{
  return MEMORY[0x1E0CC2710]();
}

uint64_t FigAssetGetCMBaseObject()
{
  return MEMORY[0x1E0CC2718]();
}

uint64_t FigAssetImageGeneratorCreateFromAssetWithOptions()
{
  return MEMORY[0x1E0CC2720]();
}

uint64_t FigAssetImageGeneratorCreateRemoteFromAssetWithOptions()
{
  return MEMORY[0x1E0CC2728]();
}

uint64_t FigAssetImageGeneratorGetFigBaseObject()
{
  return MEMORY[0x1E0CC2730]();
}

uint64_t FigAssetReaderCreateWithURLAndFormatReader()
{
  return MEMORY[0x1E0CC2740]();
}

uint64_t FigAssetReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC2748]();
}

uint64_t FigAssetReaderRemoteCreateWithURLAndFormatReader()
{
  return MEMORY[0x1E0CC2750]();
}

uint64_t FigAssetRemoteCopyAssetWithDownloadToken()
{
  return MEMORY[0x1E0CC2758]();
}

uint64_t FigAssetRemoteCreateWithBlockBuffer()
{
  return MEMORY[0x1E0CC2760]();
}

uint64_t FigAssetRemoteCreateWithFormatReader()
{
  return MEMORY[0x1E0CC2768]();
}

uint64_t FigAssetRemoteCreateWithMovieProxyData()
{
  return MEMORY[0x1E0CC2770]();
}

uint64_t FigAssetRemoteCreateWithURL()
{
  return MEMORY[0x1E0CC2778]();
}

uint64_t FigAssetRemoteCreateWithURLAndRetry()
{
  return MEMORY[0x1E0CC2780]();
}

uint64_t FigAssetTrackGetCMBaseObject()
{
  return MEMORY[0x1E0CC2788]();
}

uint64_t FigAssetWriterCreateForWritingFragmentedData()
{
  return MEMORY[0x1E0CC2790]();
}

uint64_t FigAssetWriterCreateWithURL()
{
  return MEMORY[0x1E0CC2798]();
}

uint64_t FigAssetWriterGetFigBaseObject()
{
  return MEMORY[0x1E0CC27A0]();
}

uint64_t FigAssetWriterRemoteCreateForWritingFragmentedData()
{
  return MEMORY[0x1E0CC27A8]();
}

uint64_t FigAssetWriterRemoteCreateWithURL()
{
  return MEMORY[0x1E0CC27B0]();
}

uint64_t FigAssetWriterRemoteDoesSupportVirtualCaptureCard()
{
  return MEMORY[0x1E0CC27B8]();
}

uint64_t FigAtomicAdd32()
{
  return MEMORY[0x1E0C9F798]();
}

uint64_t FigAtomicCompareAndSwap32()
{
  return MEMORY[0x1E0C9F7B0]();
}

uint64_t FigAtomicCompareAndSwapPtr()
{
  return MEMORY[0x1E0C9F7B8]();
}

uint64_t FigAtomicIncrement32()
{
  return MEMORY[0x1E0C9F7C8]();
}

uint64_t FigAudioCompressionOptionsGetPreset()
{
  return MEMORY[0x1E0CC27C0]();
}

uint64_t FigAudioFormatDescriptionGetRichestDecodableFormatAndChannelLayout()
{
  return MEMORY[0x1E0C9F850]();
}

uint64_t FigBoxedMetadataAppendCFTypedValue()
{
  return MEMORY[0x1E0C9F888]();
}

uint64_t FigBoxedMetadataAppendCGPoint()
{
  return MEMORY[0x1E0C9F890]();
}

uint64_t FigBoxedMetadataAppendCGRect()
{
  return MEMORY[0x1E0C9F898]();
}

uint64_t FigBoxedMetadataAppendCGSize()
{
  return MEMORY[0x1E0C9F8A0]();
}

uint64_t FigBoxedMetadataCreateForConstruction()
{
  return MEMORY[0x1E0C9F8C8]();
}

uint64_t FigBoxedMetadataEndConstruction()
{
  return MEMORY[0x1E0C9F8D8]();
}

uint64_t FigBoxedMetadataGetBlockBuffer()
{
  return MEMORY[0x1E0C9F8E0]();
}

uint64_t FigBoxedMetadataGetFormatDescription()
{
  return MEMORY[0x1E0C9F8E8]();
}

uint64_t FigBoxedMetadataGetTypeID()
{
  return MEMORY[0x1E0C9F908]();
}

uint64_t FigCAStatsReportingSubmitData()
{
  return MEMORY[0x1E0C9F9E8]();
}

uint64_t FigCDSSessionCreate()
{
  return MEMORY[0x1E0CC27F8]();
}

uint64_t FigCDSSessionSetBounds()
{
  return MEMORY[0x1E0CC2800]();
}

uint64_t FigCDSSessionSetCGContextDevice()
{
  return MEMORY[0x1E0CC2808]();
}

uint64_t FigCDSSessionSetCaptionCacheRange()
{
  return MEMORY[0x1E0CC2810]();
}

uint64_t FigCDSSessionSetDefaultTextStyle()
{
  return MEMORY[0x1E0CC2818]();
}

uint64_t FigCDSSessionSetMasterClock()
{
  return MEMORY[0x1E0CC2820]();
}

uint64_t FigCDSSessionSetTime()
{
  return MEMORY[0x1E0CC2828]();
}

uint64_t FigCDSSessionStart()
{
  return MEMORY[0x1E0CC2830]();
}

uint64_t FigCDSSessionStop()
{
  return MEMORY[0x1E0CC2838]();
}

uint64_t FigCDSSessionSynchronizeDefaults()
{
  return MEMORY[0x1E0CC2840]();
}

uint64_t FigCDSSessionUpdateCGContext()
{
  return MEMORY[0x1E0CC2848]();
}

uint64_t FigCFArrayAppendInt32()
{
  return MEMORY[0x1E0C9FA20]();
}

uint64_t FigCFArrayCreateMutableCopy()
{
  return MEMORY[0x1E0C9FA80]();
}

uint64_t FigCFArrayGetInt32AtIndex()
{
  return MEMORY[0x1E0C9FAE0]();
}

uint64_t FigCFCopyCompactDescription()
{
  return MEMORY[0x1E0C9FB28]();
}

uint64_t FigCFDateCreateFromString()
{
  return MEMORY[0x1E0C9FB48]();
}

uint64_t FigCFDictionaryCopyArrayOfValues()
{
  return MEMORY[0x1E0C9FB68]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x1E0C9FB80]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x1E0C9FB98]();
}

uint64_t FigCFDictionaryGetCMTimeIfPresent()
{
  return MEMORY[0x1E0C9FBC8]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1E0C9FC00]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x1E0C9FC10]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x1E0C9FC48]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x1E0C9FC58]();
}

uint64_t FigCFDictionarySetBoolean()
{
  return MEMORY[0x1E0C9FC78]();
}

uint64_t FigCFDictionarySetCGSize()
{
  return MEMORY[0x1E0C9FC98]();
}

uint64_t FigCFDictionarySetCMTime()
{
  return MEMORY[0x1E0C9FCA0]();
}

uint64_t FigCFDictionarySetFloat()
{
  return MEMORY[0x1E0C9FCB8]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x1E0C9FCD8]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x1E0C9FCE0]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x1E0C9FD00]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1E0C9FD10]();
}

uint64_t FigCFNumberCreateFloat64()
{
  return MEMORY[0x1E0C9FD38]();
}

uint64_t FigCFNumberCreateSInt32()
{
  return MEMORY[0x1E0C9FD48]();
}

uint64_t FigCFNumberCreateSInt64()
{
  return MEMORY[0x1E0C9FD50]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x1E0C9FD68]();
}

uint64_t FigCFNumberCreateUInt64()
{
  return MEMORY[0x1E0C9FD70]();
}

uint64_t FigCFNumberGetFloat64()
{
  return MEMORY[0x1E0C9FD88]();
}

uint64_t FigCFNumberGetUInt64()
{
  return MEMORY[0x1E0C9FDB0]();
}

uint64_t FigCFStringCreateLoggingIdentifierOfLength()
{
  return MEMORY[0x1E0C9FE10]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x1E0C9FE38]();
}

uint64_t FigCFURLCreateCacheKey()
{
  return MEMORY[0x1E0C9FE60]();
}

uint64_t FigCFURLIsLocalResource()
{
  return MEMORY[0x1E0C9FEA8]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x1E0C9FEB8]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x1E0C9FEC0]();
}

uint64_t FigCLCPCaptionConversionValidatorCreate()
{
  return MEMORY[0x1E0CC2850]();
}

uint64_t FigCLCPCaptionFormatConformerCreate()
{
  return MEMORY[0x1E0CC2858]();
}

uint64_t FigCPEIsSupportedFormatDescription()
{
  return MEMORY[0x1E0CC2860]();
}

uint64_t FigCPEProtectorRemoteCreateForScheme()
{
  return MEMORY[0x1E0CC2868]();
}

uint64_t FigCPERemoteInitializeWithOptions()
{
  return MEMORY[0x1E0CC2870]();
}

uint64_t FigCPERemoteUninitialize()
{
  return MEMORY[0x1E0CC2878]();
}

uint64_t FigCaptionClientCreate()
{
  return MEMORY[0x1E0CC2880]();
}

uint64_t FigCaptionClientSetBounds()
{
  return MEMORY[0x1E0CC2888]();
}

uint64_t FigCaptionClientSetCGContextDevice()
{
  return MEMORY[0x1E0CC2890]();
}

uint64_t FigCaptionClientSetCaptionArray()
{
  return MEMORY[0x1E0CC2898]();
}

uint64_t FigCaptionClientSetCaptionCacheRange()
{
  return MEMORY[0x1E0CC28A0]();
}

uint64_t FigCaptionClientSetDefaultTextStyle()
{
  return MEMORY[0x1E0CC28A8]();
}

uint64_t FigCaptionClientSetMasterClock()
{
  return MEMORY[0x1E0CC28B0]();
}

uint64_t FigCaptionClientSetTime()
{
  return MEMORY[0x1E0CC28B8]();
}

uint64_t FigCaptionClientStart()
{
  return MEMORY[0x1E0CC28C0]();
}

uint64_t FigCaptionClientStop()
{
  return MEMORY[0x1E0CC28C8]();
}

uint64_t FigCaptionClientSynchronizeDefaults()
{
  return MEMORY[0x1E0CC28D0]();
}

uint64_t FigCaptionClientUpdateCGContext()
{
  return MEMORY[0x1E0CC28D8]();
}

uint64_t FigCaptionConversionValidatorGetCMBaseObject()
{
  return MEMORY[0x1E0CC28E0]();
}

uint64_t FigCaptionCreate()
{
  return MEMORY[0x1E0CC28E8]();
}

uint64_t FigCaptionDataCreateMutable()
{
  return MEMORY[0x1E0C9FF90]();
}

uint64_t FigCaptionDataCreateMutableCopy()
{
  return MEMORY[0x1E0C9FF98]();
}

uint64_t FigCaptionDataGetCMBaseObject()
{
  return MEMORY[0x1E0C9FFA0]();
}

uint64_t FigCaptionDynamicStyleCreate()
{
  return MEMORY[0x1E0C9FFD0]();
}

uint64_t FigCaptionDynamicStyleGetInitialValue()
{
  return MEMORY[0x1E0C9FFE0]();
}

uint64_t FigCaptionDynamicStyleGetTypeID()
{
  return MEMORY[0x1E0C9FFF0]();
}

uint64_t FigCaptionGeometryCopyCellBasedDimensionAsDictionary()
{
  return MEMORY[0x1E0CA0020]();
}

uint64_t FigCaptionGeometryGetCellBasedDimensionFromDictionary()
{
  return MEMORY[0x1E0CA0038]();
}

uint64_t FigCaptionGetCMBaseObject()
{
  return MEMORY[0x1E0CC28F0]();
}

uint64_t FigCaptionGroupCreate()
{
  return MEMORY[0x1E0CA0048]();
}

uint64_t FigCaptionRegionCreateMutable()
{
  return MEMORY[0x1E0CA0090]();
}

uint64_t FigCaptionRegionCreateMutableCopy()
{
  return MEMORY[0x1E0CA0098]();
}

uint64_t FigCaptionRegionGetCMBaseObject()
{
  return MEMORY[0x1E0CA00A0]();
}

uint64_t FigCaptionTimelineGeneratorAddSampleBuffer()
{
  return MEMORY[0x1E0CC28F8]();
}

uint64_t FigCaptionTimelineGeneratorCreate()
{
  return MEMORY[0x1E0CC2900]();
}

uint64_t FigCaptionTimelineGeneratorFinish()
{
  return MEMORY[0x1E0CC2908]();
}

uint64_t FigConcurrentAccessDetectorBeginReading()
{
  return MEMORY[0x1E0CA0158]();
}

uint64_t FigConcurrentAccessDetectorBeginWriting()
{
  return MEMORY[0x1E0CA0160]();
}

uint64_t FigConcurrentAccessDetectorCreate()
{
  return MEMORY[0x1E0CA0168]();
}

uint64_t FigConcurrentAccessDetectorDestroy()
{
  return MEMORY[0x1E0CA0170]();
}

uint64_t FigConcurrentAccessDetectorEndReading()
{
  return MEMORY[0x1E0CA0178]();
}

uint64_t FigConcurrentAccessDetectorEndWriting()
{
  return MEMORY[0x1E0CA0180]();
}

uint64_t FigContentKeyBossCreateRemote()
{
  return MEMORY[0x1E0CC2920]();
}

uint64_t FigContentKeyRequestDataParamsCreate()
{
  return MEMORY[0x1E0CC2928]();
}

uint64_t FigContentKeyRequestParamsCreate()
{
  return MEMORY[0x1E0CC2930]();
}

uint64_t FigContentKeyResponseParamsCreate()
{
  return MEMORY[0x1E0CC2938]();
}

uint64_t FigContentKeySecureTokenRequestParamsCreate()
{
  return MEMORY[0x1E0CC2940]();
}

uint64_t FigContentKeySessionRemoteCreateSession()
{
  return MEMORY[0x1E0CC2948]();
}

uint64_t FigContentKeySpecifierCreate()
{
  return MEMORY[0x1E0CC2950]();
}

uint64_t FigContentKeySpecifierGetEncryptionMethod()
{
  return MEMORY[0x1E0CC2958]();
}

uint64_t FigContentKeySpecifierGetIdentifier()
{
  return MEMORY[0x1E0CC2960]();
}

uint64_t FigContentKeySpecifierGetKeySystem()
{
  return MEMORY[0x1E0CC2968]();
}

uint64_t FigCopyCGColorSRGBAsArray()
{
  return MEMORY[0x1E0CA01C0]();
}

uint64_t FigCopyMPEGTransportStreamMIMETypes()
{
  return MEMORY[0x1E0CC2970]();
}

uint64_t FigCopyQTMovieMIMETypes()
{
  return MEMORY[0x1E0CC2978]();
}

uint64_t FigCopyRankedLanguagesAccordingToPreferredLanguages()
{
  return MEMORY[0x1E0CA01E0]();
}

uint64_t FigCopyRankedLanguagesAccordingToPreferredLanguages2()
{
  return MEMORY[0x1E0CA01E8]();
}

uint64_t FigCopySetOfAudioSupportedMIMETypes()
{
  return MEMORY[0x1E0CC2980]();
}

uint64_t FigCopySetOfFormatReaderSupportedFileExtensions()
{
  return MEMORY[0x1E0CC2988]();
}

uint64_t FigCopySetOfFormatReaderSupportedFileTypes()
{
  return MEMORY[0x1E0CC2990]();
}

uint64_t FigCopySetOfFormatReaderSupportedMIMETypes()
{
  return MEMORY[0x1E0CC2998]();
}

uint64_t FigCopySetOfFormatReaderSupportedUTIs()
{
  return MEMORY[0x1E0CC29A0]();
}

uint64_t FigCopySetOfPlaylistSupportedMIMETypes()
{
  return MEMORY[0x1E0CC29A8]();
}

uint64_t FigCopySetOfStreamingSupportedMIMETypes()
{
  return MEMORY[0x1E0CC29B0]();
}

uint64_t FigCopySetOfStreamingSupportedUTIs()
{
  return MEMORY[0x1E0CC29B8]();
}

uint64_t FigCopyWebVTTMIMETypes()
{
  return MEMORY[0x1E0CC29C0]();
}

uint64_t FigCreate3x2MatrixArrayFromCGAffineTransform()
{
  return MEMORY[0x1E0CC29C8]();
}

uint64_t FigCreate3x3MatrixArrayFromCGAffineTransform()
{
  return MEMORY[0x1E0CC29D0]();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return MEMORY[0x1E0CA0220]();
}

uint64_t FigCreateCFDataWithBlockBufferNoCopy()
{
  return MEMORY[0x1E0CA0258]();
}

uint64_t FigCreateCGColorSRGBFromArray()
{
  return MEMORY[0x1E0CA0270]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x1E0CEC8E0]();
}

uint64_t FigCustomURLHandlerRemoteClientCreateWithXPCEndpoint()
{
  return MEMORY[0x1E0CA02A8]();
}

uint64_t FigCustomURLHandlerRemoteCreateWithID()
{
  return MEMORY[0x1E0CA02B0]();
}

uint64_t FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID()
{
  return MEMORY[0x1E0CA02B8]();
}

uint64_t FigCustomURLHandlerServerCopyXPCEndpoint()
{
  return MEMORY[0x1E0CA02C0]();
}

uint64_t FigCustomURLHandlerServerEnsure()
{
  return MEMORY[0x1E0CA02C8]();
}

uint64_t FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers()
{
  return MEMORY[0x1E0CA0308]();
}

uint64_t FigCustomURLRequestInfoCopyCryptKeyAttributes()
{
  return MEMORY[0x1E0CA0310]();
}

uint64_t FigCustomURLRequestInfoCopyCryptor()
{
  return MEMORY[0x1E0CA0318]();
}

uint64_t FigCustomURLRequestInfoCopyHTTPHeaders()
{
  return MEMORY[0x1E0CA0320]();
}

uint64_t FigCustomURLRequestInfoCopyNSURLAuthenticationChallenge()
{
  return MEMORY[0x1E0CA0328]();
}

uint64_t FigCustomURLRequestInfoCopyURL()
{
  return MEMORY[0x1E0CA0330]();
}

uint64_t FigCustomURLRequestInfoCopyUserAgent()
{
  return MEMORY[0x1E0CA0338]();
}

uint64_t FigCustomURLRequestInfoGetByteRange()
{
  return MEMORY[0x1E0CA0348]();
}

uint64_t FigCustomURLRequestInfoGetCryptorKeyRequestID()
{
  return MEMORY[0x1E0CA0350]();
}

uint64_t FigCustomURLRequestInfoGetIsPingRequest()
{
  return MEMORY[0x1E0CA0358]();
}

uint64_t FigCustomURLRequestInfoGetIsRenewalRequest()
{
  return MEMORY[0x1E0CA0360]();
}

uint64_t FigCustomURLRequestInfoGetIsSecureStopSupported()
{
  return MEMORY[0x1E0CA0368]();
}

uint64_t FigCustomURLResponseInfoCreateMutable()
{
  return MEMORY[0x1E0CA0420]();
}

uint64_t FigCustomURLResponseInfoSetContentLength()
{
  return MEMORY[0x1E0CA0460]();
}

uint64_t FigCustomURLResponseInfoSetContentRenewalDate()
{
  return MEMORY[0x1E0CA0468]();
}

uint64_t FigCustomURLResponseInfoSetFinalURL()
{
  return MEMORY[0x1E0CA0470]();
}

uint64_t FigCustomURLResponseInfoSetHTTPHeaders()
{
  return MEMORY[0x1E0CA0478]();
}

uint64_t FigCustomURLResponseInfoSetHTTPStatusCode()
{
  return MEMORY[0x1E0CA0480]();
}

uint64_t FigCustomURLResponseInfoSetIsByteRangeAccessSupported()
{
  return MEMORY[0x1E0CA0488]();
}

uint64_t FigCustomURLResponseInfoSetIsCachingDisabled()
{
  return MEMORY[0x1E0CA0490]();
}

uint64_t FigCustomURLResponseInfoSetIsEntireLengthAvailableOnDemand()
{
  return MEMORY[0x1E0CA0498]();
}

uint64_t FigCustomURLResponseInfoSetNSURLCredential()
{
  return MEMORY[0x1E0CA04A0]();
}

uint64_t FigCustomURLResponseInfoSetNSURLSessionAuthChallengeDisposition()
{
  return MEMORY[0x1E0CA04A8]();
}

uint64_t FigCustomURLResponseInfoSetRedirectLocation()
{
  return MEMORY[0x1E0CA04B0]();
}

uint64_t FigCustomURLResponseInfoSetRedirectRequestHeaders()
{
  return MEMORY[0x1E0CA04B8]();
}

uint64_t FigCustomURLResponseInfoSetResourceSize()
{
  return MEMORY[0x1E0CA04C0]();
}

uint64_t FigCustomURLResponseInfoSetRoundTripTime()
{
  return MEMORY[0x1E0CA04C8]();
}

uint64_t FigCustomURLResponseInfoSetSuppressErrorLogging()
{
  return MEMORY[0x1E0CA04D0]();
}

uint64_t FigCustomURLResponseInfoSetUniversalTypeIdentifier()
{
  return MEMORY[0x1E0CA04D8]();
}

uint64_t FigDataChannelGroupAddDataChannel()
{
  return MEMORY[0x1E0CC29D8]();
}

uint64_t FigDataChannelGroupCreate()
{
  return MEMORY[0x1E0CC29E0]();
}

uint64_t FigEndpointCopyActiveEndpointOfType()
{
  return MEMORY[0x1E0CA0650]();
}

uint64_t FigEndpointExtendedGetClassID()
{
  return MEMORY[0x1E0CA0670]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x1E0CA0680]();
}

uint64_t FigEndpointUIAgentXPCRemoteCreate()
{
  return MEMORY[0x1E0D483D0]();
}

uint64_t FigExportSettingsAverageBitRateForSourceAndExportPreset()
{
  return MEMORY[0x1E0CC2A60]();
}

uint64_t FigExportSettingsForExportPreset()
{
  return MEMORY[0x1E0CC2A68]();
}

uint64_t FigExportSettings_CopyEffectiveColorPropertyForPresetAndInputOutputFormat()
{
  return MEMORY[0x1E0CC2A70]();
}

uint64_t FigExportSettings_GetMaximumBitsPerComponent()
{
  return MEMORY[0x1E0CC2A78]();
}

uint64_t FigFileIsFileOnExternalStorageDevice()
{
  return MEMORY[0x1E0CA08C8]();
}

uint64_t FigFileTypeDoesSupportExternalSampleReferences()
{
  return MEMORY[0x1E0CC2A80]();
}

uint64_t FigFormatReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC2A98]();
}

uint64_t FigGeometryDimensionCopyAsDictionary()
{
  return MEMORY[0x1E0CA0958]();
}

uint64_t FigGeometryDimensionMake()
{
  return MEMORY[0x1E0CA0978]();
}

uint64_t FigGeometryDimensionMakeFromDictionary()
{
  return MEMORY[0x1E0CA0980]();
}

uint64_t FigGeometryMarginsCopyAsDictionary()
{
  return MEMORY[0x1E0CA09B0]();
}

uint64_t FigGeometryMarginsMake()
{
  return MEMORY[0x1E0CA09C0]();
}

uint64_t FigGeometryPointCopyAsDictionary()
{
  return MEMORY[0x1E0CA09D0]();
}

uint64_t FigGeometryPointMake()
{
  return MEMORY[0x1E0CA09F0]();
}

uint64_t FigGeometryPointMakeFromDictionary()
{
  return MEMORY[0x1E0CA09F8]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x1E0CA0A58]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x1E0CA0A70]();
}

uint64_t FigGetCGAffineTransformFrom3x2MatrixArray()
{
  return MEMORY[0x1E0CC2AC0]();
}

uint64_t FigGetCGAffineTransformFrom3x3MatrixArray()
{
  return MEMORY[0x1E0CC2AC8]();
}

uint64_t FigGetContinuousUpTimeNanoseconds()
{
  return MEMORY[0x1E0CA0A98]();
}

uint64_t FigGetRotationAngleAndFlipsFromCGAffineTransform()
{
  return MEMORY[0x1E0CC2AD0]();
}

uint64_t FigIsReferenceAllowedBySecurityPolicy()
{
  return MEMORY[0x1E0CA0D78]();
}

uint64_t FigIsSecTaskGPUExtensionOfBrowserEngine()
{
  return MEMORY[0x1E0CA0D80]();
}

uint64_t FigItemIntegratedTimelineCreate()
{
  return MEMORY[0x1E0CC2AF0]();
}

uint64_t FigKTraceInit()
{
  return MEMORY[0x1E0CA0D90]();
}

uint64_t FigManifoldCreateForICY()
{
  return MEMORY[0x1E0CC2AF8]();
}

uint64_t FigManifoldCreateForMPEG2()
{
  return MEMORY[0x1E0CC2B00]();
}

uint64_t FigManifoldCreateForMovieFragmentStream()
{
  return MEMORY[0x1E0CC2B08]();
}

uint64_t FigManifoldCreateForWebVTT()
{
  return MEMORY[0x1E0CC2B10]();
}

uint64_t FigManifoldCreateRemoteForICY()
{
  return MEMORY[0x1E0CC2B18]();
}

uint64_t FigManifoldCreateRemoteForMPEG2()
{
  return MEMORY[0x1E0CC2B20]();
}

uint64_t FigManifoldCreateRemoteForMovieFragmentStream()
{
  return MEMORY[0x1E0CC2B28]();
}

uint64_t FigManifoldCreateRemoteForWebVTT()
{
  return MEMORY[0x1E0CC2B30]();
}

uint64_t FigManifoldGetFigBaseObject()
{
  return MEMORY[0x1E0CC2B38]();
}

uint64_t FigMediaSelectionGroupsCreateMatchingSelection()
{
  return MEMORY[0x1E0CC2B40]();
}

uint64_t FigMediaValidatorCreateMediaValidatorPropertyList()
{
  return MEMORY[0x1E0CC2B48]();
}

uint64_t FigMediaValidatorValidateFormatDescription()
{
  return MEMORY[0x1E0CC2B50]();
}

uint64_t FigMediaValidatorValidateIndividualTrack()
{
  return MEMORY[0x1E0CC2B58]();
}

uint64_t FigMediaValidatorValidateIndividualTrackForDecoding()
{
  return MEMORY[0x1E0CC2B60]();
}

uint64_t FigMediaValidatorValidateRFC4281ExtendedMIMEType()
{
  return MEMORY[0x1E0CC2B68]();
}

uint64_t FigMediaValidatorValidateRFC4281ExtendedMIMETypeForStreaming()
{
  return MEMORY[0x1E0CC2B70]();
}

uint64_t FigMetadataCopyMovieCommonMetadata()
{
  return MEMORY[0x1E0CC2B78]();
}

uint64_t FigMetadataCopyTrackCommonMetadata()
{
  return MEMORY[0x1E0CC2B80]();
}

uint64_t FigMetadataCreateMetadataItemsFromSampleBuffer()
{
  return MEMORY[0x1E0CC2B98]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1E0CA0E88]();
}

uint64_t FigMetadataGetCommonKey()
{
  return MEMORY[0x1E0CC2BA0]();
}

uint64_t FigMetadataGetCoreMediaDataType()
{
  return MEMORY[0x1E0CC2BA8]();
}

uint64_t FigMetadataGetDataTypeWithNamespaceForCoreMediaDataType()
{
  return MEMORY[0x1E0CC2BB0]();
}

uint64_t FigMetadataGetISO639_1FromISO639_2T()
{
  return MEMORY[0x1E0CC2BB8]();
}

uint64_t FigMetadataGetPackedISO639_2TFromLocaleIdentifier()
{
  return MEMORY[0x1E0CC2BC0]();
}

uint64_t FigMetadataReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC2BC8]();
}

uint64_t FigMetadataStringKeyToOSTypeKeyWithKeySpace()
{
  return MEMORY[0x1E0CC2BD8]();
}

uint64_t FigMetricInstallAllPlaybackDeserializationHandlers()
{
  return MEMORY[0x1E0CC2BE8]();
}

uint64_t FigMovieFormatWriterCanFileTypeSupportFormatDescription()
{
  return MEMORY[0x1E0CC2BF0]();
}

uint64_t FigMutableCompositionCreateRemote()
{
  return MEMORY[0x1E0CC2C08]();
}

uint64_t FigMutableCompositionGetFigBaseObject()
{
  return MEMORY[0x1E0CC2C10]();
}

uint64_t FigMutableMovieCreateFromData()
{
  return MEMORY[0x1E0CC2C18]();
}

uint64_t FigMutableMovieGetFigBaseObject()
{
  return MEMORY[0x1E0CC2C28]();
}

uint64_t FigMutableMovieRemoteCreateEmpty()
{
  return MEMORY[0x1E0CC2C30]();
}

uint64_t FigMutableMovieRemoteCreateFromData()
{
  return MEMORY[0x1E0CC2C38]();
}

uint64_t FigMutableMovieRemoteCreateFromFormatReader()
{
  return MEMORY[0x1E0CC2C40]();
}

uint64_t FigMutableMovieRemoteCreateWithURL()
{
  return MEMORY[0x1E0CC2C48]();
}

uint64_t FigNWActivityCreateToken()
{
  return MEMORY[0x1E0CC2C50]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x1E0CA0F80]();
}

uint64_t FigNotificationCenterAddListeners()
{
  return MEMORY[0x1E0CA0FB0]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x1E0CA0FC0]();
}

uint64_t FigNotificationCenterAddWeakListeners()
{
  return MEMORY[0x1E0CA0FC8]();
}

uint64_t FigNotificationCenterRemoveListeners()
{
  return MEMORY[0x1E0CA0FD0]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x1E0CA0FD8]();
}

uint64_t FigNotificationCenterRemoveWeakListeners()
{
  return MEMORY[0x1E0CA0FE8]();
}

uint64_t FigPKDParsePSSHAndCopyContentKeyInfo()
{
  return MEMORY[0x1E0CC2C58]();
}

uint64_t FigPlaybackCoordinatorGetCMBaseObject()
{
  return MEMORY[0x1E0CC2DA0]();
}

uint64_t FigPlaybackItemGetFigBaseObject()
{
  return MEMORY[0x1E0CC2DA8]();
}

uint64_t FigPlaybackItemLogCreateW3CLogData()
{
  return MEMORY[0x1E0CC2DB0]();
}

uint64_t FigPlaybackItemSegmentGetInterstitialEvent()
{
  return MEMORY[0x1E0CC2DB8]();
}

uint64_t FigPlaybackItemSegmentGetLoadedTimeRanges()
{
  return MEMORY[0x1E0CC2DC0]();
}

uint64_t FigPlaybackItemSegmentGetStartDate()
{
  return MEMORY[0x1E0CC2DC8]();
}

uint64_t FigPlaybackItemSegmentGetTimeMapping()
{
  return MEMORY[0x1E0CC2DD0]();
}

uint64_t FigPlaybackItemSegmentGetType()
{
  return MEMORY[0x1E0CC2DD8]();
}

uint64_t FigPlayerAsyncDispatchToPlayerQueue()
{
  return MEMORY[0x1E0CC2DE0]();
}

uint64_t FigPlayerGetFigBaseObject()
{
  return MEMORY[0x1E0CC2DE8]();
}

uint64_t FigPlayerInterstitialCoordinatorCreate()
{
  return MEMORY[0x1E0CC2DF0]();
}

uint64_t FigPlayerInterstitialCoordinatorIsRemote()
{
  return MEMORY[0x1E0CC2DF8]();
}

uint64_t FigPlayerInterstitialEventContentMayVary()
{
  return MEMORY[0x1E0CC2E00]();
}

uint64_t FigPlayerInterstitialEventCopyAsDictionary()
{
  return MEMORY[0x1E0CC2E08]();
}

uint64_t FigPlayerInterstitialEventCopyAssetListResponse()
{
  return MEMORY[0x1E0CC2E10]();
}

uint64_t FigPlayerInterstitialEventCopyExtraAttributes()
{
  return MEMORY[0x1E0CC2E18]();
}

uint64_t FigPlayerInterstitialEventCopyIdentifier()
{
  return MEMORY[0x1E0CC2E20]();
}

uint64_t FigPlayerInterstitialEventCopyInterstitialAssetURLs()
{
  return MEMORY[0x1E0CC2E28]();
}

uint64_t FigPlayerInterstitialEventCopyPrimaryItem()
{
  return MEMORY[0x1E0CC2E30]();
}

uint64_t FigPlayerInterstitialEventCopyStartDate()
{
  return MEMORY[0x1E0CC2E38]();
}

uint64_t FigPlayerInterstitialEventCreate()
{
  return MEMORY[0x1E0CC2E40]();
}

uint64_t FigPlayerInterstitialEventCreateFromDictionary()
{
  return MEMORY[0x1E0CC2E48]();
}

uint64_t FigPlayerInterstitialEventCueOnce()
{
  return MEMORY[0x1E0CC2E50]();
}

uint64_t FigPlayerInterstitialEventGetPlayoutLimit()
{
  return MEMORY[0x1E0CC2E58]();
}

uint64_t FigPlayerInterstitialEventGetRestrictions()
{
  return MEMORY[0x1E0CC2E60]();
}

uint64_t FigPlayerInterstitialEventGetResumptionOffset()
{
  return MEMORY[0x1E0CC2E68]();
}

uint64_t FigPlayerInterstitialEventGetSnapOptions()
{
  return MEMORY[0x1E0CC2E70]();
}

uint64_t FigPlayerInterstitialEventGetStartTime()
{
  return MEMORY[0x1E0CC2E78]();
}

uint64_t FigPlayerInterstitialEventGetStatedDuration()
{
  return MEMORY[0x1E0CC2E80]();
}

uint64_t FigPlayerInterstitialEventGetTimelineOccupancy()
{
  return MEMORY[0x1E0CC2E88]();
}

uint64_t FigPlayerInterstitialEventIsImmutable()
{
  return MEMORY[0x1E0CC2E90]();
}

uint64_t FigPlayerInterstitialEventIsPostRoll()
{
  return MEMORY[0x1E0CC2E98]();
}

uint64_t FigPlayerInterstitialEventIsPreRoll()
{
  return MEMORY[0x1E0CC2EA0]();
}

uint64_t FigPlayerInterstitialEventSetContentMayVary()
{
  return MEMORY[0x1E0CC2EA8]();
}

uint64_t FigPlayerInterstitialEventSetCueOnce()
{
  return MEMORY[0x1E0CC2EB0]();
}

uint64_t FigPlayerInterstitialEventSetExtraAttributes()
{
  return MEMORY[0x1E0CC2EB8]();
}

uint64_t FigPlayerInterstitialEventSetIdentifier()
{
  return MEMORY[0x1E0CC2EC0]();
}

uint64_t FigPlayerInterstitialEventSetImmutable()
{
  return MEMORY[0x1E0CC2EC8]();
}

uint64_t FigPlayerInterstitialEventSetInterstitialAssetURLs()
{
  return MEMORY[0x1E0CC2ED0]();
}

uint64_t FigPlayerInterstitialEventSetIsPostRoll()
{
  return MEMORY[0x1E0CC2ED8]();
}

uint64_t FigPlayerInterstitialEventSetIsPreRoll()
{
  return MEMORY[0x1E0CC2EE0]();
}

uint64_t FigPlayerInterstitialEventSetPlannedDuration()
{
  return MEMORY[0x1E0CC2EE8]();
}

uint64_t FigPlayerInterstitialEventSetPlayoutLimit()
{
  return MEMORY[0x1E0CC2EF0]();
}

uint64_t FigPlayerInterstitialEventSetPrimaryItem()
{
  return MEMORY[0x1E0CC2EF8]();
}

uint64_t FigPlayerInterstitialEventSetRestrictions()
{
  return MEMORY[0x1E0CC2F00]();
}

uint64_t FigPlayerInterstitialEventSetResumptionOffset()
{
  return MEMORY[0x1E0CC2F08]();
}

uint64_t FigPlayerInterstitialEventSetSnapOptions()
{
  return MEMORY[0x1E0CC2F10]();
}

uint64_t FigPlayerInterstitialEventSetStartDate()
{
  return MEMORY[0x1E0CC2F18]();
}

uint64_t FigPlayerInterstitialEventSetStartTime()
{
  return MEMORY[0x1E0CC2F20]();
}

uint64_t FigPlayerInterstitialEventSetSupplementsPrimaryContent()
{
  return MEMORY[0x1E0CC2F28]();
}

uint64_t FigPlayerInterstitialEventSetTimelineOccupancy()
{
  return MEMORY[0x1E0CC2F30]();
}

uint64_t FigPlayerInterstitialEventSupplementsPrimaryContent()
{
  return MEMORY[0x1E0CC2F38]();
}

uint64_t FigPlayerInterstitialEventValidate()
{
  return MEMORY[0x1E0CC2F40]();
}

uint64_t FigPlayerInterstitialEventsCreateFromTaggedRangeMetadata()
{
  return MEMORY[0x1E0CC2F48]();
}

uint64_t FigPlayerInterstitialRemoteCoordinatorCreate()
{
  return MEMORY[0x1E0CC2F50]();
}

uint64_t FigPlayerInterstitialRemoteCoordinatorSetCurrentEvent()
{
  return MEMORY[0x1E0CC2F58]();
}

uint64_t FigPlayerInterstitialRemoteCoordinatorSetEvents()
{
  return MEMORY[0x1E0CC2F60]();
}

uint64_t FigProcessStateMonitorEnrollEligibleConnectionsInPurge()
{
  return MEMORY[0x1E0CA1100]();
}

uint64_t FigProcessStateMonitorGetServerPurgeState()
{
  return MEMORY[0x1E0CA1108]();
}

uint64_t FigProcessStateMonitorMayPurgeClientObjects()
{
  return MEMORY[0x1E0CA1110]();
}

uint64_t FigProcessStateMonitorMustNotPurgeClientObjects()
{
  return MEMORY[0x1E0CA1118]();
}

uint64_t FigReadOnlyTimebaseSetTargetTimebase()
{
  return MEMORY[0x1E0CA1198]();
}

uint64_t FigReadWriteLockCreate()
{
  return MEMORY[0x1E0CA11A0]();
}

uint64_t FigReadWriteLockDestroy()
{
  return MEMORY[0x1E0CA11A8]();
}

uint64_t FigReadWriteLockLockForRead()
{
  return MEMORY[0x1E0CA11B0]();
}

uint64_t FigReadWriteLockLockForWrite()
{
  return MEMORY[0x1E0CA11B8]();
}

uint64_t FigReadWriteLockUnlockForRead()
{
  return MEMORY[0x1E0CA11C0]();
}

uint64_t FigReadWriteLockUnlockForWrite()
{
  return MEMORY[0x1E0CA11C8]();
}

uint64_t FigReentrantMutexCreate()
{
  return MEMORY[0x1E0CA11D0]();
}

uint64_t FigReentrantMutexDestroy()
{
  return MEMORY[0x1E0CA11D8]();
}

uint64_t FigReentrantMutexLock()
{
  return MEMORY[0x1E0CA11E0]();
}

uint64_t FigReentrantMutexTryLock()
{
  return MEMORY[0x1E0CA11E8]();
}

uint64_t FigReentrantMutexUnlock()
{
  return MEMORY[0x1E0CA11F0]();
}

uint64_t FigRemakerCanFileTypeSupportFormatDescription()
{
  return MEMORY[0x1E0CC2F78]();
}

uint64_t FigRemoteRoutingContextFactoryGetCurrent()
{
  return MEMORY[0x1E0D483F8]();
}

uint64_t FigRemoteStreamingAssetDownloadOrchestratorCreate()
{
  return MEMORY[0x1E0CC2F80]();
}

uint64_t FigRemote_CreateFormatDescriptionArrayFromSerializedAtomData()
{
  return MEMORY[0x1E0CA1268]();
}

uint64_t FigRemote_CreateSerializedAtomDataForFormatDescriptions()
{
  return MEMORY[0x1E0CA1320]();
}

uint64_t FigRemote_ShouldConnectToMediaparserdFile_OptIn()
{
  return MEMORY[0x1E0CA1368]();
}

uint64_t FigRemote_ShouldConnectToMediaparserdForFileParsing()
{
  return MEMORY[0x1E0CA1370]();
}

uint64_t FigRemote_ShouldConnectToMediaplaybackd()
{
  return MEMORY[0x1E0CA1378]();
}

uint64_t FigResilientRemoteRoutingContextFactoryGetCurrent()
{
  return MEMORY[0x1E0D48400]();
}

uint64_t FigRouteDiscovererXPCRemoteCreate()
{
  return MEMORY[0x1E0D48418]();
}

uint64_t FigRoutingSessionGetCMBaseObject()
{
  return MEMORY[0x1E0D48450]();
}

uint64_t FigRoutingSessionManagerGetConfidenceThresholds()
{
  return MEMORY[0x1E0D48460]();
}

uint64_t FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager()
{
  return MEMORY[0x1E0D48470]();
}

uint64_t FigSampleBufferAudioRendererCreateRemoteWithOptionsAndRetry()
{
  return MEMORY[0x1E0CC2FB0]();
}

uint64_t FigSampleBufferAudioRendererGetFigBaseObject()
{
  return MEMORY[0x1E0CC2FC0]();
}

uint64_t FigSampleBufferCreateForCaptionGroup()
{
  return MEMORY[0x1E0CA1428]();
}

uint64_t FigSampleBufferGetCaptionGroup()
{
  return MEMORY[0x1E0CA1438]();
}

uint64_t FigSampleBufferRenderSynchronizerCreateRemoteWithOptions()
{
  return MEMORY[0x1E0CC3010]();
}

uint64_t FigSampleBufferSetDecryptor()
{
  return MEMORY[0x1E0CA1460]();
}

uint64_t FigSampleCursorGetFigBaseObject()
{
  return MEMORY[0x1E0CC3028]();
}

uint64_t FigSampleGeneratorRemoteCreateForFormatReader()
{
  return MEMORY[0x1E0CC3038]();
}

uint64_t FigSecureStopManagerRemoteCopyDefaultRuntimeInstance()
{
  return MEMORY[0x1E0CC3040]();
}

uint64_t FigSharedPlayerCreate()
{
  return MEMORY[0x1E0CC3048]();
}

uint64_t FigSharedPlayerCreateWithOptions()
{
  return MEMORY[0x1E0CC3050]();
}

uint64_t FigSharedPlayerGetDefaultEngineTopology()
{
  return MEMORY[0x1E0CC3058]();
}

uint64_t FigSharedRemote_CopyVideoCompressorSupportedPropertyDictionary()
{
  return MEMORY[0x1E0CC3060]();
}

uint64_t FigShared_CopyCacheLastModifiedDate()
{
  return MEMORY[0x1E0CC3068]();
}

uint64_t FigShared_CopyDiskCacheCheckedInIDs()
{
  return MEMORY[0x1E0CC3070]();
}

uint64_t FigShared_CopyDiskCacheParams()
{
  return MEMORY[0x1E0CC3078]();
}

uint64_t FigShared_DeleteFromDiskCache()
{
  return MEMORY[0x1E0CC3080]();
}

uint64_t FigShared_GetCacheFileSize()
{
  return MEMORY[0x1E0CC3088]();
}

uint64_t FigShared_SetDiskCacheParams()
{
  return MEMORY[0x1E0CC3090]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1E0CA1550]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1E0CA1570]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1E0CA1578]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1E0CA1580]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1E0CA1590]();
}

uint64_t FigStreamAssetImageGeneratorCreateFromAssetWithOptions()
{
  return MEMORY[0x1E0CC3098]();
}

uint64_t FigStreamingAssetDownloadConfigAddAuxConfig()
{
  return MEMORY[0x1E0CC30A0]();
}

uint64_t FigStreamingAssetDownloadConfigCreate()
{
  return MEMORY[0x1E0CC30A8]();
}

uint64_t FigStreamingAssetDownloadConfigSetAssetNameAndImage()
{
  return MEMORY[0x1E0CC30B0]();
}

uint64_t FigStreamingAssetDownloadConfigSetDownloadsInterstitialAssets()
{
  return MEMORY[0x1E0CC30B8]();
}

uint64_t FigStreamingAssetDownloadConfigSetOptimizesAuxiliaryContentConfigurations()
{
  return MEMORY[0x1E0CC30C0]();
}

uint64_t FigStreamingAssetDownloadConfigSetPrimaryContentConfig()
{
  return MEMORY[0x1E0CC30C8]();
}

uint64_t FigStreamingAssetDownloadConfigSetTimeRange()
{
  return MEMORY[0x1E0CC30D0]();
}

uint64_t FigStreamingAssetDownloadContentConfigCreate()
{
  return MEMORY[0x1E0CC30D8]();
}

uint64_t FigStreamingAssetDownloadContentConfigSetAlternate()
{
  return MEMORY[0x1E0CC30E0]();
}

uint64_t FigStreamingAssetDownloadContentConfigSetAlternateQualifiers()
{
  return MEMORY[0x1E0CC30E8]();
}

uint64_t FigStreamingAssetDownloadContentConfigSetMediaSelections()
{
  return MEMORY[0x1E0CC30F0]();
}

uint64_t FigThreadGetGlobalNetworkBufferingRunloop()
{
  return MEMORY[0x1E0CA17D8]();
}

uint64_t FigTimeOfDayTimeFromNTPTimestamp()
{
  return MEMORY[0x1E0CA1830]();
}

uint64_t FigTimelineCoordinationParticipantSnapshotCopySuspensionReasons()
{
  return MEMORY[0x1E0CA1838]();
}

uint64_t FigTimelineCoordinationParticipantSnapshotIsReadyToSetNonZeroRate()
{
  return MEMORY[0x1E0CA1840]();
}

uint64_t FigTimelineCoordinatorBeginSuspension()
{
  return MEMORY[0x1E0CA1848]();
}

uint64_t FigTimelineCoordinatorCoordinateJumpToTime()
{
  return MEMORY[0x1E0CA1858]();
}

uint64_t FigTimelineCoordinatorCoordinateRateChange()
{
  return MEMORY[0x1E0CA1868]();
}

uint64_t FigTimelineCoordinatorCopyParticipantSnapshotForUUID()
{
  return MEMORY[0x1E0CA1870]();
}

uint64_t FigTimelineCoordinatorCreate()
{
  return MEMORY[0x1E0CA1888]();
}

uint64_t FigTimelineCoordinatorEndSuspension()
{
  return MEMORY[0x1E0CA1898]();
}

uint64_t FigTimelineCoordinatorEndSuspensionProposingNewTime()
{
  return MEMORY[0x1E0CA18A0]();
}

uint64_t FigTimelineCoordinatorGetExpectedTimeAtHostTime()
{
  return MEMORY[0x1E0CA18D0]();
}

uint64_t FigTimelineCoordinatorHandleAssignmentOfUUIDToLocalParticipantByMedium()
{
  return MEMORY[0x1E0CA18D8]();
}

uint64_t FigTimelineCoordinatorHandleRemovalOfParticipantStateFromMedium()
{
  return MEMORY[0x1E0CA18E0]();
}

uint64_t FigTimelineCoordinatorHandleReplacementOfAllParticipantStatesFromMedium()
{
  return MEMORY[0x1E0CA18E8]();
}

uint64_t FigTimelineCoordinatorHandleTransitionToNewTimelineFromTimelineControl()
{
  return MEMORY[0x1E0CA18F0]();
}

uint64_t FigTimelineCoordinatorHandleUpdatedParticipantStateFromMedium()
{
  return MEMORY[0x1E0CA1900]();
}

uint64_t FigTimelineCoordinatorHandleUpdatedTimelineStateFromMedium()
{
  return MEMORY[0x1E0CA1908]();
}

uint64_t FigTimelineCoordinatorReapplyGroupStateViaTimelineControl()
{
  return MEMORY[0x1E0CA1918]();
}

uint64_t FigTimelineCoordinatorSetProperty()
{
  return MEMORY[0x1E0CA1928]();
}

uint64_t FigTimelineCoordinatorSetWeakMediumAndCallbacks()
{
  return MEMORY[0x1E0CA1938]();
}

uint64_t FigTimelineCoordinatorSuspensionCreate()
{
  return MEMORY[0x1E0CA1940]();
}

uint64_t FigTimelineStateDictionaryGetStateLoggingIdentifier()
{
  return MEMORY[0x1E0CA1948]();
}

uint64_t FigTrackReaderCreateSegmentData()
{
  return MEMORY[0x1E0CC30F8]();
}

uint64_t FigTrackReaderGetFigBaseObject()
{
  return MEMORY[0x1E0CC3100]();
}

uint64_t FigVCPGetTimedSampleAtTimeFromOrderedArray()
{
  return MEMORY[0x1E0CC3110]();
}

uint64_t FigVCPTimedSampleGetPTS()
{
  return MEMORY[0x1E0CC3118]();
}

uint64_t FigVCPTimedSampleGetPixelBuffer()
{
  return MEMORY[0x1E0CC3120]();
}

uint64_t FigVCPTimedSampleGetSampleBuffer()
{
  return MEMORY[0x1E0CC3128]();
}

uint64_t FigVideoCompositorCreateRemote()
{
  return MEMORY[0x1E0CC3130]();
}

uint64_t FigVideoCompositorGetFigBaseObject()
{
  return MEMORY[0x1E0CC3138]();
}

uint64_t FigVideoCompositorUtilityCopyRenderPixelBufferDimensionsAndCleanAperture()
{
  return MEMORY[0x1E0CC3140]();
}

uint64_t FigVideoFormatDescriptionContainsStereoMultiviewVideo()
{
  return MEMORY[0x1E0CA1A30]();
}

uint64_t FigVideoQueueCreateRemote()
{
  return MEMORY[0x1E0CC3148]();
}

uint64_t FigVideoQueueGetCMBaseObject()
{
  return MEMORY[0x1E0CC3150]();
}

uint64_t FigVideoReceiverCreate()
{
  return MEMORY[0x1E0CC3158]();
}

uint64_t FigVideoTargetCreateSharingVideoReceiverFromVideoTarget()
{
  return MEMORY[0x1E0CC3160]();
}

uint64_t FigVideoTargetCreateWithVideoReceiver()
{
  return MEMORY[0x1E0CC3168]();
}

uint64_t FigVisualContextCreateRemote()
{
  return MEMORY[0x1E0CC31D8]();
}

uint64_t FigVisualContextGetEarliestSequentialImageTime()
{
  return MEMORY[0x1E0CC31E0]();
}

uint64_t FigVolumeControllerCopySharedControllerRemote()
{
  return MEMORY[0x1E0D484B8]();
}

uint64_t FigXPCRelease()
{
  return MEMORY[0x1E0CA1D80]();
}

uint64_t FigXPCRemoteClientDispose()
{
  return MEMORY[0x1E0CA1DC8]();
}

uint64_t FigXPCRetain()
{
  return MEMORY[0x1E0CA1E10]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MTCopyStringsForMediaTypeAndSubType()
{
  return MEMORY[0x1E0CC31F0]();
}

uint64_t MTGetVideoDynamicRangeQualityGrade()
{
  return MEMORY[0x1E0CC31F8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

BOOL NSShouldRetainWithZone(id anObject, NSZone *requestedZone)
{
  return MEMORY[0x1E0CB31A0](anObject, requestedZone);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PKDCopyDecryptFormatTypeFromCodecType()
{
  return MEMORY[0x1E0CC3270]();
}

uint64_t PKDCopyDecryptFormatTypeFromSinfArray()
{
  return MEMORY[0x1E0CC3278]();
}

uint64_t PKDCopyDefaultKeyIDFromSinfArray()
{
  return MEMORY[0x1E0CC3280]();
}

uint64_t PKDCopyIdentifierForFormatDescription()
{
  return MEMORY[0x1E0CC3288]();
}

uint64_t PKDGetIdentifierForTransportStream()
{
  return MEMORY[0x1E0CC3290]();
}

uint64_t PKDIsContentKeyBossEnabled()
{
  return MEMORY[0x1E0CC3298]();
}

uint64_t PKDLogPrivateData()
{
  return MEMORY[0x1E0CC32A0]();
}

uint64_t PKDPersistentKeyIsForCTRModeDecryption()
{
  return MEMORY[0x1E0CC32A8]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1E0DAB728]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t VTBuildPixelBufferPools()
{
  return MEMORY[0x1E0CEC920]();
}

OSStatus VTCopyVideoEncoderList(CFDictionaryRef options, CFArrayRef *listOfVideoEncodersOut)
{
  return MEMORY[0x1E0CEC9D0](options, listOfVideoEncodersOut);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

Boolean VTIsStereoMVHEVCDecodeSupported(void)
{
  return MEMORY[0x1E0CECBC8]();
}

uint64_t VTPixelBufferAttributesMediatorAddLayer()
{
  return MEMORY[0x1E0CECC68]();
}

uint64_t VTPixelBufferAttributesMediatorCopyProperty()
{
  return MEMORY[0x1E0CECC70]();
}

uint64_t VTPixelBufferAttributesMediatorCreate()
{
  return MEMORY[0x1E0CECC78]();
}

uint64_t VTPixelBufferAttributesMediatorNotificationBarrier()
{
  return MEMORY[0x1E0CECC80]();
}

uint64_t VTPixelBufferAttributesMediatorRemoveLayer()
{
  return MEMORY[0x1E0CECC88]();
}

uint64_t VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey()
{
  return MEMORY[0x1E0CECC90]();
}

uint64_t VTPixelBufferAttributesMediatorSetProperty()
{
  return MEMORY[0x1E0CECC98]();
}

uint64_t VTPixelBufferAttributesMediatorSetRequestedPixelBufferAttributesForKey()
{
  return MEMORY[0x1E0CECCA0]();
}

uint64_t VTPixelBufferConformerCopyConformedPixelBuffer()
{
  return MEMORY[0x1E0CECCB0]();
}

uint64_t VTPixelBufferConformerCreateWithAttributes()
{
  return MEMORY[0x1E0CECCC0]();
}

uint64_t VTPixelBufferConformerGetAttributes()
{
  return MEMORY[0x1E0CECCC8]();
}

uint64_t VTPixelBufferConformerSetColorProperties()
{
  return MEMORY[0x1E0CECCD0]();
}

uint64_t VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode()
{
  return MEMORY[0x1E0CECE38]();
}

uint64_t VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode()
{
  return MEMORY[0x1E0CECE40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFLocaleCopyNumberingSystemForLocaleIdentifier()
{
  return MEMORY[0x1E0C9A208]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _FigIsNotCurrentDispatchQueue()
{
  return MEMORY[0x1E0CA1F48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1E0C80C58]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

uint64_t audiomxd_enabled()
{
  return MEMORY[0x1E0C924F0]();
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1E0C82E30]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1E0CA1F60]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1E0CA1F68]();
}

uint64_t fig_note_initialize_category_with_default_work()
{
  return MEMORY[0x1E0CA1F80]();
}

uint64_t fig_note_initialize_logging()
{
  return MEMORY[0x1E0CA1F90]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1E0C857B8](*(_QWORD *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1E0C857C8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

