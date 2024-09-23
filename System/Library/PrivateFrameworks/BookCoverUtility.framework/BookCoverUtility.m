id sub_22857BEAC()
{
  if (qword_2540D97C8 != -1)
    dispatch_once(&qword_2540D97C8, &unk_24F113DD8);
  return (id)qword_2540D97C0;
}

void sub_22857C0AC(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t AlignedBytesPerRow;
  float v33;
  void *v34;
  double v35;
  float v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __IOSurface *v41;
  __IOSurface *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  BCUPurgeableImage *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  BOOL v61;
  void *v62;
  NSObject *v63;
  CFTypeID v64;
  OSType PixelFormat;
  CGImage *v66;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t AllocSize;
  CGDataProvider *v70;
  CFTypeRef v71;
  const void *v72;
  CGColorSpace *DeviceRGB;
  void *v74;
  CGImage *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  void *context;
  const __CFString *name;
  const __CFString *key;
  size_t Height;
  void *v89;
  size_t Width;
  void *v91;
  uint64_t v92;
  id obj;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const __CFDictionary *properties;
  _QWORD v105[5];
  _QWORD v106[6];
  CATransform3D v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[7];
  _QWORD block[6];
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  uint64_t v128;
  CATransform3D buf;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[128];
  _BYTE v133[128];
  uint8_t v134[32];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  int v140;
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  v124 = 0;
  v125 = &v124;
  v126 = 0x2020000000;
  v127 = 1;
  v99 = *MEMORY[0x24BDD8FD0];
  v98 = *MEMORY[0x24BDD8EB0];
  v97 = *MEMORY[0x24BDD8E38];
  v96 = *MEMORY[0x24BDD8E18];
  v95 = *MEMORY[0x24BDD8E30];
  v94 = *MEMORY[0x24BDD8EF8];
  v92 = *MEMORY[0x24BDE5D60];
  name = (const __CFString *)*MEMORY[0x24BDBF228];
  key = (const __CFString *)*MEMORY[0x24BDD8E88];
  while (*((_BYTE *)v125 + 24))
  {
    context = (void *)MEMORY[0x22E2B2450]();
    v118 = 0;
    v119 = &v118;
    v120 = 0x3032000000;
    v121 = sub_22857FA80;
    v122 = sub_22857FA90;
    v123 = 0;
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(NSObject **)(v1 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22857FA98;
    block[3] = &unk_24F113D20;
    block[5] = &v118;
    block[4] = v1;
    dispatch_sync(v2, block);
    sub_22857BEAC();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend((id)v119[5], "count");
      LODWORD(buf.m11) = 134217984;
      *(_QWORD *)((char *)&buf.m11 + 4) = v4;
      _os_log_impl(&dword_22857A000, v3, OS_LOG_TYPE_DEFAULT, "sorting operations; count=%lu", (uint8_t *)&buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
    objc_msgSend((id)v119[5], "sortedArrayUsingSelector:", sel__compareHoldingStateLock_);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v119[5];
    v119[5] = v5;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
    if ((unint64_t)objc_msgSend((id)v119[5], "count") >= 9)
    {
      objc_msgSend((id)v119[5], "subarrayWithRange:", objc_msgSend((id)v119[5], "count") - 8, 8);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v119[5];
      v119[5] = v7;

    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 8);
    v116[0] = MEMORY[0x24BDAC760];
    v116[1] = 3221225472;
    v116[2] = sub_22857FB98;
    v116[3] = &unk_24F113D48;
    v116[5] = &v118;
    v116[4] = v9;
    v116[6] = &v124;
    dispatch_sync(v10, v116);
    if (objc_msgSend((id)v119[5], "count"))
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v11 = (id)v119[5];
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v113;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v113 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
            objc_msgSend(v15, "configureLayer");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v15, "setLayer:", v16);
              objc_msgSend(v15, "layer");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setNeedsDisplay");

            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
        }
        while (v12);
      }

      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = (id)v119[5];
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
      if (v18)
      {
        v100 = *(_QWORD *)v109;
        do
        {
          v101 = v18;
          for (j = 0; j != v101; ++j)
          {
            if (*(_QWORD *)v109 != v100)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
            objc_msgSend(v20, "layer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21)
            {
              objc_msgSend(v21, "bounds");
              v24 = v23;
              v26 = v25;
              objc_msgSend(v22, "rasterizationScale");
              v28 = v27;
              v29 = v24 * v27;
              if (v29 > 8192.0)
                v29 = 8192.0;
              v30 = fmax(v29, 1.0);
              if (v26 * v28 <= 8192.0)
                v31 = v26 * v28;
              else
                v31 = 8192.0;
              AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
              v33 = v30;
              *(_QWORD *)v134 = v99;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", llroundf(v33));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = fmax(v31, 1.0);
              v36 = v35;
              v37 = llroundf(v36);
              *(_QWORD *)&buf.m11 = v34;
              *(_QWORD *)&v134[8] = v98;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf.m12 = v38;
              *(_QWORD *)&v134[16] = v97;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", AlignedBytesPerRow);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf.m13 = v39;
              *(_QWORD *)&v134[24] = v96;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", AlignedBytesPerRow * v37);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf.m14 = v40;
              *(_QWORD *)&buf.m21 = &unk_24F116EA0;
              *(_QWORD *)&v135 = v95;
              *((_QWORD *)&v135 + 1) = v94;
              *(_QWORD *)&buf.m22 = &unk_24F116EB8;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v134, 6);
              properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              v41 = IOSurfaceCreate(properties);
              v42 = v41;
              if (v41)
              {
                IOSurfaceLock(v41, 0, 0);
                if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
                {
                  v43 = MTLCreateSystemDefaultDevice();
                  v44 = *(_QWORD *)(a1 + 32);
                  v45 = *(void **)(v44 + 48);
                  *(_QWORD *)(v44 + 48) = v43;

                  v46 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "newCommandQueue");
                  v47 = *(_QWORD *)(a1 + 32);
                  v48 = *(void **)(v47 + 56);
                  *(_QWORD *)(v47 + 56) = v46;

                }
                objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, (unint64_t)v30, (unint64_t)v35, 0);
                v49 = objc_claimAutoreleasedReturnValue();
                -[NSObject setUsage:](v49, "setUsage:", 5);
                v102 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "newTextureWithDescriptor:iosurface:plane:", v49, v42, 0);
                v50 = *(_QWORD *)(a1 + 32);
                v51 = *(void **)(v50 + 40);
                if (v51)
                {
                  objc_msgSend(v51, "setDestination:", v102);
                }
                else
                {
                  v53 = *(_QWORD *)(v50 + 56);
                  if (v53)
                  {
                    v130 = v92;
                    v131 = v53;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v54 = 0;
                  }
                  objc_msgSend(MEMORY[0x24BDE5740], "rendererWithMTLTexture:options:", v102, v54);
                  v55 = objc_claimAutoreleasedReturnValue();
                  v56 = *(_QWORD *)(a1 + 32);
                  v57 = *(void **)(v56 + 40);
                  *(_QWORD *)(v56 + 40) = v55;

                }
                memset(&buf, 0, sizeof(buf));
                CATransform3DMakeScale(&buf, v28, -v28, 1.0);
                objc_msgSend(MEMORY[0x24BDE57D8], "begin");
                objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
                objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
                objc_msgSend(MEMORY[0x24BDE56D0], "layer");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "setAnchorPoint:", 0.5, 0.5);
                v107 = buf;
                objc_msgSend(v58, "setTransform:", &v107);
                objc_msgSend(v58, "setFrame:", 0.0, 0.0, v30, v35);
                objc_msgSend(v58, "setGeometryFlipped:", 1);
                objc_msgSend(v58, "addSublayer:", v22);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setLayer:", v58);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setBounds:", 0.0, 0.0, v30, v35);
                objc_msgSend(MEMORY[0x24BDE57D8], "commit");
                objc_msgSend(MEMORY[0x24BDE57D8], "flush");
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "beginFrameAtTime:timeStamp:", 0, 0.0);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "render");
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "endFrame");
                if (objc_msgSend(v20, "waitForCPUSynchronization"))
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "commandBuffer");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "enqueue");
                  objc_msgSend(v59, "commit");
                  objc_msgSend(v59, "waitUntilCompleted");
                  v60 = objc_msgSend(v59, "status");
                  v61 = v60 == 5;
                  if (v60 == 5)
                  {
                    objc_msgSend(v59, "error");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    sub_22857BEAC();
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v20, "logKey");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "localizedDescription");
                      v78 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v134 = 138412802;
                      *(_QWORD *)&v134[4] = v91;
                      *(_WORD *)&v134[12] = 2082;
                      *(_QWORD *)&v134[14] = "-[BCULayerRenderer _processOperations]_block_invoke";
                      *(_WORD *)&v134[22] = 2112;
                      v89 = (void *)v78;
                      *(_QWORD *)&v134[24] = v78;
                      _os_log_error_impl(&dword_22857A000, v63, OS_LOG_TYPE_ERROR, "[%@] %{public}s error in the Metal Command Buffer: %@", v134, 0x20u);

                    }
                  }

                }
                else
                {
                  v61 = 0;
                }
                objc_msgSend(v20, "setLayer:", 0);
                if (v61)
                {
LABEL_48:
                  v52 = 0;
                }
                else
                {
                  v64 = CFGetTypeID(v42);
                  if (v64 != CGImageGetTypeID()
                    || (v52 = -[BCUPurgeableImage initWithImage:surface:contentsScale:]([BCUPurgeableImage alloc], "initWithImage:surface:contentsScale:", v42, 0, v28)) == 0)
                  {
                    PixelFormat = IOSurfaceGetPixelFormat(v42);
                    if (PixelFormat == 1999843442 || PixelFormat == 1647534392)
                    {
                      v66 = (CGImage *)CGImageCreateFromIOSurface();
                      v52 = -[BCUPurgeableImage initWithImage:surface:contentsScale:]([BCUPurgeableImage alloc], "initWithImage:surface:contentsScale:", v66, v42, v28);
                      CGImageRelease(v66);
                    }
                    else
                    {
                      CFRetain(v42);
                      IOSurfaceIncrementUseCount(v42);
                      BaseAddress = IOSurfaceGetBaseAddress(v42);
                      BytesPerRow = IOSurfaceGetBytesPerRow(v42);
                      Width = IOSurfaceGetWidth(v42);
                      Height = IOSurfaceGetHeight(v42);
                      AllocSize = IOSurfaceGetAllocSize(v42);
                      v70 = CGDataProviderCreateWithData(v42, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_228580120);
                      if (!v70)
                      {
                        IOSurfaceDecrementUseCount(v42);
                        CFRelease(v42);
                        goto LABEL_48;
                      }
                      v71 = IOSurfaceCopyValue(v42, key);
                      v72 = v71;
                      if (v71)
                      {
                        DeviceRGB = CGColorSpaceCreateWithPropertyList(v71);
                        CFRelease(v72);
                      }
                      else
                      {
                        v140 = 0;
                        v138 = 0u;
                        v139 = 0u;
                        v136 = 0u;
                        v137 = 0u;
                        v135 = 0u;
                        memset(v134, 0, sizeof(v134));
                        v128 = 116;
                        DeviceRGB = 0;
                        if (!IOSurfaceGetBulkAttachments() && v128 == 116 && BYTE11(v136) == 12)
                          DeviceRGB = CGColorSpaceCreateWithName(name);
                      }
                      if (!DeviceRGB)
                        DeviceRGB = CGColorSpaceCreateDeviceRGB();
                      v75 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v70, 0, 1, kCGRenderingIntentDefault);
                      CGImageSetProperty();
                      CGColorSpaceRelease(DeviceRGB);
                      CGDataProviderRelease(v70);
                      v52 = -[BCUPurgeableImage initWithImage:surface:contentsScale:]([BCUPurgeableImage alloc], "initWithImage:surface:contentsScale:", v75, v42, v28);
                      CGImageRelease(v75);
                    }
                  }
                }
                IOSurfaceUnlock(v42, 0, 0);
                CFRelease(v42);
                if (!v52)
                {
                  sub_22857BEAC();
                  v76 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v20, "logKey");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v134 = 138412546;
                    *(_QWORD *)&v134[4] = v77;
                    *(_WORD *)&v134[12] = 2082;
                    *(_QWORD *)&v134[14] = "-[BCULayerRenderer _processOperations]_block_invoke";
                    _os_log_error_impl(&dword_22857A000, v76, OS_LOG_TYPE_ERROR, "[%@] %{public}s failed to create image", v134, 0x16u);

                  }
                }

              }
              else
              {
                sub_22857BEAC();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v20, "logKey");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf.m11) = 138412802;
                  *(_QWORD *)((char *)&buf.m11 + 4) = v74;
                  WORD2(buf.m12) = 2082;
                  *(_QWORD *)((char *)&buf.m12 + 6) = "-[BCULayerRenderer _processOperations]_block_invoke";
                  HIWORD(buf.m13) = 2112;
                  *(_QWORD *)&buf.m14 = properties;
                  _os_log_error_impl(&dword_22857A000, v49, OS_LOG_TYPE_ERROR, "[%@] %{public}s failed to create IOSurface: %@", (uint8_t *)&buf, 0x20u);

                }
                v52 = 0;
              }

              objc_msgSend(v20, "setResult:", v52);
            }

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
        }
        while (v18);
      }

      os_unfair_lock_lock((os_unfair_lock_t)&unk_2540D97B8);
      v79 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 64);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_2540D97B8);
      if (v79)
      {
        v80 = *(_QWORD *)(a1 + 32);
        v81 = *(NSObject **)(v80 + 8);
        v106[0] = MEMORY[0x24BDAC760];
        v106[1] = 3221225472;
        v106[2] = sub_22857FD08;
        v106[3] = &unk_24F113D20;
        v106[4] = v80;
        v106[5] = &v118;
        dispatch_sync(v81, v106);
        *((_BYTE *)v125 + 24) = 0;
      }
      else
      {
        sub_22857BEAC();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          v83 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
          LODWORD(buf.m11) = 134217984;
          *(_QWORD *)((char *)&buf.m11 + 4) = v83;
          _os_log_impl(&dword_22857A000, v82, OS_LOG_TYPE_DEFAULT, "completed %lu operations", (uint8_t *)&buf, 0xCu);
        }

        v84 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        v105[0] = MEMORY[0x24BDAC760];
        v105[1] = 3221225472;
        v105[2] = sub_22857FE78;
        v105[3] = &unk_24F113D70;
        v105[4] = &v118;
        dispatch_async(v84, v105);
      }
    }
    _Block_object_dispose(&v118, 8);

    objc_autoreleasePoolPop(context);
  }
  _Block_object_dispose(&v124, 8);
}

