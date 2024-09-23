@implementation ZN8Espresso9MPSEngine7context32network

float *___ZN8Espresso9MPSEngine7context32network_transform_pre_allocationEPNS_3netE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  float *result;
  uint64_t v5;
  uint64_t v6;
  BOOL v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  void **v21;
  unint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  int v33;
  _DWORD *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  unint64_t v42;
  int v43;
  float *v44;
  uint64_t v45;
  int v46;
  __int128 v47;
  _OWORD v48[2];
  int v49;
  unint64_t v50;
  uint64_t v51[3];

  v2 = *(_QWORD *)(a1 + 32);
  result = *(float **)a2;
  if (*(_QWORD *)(*(_QWORD *)a2 + 8) == v2
    && *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8) == v2
    && *(_QWORD *)(*(_QWORD *)(a2 + 32) + 8) == v2)
  {
    v5 = (*(uint64_t (**)(float *))(*(_QWORD *)result + 384))(result);
    v6 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a2 + 16) + 320))(*(_QWORD *)(a2 + 16));
    result = (float *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a2 + 32) + 384))(*(_QWORD *)(a2 + 32));
    if (fabsf(result[2]) < 0.000001
      && *(_DWORD *)result == 6
      && fabsf(*(float *)(v6 + 12)) < 0.000001
      && *(_DWORD *)v6 == 25)
    {
      v9 = fabsf(*(float *)(v5 + 8)) < 0.000001 && *(_DWORD *)v5 == 6;
      if (v9 && fabsf(*(float *)(v5 + 4) + 1.0) < 0.000001 && fabsf(result[1] + 1.0) < 0.000001)
      {
        *(_QWORD *)v5 = 0x3F80000000000018;
        *(float *)(v5 + 8) = -*(float *)(v6 + 8);
        v10 = *(_QWORD *)(*(_QWORD *)(a2 + 136) + 32);
        v11 = *(char **)(*(_QWORD *)(v10 + 16 * *(int *)(a2 + 120)) + 64);
        v12 = *(_QWORD *)(*(_QWORD *)(v10 + 16 * *(int *)(a2 + 128)) + 64);
        v13 = *(_QWORD *)(*(_QWORD *)(v10 + 16 * *(int *)(a2 + 124)) + 64);
        v14 = operator new(0x10uLL);
        v51[1] = (uint64_t)(v14 + 2);
        v51[2] = (uint64_t)(v14 + 2);
        *v14 = v12;
        v14[1] = v13;
        v51[0] = (uint64_t)v14;
        Espresso::merge_kernel_attributes(v11, v51);
        operator delete(v14);
        v15 = *(_QWORD *)(a2 + 136) + 96;
        v16 = *(int *)(a2 + 128);
        v51[0] = v16;
        v17 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v15, v16, v51);
        v18 = *(_QWORD *)(a2 + 136) + 96;
        v19 = *(int *)(a2 + 120);
        v50 = v19;
        v20 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v18, v19, &v50);
        if (v20 != v17)
          std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)(v20 + 3), (std::string *)v17[3], (std::string *)v17[4], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17[4] - v17[3]) >> 3));
        v21 = (void **)(a2 + 96);
        v23 = *(char **)(a2 + 104);
        v22 = *(_QWORD *)(a2 + 112);
        if ((unint64_t)v23 >= v22)
        {
          v25 = (char *)*v21;
          v26 = (v23 - (_BYTE *)*v21) >> 2;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 62)
            goto LABEL_55;
          v28 = v22 - (_QWORD)v25;
          if (v28 >> 1 > v27)
            v27 = v28 >> 1;
          v29 = (unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL;
          v30 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v29)
            v30 = v27;
          if (v30)
          {
            v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v30);
            v25 = *(char **)(a2 + 96);
            v23 = *(char **)(a2 + 104);
          }
          else
          {
            v31 = 0;
          }
          v32 = (_DWORD *)(v30 + 4 * v26);
          v22 = v30 + 4 * v31;
          *v32 = *(_DWORD *)(a2 + 124);
          v24 = (char *)(v32 + 1);
          while (v23 != v25)
          {
            v33 = *((_DWORD *)v23 - 1);
            v23 -= 4;
            *--v32 = v33;
          }
          *(_QWORD *)(a2 + 96) = v32;
          *(_QWORD *)(a2 + 104) = v24;
          *(_QWORD *)(a2 + 112) = v22;
          if (v25)
          {
            operator delete(v25);
            v22 = *(_QWORD *)(a2 + 112);
          }
        }
        else
        {
          *(_DWORD *)v23 = *(_DWORD *)(a2 + 124);
          v24 = v23 + 4;
        }
        *(_QWORD *)(a2 + 104) = v24;
        if ((unint64_t)v24 < v22)
        {
          *(_DWORD *)v24 = *(_DWORD *)(a2 + 128);
          v34 = v24 + 4;
LABEL_53:
          *(_QWORD *)(a2 + 104) = v34;
          v44 = *(float **)a2;
          v45 = *(unsigned int *)(*(_QWORD *)(a2 + 48) + 12);
          v46 = *(_DWORD *)(v5 + 32);
          v47 = *(_OWORD *)(v5 + 16);
          v48[0] = *(_OWORD *)v5;
          v48[1] = v47;
          v49 = v46;
          return (float *)(*(uint64_t (**)(float *, float *, uint64_t, _OWORD *))(*(_QWORD *)v44 + 392))(v44, v44 + 2, v45, v48);
        }
        v35 = (char *)*v21;
        v36 = (v24 - (_BYTE *)*v21) >> 2;
        v37 = v36 + 1;
        if (!((unint64_t)(v36 + 1) >> 62))
        {
          v38 = v22 - (_QWORD)v35;
          if (v38 >> 1 > v37)
            v37 = v38 >> 1;
          v29 = (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL;
          v39 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v29)
            v39 = v37;
          if (v39)
          {
            v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v39);
            v35 = *(char **)(a2 + 96);
            v24 = *(char **)(a2 + 104);
          }
          else
          {
            v40 = 0;
          }
          v41 = (_DWORD *)(v39 + 4 * v36);
          v42 = v39 + 4 * v40;
          *v41 = *(_DWORD *)(a2 + 128);
          v34 = v41 + 1;
          while (v24 != v35)
          {
            v43 = *((_DWORD *)v24 - 1);
            v24 -= 4;
            *--v41 = v43;
          }
          *(_QWORD *)(a2 + 96) = v41;
          *(_QWORD *)(a2 + 104) = v34;
          *(_QWORD *)(a2 + 112) = v42;
          if (v35)
            operator delete(v35);
          goto LABEL_53;
        }
LABEL_55:
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      }
    }
  }
  return result;
}

@end
