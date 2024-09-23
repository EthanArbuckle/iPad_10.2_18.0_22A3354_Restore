@implementation WFGenerateGIFFromVideo

void __WFGenerateGIFFromVideo_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  void *v12;
  __CFString *v13;
  CGImageDestinationRef v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  const __CFURL *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  float64x2_t v49;
  float64x2_t v50;
  void *v51;
  const __CFDictionary *properties;
  const __CFURL *url;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  size_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  const __CFURL *v66;
  id v67;
  id v68;
  id v69;
  uint64_t *v70;
  _QWORD *v71;
  __int128 *v72;
  uint64_t *v73;
  double v74;
  double v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  __int128 v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[3];
  _QWORD v86[4];
  _QWORD aBlock[4];
  id v88;
  __int128 v89;
  uint64_t v90;
  _QWORD v91[3];
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  __int128 v98;
  uint64_t v99;
  CGAffineTransform v100;
  CGAffineTransform v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  CGImageDestinationRef v109;
  __int128 v110;
  uint64_t v111;
  id v112;
  _QWORD v113[2];
  _QWORD v114[2];
  uint64_t v115;
  _QWORD v116[4];

  v116[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v112 = 0;
  v3 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("duration"), &v112);
  v4 = v112;
  if (v3 == 2 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v5 = *(void **)(a1 + 32);
    getAVMediaTypeVideo();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tracksWithMediaType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v110 = 0uLL;
      v111 = 0;
      v8 = *(void **)(a1 + 32);
      if (v8)
        objc_msgSend(v8, "duration");
      v82 = v110;
      v83 = v111;
      soft_CMTimeGetSeconds(&v82);
      v10 = v9;
      v11 = *(float *)(a1 + 104);
      v12 = (void *)*MEMORY[0x24BDF83D8];
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", *(_QWORD *)(a1 + 40), v55);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v54);
      url = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v106 = 0;
      v107 = &v106;
      v108 = 0x2020000000;
      v109 = 0;
      objc_msgSend(v12, "identifier");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v59 = (unint64_t)(v10 * v11);
      v14 = CGImageDestinationCreateWithURL(url, v13, v59, 0);

      v109 = v14;
      v115 = *MEMORY[0x24BDD9598];
      v113[0] = *MEMORY[0x24BDD95B0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = *MEMORY[0x24BDD95A8];
      v114[0] = v15;
      v114[1] = MEMORY[0x24BDBD1C0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
      properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      CGImageDestinationSetProperties((CGImageDestinationRef)v107[3], properties);
      objc_msgSend(v58, "naturalSize");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v58, "preferredTransform");
      v21 = fabs(v20 * v104 + v102 * v18);
      v22 = fabs(v20 * v105 + v103 * v18);
      v23 = *(double *)(a1 + 88);
      v56 = v23;
      v57 = *(double *)(a1 + 96);
      if (v23 != 0.0 && *(double *)(a1 + 96) == 0.0)
        v57 = v23 * (v22 / v21);
      if (v23 == 0.0 && v57 != 0.0)
        v56 = v21 / v22 * v57;
      if (v56 == 0.0 && v57 == 0.0)
      {
        v57 = 500.0;
        if (v21 > 500.0)
        {
          v24 = v22 / v21;
          v21 = 500.0;
          v22 = v24 * 500.0;
        }
        if (v22 <= 500.0)
          v57 = v22;
        else
          v21 = v21 * 500.0 / v22;
        v56 = v21;
      }
      objc_msgSend(v58, "preferredTransform");
      CGAffineTransformInvert(&v101, &v100);
      v49 = *(float64x2_t *)&v101.c;
      v50 = *(float64x2_t *)&v101.a;
      v76 = 0;
      v77 = &v76;
      v78 = 0x2050000000;
      v25 = (void *)getAVAssetImageGeneratorClass_softClass;
      v79 = (uint64_t (*)(uint64_t, uint64_t))getAVAssetImageGeneratorClass_softClass;
      if (!getAVAssetImageGeneratorClass_softClass)
      {
        *(_QWORD *)&v82 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v82 + 1) = 3221225472;
        v83 = (uint64_t)__getAVAssetImageGeneratorClass_block_invoke;
        v84 = &unk_24C4E3118;
        v85[0] = &v76;
        __getAVAssetImageGeneratorClass_block_invoke((uint64_t)&v82);
        v25 = (void *)v77[3];
      }
      v26 = objc_retainAutorelease(v25);
      _Block_object_dispose(&v76, 8);
      objc_msgSend(v26, "assetImageGeneratorWithAsset:", *(_QWORD *)(a1 + 32));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      getkCMTimeZero((uint64_t)&v98);
      v96 = v98;
      v97 = v99;
      objc_msgSend(v27, "setRequestedTimeToleranceAfter:", &v96);
      getkCMTimeZero((uint64_t)&v94);
      v92 = v94;
      v93 = v95;
      objc_msgSend(v27, "setRequestedTimeToleranceBefore:", &v92);
      objc_msgSend(v27, "setAppliesPreferredTrackTransform:", 1);
      objc_msgSend(v27, "setMaximumSize:", vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v49, v57), v50, v56)));
      v51 = v27;
      v28 = (void *)objc_opt_new();
      if (v59)
      {
        for (i = 0; i != v59; ++i)
        {
          v30 = (void *)MEMORY[0x24BDD1968];
          soft_CMTimeMake((uint64_t)&v89, i, (int)*(float *)(a1 + 104));
          v31 = DWORD2(v110);
          *(_QWORD *)&v82 = 0;
          *((_QWORD *)&v82 + 1) = &v82;
          v83 = 0x2020000000;
          v32 = getCMTimeConvertScaleSymbolLoc_ptr;
          v84 = getCMTimeConvertScaleSymbolLoc_ptr;
          if (!getCMTimeConvertScaleSymbolLoc_ptr)
          {
            v33 = CoreMediaLibrary();
            v32 = dlsym(v33, "CMTimeConvertScale");
            *(_QWORD *)(*((_QWORD *)&v82 + 1) + 24) = v32;
            getCMTimeConvertScaleSymbolLoc_ptr = v32;
          }
          _Block_object_dispose(&v82, 8);
          if (!v32)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime soft_CMTimeConvertScale(CMTime, int32_t, CMTimeRoundingMethod)");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("WFAnimatedGIFTranscoder.m"), 42, CFSTR("%s"), dlerror());

            __break(1u);
          }
          v82 = v89;
          v83 = v90;
          ((void (*)(_QWORD *__return_ptr, __int128 *, uint64_t, uint64_t))v32)(v91, &v82, v31, 1);
          objc_msgSend(v30, "valueWithCMTime:", v91);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
      }
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __WFGenerateGIFFromVideo_block_invoke_2;
      aBlock[3] = &unk_24C4E2198;
      v35 = v51;
      v88 = v35;
      v36 = _Block_copy(aBlock);
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x2020000000;
      v86[3] = 0;
      *(_QWORD *)&v82 = 0;
      *((_QWORD *)&v82 + 1) = &v82;
      v83 = 0x3810000000;
      v84 = &unk_20BCBA407;
      memset(v85, 0, sizeof(v85));
      getkCMTimeZero((uint64_t)v85);
      v76 = 0;
      v77 = &v76;
      v78 = 0x3032000000;
      v79 = __Block_byref_object_copy__18;
      v80 = __Block_byref_object_dispose__19;
      v81 = 0;
      v39 = (void *)objc_opt_new();
      v40 = (void *)objc_opt_new();
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __WFGenerateGIFFromVideo_block_invoke_21;
      v60[3] = &unk_24C4DC508;
      v70 = &v106;
      v74 = v56;
      v75 = v57;
      v61 = v58;
      v62 = *(id *)(a1 + 48);
      v71 = v86;
      v41 = v39;
      v63 = v41;
      v72 = &v82;
      v42 = v40;
      v64 = v42;
      v73 = &v76;
      v43 = v28;
      v65 = v43;
      v69 = *(id *)(a1 + 56);
      v44 = url;
      v66 = v44;
      v45 = v55;
      v67 = v45;
      v46 = v54;
      v68 = v46;
      objc_msgSend(v35, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v43, v60);

      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(v86, 8);

      _Block_object_dispose(&v106, 8);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __WFGenerateGIFFromVideo_block_invoke_2_27(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __WFGenerateGIFFromVideo_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAllCGImageGeneration");
}

