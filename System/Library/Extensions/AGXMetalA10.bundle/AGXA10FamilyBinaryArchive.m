@implementation AGXA10FamilyBinaryArchive

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MTLDevice *v9;
  void ***v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  void *v26;
  os_unfair_lock_s *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  _QWORD v35[6];
  __int128 v36;
  void ***v37;
  unint64_t v38;
  uint64_t v39;
  id *v40;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  id v52;
  __int128 v53;
  void ***v54;
  unint64_t v55;
  unint64_t v56;
  id *v57;

  v9 = -[_MTLBinaryArchive device](self, "device");
  -[_MTLBinaryArchive storeRenderPipelineDescriptor:](self, "storeRenderPipelineDescriptor:", a3);
  v10 = *(void ****)(*((_QWORD *)v9 + 101) + 5472);
  if (!a5)
  {
    if (a3)
    {
      v47 = 0;
      if (objc_msgSend(a3, "validateWithDevice:error:", v9, &v47))
        goto LABEL_7;
      v23 = (const __CFString *)objc_msgSend(v47, "localizedDescription");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = *MEMORY[0x24BDD0FC8];
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = *MEMORY[0x24BDD0FC8];
      v23 = CFSTR("pipeline descriptor is nil");
    }
    v24 = objc_msgSend(v21, "dictionaryWithObject:forKey:", v23, v22);
    v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 2, v24);
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = *MEMORY[0x24BDD0FC8];
    v11 = CFSTR("pipeline descriptor is nil");
    goto LABEL_12;
  }
  v47 = 0;
  if (!objc_msgSend(a3, "validateWithDevice:error:", v9, &v47))
  {
    v11 = (const __CFString *)objc_msgSend(v47, "localizedDescription");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = *MEMORY[0x24BDD0FC8];
LABEL_12:
    v17 = objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v13);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 2, v17);
    v19 = 0;
    *a5 = v18;
    return v19;
  }
