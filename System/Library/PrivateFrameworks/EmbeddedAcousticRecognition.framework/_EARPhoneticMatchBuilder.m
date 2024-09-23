@implementation _EARPhoneticMatchBuilder

- (_EARPhoneticMatchBuilder)initWithModelRoot:(id)a3 jsonConfigFile:(id)a4 dataFeeds:(id)a5
{
  _EARPhoneticMatchBuilder *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _EARPhoneticMatchBuilder *v21;
  quasar::PMBuilder **p_pmBuilder;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _EARPhoneticMatchBuilder *v26;
  NSObject *v27;
  uint64_t *p_tokenizer;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  quasar::DataFeed *v41;
  std::__shared_weak_count *v42;
  uint8_t buf[8];
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *__p;
  char v50;
  uint64_t v51;
  __int128 v52[8];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = a4;
  v32 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_EARPhoneticMatchBuilder;
  v8 = -[_EARPhoneticMatchBuilder init](&v36, sel_init);
  if (!v8)
    goto LABEL_36;
  +[_EARQuasarTokenizer tokenizerWithModelRoot:](_EARQuasarTokenizer, "tokenizerWithModelRoot:", v31);
  p_tokenizer = (uint64_t *)&v8->_tokenizer;
  std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v8->_tokenizer.__ptr_, (uint64_t *)buf);
  v9 = *(void **)buf;
  *(_QWORD *)buf = 0;
  if (v9)
    (*(void (**)(void *))(*(_QWORD *)v9 + 8))(v9);
  v10 = v32;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v15 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "dataFeed", p_tokenizer);
        quasar::DataFeed::DataFeed((quasar::DataFeed *)buf, v41);
        v16 = v42;
        if (v42)
        {
          p_shared_owners = (unint64_t *)&v42->__shared_owners_;
          do
            v18 = __ldaxr(p_shared_owners);
          while (__stlxr(v18 - 1, p_shared_owners));
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }

        v19 = v34;
        if (v34 >= v35)
        {
          v20 = std::vector<quasar::DataFeed>::__push_back_slow_path<quasar::DataFeed>(&v33, (uint64_t)buf);
        }
        else
        {
          std::allocator<quasar::DataFeed>::construct[abi:ne180100]<quasar::DataFeed,quasar::DataFeed>((uint64_t)&v35, v34, (uint64_t)buf);
          v20 = v19 + 160;
        }
        v34 = v20;
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>>>::~__hash_table((uint64_t)&v51);
        if (v50 < 0)
          operator delete(__p);
        v41 = (quasar::DataFeed *)&v48;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
        if (v47 < 0)
          operator delete(v46);
        v41 = (quasar::DataFeed *)buf;
        std::vector<quasar::DataFeedItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    }
    while (v12);
  }

  if (v30)
  {
    v21 = v8;
    objc_msgSend(v30, "ear_toString");
  }
  else
  {
    *(_QWORD *)buf = 0;
    v44 = 0;
    v45 = 0;
    v21 = v8;
  }
  std::allocate_shared[abi:ne180100]<quasar::PMBuilder,std::allocator<quasar::PMBuilder>,std::string,std::shared_ptr<quasar::TextTokenizer> &,std::vector<quasar::DataFeed> &,void>((uint64_t)buf, p_tokenizer, (uint64_t)&v33, v52);
  p_pmBuilder = (quasar::PMBuilder **)&v21->_pmBuilder;
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v21->_pmBuilder, v52);
  v23 = (std::__shared_weak_count *)*((_QWORD *)&v52[0] + 1);
  if (*((_QWORD *)&v52[0] + 1))
  {
    v24 = (unint64_t *)(*((_QWORD *)&v52[0] + 1) + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (SHIBYTE(v45) < 0)
    operator delete(*(void **)buf);
  if (*p_pmBuilder && (quasar::PMBuilder::getSupportPhoneticMatchBuilding(*p_pmBuilder) & 1) != 0)
  {
    *(_QWORD *)buf = &v33;
    std::vector<quasar::DataFeed>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_36:
    v26 = v8;
    goto LABEL_40;
  }
  EarPmLogger();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v27, OS_LOG_TYPE_DEFAULT, "Phonetic-match building is not supported", buf, 2u);
  }

  *(_QWORD *)buf = &v33;
  std::vector<quasar::DataFeed>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v26 = 0;