void sub_22857CF34(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x2D8], 8);
  _Unwind_Resume(a1);
}

void sub_22857CFCC()
{
  _BCUCoverEffectsShadow *v0;
  const __CFURL *v1;
  const __CFURL *v2;
  CGDataProvider *v3;
  CGDataProvider *v4;
  CGImageRef v5;
  uint64_t v6;
  void *v7;
  _BCUCoverEffectsShadow *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  CGDataProvider *v11;
  CGDataProvider *v12;
  CGImageRef v13;
  uint64_t v14;
  void *v15;
  _BCUCoverEffectsShadow *v16;
  const __CFURL *v17;
  const __CFURL *v18;
  CGDataProvider *v19;
  CGDataProvider *v20;
  CGImageRef v21;
  uint64_t v22;
  void *v23;
  _BCUCoverEffectsShadow *v24;
  const __CFURL *v25;
  const __CFURL *v26;
  CGDataProvider *v27;
  CGDataProvider *v28;
  CGImageRef v29;
  uint64_t v30;
  void *v31;
  _BCUCoverEffectsShadow *v32;
  const __CFURL *v33;
  const __CFURL *v34;
  CGDataProvider *v35;
  CGDataProvider *v36;
  CGImageRef v37;
  uint64_t v38;
  void *v39;
  _BCUCoverEffectsShadow *v40;
  const __CFURL *v41;
  const __CFURL *v42;
  CGDataProvider *v43;
  CGDataProvider *v44;
  CGImageRef v45;
  uint64_t v46;
  void *v47;
  _BCUCoverEffectsShadow *v48;
  const __CFURL *v49;
  const __CFURL *v50;
  CGDataProvider *v51;
  CGDataProvider *v52;
  CGImageRef v53;
  uint64_t v54;
  void *v55;
  _BCUCoverEffectsShadow *v56;
  const __CFURL *v57;
  const __CFURL *v58;
  CGDataProvider *v59;
  CGDataProvider *v60;
  CGImageRef v61;
  uint64_t v62;
  void *v63;
  _BCUCoverEffectsShadow *v64;
  const __CFURL *v65;
  const __CFURL *v66;
  CGDataProvider *v67;
  CGDataProvider *v68;
  CGImageRef v69;
  uint64_t v70;
  void *v71;
  _BCUCoverEffectsAssets *v72;
  void *v73;
  _BCUCoverEffectsAssets *v74;
  void *v75;
  _BCUCoverEffectsAssets *v76;
  void *v77;
  _BCUCoverEffectsAssets *v78;
  void *v79;
  id v80;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v80 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_Flat-L_Shadow"), CFSTR("png"));
  v1 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && (v3 = CGDataProviderCreateWithURL(v1)) != 0)
  {
    v4 = v3;
    v5 = CGImageCreateWithPNGDataProvider(v3, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }

  v6 = -[_BCUCoverEffectsShadow initWithImage:insets:](v0, "initWithImage:insets:", v5, 44.0, 64.0, 108.0, 64.0);
  v7 = (void *)qword_2540D9818;
  qword_2540D9818 = v6;

  v8 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_RTL_Flat-L_Shadow"), CFSTR("png"));
  v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (v11 = CGDataProviderCreateWithURL(v9)) != 0)
  {
    v12 = v11;
    v13 = CGImageCreateWithPNGDataProvider(v11, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v12);
  }
  else
  {
    v13 = 0;
  }

  v14 = -[_BCUCoverEffectsShadow initWithImage:insets:](v8, "initWithImage:insets:", v13, 44.0, 64.0, 108.0, 64.0);
  v15 = (void *)qword_2540D9828;
  qword_2540D9828 = v14;

  v16 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_Flat-L_Shadow~Night"), CFSTR("png"));
  v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && (v19 = CGDataProviderCreateWithURL(v17)) != 0)
  {
    v20 = v19;
    v21 = CGImageCreateWithPNGDataProvider(v19, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v20);
  }
  else
  {
    v21 = 0;
  }

  v22 = -[_BCUCoverEffectsShadow initWithImage:insets:](v16, "initWithImage:insets:", v21, 44.0, 64.0, 108.0, 64.0);
  v23 = (void *)qword_2540D9820;
  qword_2540D9820 = v22;

  v24 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_RTL_Flat-L_Shadow~Night"), CFSTR("png"));
  v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25 && (v27 = CGDataProviderCreateWithURL(v25)) != 0)
  {
    v28 = v27;
    v29 = CGImageCreateWithPNGDataProvider(v27, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v28);
  }
  else
  {
    v29 = 0;
  }

  v30 = -[_BCUCoverEffectsShadow initWithImage:insets:](v24, "initWithImage:insets:", v29, 44.0, 64.0, 108.0, 64.0);
  v31 = (void *)qword_2540D9830;
  qword_2540D9830 = v30;

  v32 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_Flowcase_Shadow"), CFSTR("png"));
  v33 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33 && (v35 = CGDataProviderCreateWithURL(v33)) != 0)
  {
    v36 = v35;
    v37 = CGImageCreateWithPNGDataProvider(v35, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v36);
  }
  else
  {
    v37 = 0;
  }

  v38 = -[_BCUCoverEffectsShadow initWithImage:insets:blendMode:](v32, "initWithImage:insets:blendMode:", v37, *MEMORY[0x24BDE5B60], 266.0, 510.0, 266.0, 510.0);
  v39 = (void *)qword_2540D97F8;
  qword_2540D97F8 = v38;

  v40 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_Flat-L_SeriesShadow"), CFSTR("png"));
  v41 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41 && (v43 = CGDataProviderCreateWithURL(v41)) != 0)
  {
    v44 = v43;
    v45 = CGImageCreateWithPNGDataProvider(v43, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v44);
  }
  else
  {
    v45 = 0;
  }

  v46 = -[_BCUCoverEffectsShadow initWithImage:insets:](v40, "initWithImage:insets:", v45, 108.0, 128.0, 176.0, 128.0);
  v47 = (void *)qword_2540D9838;
  qword_2540D9838 = v46;

  v48 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_RTL_Flat-L_SeriesShadow"), CFSTR("png"));
  v49 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49 && (v51 = CGDataProviderCreateWithURL(v49)) != 0)
  {
    v52 = v51;
    v53 = CGImageCreateWithPNGDataProvider(v51, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v52);
  }
  else
  {
    v53 = 0;
  }

  v54 = -[_BCUCoverEffectsShadow initWithImage:insets:](v48, "initWithImage:insets:", v53, 108.0, 128.0, 176.0, 128.0);
  v55 = (void *)qword_2540D9848;
  qword_2540D9848 = v54;

  v56 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_Flat-L_SeriesShadow~Night"), CFSTR("png"));
  v57 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57 && (v59 = CGDataProviderCreateWithURL(v57)) != 0)
  {
    v60 = v59;
    v61 = CGImageCreateWithPNGDataProvider(v59, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v60);
  }
  else
  {
    v61 = 0;
  }

  v62 = -[_BCUCoverEffectsShadow initWithImage:insets:](v56, "initWithImage:insets:", v61, 108.0, 128.0, 176.0, 128.0);
  v63 = (void *)qword_2540D9840;
  qword_2540D9840 = v62;

  v64 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend(v80, "URLForResource:withExtension:", CFSTR("iBooks_Covers_RTL_Flat-L_SeriesShadow~Night"), CFSTR("png"));
  v65 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65 && (v67 = CGDataProviderCreateWithURL(v65)) != 0)
  {
    v68 = v67;
    v69 = CGImageCreateWithPNGDataProvider(v67, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v68);
  }
  else
  {
    v69 = 0;
  }

  v70 = -[_BCUCoverEffectsShadow initWithImage:insets:](v64, "initWithImage:insets:", v69, 108.0, 128.0, 176.0, 128.0);
  v71 = (void *)qword_2540D9850;
  qword_2540D9850 = v70;

  v72 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v80, 0, 0);
  v73 = (void *)qword_2540D97D8;
  qword_2540D97D8 = (uint64_t)v72;

  v74 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v80, 0, 1);
  v75 = (void *)qword_2540D97E0;
  qword_2540D97E0 = (uint64_t)v74;

  v76 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v80, 1, 0);
  v77 = (void *)qword_2540D97E8;
  qword_2540D97E8 = (uint64_t)v76;

  v78 = -[_BCUCoverEffectsAssets initWithBundle:rtl:night:]([_BCUCoverEffectsAssets alloc], "initWithBundle:rtl:night:", v80, 1, 1);
  v79 = (void *)qword_2540D97F0;
  qword_2540D97F0 = (uint64_t)v78;

}

