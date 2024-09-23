@implementation MLPDeviceHandler

- (MLPDeviceHandler)initWithDataLayout:(id)a3
{
  id v4;
  MLPDeviceHandler *v5;
  const char *v6;
  uint64_t v7;
  MLPDeviceHandler *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  MTLCommandQueue *commandQueue;
  id v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MLPDeviceHandler;
  v5 = -[MLPDeviceHandler init](&v26, sel_init);
  v8 = v5;
  if (!v5)
    goto LABEL_11;
  v9 = 1;
  v5->weightSeed.__x_[0] = 1;
  v10 = 3;
  v11 = 1;
  do
  {
    v12 = 1812433253 * (v9 ^ (v9 >> 30));
    v9 = v12 + v11;
    *((_DWORD *)&v5->super.isa + v10) = v10 + v12 - 2;
    ++v11;
    ++v10;
  }
  while (v10 != 626);
  v5->weightSeed.__i_ = 0;
  v5->_dataLayout = 1;
  if ((objc_msgSend_isEqualToString_(v4, v6, (uint64_t)MLPModelTrainerDataLayoutFeatureChannelsxHeightxWidth[0], v7) & 1) != 0)
  {
    v16 = 1;
LABEL_8:
    v8->_dataLayout = v16;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v4, v13, (uint64_t)MLPModelTrainerDataLayoutHeightxWidthxFeatureChannels[0], v15))
  {
    v16 = 0;
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend_deduceDevice(v8, v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v17, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Could not find metal device"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  objc_storeStrong((id *)&v8->_device, v18);
  v22 = objc_msgSend_newCommandQueue(v18, v19, v20, v21);
  commandQueue = v8->_commandQueue;
  v8->_commandQueue = (MTLCommandQueue *)v22;

LABEL_11:
  return v8;
}

- (id)deduceDevice
{
  return MTLCreateSystemDefaultDevice();
}

- (id)weightMatrixFixedRowBytesWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  unint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;

  v5 = 4 * a4;
  objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E0CC6F00], a2, a3, a4, 4 * a4, 268435488);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_rows(v6, v11, v12, v13);
  v16 = (void *)objc_msgSend_newBufferWithLength_options_(v10, v15, v14 * v5, 0);

  v17 = objc_alloc(MEMORY[0x1E0CC6ED8]);
  v19 = (void *)objc_msgSend_initWithBuffer_descriptor_(v17, v18, (uint64_t)v16, (uint64_t)v6);
  v20 = objc_retainAutorelease(v16);
  v24 = (void *)objc_msgSend_contents(v20, v21, v22, v23);
  v28 = objc_msgSend_length(v20, v25, v26, v27);
  bzero(v24, v28);

  return v19;
}

