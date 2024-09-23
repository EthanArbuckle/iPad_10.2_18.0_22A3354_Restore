@implementation _EARPronunciationRecognition

- (_EARPronunciationRecognition)initWithConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  quasar::ptt::PronunciationRecognizer *v10;
  char *v12;
  objc_super v13;
  void *__p[2];
  char v15;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EARPronunciationRecognition;
  v5 = -[_EARPronunciationRecognition init](&v13, sel_init);
  if (v5)
  {
    v12 = (char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
    std::make_unique[abi:ne180100]<quasar::SystemConfig,char const*>(&v12, (quasar::SystemConfig **)__p);
    v6 = __p[0];
    __p[0] = 0;
    v7 = *((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;
    if (v7)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 56))(v7);
      v8 = __p[0];
      __p[0] = 0;
      if (v8)
        (*(void (**)(void *))(*(_QWORD *)v8 + 56))(v8);
    }
    v9 = *((_QWORD *)v5 + 1);
    v10 = (quasar::ptt::PronunciationRecognizer *)operator new();
    std::string::basic_string[abi:ne180100]<0>(__p, "ptt");
    quasar::ptt::PronunciationRecognizer::PronunciationRecognizer(v10, v9, __p);
    if (v15 < 0)
      operator delete(__p[0]);
    std::unique_ptr<quasar::ptt::PronunciationRecognizer>::reset[abi:ne180100]((quasar::ptt::PronunciationRecognizer **)v5 + 2, v10);
  }

  return (_EARPronunciationRecognition *)v5;
}

- (id)transcribePronunciation:(id)a3
{
  id v4;
  void *v5;
  _EARSpeechRecognition *v6;
  void *v7;
  id v8;
  void *__p[2];
  char v11;
  std::string v12;
  uint64_t v13[3];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "ear_toString");
  else
    memset(&v12, 0, sizeof(v12));
  std::string::basic_string[abi:ne180100]<0>(__p, " ");
  quasar::splitAndTrimNoEmpty(&v12, (char *)__p, v13);
  if (v11 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  quasar::ptt::PronunciationRecognizer::run((uint64_t)self->_recognizer.__ptr_.__value_, v13, 0, (__int128 *)&v12);
  v6 = [_EARSpeechRecognition alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_EARSpeechRecognition _initWithNBestList:useHatText:endsOfSentencePunctuations:](v6, "_initWithNBestList:useHatText:endsOfSentencePunctuations:", &v12, 0, v7);

  __p[0] = &v12;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);

  return v8;
}