LABEL_7:
  v46 = 0;
  v14 = operator new();
  *(_OWORD *)v14 = 0u;
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_OWORD *)(v14 + 80) = 0u;
  *(_OWORD *)(v14 + 96) = 0u;
  *(_OWORD *)(v14 + 112) = 0u;
  if ((AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::populateRenderPipelineDescriptorInfo<MTLRenderPipelineDescriptor>((uint64_t)v10, (uint64_t *)v14, a3, a4, v9, &v46) & 1) != 0)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 1;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE35addRenderPipelineFunctionsToArchiveI27MTLRenderPipelineDescriptorEEbPT_P18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke;
    v41[3] = &unk_2503FFE58;
    v41[4] = &v42;
    v41[5] = v14;
    v15 = *(os_unfair_lock_s **)(v14 + 32);
    if (v15)
    {
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE35addRenderPipelineFunctionsToArchiveI27MTLRenderPipelineDescriptorEEbPT_P18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke_2;
      v35[3] = &unk_2503FFEA8;
      v35[4] = a3;
      v35[5] = v9;
      v37 = v10;
      v38 = a4;
      *(_QWORD *)&v36 = self;
      *((_QWORD *)&v36 + 1) = v41;
      v39 = v14;
      v40 = a5;
      v16 = *(os_unfair_lock_s **)(v14 + 48);
      if (v16)
      {
        AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createMeshProgramAnalysis<MTLRenderPipelineDescriptor>(v10, a3, (uint64_t)v9, a4, v16, *(NSObject **)(v14 + 80), 0, (uint64_t)v35);
      }
      else if ((*(_BYTE *)(*((_QWORD *)v9 + 101) + 6224) & 0x80) != 0)
      {
        AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createVertexProgramAnalysis(v10, (MTLRenderPipelineDescriptor *)a3, (uint64_t)v9, a4, *(os_unfair_lock_s **)(v14 + 40), *(_QWORD *)(v14 + 72), 0, (uint64_t)v35);
      }
      else
      {
        v29 = *(void **)(v14 + 96);
        v30 = *(NSObject **)(v14 + 64);
        v47 = (id)MEMORY[0x24BDAC760];
        v48 = 3221225472;
        v49 = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE35addRenderPipelineFunctionsToArchiveI27MTLRenderPipelineDescriptorEEbPT_P18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke_3;
        v50 = &unk_2503FFE80;
        v54 = v10;
        v55 = v14;
        v51 = v9;
        v52 = a3;
        v53 = v36;
        v56 = a4;
        v57 = a5;
        AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createFragmentProgramVariant<MTLRenderPipelineDescriptor>(v10, a3, (uint64_t)v9, a4, v36, v29, v15, 0, v30, 0, (uint64_t)&v47);
      }
    }
    else if (*(_QWORD *)(v14 + 16))
    {
      v26 = *(void **)(v14 + 112);
      v27 = *(os_unfair_lock_s **)(v14 + 48);
      v28 = *(NSObject **)(v14 + 80);
      v47 = (id)MEMORY[0x24BDAC760];
      v48 = 3221225472;
      v49 = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI27MTLRenderPipelineDescriptorLb1EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke;
      v50 = &unk_2503FFEF8;
      v51 = a3;
      v52 = v9;
      v54 = v10;
      v55 = a4;
      v56 = v14;
      LOBYTE(v57) = 0;
      *(_QWORD *)&v53 = self;
      *((_QWORD *)&v53 + 1) = v41;
      AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createMeshProgramVariant<MTLRenderPipelineDescriptor>(v10, a3, (uint64_t)v9, a4, (uint64_t)self, 0, v26, v27, 0, v28, 0, (uint64_t)&v47);
    }
    else
    {
      v31 = *(void **)(v14 + 104);
      v32 = *(_QWORD *)(v14 + 40);
      v33 = *(NSObject **)(v14 + 72);
      v47 = (id)MEMORY[0x24BDAC760];
      v48 = 3221225472;
      v49 = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI27MTLRenderPipelineDescriptorLb1EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke_3;
      v50 = &unk_2503FFF20;
      v51 = v41;
      v52 = v10;
      AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createVertexProgramVariant(v10, (MTLRenderPipelineDescriptor *)a3, (uint64_t)v9, a4, (uint64_t)self, v31, v32, 0, v33, 0, 0, (uint64_t)&v47);
    }
    v19 = *((_BYTE *)v43 + 24) != 0;
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    if (a5)
      *a5 = v46;
    v20 = AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::RenderPipelineDescriptorInfo::~RenderPipelineDescriptorInfo(v14);
    MEMORY[0x234927ECC](v20, 0xA0C402B819244);
    return 0;
  }
  return v19;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[AGXA10FamilyBinaryArchive addRenderPipelineFunctionsWithDescriptor:options:error:](self, "addRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive device](self, "device", a3, a4, a5);
  -[_MTLBinaryArchive storeTileRenderPipelineDescriptor:](self, "storeTileRenderPipelineDescriptor:", a3);
  return 0;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[AGXA10FamilyBinaryArchive addTileRenderPipelineFunctionsWithDescriptor:options:error:](self, "addTileRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MTLDevice *v9;
  void ***v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  void *v26;
  os_unfair_lock_s *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  _QWORD v32[6];
  __int128 v33;
  void ***v34;
  unint64_t v35;
  uint64_t v36;
  id *v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  void *v43;
  id v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  void ***v51;
  unint64_t v52;
  unint64_t v53;
  id *v54;

  v9 = -[_MTLBinaryArchive device](self, "device");
  -[_MTLBinaryArchive storeMeshRenderPipelineDescriptor:](self, "storeMeshRenderPipelineDescriptor:", a3);
  v10 = *(void ****)(*((_QWORD *)v9 + 101) + 5472);
  if (!a5)
  {
    if (a3)
    {
      v44 = 0;
      if (objc_msgSend(a3, "validateWithDevice:error:", v9, &v44))
        goto LABEL_7;
      v23 = (const __CFString *)objc_msgSend(v44, "localizedDescription");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = *MEMORY[0x24BDD0FC8];
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = *MEMORY[0x24BDD0FC8];
      v23 = CFSTR("pipeline descriptor is nil");
    }
    v24 = objc_msgSend(v21, "dictionaryWithObject:forKey:", v23, v22);
    v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 2, v24);
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = *MEMORY[0x24BDD0FC8];
    v11 = CFSTR("pipeline descriptor is nil");
    goto LABEL_12;
  }
  v44 = 0;
  if (!objc_msgSend(a3, "validateWithDevice:error:", v9, &v44))
  {
    v11 = (const __CFString *)objc_msgSend(v44, "localizedDescription");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = *MEMORY[0x24BDD0FC8];
LABEL_12:
    v17 = objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v13);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 2, v17);
    v19 = 0;
    *a5 = v18;
    return v19;
  }