- (id)weightMatrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 stdDev:(float)a5 initialValues:(const void *)a6 columnMajor:(BOOL)a7
{
  float v7;
  _BOOL4 v8;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  size_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  mersenne_twister_engine<unsigned int, 32UL, 624UL, 397UL, 31UL, 2567483615U, 11UL, 4294967295U, 7UL, 2636928640U, 15UL, 4022730752U, 18UL, 1812433253U> *p_weightSeed;
  int8x8_t v50;
  int8x8_t v51;
  uint64_t i;
  float v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int v61;
  unint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  int32x2_t v67;
  int32x2_t v68;
  int8x8_t v69;
  float32x2_t v70;
  float v71;
  float v72;
  size_t v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  _DWORD *v88;
  unint64_t v89;
  uint64_t v90;
  int *v91;
  uint64_t v92;
  int v93;
  size_t v94;
  void *v96;
  id v97;
  unint64_t v98;
  float32x2_t v99;
  MLPDeviceHandler *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;

  v8 = a7;
  v14 = objc_msgSend_rowBytesForColumns_dataType_(MEMORY[0x1E0CC6F00], a2, a4, 268435488);
  v98 = a3;
  v103 = a4;
  objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E0CC6F00], v15, a3, a4, v14, 268435488);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = self;
  objc_msgSend_device(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_rows(v16, v21, v22, v23);
  v26 = (void *)objc_msgSend_newBufferWithLength_options_(v20, v25, v24 * v14, 0);

  v27 = objc_alloc(MEMORY[0x1E0CC6ED8]);
  v29 = objc_msgSend_initWithBuffer_descriptor_(v27, v28, (uint64_t)v26, (uint64_t)v16);
  v30 = objc_retainAutorelease(v26);
  v37 = (void *)objc_msgSend_contents(v30, v31, v32, v33);
  v96 = v30;
  v97 = (id)v29;
  if (a6)
  {
    v38 = v103 * v98;
    if (v103 * v98)
    {
      if (v38 >> 62)
        sub_19C07DA0C();
      v39 = operator new(4 * v38);
      bzero(v39, 4 * v38);
    }
    else
    {
      v39 = 0;
    }
    v73 = objc_msgSend_length(v30, v34, v35, v36);
    bzero(v37, v73);
    v74 = objc_retainAutorelease(v30);
    v78 = objc_msgSend_contents(v74, v75, v76, v77, v26, v30, v29);
    if (v98)
    {
      v82 = v98;
      if (!v8)
        v82 = v103;
      if (v103)
      {
        v83 = v78;
        v84 = 0;
        v85 = 4 * v82;
        if (v8)
        {
          do
          {
            v86 = v103;
            v87 = v83;
            v88 = a6;
            do
            {
              *(_DWORD *)(v87 + v84 * objc_msgSend_rowBytes(v16, v79, v80, v81)) = *v88;
              v88 = (_DWORD *)((char *)v88 + v85);
              v87 += 4;
              --v86;
            }
            while (v86);
            ++v84;
            a6 = (char *)a6 + 4;
          }
          while (v84 != v98);
        }
        else
        {
          do
          {
            v89 = v103;
            v90 = v83;
            v91 = (int *)a6;
            do
            {
              v92 = objc_msgSend_rowBytes(v16, v79, v80, v81);
              v93 = *v91++;
              *(_DWORD *)(v90 + v84 * v92) = v93;
              v90 += 4;
              --v89;
            }
            while (v89);
            ++v84;
            a6 = (char *)a6 + v85;
          }
          while (v84 != v98);
        }
      }
    }
    if (v39)
      operator delete(v39);
  }
  else if (a5 <= 0.0)
  {
    v94 = objc_msgSend_length(v30, v34, v35, v36);
    bzero(v37, v94);
  }
  else
  {
    v40 = objc_msgSend_length(v30, v34, v35, v36);
    bzero(v37, v40);
    v41 = objc_retainAutorelease(v30);
    v101 = objc_msgSend_contents(v41, v42, v43, v44, v26, v30, v29);
    if (v98 && v103)
    {
      v102 = 0;
      v48 = 0;
      p_weightSeed = &v100->weightSeed;
      v50 = (int8x8_t)vdup_n_s32(0x9D2C5680);
      v51 = (int8x8_t)vdup_n_s32(0xEFC60000);
      __asm { FMOV            V13.2S, #-1.0 }
      do
      {
        for (i = 0; i != v103; ++i)
        {
          v59 = objc_msgSend_rowBytes(v16, v45, v46, v47);
          if (v48)
          {
            v48 = 0;
            v58 = v7;
          }
          else
          {
            v60 = v100->weightSeed.__i_;
            v61 = p_weightSeed->__x_[v60];
            do
            {
              v62 = (v60 + 1) % 0x270;
              v63 = v62;
              v64 = p_weightSeed->__x_[(v60 + 397) % 0x270] ^ ((p_weightSeed->__x_[v62] & 0x7FFFFFFE | v61 & 0x80000000) >> 1) ^ ((int)(p_weightSeed->__x_[v62] << 31) >> 31) & 0x9908B0DF;
              p_weightSeed->__x_[v60] = v64;
              if (v62 < 0x26F)
                v60 = v62 + 1;
              else
                v60 = v62 - 623;
              if (v62 >= 0xE3)
                v65 = -227;
              else
                v65 = 397;
              v61 = p_weightSeed->__x_[v60];
              v66 = p_weightSeed->__x_[v65 + v62] ^ ((v61 & 0x7FFFFFFE | p_weightSeed->__x_[v62] & 0x80000000) >> 1) ^ ((int)(v61 << 31) >> 31) & 0x9908B0DF;
              p_weightSeed->__x_[v63] = v66;
              v67 = (int32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)__PAIR64__(v64, v66), 0xBuLL), (int8x8_t)__PAIR64__(v64, v66));
              v68 = (int32x2_t)veor_s8(vand_s8((int8x8_t)vshl_n_s32(v67, 7uLL), v50), (int8x8_t)v67);
              v69 = veor_s8(vand_s8((int8x8_t)vshl_n_s32(v68, 0xFuLL), v51), (int8x8_t)v68);
              v70 = vmla_f32(_D13, vcvt_f32_u32((uint32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)v69, 0x12uLL), v69)), (float32x2_t)0x3000000030000000);
              v71 = vaddv_f32(vmul_f32(v70, v70));
            }
            while (v71 > 1.0 || v71 == 0.0);
            v100->weightSeed.__i_ = v60;
            v99 = v70;
            v72 = sqrtf((float)(logf(v71) * -2.0) / v71);
            v7 = v72 * v99.f32[0];
            v58 = vmuls_lane_f32(v72, v99, 1);
            v48 = 1;
          }
          *(float *)(v101 + v59 * v102 + 4 * i) = v58 * a5;
        }
        ++v102;
      }
      while (v102 != v98);
    }
  }

  return v97;
}