LABEL_40:

  return v26;
}

- (_EARPhoneticMatchBuilder)initWithModelRoot:(id)a3 jsonConfigFile:(id)a4 dataFeedsFile:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARPhoneticMatchBuilder *v11;
  void *v12;
  quasar::PMBuilder **p_pmBuilder;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _EARPhoneticMatchBuilder *v17;
  NSObject *v18;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  objc_super v23;
  uint8_t buf[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_EARPhoneticMatchBuilder;
  v11 = -[_EARPhoneticMatchBuilder init](&v23, sel_init);
  if (!v11)
  {
LABEL_20:
    v17 = v11;
    goto LABEL_24;
  }
  +[_EARQuasarTokenizer tokenizerWithModelRoot:](_EARQuasarTokenizer, "tokenizerWithModelRoot:", v8);
  std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v11->_tokenizer.__ptr_, (uint64_t *)buf);
  v12 = *(void **)buf;
  *(_QWORD *)buf = 0;
  if (v12)
    (*(void (**)(void *))(*(_QWORD *)v12 + 8))(v12);
  if (!v9)
  {
    *(_QWORD *)buf = 0;
    v25 = 0;
    v26 = 0;
    if (v10)
      goto LABEL_6;
LABEL_8:
    __p[0] = 0;
    __p[1] = 0;
    v21 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "ear_toString");
  if (!v10)
    goto LABEL_8;
LABEL_6:
  objc_msgSend(v10, "ear_toString");
LABEL_9:
  std::allocate_shared[abi:ne180100]<quasar::PMBuilder,std::allocator<quasar::PMBuilder>,std::string,std::shared_ptr<quasar::TextTokenizer> &,std::string,void>((uint64_t)buf, (uint64_t *)&v11->_tokenizer, (uint64_t)__p, &v22);
  p_pmBuilder = (quasar::PMBuilder **)&v11->_pmBuilder;
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v11->_pmBuilder, &v22);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
  if (*((_QWORD *)&v22 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v26) < 0)
    operator delete(*(void **)buf);
  if (*p_pmBuilder && (quasar::PMBuilder::getSupportPhoneticMatchBuilding(*p_pmBuilder) & 1) != 0)
    goto LABEL_20;
  EarPmLogger();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v18, OS_LOG_TYPE_DEFAULT, "Phonetic-match building is not supported", buf, 2u);
  }

  v17 = 0;
LABEL_24:

  return v17;
}

- (_EARPhoneticMatchBuilder)initWithNcsRoot:(id)a3 jsonConfigFile:(id)a4 dataFeeds:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _EARPhoneticMatchBuilder *v11;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_EARPhoneticMatchBuilder initWithModelRoot:jsonConfigFile:dataFeeds:](self, "initWithModelRoot:jsonConfigFile:dataFeeds:", v10, v8, v9);

  return v11;
}

- (_EARPhoneticMatchBuilder)initWithNcsRoot:(id)a3 jsonConfigFile:(id)a4 dataFeedsFile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _EARPhoneticMatchBuilder *v11;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_EARPhoneticMatchBuilder initWithModelRoot:jsonConfigFile:dataFeedsFile:](self, "initWithModelRoot:jsonConfigFile:dataFeedsFile:", v10, v8, v9);

  return v11;
}

