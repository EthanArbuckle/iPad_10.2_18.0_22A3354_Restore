@implementation _EARPhoneticMatchData

- (int)convertFeedType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 0xD)
    return a3;
  else
    return 0;
}

- (_EARPhoneticMatchData)initWithFeedType:(int64_t)a3 jsonConfigFile:(id)a4
{
  id v6;
  _EARPhoneticMatchData *v7;
  NSObject *v8;
  kaldi::nnet1::Nnet **p_dataFeed;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _EARPhoneticMatchData *v13;
  NSObject *v14;
  uint64_t v16[3];
  void *__p[2];
  uint64_t v18;
  objc_super v19;
  uint8_t buf[16];
  __int128 v21;
  int v22;
  uint8_t v23[4];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_EARPhoneticMatchData;
  v7 = -[_EARPhoneticMatchData init](&v19, sel_init);
  if (v7)
  {
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v23);
    EarPmLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1AD756000, v8, OS_LOG_TYPE_DEFAULT, "Loading configuration from: %@", buf, 0xCu);
    }

    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v18 = 0;
    }
    memset(v16, 0, sizeof(v16));
    *(_OWORD *)buf = 0u;
    v21 = 0u;
    v22 = 1065353216;
    quasar::SystemConfig::readJsonFile((uint64_t)v23, (uint64_t)__p, v16, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(_QWORD *)buf = v16;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
    LODWORD(__p[0]) = -[_EARPhoneticMatchData convertFeedType:](v7, "convertFeedType:", a3);
    std::allocate_shared[abi:ne180100]<quasar::DataFeed,std::allocator<quasar::DataFeed>,quasar::DataFeedType,quasar::SystemConfig &,void>(buf);
    p_dataFeed = (kaldi::nnet1::Nnet **)&v7->_dataFeed;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v7->_dataFeed, (__int128 *)buf);
    v10 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    if (*p_dataFeed && (kaldi::nnet1::Nnet::IsRnn(*p_dataFeed) & 1) != 0)
    {
      v13 = v7;
    }
    else
    {
      EarPmLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AD756000, v14, OS_LOG_TYPE_DEFAULT, "Phonetic-match building is not supported", buf, 2u);
      }

      v13 = 0;
    }
    quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v23);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)writeTsv:(id)a3
{
  id v4;
  void *v5;
  DataFeed *ptr;
  void *__p[2];
  uint64_t v8;

  v4 = a3;
  v5 = v4;
  ptr = self->_dataFeed.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v8 = 0;
  }
  quasar::DataFeed::writeTSV((uint64_t)ptr, (uint64_t)__p);
  if (SHIBYTE(v8) < 0)
    operator delete(__p[0]);

}

- (void)sortItemsByPriorDesc
{
  quasar::DataFeed::sortItemsByPriorDesc((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (void)sortItemsByPriorAsc
{
  quasar::DataFeed::sortItemsByPriorAsc((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (void)normalizePriors
{
  quasar::DataFeed::normalizePriors((float **)self->_dataFeed.__ptr_);
}

- (void)expDecayPriors
{
  quasar::DataFeed::expDecayPriors((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (void)powerScalePriors
{
  quasar::DataFeed::powerScalePriors((float **)self->_dataFeed.__ptr_);
}

- (void)applyRegexEnumerations
{
  quasar::DataFeed::applyRegexEnumerations((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (void)addOsym
{
  quasar::DataFeed::addOSym((quasar::DataFeedItem **)self->_dataFeed.__ptr_);
}

- (BOOL)appendData:(id)a3 prior:(float)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  std::string::size_type v12;
  void *v13;
  void *v14;
  BOOL appended;
  std::string __p;
  std::string v18;
  const void **v19;
  _QWORD **v20;
  _QWORD *v21[2];

  v6 = a3;
  v21[0] = 0;
  v21[1] = 0;
  v20 = v21;
  quasar::DataFeedItem::setPrior((float *)&v19, a4);
  quasar::DataFeed::getFieldNames((__int128 **)self->_dataFeed.__ptr_, &v18);
  v7 = objc_msgSend(v6, "count");
  if (v7 == 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18.__r_.__value_.__l.__size_ - v18.__r_.__value_.__r.__words[0]) >> 3))
  {
    v8 = 0;
    for (i = 0;
          objc_msgSend(v6, "count", __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2]) > i;
          ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
        goto LABEL_11;
      v12 = v18.__r_.__value_.__r.__words[0];
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "ear_toString");
      else
        memset(&__p, 0, sizeof(__p));
      quasar::DataFeedItem::setField((uint64_t)&v19, (__int128 *)(v12 + v8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);

      v8 += 24;
    }
    appended = quasar::DataFeed::appendItem((quasar::DataFeed *)self->_dataFeed.__ptr_, &v19);
  }
  else
  {
LABEL_11:
    appended = 0;
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v20, v21[0]);

  return appended;
}

- (BOOL)roomForMoreData
{
  return !quasar::DataFeed::full((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (int)getLimit
{
  return quasar::DataFeed::getLimit((quasar::DataFeed *)self->_dataFeed.__ptr_);
}

- (shared_ptr<quasar::DataFeed>)dataFeed
{
  DataFeed **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::DataFeed> result;

  cntrl = self->_dataFeed.__cntrl_;
  *v2 = self->_dataFeed.__ptr_;
  v2[1] = (DataFeed *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DataFeed *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_dataFeed);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