void __WFGenerateGIFFromVideo_block_invoke_21(uint64_t a1, uint64_t a2, CGImageRef Image, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  double Width;
  double Height;
  double v14;
  double v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  CGContext *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFURL *v27;
  uint64_t v28;
  __CFString *v29;
  CGImageDestination *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  id v48;
  unint64_t v49;
  BOOL v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  void *v57;
  CGImageSource *v58;
  CGImageDestination *v59;
  const __CFDictionary *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  CGAffineTransform v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[3];
  CGRect v87;

  v86[1] = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    goto LABEL_33;
  if (Image && !a5)
  {
    v65 = v11;
    CFRetain(Image);
    Width = (double)CGImageGetWidth(Image);
    Height = (double)CGImageGetHeight(Image);
    v14 = *(double *)(a1 + 136);
    v15 = *(double *)(a1 + 144);
    if (v14 == Width && v15 == Height)
    {
      v17 = *(void **)(a1 + 32);
      if (v17)
        objc_msgSend(v17, "preferredTransform");
      else
        memset(&v76, 0, sizeof(v76));
      if (CGAffineTransformIsIdentity(&v76))
      {
LABEL_17:
        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 40), "wfName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@-%lu.jpg"), v25, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v26);
        v27 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        v28 = *MEMORY[0x24BDF8438];
        objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v30 = CGImageDestinationCreateWithURL(v27, v29, 1uLL, 0);

        CGImageDestinationAddImage(v30, Image, 0);
        CGImageDestinationFinalize(v30);
        CFRelease(v30);
        CFRelease(Image);
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v27, 1, v31, v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = *(void **)(a1 + 48);
        v34 = (void *)MEMORY[0x24BDD16E0];
        v79 = *(_OWORD *)a4;
        v80 = *(_QWORD *)(a4 + 16);
        soft_CMTimeGetSeconds(&v79);
        objc_msgSend(v34, "numberWithDouble:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v32, v35);

        v75 = 0;
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
        v72 = *(_OWORD *)a4;
        v73 = *(_QWORD *)(a4 + 16);
        v74 = 0uLL;
        v70 = *(_OWORD *)(v36 + 32);
        v71 = *(_QWORD *)(v36 + 48);
        *(_QWORD *)&v79 = 0;
        *((_QWORD *)&v79 + 1) = &v79;
        v80 = 0x2020000000;
        v37 = getCMTimeSubtractSymbolLoc_ptr;
        v81 = getCMTimeSubtractSymbolLoc_ptr;
        if (!getCMTimeSubtractSymbolLoc_ptr)
        {
          v38 = CoreMediaLibrary();
          v37 = dlsym(v38, "CMTimeSubtract");
          *(_QWORD *)(*((_QWORD *)&v79 + 1) + 24) = v37;
          getCMTimeSubtractSymbolLoc_ptr = v37;
        }
        _Block_object_dispose(&v79, 8);
        if (!v37)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime soft_CMTimeSubtract(CMTime, CMTime)");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("WFAnimatedGIFTranscoder.m"), 44, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v79 = v72;
        v80 = v73;
        v77 = v70;
        v78 = v71;
        ((void (*)(__int128 *__return_ptr, __int128 *, __int128 *))v37)(&v74, &v79, &v77);
        v85 = *MEMORY[0x24BDD9598];
        v83 = *MEMORY[0x24BDD9590];
        v39 = (void *)MEMORY[0x24BDD16E0];
        v79 = v74;
        v80 = v75;
        soft_CMTimeGetSeconds(&v79);
        objc_msgSend(v39, "numberWithDouble:");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = *(void **)(a1 + 56);
        v44 = (void *)MEMORY[0x24BDD16E0];
        v79 = *(_OWORD *)a4;
        v80 = *(_QWORD *)(a4 + 16);
        soft_CMTimeGetSeconds(&v79);
        objc_msgSend(v44, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKey:", v42, v45);

        v11 = v65;
        goto LABEL_21;
      }
      v14 = *(double *)(a1 + 136);
      v15 = *(double *)(a1 + 144);
    }
    objc_msgSend(MEMORY[0x24BEC1378], "HDRCapableContextWithSize:scale:", v14, v15, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = objc_retainAutorelease(v18);
      CGContextTranslateCTM((CGContextRef)objc_msgSend(v20, "CGContext"), 0.0, *(CGFloat *)(a1 + 144));
      v21 = objc_retainAutorelease(v20);
      CGContextScaleCTM((CGContextRef)objc_msgSend(v21, "CGContext"), 1.0, -1.0);
      v22 = objc_retainAutorelease(v21);
      v23 = (CGContext *)objc_msgSend(v22, "CGContext");
      v87.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
      v87.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
      v87.size.width = *(CGFloat *)(a1 + 136);
      v87.size.height = *(CGFloat *)(a1 + 144);
      CGContextDrawImage(v23, v87, Image);
      CFRelease(Image);
      Image = CGBitmapContextCreateImage((CGContextRef)objc_msgSend(objc_retainAutorelease(v22), "CGContext"));
    }

    goto LABEL_17;
  }
LABEL_21:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  v46 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v47 = *(_OWORD *)a4;
  *(_QWORD *)(v46 + 48) = *(_QWORD *)(a4 + 16);
  *(_OWORD *)(v46 + 32) = v47;
  v48 = v11;
  if (v11)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), a6);
  v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  v50 = v49 >= objc_msgSend(*(id *)(a1 + 64), "count");
  v11 = v48;
  if (v50)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sortedArrayUsingSelector:", sel_compare_);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v67 != v54)
            objc_enumerationMutation(v52);
          v56 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = WFImageSourceCreateFromFile(v57, 0);

          v59 = *(CGImageDestination **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v56);
          v60 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGImageDestinationAddImageFromSource(v59, v58, 0, v60);

          CFRelease(v58);
        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      }
      while (v53);
    }

    CGImageDestinationFinalize(*(CGImageDestinationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
    v61 = *(_QWORD *)(a1 + 96);
    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", *(_QWORD *)(a1 + 72), 1, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v61 + 16))(v61, v62, 0);

    v11 = v48;
  }
LABEL_33:

}

@end
