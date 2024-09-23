@implementation AXMScreenGrabber

- (id)grabScreenWithRect:(CGRect)a3 orientation:(int64_t)a4 options:(id)a5 metrics:(id)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFDictionary *v49;
  IOSurfaceRef v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __IOSurface *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  CGColorSpaceRef v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  void *v106;
  void *v107;
  const __CFDictionary *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  CFTypeRef cf;
  CGColorSpaceRef cfa;
  id *v117;
  void *v118;
  double v119;
  void *v120;
  _QWORD v121[4];
  id v122;
  id v123;
  uint64_t v124;
  double v125;
  double v126;
  CGColorSpaceRef v127;
  _OWORD v128[3];
  uint8_t buf[32];
  _BYTE v130[20];
  __int16 v131;
  void *v132;
  __int16 v133;
  double v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  void *v138;
  uint64_t v139;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v139 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  objc_msgSend(v16, "startMeasure:", CFSTR("Screen Grab"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  AXMSharedDisplayManager();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coreAnimationMainDisplay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      if (a7)
      {
        _AXMMakeError(0, CFSTR("displayName was nil"), v26, v27, v28, v29, v30, v31, v105);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "endMeasurement");
      v78 = 0;
      goto LABEL_47;
    }
    cf = (CFTypeRef)a4;
    v117 = a7;
    objc_msgSend(v19, "convertRectToDisplay:", x, y, width, height);
    v119 = v33;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UsePreferredModelInputSizeForDetectors"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMScreenGrabber _adjustedScaleFactorForInputSize:constrainingToPreferredInputSizeFromDetectors:](self, "_adjustedScaleFactorForInputSize:constrainingToPreferredInputSizeFromDetectors:", v37, v39);
    v41 = v40;
    AXMediaLogScreenGrab();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", cf);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "physicalOrientation"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      AXMStringFromCGRect(x, y, width, height);
      v109 = v15;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      AXMStringFromCGRect(v119, v35, v37, v39);
      v111 = v17;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      AXMStringFromCGSize(v37, v39);
      v113 = v32;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      AXMStringFromCGSize(v37, v39);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220034;
      *(_QWORD *)&buf[4] = 0;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v43;
      *(_WORD *)v130 = 2112;
      *(_QWORD *)&v130[2] = v44;
      *(_WORD *)&v130[10] = 2112;
      *(_QWORD *)&v130[12] = v45;
      v131 = 2112;
      v132 = v46;
      v133 = 2048;
      v134 = v41;
      v135 = 2112;
      v136 = v47;
      v137 = 2112;
      v138 = v48;
      _os_log_impl(&dword_1B0E3B000, v42, OS_LOG_TYPE_INFO, "Will perform capture\n\tUse Efficient Downsampling: %ld\n\tDisplay: %@\n\tInterface Orientation:%@\n\tPhysical Orientation:%@\n\tInput Rect: %@\n\tDisplay Rect: %@\n\tAdjusted Scale: %.2f\n\tInputSize (px): %@\n\tSurface Size (px): %@", buf, 0x5Cu);

      v32 = v113;
      v17 = v111;

      v15 = v109;
    }

    -[AXMScreenGrabber _ioSurfaceConfigurationWithSize:](self, "_ioSurfaceConfigurationWithSize:", v37, v39);
    v49 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v50 = IOSurfaceCreate(v49);
    if (!v50)
    {
      if (v117)
      {
        _AXMMakeError(0, CFSTR("Failed to create IOSurface"), v51, v52, v53, v54, v55, v56, v105);
        *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "endMeasurement");
      v78 = 0;
      goto LABEL_46;
    }
    v57 = v50;
    AXMediaLogScreenGrab();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      -[AXMScreenGrabber grabScreenWithRect:orientation:options:metrics:error:].cold.2();
    v108 = v49;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("IgnoredLayerContextIDs"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("IncludedLayerContextIDs"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SnapshotLayerID"));
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SnapshotContextID"));
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = v119;
    v64 = v35;
    v65 = v41;
    v120 = (void *)v60;
    v110 = (void *)v61;
    v107 = (void *)v62;
    -[AXMScreenGrabber _renderOptionsForSurface:captureRect:displayName:scaleFactor:ignoredLayerContextIDs:includedLayerContextIDs:snapshotLayerID:snapshotContextID:](self, "_renderOptionsForSurface:captureRect:displayName:scaleFactor:ignoredLayerContextIDs:includedLayerContextIDs:snapshotLayerID:snapshotContextID:", v57, v32, v59, v60, v61, v63, v64, v37, v39, v41);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    IOSurfaceLock(v57, 0, 0);
    LOBYTE(v60) = CARenderServerSnapshot();
    IOSurfaceUnlock(v57, 0, 0);
    if ((v60 & 1) == 0)
    {
      CFRelease(v57);
      if (v117)
      {
        _AXMMakeError(0, CFSTR("Failed to render display"), v79, v80, v81, v82, v83, v84, v105);
        *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "endMeasurement");
      v78 = 0;
      v49 = v108;
      goto LABEL_45;
    }
    v112 = v17;
    v114 = v32;
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithIOSurface:", v57);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "rotatedImageWithInterfaceOrientation:displayOrientation:appliedImageOrientation:", cf, objc_msgSend(v19, "physicalOrientation"), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
      v49 = v108;
      if (v69)
      {
        cfa = v69;
        objc_msgSend(v68, "extent");
        v72 = v70;
        v73 = v71;
        v106 = v59;
        if (v65 < 1.0)
        {
          v72 = v65 * v70;
          *(_OWORD *)v130 = 0u;
          v73 = v65 * v71;
          memset(buf, 0, sizeof(buf));
          CGAffineTransformMakeScale((CGAffineTransform *)buf, v65, v65);
          v128[0] = *(_OWORD *)buf;
          v128[1] = *(_OWORD *)&buf[16];
          v128[2] = *(_OWORD *)v130;
          objc_msgSend(v68, "imageByApplyingTransform:", v128);
          v74 = objc_claimAutoreleasedReturnValue();

          v68 = (void *)v74;
        }
        *(_QWORD *)buf = 0;
        v75 = CVPixelBufferCreate(0, (unint64_t)v72, (unint64_t)v73, *(OSType *)AXMVisionNativeVideoPixelBufferFormat, 0, (CVPixelBufferRef *)buf);
        if ((_DWORD)v75 || !*(_QWORD *)buf)
        {
          CFRelease(v57);
          CFRelease(cfa);
          if (*(_QWORD *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(_QWORD *)buf = 0;
          }
          if (v117)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v75);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            _AXMMakeError(0, CFSTR("CVPixelBufferCreate returned NULL buffer for pixel buffer. CVReturn: %@"), v98, v99, v100, v101, v102, v103, (uint64_t)v97);
            *v117 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v17, "endMeasurement");
          v78 = 0;
        }
        else
        {
          v121[0] = MEMORY[0x1E0C809B0];
          v121[1] = 3221225472;
          v121[2] = __73__AXMScreenGrabber_grabScreenWithRect_orientation_options_metrics_error___block_invoke;
          v121[3] = &unk_1E625C430;
          v122 = v16;
          v123 = v68;
          v124 = *(_QWORD *)buf;
          v125 = v72;
          v126 = v73;
          v127 = cfa;
          objc_msgSend(v122, "measure:execute:", CFSTR("Render ScreenGrab"), v121);
          objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", *(_QWORD *)buf);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          AXMediaLogScreenGrab();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
            -[AXMScreenGrabber grabScreenWithRect:orientation:options:metrics:error:].cold.1();

          if (*(_QWORD *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(_QWORD *)buf = 0;
          }
          CFRelease(cfa);
          CFRelease(v57);
          v17 = v112;
          objc_msgSend(v112, "endMeasurement");
          v78 = v76;

        }
        v32 = v114;
        v59 = v106;
        goto LABEL_45;
      }
      CFRelease(v57);
      if (v117)
      {
        _AXMMakeError(0, CFSTR("Could not create color space"), v91, v92, v93, v94, v95, v96, v105);
        *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "endMeasurement");

    }
    else
    {
      CFRelease(v57);
      v49 = v108;
      if (v117)
      {
        _AXMMakeError(0, CFSTR("Could not convert surface to CIImage"), v85, v86, v87, v88, v89, v90, v105);
        *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "endMeasurement");
    }
    v78 = 0;
    v32 = v114;
LABEL_45:

LABEL_46:
LABEL_47:

    goto LABEL_48;
  }
  if (a7)
  {
    _AXMMakeError(0, CFSTR("mainDisplay was nil"), v20, v21, v22, v23, v24, v25, v105);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "endMeasurement");
  v78 = 0;
