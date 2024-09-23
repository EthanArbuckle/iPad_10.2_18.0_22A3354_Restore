uint64_t *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(uint64_t a1, unint64_t a2, int a3)
{
  uint8x8_t v3;
  unint64_t v4;
  uint64_t **v5;
  uint64_t *result;
  unint64_t v7;

  if (!a2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a3;
    if (a3 >= a2)
      v4 = a3 % a2;
  }
  else
  {
    v4 = (a2 - 1) & a3;
  }
  v5 = *(uint64_t ***)(a1 + 8 * v4);
  if (!v5)
    return 0;
  for (result = *v5; result; result = (uint64_t *)*result)
  {
    v7 = result[1];
    if (v7 == a3)
    {
      if (*((_DWORD *)result + 4) == a3)
        return result;
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= a2)
          v7 %= a2;
      }
      else
      {
        v7 &= a2 - 1;
      }
      if (v7 != v4)
        return 0;
    }
  }
  return result;
}

uint64_t marrs::mrr::mr::findUSONodeIndex(uint64_t *a1, uint64_t *a2, int a3, int a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[2];
  int v9;

  memset(v8, 0, sizeof(v8));
  v9 = 1065353216;
  if (a2 == a1)
  {
LABEL_8:
    v6 = 0xFFFFFFFFLL;
  }
  else
  {
    v4 = a2 - a1;
    if (v4 <= 1)
      v4 = 1;
    while (1)
    {
      v5 = *a1;
      if (*(_DWORD *)(*(_QWORD *)(*a1 + 8) + 20) == a4 && (a3 == -1 || *(_DWORD *)(v5 + 16) == a3))
        break;
      ++a1;
      if (!--v4)
        goto LABEL_8;
    }
    v6 = *(unsigned int *)(v5 + 20);
  }
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)v8);
  return v6;
}

uint64_t marrs::mrr::mr::mapUserEntityHomeToMRREntityType(siri::ontology::oname::graph::ontology_init *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  size_t v25;
  uint64_t v26;
  uint64_t *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unsigned __int8 *v32;
  uint64_t v33;
  uint64_t result;
  const void *v35;
  size_t v36;
  size_t v37;
  int v38;
  BOOL v39;
  uint64_t *i;
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *__s2;
  uint64_t v47;
  uint8_t buf[16];

  v4 = siri::ontology::oname::graph::ontology_init::Argument_names(a1);
  v5 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_DWORD *)(v4 + 36));
  if (!v5)
  {
    MRRLoggerForCategory(2);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v41, OS_LOG_TYPE_DEBUG, "HomeAutomation entity parsing could not find names node descendant. Returning undefined MRR EntityType", buf, 2u);
    }

    return 30;
  }
  v6 = (uint64_t *)*((_QWORD *)a1 + 7);
  v7 = (uint64_t *)*((_QWORD *)a1 + 8);
  if (v6 == v7)
    return 30;
  v8 = *((_DWORD *)v5 + 5);
  if (byte_1ED7B1ACF >= 0)
    v9 = byte_1ED7B1ACF;
  else
    v9 = unk_1ED7B1AC0;
  if (byte_1ED7B1ACF >= 0)
    v10 = &marrs::mrr::mr::homeKitEntityTypeString;
  else
    v10 = (uint64_t *)marrs::mrr::mr::homeKitEntityTypeString;
  v11 = &marrs::mrr::mr::homeAutomationAccessoryNameString;
  if (byte_1ED7B1B17 >= 0)
    v12 = byte_1ED7B1B17;
  else
    v12 = unk_1ED7B1B08;
  if (byte_1ED7B1B17 < 0)
    v11 = (uint64_t *)marrs::mrr::mr::homeAutomationAccessoryNameString;
  __s2 = v11;
  v13 = &marrs::mrr::mr::homeAutomationServiceNameString;
  v14 = byte_1ED7B1AFF;
  if (byte_1ED7B1AFF < 0)
    v14 = unk_1ED7B1AF0;
  v47 = v14;
  if (byte_1ED7B1AFF < 0)
    v13 = (uint64_t *)marrs::mrr::mr::homeAutomationServiceNameString;
  v44 = v13;
  if (byte_1ED7B1AE7 >= 0)
    v15 = byte_1ED7B1AE7;
  else
    v15 = unk_1ED7B1AD8;
  if (byte_1ED7B1AE7 >= 0)
    v16 = &marrs::mrr::mr::homeAutomationRoomString;
  else
    v16 = (uint64_t *)marrs::mrr::mr::homeAutomationRoomString;
  while (1)
  {
    v17 = *v6;
    if (*(_DWORD *)(*v6 + 48) != v8)
      goto LABEL_70;
    v18 = *(_QWORD *)(v17 + 16);
    if (!v18)
      goto LABEL_70;
    v19 = *(unsigned __int8 **)(v18 + 8);
    if (!v19)
      goto LABEL_70;
    v20 = v19[23];
    v21 = (v20 & 0x80u) == 0 ? v19[23] : *((_QWORD *)v19 + 1);
    if (v21 != v9)
      goto LABEL_70;
    if ((v20 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v19, v10, *((_QWORD *)v19 + 1)))
        goto LABEL_70;
    }
    else if (v19[23])
    {
      v22 = v10;
      while (*v19 == *(unsigned __int8 *)v22)
      {
        ++v19;
        v22 = (uint64_t *)((char *)v22 + 1);
        if (!--v20)
          goto LABEL_38;
      }
      goto LABEL_70;
    }
LABEL_38:
    v23 = *(unsigned __int8 **)(v17 + 32);
    if (!v23)
      goto LABEL_70;
    v45 = v15;
    v24 = v23[23];
    v25 = *((_QWORD *)v23 + 1);
    if ((v24 & 0x80u) == 0)
      v26 = v23[23];
    else
      v26 = *((_QWORD *)v23 + 1);
    if (v26 != v12)
      goto LABEL_49;
    if ((v24 & 0x80) == 0)
    {
      if (!v23[23])
        return 20;
      v27 = __s2;
      v28 = v23;
      v29 = v23[23];
      while (*v28 == *(unsigned __int8 *)v27)
      {
        ++v28;
        v27 = (uint64_t *)((char *)v27 + 1);
        if (!--v29)
          return 20;
      }
LABEL_49:
      v42 = v10;
      v43 = v16;
      v30 = v12;
      if (v26 != v47)
        goto LABEL_61;
      if ((v24 & 0x80) == 0)
      {
        if (!v23[23])
          return 20;
        v31 = v44;
        v32 = v23;
        v33 = v23[23];
        while (*v32 == *(unsigned __int8 *)v31)
        {
          ++v32;
          v31 = (uint64_t *)((char *)v31 + 1);
          result = 20;
          if (!--v33)
            return result;
        }
        goto LABEL_61;
      }
      v35 = *(const void **)v23;
LABEL_60:
      v37 = v25;
      v38 = memcmp(v35, v44, v25);
      v25 = v37;
      if (!v38)
        return 20;
      goto LABEL_61;
    }
    v42 = v10;
    v43 = v16;
    v30 = v12;
    v35 = *(const void **)v23;
    v36 = *((_QWORD *)v23 + 1);
    if (!memcmp(*(const void **)v23, __s2, v25))
      return 20;
    v25 = v36;
    if (v36 == v47)
      goto LABEL_60;