- (id)biasVectorWithLength:(unint64_t)a3 stdDev:(float)a4 values:(const void *)a5
{
  unint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  float *v29;
  unint64_t v30;
  __int128 *v31;
  _OWORD *v32;
  unint64_t v33;
  __int128 v34;
  _DWORD *v35;
  int *v36;
  unint64_t v37;
  int v38;
  size_t v39;
  uint64_t v41;
  char v42;

  v7 = a3;
  LODWORD(v41) = 0;
  *((float *)&v41 + 1) = a4;
  v42 = 0;
  objc_msgSend_vectorDescriptorWithLength_dataType_(MEMORY[0x1E0CC7250], a2, a3, 268435488, v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_vectorBytesForLength_dataType_(MEMORY[0x1E0CC7250], v10, v7, 268435488);
  objc_msgSend_device(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_newBufferWithLength_options_(v15, v16, v11, 0);

  v18 = objc_alloc(MEMORY[0x1E0CC7248]);
  v20 = (void *)objc_msgSend_initWithBuffer_descriptor_(v18, v19, (uint64_t)v17, (uint64_t)v9);
  v21 = objc_retainAutorelease(v17);
  v25 = objc_msgSend_contents(v21, v22, v23, v24);
  v29 = (float *)v25;
  if (a5)
  {
    if (v7)
    {
      v30 = 0;
      if (v7 < 8)
        goto LABEL_8;
      if ((unint64_t)(v25 - (_QWORD)a5) < 0x20)
        goto LABEL_8;
      v30 = v7 & 0xFFFFFFFFFFFFFFF8;
      v31 = (__int128 *)((char *)a5 + 16);
      v32 = (_OWORD *)(v25 + 16);
      v33 = v7 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v34 = *v31;
        *(v32 - 1) = *(v31 - 1);
        *v32 = v34;
        v31 += 2;
        v32 += 2;
        v33 -= 8;
      }
      while (v33);
      if (v30 != v7)
      {
LABEL_8:
        v35 = (_DWORD *)(v25 + 4 * v30);
        v36 = (int *)((char *)a5 + 4 * v30);
        v37 = v7 - v30;
        do
        {
          v38 = *v36++;
          *v35++ = v38;
          --v37;
        }
        while (v37);
      }
    }
  }
  else if (a4 <= 0.0)
  {
    v39 = objc_msgSend_length(v21, v26, v27, v28);
    bzero(v29, v39);
  }
  else
  {
    for (; v7; --v7)
      *v29++ = sub_19C16E4D0((uint64_t)&v41, (uint64_t)&self->weightSeed, (float *)&v41);
  }

  return v20;
}

- (id)imageFromData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 featureChannels:(unint64_t)a6
{
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;

  v10 = a3;
  objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(MEMORY[0x1E0CC6E38], v11, 4, a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CC6DF0]);
  objc_msgSend_device(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithDevice_imageDescriptor_(v13, v18, (uint64_t)v17, (uint64_t)v12);

  v20 = objc_retainAutorelease(v10);
  v24 = objc_msgSend_bytes(v20, v21, v22, v23);
  v28 = objc_msgSend_dataLayout(self, v25, v26, v27);
  objc_msgSend_writeBytes_dataLayout_imageIndex_(v19, v29, v24, v28, 0);

  return v19;
}

- (id)imageFromMatrix:(id)a3 m2iKernel:(id)a4 cmdBuf:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7 featureChannels:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(MEMORY[0x1E0CC6E38], v16, 4, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_temporaryImageWithCommandBuffer_imageDescriptor_(MEMORY[0x1E0CC7230], v18, (uint64_t)v15, (uint64_t)v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_sourceMatrix_destinationImage_(v14, v20, (uint64_t)v15, (uint64_t)v13, v19);

  return v19;
}

- (id)imageBatchFromMatrix:(id)a3 m2iKernel:(id)a4 cmdBuf:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7 channels:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *i;
  void *v26;
  const char *v27;
  uint64_t v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19 = objc_msgSend_rows(v13, v16, v17, v18);
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v20, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(MEMORY[0x1E0CC6E38], v23, 4, a6, a7, a8);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v19; --v19)
  {
    objc_msgSend_temporaryImageWithCommandBuffer_imageDescriptor_(MEMORY[0x1E0CC7230], v24, (uint64_t)v15, (uint64_t)i);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v22, v27, (uint64_t)v26, v28);

  }
  objc_msgSend_encodeBatchToCommandBuffer_sourceMatrix_destinationImages_(v14, v24, (uint64_t)v15, (uint64_t)v13, v22);

  return v22;
}

