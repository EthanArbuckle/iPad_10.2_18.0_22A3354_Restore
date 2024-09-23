@implementation _EARSyncResultStreamHelper

- (_EARSyncResultStreamHelper)initWithTagResults:(BOOL)a3
{
  _BOOL4 v3;
  _EARSyncResultStreamHelper *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *finishSemaphore;
  NSMutableArray *v7;
  NSMutableArray *taggedResults;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARSyncResultStreamHelper;
  v4 = -[_EARSyncResultStreamHelper init](&v10, sel_init);
  if (v4)
  {
    v5 = dispatch_semaphore_create(0);
    finishSemaphore = v4->_finishSemaphore;
    v4->_finishSemaphore = (OS_dispatch_semaphore *)v5;

    if (v3)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      taggedResults = v4->_taggedResults;
      v4->_taggedResults = v7;

    }
  }
  return v4;
}

- (_EARSyncResultStreamHelper)init
{
  return -[_EARSyncResultStreamHelper initWithTagResults:](self, "initWithTagResults:", 0);
}

- (void)waitForCompletion
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_finishSemaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5;
  void *v6;
  void *__p[2];
  char v8;

  v5 = a4;
  if (self->_taggedResults)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "partial");
    -[_EARSyncResultStreamHelper addPartialFinalTag:result:](self, "addPartialFinalTag:result:", __p, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 < 0)
      operator delete(__p[0]);
    -[NSMutableArray addObject:](self->_taggedResults, "addObject:", v6);

  }
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_error, a4);
  v6 = a4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finishSemaphore);

}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *__p[2];
  char v10;

  v6 = a4;
  objc_storeStrong((id *)&self->_results, a4);
  if (self->_taggedResults)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "final");
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSyncResultStreamHelper addPartialFinalTag:result:](self, "addPartialFinalTag:result:", __p, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 < 0)
      operator delete(__p[0]);
    -[NSMutableArray addObject:](self->_taggedResults, "addObject:", v8);

  }
}