LABEL_61:
    v39 = v26 == v45;
    v15 = v45;
    v12 = v30;
    v10 = v42;
    v16 = v43;
    if (!v39)
      goto LABEL_70;
    if ((v24 & 0x80) != 0)
      break;
    if (!(_DWORD)v24)
      return 21;
    for (i = v43; *v23 == *(unsigned __int8 *)i; i = (uint64_t *)((char *)i + 1))
    {
      ++v23;
      if (!--v24)
        return 21;
    }
LABEL_70:
    if (++v6 == v7)
      return 30;
  }
  if (memcmp(*(const void **)v23, v43, v25))
    goto LABEL_70;
  return 21;
}

uint64_t marrs::mrr::mr::mapCommonPersonToEligibleType(unint64_t *a1)
{
  uint64_t v2;

  v2 = siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress((siri::ontology::oname::graph::ontology_init *)a1);
  if (std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a1, a1[1], *(_DWORD *)(v2 + 36)))
  {
    return 30;
  }
  else
  {
    return 14;
  }
}

std::string *marrs::mrr::mr::getStringNodeValueNluGraph(std::string *this, const sirinluexternal::UsoGraph *a2, int a3, int a4, int a5)
{
  std::string *result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  const std::string *v15;

  result = (std::string *)std::string::basic_string[abi:ne180100]<0>(this, "");
  if (a3 != -1
    || (result = (std::string *)marrs::mrr::mr::findUSONodeIndex(*((uint64_t **)a2 + 4), *((uint64_t **)a2 + 5), a4, a5),
        a3 = (int)result,
        (_DWORD)result != -1))
  {
    v11 = *((_QWORD *)a2 + 10);
    if (a3 >= (unint64_t)((*((_QWORD *)a2 + 11) - v11) >> 3))
      std::vector<marrs::mrr::mr::MRREntity>::__throw_out_of_range[abi:ne180100]();
    v12 = *(_QWORD *)(v11 + 8 * a3);
    v13 = *(_DWORD *)(v12 + 72);
    result = (std::string *)siri::ontology::oname::graph::ontology_init::primitive_String((siri::ontology::oname::graph::ontology_init *)result);
    if (v13 == HIDWORD(result[1].__r_.__value_.__r.__words[1]))
    {
      v14 = *(_QWORD *)(v12 + 48);
      if (v14)
      {
        v15 = *(const std::string **)(v14 + 8);
        if (v15)
          return std::string::operator=(this, v15);
      }
    }
  }
  return result;
}

void sub_1C289A43C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t marrs::mrr::mr::mapSearchObjectNodeToMRREntityType(siri::ontology::oname::graph::ontology_init *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _BOOL4 v10;
  uint64_t *v11;
  uint64_t v12;
  std::string __p;

  v4 = siri::ontology::oname::graph::ontology_init::Argument_type(a1);
  v5 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_DWORD *)(v4 + 36));
  if (!v5)
    return 25;
  v6 = *((_DWORD *)v5 + 5);
  v7 = siri::ontology::oname::graph::ontology_init::Argument_name((siri::ontology::oname::graph::ontology_init *)v5);
  marrs::mrr::mr::getStringNodeValueNluGraph(&__p, a1, -1, v6, *(_DWORD *)(v7 + 36));
  v8 = qword_1ED7B1CA0;
  if (!qword_1ED7B1CA0)
    goto LABEL_9;
  v9 = &qword_1ED7B1CA0;
  do
  {
    v10 = std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((_QWORD *)(v8 + 32), &__p);
    v11 = (uint64_t *)(v8 + 8);
    if (!v10)
    {
      v11 = (uint64_t *)v8;
      v9 = (uint64_t *)v8;
    }
    v8 = *v11;
  }
  while (*v11);
  if (v9 == &qword_1ED7B1CA0
    || std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(&__p, v9 + 4))
  {
LABEL_9:
    v12 = 25;
  }
  else
  {
    v12 = *((unsigned int *)v9 + 14);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v12;
}

uint64_t marrs::mrr::mr::mapNodeIdToMRREntityType(siri::ontology::oname::graph::ontology_init *a1, siri::ontology::oname::graph::ontology_init *a2, unint64_t *a3)
{
  int v5;
  siri::ontology::oname::graph::ontology_init *v6;
  siri::ontology::oname::graph::ontology_init *v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  siri::ontology::oname::graph::ontology_init *v12;
  siri::ontology::oname::graph::ontology_init *v13;
  siri::ontology::oname::graph::ontology_init *v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *v16;
  siri::ontology::oname::graph::ontology_init *v17;
  siri::ontology::oname::graph::ontology_init *v18;
  siri::ontology::oname::graph::ontology_init *v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  siri::ontology::oname::graph::ontology_init *v22;
  siri::ontology::oname::graph::ontology_init *v23;
  siri::ontology::oname::graph::ontology_init *v24;
  siri::ontology::oname::graph::ontology_init *v25;
  siri::ontology::oname::graph::ontology_init *v26;

  v5 = (int)a1;
  v6 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_EmailAddress(a1);
  if (*((_DWORD *)v6 + 9) == v5)
    return 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PhoneNumber(v6);
  if (*((_DWORD *)v8 + 9) == v5)
    return 1;
  v9 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_PostalAddress(v8);
  if (*((_DWORD *)v9 + 9) == v5)
    return 2;
  v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Uri(v9);
  if (*((_DWORD *)v10 + 9) == v5)
    return 3;
  v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_LocalisedString(v10);
  if (*((_DWORD *)v11 + 9) == v5)
    return 4;
  v12 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_AppEntity(v11);
  if (*((_DWORD *)v12 + 9) == v5)
    return 5;
  v13 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Photo(v12);
  if (*((_DWORD *)v13 + 9) == v5)
    return 6;
  v14 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_SearchObject(v13);
  if (*((_DWORD *)v14 + 9) == v5)
    return marrs::mrr::mr::mapSearchObjectNodeToMRREntityType(a2, (uint64_t)a3);
  v15 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_MediaItem(v14);
  if (*((_DWORD *)v15 + 9) == v5)
    return marrs::mrr::mr::mapMediaNodeToMRREntityType((uint64_t)a2, (uint64_t)a3);
  v16 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_UserEntity(v15);
  if (*((_DWORD *)v16 + 9) == v5)
    return marrs::mrr::mr::mapUserEntityHomeToMRREntityType(a2, (uint64_t)a3);
  v17 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Setting(v16);
  if (*((_DWORD *)v17 + 9) == v5)
    return 22;
  v18 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Group(v17);
  if (*((_DWORD *)v18 + 9) == v5)
    return 11;
  v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_LocalBusiness(v18);
  if (*((_DWORD *)v19 + 9) == v5)
    return 12;
  v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Notification(v19);
  if (*((_DWORD *)v20 + 9) == v5)
    return 13;
  v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Person(v20);
  if (*((_DWORD *)v21 + 9) == v5)
    return marrs::mrr::mr::mapCommonPersonToEligibleType(a3);
  v22 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Announcement(v21);
  if (*((_DWORD *)v22 + 9) == v5)
    return 15;
  v23 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_DateTime(v22);
  if (*((_DWORD *)v23 + 9) == v5)
    return 16;
  v24 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Alarm(v23);
  if (*((_DWORD *)v24 + 9) == v5)
    return 17;
  v25 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_Timer(v24);
  if (*((_DWORD *)v25 + 9) == v5)
    return 18;
  v26 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::common_App(v25);
  if (*((_DWORD *)v26 + 9) == v5)
    return 23;
  if (*(_DWORD *)(siri::ontology::oname::graph::ontology_init::common_Window(v26) + 36) == v5)
    return 24;
  return 30;
}

