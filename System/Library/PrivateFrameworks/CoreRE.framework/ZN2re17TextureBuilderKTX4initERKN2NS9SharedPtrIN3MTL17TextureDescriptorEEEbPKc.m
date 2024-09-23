@implementation ZN2re17TextureBuilderKTX4initERKN2NS9SharedPtrIN3MTL17TextureDescriptorEEEbPKc

re *___ZN2re17TextureBuilderKTX4initERKN2NS9SharedPtrIN3MTL17TextureDescriptorEEEbPKc_block_invoke(uint64_t a1)
{
  id **v2;
  id *v3;
  id v4;
  id v5;
  re *isValid;
  re *v7;
  const char *v8;
  NSObject *v9;
  uint64_t v11;
  id v12;
  char v13;
  uint8_t buf[4];
  _BYTE v15[84];
  unsigned int v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(id ***)(a1 + 32);
  v3 = (id *)(v2 + 19);
  if (*(_BYTE *)(a1 + 56))
    re::mtl::Device::makeSharedTexture(**(id **)(a1 + 40), *v2, &v12);
  else
    re::mtl::Device::makeTexture(**(id **)(a1 + 40), *v2, &v12);
  buf[0] = 0;
  *(_QWORD *)&v15[4] = v12;
  v16 = 0;
  v17[0] = 0;
  *((_BYTE *)v2 + 56) = 0;
  std::__variant_detail::__assignment<std::__variant_detail::__traits<NS::SharedPtr<MTL::Texture>,re::CPUTexture>>::__generic_assign[abi:nn180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<NS::SharedPtr<MTL::Texture>,re::CPUTexture>,(std::__variant_detail::_Trait)1>>((uint64_t)(v2 + 8), (uint64_t)&v15[4]);
  if (v3 != v17)
  {
    v4 = v17[0];
    v17[0] = 0;
    v5 = *v3;
    *v3 = v4;

  }
  if (v16 != -1)
    ((void (*)(char *, _BYTE *))*(&__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8nn180100IZNS0_6__dtorINS0_8__traitsIJN2NS9SharedPtrIN3MTL7TextureEEEN2re10CPUTextureEEEELNS0_6_TraitE1EE9__destroyB8nn180100EvEUlRT_E_JRSF_EEEDcOSG_DpOT0____fmatrix_1
                                           + v16))(&v13, &v15[4]);
  v16 = -1;
  if (v12)

  isValid = (re *)re::TextureData::isValid((re::TextureData *)(v2 + 7));
  v7 = isValid;
  if ((isValid & 1) != 0)
  {
    v8 = *(const char **)(a1 + 48);
    if (v8 && *v8)
      re::TextureData::setLabel((re::TextureData *)(v2 + 7), v8);
  }
  else
  {
    v9 = *re::pipelineLogObjects(isValid);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v15 = v11;
      _os_log_fault_impl(&dword_224FE9000, v9, OS_LOG_TYPE_FAULT, "Failed to create texture '%s' from KTX", buf, 0xCu);
    }
  }
  return v7;
}

@end