LABEL_48:

  return v78;
}

void __73__AXMScreenGrabber_grabScreenWithRect_orientation_options_metrics_error___block_invoke(uint64_t a1)
{
  id v2;

  AXMCoreImageContext(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "render:toCVPixelBuffer:bounds:colorSpace:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (id)_ioSurfaceConfigurationWithSize:(CGSize)a3
{
  float width;
  unint64_t v4;
  float height;
  unint64_t v6;
  uint64_t AlignedBytesPerRow;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[7];

  width = a3.width;
  v4 = llroundf(width);
  v18[6] = *MEMORY[0x1E0C80C00];
  height = a3.height;
  v6 = llroundf(height);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v8 = (AlignedBytesPerRow * v6);
  v17[0] = *MEMORY[0x1E0CBC1E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v17[1] = *MEMORY[0x1E0CBC008];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E0CBBF08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AlignedBytesPerRow);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v17[3] = *MEMORY[0x1E0CBBEE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  v17[4] = *MEMORY[0x1E0CBBF00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  v17[5] = *MEMORY[0x1E0CBC070];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)AXMVisionNativeVideoPixelBufferFormat);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_renderOptionsForSurface:(__IOSurface *)a3 captureRect:(CGRect)a4 displayName:(id)a5 scaleFactor:(double)a6 ignoredLayerContextIDs:(id)a7 includedLayerContextIDs:(id)a8 snapshotLayerID:(id)a9 snapshotContextID:(id)a10
{
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  y = a4.origin.y;
  x = a4.origin.x;
  v61 = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CD30A8]);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CD30B0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)x);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CD3120]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)y);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CD3128]);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CD30E8]);
  v25 = *MEMORY[0x1E0CD3098];
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CD3098]);
  if (objc_msgSend(v19, "count"))
  {
    v43 = v21;
    v44 = v20;
    v45 = v18;
    v46 = v17;
    objc_msgSend(v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD3118], *MEMORY[0x1E0CD30F0]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v27 = v19;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v32, "unsignedIntegerValue"))
          {
            v58 = v25;
            v59 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v33);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v29);
    }
  }
  else
  {
    v34 = objc_msgSend(v18, "count");
    v35 = *MEMORY[0x1E0CD30F0];
    if (!v34)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD30F8], v35);
      goto LABEL_23;
    }
    v43 = v21;
    v44 = v20;
    v46 = v17;
    objc_msgSend(v22, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD3100], v35);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v45 = v18;
    v27 = v18;
    v36 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v27);
          v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          if (objc_msgSend(v40, "unsignedIntegerValue"))
          {
            v55 = v25;
            v56 = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v41);

          }
        }
        v37 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v37);
    }
  }

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CD30A0]);
  v18 = v45;
  v17 = v46;
  v21 = v43;
  v20 = v44;