CGColorSpaceRef sub_22857F074()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF248]);
  qword_2540D9808 = (uint64_t)result;
  return result;
}

void sub_22857F09C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BookCoverUtility", "BCULayerRenderer");
  v1 = (void *)qword_2540D97C0;
  qword_2540D97C0 = (uint64_t)v0;

}

void sub_22857F96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22857F984(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 == 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  sub_22857BEAC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "logKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v4;
    v7 = 2048;
    v8 = v2 + 1;
    _os_log_impl(&dword_22857A000, v3, OS_LOG_TYPE_DEFAULT, "added operation %{public}@; count=%lu",
      (uint8_t *)&v5,
      0x16u);

  }
}

uint64_t sub_22857FA80(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22857FA90(uint64_t a1)
{

}

uint64_t sub_22857FA98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  if (!result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    if (result)
    {
      sub_22857BEAC();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
        v8 = 134217984;
        v9 = v7;
        _os_log_impl(&dword_22857A000, v6, OS_LOG_TYPE_DEFAULT, "no operations to sort; count=%lu",
          (uint8_t *)&v8,
          0xCu);
      }

      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
    }
  }
  return result;
}

void sub_22857FB98(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
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
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1[4] + 32), "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++), (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

  v7 = objc_msgSend(*(id *)(a1[4] + 32), "count");
  sub_22857BEAC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v7;
    _os_log_impl(&dword_22857A000, v8, OS_LOG_TYPE_DEFAULT, "removed operations for processing; count=%lu", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v7 != 0;
}

