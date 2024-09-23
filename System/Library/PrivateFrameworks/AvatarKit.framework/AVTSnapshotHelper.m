@implementation AVTSnapshotHelper

- (uint64_t)newCGImageWithRenderer:(uint64_t)a3 antialiasingMode:(uint64_t)a4 pixelWidth:(uint64_t)a5 pixelHeight:(_QWORD *)a6 error:
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  __n128 v17;
  float v18;
  float32x4_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *Data;
  size_t BytesPerRow;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t result;
  objc_class *v66;
  void *v67;
  objc_class *v68;
  void *v69;
  int v70;
  void *v71;
  objc_class *v72;
  void *v73;
  int v74;
  void *v75;
  NSObject *v76;
  objc_class *v77;
  void *v78;
  int v79;
  void *v80;
  objc_class *v81;
  void *v82;
  int v83;
  objc_class *v84;
  void *v85;
  int v86;
  void *v87;
  float64x2_t v88;
  _QWORD *v89;
  _BYTE v90[24];
  void *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  uint8_t buf[48];
  __int128 v99;
  __int128 v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = v11;
  if (!Image)
    goto LABEL_54;
  if (!a4 || !a5)
  {
    avt_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v66 = (objc_class *)objc_opt_class();
      NSStringFromClass(v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a5;
      _os_log_error_impl(&dword_1DD1FA000, v16, OS_LOG_TYPE_ERROR, "Error: %@ Can't create a snapshot of size %d×%d", buf, 0x18u);

    }
    Image = 0;
    goto LABEL_53;
  }
  objc_msgSend(v11, "device");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)Image + 1);
  *((_QWORD *)Image + 1) = v13;

  if (!*((_QWORD *)Image + 1))
  {
    avt_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:].cold.2(v15);

  }
  *((_QWORD *)Image + 9) = a4;
  *((_QWORD *)Image + 10) = a5;
  *((_QWORD *)Image + 11) = a3;
  objc_msgSend(v12, "backgroundColor");
  v16 = objc_claimAutoreleasedReturnValue();
  if (*((NSObject **)Image + 12) != v16)
  {
    objc_storeStrong((id *)Image + 12, v16);
    v17 = AVTColor4WithCGColor((CGColor *)objc_msgSend(*((id *)Image + 12), "CGColor"));
    v18 = v17.n128_f32[3];
    v19 = vmulq_laneq_f32((float32x4_t)v17, (float32x4_t)v17, 3);
    v20 = v19.f32[2];
    v21 = v18;
    v88 = vcvtq_f64_f32(*(float32x2_t *)v19.f32);
    *(float64x2_t *)((char *)Image + 104) = v88;
    *((double *)Image + 15) = v19.f32[2];
    *((double *)Image + 16) = v18;
    objc_msgSend(*((id *)Image + 3), "colorAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClearColor:", *(_OWORD *)&v88, v20, v21);

  }
  v24 = (id *)((char *)Image + 16);
  objc_msgSend(*((id *)Image + 2), "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)*((_QWORD *)Image + 1);

  if (v25 != v26)
  {
    v27 = (void *)*((_QWORD *)Image + 3);
    *((_QWORD *)Image + 3) = 0;

    v28 = objc_msgSend(*((id *)Image + 1), "newCommandQueue");
    v29 = (void *)*((_QWORD *)Image + 2);
    *((_QWORD *)Image + 2) = v28;

    objc_msgSend(*((id *)Image + 2), "setBackgroundGPUPriority:", 2);
    v30 = AVTMTLDeviceSupportsReadWritePixelFormat(*((_QWORD *)Image + 1), 70);
    v31 = CFSTR("avt_convert_linear_premultiplied_to_gamma_premultiplied_copy");
    *((_BYTE *)Image + 32) = v30;
    if (v30)
      v31 = CFSTR("avt_convert_linear_premultiplied_to_gamma_premultiplied_in_place");
    v32 = (void *)*((_QWORD *)Image + 1);
    v33 = v31;
    +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMetalHelper computePipelineStateWithFunctionName:](v34, v33);
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)*((_QWORD *)Image + 8);
    *((_QWORD *)Image + 8) = v35;

  }
  -[CGImage _rebuildRenderPassDescriptorIfNeeded](Image, "_rebuildRenderPassDescriptorIfNeeded");
  -[CGImage _rebuildBitmapContextIfNeeded](Image, "_rebuildBitmapContextIfNeeded");
  if (os_variant_has_internal_diagnostics())
  {
    v37 = objc_alloc_init(MEMORY[0x1E0CC6A50]);
    objc_msgSend(v37, "setErrorOptions:", 1);
    objc_msgSend(*v24, "commandBufferWithDescriptor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      goto LABEL_16;
LABEL_24:
    avt_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:].cold.1((uint64_t *)Image + 2, v39);
    Image = 0;
    goto LABEL_52;
  }
  objc_msgSend(*v24, "commandBuffer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
    goto LABEL_24;
LABEL_16:
  v89 = a6;
  objc_msgSend(v12, "renderWithViewport:commandBuffer:passDescriptor:", v38, *((_QWORD *)Image + 3), 0.0, 0.0, (double)*((unint64_t *)Image + 9), (double)*((unint64_t *)Image + 10));
  v39 = *((id *)Image + 5);
  v40 = objc_msgSend(*((id *)Image + 8), "threadExecutionWidth");
  v41 = objc_msgSend(*((id *)Image + 8), "maxTotalThreadsPerThreadgroup");
  objc_msgSend(v38, "computeCommandEncoder");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setComputePipelineState:", *((_QWORD *)Image + 8));
  objc_msgSend(v42, "setTexture:atIndex:", *((_QWORD *)Image + 6), 0);
  if (!*((_BYTE *)Image + 32))
  {
    v43 = *((id *)Image + 7);

    objc_msgSend(v42, "setTexture:atIndex:", *((_QWORD *)Image + 7), 1);
    v39 = v43;
  }
  objc_msgSend(v42, "device");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = AVTMTLDeviceSupportsNonUniformThreadgroupSize(v44, v45);

  if (v46)
  {
    v47 = objc_msgSend(*((id *)Image + 5), "width");
    v48 = objc_msgSend(*((id *)Image + 5), "height");
    *(_QWORD *)buf = v47;
    *(_QWORD *)&buf[8] = v48;
    *(_QWORD *)&buf[16] = 1;
    *(_QWORD *)v90 = v40;
    *(_QWORD *)&v90[8] = v41 / v40;
    *(_QWORD *)&v90[16] = 1;
    objc_msgSend(v42, "dispatchThreads:threadsPerThreadgroup:", buf, v90);
  }
  else
  {
    v49 = objc_msgSend(*((id *)Image + 5), "width");
    if (v40 >= v49)
      v50 = v49;
    else
      v50 = v40;
    v51 = objc_msgSend(*((id *)Image + 5), "height");
    if (v40 >= v51)
      v52 = v51;
    else
      v52 = v40;
    do
    {
      v53 = v52;
      v54 = v52 * v50;
      v52 >>= 1;
    }
    while (v54 > v41);
    v55 = (v50 + objc_msgSend(*((id *)Image + 5), "width") - 1) / v50;
    v56 = objc_msgSend(*((id *)Image + 5), "height");
    *(_QWORD *)buf = v55;
    *(_QWORD *)&buf[8] = (v53 + v56 - 1) / v53;
    *(_QWORD *)&buf[16] = 1;
    *(_QWORD *)v90 = v50;
    *(_QWORD *)&v90[8] = v53;
    *(_QWORD *)&v90[16] = 1;
    objc_msgSend(v42, "dispatchThreadgroups:threadsPerThreadgroup:", buf, v90);
  }
  objc_msgSend(v42, "endEncoding");
  objc_msgSend(v38, "commit");
  objc_msgSend(v38, "waitUntilCompleted");
  if (objc_msgSend(v38, "status") == 4)
  {
    Data = CGBitmapContextGetData(*((CGContextRef *)Image + 17));
    BytesPerRow = CGBitmapContextGetBytesPerRow(*((CGContextRef *)Image + 17));
    memset(buf, 0, 24);
    *(_OWORD *)&buf[24] = *(_OWORD *)((char *)Image + 72);
    *(_QWORD *)&buf[40] = 1;
    -[NSObject getBytes:bytesPerRow:fromRegion:mipmapLevel:](v39, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", Data, BytesPerRow, buf, 0);
    Image = CGBitmapContextCreateImage(*((CGContextRef *)Image + 17));
LABEL_51:

LABEL_52:
LABEL_53:

LABEL_54:
    return (uint64_t)Image;
  }
  objc_msgSend(v38, "error");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v89 && v59)
    *v89 = objc_retainAutorelease(v59);
  if (AVTIsRunningInAppExtensionOrViewService())
  {
    avt_default_log();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v38, "status");
      objc_msgSend(v38, "logs");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v78;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v79;
      *(_WORD *)&buf[38] = 2112;
      *(_QWORD *)&buf[40] = v60;
      LOWORD(v99) = 2112;
      *(_QWORD *)((char *)&v99 + 2) = v80;
      _os_log_fault_impl(&dword_1DD1FA000, v76, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);

    }
    v100 = 0u;
    v99 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v81 = (objc_class *)objc_opt_class();
    NSStringFromClass(v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v38, "status");
    objc_msgSend(v38, "logs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v90 = 136316418;
    *(_QWORD *)&v90[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
    *(_WORD *)&v90[12] = 2112;
    *(_QWORD *)&v90[14] = v82;
    *(_WORD *)&v90[22] = 2048;
    v91 = v12;
    v92 = 1024;
    v93 = v83;
    v94 = 2112;
    v95 = v60;
    v96 = 2112;
    v97 = v38;
    v12 = (void *)_os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  else
  {
    if (v60)
    {
      objc_msgSend(v60, "domain");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)*MEMORY[0x1E0CC6960];

      if (v61 == v62 && objc_msgSend(v60, "code") == 7)
      {
        avt_default_log();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v72 = (objc_class *)objc_opt_class();
          NSStringFromClass(v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v38, "status");
          objc_msgSend(v38, "logs");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v73;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v12;
          *(_WORD *)&buf[32] = 1024;
          *(_DWORD *)&buf[34] = v74;
          *(_WORD *)&buf[38] = 2112;
          *(_QWORD *)&buf[40] = v60;
          LOWORD(v99) = 2112;
          *(_QWORD *)((char *)&v99 + 2) = v75;
          _os_log_error_impl(&dword_1DD1FA000, v63, OS_LOG_TYPE_ERROR, "Error: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);

        }
LABEL_50:

        Image = 0;
        goto LABEL_51;
      }
    }
    avt_default_log();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v38, "status");
      objc_msgSend(v38, "logs");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v70;
      *(_WORD *)&buf[38] = 2112;
      *(_QWORD *)&buf[40] = v60;
      LOWORD(v99) = 2112;
      *(_QWORD *)((char *)&v99 + 2) = v71;
      _os_log_fault_impl(&dword_1DD1FA000, v64, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);

    }
    if (!AVTLogAllowsInternalCrash())
      goto LABEL_50;
  }
  v100 = 0u;
  v99 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  v84 = (objc_class *)objc_opt_class();
  NSStringFromClass(v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v38, "status");
  objc_msgSend(v38, "logs");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v90 = 136316418;
  *(_QWORD *)&v90[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
  *(_WORD *)&v90[12] = 2112;
  *(_QWORD *)&v90[14] = v85;
  *(_WORD *)&v90[22] = 2048;
  v91 = v12;
  v92 = 1024;
  v93 = v86;
  v94 = 2112;
  v95 = v60;
  v96 = 2112;
  v97 = v87;
  _os_log_send_and_compose_impl();

  result = _os_crash_msg();
  __break(1u);
  return result;
}