void marrs::mrr::mr::getEntityDescendants(uint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint8x8_t v14;
  void **v15;
  _QWORD *v16;
  unint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  int8x8_t prime;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint8x8_t v29;
  unint64_t v30;
  uint8x8_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  void *v38;
  _QWORD *v39;

  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_DWORD *)a1 + 8) = 1065353216;
  if (a3 != -1)
  {
    v5 = *(_QWORD *)(a2 + 32);
    v4 = *(_QWORD *)(a2 + 40);
    if (v4 != v5)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v39 = a1 + 2;
      while (1)
      {
        v11 = *(_QWORD *)(v5 + 8 * v10);
        if (*(_DWORD *)(v11 + 16) == a3)
          break;
LABEL_78:
        if (++v10 >= (unint64_t)((v4 - v5) >> 3))
          return;
      }
      v12 = *(_DWORD *)(v11 + 20);
      v13 = *(_DWORD *)(*(_QWORD *)(v11 + 8) + 20);
      if (v8)
      {
        v14 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
        v14.i16[0] = vaddlv_u8(v14);
        if (v14.u32[0] > 1uLL)
        {
          v3 = v13;
          if (v8 <= v13)
            v3 = v13 % v8;
        }
        else
        {
          v3 = (v8 - 1) & v13;
        }
        v15 = *(void ***)(*a1 + 8 * v3);
        if (v15)
        {
          v16 = *v15;
          if (*v15)
          {
            do
            {
              v17 = v16[1];
              if (v17 == v13)
              {
                if (*((_DWORD *)v16 + 4) == v13)
                  goto LABEL_77;
              }
              else
              {
                if (v14.u32[0] > 1uLL)
                {
                  if (v17 >= v8)
                    v17 %= v8;
                }
                else
                {
                  v17 &= v8 - 1;
                }
                if (v17 != v3)
                  break;
              }
              v16 = (_QWORD *)*v16;
            }
            while (v16);
          }
        }
      }
      v16 = operator new(0x18uLL);
      *v16 = 0;
      v16[1] = v13;
      *((_DWORD *)v16 + 4) = v13;
      *((_DWORD *)v16 + 5) = 0;
      v18 = (float)(unint64_t)(v9 + 1);
      v19 = *((float *)a1 + 8);
      if (v8 && (float)(v19 * (float)v8) >= v18)
      {
LABEL_67:
        v35 = *a1;
        v36 = *(_QWORD **)(*a1 + 8 * v3);
        if (v36)
        {
          *v16 = *v36;
        }
        else
        {
          *v16 = *v39;
          *v39 = v16;
          *(_QWORD *)(v35 + 8 * v3) = v39;
          if (!*v16)
            goto LABEL_76;
          v37 = *(_QWORD *)(*v16 + 8);
          if ((v8 & (v8 - 1)) != 0)
          {
            if (v37 >= v8)
              v37 %= v8;
          }
          else
          {
            v37 &= v8 - 1;
          }
          v36 = (_QWORD *)(*a1 + 8 * v37);
        }
        *v36 = v16;
LABEL_76:
        v9 = a1[3] + 1;
        a1[3] = v9;
        v5 = *(_QWORD *)(a2 + 32);
        v4 = *(_QWORD *)(a2 + 40);
LABEL_77:
        *((_DWORD *)v16 + 5) = v12;
        goto LABEL_78;
      }
      v20 = (v8 & (v8 - 1)) != 0;
      if (v8 < 3)
        v20 = 1;
      v21 = v20 | (2 * v8);
      v22 = vcvtps_u32_f32(v18 / v19);
      if (v21 <= v22)
        prime = (int8x8_t)v22;
      else
        prime = (int8x8_t)v21;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v8 = a1[1];
      }
      if (*(_QWORD *)&prime > v8)
        goto LABEL_33;
      if (*(_QWORD *)&prime < v8)
      {
        v30 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
        if (v8 < 3 || (v31 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
        {
          v30 = std::__next_prime(v30);
        }
        else
        {
          v32 = 1 << -(char)__clz(v30 - 1);
          if (v30 >= 2)
            v30 = v32;
        }
        if (*(_QWORD *)&prime <= v30)
          prime = (int8x8_t)v30;
        if (*(_QWORD *)&prime >= v8)
        {
          v8 = a1[1];
        }
        else
        {
          if (prime)
          {
LABEL_33:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v24 = operator new(8 * *(_QWORD *)&prime);
            v25 = (void *)*a1;
            *a1 = (uint64_t)v24;
            if (v25)
              operator delete(v25);
            v26 = 0;
            a1[1] = (uint64_t)prime;
            do
              *(_QWORD *)(*a1 + 8 * v26++) = 0;
            while (*(_QWORD *)&prime != v26);
            v27 = (_QWORD *)*v39;
            if (*v39)
            {
              v28 = v27[1];
              v29 = (uint8x8_t)vcnt_s8(prime);
              v29.i16[0] = vaddlv_u8(v29);
              if (v29.u32[0] > 1uLL)
              {
                if (v28 >= *(_QWORD *)&prime)
                  v28 %= *(_QWORD *)&prime;
              }
              else
              {
                v28 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*a1 + 8 * v28) = v39;
              v33 = (_QWORD *)*v27;
              if (*v27)
              {
                do
                {
                  v34 = v33[1];
                  if (v29.u32[0] > 1uLL)
                  {
                    if (v34 >= *(_QWORD *)&prime)
                      v34 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v34 &= *(_QWORD *)&prime - 1;
                  }
                  if (v34 != v28)
                  {
                    if (!*(_QWORD *)(*a1 + 8 * v34))
                    {
                      *(_QWORD *)(*a1 + 8 * v34) = v27;
                      goto LABEL_58;
                    }
                    *v27 = *v33;
                    *v33 = **(_QWORD **)(*a1 + 8 * v34);
                    **(_QWORD **)(*a1 + 8 * v34) = v33;
                    v33 = v27;
                  }
                  v34 = v28;
LABEL_58:
                  v27 = v33;
                  v33 = (_QWORD *)*v33;
                  v28 = v34;
                }
                while (v33);
              }
            }
            v8 = (unint64_t)prime;
            goto LABEL_62;
          }
          v38 = (void *)*a1;
          *a1 = 0;
          if (v38)
            operator delete(v38);
          v8 = 0;
          a1[1] = 0;
        }
      }
LABEL_62:
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v8 <= v13)
          v3 = v13 % v8;
        else
          v3 = v13;
      }
      else
      {
        v3 = (v8 - 1) & v13;
      }
      goto LABEL_67;
    }
  }
}