void sub_22857FD08(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "setResult:", 0, (_QWORD)v10);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v4);
  }

  sub_22857BEAC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    *(_DWORD *)buf = 134217984;
    v15 = v9;
    _os_log_impl(&dword_22857A000, v8, OS_LOG_TYPE_DEFAULT, "added operations for retrying; count=%lu", buf, 0xCu);
  }

}

void sub_22857FE78(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "result", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setResult:", 0);
        objc_msgSend(v6, "completeWithImage:", v7);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void sub_228580120(__IOSurface *a1)
{
  IOSurfaceDecrementUseCount(a1);
  CFRelease(a1);
}

id BookCoverUtilityLog()
{
  if (qword_25598A9B8 != -1)
    dispatch_once(&qword_25598A9B8, &unk_24F113DF8);
  return (id)qword_25598A9B0;
}

void sub_228580184()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iBooks", "BookCoverUtility");
  v1 = (void *)qword_25598A9B0;
  qword_25598A9B0 = (uint64_t)v0;

}

CGImageRef sub_2285802E0(uint64_t a1, void *a2)
{
  const __CFURL *v2;
  const __CFURL *v3;
  CGDataProvider *v4;
  CGDataProvider *v5;
  CGImageRef v6;

  objc_msgSend(a2, "URLForResource:withExtension:", a1, CFSTR("png"));
  v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = CGDataProviderCreateWithURL(v2)) != 0)
  {
    v5 = v4;
    v6 = CGImageCreateWithPNGDataProvider(v4, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

double sub_228580F84(CGImage *a1, double a2, double a3, double a4)
{
  double Width;
  double Height;
  double v10;
  double v12;

  Width = (double)CGImageGetWidth(a1);
  Height = (double)CGImageGetHeight(a1);
  v10 = 0.0;
  if (*MEMORY[0x24BDBF148] != Width || *(double *)(MEMORY[0x24BDBF148] + 8) != Height)
    v10 = fmin(a2 / Width, a3 / Height);
  if (a4 == 0.0)
    v12 = 1.0;
  else
    v12 = a4;
  return 1.0 / v12 * round(v12 * (v10 * Width));
}

uint64_t sub_228581028(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__layerWithImage_size_scale_shadow_);
}

void sub_228581040(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v10)
  {
    objc_msgSend(v10, "roundedInsetsWithSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    v6.n128_u64[0] = 0;
    v7.n128_u64[0] = 0;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
  }
  (*(void (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 40) + 16))(v6, v7, v8, v9);
  CGImageRelease(*(CGImageRef *)(a1 + 64));

}

CGColorRef sub_228581610()
{
  CGColorRef result;
  __int128 v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1 = xmmword_228585160;
  if (qword_2540D9800 != -1)
    dispatch_once(&qword_2540D9800, &unk_24F114040);
  qword_25598A9C0 = (uint64_t)CGColorCreate((CGColorSpaceRef)qword_2540D9808, (const CGFloat *)&v1);
  v1 = xmmword_228585170;
  if (qword_2540D9800 != -1)
    dispatch_once(&qword_2540D9800, &unk_24F114040);
  result = CGColorCreate((CGColorSpaceRef)qword_2540D9808, (const CGFloat *)&v1);
  qword_25598A9C8 = (uint64_t)result;
  return result;
}

uint64_t sub_2285818DC(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__layerWithImage_size_scale_minificationFilter_);
}