- (void)transcribeMultipleFromJsonResultsPath:(id)a3
{
  id v4;
  SystemConfig *value;
  id v6;
  PronunciationRecognizer *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  FILE **v13;
  FILE *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  float *v19;
  int v20;
  float v21;
  double *v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  __int128 v34;
  int v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39[2];
  void *__p[2];
  __int128 v41;
  void *v42;
  char *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[24];
  _BYTE *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  value = self->_sysConfig.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&v34, "SearchOrMessaging");
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&v45, (char *)objc_msgSend(v6, "fileSystemRepresentation"));
  v43 = 0;
  v44 = 0;
  v42 = &v43;
  *(_OWORD *)__p = 0u;
  v41 = 0u;
  *(_OWORD *)v39 = 0u;
  quasar::rescoring::createJSONResultNBestListIterator((const quasar::SystemConfig *)value, &v34, &v45, (const void ***)&v42, (uint64_t)v39, &v47);
  if (SHIBYTE(v41) < 0)
    operator delete(__p[1]);
  if (SHIBYTE(__p[0]) < 0)
    operator delete(v39[0]);
  std::__tree<std::string>::destroy((uint64_t)&v42, v43);
  if (SHIBYTE(v46) < 0)
    operator delete((void *)v45);
  if (v36 < 0)
    operator delete((void *)v34);
  v45 = 0uLL;
  v46 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v7 = self->_recognizer.__ptr_.__value_;
  v8 = v47;
  v47 = 0;
  v37 = v8;
  v38 = 0;
  v49 = 0;
  v9 = operator new(0x20uLL);
  *v9 = &off_1E5D3D2A8;
  v9[1] = &v45;
  v9[2] = &v42;
  v9[3] = &v38;
  v49 = v9;
  quasar::ptt::RecognizePronunciationsBatch((uint64_t)v7, &v37, (uint64_t)v48);
  v10 = v49;
  if (v49 == v48)
  {
    v11 = 4;
    v10 = v48;
  }
  else
  {
    if (!v49)
      goto LABEL_14;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_14:
  v12 = v37;
  v37 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 32))(v12);
  v13 = (FILE **)MEMORY[0x1E0C80C10];
  v14 = (FILE *)*MEMORY[0x1E0C80C10];
  if ((_QWORD)v45 == *((_QWORD *)&v45 + 1))
  {
    fwrite("No results.\n", 0xCuLL, 1uLL, v14);
  }
  else
  {
    fprintf(v14, "Decoding failed for %ld utterances (likely because they required too much memory).\n", v38);
    kaldi::Matrix<float>::Matrix((uint64_t)v39, (*((_QWORD *)&v45 + 1) - (_QWORD)v45) >> 3, 1, 0, 0);
    v15 = v45;
    if (*((_QWORD *)&v45 + 1) != (_QWORD)v45)
    {
      v16 = 0;
      v17 = 0;
      v18 = (uint64_t)(*((_QWORD *)&v45 + 1) - v45) >> 3;
      v19 = (float *)v39[0];
      v20 = (int)__p[0];
      if (v18 <= 1)
        v18 = 1;
      do
      {
        v21 = *(double *)(v15 + 8 * v17);
        v19[v16] = v21;
        ++v17;
        v16 += v20;
      }
      while (v18 != v17);
    }
    kaldi::Matrix<float>::Matrix((uint64_t)&v34, (unint64_t)(v43 - (_BYTE *)v42) >> 3, 1, 0, 0);
    v22 = (double *)v42;
    if (v43 != v42)
    {
      v23 = 0;
      v24 = 0;
      v25 = (v43 - (_BYTE *)v42) >> 3;
      v26 = v34;
      v27 = v35;
      if (v25 <= 1)
        v25 = 1;
      do
      {
        v28 = v22[v24];
        *(float *)(v26 + 4 * v23) = v28;
        ++v24;
        v23 += v27;
      }
      while (v25 != v24);
    }
    quasar::rescoring::ComputeSpearmanCorrelation((uint64_t)v39, (uint64_t)&v34);
    v30 = v29;
    kaldi::Matrix<float>::~Matrix((uint64_t)&v34);
    kaldi::Matrix<float>::~Matrix((uint64_t)v39);
    std::__sort<std::__less<double,double> &,double *>();
    v31 = (uint64_t)(*((_QWORD *)&v45 + 1) - v45) >> 3;
    fprintf(*v13, "Decoding durations: N=%ld P50=%.2fms P90=%.2fms P95=%.2fms P99=%.2fms\n", v31, *(double *)(v45 + 8 * (unint64_t)((double)(unint64_t)v31 * 0.5)) * 1000.0, *(double *)(v45 + 8 * (unint64_t)((double)(unint64_t)v31 * 0.9)) * 1000.0, *(double *)(v45 + 8 * (unint64_t)((double)(unint64_t)v31 * 0.95)) * 1000.0, *(double *)(v45 + 8 * (unint64_t)((double)(unint64_t)v31 * 0.99)) * 1000.0);
    std::__sort<std::__less<double,double> &,double *>();
    v32 = (v43 - (_BYTE *)v42) >> 3;
    fprintf(*v13, "Phone length: N=%ld P50=%.2f P90=%.2f P95=%.2f P99=%.2f\n", v32, *((double *)v42 + (unint64_t)((double)(unint64_t)v32 * 0.5)), *((double *)v42 + (unint64_t)((double)(unint64_t)v32 * 0.9)), *((double *)v42 + (unint64_t)((double)(unint64_t)v32 * 0.95)), *((double *)v42 + (unint64_t)((double)(unint64_t)v32 * 0.99)));
    fprintf(*v13, "Spearman correlation coefficient between decoding duration and # of phones: %.5f\n", v30);
  }
  if (v42)
  {
    v43 = (char *)v42;
    operator delete(v42);
  }
  if ((_QWORD)v45)
  {
    *((_QWORD *)&v45 + 1) = v45;
    operator delete((void *)v45);
  }
  v33 = v47;
  v47 = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 32))(v33);

}

- (void).cxx_destruct
{
  SystemConfig *value;

  std::unique_ptr<quasar::ptt::PronunciationRecognizer>::reset[abi:ne180100]((quasar::ptt::PronunciationRecognizer **)&self->_recognizer, 0);
  value = self->_sysConfig.__ptr_.__value_;
  self->_sysConfig.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(SystemConfig *))value->_vptr$OptionsItf + 7))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)transcribeMultipleFromJsonResultsPath:
{
}

- (__n128)transcribeMultipleFromJsonResultsPath:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E5D3D2A8;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)transcribeMultipleFromJsonResultsPath:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
