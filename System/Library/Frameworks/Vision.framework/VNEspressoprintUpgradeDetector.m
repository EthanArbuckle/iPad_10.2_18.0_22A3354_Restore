@implementation VNEspressoprintUpgradeDetector

- (void)dealloc
{
  objc_super v3;

  free(self->_highResolutionOldEspressoprint.data);
  self->_highResolutionOldEspressoprint.data = 0;
  free(self->_lowResolutionNewEspressoprint.data);
  self->_lowResolutionNewEspressoprint.data = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNEspressoprintUpgradeDetector;
  -[VNDetector dealloc](&v3, sel_dealloc);
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(void *, $70B10377DC9035999D77C63B14D421A0 *, void **, _QWORD, id *);
  _OWORD *v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  _OWORD *v16;
  void *__p;
  void *v18;
  _OWORD *v19;
  _QWORD aBlock[4];
  int v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VNEspressoprintUpgradeDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v22, sel_completeInitializationForSession_error_, a3))return 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__VNEspressoprintUpgradeDetector_completeInitializationForSession_error___block_invoke;
  aBlock[3] = &__block_descriptor_36_e47_B36__0_____v_v_4Q__4Q_QQQQQQQQQQi_8r_v16B24__28l;
  v21 = 0;
  v6 = (uint64_t (**)(void *, $70B10377DC9035999D77C63B14D421A0 *, void **, _QWORD, id *))_Block_copy(aBlock);
  v7 = operator new(0x20uLL);
  v18 = v7 + 2;
  v19 = v7 + 2;
  *v7 = xmmword_1A15E7600;
  v7[1] = unk_1A15E7610;
  __p = v7;
  if ((v6[2](v6, &self->_highResolutionOldEspressoprint, &__p, 1, a4) & 1) != 0
    && v6[2](v6, &self->_lowResolutionNewEspressoprint, &__p, 1, a4)
    && v6[2](v6, &self->_highResolutionNewEspressoprint, &__p, 0, a4))
  {
    v8 = operator new(0x20uLL);
    v15 = v8 + 2;
    v16 = v8 + 2;
    *v8 = xmmword_1A15E7620;
    v8[1] = unk_1A15E7630;
    v14 = v8;
    if ((v6[2](v6, &self->_highResolutionNewEspressoprintSigma, &v14, 0, a4) & 1) != 0)
    {
      -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "network");
      objc_msgSend(CFSTR("embedding"), "UTF8String");
      v10 = espresso_network_bind_buffer();

      if (!(_DWORD)v10)
      {
        -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "network");
        objc_msgSend(CFSTR("sigma"), "UTF8String");
        v10 = espresso_network_bind_buffer();

        if (!(_DWORD)v10)
        {
          v12 = 1;
LABEL_17:
          if (v14)
          {
            v15 = v14;
            operator delete(v14);
          }
          goto LABEL_12;
        }
      }
      if (a4)
      {
        +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v10, CFSTR("failed to bind buffer to network"));
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    v12 = 0;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_12:
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }

  return v12;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int (**v15)(void *, id *);
  void *v16;
  _QWORD aBlock[5];
  id v19;
  id v20;

  v11 = a5;
  v12 = objc_msgSend((id)objc_opt_class(), "espressoprintClass");
  +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v12, CFSTR("VNEspressoprintUpgradeDetectorProcessOption_FromEspressoprint"), v11, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", v12, CFSTR("VNEspressoprintUpgradeDetectorProcessOption_ToEspressoprint"), v11, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if ((objc_msgSend((id)objc_opt_class(), "isSupportedUpgradeFromPreviousEspressoprint:toNewLowResolutionEspressoprint:", v13, v14) & 1) != 0)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __132__VNEspressoprintUpgradeDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E45461D0;
        aBlock[4] = self;
        v19 = v13;
        v20 = v14;
        v15 = (unsigned int (**)(void *, id *))_Block_copy(aBlock);
        if (v15[2](v15, a8))
          a8 = (id *)MEMORY[0x1E0C9AA60];
        else
          a8 = 0;

        goto LABEL_12;
      }
      if (!a8)
      {
LABEL_12:

        goto LABEL_13;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Espressoprint upgrade is not supported for these pair of                                                                  prints produced with request revisions: from = %lu; to = %lu"),
                      objc_msgSend(v13, "requestRevision"),
                      objc_msgSend(v14, "requestRevision"));
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v16);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    a8 = 0;
    goto LABEL_12;
  }
  a8 = 0;
LABEL_13:

  return a8;
}