- (id)addPartialFinalTag:()basic_string<char result:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  void *v3;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  unint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _EARSpeechRecognitionResult *v25;
  id v26;
  _EARSpeechRecognitionResult *v27;
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  void *v33[3];
  void *v34[2];
  char v35;
  __int128 *v36[3];
  void *v37[2];
  char v38;
  void *v39[2];
  char v40;
  std::string value;
  void *v42[2];
  _OWORD v43[2];
  void *v44[2];
  _OWORD v45[2];
  void *v46[2];
  _OWORD v47[2];
  void *v48[2];
  __int128 v49;
  void *__p[2];
  _OWORD v51[2];
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void **v55[3];

  v29 = v3;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&value, a3->__r_.__value_.var0.var1.__data_, a3->__r_.__value_.var0.var1.__size_);
  else
    value = (std::string)a3->__r_.__value_;
  std::string::basic_string[abi:ne180100]<0>(v39, "");
  std::string::basic_string[abi:ne180100]<0>(v37, "");
  memset(v36, 0, sizeof(v36));
  std::string::basic_string[abi:ne180100]<0>(v34, "");
  quasar::Token::Token((std::string *)v42, (__int128 *)&value, 0, 0, 0, 1, 0, (__int128 *)v39, 0.0, (__int128 *)v37, v36, 0, (__int128 *)v34, 0, 0);
  v5 = v53;
  if (v53 >= v54)
  {
    v53 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v52, (__int128 *)v42);
    if (SBYTE7(v51[0]) < 0)
      operator delete(__p[0]);
  }
  else
  {
    v6 = *(_OWORD *)v42;
    *(_QWORD *)(v53 + 16) = *(_QWORD *)&v43[0];
    *(_OWORD *)v5 = v6;
    v42[0] = 0;
    v42[1] = 0;
    v7 = *(_QWORD *)((char *)&v43[1] + 6);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)((char *)v43 + 8);
    *(_QWORD *)(v5 + 38) = v7;
    v8 = *(_QWORD *)&v45[0];
    *(_OWORD *)(v5 + 48) = *(_OWORD *)v44;
    *(_QWORD *)(v5 + 64) = v8;
    *(_QWORD *)(v5 + 72) = 0;
    *(_QWORD *)&v43[0] = 0;
    v44[0] = 0;
    v44[1] = 0;
    *(_QWORD *)(v5 + 80) = 0;
    *(_QWORD *)(v5 + 88) = 0;
    *(_OWORD *)(v5 + 72) = *(_OWORD *)((char *)v45 + 8);
    *(_QWORD *)(v5 + 88) = *((_QWORD *)&v45[1] + 1);
    memset(v45, 0, sizeof(v45));
    v9 = *(_OWORD *)v46;
    *(_QWORD *)(v5 + 112) = *(_QWORD *)&v47[0];
    *(_QWORD *)(v5 + 120) = 0;
    *(_OWORD *)(v5 + 96) = v9;
    v46[0] = 0;
    v46[1] = 0;
    *(_QWORD *)(v5 + 128) = 0;
    *(_QWORD *)(v5 + 136) = 0;
    *(_OWORD *)(v5 + 120) = *(_OWORD *)((char *)v47 + 8);
    *(_QWORD *)(v5 + 136) = *((_QWORD *)&v47[1] + 1);
    memset(v47, 0, sizeof(v47));
    v10 = *(_OWORD *)v48;
    *(_QWORD *)(v5 + 160) = v49;
    *(_OWORD *)(v5 + 144) = v10;
    v48[0] = 0;
    v48[1] = 0;
    *(_QWORD *)&v49 = 0;
    LODWORD(v8) = DWORD2(v49);
    *(_WORD *)(v5 + 172) = WORD6(v49);
    *(_DWORD *)(v5 + 168) = v8;
    v11 = *(_OWORD *)__p;
    *(_QWORD *)(v5 + 192) = *(_QWORD *)&v51[0];
    *(_OWORD *)(v5 + 176) = v11;
    __p[1] = 0;
    *(_QWORD *)&v51[0] = 0;
    __p[0] = 0;
    v12 = *(_OWORD *)((char *)v51 + 8);
    *(_DWORD *)(v5 + 216) = DWORD2(v51[1]);
    *(_OWORD *)(v5 + 200) = v12;
    v53 = v5 + 224;
  }
  if (SBYTE7(v49) < 0)
    operator delete(v48[0]);
  v55[0] = (void **)v47 + 1;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](v55);
  if (SBYTE7(v47[0]) < 0)
    operator delete(v46[0]);
  v55[0] = (void **)v45 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v55);
  if (SBYTE7(v45[0]) < 0)
    operator delete(v44[0]);
  if (SBYTE7(v43[0]) < 0)
    operator delete(v42[0]);
  if (v35 < 0)
    operator delete(v34[0]);
  v34[0] = v36;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
  if (v38 < 0)
    operator delete(v37[0]);
  if (v40 < 0)
    operator delete(v39[0]);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0)
    operator delete(value.__r_.__value_.__l.__data_);
  if (v29)
  {
    objc_msgSend(v29, "tokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; objc_msgSend(v13, "count") > i; ++i)
    {
      objc_msgSend(v13, "objectAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "quasarToken");
      }
      else
      {
        memset(v51, 0, sizeof(v51));
        v49 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)v48 = 0u;
        *(_OWORD *)v46 = 0u;
        memset(v47, 0, sizeof(v47));
        memset(v45, 0, sizeof(v45));
        *(_OWORD *)v44 = 0u;
        *(_OWORD *)v42 = 0u;
        memset(v43, 0, sizeof(v43));
      }
      v17 = v53;
      if (v53 >= v54)
      {
        v53 = std::vector<quasar::Token>::__emplace_back_slow_path<quasar::Token>(&v52, (__int128 *)v42);
        if (SBYTE7(v51[0]) < 0)
          operator delete(__p[0]);
      }
      else
      {
        v18 = *(_OWORD *)v42;
        *(_QWORD *)(v53 + 16) = *(_QWORD *)&v43[0];
        *(_OWORD *)v17 = v18;
        v42[1] = 0;
        *(_QWORD *)&v43[0] = 0;
        v42[0] = 0;
        v19 = *(_QWORD *)((char *)&v43[1] + 6);
        *(_OWORD *)(v17 + 24) = *(_OWORD *)((char *)v43 + 8);
        *(_QWORD *)(v17 + 38) = v19;
        v20 = *(_QWORD *)&v45[0];
        *(_OWORD *)(v17 + 48) = *(_OWORD *)v44;
        *(_QWORD *)(v17 + 64) = v20;
        *(_QWORD *)(v17 + 72) = 0;
        v44[1] = 0;
        *(_QWORD *)&v45[0] = 0;
        v44[0] = 0;
        *(_QWORD *)(v17 + 80) = 0;
        *(_QWORD *)(v17 + 88) = 0;
        *(_OWORD *)(v17 + 72) = *(_OWORD *)((char *)v45 + 8);
        *(_QWORD *)(v17 + 88) = *((_QWORD *)&v45[1] + 1);
        memset((char *)v45 + 8, 0, 24);
        v21 = *(_OWORD *)v46;
        *(_QWORD *)(v17 + 112) = *(_QWORD *)&v47[0];
        *(_QWORD *)(v17 + 120) = 0;
        *(_OWORD *)(v17 + 96) = v21;
        v46[1] = 0;
        *(_QWORD *)&v47[0] = 0;
        v46[0] = 0;
        *(_QWORD *)(v17 + 128) = 0;
        *(_QWORD *)(v17 + 136) = 0;
        *(_OWORD *)(v17 + 120) = *(_OWORD *)((char *)v47 + 8);
        *(_QWORD *)(v17 + 136) = *((_QWORD *)&v47[1] + 1);
        memset((char *)v47 + 8, 0, 24);
        v22 = *(_OWORD *)v48;
        *(_QWORD *)(v17 + 160) = v49;
        *(_OWORD *)(v17 + 144) = v22;
        v48[1] = 0;
        *(_QWORD *)&v49 = 0;
        v48[0] = 0;
        LODWORD(v20) = DWORD2(v49);
        *(_WORD *)(v17 + 172) = WORD6(v49);
        *(_DWORD *)(v17 + 168) = v20;
        v23 = *(_OWORD *)__p;
        *(_QWORD *)(v17 + 192) = *(_QWORD *)&v51[0];
        *(_OWORD *)(v17 + 176) = v23;
        __p[1] = 0;
        *(_QWORD *)&v51[0] = 0;
        __p[0] = 0;
        v24 = *(_OWORD *)((char *)v51 + 8);
        *(_DWORD *)(v17 + 216) = DWORD2(v51[1]);
        *(_OWORD *)(v17 + 200) = v24;
        v53 = v17 + 224;
      }
      if (SBYTE7(v49) < 0)
        operator delete(v48[0]);
      v39[0] = (char *)v47 + 8;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
      if (SBYTE7(v47[0]) < 0)
        operator delete(v46[0]);
      v39[0] = (char *)v45 + 8;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
      if (SBYTE7(v45[0]) < 0)
        operator delete(v44[0]);
      if (SBYTE7(v43[0]) < 0)
        operator delete(v42[0]);

    }
    v25 = [_EARSpeechRecognitionResult alloc];
    memset(v31, 0, sizeof(v31));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v31, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    memset(v30, 0, sizeof(v30));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v30, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    v26 = -[_EARSpeechRecognitionResult _initWithTokens:preITNTokens:](v25, "_initWithTokens:preITNTokens:", v31, v30);
    v42[0] = v30;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
    v42[0] = v31;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);

  }
  else
  {
    v27 = [_EARSpeechRecognitionResult alloc];
    memset(v33, 0, sizeof(v33));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v33, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    memset(v32, 0, sizeof(v32));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v32, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    v26 = -[_EARSpeechRecognitionResult _initWithTokens:preITNTokens:](v27, "_initWithTokens:preITNTokens:", v33, v32);
    v42[0] = v32;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
    v42[0] = v33;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
  }
  v42[0] = &v52;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);

  return v26;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)results
{
  return self->_results;
}

- (NSMutableArray)taggedResults
{
  return self->_taggedResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggedResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_finishSemaphore, 0);
}

@end