void sub_2285818F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  _BYTE *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v10 = *(_BYTE **)(a1 + 32);
  if (v10[17])
  {
    objc_msgSend(v10, "_roundedInsetsWithSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    v6.n128_u64[0] = 0;
    v7.n128_u64[0] = 0;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
  }
  (*(void (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 40) + 16))(v6, v7, v8, v9);
  CGImageRelease(*(CGImageRef *)(a1 + 64));

}

void sub_228581BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_228581BD8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__stackLayerWithImages_filters_size_contentsScale_insets_path_);
}

void sub_228581C04(_QWORD *a1)
{
  (*(void (**)(double, double, double, double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[5] + 8) + 32), *(double *)(*(_QWORD *)(a1[5] + 8) + 40), *(double *)(*(_QWORD *)(a1[5] + 8) + 48), *(double *)(*(_QWORD *)(a1[5] + 8) + 56));
  CGPathRelease(*(CGPathRef *)(*(_QWORD *)(a1[6] + 8) + 24));
}

CGColorRef sub_2285823C8()
{
  CGColorRef result;
  __int128 v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1 = xmmword_228585180;
  if (qword_2540D9800 != -1)
    dispatch_once(&qword_2540D9800, &unk_24F114040);
  result = CGColorCreate((CGColorSpaceRef)qword_2540D9808, (const CGFloat *)&v1);
  qword_25598A9D8 = (uint64_t)result;
  return result;
}

