@implementation MOVStreamMetalPixelBufferUtility

+ (id)sharedMetalPixelBufferUtility
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__MOVStreamMetalPixelBufferUtility_sharedMetalPixelBufferUtility__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMetalPixelBufferUtility_onceToken != -1)
    dispatch_once(&sharedMetalPixelBufferUtility_onceToken, block);
  return (id)sharedMetalPixelBufferUtility_sharedMetalPixelBufferUtility;
}

void __65__MOVStreamMetalPixelBufferUtility_sharedMetalPixelBufferUtility__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMetalPixelBufferUtility_sharedMetalPixelBufferUtility;
  sharedMetalPixelBufferUtility_sharedMetalPixelBufferUtility = (uint64_t)v1;

}

- (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoWarholPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  return self->_enabled
      && -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:](self, "processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:", a3, a4, *(_QWORD *)&a5, 0, 0, 2);
}

- (BOOL)joinWarholBuffer:(__CVBuffer *)a3 intoBayerBuffer:(__CVBuffer *)a4 shiftBitsRightBy:(int)a5 msbReplication:(BOOL)a6
{
  return self->_enabled
      && -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:](self, "processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:", a4, a3, *(_QWORD *)&a5, a6, 1, 2);
}

- (BOOL)splitCompandedBayerBuffer:(__CVBuffer *)a3 intoCompandedWarholPixelBuffer:(__CVBuffer *)a4
{
  return self->_enabled
      && -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:](self, "processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:", a3, a4, 0, 0, 2, 1);
}

- (BOOL)joinCompandedWarholBuffer:(__CVBuffer *)a3 intoCompandedBayerBuffer:(__CVBuffer *)a4
{
  return self->_enabled
      && -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:](self, "processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:", a4, a3, 0, 0, 3, 1);
}

- (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoYUVPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  return 0;
}

- (BOOL)joinYUVBuffer:(__CVBuffer *)a3 intoRawBayerPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5 msbReplication:(BOOL)a6
{
  return 0;
}