void sub_1C289ABF0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  operator delete(v2);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void marrs::mrr::mr::getPostalAddressEntityValueNluGraph(std::string *a1, const sirinluexternal::UsoGraph *a2, uint64_t *a3)
{
  NSObject *v6;
  siri::ontology::oname::graph::ontology_init *v7;
  uint64_t v8;
  uint64_t *v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  int v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  std::string::size_type size;
  size_t v24;
  std::string *p_p;
  std::string *v26;
  std::string *v27;
  std::string::size_type v28;
  int v29;
  std::string::size_type v30;
  size_t v31;
  std::string *v32;
  std::string *p_buf;
  std::string *v34;
  std::string::size_type v35;
  int v36;
  std::string::size_type v37;
  size_t v38;
  std::string *v39;
  std::string *v40;
  std::string *v41;
  std::string::size_type v42;
  int v43;
  size_t v44;
  std::string *v45;
  std::string *v46;
  std::string *v47;
  std::string::size_type v48;
  uint64_t *v49;
  std::string::size_type v50;
  std::string *v51;
  std::string::size_type v52;
  uint64_t *v53;
  std::string __p;
  std::string v55;
  std::string v56;
  std::string v57;
  std::string v58;
  std::string buf;

  MRRLoggerForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C281A000, v6, OS_LOG_TYPE_INFO, "Calling postal address optimized parser", (uint8_t *)&buf, 2u);
  }

  if (!a3[3])
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "");
    return;
  }
  v8 = siri::ontology::oname::graph::ontology_init::Argument_value(v7);
  v9 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a3, a3[1], *(_DWORD *)(v8 + 36));
  if (v9)
  {
    marrs::mrr::mr::getStringNodeValueNluGraph(a1, a2, *((_DWORD *)v9 + 5), -1, -1);
    return;
  }
  memset(&buf, 0, sizeof(buf));
  memset(&v58, 0, sizeof(v58));
  memset(&v57, 0, sizeof(v57));
  memset(&v56, 0, sizeof(v56));
  memset(&v55, 0, sizeof(v55));
  v10 = (siri::ontology::oname::graph::ontology_init *)std::string::basic_string[abi:ne180100]<0>(a1, "");
  v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_name(v10);
  v12 = *((_DWORD *)v11 + 9);
  v13 = siri::ontology::oname::graph::ontology_init::Argument_city(v11);
  v14 = (int *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a3, a3[1], *(_DWORD *)(v13 + 36));
  v15 = siri::ontology::oname::graph::ontology_init::Argument_province((siri::ontology::oname::graph::ontology_init *)v14);
  v16 = (int *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a3, a3[1], *(_DWORD *)(v15 + 36));
  v17 = siri::ontology::oname::graph::ontology_init::Argument_street((siri::ontology::oname::graph::ontology_init *)v16);
  v18 = (int *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a3, a3[1], *(_DWORD *)(v17 + 36));
  v19 = siri::ontology::oname::graph::ontology_init::Argument_country((siri::ontology::oname::graph::ontology_init *)v18);
  v53 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a3, a3[1], *(_DWORD *)(v19 + 36));
  v20 = siri::ontology::oname::graph::ontology_init::Argument_postalCode((siri::ontology::oname::graph::ontology_init *)v53);
  v21 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(*a3, a3[1], *(_DWORD *)(v20 + 36));
  if (!v18)
  {
    v22 = 0;
    goto LABEL_32;
  }
  marrs::mrr::mr::getStringNodeValueNluGraph(&__p, a2, -1, v18[5], v12);
  v56 = __p;
  v22 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    size = v56.__r_.__value_.__l.__size_;
    if (!v56.__r_.__value_.__l.__size_)
      goto LABEL_32;
  }
  else
  {
    if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_32;
    size = v56.__r_.__value_.__l.__size_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v24 = size;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v24 + 2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v24)
  {
    if (v22 >= 0)
      v26 = &v56;
    else
      v26 = (std::string *)v56.__r_.__value_.__r.__words[0];
    memmove(p_p, v26, v24);
  }
  strcpy((char *)p_p + v24, ", ");
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v27 = &__p;
  else
    v27 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v28 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v28 = __p.__r_.__value_.__l.__size_;
  std::string::append(a1, (const std::string::value_type *)v27, v28);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_32:
  if (!v14)
  {
    v29 = 0;
    goto LABEL_57;
  }
  marrs::mrr::mr::getStringNodeValueNluGraph(&__p, a2, -1, v14[5], v12);
  buf = __p;
  v29 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v30 = buf.__r_.__value_.__l.__size_;
    if (!buf.__r_.__value_.__l.__size_)
      goto LABEL_57;
  }
  else
  {
    if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_57;
    v30 = buf.__r_.__value_.__l.__size_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v31 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v31 = v30;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v31 + 1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v32 = &__p;
  else
    v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v31)
  {
    if (v29 >= 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    memmove(v32, p_buf, v31);
  }
  *(_WORD *)((char *)&v32->__r_.__value_.__l.__data_ + v31) = 32;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v34 = &__p;
  else
    v34 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v35 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v35 = __p.__r_.__value_.__l.__size_;
  std::string::append(a1, (const std::string::value_type *)v34, v35);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_57:
  if (!v16)
  {
    v36 = 0;
    goto LABEL_82;
  }
  marrs::mrr::mr::getStringNodeValueNluGraph(&__p, a2, -1, v16[5], v12);
  v57 = __p;
  v36 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v37 = v57.__r_.__value_.__l.__size_;
    if (!v57.__r_.__value_.__l.__size_)
      goto LABEL_82;
  }
  else
  {
    if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_82;
    v37 = v57.__r_.__value_.__l.__size_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v38 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v38 = v37;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v38 + 1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v39 = &__p;
  else
    v39 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v38)
  {
    if (v36 >= 0)
      v40 = &v57;
    else
      v40 = (std::string *)v57.__r_.__value_.__r.__words[0];
    memmove(v39, v40, v38);
  }
  *(_WORD *)((char *)&v39->__r_.__value_.__l.__data_ + v38) = 32;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v41 = &__p;
  else
    v41 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v42 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v42 = __p.__r_.__value_.__l.__size_;
  std::string::append(a1, (const std::string::value_type *)v41, v42);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_82:
  if (!v21)
  {
    v43 = 0;
LABEL_102:
    v49 = v53;
    goto LABEL_103;
  }
  marrs::mrr::mr::getStringNodeValueNluGraph(&__p, a2, *((_DWORD *)v21 + 5), -1, -1);
  v58 = __p;
  v43 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v44 = __p.__r_.__value_.__l.__size_;
  if (!v44)
    goto LABEL_102;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v44 + 1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = &__p;
  else
    v45 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v43 >= 0)
    v46 = &v58;
  else
    v46 = (std::string *)v58.__r_.__value_.__r.__words[0];
  memmove(v45, v46, v44);
  *(_WORD *)((char *)&v45->__r_.__value_.__l.__data_ + v44) = 32;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v47 = &__p;
  else
    v47 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v48 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v48 = __p.__r_.__value_.__l.__size_;
  std::string::append(a1, (const std::string::value_type *)v47, v48);
  v49 = v53;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_103:
  if (!v49)
    goto LABEL_116;
  marrs::mrr::mr::getStringNodeValueNluGraph(&__p, a2, -1, *((_DWORD *)v49 + 5), v12);
  v55 = __p;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v50 = v55.__r_.__value_.__l.__size_;
    if (!v55.__r_.__value_.__l.__size_)
    {
LABEL_115:
      operator delete(v55.__r_.__value_.__l.__data_);
      goto LABEL_116;
    }
  }
  else
  {
    if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_116;
    v50 = v55.__r_.__value_.__l.__size_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v51 = &v55;
  else
    v51 = (std::string *)v55.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v52 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v52 = v50;
  std::string::append(a1, (const std::string::value_type *)v51, v52);
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_115;
LABEL_116:
  if (v22 < 0)
  {
    operator delete(v56.__r_.__value_.__l.__data_);
    if ((v36 & 0x80000000) == 0)
    {
LABEL_118:
      if ((v43 & 0x80000000) == 0)
        goto LABEL_119;
      goto LABEL_123;
    }
  }
  else if ((v36 & 0x80000000) == 0)
  {
    goto LABEL_118;
  }
  operator delete(v57.__r_.__value_.__l.__data_);
  if ((v43 & 0x80000000) == 0)
  {
LABEL_119:
    if ((v29 & 0x80000000) == 0)
      return;
LABEL_124:
    operator delete(buf.__r_.__value_.__l.__data_);
    return;
  }
LABEL_123:
  operator delete(v58.__r_.__value_.__l.__data_);
  if (v29 < 0)
    goto LABEL_124;
}

