@implementation ZN3AGX23UserCommonShaderFactoryINS

AGXA10FamilyComputeProgram *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE36addComputePipelineFunctionsToArchiveEP28MTLComputePipelineDescriptorP18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke(uint64_t a1)
{
  uint64_t v2;
  AGXA10FamilyComputeOrFragmentOrTileProgram *v3;
  AGXA10FamilyComputeProgram *result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "vendorPrivate");
  v3 = (AGXA10FamilyComputeOrFragmentOrTileProgram *)v2;
  if (!v2)
  {
    v3 = objc_alloc_init(AGXA10FamilyComputeOrFragmentOrTileProgram);
    objc_msgSend(*(id *)(a1 + 32), "setVendorPrivate:", v3);

    result = v3->_compute;
    if (result)
      goto LABEL_3;
LABEL_5:
    result = objc_alloc_init(AGXA10FamilyComputeProgram);
    v3->_compute = result;
    goto LABEL_3;
  }
  result = *(AGXA10FamilyComputeProgram **)(v2 + 8);
  if (!result)
    goto LABEL_5;
LABEL_3:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = &result->_impl;
  return result;
}

_QWORD *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE36addComputePipelineFunctionsToArchiveEP28MTLComputePipelineDescriptorP18AGXA10FamilyDevicemP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (!a2)
  {
    v16 = v9;
    v17 = v7;
    v18 = v6;
    v12 = result;
    v13 = (_QWORD *)result[6];
    if (a5 > 3)
      v14 = 5;
    else
      v14 = qword_232D76128[a5];
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a6, *MEMORY[0x24BDD0FC8], v16, v8, v17, v18, v10, v11);
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), v14, v15);
    if (v13)
      *v13 = result;
    *(_BYTE *)(*(_QWORD *)(v12[4] + 8) + 24) = 0;
  }
  return result;
}

_QWORD *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI31MTLMeshRenderPipelineDescriptorLb1EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v5 = result[4];
  if (!a4)
  {
    if (!v5)
      return result;
    v7 = 0;
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v5 + 16))(v5, 0, 0, v7);
  }
  if (a4 > 3)
    v6 = 5;
  else
    v6 = qword_232D76128[a4];
  v8 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a5, *MEMORY[0x24BDD0FC8]);
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), v6, v8);
  if (v5)
  {
    v7 = result;
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v5 + 16))(v5, 0, 0, v7);
  }
  return result;
}

_QWORD *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI27MTLRenderPipelineDescriptorLb1EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke_3(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = result[4];
  if (a2)
  {
    if (!v6)
      return result;
    v7 = 0;
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v6 + 16))(v6, 0, 0, v7);
  }
  if (a5 > 3)
    v8 = 5;
  else
    v8 = qword_232D76128[a5];
  v9 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a6, *MEMORY[0x24BDD0FC8]);
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), v8, v9);
  if (v6)
  {
    v7 = result;
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v6 + 16))(v6, 0, 0, v7);
  }
  return result;
}

_QWORD *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI27MTLRenderPipelineDescriptorLb1EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v5 = result[4];
  if (!a4)
  {
    if (!v5)
      return result;
    v7 = 0;
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v5 + 16))(v5, 0, 0, v7);
  }
  if (a4 > 3)
    v6 = 5;
  else
    v6 = qword_232D76128[a4];
  v8 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a5, *MEMORY[0x24BDD0FC8]);
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), v6, v8);
  if (v5)
  {
    v7 = result;
    return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v5 + 16))(v5, 0, 0, v7);
  }
  return result;
}

_QWORD *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE27addVisibleFunctionToArchiveEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXA10FamilyDeviceP25AGXA10FamilyBinaryArchivePP7NSError_block_invoke(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  if (!*(_QWORD *)(a2 + 24))
  {
    v4 = result;
    v5 = (_QWORD *)result[6];
    if (a3 > 3)
      v6 = 5;
    else
      v6 = qword_232D76128[a3];
    v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a4, *MEMORY[0x24BDD0FC8]);
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), v6, v7);
    if (v5)
      *v5 = result;
    *(_BYTE *)(*(_QWORD *)(v4[4] + 8) + 24) = 0;
  }
  return result;
}

AGXA10FamilyComputeProgram *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE21createComputePipelineEP28MTLComputePipelineDescriptorP18AGXA10FamilyDevicemPP28MTLComputePipelineReflectionPP7NSErrorU13block_pointerFvPU34objcproto23MTLComputePipelineState11objc_objectSB_SE_E_block_invoke(uint64_t a1)
{
  uint64_t v2;
  AGXA10FamilyComputeOrFragmentOrTileProgram *v3;
  AGXA10FamilyComputeProgram *result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "vendorPrivate");
  v3 = (AGXA10FamilyComputeOrFragmentOrTileProgram *)v2;
  if (!v2)
  {
    v3 = objc_alloc_init(AGXA10FamilyComputeOrFragmentOrTileProgram);
    objc_msgSend(*(id *)(a1 + 32), "setVendorPrivate:", v3);

    result = v3->_compute;
    if (result)
      goto LABEL_3;
LABEL_5:
    result = objc_alloc_init(AGXA10FamilyComputeProgram);
    v3->_compute = result;
    goto LABEL_3;
  }
  result = *(AGXA10FamilyComputeProgram **)(v2 + 8);
  if (!result)
    goto LABEL_5;
LABEL_3:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = &result->_impl;
  return result;
}

_QWORD *___ZN3AGX23UserCommonShaderFactoryINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE34createGeometryStageAndLinkPipelineI31MTLMeshRenderPipelineDescriptorLb0EEEvPKNS5_28RenderPipelineDescriptorInfoEPNS1_22FragmentProgramVariantE13ReflectionKeyP18AGXA10FamilyDevicePT_mbbyP19NSMutableDictionaryP25AGXA10FamilyBinaryArchivePU27objcproto16OS_dispatch_data8NSObjectU13block_pointerFvPU33objcproto22MTLRenderPipelineState11objc_objectP27MTLRenderPipelineReflectionP7NSErrorE_block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v5 = result[8];
    if (a4 > 3)
      v6 = 5;
    else
      v6 = qword_232D76128[a4];
    v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a5, *MEMORY[0x24BDD0FC8]);
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), v6, v7);
    if (v5)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v5 + 16))(v5, 0, 0, result);
  }
  return result;
}

@end