LABEL_7:
  v43 = 0;
  v14 = operator new();
  *(_OWORD *)v14 = 0u;
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_OWORD *)(v14 + 80) = 0u;
  *(_OWORD *)(v14 + 96) = 0u;
  *(_OWORD *)(v14 + 112) = 0u;
  if ((AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::populateRenderPipelineDescriptorInfo<MTLMeshRenderPipelineDescriptor>((uint64_t)v10, (uint64_t *)v14, a3, a4, v9, &v43) & 1) != 0)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE35addRenderPipelineFunctionsToArchiveI31MTLMeshRenderPipelineDescriptorEEbPT_P18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke;
    v38[3] = &unk_2503FFE58;
    v38[4] = &v39;
    v38[5] = v14;
    v15 = *(os_unfair_lock_s **)(v14 + 32);
    if (v15)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE35addRenderPipelineFunctionsToArchiveI31MTLMeshRenderPipelineDescriptorEEbPT_P18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke_2;
      v32[3] = &unk_2503FFEA8;
      v32[4] = a3;
      v32[5] = v9;
      v34 = v10;
      v35 = a4;
      *(_QWORD *)&v33 = self;
      *((_QWORD *)&v33 + 1) = v38;
      v36 = v14;
      v37 = a5;
      v16 = *(os_unfair_lock_s **)(v14 + 48);
      if (v16)
      {
        AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createMeshProgramAnalysis<MTLMeshRenderPipelineDescriptor>(v10, a3, (uint64_t)v9, a4, v16, *(NSObject **)(v14 + 80), 0, (uint64_t)v32);
      }
      else if ((*(_BYTE *)(*((_QWORD *)v9 + 101) + 6224) & 0x80) == 0)
      {
        v29 = *(void **)(v14 + 96);
        v30 = *(NSObject **)(v14 + 64);
        v44 = (id)MEMORY[0x24BDAC760];
        v45 = 3221225472;
        v46 = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE35addRenderPipelineFunctionsToArchiveI31MTLMeshRenderPipelineDescriptorEEbPT_P18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke_3;
        v47 = &unk_2503FFE80;
        v51 = v10;
        v52 = v14;
        v48 = v9;
        v49 = a3;
        v50 = v33;
        v53 = a4;
        v54 = a5;
        AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createFragmentProgramVariant<MTLMeshRenderPipelineDescriptor>(v10, a3, (uint64_t)v9, a4, v33, v29, v15, 0, v30, 0, (uint64_t)&v44);
      }
    }
    else if (*(_QWORD *)(v14 + 16))
    {
      v26 = *(void **)(v14 + 112);
      v27 = *(os_unfair_lock_s **)(v14 + 48);
      v28 = *(NSObject **)(v14 + 80);
      v44 = (id)MEMORY[0x24BDAC760];
      v45 = 3221225472;
      v46 = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI31MTLMeshRenderPipelineDescriptorLb1EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke;
      v47 = &unk_2503FFEF8;
      v48 = a3;
      v49 = v9;
      v51 = v10;
      v52 = a4;
      v53 = v14;
      LOBYTE(v54) = 0;
      *(_QWORD *)&v50 = self;
      *((_QWORD *)&v50 + 1) = v38;
      AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createMeshProgramVariant<MTLMeshRenderPipelineDescriptor>(v10, a3, (uint64_t)v9, a4, (uint64_t)self, 0, v26, v27, 0, v28, 0, (uint64_t)&v44);
    }
    v19 = *((_BYTE *)v40 + 24) != 0;
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    if (a5)
      *a5 = v43;
    v20 = AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::RenderPipelineDescriptorInfo::~RenderPipelineDescriptorInfo(v14);
    MEMORY[0x234927ECC](v20, 0xA0C402B819244);
    return 0;
  }
  return v19;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MTLDevice *v9;
  _QWORD *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  id v27;
  id v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _QWORD block[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v9 = -[_MTLBinaryArchive device](self, "device");
  -[_MTLBinaryArchive storeComputePipelineDescriptor:](self, "storeComputePipelineDescriptor:", a3);
  v10 = *(_QWORD **)(*((_QWORD *)v9 + 101) + 5472);
  if (!a5)
  {
    if (a3)
    {
      v29[0] = 0;
      if (objc_msgSend(a3, "validateWithDevice:error:", v9, v29))
        goto LABEL_7;
      v25 = (const __CFString *)objc_msgSend(v29[0], "localizedDescription");
      v23 = (void *)MEMORY[0x24BDBCE70];
      v24 = *MEMORY[0x24BDD0FC8];
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDBCE70];
      v24 = *MEMORY[0x24BDD0FC8];
      v25 = CFSTR("pipeline descriptor is nil");
    }
    v26 = objc_msgSend(v23, "dictionaryWithObject:forKey:", v25, v24);
    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 2, v26);
    return 0;
  }
  *a5 = 0;
  if (!a3)
  {
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = *MEMORY[0x24BDD0FC8];
    v11 = CFSTR("pipeline descriptor is nil");
    goto LABEL_12;
  }
  v29[0] = 0;
  if (!objc_msgSend(a3, "validateWithDevice:error:", v9, v29))
  {
    v11 = (const __CFString *)objc_msgSend(v29[0], "localizedDescription");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = *MEMORY[0x24BDD0FC8];
LABEL_12:
    v21 = objc_msgSend(v12, "dictionaryWithObject:forKey:", v11, v13);
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 2, v21);
    v20 = 0;
    *a5 = v22;
    return v20;
  }
