@implementation EARLanguageDetector

uint64_t __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke(uint64_t a1)
{
  return quasar::LanguageDetector::processAudio(*(quasar::LanguageDetector **)(*(_QWORD *)(a1 + 32) + 8), *(quasar::LDRequestState **)(a1 + 40));
}

void __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke_56(uint64_t a1, clockid_t a2)
{
  clockid_t v3;
  double Seconds;
  std::__shared_weak_count *v5;
  double v6;
  double v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  std::__shared_weak_count *v14;
  std::__shared_weak_count *v15;
  void **v16;
  uint64_t *WeakRetained;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  void **v25;
  std::__shared_weak_count *v26;
  _BYTE v27[24];
  double v28[3];
  char v29;
  uint64_t v30;

  v29 = 1;
  kaldi::Timer::Reset((kaldi::Timer *)v28, a2);
  v30 = 0;
  +[_EARLanguageDetector quasarLocalesOfMessages:](_EARLanguageDetector, "quasarLocalesOfMessages:", *(_QWORD *)(a1 + 32));
  Seconds = kaldi::Timer::GetSeconds((kaldi::Timer *)5, v3);
  v5 = *(std::__shared_weak_count **)(a1 + 56);
  if (v5)
  {
    v6 = Seconds;
    v7 = v28[0];
    v8 = std::__shared_weak_count::lock(v5);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 48);
      if (v10)
        atomic_store(COERCE_UNSIGNED_INT64((v6 - v7) * 1000.0), (unint64_t *)(v10 + 24));
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  v13 = *(std::__shared_weak_count **)(a1 + 72);
  if (v13)
  {
    v14 = std::__shared_weak_count::lock(v13);
    v26 = v14;
    if (v14)
    {
      v15 = v14;
      v16 = *(void ***)(a1 + 64);
      v25 = v16;
      if (v16)
      {
        WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
        if (WeakRetained)
        {
          +[_EARLanguageDetector updateContext:withMessageLocales:](_EARLanguageDetector, "updateContext:withMessageLocales:", *(_QWORD *)(a1 + 80), v27);
          quasar::LanguageDetector::updateContext(WeakRetained[1], (uint64_t *)v16, &v23);
          v18 = v24;
          if (v24)
          {
            v19 = (unint64_t *)&v24->__shared_owners_;
            do
              v20 = __ldaxr(v19);
            while (__stlxr(v20 - 1, v19));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          v15 = v26;

          if (!v15)
            goto LABEL_25;
        }
        else
        {

        }
      }
      v21 = (unint64_t *)&v15->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
LABEL_25:
  v25 = (void **)v27;
  std::vector<std::optional<quasar::language_detector::Locale>>::__destroy_vector::operator()[abi:ne180100](&v25);
}

@end