double sub_228582458(void *a1)
{
  id v1;
  double v2;
  double x;
  double v4;
  CGFloat y;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "bounds");
  x = v2;
  y = v4;
  width = v6;
  height = v8;
  if ((objc_msgSend(v1, "masksToBounds") & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v1, "sublayers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          sub_228582458(v15);
          objc_msgSend(v15, "convertRect:toLayer:", v1);
          v29.origin.x = v16;
          v29.origin.y = v17;
          v29.size.width = v18;
          v29.size.height = v19;
          v27.origin.x = x;
          v27.origin.y = y;
          v27.size.width = width;
          v27.size.height = height;
          v28 = CGRectUnion(v27, v29);
          x = v28.origin.x;
          y = v28.origin.y;
          width = v28.size.width;
          height = v28.size.height;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

  }
  return x;
}

double sub_228583110()
{
  double result;

  result = 0.0;
  xmmword_25598AA28 = 0u;
  unk_25598AA38 = 0u;
  xmmword_25598AA08 = 0u;
  unk_25598AA18 = 0u;
  xmmword_25598A9E8 = 0u;
  unk_25598A9F8 = 0u;
  qword_25598AA48 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierBookBinding");
  unk_25598AA50 = CFSTR("BCUCoverEffectsIdentifierBookBindingNight");
  qword_25598AA58 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierBookBindingWithShadow");
  unk_25598AA60 = CFSTR("BCUCoverEffectsIdentifierBookBindingNightWithShadow");
  qword_25598AA68 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierBookBindingShadowOnly");
  unk_25598AA70 = CFSTR("BCUCoverEffectsIdentifierBookBindingNightShadowOnly");
  qword_25598AA78 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierBookBindingRTL");
  unk_25598AA80 = CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNight");
  qword_25598AA88 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierBookBindingRTLWithShadow");
  unk_25598AA90 = CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNightWithShadow");
  qword_25598AA98 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierBookBindingRTLShadowOnly");
  unk_25598AAA0 = CFSTR("BCUCoverEffectsIdentifierBookBindingRTLNightShadowOnly");
  qword_25598AAA8 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierAudiobook");
  unk_25598AAB0 = CFSTR("BCUCoverEffectsIdentifierAudiobookNight");
  qword_25598AAB8 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierAudiobookWithShadow");
  unk_25598AAC0 = CFSTR("BCUCoverEffectsIdentifierAudiobookNightWithShadow");
  qword_25598AAC8 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierAudiobookShadowOnly");
  unk_25598AAD0 = CFSTR("BCUCoverEffectsIdentifierAudiobookNightShadowOnly");
  qword_25598AAD8 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierAudiobook");
  unk_25598AAE0 = CFSTR("BCUCoverEffectsIdentifierAudiobookNight");
  qword_25598AAE8 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierAudiobookWithShadow");
  unk_25598AAF0 = CFSTR("BCUCoverEffectsIdentifierAudiobookNightWithShadow");
  qword_25598AAF8 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierAudiobookShadowOnly");
  unk_25598AB00 = CFSTR("BCUCoverEffectsIdentifierAudiobookNightShadowOnly");
  qword_25598AB08 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierPDF");
  unk_25598AB10 = CFSTR("BCUCoverEffectsIdentifierPDFNight");
  qword_25598AB18 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierPDFWithShadow");
  unk_25598AB20 = CFSTR("BCUCoverEffectsIdentifierPDFNightWithShadow");
  qword_25598AB28 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierPDFShadowOnly");
  unk_25598AB30 = CFSTR("BCUCoverEffectsIdentifierPDFNightShadowOnly");
  qword_25598AB38 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierPDF");
  unk_25598AB40 = CFSTR("BCUCoverEffectsIdentifierPDFNight");
  qword_25598AB48 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierPDFWithShadow");
  unk_25598AB50 = CFSTR("BCUCoverEffectsIdentifierPDFNightWithShadow");
  qword_25598AB58 = (uint64_t)CFSTR("BCUCoverEffectsIdentifierPDFShadowOnly");
  unk_25598AB60 = CFSTR("BCUCoverEffectsIdentifierPDFNightShadowOnly");
  return result;
}

void sub_22858401C(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  os_unfair_lock_s *v24;
  id v25;

  v13 = a2;
  v14 = *(os_unfair_lock_s **)(a1 + 32);
  v15 = v14 + 2;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_228584118;
  v23 = &unk_24F114088;
  v24 = v14;
  v25 = v13;
  v16 = v13;
  v17 = a3;
  os_unfair_lock_lock_with_options();
  sub_228584118((uint64_t)&v20);
  os_unfair_lock_unlock(v15);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = objc_msgSend(v17, "CGImage", v20, v21);

  (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v18 + 16))(v18, v19, a4, a5, a6, a7);
}

void sub_228584118(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "filterOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void sub_228584158(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "filterOperations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void sub_2285843EC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22857A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Must provide shadow if shadowOnly=YES", v0, 2u);
}

void sub_228584430(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_22857A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Single cover mode doesn't support %@", (uint8_t *)&v1, 0xCu);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBC0](plist);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x24BDD9030]();
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE618](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x24BDBE6D8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x24BDBE780]();
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x24BDBEDB0](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8B68](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x24BDD8BB0]();
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8CF0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x24BDD8DB0](buffer, *(_QWORD *)&newState, oldState);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