- (uint64_t)newImageWithRenderer:(uint64_t)a3 antialiasingMode:(uint64_t)a4 pixelWidth:(uint64_t)a5 pixelHeight:(_QWORD *)a6 imagePointSize:(double)a7 contentScaleFactor:(double)a8 error:(float)a9
{
  id v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;

  v15 = a2;
  if (a1
    && (v16 = -[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:](a1, v15, a3, a4, a5, a6)) != 0)
  {
    v17 = (const void *)v16;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v16, 0, a9);
    v18 = objc_claimAutoreleasedReturnValue();
    CFRelease(v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_isRenderPassDescriptorValid
{
  MTLRenderPassDescriptor *renderPassDescriptor;
  void *v4;
  void *v5;
  void *v6;
  MTLDevice *v7;
  MTLDevice *device;
  unint64_t antialiasingMode;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  renderPassDescriptor = self->_renderPassDescriptor;
  if (!renderPassDescriptor)
    return 0;
  -[MTLRenderPassDescriptor colorAttachments](renderPassDescriptor, "colorAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "texture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "device");
  v7 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;

  if (v7 == device
    && objc_msgSend(v6, "width") == self->_pixelWidth
    && objc_msgSend(v6, "height") == self->_pixelHeight)
  {
    antialiasingMode = self->_antialiasingMode;
    v10 = antialiasingMode - 1;
    v11 = 1;
    if (antialiasingMode == 1)
      v11 = 2;
    if (antialiasingMode == 2)
      v12 = 4;
    else
      v12 = v11;
    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resolveTexture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 > 1)
    {
      if (!v15)
      {
LABEL_13:
        v16 = 1;
LABEL_20:

        goto LABEL_15;
      }
    }
    else if (v15 && objc_msgSend(v6, "sampleCount") == v12)
    {
      goto LABEL_13;
    }
    v16 = 0;
    goto LABEL_20;
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (void)_rebuildRenderPassDescriptorIfNeeded
{
  _BOOL4 supportsReadWriteTexture;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  MTLTexture *v7;
  MTLTexture *convertPremultipliedAlphaTextureView;
  MTLTexture *convertPremultipliedAlphaExtraTexture;
  MTLTexture *v10;
  MTLTexture *v11;
  int v12;
  unint64_t antialiasingMode;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MTLRenderPassDescriptor *v24;
  MTLRenderPassDescriptor *renderPassDescriptor;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double red;
  double green;
  double blue;
  double alpha;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  if (!-[AVTSnapshotHelper _isRenderPassDescriptorValid](self, "_isRenderPassDescriptorValid"))
  {
    objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71, self->_pixelWidth, self->_pixelHeight, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setStorageMode:", 0);
    objc_msgSend(v44, "setUsage:", 4);
    supportsReadWriteTexture = self->_supportsReadWriteTexture;
    v4 = objc_msgSend(v44, "usage");
    v5 = 3;
    if (!supportsReadWriteTexture)
      v5 = 1;
    objc_msgSend(v44, "setUsage:", v4 | v5);
    v6 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v44);
    objc_storeStrong((id *)&self->_convertPremultipliedAlphaTexture, v6);
    v7 = (MTLTexture *)objc_msgSend(v6, "newTextureViewWithPixelFormat:", 70);
    convertPremultipliedAlphaTextureView = self->_convertPremultipliedAlphaTextureView;
    self->_convertPremultipliedAlphaTextureView = v7;

    if (self->_supportsReadWriteTexture)
    {
      convertPremultipliedAlphaExtraTexture = self->_convertPremultipliedAlphaExtraTexture;
      self->_convertPremultipliedAlphaExtraTexture = 0;
    }
    else
    {
      convertPremultipliedAlphaExtraTexture = (MTLTexture *)objc_msgSend(v44, "copy");
      -[MTLTexture setPixelFormat:](convertPremultipliedAlphaExtraTexture, "setPixelFormat:", 70);
      -[MTLTexture usage](convertPremultipliedAlphaExtraTexture, "usage");
      -[MTLTexture setUsage:](convertPremultipliedAlphaExtraTexture, "setUsage:", 0);
      -[MTLTexture setUsage:](convertPremultipliedAlphaExtraTexture, "setUsage:", -[MTLTexture usage](convertPremultipliedAlphaExtraTexture, "usage") | 2);
      v10 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", convertPremultipliedAlphaExtraTexture);
      v11 = self->_convertPremultipliedAlphaExtraTexture;
      self->_convertPremultipliedAlphaExtraTexture = v10;

    }
    v12 = AVTMTLDeviceSupportsMemorylessStorage(self->_device);
    antialiasingMode = self->_antialiasingMode;
    v14 = 1;
    if (antialiasingMode == 1)
      v15 = 2;
    else
      v15 = 1;
    if (antialiasingMode == 2)
      v16 = 4;
    else
      v16 = v15;
    v17 = 2;
    if (v12)
      v18 = 3;
    else
      v18 = 2;
    if (antialiasingMode - 1 > 1)
    {
      v20 = 0;
      v21 = 0;
      v19 = (uint64_t)v6;
    }
    else
    {
      objc_msgSend(v44, "setStorageMode:", v18);
      v17 = 4;
      objc_msgSend(v44, "setUsage:", 4);
      objc_msgSend(v44, "setTextureType:", 4);
      objc_msgSend(v44, "setSampleCount:", v16);
      v19 = -[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v44);
      v14 = 2;
      v20 = v6;
      v21 = (void *)v19;
    }
    objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, self->_pixelWidth, self->_pixelHeight, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStorageMode:", v18);
    objc_msgSend(v22, "setUsage:", 4);
    objc_msgSend(v22, "setTextureType:", v17);
    objc_msgSend(v22, "setSampleCount:", v16);
    v23 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v22);
    objc_msgSend(MEMORY[0x1E0CC6B58], "renderPassDescriptor");
    v24 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    renderPassDescriptor = self->_renderPassDescriptor;
    self->_renderPassDescriptor = v24;

    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTexture:", v19);

    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setResolveTexture:", v20);

    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLoadAction:", 2);

    red = self->_backgroundColorForMetal.red;
    green = self->_backgroundColorForMetal.green;
    blue = self->_backgroundColorForMetal.blue;
    alpha = self->_backgroundColorForMetal.alpha;
    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setClearColor:", red, green, blue, alpha);

    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setStoreAction:", v14);

    -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDescriptor, "depthAttachment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTexture:", v23);

    -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDescriptor, "depthAttachment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setClearDepth:", 1.0);

    -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDescriptor, "depthAttachment");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setLoadAction:", 2);

    -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDescriptor, "depthAttachment");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setStoreAction:", 0);

  }
}