LABEL_7:
  AGX::UserShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::loadDynamicLibrariesForFunctions(&v39, v9, objc_msgSend(a3, "computeFunction"), (void *)objc_msgSend(a3, "linkedFunctions"), (void *)objc_msgSend(a3, "preloadedLibraries"), (uint64_t)a5);
  v14 = v39;
  if (v39)
  {
    v15 = objc_msgSend(a3, "computeFunction");
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v16 = v10[2];
    v17 = (void *)MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE36addComputePipelineFunctionsToArchiveEP28MTLComputePipelineDescriptorP18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke;
    block[3] = &unk_250401140;
    block[4] = v15;
    block[5] = &v35;
    dispatch_sync(v16, block);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v18 = objc_msgSend(a3, "newSerializedComputeData");
    v19 = v36[3];
    v29[0] = v17;
    v29[1] = (id)3221225472;
    v29[2] = ___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE36addComputePipelineFunctionsToArchiveEP28MTLComputePipelineDescriptorP18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke_2;
    v29[3] = &unk_2503FFFB8;
    v29[5] = v10;
    v29[6] = a5;
    v29[4] = &v30;
    AGX::UserCommonShaderFactory<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createComputeProgramVariant((id **)v10, a3, (uint64_t)v9, a4, (uint64_t)self, v14, v19, v18, 0, (uint64_t)v29);
    if (v18)
      dispatch_release(v18);
    v20 = *((_BYTE *)v31 + 24) != 0;
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[AGXA10FamilyBinaryArchive addComputePipelineFunctionsWithDescriptor:options:error:](self, "addComputePipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

@end