- (MOVStreamMetalPixelBufferUtility)init
{
  MOVStreamMetalPixelBufferUtility *v2;
  MTLDevice *v3;
  MTLDevice *metalDevice;
  void *v5;
  void *v6;
  void *v7;
  MTLDevice *v8;
  void *v9;
  id v10;
  NSObject *v11;
  MTLDevice *v12;
  uint64_t v13;
  NSObject *v14;
  MTLComputePipelineState *v15;
  NSObject *v16;
  MTLDevice *v17;
  uint64_t v18;
  NSObject *v19;
  MTLComputePipelineState *v20;
  NSObject *v21;
  MTLDevice *v22;
  uint64_t v23;
  MTLComputePipelineState *v24;
  uint64_t v25;
  uint64_t v26;
  MTLDevice *v27;
  uint64_t v28;
  MTLComputePipelineState *v29;
  uint64_t v30;
  MTLCommandQueue *metalCommandQueue;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  NSObject *v43;
  NSObject *v44;
  MOVStreamMetalPixelBufferUtility *v45;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v54.receiver = self;
  v54.super_class = (Class)MOVStreamMetalPixelBufferUtility;
  v2 = -[MOVStreamMetalPixelBufferUtility init](&v54, sel_init);
  if (!v2)
    goto LABEL_69;
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  metalDevice = v2->_metalDevice;
  v2->_metalDevice = v3;

  if (!v2->_metalDevice)
  {
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v33, OS_LOG_TYPE_DEBUG, "Failed to create Metal Device.", buf, 2u);
      }

    }
    goto LABEL_68;
  }
  v5 = (void *)MEMORY[0x24BDD1488];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleForClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v2->_metalDevice;
  v53 = 0;
  v9 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](v8, "newDefaultLibraryWithBundle:error:", v7, &v53);
  v10 = v53;
  if (v9)
  {
    v11 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("splitBayerIntoWarhol"));
    if (v11)
    {
      v12 = v2->_metalDevice;
      v52 = 0;
      v13 = -[MTLDevice newComputePipelineStateWithFunction:error:](v12, "newComputePipelineStateWithFunction:error:", v11, &v52);
      v14 = v52;
      v15 = v2->_pipeLineStates[0];
      v2->_pipeLineStates[0] = (MTLComputePipelineState *)v13;

      if (v2->_pipeLineStates[0])
      {
        v16 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("joinWarholIntoBayer"));
        if (v16)
        {
          v17 = v2->_metalDevice;
          v51 = v14;
          v18 = -[MTLDevice newComputePipelineStateWithFunction:error:](v17, "newComputePipelineStateWithFunction:error:", v16, &v51);
          v19 = v51;

          v20 = v2->_pipeLineStates[1];
          v2->_pipeLineStates[1] = (MTLComputePipelineState *)v18;

          if (v2->_pipeLineStates[1])
          {
            v21 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("splitCompandedBayerIntoWarhol"));
            if (v21)
            {
              v22 = v2->_metalDevice;
              v50 = v19;
              v23 = -[MTLDevice newComputePipelineStateWithFunction:error:](v22, "newComputePipelineStateWithFunction:error:", v21, &v50);
              v14 = v50;

              v24 = v2->_pipeLineStates[2];
              v2->_pipeLineStates[2] = (MTLComputePipelineState *)v23;

              if (v2->_pipeLineStates[2])
              {
                v25 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("joinCompandedWarholIntoBayer"));
                v48 = (void *)v25;
                if (v25)
                {
                  v26 = v25;
                  v27 = v2->_metalDevice;
                  v49 = v14;
                  v28 = -[MTLDevice newComputePipelineStateWithFunction:error:](v27, "newComputePipelineStateWithFunction:error:", v26, &v49);
                  v47 = v49;

                  v29 = v2->_pipeLineStates[3];
                  v2->_pipeLineStates[3] = (MTLComputePipelineState *)v28;

                  if (v2->_pipeLineStates[3])
                  {
                    v30 = -[MTLDevice newCommandQueue](v2->_metalDevice, "newCommandQueue");
                    metalCommandQueue = v2->_metalCommandQueue;
                    v2->_metalCommandQueue = (MTLCommandQueue *)v30;

                    if (v2->_metalCommandQueue)
                    {
                      -[MOVStreamMetalPixelBufferUtility setEnabled:](v2, "setEnabled:", 1);
                      v32 = 0;
LABEL_61:
                      v14 = v47;
                      goto LABEL_62;
                    }
                    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                    {
                      +[MIOLog defaultLog](MIOLog, "defaultLog");
                      v43 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_210675000, v43, OS_LOG_TYPE_DEBUG, "Failed to create the command queue.", buf, 2u);
                      }
LABEL_59:

                    }
                  }
                  else if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                  {
                    +[MIOLog defaultLog](MIOLog, "defaultLog");
                    v43 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                    {
                      -[NSObject localizedDescription](v47, "localizedDescription");
                      v44 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v56 = v44;
                      _os_log_impl(&dword_210675000, v43, OS_LOG_TYPE_DEBUG, "Failed to created pipeline state object, error %{public}@.", buf, 0xCu);

                    }
                    goto LABEL_59;
                  }
                  v32 = 1;
                  goto LABEL_61;
                }
                if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
                {
                  +[MIOLog defaultLog](MIOLog, "defaultLog");
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
LABEL_51:

                    goto LABEL_52;
                  }
                  *(_WORD *)buf = 0;
                  v40 = "Failed to find the metal joinCompandedWarholIntoBayer function.";
                  v41 = v39;
                  v42 = 2;
LABEL_50:
                  _os_log_impl(&dword_210675000, v41, OS_LOG_TYPE_DEBUG, v40, buf, v42);
                  goto LABEL_51;
                }
                goto LABEL_52;
              }
              if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
              {
                +[MIOLog defaultLog](MIOLog, "defaultLog");
                v38 = objc_claimAutoreleasedReturnValue();
                v48 = v38;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  -[NSObject localizedDescription](v14, "localizedDescription");
                  v39 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v56 = v39;
                  v40 = "Failed to created pipeline state object, error %{public}@.";
                  v41 = v38;
                  v42 = 12;
                  goto LABEL_50;
                }