LABEL_23:

  return v22;
}

- (double)_adjustedScaleFactorForInputSize:(CGSize)a3 constrainingToPreferredInputSizeFromDetectors:(id)a4
{
  double height;
  double width;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "preferredModelInputSize");
          v14 = v13 / width;
          v16 = v15 / height;
          if (v16 > v14)
            v14 = v16;
          if (v14 > v10 && v14 < 1.0)
            v10 = v14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }
  v18 = 1.0;
  if (v10 != 0.0)
    v18 = v10;
  if (v18 >= 0.33)
    v19 = v18;
  else
    v19 = 0.33;

  return v19;
}

- (void)recordScreenForDuration:(double)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  double v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[16];
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  if (!ReplayKitLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E625C4C8;
    v34 = 0;
    ReplayKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ReplayKitLibraryCore_frameworkLibrary)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v13 = (void *)getRPScreenRecorderClass_softClass;
    v32 = getRPScreenRecorderClass_softClass;
    if (!getRPScreenRecorderClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      v34 = __getRPScreenRecorderClass_block_invoke;
      v35 = &unk_1E625C4E8;
      v36 = &v29;
      __getRPScreenRecorderClass_block_invoke((uint64_t)buf);
      v13 = (void *)v30[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v29, 8);
    objc_msgSend(v14, "sharedRecorder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSystemRecording:", 1);
    objc_msgSend(v15, "setDelegate:", self);
    if ((objc_msgSend(v15, "isAvailable") & 1) != 0)
    {
      AXMediaLogScreenGrab();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v22, OS_LOG_TYPE_DEFAULT, "Will begin recording screen", buf, 2u);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke;
      v25[3] = &unk_1E625C4A8;
      v27 = v12;
      v28 = a3;
      v26 = v15;
      objc_msgSend(v26, "startSystemRecordingWithMicrophoneEnabled:handler:", 0, v25);

      v23 = v27;
      goto LABEL_14;
    }
    if (v12)
    {
      _AXMMakeError(0, CFSTR("Screen recording is not available"), v16, v17, v18, v19, v20, v21, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v23);
LABEL_14:

    }
