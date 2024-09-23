@implementation ZNK23SDPAudioSettingsBuilder33createAudioSettingsForOfferAnswerENSt3

void *___ZNK23SDPAudioSettingsBuilder33createAudioSettingsForOfferAnswerENSt3__110shared_ptrI8SDPModelEES3_RK8ImsPrefs_block_invoke(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *result;
  uint64_t *v14;
  void **v15;

  result = ims::getValueFromMap<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>((uint64_t)&unk_1ED70E9C8, a2);
  if (result)
  {
    v15 = a2;
    v14 = std::__tree<std::__value_type<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&unk_1ED70E9C8, a2, (__int128 **)&v15);
    return (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v14[7])(a3, a4, a5, a6, a7);
  }
  return result;
}

void *___ZNK23SDPAudioSettingsBuilder33createAudioSettingsForOfferAnswerENSt3__110shared_ptrI8SDPModelEES3_RK8ImsPrefs_block_invoke_2(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *result;
  uint64_t *v14;
  void **v15;

  result = ims::getValueFromMap<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>((uint64_t)&unk_1ED70E9C8, a2);
  if (result)
  {
    v15 = a2;
    v14 = std::__tree<std::__value_type<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL (*)(SDPMediaAudioSettings *,SDPMediaFormatInfo &,SDPMediaFormatInfo &,BOOL,ImsPrefs const&)>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&unk_1ED70E9C8, a2, (__int128 **)&v15);
    return (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v14[7])(a3, a4, a5, a6, a7);
  }
  return result;
}

@end
