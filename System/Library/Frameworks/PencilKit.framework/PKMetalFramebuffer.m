@implementation PKMetalFramebuffer

- (PKMetalFramebuffer)init
{
  objc_exception_throw(CFSTR("Not available"));
}

- (id)initWithSize:(void *)a3 pixelFormat:(char)a4 device:(char)a5 memoryless:(void *)a6 backedByIOSurface:(int)a7 sampleCount:(double)a8 purgeable:(double)a9
{
  id v18;
  id *v19;
  BOOL v20;
  int v21;
  BOOL v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFDictionary *v43;
  IOSurfaceRef v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  uint64_t v53;
  int v54;
  objc_super v55;
  _QWORD v56[7];
  uint8_t buf[8];
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  if (a1)
  {
    v55.receiver = a1;
    v55.super_class = (Class)PKMetalFramebuffer;
    v19 = (id *)objc_msgSendSuper2(&v55, sel_init);
    a1 = v19;
    if (v19)
    {
      *((double *)v19 + 9) = ceil(a8);
      *((double *)v19 + 10) = ceil(a9);
      objc_storeStrong(v19 + 4, a3);
      *((_BYTE *)a1 + 18) = a4;
      *((_BYTE *)a1 + 19) = a5;
      a1[5] = a2;
      a1[6] = a6;
      if (a1[3])
      {
        if (a7)
        {
LABEL_5:
          v20 = *((_BYTE *)a1 + 18) == 0;
LABEL_32:
          *((_BYTE *)a1 + 17) = v20;
          *(_OWORD *)(a1 + 11) = 0u;
          *(_OWORD *)(a1 + 13) = 0u;
          a1[8] = (id)8;
          goto LABEL_33;
        }
      }
      else
      {
        v21 = objc_msgSend(a1[4], "supportsFamily:", 1001);
        v22 = +[PKMetalUtility deviceSupportsFramebufferFetch:](PKMetalUtility, "deviceSupportsFramebufferFetch:", a1[4]);
        v23 = +[PKMetalUtility deviceSupportsMemorylessFramebuffers:](PKMetalUtility, "deviceSupportsMemorylessFramebuffers:", a1[4]);
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a1[5], (unint64_t)*((double *)a1 + 9), (unint64_t)*((double *)a1 + 10), 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if ((unint64_t)a1[6] >= 2)
          v26 = 4;
        else
          v26 = 2;
        objc_msgSend(v24, "setTextureType:", v26);
        objc_msgSend(v25, "setSampleCount:", a1[6]);
        objc_msgSend(v25, "setUsage:", 4);
        if (!v21 || !v22)
          objc_msgSend(v25, "setUsage:", objc_msgSend(v25, "usage") | 1);
        if (!*((_BYTE *)a1 + 18))
          objc_msgSend(v25, "setUsage:", objc_msgSend(v25, "usage") | 1);
        objc_msgSend(v25, "setStorageMode:", 2);
        if (v21)
        {
          if (*((_BYTE *)a1 + 18) && v23)
            objc_msgSend(v25, "setStorageMode:", 3);
        }
        if (*((_BYTE *)a1 + 19))
        {
          v54 = a7;
          v53 = objc_msgSend(v25, "storageMode");
          objc_msgSend(v25, "setStorageMode:", 0);
          v28 = *((double *)a1 + 10);
          v29 = floor(*((double *)a1 + 9));
          v30 = floor(v28);
          v31 = vcvtd_n_u64_f64(ceil(v29 * 4.0 * 0.0625), 4uLL);
          v32 = v31 * vcvtmd_u64_f64(v28);
          if (a1[5] == (id)554)
            v33 = &unk_1E77EBDF0;
          else
            v33 = &unk_1E77EBE08;
          v56[0] = *MEMORY[0x1E0CBC1E0];
          v34 = (void *)MEMORY[0x1E0CB37E8];
          v35 = v33;
          objc_msgSend(v34, "numberWithDouble:", v29);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v36;
          v56[1] = *MEMORY[0x1E0CBC008];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *MEMORY[0x1E0CBC070];
          v58 = v37;
          v59 = v35;
          v39 = *MEMORY[0x1E0CBBF00];
          v56[2] = v38;
          v56[3] = v39;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v40;
          v56[4] = *MEMORY[0x1E0CBBF08];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v41;
          v56[5] = *MEMORY[0x1E0CBBEE0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v56[6] = *MEMORY[0x1E0CBBF10];
          v62 = v42;
          v63 = &unk_1E77EBE20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v56, 7);
          v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          v44 = IOSurfaceCreate(v43);
          a1[7] = v44;
          if (v44)
          {
            v45 = objc_msgSend(a1[4], "newTextureWithDescriptor:iosurface:plane:", v25, v44, 0);
            v46 = a1[3];
            a1[3] = (id)v45;

            a7 = v54;
          }
          else
          {
            v49 = os_log_create("com.apple.pencilkit", ");
            a7 = v54;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1BE213000, v49, OS_LOG_TYPE_FAULT, "Failed to allocate an IOSurface, falling back to a regular framebuffer to avoid crashing.", buf, 2u);
            }

            objc_msgSend(v25, "setStorageMode:", v53);
            v50 = objc_msgSend(a1[4], "newTextureWithDescriptor:", v25);
            v51 = a1[3];
            a1[3] = (id)v50;

            *((_BYTE *)a1 + 19) = 0;
          }
        }
        else
        {
          v47 = objc_msgSend(a1[4], "newTextureWithDescriptor:", v25);
          v48 = a1[3];
          a1[3] = (id)v47;

        }
        if (a7)
          goto LABEL_5;
      }
      v20 = 0;
      goto LABEL_32;
    }
  }