- (BOOL)supportPhoneticMatchBuilding
{
  return quasar::PMBuilder::getSupportPhoneticMatchBuilding((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)buildGFsts
{
  return quasar::PMBuilder::buildGFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)buildLFst
{
  return quasar::PMBuilder::buildLFst((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)buildAlignedLFst
{
  return quasar::PMBuilder::buildAlignedLFst((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)composeLGFsts
{
  return quasar::PMBuilder::composeLGFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)combineFsts
{
  return quasar::PMBuilder::combineFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (void)reset
{
  quasar::PMBuilder::reset((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)writeAlignedLFstToPath:(id)a3
{
  id v4;
  void *v5;
  PMBuilder *ptr;
  void *__p[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_pmBuilder.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v9 = 0;
  }
  quasar::PMBuilder::writeAlignedLFst((uint64_t)ptr, (uint64_t)__p);
  if (SHIBYTE(v9) < 0)
    operator delete(__p[0]);

  return 1;
}

- (BOOL)writeLGFstToPath:(id)a3
{
  id v4;
  void *v5;
  PMBuilder *ptr;
  void *__p[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_pmBuilder.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v9 = 0;
  }
  quasar::PMBuilder::writeLGFst((uint64_t)ptr, (uint64_t)__p);
  if (SHIBYTE(v9) < 0)
    operator delete(__p[0]);

  return 1;
}

- (BOOL)writeOSymsToPath:(id)a3 asText:(BOOL)a4 quasarise:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *__p[2];
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[20];

  v5 = a5;
  v6 = a4;
  v16[19] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    quasar::PMBuilder::getOsyms((quasar::PMBuilder *)self->_pmBuilder.__ptr_, v5, (uint64_t *)__p);
    if (v9)
    {
      objc_msgSend(v9, "ear_toString");
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    fst::SymbolTable::WriteText((uint64_t)__p, (uint64_t)&v13);
    if (SHIBYTE(v15) < 0)
      operator delete(v13);
    fst::SymbolTable::~SymbolTable((fst::SymbolTable *)__p);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v12 = 0;
    }
    std::ofstream::basic_ofstream(&v13);
    if (SHIBYTE(v12) < 0)
      operator delete(__p[0]);
    quasar::PMBuilder::getOsyms((quasar::PMBuilder *)self->_pmBuilder.__ptr_, v5, (uint64_t *)__p);
    quasar::PMBuilder::writeSymsQuasarMap((uint64_t)__p);
    fst::SymbolTable::~SymbolTable((fst::SymbolTable *)__p);
    v13 = (void *)*MEMORY[0x1E0DE4F48];
    *(void **)((char *)&v13 + *((_QWORD *)v13 - 3)) = *(void **)(MEMORY[0x1E0DE4F48] + 24);
    MEMORY[0x1AF44CA70](&v14);
    std::ostream::~ostream();
    MEMORY[0x1AF44D094](v16);
  }

  return 1;
}

- (BOOL)writeISymsToPath:(id)a3 asText:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PMBuilder *ptr;
  uint64_t MultiChainMultiAudioBuffer;
  uint64_t v9;
  void *__p;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  ptr = self->_pmBuilder.__ptr_;
  if (v4)
  {
    MultiChainMultiAudioBuffer = quasar::SpeechRequestData::getMultiChainMultiAudioBuffer((quasar::SpeechRequestData *)ptr);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      v12 = 0;
      v13 = 0;
    }
    fst::SymbolTable::WriteText(MultiChainMultiAudioBuffer, (uint64_t)&__p);
  }
  else
  {
    v9 = quasar::SpeechRequestData::getMultiChainMultiAudioBuffer((quasar::SpeechRequestData *)ptr);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      v12 = 0;
      v13 = 0;
    }
    fst::SymbolTable::Write(v9, (uint64_t)&__p);
  }
  if (SHIBYTE(v13) < 0)
    operator delete(__p);

  return 1;
}

- (BOOL)writeGFstsToDirectory:(id)a3
{
  id v4;
  __int128 **SectionNames;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *__p[2];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SectionNames = (__int128 **)quasar::PMBuilder::getSectionNames((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  EARHelpers::NSArrayOfStringFromVectorOfString(SectionNames);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::Bitmap::~Bitmap((quasar::Bitmap *)self->_pmBuilder.__ptr_);
  v8 = *v7;
  v9 = v7[1];
  if (*v7 != v9)
  {
    v10 = 0;
    do
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.G.fst"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "stringByAppendingPathComponent:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        v18 = 0;
      }
      (*(void (**)(uint64_t, void **))(*(_QWORD *)v8 + 104))(v8, __p);
      if (SHIBYTE(v18) < 0)
        operator delete(__p[0]);

      ++v10;
      v8 += 16;
    }
    while (v8 != v9);
  }

  return 1;
}

- (BOOL)writeLFstToPath:(id)a3
{
  id v4;
  uint64_t TagSequence;
  void *__p[2];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TagSequence = quasar::CommandTagging::getTagSequence((quasar::CommandTagging *)self->_pmBuilder.__ptr_);
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
  (*(void (**)(uint64_t, void **))(*(_QWORD *)TagSequence + 104))(TagSequence, __p);
  if (SHIBYTE(v8) < 0)
    operator delete(__p[0]);

  return 1;
}

- (BOOL)writeIndividualLGFstsToDirectory:(id)a3
{
  id v4;
  __int128 **SectionNames;
  void *v6;
  uint64_t *IndividualLGFsts;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *__p[2];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SectionNames = (__int128 **)quasar::PMBuilder::getSectionNames((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  EARHelpers::NSArrayOfStringFromVectorOfString(SectionNames);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IndividualLGFsts = (uint64_t *)quasar::PMBuilder::getIndividualLGFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  v8 = *IndividualLGFsts;
  v9 = IndividualLGFsts[1];
  if (*IndividualLGFsts != v9)
  {
    v10 = 0;
    do
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.LG.fst"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "stringByAppendingPathComponent:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        v18 = 0;
      }
      (*(void (**)(uint64_t, void **))(*(_QWORD *)v8 + 104))(v8, __p);
      if (SHIBYTE(v18) < 0)
        operator delete(__p[0]);

      ++v10;
      v8 += 16;
    }
    while (v8 != v9);
  }

  return 1;
}

- (BOOL)writeMetadataToPath:(id)a3
{
  id v4;
  void *v5;
  PMBuilder *ptr;
  __int128 __p;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_pmBuilder.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p = 0uLL;
    v9 = 0;
  }
  quasar::PMBuilder::writeMetadata((uint64_t)ptr, &__p);
  if (SHIBYTE(v9) < 0)
    operator delete((void *)__p);

  return 1;
}

+ (BOOL)writePlaceholderFstToPath:(id)a3
{
  id v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *__p[2];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>::VectorFst(&v12);
  v4 = fst::ImplToMutableFst<fst::VectorFstImpl<fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>,fst::MutableFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>::AddState((uint64_t)&v12);
  fst::ImplToMutableFst<fst::VectorFstImpl<fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>,fst::MutableFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>::MutateCheck((uint64_t)&v12);
  v5 = v13;
  *((_DWORD *)v13 + 22) = v4;
  v6 = (*(uint64_t (**)(_QWORD *))(*v5 + 24))(v5);
  v5[1] = v6 & 0xCCFFFFF0007 | (((v6 >> 35) & 1) << 37) | v5[1] & 4;
  LODWORD(v5) = fst::ImplToMutableFst<fst::VectorFstImpl<fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>,fst::MutableFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>::AddState((uint64_t)&v12);
  fst::ImplToMutableFst<fst::VectorFstImpl<fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>,fst::MutableFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>::SetFinal((uint64_t)&v12, (int)v5, 0.0);
  v10 = 0;
  LODWORD(v11) = 0;
  HIDWORD(v11) = (_DWORD)v5;
  fst::ImplToMutableFst<fst::VectorFstImpl<fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>,fst::MutableFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>::MutateCheck((uint64_t)&v12);
  fst::VectorFstImpl<fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>::AddArc(v13, v4, (float *)&v10);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString", v10, v11);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v15 = 0;
  }
  fst::Fst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>::WriteFile((fst *)&v12, (uint64_t)__p);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  v12 = &unk_1E5D256C0;
  v7 = v13;
  if (v13)
  {
    v8 = *((_DWORD *)v13 + 14) - 1;
    *((_DWORD *)v13 + 14) = v8;
    if (!v8)
      (*(void (**)(_QWORD *))(*v7 + 8))(v7);
  }

  return 1;
}

+ (BOOL)writePlaceholderSymbolsToPath:(id)a3
{
  id v3;
  void *__p;
  char v6;
  _BYTE v7[16];
  uint64_t v8;
  _BYTE v9[408];
  _QWORD v10[20];

  v10[19] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  fst::SymbolTable::SymbolTable((fst::SymbolTable *)v7);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    __p = 0;
    v6 = 0;
  }
  std::ofstream::basic_ofstream(&v8);
  if (v6 < 0)
    operator delete(__p);
  quasar::PMBuilder::writeSymsQuasarMap((uint64_t)v7);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v9[*(_QWORD *)(v8 - 24) - 8], *(_DWORD *)&v9[*(_QWORD *)(v8 - 24) + 24] | 4);
  v8 = *MEMORY[0x1E0DE4F48];
  *(_QWORD *)&v9[*(_QWORD *)(v8 - 24) - 8] = *(_QWORD *)(MEMORY[0x1E0DE4F48] + 24);
  MEMORY[0x1AF44CA70](v9);
  std::ostream::~ostream();
  MEMORY[0x1AF44D094](v10);
  fst::SymbolTable::~SymbolTable((fst::SymbolTable *)v7);

  return 1;
}

