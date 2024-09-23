@implementation GTMTLDeviceCapabilitiesQuery

void __GTMTLDeviceCapabilitiesQuery_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  char *v7;
  id v8;
  char *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  void *CFProperty;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  float v44;
  float v45;
  uint64_t v46;
  _OWORD v47[3];
  uint64_t v48;

  v2 = MTLCreateSystemDefaultDevice();
  v3 = *(_QWORD *)(a1 + 32);
  ++*(_QWORD *)(v3 + 1168);
  *(_QWORD *)(v3 + 520) = 4096;
  *(_OWORD *)(v3 + 528) = xmmword_22D0CE170;
  *(_OWORD *)(v3 + 544) = xmmword_22D0CE180;
  *(_OWORD *)(v3 + 560) = xmmword_22D0CE190;
  *(_QWORD *)(v3 + 576) = 0x8000;
  objc_msgSend(v2, "name");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy((char *)v3, (const char *)objc_msgSend(v4, "UTF8String"), 0x80uLL);

  v5 = (char *)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(v2, "familyName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy(v5, (const char *)objc_msgSend(v6, "UTF8String"), 0x80uLL);

  v7 = (char *)(*(_QWORD *)(a1 + 32) + 256);
  objc_msgSend(v2, "vendorName");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0x80uLL);

  v9 = (char *)(*(_QWORD *)(a1 + 32) + 384);
  objc_msgSend(v2, "productName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy(v9, (const char *)objc_msgSend(v10, "UTF8String"), 0x80uLL);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512) = objc_msgSend(v2, "registryID");
  objc_msgSend(v2, "targetDeviceArchitecture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "version");

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(v13 + 520);
  v15 = v13 + 520 + v14;
  *(_QWORD *)&v47[0] = 0;
  mach_timebase_info((mach_timebase_info_t)v47);
  *(_QWORD *)v15 = *(_QWORD *)&v47[0];
  objc_msgSend(v2, "targetDeviceArchitecture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 40) = objc_msgSend(v16, "cpuType");

  objc_msgSend(v2, "targetDeviceArchitecture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 44) = objc_msgSend(v17, "subType");

  *(_BYTE *)(v15 + 617) = objc_msgSend(v2, "requiresRaytracingEmulation");
  for (i = 1001; i != 1017; ++i)
  {
    if (objc_msgSend(v2, "supportsFamily:", i))
      *(_QWORD *)(v15 + 64) |= (1 << (i + 24));
  }
  for (j = 2002; j != 2018; ++j)
  {
    if (objc_msgSend(v2, "supportsFamily:", j))
      *(_QWORD *)(v15 + 48) |= (1 << (j + 48));
  }
  for (k = 3001; k != 3017; ++k)
  {
    if (objc_msgSend(v2, "supportsFamily:", k))
      *(_QWORD *)(v15 + 72) |= (1 << (k + 72));
  }
  for (m = 0; m != 16; ++m)
  {
    if (objc_msgSend(v2, "supportsFamily:", m + 5001))
      *(_QWORD *)(v15 + 56) |= (1 << (m + 1));
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(objc_msgSend(v2, "acceleratorPort"), CFSTR("GPUConfigurationVariable"), 0, 0);
  objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("num_cores"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 80) = objc_msgSend(v23, "unsignedIntValue");

  objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("num_mgpus"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 84) = objc_msgSend(v24, "unsignedIntValue");

  objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("num_gps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 88) = objc_msgSend(v25, "unsignedIntValue");

  objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("num_frags"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 92) = objc_msgSend(v26, "unsignedIntValue");

  objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("omu_eval_window"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("omu_eval_window"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v15 + 96) = objc_msgSend(v28, "unsignedIntValue");

  }
  else
  {
    *(_DWORD *)(v15 + 96) = 2048;
  }
  objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("core_mask_list"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = v14 + v13 + 624;
  do
  {
    if (objc_msgSend(v29, "count") <= v30)
    {
      *(_QWORD *)(v31 + 8 * v30) = 0;
    }
    else
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v31 + 8 * v30) = objc_msgSend(v32, "unsignedLongLongValue");

    }
    ++v30;
  }
  while (v30 != 64);
  objc_msgSend(v2, "targetDeviceArchitecture");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v15 + 12) = objc_msgSend(v33, "versionCombined");

  objc_msgSend(v2, "targetDeviceArchitecture");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v15 + 16) = objc_msgSend(v34, "driverVersion");

  *(_QWORD *)(v15 + 24) = objc_msgSend(v2, "sharedMemorySize");
  *(_QWORD *)(v15 + 32) = objc_msgSend(v2, "dedicatedMemorySize");
  *(_DWORD *)(v15 + 8) = v12;

  v35 = 0;
  v36 = *(_QWORD *)(a1 + 32) + 536 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536);
  do
  {
    v48 = 0;
    memset(v47, 0, sizeof(v47));
    MTLPixelFormatGetInfoForDevice();
    if ((BYTE8(v47[0]) & 1) != 0)
      *(_BYTE *)(v36 + v35) = 1;
    ++v35;
  }
  while (v35 != 4096);
  v37 = *(_QWORD *)(a1 + 32) + 544 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
  *(_BYTE *)(v37 + 4) = objc_msgSend(v2, "isFloat32FilteringSupported");
  *(_BYTE *)(v37 + 5) = objc_msgSend(v2, "isMsaa32bSupported");
  *(_DWORD *)v37 = objc_msgSend(v2, "readWriteTextureSupport");
  v38 = (_BYTE *)(*(_QWORD *)(a1 + 32) + 552 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
  v38[4] = objc_msgSend(v2, "isAnisoSampleFixSupported");
  v38[5] = objc_msgSend(v2, "isClampToHalfBorderSupported");
  v38[6] = objc_msgSend(v2, "isCustomBorderColorSupported");
  if ((objc_msgSend(v2, "areProgrammableSamplePositionsSupported") & 1) != 0)
  {
    if (objc_msgSend(v2, "supportsTextureSampleCount:", 1))
    {
      v39 = v38 + 8;
      v40 = v2;
      v41 = 1;
    }
    else if (objc_msgSend(v2, "supportsTextureSampleCount:", 2))
    {
      v39 = v38 + 16;
      v40 = v2;
      v41 = 2;
    }
    else if (objc_msgSend(v2, "supportsTextureSampleCount:", 4))
    {
      v39 = v38 + 32;
      v40 = v2;
      v41 = 4;
    }
    else if (objc_msgSend(v2, "supportsTextureSampleCount:", 8))
    {
      v39 = v38 + 64;
      v40 = v2;
      v41 = 8;
    }
    else if (objc_msgSend(v2, "supportsTextureSampleCount:", 16))
    {
      v39 = v38 + 128;
      v40 = v2;
      v41 = 16;
    }
    else
    {
      if (!objc_msgSend(v2, "supportsTextureSampleCount:", 32))
        goto LABEL_43;
      v39 = v38 + 256;
      v40 = v2;
      v41 = 32;
    }
    objc_msgSend(v40, "getDefaultSamplePositions:count:", v39, v41);
    ++v38[7];
  }
LABEL_43:
  v42 = *(_QWORD *)(a1 + 32) + 560 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560);
  *(_BYTE *)(v42 + 12) = objc_msgSend(v2, "isRTZRoundingSupported");
  *(_DWORD *)v42 = objc_msgSend(v2, "doubleFPConfig");
  *(_DWORD *)(v42 + 4) = objc_msgSend(v2, "halfFPConfig");
  *(_DWORD *)(v42 + 8) = objc_msgSend(v2, "singleFPConfig");
  v43 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 568 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));
  *v43 = objc_msgSend(v2, "maxFramebufferStorageBits");
  v43[1] = objc_msgSend(v2, "linearTextureArrayAlignmentBytes");
  v43[2] = objc_msgSend(v2, "linearTextureArrayAlignmentSlice");
  v43[3] = objc_msgSend(v2, "maxTileBuffers");
  v43[4] = objc_msgSend(v2, "maxTileTextures");
  v43[5] = objc_msgSend(v2, "maxTileSamplers");
  v43[6] = objc_msgSend(v2, "maxTileInlineDataSize");
  v43[7] = objc_msgSend(v2, "minTilePixels");
  v43[8] = objc_msgSend(v2, "maxColorAttachments");
  v43[9] = objc_msgSend(v2, "maxVertexAttributes");
  v43[10] = objc_msgSend(v2, "maxVertexBuffers");
  v43[11] = objc_msgSend(v2, "maxVertexTextures");
  v43[12] = objc_msgSend(v2, "maxVertexSamplers");
  v43[13] = objc_msgSend(v2, "maxVertexInlineDataSize");
  v43[14] = objc_msgSend(v2, "maxInterpolants");
  v43[15] = objc_msgSend(v2, "maxFragmentBuffers");
  v43[16] = objc_msgSend(v2, "maxFragmentTextures");
  v43[17] = objc_msgSend(v2, "maxFragmentSamplers");
  v43[18] = objc_msgSend(v2, "maxFragmentInlineDataSize");
  v43[19] = objc_msgSend(v2, "maxComputeBuffers");
  v43[20] = objc_msgSend(v2, "maxComputeTextures");
  v43[21] = objc_msgSend(v2, "maxComputeSamplers");
  v43[22] = objc_msgSend(v2, "maxComputeInlineDataSize");
  v43[23] = objc_msgSend(v2, "maxComputeLocalMemorySizes");
  v43[24] = objc_msgSend(v2, "maxTotalComputeThreadsPerThreadgroup");
  v43[25] = objc_msgSend(v2, "maxComputeThreadgroupMemory");
  objc_msgSend(v2, "maxLineWidth");
  v43[26] = (unint64_t)v44;
  objc_msgSend(v2, "maxPointSize");
  v43[27] = (unint64_t)v45;
  v43[28] = objc_msgSend(v2, "maxVisibilityQueryOffset");
  v43[29] = objc_msgSend(v2, "maxBufferLength");
  v43[30] = objc_msgSend(v2, "minConstantBufferAlignmentBytes");
  v43[31] = objc_msgSend(v2, "minBufferNoCopyAlignmentBytes");
  v43[32] = objc_msgSend(v2, "maxTextureWidth1D");
  v43[33] = objc_msgSend(v2, "maxTextureWidth2D");
  v43[34] = objc_msgSend(v2, "maxTextureHeight2D");
  v43[35] = objc_msgSend(v2, "maxTextureWidth3D");
  v43[36] = objc_msgSend(v2, "maxTextureHeight3D");
  v43[37] = objc_msgSend(v2, "maxTextureDepth3D");
  v43[38] = objc_msgSend(v2, "maxTextureDimensionCube");
  v43[39] = objc_msgSend(v2, "maxTextureLayers");
  v43[40] = objc_msgSend(v2, "linearTextureAlignmentBytes");
  v43[41] = objc_msgSend(v2, "iosurfaceTextureAlignmentBytes");
  v43[42] = objc_msgSend(v2, "iosurfaceReadOnlyTextureAlignmentBytes");
  v43[43] = objc_msgSend(v2, "deviceLinearTextureAlignmentBytes");
  v43[44] = objc_msgSend(v2, "deviceLinearReadOnlyTextureAlignmentBytes");
  v43[45] = objc_msgSend(v2, "maxFunctionConstantIndices");
  v43[46] = objc_msgSend(v2, "maxComputeThreadgroupMemoryAlignmentBytes");
  v43[47] = objc_msgSend(v2, "maxInterpolatedComponents");
  v43[48] = objc_msgSend(v2, "maxTessellationFactor");
  v43[49] = objc_msgSend(v2, "maxIndirectBuffers");
  v43[50] = objc_msgSend(v2, "maxIndirectTextures");
  v43[51] = objc_msgSend(v2, "maxIndirectSamplers");
  v43[52] = objc_msgSend(v2, "maxIndirectSamplersPerDevice");
  v43[53] = objc_msgSend(v2, "maxFenceInstances");
  v43[54] = objc_msgSend(v2, "maxViewportCount");
  v43[55] = objc_msgSend(v2, "maxCustomSamplePositions");
  v43[56] = objc_msgSend(v2, "maxVertexAmplificationFactor");
  v43[57] = objc_msgSend(v2, "maxVertexAmplificationCount");
  v43[58] = objc_msgSend(v2, "maxTextureBufferWidth");
  v43[59] = objc_msgSend(v2, "maxComputeAttributes");
  v43[60] = objc_msgSend(v2, "maxIOCommandsInFlight");
  v43[61] = objc_msgSend(v2, "maxPredicatedNestingDepth");
  v43[62] = objc_msgSend(v2, "maxConstantBufferArguments");
  v43[63] = objc_msgSend(v2, "maximumComputeSubstreams");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v43[64] = objc_msgSend(v2, "maxAccelerationStructureLevels");
  v46 = *(_QWORD *)(a1 + 32) + 576 + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576);
  *(_DWORD *)v46 = objc_msgSend(v2, "argumentBuffersSupport");
  *(_BYTE *)(v46 + 4) = objc_msgSend(v2, "supportsTLS");
  *(_BYTE *)(v46 + 5) = objc_msgSend(v2, "supportsGlobalVariableRelocation");
  *(_BYTE *)(v46 + 6) = objc_msgSend(v2, "supportsGlobalVariableRelocationCompute");
  *(_BYTE *)(v46 + 7) = objc_msgSend(v2, "supportsGlobalVariableRelocationRender");
  *(_BYTE *)(v46 + 8) = objc_msgSend(v2, "supportsDynamicLibraries");
  *(_BYTE *)(v46 + 9) = objc_msgSend(v2, "supportsRenderDynamicLibraries");
  *(_BYTE *)(v46 + 10) = objc_msgSend(v2, "supportsFunctionPointers");
  *(_BYTE *)(v46 + 11) = objc_msgSend(v2, "supportsFunctionPointersFromRender");
  *(_BYTE *)(v46 + 12) = objc_msgSend(v2, "areProgrammableSamplePositionsSupported");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(v46 + 13) = objc_msgSend(v2, "supportsGlobalVariableBindings");

}

@end