LABEL_33:

  return a1;
}

- (void)dealloc
{
  __IOSurface *ioSurface;
  objc_super v4;

  ioSurface = self->_ioSurface;
  if (ioSurface)
  {
    CFRelease(ioSurface);
    self->_ioSurface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKMetalFramebuffer;
  -[PKMetalFramebuffer dealloc](&v4, sel_dealloc);
}

- (uint64_t)incrementNonPurgeableCount
{
  _BYTE *v1;
  __IOSurface *v2;
  _BOOL8 v3;
  uint32_t oldState;

  if (!a1)
    return 0;
  if (a1[17])
  {
    v1 = a1;
    objc_sync_enter(v1);
    ++*((_QWORD *)v1 + 1);
    if (v1[16])
    {
      v2 = (__IOSurface *)*((_QWORD *)v1 + 7);
      if (v2)
      {
        oldState = 0;
        IOSurfaceSetPurgeable(v2, 0, &oldState);
        if (oldState == 2)
        {
          IOSurfaceSetPurgeable(*((IOSurfaceRef *)v1 + 7), 1u, 0);
          goto LABEL_10;
        }
      }
      else if (objc_msgSend(*((id *)v1 + 3), "setPurgeableState:", 2) == 4)
      {
        goto LABEL_10;
      }
      v1[16] = 0;
    }
LABEL_10:
    v3 = v1[16] == 0;
    objc_sync_exit(v1);

    return v3;
  }
  return 1;
}

- (void)decrementNonPurgeableCount
{
  uint64_t v1;
  BOOL v2;
  __IOSurface *v3;
  _BYTE *obj;

  if (a1 && a1[17])
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = *((_QWORD *)obj + 1) - 1;
    *((_QWORD *)obj + 1) = v1;
    if (obj[16])
      v2 = 0;
    else
      v2 = v1 == 0;
    if (v2)
    {
      obj[16] = 1;
      v3 = (__IOSurface *)*((_QWORD *)obj + 7);
      if (v3)
        IOSurfaceSetPurgeable(v3, 1u, 0);
      else
        objc_msgSend(*((id *)obj + 3), "setPurgeableState:", 3);
    }
    objc_sync_exit(obj);

  }
}

- (double)size
{
  if (a1)
    return *(double *)(a1 + 72);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);
}

@end