void sub_1C289B1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;

  if (*(char *)(v31 + 23) < 0)
    operator delete(*(void **)v31);
  if (a21 < 0)
  {
    operator delete(__p);
    if ((v35 & 0x80000000) == 0)
      goto LABEL_5;
  }
  else if ((v35 & 0x80000000) == 0)
  {
LABEL_5:
    if (v33 < 0)
      goto LABEL_6;
    goto LABEL_12;
  }
  operator delete(a23);
  if (v33 < 0)
  {
LABEL_6:
    operator delete(a27);
    if ((v32 & 0x80000000) == 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  if ((v32 & 0x80000000) == 0)
  {
LABEL_7:
    if ((v34 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_13:
  operator delete(a31);
  if ((v34 & 0x80000000) == 0)
LABEL_9:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(*(void **)(v36 - 112));
  goto LABEL_9;
}

void sub_1C289B2EC()
{
  JUMPOUT(0x1C289B290);
}

void sub_1C289B360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C289B400(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C289B4B8(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C289B5C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C289B6E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

PB::Writer *std::unique_ptr<PB::Writer>::reset[abi:ne180100](PB::Writer **a1)
{
  PB::Writer *result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    PB::Writer::~Writer(result);
    JUMPOUT(0x1C3BC5C7CLL);
  }
  return result;
}

uint64_t marrs::mrr::MRRCPPPrintUtils::getMatchingSpanString(marrs::mrr::MRRCPPPrintUtils *this, const sirinluinternal::MatchingSpan *a2)
{
  const std::locale::facet *v3;
  __int128 *v4;
  __int128 v5;
  std::string *p_p;
  std::string::size_type size;
  const std::locale::facet *v8;
  __int128 *v9;
  __int128 v10;
  std::string *v11;
  std::string::size_type v12;
  const std::locale::facet *v13;
  __int128 *v14;
  __int128 v15;
  std::string *v16;
  std::string::size_type v17;
  const std::locale::facet *v18;
  _QWORD *v19;
  _QWORD *v20;
  const std::locale::facet *v21;
  uint64_t v22;
  _QWORD *v23;
  const std::locale::facet *v24;
  const std::locale::facet *v25;
  const sirinluexternal::UsoGraph *v26;
  std::string *v27;
  std::string::size_type v28;
  std::string __p;
  _QWORD v31[11];
  char v32;
  uint64_t v33;
  std::locale v34;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v31);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"Matching Span:", 14);
  std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(v31[0] - 24)));
  v3 = std::locale::use_facet((const std::locale *)&__p, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale((std::locale *)&__p);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"  input - ", 10);
  v4 = (__int128 *)*((_QWORD *)a2 + 4);
  if (v4)
  {
    if (*((char *)v4 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
    }
    else
    {
      v5 = *v4;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "NULL");
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)p_p, size);
  std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(v31[0] - 24)));
  v8 = std::locale::use_facet(&v34, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v34);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"  label - ", 10);
  v9 = (__int128 *)*((_QWORD *)a2 + 6);
  if (v9)
  {
    if (*((char *)v9 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
    }
    else
    {
      v10 = *v9;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v10;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "NULL");
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &__p;
  else
    v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v12 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)v11, v12);
  std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(v31[0] - 24)));
  v13 = std::locale::use_facet(&v34, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
  std::locale::~locale(&v34);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"  semanticValue - ", 18);
  v14 = (__int128 *)*((_QWORD *)a2 + 7);
  if (v14)
  {
    if (*((char *)v14 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v14, *((_QWORD *)v14 + 1));
    }
    else
    {
      v15 = *v14;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v14 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "NULL");
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &__p;
  else
    v16 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v17 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)v16, v17);
  std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(v31[0] - 24)));
  v18 = std::locale::use_facet(&v34, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
  std::locale::~locale(&v34);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"  start, end token indexes - ", 29);
  v19 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)", ", 2);
  v20 = (_QWORD *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(_QWORD *)(*v20 - 24)));
  v21 = std::locale::use_facet((const std::locale *)&__p, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10);
  std::locale::~locale((std::locale *)&__p);
  std::ostream::put();
  std::ostream::flush();
  v22 = *((_QWORD *)a2 + 5);
  if (v22 && *(_QWORD *)(v22 + 16))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"  mentionResolver model score - ", 32);
    v23 = (_QWORD *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(_QWORD *)(*v23 - 24)));
    v24 = std::locale::use_facet((const std::locale *)&__p, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
    std::locale::~locale((std::locale *)&__p);
    std::ostream::put();
    std::ostream::flush();
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"  USOGraph -", 12);
  std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(v31[0] - 24)));
  v25 = std::locale::use_facet((const std::locale *)&__p, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
  std::locale::~locale((std::locale *)&__p);
  std::ostream::put();
  std::ostream::flush();
  v26 = (const sirinluexternal::UsoGraph *)*((_QWORD *)a2 + 8);
  if (v26)
    marrs::mrr::MRRCPPPrintUtils::getUsoGraphDotString((marrs::mrr::MRRCPPPrintUtils *)&__p, v26);
  else
    std::string::basic_string[abi:ne180100]<0>(&__p, "NULL\n");
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v27 = &__p;
  else
    v27 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v28 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v28 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)v27, v28);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::stringbuf::str();
  v31[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v31 + *(_QWORD *)(v31[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v31[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v32 < 0)
    operator delete((void *)v31[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1C3BC5BC8](&v33);
}

void sub_1C289BD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

siri::ontology::UsoGraph *marrs::mrr::MRRCPPPrintUtils::getUsoGraphDotString(marrs::mrr::MRRCPPPrintUtils *this, const sirinluexternal::UsoGraph *a2)
{
  siri::ontology::UsoGraph *result;
  uint64_t v4;
  siri::ontology::UsoGraph *v5;

  marrs::mrr::mr::getUsoGraphProtoReader(this);
  siri::ontology::UsoGraphProtoReader::fromProtobuf((siri::ontology::UsoGraphProtoReader *)&marrs::mrr::mr::getUsoGraphProtoReader(void)::inst, a2);
  siri::ontology::UsoGraph::prettyPrint(v5);
  result = v5;
  if (v5)
  {
    v4 = MEMORY[0x1C3BC57FC]();
    return (siri::ontology::UsoGraph *)MEMORY[0x1C3BC5C7C](v4, 0x10A0C403D23BABBLL);
  }
  return result;
}

void sub_1C289BDF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t marrs::mrr::MRRCPPPrintUtils::getMdResponseString(marrs::mrr::MRRCPPPrintUtils *this, const sirinluinternalmention_detector::MentionDetectorResponse *a2)
{
  const std::locale::facet *v3;
  _QWORD *v4;
  const std::locale::facet *v5;
  const sirinluinternal::MatchingSpan **i;
  const sirinluinternal::MatchingSpan **v7;
  void **v8;
  uint64_t v9;
  void *__p[2];
  unsigned __int8 v12;
  _QWORD v13[11];
  char v14;
  uint64_t v15;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v13);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"MD Response", 11);
  std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(_QWORD *)(v13[0] - 24)));
  v3 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  v4 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)" Mentions in MD Response", 24);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
  v5 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  v7 = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 1);
  for (i = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 2); v7 != i; ++v7)
  {
    marrs::mrr::MRRCPPPrintUtils::getMatchingSpanString((marrs::mrr::MRRCPPPrintUtils *)__p, *v7);
    if ((v12 & 0x80u) == 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    if ((v12 & 0x80u) == 0)
      v9 = v12;
    else
      v9 = (uint64_t)__p[1];
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v8, v9);
    if ((char)v12 < 0)
      operator delete(__p[0]);
  }
  std::stringbuf::str();
  v13[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v13 + *(_QWORD *)(v13[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v13[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v14 < 0)
    operator delete((void *)v13[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1C3BC5BC8](&v15);
}

void sub_1C289BFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::locale::~locale((std::locale *)&__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t _GLOBAL__sub_I_MRMatchingResult_cpp()
{
  std::string::basic_string[abi:ne180100]<0>(&marrs::mrr::mr::MRMatchingResult::entityDataSourceKey, "dataSource");
  return __cxa_atexit(MEMORY[0x1E0DE44D0], &marrs::mrr::mr::MRMatchingResult::entityDataSourceKey, &dword_1C281A000);
}

uint64_t sub_1C289C084()
{
  return MEMORY[0x1E0CAE418]();
}

uint64_t sub_1C289C090()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1C289C09C()
{
  return MEMORY[0x1E0CAE440]();
}

uint64_t sub_1C289C0A8()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1C289C0B4()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1C289C0C0()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1C289C0CC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C289C0D8()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1C289C0E4()
{
  return MEMORY[0x1E0D9F940]();
}

uint64_t sub_1C289C0F0()
{
  return MEMORY[0x1E0D9F958]();
}

uint64_t sub_1C289C0FC()
{
  return MEMORY[0x1E0DA0450]();
}

uint64_t sub_1C289C108()
{
  return MEMORY[0x1E0DA05D8]();
}

uint64_t sub_1C289C114()
{
  return MEMORY[0x1E0DA05E0]();
}

uint64_t sub_1C289C120()
{
  return MEMORY[0x1E0DA05E8]();
}

uint64_t sub_1C289C12C()
{
  return MEMORY[0x1E0DA0620]();
}

uint64_t sub_1C289C138()
{
  return MEMORY[0x1E0DA0650]();
}

uint64_t sub_1C289C144()
{
  return MEMORY[0x1E0DA0658]();
}

uint64_t sub_1C289C150()
{
  return MEMORY[0x1E0DA0660]();
}

uint64_t sub_1C289C15C()
{
  return MEMORY[0x1E0DA0678]();
}

uint64_t sub_1C289C168()
{
  return MEMORY[0x1E0DA0680]();
}

uint64_t sub_1C289C174()
{
  return MEMORY[0x1E0DA0688]();
}

uint64_t sub_1C289C180()
{
  return MEMORY[0x1E0DA0698]();
}

uint64_t sub_1C289C18C()
{
  return MEMORY[0x1E0DA06A0]();
}

uint64_t sub_1C289C198()
{
  return MEMORY[0x1E0DA06D8]();
}

uint64_t sub_1C289C1A4()
{
  return MEMORY[0x1E0DA0C88]();
}

uint64_t sub_1C289C1B0()
{
  return MEMORY[0x1E0DA0DC8]();
}

uint64_t sub_1C289C1BC()
{
  return MEMORY[0x1E0DA0DE0]();
}

uint64_t sub_1C289C1C8()
{
  return MEMORY[0x1E0DA0EE0]();
}

uint64_t sub_1C289C1D4()
{
  return MEMORY[0x1E0DA0EF8]();
}

uint64_t sub_1C289C1E0()
{
  return MEMORY[0x1E0DA0FA8]();
}

uint64_t sub_1C289C1EC()
{
  return MEMORY[0x1E0DA0FB8]();
}

uint64_t sub_1C289C1F8()
{
  return MEMORY[0x1E0DA1BC8]();
}

uint64_t sub_1C289C204()
{
  return MEMORY[0x1E0DA1BD8]();
}

uint64_t sub_1C289C210()
{
  return MEMORY[0x1E0DA1BE0]();
}

uint64_t sub_1C289C21C()
{
  return MEMORY[0x1E0DA27D8]();
}

uint64_t sub_1C289C228()
{
  return MEMORY[0x1E0DA27E0]();
}

uint64_t sub_1C289C234()
{
  return MEMORY[0x1E0DA27E8]();
}

uint64_t sub_1C289C240()
{
  return MEMORY[0x1E0DA27F0]();
}

uint64_t sub_1C289C24C()
{
  return MEMORY[0x1E0DA27F8]();
}

uint64_t sub_1C289C258()
{
  return MEMORY[0x1E0DA2808]();
}

uint64_t sub_1C289C264()
{
  return MEMORY[0x1E0DA2838]();
}

uint64_t sub_1C289C270()
{
  return MEMORY[0x1E0DA2868]();
}

uint64_t sub_1C289C27C()
{
  return MEMORY[0x1E0DA2880]();
}

uint64_t sub_1C289C288()
{
  return MEMORY[0x1E0DA2888]();
}

uint64_t sub_1C289C294()
{
  return MEMORY[0x1E0DA2898]();
}

uint64_t sub_1C289C2A0()
{
  return MEMORY[0x1E0DA28A8]();
}

uint64_t sub_1C289C2AC()
{
  return MEMORY[0x1E0DA28B0]();
}

uint64_t sub_1C289C2B8()
{
  return MEMORY[0x1E0DA28B8]();
}

uint64_t sub_1C289C2C4()
{
  return MEMORY[0x1E0DA28C8]();
}

uint64_t sub_1C289C2D0()
{
  return MEMORY[0x1E0DA28E0]();
}

uint64_t sub_1C289C2DC()
{
  return MEMORY[0x1E0DA28F0]();
}

uint64_t sub_1C289C2E8()
{
  return MEMORY[0x1E0DA2900]();
}

uint64_t sub_1C289C2F4()
{
  return MEMORY[0x1E0DA2928]();
}

uint64_t sub_1C289C300()
{
  return MEMORY[0x1E0DA2930]();
}

uint64_t sub_1C289C30C()
{
  return MEMORY[0x1E0DA2938]();
}

uint64_t sub_1C289C318()
{
  return MEMORY[0x1E0DA2948]();
}

uint64_t sub_1C289C324()
{
  return MEMORY[0x1E0DA2950]();
}

uint64_t sub_1C289C330()
{
  return MEMORY[0x1E0DA2970]();
}

uint64_t sub_1C289C33C()
{
  return MEMORY[0x1E0DA2978]();
}

uint64_t sub_1C289C348()
{
  return MEMORY[0x1E0DA2980]();
}

uint64_t sub_1C289C354()
{
  return MEMORY[0x1E0DA2988]();
}

uint64_t sub_1C289C360()
{
  return MEMORY[0x1E0DA2990]();
}

uint64_t sub_1C289C36C()
{
  return MEMORY[0x1E0DA2998]();
}

uint64_t sub_1C289C378()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1C289C384()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1C289C390()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1C289C39C()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1C289C3A8()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1C289C3B4()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1C289C3C0()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1C289C3CC()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1C289C3D8()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1C289C3E4()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1C289C3F0()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1C289C3FC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C289C408()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C289C414()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C289C420()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C289C42C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C289C438()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C289C444()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1C289C450()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C289C45C()
{
  return MEMORY[0x1E0DEA778]();
}

uint64_t sub_1C289C468()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C289C474()
{
  return MEMORY[0x1E0DEA920]();
}

uint64_t sub_1C289C480()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C289C48C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C289C498()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C289C4A4()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1C289C4B0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C289C4BC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C289C4C8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C289C4D4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C289C4E0()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1C289C4EC()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C289C4F8()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C289C504()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C289C510()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1C289C51C()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1C289C528()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1C289C534()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1C289C540()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1C289C54C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C289C558()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C289C564()
{
  return MEMORY[0x1E0CB2448]();
}

uint64_t sub_1C289C570()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1C289C57C()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1C289C588()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1C289C594()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1C289C5A0()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C289C5AC()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C289C5B8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C289C5C4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C289C5D0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C289C5DC()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C289C5E8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C289C5F4()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C289C600()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C289C60C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C289C618()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C289C624()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C289C630()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C289C63C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C289C648()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C289C654()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C289C660()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C289C66C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1E0CFE438]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t sirinluexternal::SpanProperty::makeValueString(sirinluexternal::SpanProperty *this)
{
  return MEMORY[0x1E0D9FAF8](this);
}

uint64_t sirinluexternal::SpanProperty::SpanProperty(sirinluexternal::SpanProperty *this, const sirinluexternal::SpanProperty *a2)
{
  return MEMORY[0x1E0D9FB00](this, a2);
}

uint64_t sirinluexternal::SpanProperty::SpanProperty(sirinluexternal::SpanProperty *this)
{
  return MEMORY[0x1E0D9FB08](this);
}

void sirinluexternal::SpanProperty::~SpanProperty(sirinluexternal::SpanProperty *this)
{
  MEMORY[0x1E0D9FB10](this);
}

uint64_t sirinluexternal::UsoEntitySpan::makeEndIndex(sirinluexternal::UsoEntitySpan *this)
{
  return MEMORY[0x1E0D9FB88](this);
}

uint64_t sirinluexternal::UsoEntitySpan::makeStartIndex(sirinluexternal::UsoEntitySpan *this)
{
  return MEMORY[0x1E0D9FB90](this);
}

uint64_t sirinluexternal::UsoEntitySpan::makeOriginAppId(sirinluexternal::UsoEntitySpan *this)
{
  return MEMORY[0x1E0D9FB98](this);
}

uint64_t sirinluexternal::UsoEntitySpan::UsoEntitySpan(sirinluexternal::UsoEntitySpan *this, const sirinluexternal::UsoEntitySpan *a2)
{
  return MEMORY[0x1E0D9FBA0](this, a2);
}

uint64_t sirinluexternal::UsoEntitySpan::UsoEntitySpan(sirinluexternal::UsoEntitySpan *this)
{
  return MEMORY[0x1E0D9FBA8](this);
}

void sirinluexternal::UsoEntitySpan::~UsoEntitySpan(sirinluexternal::UsoEntitySpan *this)
{
  MEMORY[0x1E0D9FBB0](this);
}

uint64_t sirinluexternal::UtteranceSpan::UtteranceSpan()
{
  return MEMORY[0x1E0D9FBB8]();
}

uint64_t sirinluexternal::UtteranceSpan::UtteranceSpan(sirinluexternal::UtteranceSpan *this)
{
  return MEMORY[0x1E0D9FBC0](this);
}

void sirinluexternal::UtteranceSpan::~UtteranceSpan(sirinluexternal::UtteranceSpan *this)
{
  MEMORY[0x1E0D9FBC8](this);
}

uint64_t sirinluexternal::EntityCandidate::EntityCandidate()
{
  return MEMORY[0x1E0D9FBD8]();
}

uint64_t sirinluexternal::EntityCandidate::EntityCandidate(sirinluexternal::EntityCandidate *this)
{
  return MEMORY[0x1E0D9FBE0](this);
}

void sirinluexternal::EntityCandidate::~EntityCandidate(sirinluexternal::EntityCandidate *this)
{
  MEMORY[0x1E0D9FBE8](this);
}

uint64_t sirinluexternal::EntityCandidate::operator=()
{
  return MEMORY[0x1E0D9FBF0]();
}

uint64_t sirinluexternal::UtteranceAlignment::UtteranceAlignment()
{
  return MEMORY[0x1E0D9FC48]();
}

uint64_t sirinluexternal::UtteranceAlignment::UtteranceAlignment(sirinluexternal::UtteranceAlignment *this)
{
  return MEMORY[0x1E0D9FC50](this);
}

void sirinluexternal::UtteranceAlignment::~UtteranceAlignment(sirinluexternal::UtteranceAlignment *this)
{
  MEMORY[0x1E0D9FC58](this);
}

uint64_t sirinluexternal::UsoEntityIdentifier::makeNamespaceA(sirinluexternal::UsoEntityIdentifier *this)
{
  return MEMORY[0x1E0D9FC68](this);
}

uint64_t sirinluexternal::UsoEntityIdentifier::UsoEntityIdentifier(sirinluexternal::UsoEntityIdentifier *this, const sirinluexternal::UsoEntityIdentifier *a2)
{
  return MEMORY[0x1E0D9FC70](this, a2);
}

uint64_t sirinluexternal::UsoEntityIdentifier::UsoEntityIdentifier(sirinluexternal::UsoEntityIdentifier *this)
{
  return MEMORY[0x1E0D9FC78](this);
}

void sirinluexternal::UsoEntityIdentifier::~UsoEntityIdentifier(sirinluexternal::UsoEntityIdentifier *this)
{
  MEMORY[0x1E0D9FC80](this);
}

uint64_t sirinluexternal::UUID::UUID(sirinluexternal::UUID *this, const UUID *a2)
{
  return MEMORY[0x1E0D9FCA8](this, a2);
}

uint64_t sirinluexternal::UsoGraph::UsoGraph()
{
  return MEMORY[0x1E0D9FCB8]();
}

void sirinluexternal::UsoGraph::~UsoGraph(sirinluexternal::UsoGraph *this)
{
  MEMORY[0x1E0D9FCC8](this);
}

uint64_t sirinluinternal::MatchingSpan::makeInternalSpanData(sirinluinternal::MatchingSpan *this)
{
  return MEMORY[0x1E0D9FD28](this);
}

uint64_t sirinluinternal::MatchingSpan::MatchingSpan()
{
  return MEMORY[0x1E0D9FD30]();
}

uint64_t sirinluinternal::MatchingSpan::MatchingSpan(sirinluinternal::MatchingSpan *this, const sirinluinternal::MatchingSpan *a2)
{
  return MEMORY[0x1E0D9FD38](this, a2);
}

uint64_t sirinluinternal::MatchingSpan::MatchingSpan(sirinluinternal::MatchingSpan *this)
{
  return MEMORY[0x1E0D9FD40](this);
}

void sirinluinternal::MatchingSpan::~MatchingSpan(sirinluinternal::MatchingSpan *this)
{
  MEMORY[0x1E0D9FD48](this);
}

uint64_t sirinluinternal::MatchingSpan::operator=()
{
  return MEMORY[0x1E0D9FD50]();
}

{
  return MEMORY[0x1E0D9FD58]();
}

uint64_t sirinluinternal::InternalSpanData::makeMentionDetectorSpanData(sirinluinternal::InternalSpanData *this)
{
  return MEMORY[0x1E0D9FD78](this);
}

uint64_t sirinluinternal::InternalSpanData::makeMentionResolverSpanData(sirinluinternal::InternalSpanData *this)
{
  return MEMORY[0x1E0D9FD80](this);
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor()
{
  return MEMORY[0x1E0D9FDB0]();
}

void sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor(sirinluinternal::NLv4EmbeddingTensor *this)
{
  MEMORY[0x1E0D9FDB8](this);
}

uint64_t sirinluinternal::Token::Token()
{
  return MEMORY[0x1E0D9FDC8]();
}

void sirinluinternal::Token::~Token(sirinluinternal::Token *this)
{
  MEMORY[0x1E0D9FDD0](this);
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0D82F68](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1E0D82FF0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x1E0D82FF8](this);
}

uint64_t sirinluinternalmention_detector::MentionDetectorRequest::MentionDetectorRequest(sirinluinternalmention_detector::MentionDetectorRequest *this)
{
  return MEMORY[0x1E0D9FE48](this);
}

uint64_t sirinluinternalmention_detector::MentionDetectorResponse::MentionDetectorResponse()
{
  return MEMORY[0x1E0D9FE50]();
}

{
  return MEMORY[0x1E0D9FE58]();
}

uint64_t sirinluinternalmention_detector::MentionDetectorResponse::MentionDetectorResponse(sirinluinternalmention_detector::MentionDetectorResponse *this)
{
  return MEMORY[0x1E0D9FE60](this);
}

void sirinluinternalmention_detector::MentionDetectorResponse::~MentionDetectorResponse(sirinluinternalmention_detector::MentionDetectorResponse *this)
{
  MEMORY[0x1E0D9FE68](this);
}

uint64_t sirinluinternalmention_resolver::MentionResolverRequest::MentionResolverRequest(sirinluinternalmention_resolver::MentionResolverRequest *this)
{
  return MEMORY[0x1E0D9FE70](this);
}

uint64_t sirinluinternalmention_resolver::MentionResolverResponse::MentionResolverResponse()
{
  return MEMORY[0x1E0D9FE78]();
}

uint64_t sirinluinternalmention_resolver::MentionResolverResponse::MentionResolverResponse(sirinluinternalmention_resolver::MentionResolverResponse *this)
{
  return MEMORY[0x1E0D9FE80](this);
}

void sirinluinternalmention_resolver::MentionResolverResponse::~MentionResolverResponse(sirinluinternalmention_resolver::MentionResolverResponse *this)
{
  MEMORY[0x1E0D9FE88](this);
}

uint64_t siri::ontology::UsoGraphProtoReader::fromProtobuf(siri::ontology::UsoGraphProtoReader *this, const sirinluexternal::UsoGraph *a2)
{
  return MEMORY[0x1E0D9FFA8](this, a2);
}

uint64_t siri::ontology::getSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x1E0DA2E88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2E90](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Uri(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2E98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Alarm(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EC8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Group(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2ED0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Photo(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2ED8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Timer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_city(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2EE8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_name(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_type(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Person(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F38](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Window(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F40](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_names(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F50](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_value(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F60](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Setting(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F70](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_entity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F78](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_street(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F90](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DateTime(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2F98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_address(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FB8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_country(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FC0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AppEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FD0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItem(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::primitive_String(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_province(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3000](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_UserEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3010](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PhoneNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3060](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_postalCode(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3078](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Announcement(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3088](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_EmailAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3098](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Notification(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_SearchObject(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_stringValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AppEntityType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA30E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_LocalBusiness(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3100](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PostalAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3110](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_definedValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3138](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_mediaItemType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3168](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_playbackState(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3170](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_LocalisedString(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3178](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItemType_Song(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3278](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItemType_Album(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItemType_Video(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA32B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItemType_Artist(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3320](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PlaybackState_Paused(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3340](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3458](this);
}

void siri::ontology::UsoGraph::~UsoGraph(siri::ontology::UsoGraph *this)
{
  MEMORY[0x1E0DA34E0](this);
}

uint64_t siri::ontology::operator!=()
{
  return MEMORY[0x1E0DA34F0]();
}

uint64_t morphun::util::StringUtils::convert()
{
  return MEMORY[0x1E0DE73A0]();
}

{
  return MEMORY[0x1E0DE73A8]();
}

uint64_t morphun::util::StringUtils::lowercase()
{
  return MEMORY[0x1E0DE73B0]();
}

uint64_t morphun::util::ULocale::ULocale()
{
  return MEMORY[0x1E0DE73F8]();
}

{
  return MEMORY[0x1E0DE7408]();
}

void morphun::util::ULocale::~ULocale(morphun::util::ULocale *this)
{
  MEMORY[0x1E0DE7418](this);
}

uint64_t sirinluinternal::MatchingSpan::hash_value(sirinluinternal::MatchingSpan *this)
{
  return MEMORY[0x1E0D9FFC8](this);
}

uint64_t sirinluinternal::MatchingSpan::operator==()
{
  return MEMORY[0x1E0D9FFD0]();
}

uint64_t siri::ontology::UsoEntityNode::getIdentifiers(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA3500](this);
}

uint64_t siri::ontology::UsoGraph::prettyPrint(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1E0DA3560](this);
}

uint64_t siri::ontology::UsoGraph::getSuccessors()
{
  return MEMORY[0x1E0DA3568]();
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1E0DE4190](this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4220](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1E0DE4240](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1E0DE42F0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x1E0DE42F8](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4318](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1E0DE43B0](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE44E0](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4640]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::ifstream::open()
{
  return MEMORY[0x1E0DE47A0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1E0DE47C8](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1E0DE4910](retstr, __s);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

float std::stof(const std::string *__str, size_t *__idx)
{
  float result;

  MEMORY[0x1E0DE4A70](__str, __idx);
  return result;
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x1E0DE4B10]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1E0DE4B90](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1E0DE4D40](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x1E0DE4D50](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D78](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD0](this);
}

{
  MEMORY[0x1E0DE4DD8](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1E0DE4DF0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x1E0DE4DF8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E7C65B20(__p);
}

uint64_t operator delete()
{
  return off_1E7C65B28();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7C65B30(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E7C65B38(__sz, a2);
}

uint64_t operator new()
{
  return off_1E7C65B40();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1E0D15470]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1E0D1FEE8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x1E0D1FF00]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x1E0D20028]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