LABEL_52:
                v32 = 1;
LABEL_62:

                goto LABEL_63;
              }
              goto LABEL_46;
            }
            if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
            {
              +[MIOLog defaultLog](MIOLog, "defaultLog");
              v37 = objc_claimAutoreleasedReturnValue();
              v48 = v37;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_210675000, v37, OS_LOG_TYPE_DEBUG, "Failed to find the metal splitCompandedBayerIntoWarhol function.", buf, 2u);
              }
              v32 = 1;
              v14 = v19;
              goto LABEL_62;
            }
LABEL_41:
            v32 = 1;
            v14 = v19;
LABEL_63:

            goto LABEL_64;
          }
          if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject localizedDescription](v19, "localizedDescription");
              v36 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v56 = v36;
              _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_DEBUG, "Failed to created pipeline state object, error %{public}@.", buf, 0xCu);

            }
            goto LABEL_41;
          }
          v32 = 1;
          v14 = v19;
LABEL_64:

          goto LABEL_65;
        }
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_DEBUG, "Failed to find the metal joinWarholIntoBayer function.", buf, 2u);
          }
LABEL_46:
          v32 = 1;
          goto LABEL_63;
        }
LABEL_33:
        v32 = 1;
        goto LABEL_64;
      }
      if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject localizedDescription](v14, "localizedDescription");
          v35 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v35;
          _os_log_impl(&dword_210675000, v16, OS_LOG_TYPE_DEBUG, "Failed to created pipeline state object, error %{public}@.", buf, 0xCu);

        }
        goto LABEL_33;
      }
LABEL_29:
      v32 = 1;
LABEL_65:

      goto LABEL_66;
    }
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "Failed to find the metal splitBayerIntoWarhol function.", buf, 2u);
      }
      goto LABEL_29;
    }
  }
  else
  {
    if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      v32 = 1;
      goto LABEL_67;
    }
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v10, "localizedDescription");
      v34 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v34;
      _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_DEBUG, "Failed to find the default library. error: %{public}@", buf, 0xCu);

    }
  }
  v32 = 1;
LABEL_66:

LABEL_67:
  if (!v32)
  {
LABEL_69:
    v45 = v2;
    goto LABEL_70;
  }
LABEL_68:
  v45 = 0;
LABEL_70:

  return v45;
}

