@implementation ZN2CI14TextureManager13append

uint64_t *___ZN2CI14TextureManager13append_to_lruEPvPNS_13source_info_tE_block_invoke(uint64_t a1)
{
  CGImage *v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *result;
  uint64_t *v10;

  v3 = (uint64_t *)(a1 + 40);
  v2 = *(CGImage **)(a1 + 40);
  v4 = *(v3 - 1);
  if (v2)
  {
    switch(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 16))
    {
      case 0:
        CI::Object::ref((uint64_t)v2);
        break;
      case 1:
        CGImageRetain(v2);
        break;
      case 2:
        CFRetain(v2);
        break;
      case 4:
        RetainSurfaceFromCache(v2);
        break;
      default:
        break;
    }
  }
  v5 = operator new(0x18uLL);
  v5[2] = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(v4 + 32);
  v6 = v4 + 32;
  *v5 = v7;
  v5[1] = v6;
  *(_QWORD *)(v7 + 8) = v5;
  *(_QWORD *)v6 = v5;
  ++*(_QWORD *)(v6 + 16);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  result = std::__tree<std::__value_type<unsigned long long,CI::ColorKernelOutputIdx>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CI::ColorKernelOutputIdx>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CI::ColorKernelOutputIdx>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t **)(v6 + 80), (unint64_t *)v3, (uint64_t)&std::piecewise_construct, &v10);
  result[5] = v8;
  return result;
}

@end