- (BOOL)_bindEspressoprintClientBuffer:(id)a3 toNetworkInputBlobName:(id)a4 toNetworkBuffer:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  const void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v10 = a3;
  v11 = a4;
  if (v10)
    v12 = a5 == 0;
  else
    v12 = 1;
  v13 = !v12;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v13, CFSTR("One or more of output parameters is/are NULL"));
  objc_msgSend(v10, "descriptorData");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const void *)objc_msgSend(v14, "bytes");

  memcpy(a5->var0, v15, 4 * objc_msgSend(v10, "elementCount"));
  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "network");
  v17 = objc_retainAutorelease(v11);
  objc_msgSend(v17, "UTF8String");
  v18 = espresso_network_bind_buffer();

  if (a6 && (_DWORD)v18)
  {
    +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v18, CFSTR("failed to bind buffer to network"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (_DWORD)v18 == 0;
}

- ($FD4688982923A924290ECB669CAF1EC2)highResolutionNewEspressoprint
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[3].var3[2];
  *(_OWORD *)&retstr->var10 = *(_OWORD *)self[3].var3;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[3].var4;
  v4 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[2].var13;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[3].var2[2];
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[3].var2;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)&self[2].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[2].var11;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[2].var9;
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setHighResolutionNewEspressoprint:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprint.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_highResolutionNewEspressoprint.dim = v4;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprint.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.channels = v5;
  *(_OWORD *)self->_highResolutionNewEspressoprint.stride = v7;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_highResolutionNewEspressoprint.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.stride_height = v9;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.stride_batch_number = v8;
  *(_OWORD *)&self->_highResolutionNewEspressoprint.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)highResolutionNewEspressoprintSigma
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[4].var3[2];
  *(_OWORD *)&retstr->var10 = *(_OWORD *)self[4].var3;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[4].var4;
  v4 = *(_OWORD *)&self[4].var0;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[3].var13;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[4].var2[2];
  *(_OWORD *)&retstr->var6 = *(_OWORD *)self[4].var2;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)&self[3].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[3].var11;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[3].var9;
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setHighResolutionNewEspressoprintSigma:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_highResolutionNewEspressoprintSigma.dim = v4;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.channels = v5;
  *(_OWORD *)self->_highResolutionNewEspressoprintSigma.stride = v7;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_highResolutionNewEspressoprintSigma.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.stride_height = v9;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.stride_batch_number = v8;
  *(_OWORD *)&self->_highResolutionNewEspressoprintSigma.sequence_length = v10;
}

uint64_t __132__VNEspressoprintUpgradeDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_bindEspressoprintClientBuffer:toNetworkInputBlobName:toNetworkBuffer:error:", *(_QWORD *)(a1 + 40), CFSTR("old_embedding"), *(_QWORD *)(a1 + 32) + 88, a2)&& objc_msgSend(*(id *)(a1 + 32), "_bindEspressoprintClientBuffer:toNetworkInputBlobName:toNetworkBuffer:error:", *(_QWORD *)(a1 + 48), CFSTR("thumbnail_embedding"), *(_QWORD *)(a1 + 32) + 256, a2))
  {
    return objc_msgSend(*(id *)(a1 + 32), "executePlanAndReturnError:", a2);
  }
  else
  {
    return 0;
  }
}

BOOL __73__VNEspressoprintUpgradeDetector_completeInitializationForSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, _QWORD *a5)
{
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)(a2 + 160) = 0x3030303030303030;
  *(_QWORD *)&v10 = 0x3030303030303030;
  *((_QWORD *)&v10 + 1) = 0x3030303030303030;
  *(_OWORD *)(a2 + 128) = v10;
  *(_OWORD *)(a2 + 144) = v10;
  *(_OWORD *)(a2 + 96) = v10;
  *(_OWORD *)(a2 + 112) = v10;
  *(_OWORD *)(a2 + 64) = v10;
  *(_OWORD *)(a2 + 80) = v10;
  *(_OWORD *)(a2 + 32) = v10;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)a2 = v10;
  *(_OWORD *)(a2 + 16) = v10;
  espresso_buffer_pack_tensor_shape();
  v11 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v11)
  {
    if (a5)
    {
      +[VNError errorForEspressoReturnStatus:localizedDescription:](VNError, "errorForEspressoReturnStatus:localizedDescription:", v11, CFSTR("failed to shape tensor"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a4)
      *(_QWORD *)a2 = malloc_type_calloc(*(_QWORD *)(*(_QWORD *)a3 + 8), 4uLL, 0x2906025AuLL);
    *(_DWORD *)(a2 + 160) = 65568;
  }
  return (_DWORD)v11 == 0;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNEspressoprintUpgradeDetectorProcessOption_EspressoprintClass"));
  if ((objc_msgSend(v6, "isEqual:", objc_opt_class()) & 1) != 0
    || objc_msgSend(v6, "isEqual:", objc_opt_class()))
  {
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unknown espresso print type"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (Class)v7;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isSupportedUpgradeFromPreviousEspressoprint:(id)a3 toNewLowResolutionEspressoprint:(id)a4
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

@end