- (BOOL)processBayerBuffer:(__CVBuffer *)a3 withWarholBuffer:(__CVBuffer *)a4 shiftCount:(int)a5 msbReplication:(BOOL)a6 operation:(int)a7 sampleSize:(int)a8
{
  _BOOL4 v10;
  unsigned int WidthOfPlane;
  unsigned int v16;
  unsigned int HeightOfPlane;
  unsigned int v18;
  int v19;
  NSObject *v20;
  void *PixelBufferBaseAddress;
  void *v22;
  int PixelBufferRowBytes;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  Class *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  unint64_t v42;
  _BOOL8 unlockFlags;
  CVPixelBufferLockFlags v44;
  __CVBuffer *v45;
  uint64_t v46;
  int64x2_t v47;
  uint64_t v48;
  int64x2_t v49;
  _BOOL4 v50;
  int v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  int v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v10 = a6;
  v58 = *MEMORY[0x24BDAC8D0];
  if (CVPixelBufferIsPlanar(a3))
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  else
    WidthOfPlane = CVPixelBufferGetWidth(a3);
  v16 = WidthOfPlane;
  if (CVPixelBufferIsPlanar(a3))
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  else
    HeightOfPlane = CVPixelBufferGetHeight(a3);
  v18 = HeightOfPlane;
  v19 = v16 & 7;
  if ((v16 & 7) != 0)
  {
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_DEBUG, "Bayer Buffer width is not a multiple of 8", buf, 2u);
      }

    }
  }
  else
  {
    v42 = __PAIR64__(a7, a8);
    unlockFlags = (a7 & 0xFFFFFFFD) == 0;
    CVPixelBufferLockBaseAddress(a3, unlockFlags);
    v44 = (a7 & 0xFFFFFFFD) != 0;
    CVPixelBufferLockBaseAddress(a4, v44);
    PixelBufferBaseAddress = GetPixelBufferBaseAddress(a3);
    v22 = GetPixelBufferBaseAddress(a4);
    PixelBufferRowBytes = GetPixelBufferRowBytes(a3);
    v55 = PixelBufferRowBytes;
    v45 = a4;
    v24 = GetPixelBufferRowBytes(a4);
    v53 = v16 >> 3;
    v54 = v24;
    v52 = (v16 >> 3) * v18;
    if (v16 % (v16 >> 3))
      -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:].cold.3();
    v25 = v24;
    v50 = v10;
    v51 = a5;
    v26 = getpagesize();
    v27 = ((unint64_t)(v25 * v18) + v26 - 1) / v26 * v26;
    v28 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_metalDevice, "newBufferWithBytesNoCopy:length:options:deallocator:", PixelBufferBaseAddress, ((unint64_t)(PixelBufferRowBytes * v18) + v26 - 1) / v26 * v26, 0, 0);
    v29 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_metalDevice, "newBufferWithBytesNoCopy:length:options:deallocator:", v22, v27, 0, 0);
    -[MTLCommandQueue commandBuffer](self->_metalCommandQueue, "commandBuffer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
      -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:].cold.1();
    v31 = v30;
    objc_msgSend(v30, "computeCommandEncoder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
      -[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:].cold.2();
    v33 = v32;
    v34 = v25 * (v18 >> 1);
    v35 = &self->super.isa + HIDWORD(v42);
    objc_msgSend(v32, "setComputePipelineState:", v35[3]);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", v28, 0, 0);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", v29, 0, 1);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", v29, (v16 * v42) >> 1, 2);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", v29, v34, 3);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", v29, v34 + ((v16 * v42) >> 1), 4);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v55, 4, 5);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v54, 4, 6);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v52, 4, 7);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v53, 4, 8);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v51, 4, 9);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v50, 4, 10);
    v36 = -[objc_class maxTotalThreadsPerThreadgroup](v35[3], "maxTotalThreadsPerThreadgroup");
    if (v52 >= v36)
      v37 = v36;
    else
      v37 = v52;
    v48 = (v52 + v37 - 1) / v37;
    v49 = vdupq_n_s64(1uLL);
    v46 = v37;
    v47 = v49;
    objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", &v48, &v46, v42);
    objc_msgSend(v33, "endEncoding");
    objc_msgSend(v31, "commit");
    objc_msgSend(v31, "waitUntilCompleted");
    objc_msgSend(v31, "error");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v31, "error");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v40;
        _os_log_impl(&dword_210675000, v39, OS_LOG_TYPE_ERROR, "processBayerBuffer error recevied: %{public}@", buf, 0xCu);

      }
    }
    CVPixelBufferUnlockBaseAddress(a3, unlockFlags);
    CVPixelBufferUnlockBaseAddress(v45, v44);

    v19 = 0;
  }
  return v19 == 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 56; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

- (void)processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:.cold.1()
{
  __assert_rtn("-[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]", "MOVStreamMetalPixelBufferUtility.m", 372, "commandBuffer != nil");
}

- (void)processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:.cold.2()
{
  __assert_rtn("-[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]", "MOVStreamMetalPixelBufferUtility.m", 375, "computeEncoder != nil");
}

- (void)processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:.cold.3()
{
  __assert_rtn("-[MOVStreamMetalPixelBufferUtility processBayerBuffer:withWarholBuffer:shiftCount:msbReplication:operation:sampleSize:]", "MOVStreamMetalPixelBufferUtility.m", 345, "(width % vectorsPerLine) == 0");
}

@end