LABEL_15:

    goto LABEL_16;
  }
  if (v12)
  {
    _AXMMakeError(0, CFSTR("ReplayKit is not available"), v6, v7, v8, v9, v10, v11, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v15);
    goto LABEL_15;
  }
LABEL_16:

}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AXMediaLogScreenGrab();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      v14 = v7;
      _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "Screen recording in progress for %.1fs", buf, 0xCu);
    }

    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_get_global_queue(33, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_54;
    v10[3] = &unk_1E625C480;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    dispatch_after(v8, v9, v10);

  }
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_54(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  AXMediaLogScreenGrab();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0E3B000, v2, OS_LOG_TYPE_DEFAULT, "Screen recording is finishing", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_55;
  v4[3] = &unk_1E625C458;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "stopSystemRecordingWithURLHandler:", v4);

}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[12];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    AXMediaLogScreenGrab();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_55_cold_2();

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    AXMediaLogScreenGrab();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v20 = 138412290;
        *(_QWORD *)&v20[4] = v5;
        _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_DEFAULT, "Screen recording did finish with output URL: %@", v20, 0xCu);
      }

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_55_cold_1(v11);

    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
    {
      _AXMMakeError(0, CFSTR("No video URL was produced"), v12, v13, v14, v15, v16, v17, *(uint64_t *)v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

    }
  }

}

- (void)grabScreenWithRect:orientation:options:metrics:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B0E3B000, v0, v1, "Did render snapshot with config: %@\n%@");
  OUTLINED_FUNCTION_1();
}

- (void)grabScreenWithRect:orientation:options:metrics:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B0E3B000, v0, v1, "Did create IOSurface with config: %@\n%@");
  OUTLINED_FUNCTION_1();
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Screen recording did fail to start: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_55_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Screen recording did fail to produce output url", v1, 2u);
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_55_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Screen recording did fail to finish: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