- (id)lgFstName
{
  void *v2;
  uint64_t LGFstName;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  LGFstName = quasar::PMBuilder::getLGFstName((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  if (*(char *)(LGFstName + 23) >= 0)
    v4 = LGFstName;
  else
    v4 = *(_QWORD *)LGFstName;
  return (id)objc_msgSend(v2, "stringWithUTF8String:", v4);
}

- (id)lFstName
{
  void *v2;
  uint64_t LFstName;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  LFstName = quasar::PMBuilder::getLFstName((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  if (*(char *)(LFstName + 23) >= 0)
    v4 = LFstName;
  else
    v4 = *(_QWORD *)LFstName;
  return (id)objc_msgSend(v2, "stringWithUTF8String:", v4);
}

- (id)osymsName
{
  void *v2;
  uint64_t OsymsName;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  OsymsName = quasar::PMBuilder::getOsymsName((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  if (*(char *)(OsymsName + 23) >= 0)
    v4 = OsymsName;
  else
    v4 = *(_QWORD *)OsymsName;
  return (id)objc_msgSend(v2, "stringWithUTF8String:", v4);
}

- (shared_ptr<quasar::TextTokenizer>)tokenizer
{
  TextTokenizer **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::TextTokenizer> result;

  cntrl = self->_tokenizer.__cntrl_;
  *v2 = self->_tokenizer.__ptr_;
  v2[1] = (TextTokenizer *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (TextTokenizer *)self;
  return result;
}

- (shared_ptr<quasar::PMBuilder>)pmBuilder
{
  PMBuilder **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::PMBuilder> result;

  cntrl = self->_pmBuilder.__cntrl_;
  *v2 = self->_pmBuilder.__ptr_;
  v2[1] = (PMBuilder *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PMBuilder *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_pmBuilder);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_tokenizer);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)buildGFsts
{
  if ((a1 & 1) != 0)
    OUTLINED_FUNCTION_2_1(&dword_1AD756000, a2, a3, "Internal unknown exception", a5, a6, a7, a8, 0);
}

@end