- (void)_rebuildBitmapContextIfNeeded
{
  CGContext *bitmapContext;
  size_t Width;
  unint64_t pixelWidth;
  size_t Height;
  void *Data;
  size_t v8;
  void *v9;
  CGColorSpace *v10;

  bitmapContext = self->_bitmapContext;
  if (!bitmapContext)
    goto LABEL_7;
  Width = CGBitmapContextGetWidth(bitmapContext);
  pixelWidth = self->_pixelWidth;
  Height = CGBitmapContextGetHeight(self->_bitmapContext);
  if (Width != pixelWidth || Height != self->_pixelHeight)
  {
    Data = CGBitmapContextGetData(self->_bitmapContext);
    free(Data);
    CFRelease(self->_bitmapContext);
    self->_bitmapContext = 0;
    goto LABEL_7;
  }
  if (!self->_bitmapContext)
  {
LABEL_7:
    v8 = (4 * LODWORD(self->_pixelWidth));
    v9 = malloc_type_malloc(v8 * self->_pixelHeight, 0x2158E833uLL);
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    self->_bitmapContext = CGBitmapContextCreate(v9, self->_pixelWidth, self->_pixelHeight, 8uLL, v8, v10, 0x4001u);
    CFRelease(v10);
  }
}

- (void)dealloc
{
  CGContext *bitmapContext;
  void *Data;
  objc_super v5;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    Data = CGBitmapContextGetData(bitmapContext);
    free(Data);
    CFRelease(self->_bitmapContext);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVTSnapshotHelper;
  -[AVTSnapshotHelper dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaPipelineState, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaExtraTexture, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaTextureView, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaTexture, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)newCGImageWithRenderer:(uint64_t *)a1 antialiasingMode:(NSObject *)a2 pixelWidth:pixelHeight:error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
  v5 = 2048;
  v6 = v2;
  _os_log_error_impl(&dword_1DD1FA000, a2, OS_LOG_TYPE_ERROR, "Error: %s Failed to create a command buffer from command queue %p", (uint8_t *)&v3, 0x16u);
}

- (void)newCGImageWithRenderer:(os_log_t)log antialiasingMode:pixelWidth:pixelHeight:error:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_device";
}

@end