- (id)tempMatrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 cmdBuf:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v7 = a5;
  v9 = objc_msgSend_rowBytesForColumns_dataType_(MEMORY[0x1E0CC6F00], v8, a4, 268435488);
  objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E0CC6F00], v10, a3, a4, v9, 268435488);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_temporaryMatrixWithCommandBuffer_matrixDescriptor_(MEMORY[0x1E0CC7238], v12, (uint64_t)v7, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)matrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 cmdBuf:(id)a5
{
  double v5;

  LODWORD(v5) = 0;
  objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(self, a2, a3, a4, 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tempMatrixFromImages:(id)a3 i2mKernel:(id)a4 cmdBuf:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = objc_msgSend_count(v8, v11, v12, v13);
  objc_msgSend_objectAtIndexedSubscript_(v8, v15, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_featureChannels(v17, v18, v19, v20);
  objc_msgSend_objectAtIndexedSubscript_(v8, v22, 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_width(v24, v25, v26, v27);
  objc_msgSend_objectAtIndexedSubscript_(v8, v29, 0, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v28 * v21 * objc_msgSend_height(v31, v32, v33, v34);

  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(self, v36, v14, v35, v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationMatrix_(v9, v38, (uint64_t)v10, (uint64_t)v8, v37);

  return v37;
}

- (id)matrixFromImages:(id)a3 i2mKernel:(id)a4 cmdBuf:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = objc_msgSend_count(v8, v11, v12, v13);
  objc_msgSend_objectAtIndexedSubscript_(v8, v15, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_featureChannels(v17, v18, v19, v20);
  objc_msgSend_objectAtIndexedSubscript_(v8, v22, 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_width(v24, v25, v26, v27);
  objc_msgSend_objectAtIndexedSubscript_(v8, v29, 0, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v28 * v21 * objc_msgSend_height(v31, v32, v33, v34);

  objc_msgSend_matrixWithRows_columns_cmdBuf_(self, v36, v14, v35, v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationMatrix_(v9, v38, (uint64_t)v10, (uint64_t)v8, v37);

  return v37;
}

- (id)vectorWithLength:(unint64_t)a3 cmdBuf:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  objc_msgSend_vectorDescriptorWithLength_dataType_(MEMORY[0x1E0CC7250], a2, a3, 268435488);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CC7248]);
  objc_msgSend_device(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithDevice_descriptor_(v6, v11, (uint64_t)v10, (uint64_t)v5);

  return v12;
}

- (id)matrixToVector:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  v3 = a3;
  v7 = objc_msgSend_rowBytes(v3, v4, v5, v6);
  v11 = objc_msgSend_rows(v3, v8, v9, v10);
  objc_msgSend_vectorDescriptorWithLength_dataType_(MEMORY[0x1E0CC7250], v12, v11 * (v7 >> 2), 268435488);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CC7248]);
  objc_msgSend_data(v3, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_initWithBuffer_descriptor_(v14, v19, (uint64_t)v18, (uint64_t)v13);

  return v20;
}

- (float)uniformRandWithParamA:(float)a3 paramB:(float)a4
{
  unint64_t i;
  unint64_t v5;
  unint64_t v6;
  int v7;

  i = self->weightSeed.__i_;
  v5 = i;
  v6 = (i + 1) % 0x270;
  LODWORD(i) = self->weightSeed.__x_[(i + 397) % 0x270] ^ ((self->weightSeed.__x_[v6] & 0x7FFFFFFE | self->weightSeed.__x_[i] & 0x80000000) >> 1) ^ ((int)(self->weightSeed.__x_[v6] << 31) >> 31) & 0x9908B0DF;
  self->weightSeed.__x_[v5] = i;
  v7 = ((i ^ (i >> 11)) << 7) & 0x9D2C5680 ^ i ^ (i >> 11);
  self->weightSeed.__i_ = v6;
  return a3
       + (float)((float)((float)(a4 - a3) * 2.3283e-10)
               * (float)((v7 << 15) & 0xEFC60000 ^ v7 ^ (((v7 << 15) & 0xEFC60000 ^ v7) >> 18)));
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 2512, 1);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 2520, 1);
}

- (unint64_t)dataLayout
{
  return self->_dataLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  unsigned int v2;
  uint64_t v3;
  uint64_t i;
  int v5;

  v2 = 5489;
  *((_DWORD *)self + 2) = 5489;
  v3 = 1;
  for (i = 3; i != 626; ++i)
  {
    v5 = 1812433253 * (v2 ^ (v2 >> 30));
    v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 2;
    ++v3;
  }
  *((_QWORD *)self + 313) = 0;
  return self;
}

@end
