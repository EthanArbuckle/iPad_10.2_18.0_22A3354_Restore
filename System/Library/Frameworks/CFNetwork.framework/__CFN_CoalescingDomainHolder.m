@implementation __CFN_CoalescingDomainHolder

- (void)coalescingCoalescingConnectionHost:(void *)a3 ipAddrs:(void *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _OWORD *v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __int128 v19;
  int64x2_t v20;
  unint64_t v21;
  std::string *v22;
  uint64_t v23;
  uint64_t v24;
  void *__p[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int64x2_t v33;
  std::string *v34;
  std::__split_buffer<std::string> v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  if (a2)
  {
    v33 = 0uLL;
    v34 = 0;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(a4);
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "UTF8String", v23));
          v8 = (_OWORD *)v33.i64[1];
          if (v33.i64[1] >= (unint64_t)v34)
          {
            v10 = 0xAAAAAAAAAAAAAAABLL * ((v33.i64[1] - v33.i64[0]) >> 3);
            v11 = v10 + 1;
            if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            if (0x5555555555555556 * (((uint64_t)v34 - v33.i64[0]) >> 3) > v11)
              v11 = 0x5555555555555556 * (((uint64_t)v34 - v33.i64[0]) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v34 - v33.i64[0]) >> 3) >= 0x555555555555555)
              v12 = 0xAAAAAAAAAAAAAAALL;
            else
              v12 = v11;
            v35.__end_cap_.__value_ = (std::allocator<std::string> *)&v34;
            if (v12)
              v12 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v12);
            else
              v13 = 0;
            v14 = v12 + 24 * v10;
            v15 = *(_OWORD *)__p;
            *(_QWORD *)(v14 + 16) = v28;
            *(_OWORD *)v14 = v15;
            __p[1] = 0;
            v28 = 0;
            __p[0] = 0;
            v16 = v33.i64[1];
            v17 = v33.i64[0];
            if (v33.i64[1] == v33.i64[0])
            {
              v20 = vdupq_n_s64(v33.u64[1]);
              v18 = v12 + 24 * v10;
            }
            else
            {
              v18 = v12 + 24 * v10;
              do
              {
                v19 = *(_OWORD *)(v16 - 24);
                *(_QWORD *)(v18 - 8) = *(_QWORD *)(v16 - 8);
                *(_OWORD *)(v18 - 24) = v19;
                v18 -= 24;
                *(_QWORD *)(v16 - 16) = 0;
                *(_QWORD *)(v16 - 8) = 0;
                *(_QWORD *)(v16 - 24) = 0;
                v16 -= 24;
              }
              while (v16 != v17);
              v20 = v33;
            }
            v21 = v14 + 24;
            v33.i64[0] = v18;
            v33.i64[1] = v14 + 24;
            *(int64x2_t *)&v35.__begin_ = v20;
            v22 = v34;
            v34 = (std::string *)(v12 + 24 * v13);
            v35.__end_cap_.__value_ = v22;
            v35.__first_ = (std::__split_buffer<std::string>::pointer)v20.i64[0];
            std::__split_buffer<std::string>::~__split_buffer(&v35);
            v33.i64[1] = v21;
            if (SHIBYTE(v28) < 0)
              operator delete(__p[0]);
          }
          else
          {
            v9 = *(_OWORD *)__p;
            *(_QWORD *)(v33.i64[1] + 16) = v28;
            *v8 = v9;
            v33.i64[1] = (uint64_t)v8 + 24;
          }
        }
        v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      }
      while (v5);
    }
    std::string::basic_string[abi:nn180100]<0>(&v35, (char *)objc_msgSend(a3, "UTF8String", v23));
    if (v33.i64[0] == v33.i64[1])
      __assert_rtn("coalescingConnectionKeyForHostWithDNSRecord", "HTTP2CoalescingSupport.mm", 143, "!DNSRecordIPAddresses.empty()");
    CoalescingDomain::_find_coalescing_connection_key(a1, v24 + 8, (uint64_t)&v35, v33.i64[0], (_QWORD *)v33.i64[1]);
    if (SHIBYTE(v35.__end_) < 0)
      operator delete(v35.__first_);
    v35.__first_ = (std::__split_buffer<std::string>::pointer)&v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v35);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

- (__CFN_CoalescingDomainHolder)init
{
  __CFN_CoalescingDomainHolder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)__CFN_CoalescingDomainHolder;
  v2 = -[__CFN_CoalescingDomainHolder init](&v4, sel_init);
  if (v2)
    v2->_pathPolicyManager = objc_alloc_init(__CFN_PathPolicyManager);
  return v2;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,std::__map_value_compare<std::shared_ptr<__CoalescingConnectionKey>,std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,CoalescingConnectionKeyComparator,true>,std::allocator<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>>>::destroy((_QWORD *)self->_coalescingDomain._connectionKeyToAllRequestHosts.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::shared_ptr<__CoalescingConnectionKey>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<__CoalescingConnectionKey>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<__CoalescingConnectionKey>>>>::destroy((_QWORD *)self->_coalescingDomain._requestHostToConnectionKey.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,std::__map_value_compare<std::shared_ptr<__CoalescingConnectionKey>,std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>,CoalescingConnectionKeyComparator,true>,std::allocator<std::__value_type<std::shared_ptr<__CoalescingConnectionKey>,std::set<std::string>>>>::destroy((_QWORD *)self->_coalescingDomain._connectionKeyToAllIPAddresses.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::set<std::shared_ptr<__CoalescingConnectionKey>,CoalescingConnectionKeyComparator,std::allocator<std::shared_ptr<__CoalescingConnectionKey>>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::set<std::shared_ptr<__CoalescingConnectionKey>,CoalescingConnectionKeyComparator,std::allocator<std::shared_ptr<__CoalescingConnectionKey>>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::set<std::shared_ptr<__CoalescingConnectionKey>,CoalescingConnectionKeyComparator,std::allocator<std::shared_ptr<__CoalescingConnectionKey>>>>>>::destroy((_QWORD *)self->_coalescingDomain._ipAddressToConnectionKey.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((_QWORD *)self->_coalescingDomain._DNS.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = (char *)self + 64;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__CFN_CoalescingDomainHolder;
  -[__CFN_CoalescingDomainHolder dealloc](&v3, sel_dealloc);
}

@end
