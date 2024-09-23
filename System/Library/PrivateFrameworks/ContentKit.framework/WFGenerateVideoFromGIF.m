@implementation WFGenerateVideoFromGIF

void __WFGenerateVideoFromGIF_block_invoke_2(uint64_t a1)
{
  size_t v2;
  CFDictionaryRef v3;
  CGImageRef ImageAtIndex;
  CGImage *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  size_t Width;
  size_t Height;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  CGColorSpace *DeviceRGB;
  size_t v23;
  size_t v24;
  size_t v25;
  size_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  size_t v30;
  CGContext *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  _BOOL4 v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  id v82;
  const __CFDictionary *v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[5];
  CGRect v98;

  v97[2] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) >= *(_QWORD *)(a1 + 120)
    || (v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), v2 >= *(_QWORD *)(a1 + 128)))
  {
    v55 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    if (v55)
    {
      CFRelease(v55);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
    v56 = *(void **)(a1 + 48);
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v93 = *(_OWORD *)(v57 + 32);
    v94 = *(_QWORD *)(v57 + 48);
    objc_msgSend(v56, "endSessionAtSourceTime:", &v93);
    v58 = *(void **)(a1 + 48);
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __WFGenerateVideoFromGIF_block_invoke_3;
    v78[3] = &unk_24C4DEB90;
    v83 = (const __CFDictionary *)*(id *)(a1 + 80);
    v79 = *(id *)(a1 + 48);
    v80 = *(id *)(a1 + 56);
    v81 = *(id *)(a1 + 64);
    v82 = *(id *)(a1 + 72);
    objc_msgSend(v58, "finishWritingWithCompletionHandler:", v78);

    v3 = v83;
  }
  else
  {
    v3 = CGImageSourceCopyPropertiesAtIndex(*(CGImageSourceRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), v2, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(*(CGImageSourceRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 0);
    if (ImageAtIndex)
    {
      v5 = ImageAtIndex;
      *(_QWORD *)&v93 = 0;
      *((_QWORD *)&v93 + 1) = &v93;
      v94 = 0x2020000000;
      v6 = (_QWORD *)getkCVPixelBufferCGImageCompatibilityKeySymbolLoc_ptr;
      v95 = (void *)getkCVPixelBufferCGImageCompatibilityKeySymbolLoc_ptr;
      if (!getkCVPixelBufferCGImageCompatibilityKeySymbolLoc_ptr)
      {
        v7 = CoreVideoLibrary();
        v6 = dlsym(v7, "kCVPixelBufferCGImageCompatibilityKey");
        *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v6;
        getkCVPixelBufferCGImageCompatibilityKeySymbolLoc_ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v93, 8);
      if (v6)
      {
        v96[0] = *v6;
        v8 = MEMORY[0x24BDBD1C8];
        v97[0] = MEMORY[0x24BDBD1C8];
        *(_QWORD *)&v93 = 0;
        *((_QWORD *)&v93 + 1) = &v93;
        v94 = 0x2020000000;
        v9 = (_QWORD *)getkCVPixelBufferCGBitmapContextCompatibilityKeySymbolLoc_ptr;
        v95 = (void *)getkCVPixelBufferCGBitmapContextCompatibilityKeySymbolLoc_ptr;
        if (!getkCVPixelBufferCGBitmapContextCompatibilityKeySymbolLoc_ptr)
        {
          v10 = CoreVideoLibrary();
          v9 = dlsym(v10, "kCVPixelBufferCGBitmapContextCompatibilityKey");
          *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v9;
          getkCVPixelBufferCGBitmapContextCompatibilityKeySymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v93, 8);
        if (v9)
        {
          v96[1] = *v9;
          v97[1] = v8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0;
          Width = CGImageGetWidth(v5);
          Height = CGImageGetHeight(v5);
          *(_QWORD *)&v93 = 0;
          *((_QWORD *)&v93 + 1) = &v93;
          v94 = 0x2020000000;
          v13 = getCVPixelBufferCreateSymbolLoc_ptr;
          v95 = getCVPixelBufferCreateSymbolLoc_ptr;
          if (!getCVPixelBufferCreateSymbolLoc_ptr)
          {
            v14 = CoreVideoLibrary();
            v13 = dlsym(v14, "CVPixelBufferCreate");
            *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v13;
            getCVPixelBufferCreateSymbolLoc_ptr = v13;
          }
          _Block_object_dispose(&v93, 8);
          if (v13)
          {
            ((void (*)(_QWORD, size_t, size_t, uint64_t, void *, uint64_t *))v13)(0, Width, Height, 32, v77, &v90);
            v15 = v90;
            if (!v90)
            {
              CGImageRelease(v5);
LABEL_43:

              goto LABEL_41;
            }
            *(_QWORD *)&v93 = 0;
            *((_QWORD *)&v93 + 1) = &v93;
            v94 = 0x2020000000;
            v16 = getCVPixelBufferLockBaseAddressSymbolLoc_ptr;
            v95 = getCVPixelBufferLockBaseAddressSymbolLoc_ptr;
            if (!getCVPixelBufferLockBaseAddressSymbolLoc_ptr)
            {
              v17 = CoreVideoLibrary();
              v16 = dlsym(v17, "CVPixelBufferLockBaseAddress");
              *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v16;
              getCVPixelBufferLockBaseAddressSymbolLoc_ptr = v16;
            }
            _Block_object_dispose(&v93, 8);
            if (v16)
            {
              ((void (*)(uint64_t, _QWORD))v16)(v15, 0);
              v18 = v90;
              *(_QWORD *)&v93 = 0;
              *((_QWORD *)&v93 + 1) = &v93;
              v94 = 0x2020000000;
              v19 = getCVPixelBufferGetBaseAddressSymbolLoc_ptr;
              v95 = getCVPixelBufferGetBaseAddressSymbolLoc_ptr;
              if (!getCVPixelBufferGetBaseAddressSymbolLoc_ptr)
              {
                v20 = CoreVideoLibrary();
                v19 = dlsym(v20, "CVPixelBufferGetBaseAddress");
                *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v19;
                getCVPixelBufferGetBaseAddressSymbolLoc_ptr = v19;
              }
              _Block_object_dispose(&v93, 8);
              if (v19)
              {
                v21 = (void *)((uint64_t (*)(uint64_t))v19)(v18);
                DeviceRGB = CGColorSpaceCreateDeviceRGB();
                soft_CVPixelBufferGetWidth(v90);
                v24 = v23;
                soft_CVPixelBufferGetHeight(v90);
                v26 = v25;
                v27 = v90;
                *(_QWORD *)&v93 = 0;
                *((_QWORD *)&v93 + 1) = &v93;
                v94 = 0x2020000000;
                v28 = getCVPixelBufferGetBytesPerRowSymbolLoc_ptr;
                v95 = getCVPixelBufferGetBytesPerRowSymbolLoc_ptr;
                if (!getCVPixelBufferGetBytesPerRowSymbolLoc_ptr)
                {
                  v29 = CoreVideoLibrary();
                  v28 = dlsym(v29, "CVPixelBufferGetBytesPerRow");
                  *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v28;
                  getCVPixelBufferGetBytesPerRowSymbolLoc_ptr = v28;
                }
                _Block_object_dispose(&v93, 8);
                if (v28)
                {
                  v30 = ((uint64_t (*)(uint64_t))v28)(v27);
                  v31 = CGBitmapContextCreate(v21, v24, v26, 8uLL, v30, DeviceRGB, 2u);
                  soft_CVPixelBufferGetWidth(v90);
                  v33 = v32;
                  soft_CVPixelBufferGetHeight(v90);
                  v98.size.width = (double)v33;
                  v98.size.height = (double)v34;
                  v98.origin.x = 0.0;
                  v98.origin.y = 0.0;
                  CGContextDrawImage(v31, v98, v5);
                  CGColorSpaceRelease(DeviceRGB);
                  CGContextRelease(v31);
                  CGImageRelease(v5);
                  v35 = v90;
                  *(_QWORD *)&v93 = 0;
                  *((_QWORD *)&v93 + 1) = &v93;
                  v94 = 0x2020000000;
                  v36 = getCVPixelBufferUnlockBaseAddressSymbolLoc_ptr;
                  v95 = getCVPixelBufferUnlockBaseAddressSymbolLoc_ptr;
                  if (!getCVPixelBufferUnlockBaseAddressSymbolLoc_ptr)
                  {
                    v37 = CoreVideoLibrary();
                    v36 = dlsym(v37, "CVPixelBufferUnlockBaseAddress");
                    *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v36;
                    getCVPixelBufferUnlockBaseAddressSymbolLoc_ptr = v36;
                  }
                  _Block_object_dispose(&v93, 8);
                  if (v36)
                  {
                    ((void (*)(uint64_t, _QWORD))v36)(v35, 0);
                    while (!objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
                      ;
                    v38 = *(void **)(a1 + 40);
                    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
                    v93 = *(_OWORD *)(v39 + 32);
                    v94 = *(_QWORD *)(v39 + 48);
                    objc_msgSend(v38, "appendPixelBuffer:withPresentationTime:", v90, &v93);
                    -[__CFDictionary objectForKey:](v3, "objectForKey:", *MEMORY[0x24BDD9598]);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BDD9590]);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "doubleValue");
                    v43 = v42;
                    v44 = v42 != 0.0;

                    v46 = 1.0 / v43;
                    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
                    if (!v44)
                      v46 = 9.99999985;
                    LODWORD(v45) = vcvtpd_s64_f64(v46);
                    soft_CMTimeMake((uint64_t)&v86, 1, v45);
                    v84 = *(_OWORD *)(v47 + 32);
                    v85 = *(_QWORD *)(v47 + 48);
                    *(_QWORD *)&v93 = 0;
                    *((_QWORD *)&v93 + 1) = &v93;
                    v94 = 0x2020000000;
                    v48 = getCMTimeAddSymbolLoc_ptr;
                    v95 = getCMTimeAddSymbolLoc_ptr;
                    if (!getCMTimeAddSymbolLoc_ptr)
                    {
                      v49 = CoreMediaLibrary();
                      v48 = dlsym(v49, "CMTimeAdd");
                      *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v48;
                      getCMTimeAddSymbolLoc_ptr = v48;
                    }
                    _Block_object_dispose(&v93, 8);
                    if (v48)
                    {
                      v93 = v84;
                      v94 = v85;
                      v91 = v86;
                      v92 = v87;
                      ((void (*)(__int128 *__return_ptr, __int128 *, __int128 *))v48)(&v88, &v93, &v91);
                      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
                      *(_OWORD *)(v50 + 32) = v88;
                      v51 = v90;
                      *(_QWORD *)(v50 + 48) = v89;
                      *(_QWORD *)&v93 = 0;
                      *((_QWORD *)&v93 + 1) = &v93;
                      v94 = 0x2020000000;
                      v52 = getCVPixelBufferReleaseSymbolLoc_ptr;
                      v95 = getCVPixelBufferReleaseSymbolLoc_ptr;
                      if (!getCVPixelBufferReleaseSymbolLoc_ptr)
                      {
                        v53 = CoreVideoLibrary();
                        v52 = dlsym(v53, "CVPixelBufferRelease");
                        *(_QWORD *)(*((_QWORD *)&v93 + 1) + 24) = v52;
                        getCVPixelBufferReleaseSymbolLoc_ptr = v52;
                      }
                      _Block_object_dispose(&v93, 8);
                      if (v52)
                      {
                        ((void (*)(uint64_t))v52)(v51);
                        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
                        v54 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
                        if (*(_QWORD *)(v54 + 24) == *(_QWORD *)(a1 + 128))
                        {
                          *(_QWORD *)(v54 + 24) = 0;
                          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
                        }
                        goto LABEL_43;
                      }
                      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void soft_CVPixelBufferRelease(CVPixelBufferRef _Nullable)");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("WFAnimatedGIFTranscoder.m"), 33, CFSTR("%s"), dlerror());

                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime soft_CMTimeAdd(CMTime, CMTime)");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("WFAnimatedGIFTranscoder.m"), 43, CFSTR("%s"), dlerror());

                    }
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CVReturn soft_CVPixelBufferUnlockBaseAddress(CVPixelBufferRef _Nonnull, CVPixelBufferLockFlags)");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("WFAnimatedGIFTranscoder.m"), 31, CFSTR("%s"), dlerror());

                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "size_t soft_CVPixelBufferGetBytesPerRow(CVPixelBufferRef _Nonnull)");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("WFAnimatedGIFTranscoder.m"), 36, CFSTR("%s"), dlerror());

                }
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *soft_CVPixelBufferGetBaseAddress(CVPixelBufferRef _Nonnull)");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, CFSTR("WFAnimatedGIFTranscoder.m"), 32, CFSTR("%s"), dlerror());

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CVReturn soft_CVPixelBufferLockBaseAddress(CVPixelBufferRef _Nonnull, CVPixelBufferLockFlags)");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("WFAnimatedGIFTranscoder.m"), 30, CFSTR("%s"), dlerror());

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CVReturn soft_CVPixelBufferCreate(CFAllocatorRef _Nullable, size_t, size_t, OSType, CFDictionaryRef _Nullable, CVPixelBufferRef  _Nullable * _Nonnull)");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("WFAnimatedGIFTranscoder.m"), 29, CFSTR("%s"), dlerror());

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCVPixelBufferCGBitmapContextCompatibilityKey(void)");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("WFAnimatedGIFTranscoder.m"), 28, CFSTR("%s"), dlerror());

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCVPixelBufferCGImageCompatibilityKey(void)");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("WFAnimatedGIFTranscoder.m"), 27, CFSTR("%s"), dlerror());

      }
      __break(1u);
    }
  }
LABEL_41:

}

void __WFGenerateVideoFromGIF_block_invoke_4(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  v2 = WFGenerateVideoFromGIF_videoWriterQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __WFGenerateVideoFromGIF_block_invoke_5;
  block[3] = &unk_24C4E2DD0;
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v2, block);

}

void __WFGenerateVideoFromGIF_block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cancelWriting");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

void __WFGenerateVideoFromGIF_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v3 == 2)
  {
    +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);

  if (v3 == 2)
}

void __WFGenerateVideoFromGIF_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("is.workflow.my.app.gif-to-video", 0);
  v1 = (void *)WFGenerateVideoFromGIF_videoWriterQueue;
  WFGenerateVideoFromGIF_videoWriterQueue = (uint64_t)v0;

}

@end
