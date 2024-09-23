@implementation CSBeepCanceller

- (CSBeepCanceller)init
{
  char *v2;
  id v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void **v21;
  NSObject *v22;
  int v23;
  _BYTE *v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  size_t v28;
  char *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  float v34;
  float v35;
  double v36;
  double v37;
  unint64_t v38;
  float v39;
  unsigned int v40;
  int v41;
  NSObject *v42;
  _BOOL4 v43;
  char *v44;
  _BYTE *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  __int16 v56;
  char *v57;
  CSBeepCanceller *v58;
  void *v60;
  id v61;
  void *v62;
  unsigned int v63;
  id v64;
  objc_super v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)CSBeepCanceller;
  v2 = -[CSBeepCanceller init](&v65, sel_init);
  if (!v2)
    goto LABEL_56;
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
  v5 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v4;

  +[CSAsset fallBackAssetResourcePath](CSAsset, "fallBackAssetResourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("jbl_begin.bin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[CSBeepCanceller init]";
    v68 = 2114;
    v69 = (uint64_t)v7;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s BeepCanceller asset file loading from : %{public}@", buf, 0x16u);
  }
  v64 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 8, &v64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v64;
  v11 = v10;
  if (v9 && !v10)
  {
    v62 = v7;
    v61 = objc_retainAutorelease(v9);
    v12 = (char *)objc_msgSend(v61, "bytes");
    v13 = objc_msgSend(v61, "length");
    v14 = v13;
    v15 = v2 + 24;
    v16 = (char *)*((_QWORD *)v2 + 3);
    v17 = v13 >> 2;
    v18 = *((_QWORD *)v2 + 5);
    if (v13 >> 2 <= (unint64_t)((v18 - (uint64_t)v16) >> 2))
    {
      v21 = (void **)(v2 + 32);
      v24 = (_BYTE *)*((_QWORD *)v2 + 4);
      v25 = (v24 - v16) >> 2;
      if (v25 < v17)
      {
        v60 = v6;
        v26 = (unint64_t)v13 >> 2;
        v27 = &v12[4 * ((unint64_t)v13 >> 2)];
        if (v24 != v16)
        {
          memmove(v16, v12, v24 - v16);
          v16 = (char *)*v21;
        }
        v28 = v27 - &v12[4 * v25];
        if (v25 != v26)
          memmove(v16, &v12[4 * v25], v28);
        v6 = v60;
LABEL_27:
        v29 = &v16[v28];
        *v21 = &v16[v28];
        v30 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (uint64_t)&v29[-*v15] >> 2;
          *(_DWORD *)buf = 136315394;
          v67 = "-[CSBeepCanceller init]";
          v68 = 2050;
          v69 = v31;
          _os_log_impl(&dword_1B502E000, v30, OS_LOG_TYPE_DEFAULT, "%s beepVector Size = %{public}lu", buf, 0x16u);
        }
        v32 = operator new();
        *(_DWORD *)(v32 + 80) = 0;
        *(_OWORD *)v32 = 0u;
        *(_OWORD *)(v32 + 16) = 0u;
        *(_OWORD *)(v32 + 32) = 0u;
        *(_OWORD *)(v32 + 48) = 0u;
        *(_OWORD *)(v32 + 60) = 0u;
        *(_OWORD *)(v32 + 88) = 0u;
        *(_OWORD *)(v32 + 104) = 0u;
        *(_OWORD *)(v32 + 120) = 0u;
        *(_OWORD *)(v32 + 136) = 0u;
        *(_OWORD *)(v32 + 152) = 0u;
        *(_OWORD *)(v32 + 168) = 0u;
        *(_OWORD *)(v32 + 184) = 0u;
        *(_OWORD *)(v32 + 200) = 0u;
        *(_OWORD *)(v32 + 213) = 0u;
        *(_QWORD *)(v32 + 240) = 0;
        *(_QWORD *)(v32 + 248) = 0;
        *(_QWORD *)(v32 + 232) = 0;
        *(_DWORD *)(v32 + 256) = 0;
        *(_DWORD *)(v32 + 288) = 4;
        *(_OWORD *)(v32 + 292) = xmmword_1B50D76B0;
        *(_DWORD *)(v32 + 308) = 2;
        *(_OWORD *)(v32 + 312) = xmmword_1B50D76C0;
        *(_OWORD *)(v32 + 328) = xmmword_1B50D7660;
        *(_QWORD *)(v32 + 344) = 0x4000000001;
        *(_DWORD *)(v32 + 352) = 16000;
        *(_OWORD *)(v32 + 360) = 0u;
        *(_OWORD *)(v32 + 376) = 0u;
        *(_OWORD *)(v32 + 392) = 0u;
        *(_OWORD *)(v32 + 408) = 0u;
        *(_OWORD *)(v32 + 424) = 0u;
        *(_OWORD *)(v32 + 440) = 0u;
        *(_QWORD *)(v32 + 456) = 0;
        *(_OWORD *)(v32 + 592) = 0u;
        *(_OWORD *)(v32 + 608) = 0u;
        *(_OWORD *)(v32 + 560) = 0u;
        *(_OWORD *)(v32 + 576) = 0u;
        *(_OWORD *)(v32 + 528) = 0u;
        *(_OWORD *)(v32 + 544) = 0u;
        std::unique_ptr<BatchBeepCanceller>::reset[abi:ne180100]((uint64_t *)v2 + 2, v32);
        v33 = (_QWORD *)(*((_QWORD *)v2 + 2) + 260);
        *(_DWORD *)(*((_QWORD *)v2 + 2) + 284) = 0;
        v33[1] = 0;
        v33[2] = 0;
        *v33 = 0x1FFFFFFFFCLL;
        +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
        v35 = v34;
        +[CSConfig inputRecordingBufferDuration](CSConfig, "inputRecordingBufferDuration");
        v37 = v36;
        v38 = +[CSConfig zeroFilterWindowSizeInMs](CSConfig, "zeroFilterWindowSizeInMs");
        +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
        v40 = vcvtpd_u64_f64((double)v38 / 1000.0 * v39) + vcvtpd_u64_f64(v37 * v35);
        v63 = v40;
        v41 = BatchBeepCanceller::initialize(*((BatchBeepCanceller **)v2 + 2), (uint64_t)(v2 + 24), 0, &correlationOrder, &v63, &minWaitForBeep, &maxWaitForBeep, &waitForMax, &causalityMargin, correlationThreshold);
        v42 = CSLogContextFacilityCoreSpeech;
        v43 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
        if (v41)
        {
          if (v43)
          {
            *(_DWORD *)buf = 136315138;
            v67 = "-[CSBeepCanceller init]";
            _os_log_impl(&dword_1B502E000, v42, OS_LOG_TYPE_DEFAULT, "%s Cannot initialize beep canceller", buf, 0xCu);
          }
          v23 = 1;
          goto LABEL_53;
        }
        if (v43)
        {
          *(_DWORD *)buf = 136315394;
          v67 = "-[CSBeepCanceller init]";
          v68 = 1026;
          LODWORD(v69) = v40;
          _os_log_impl(&dword_1B502E000, v42, OS_LOG_TYPE_DEFAULT, "%s Beep canceller initialized with maxNumSamples = %{public}d", buf, 0x12u);
        }
        std::vector<float>::resize((char **)v2 + 6, 0x109A0uLL);
        v44 = (char *)*((_QWORD *)v2 + 9);
        v45 = (_BYTE *)*((_QWORD *)v2 + 10);
        v46 = v45 - v44;
        if ((unint64_t)(v45 - v44) >> 6 > 0x84C)
        {
          if (v46 == 136000)
          {
LABEL_52:
            v23 = 0;
            goto LABEL_53;
          }
          v23 = 0;
          v57 = v44 + 136000;
        }
        else
        {
          v47 = 68000 - (v46 >> 1);
          v48 = *((_QWORD *)v2 + 11);
          if (v47 > (v48 - (uint64_t)v45) >> 1)
          {
            v49 = v48 - (_QWORD)v44;
            v50 = 68000;
            if (v49 > 0x109A0)
              v50 = v49;
            if (v49 >= 0x7FFFFFFFFFFFFFFELL)
              v51 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v51 = v50;
            if (v51 < 0)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v52 = (char *)operator new(2 * v51);
            v53 = &v52[2 * (v46 >> 1)];
            v54 = &v52[2 * v51];
            bzero(v53, 2 * v47);
            v55 = &v53[2 * v47];
            while (v45 != v44)
            {
              v56 = *((_WORD *)v45 - 1);
              v45 -= 2;
              *((_WORD *)v53 - 1) = v56;
              v53 -= 2;
            }
            *((_QWORD *)v2 + 9) = v53;
            *((_QWORD *)v2 + 10) = v55;
            *((_QWORD *)v2 + 11) = v54;
            if (v44)
              operator delete(v44);
            goto LABEL_52;
          }
          bzero(*((void **)v2 + 10), 2 * v47);
          v23 = 0;
          v57 = &v45[2 * v47];
        }
        *((_QWORD *)v2 + 10) = v57;
LABEL_53:
        v11 = 0;
        v7 = v62;
        goto LABEL_54;
      }
    }
    else
    {
      if (v16)
      {
        *((_QWORD *)v2 + 4) = v16;
        operator delete(v16);
        v18 = 0;
        *v15 = 0;
        *((_QWORD *)v2 + 4) = 0;
        *((_QWORD *)v2 + 5) = 0;
      }
      if ((v14 & 0x8000000000000000) != 0)
        std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
      v19 = v18 >> 1;
      if (v18 >> 1 <= v17)
        v19 = v17;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
        v20 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      std::vector<float>::__vallocate[abi:ne180100]((_QWORD *)v2 + 3, v20);
      v21 = (void **)(v2 + 32);
      v16 = (char *)*((_QWORD *)v2 + 4);
    }
    v28 = v14 & 0xFFFFFFFFFFFFFFFCLL;
    if (v14 >= 4)
      memmove(v16, v12, v14 & 0xFFFFFFFFFFFFFFFCLL);
    goto LABEL_27;
  }
  v22 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[CSBeepCanceller init]";
    v68 = 2112;
    v69 = (uint64_t)v7;
    _os_log_error_impl(&dword_1B502E000, v22, OS_LOG_TYPE_ERROR, "%s Could not read beep file: %@", buf, 0x16u);
  }
  v23 = 1;
LABEL_54:

  if (!v23)
  {
LABEL_56:
    v58 = v2;
    goto LABEL_57;
  }
  v58 = 0;
LABEL_57:

  return v58;
}

- (void)cancelBeepFromSamples:(id)a3 timestamp:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CSBeepCanceller *v11;
  unint64_t v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CSBeepCanceller_cancelBeepFromSamples_timestamp___block_invoke;
  block[3] = &unk_1E687FCC0;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)willBeep
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSBeepCanceller willBeep]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s It will beep now", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CSBeepCanceller_willBeep__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)reset
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSBeepCanceller reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Reset beep cancellation", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CSBeepCanceller_reset__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSDictionary)metrics
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7092;
  v10 = __Block_byref_object_dispose__7093;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CSBeepCanceller_metrics__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (CSBeepCancellerDelegate)delegate
{
  return (CSBeepCancellerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  signed __int16 *begin;
  float *v4;
  float *v5;

  objc_destroyWeak((id *)&self->_delegate);
  begin = self->_shortBuffer.__begin_;
  if (begin)
  {
    self->_shortBuffer.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_floatBuffer.__begin_;
  if (v4)
  {
    self->_floatBuffer.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_beepFloatVec.__begin_;
  if (v5)
  {
    self->_beepFloatVec.__end_ = v5;
    operator delete(v5);
  }
  std::unique_ptr<BatchBeepCanceller>::reset[abi:ne180100]((uint64_t *)&self->_beepCanceller, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

void __26__CSBeepCanceller_metrics__block_invoke(uint64_t a1)
{
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[9];
  _QWORD v27[11];

  v27[9] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = v2[66];
  v4 = v2[67];
  v5 = v2[68];
  v6 = v2[69];
  v7 = v2[70];
  v8 = v2[71];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2[65], CFSTR("beepLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v26[1] = CFSTR("statsComputed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  v26[2] = CFSTR("beepPower");
  LODWORD(v11) = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v12;
  v26[3] = CFSTR("signalPower");
  LODWORD(v13) = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v14;
  v26[4] = CFSTR("originalPower");
  LODWORD(v15) = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v16;
  v26[5] = CFSTR("absMaxVal");
  LODWORD(v17) = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v18;
  v26[6] = CFSTR("above95pcOfMax");
  LODWORD(v19) = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v20;
  v26[7] = CFSTR("totalInputSamples");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v21;
  v26[8] = CFSTR("totalOutputSamples");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

}

void __24__CSBeepCanceller_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  *(_DWORD *)(v2 + 284) = 0;
  *(_QWORD *)(v2 + 268) = 0;
  *(_QWORD *)(v2 + 276) = 0;
  *(_QWORD *)(v2 + 260) = 0x1FFFFFFFFCLL;
  BatchBeepCanceller::reset(*(BatchBeepCanceller **)(*(_QWORD *)(a1 + 32) + 16));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
}

uint64_t __27__CSBeepCanceller_willBeep__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  if (!*(_BYTE *)(v1 + 228))
  {
    *(_DWORD *)(v1 + 260) = -3;
    *(_DWORD *)(v1 + 284) = 0;
    *(_QWORD *)(v1 + 268) = 0;
    *(_QWORD *)(v1 + 276) = 0;
  }
  *(_DWORD *)(v1 + 224) = 1;
  return result;
}

void __51__CSBeepCanceller_cancelBeepFromSamples_timestamp___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v8;
  const void *v9;
  size_t v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  id v14;
  float *v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:](CSFLPCMTypeConverter, "convertToFloatLPCMBufFromShortLPCMBuf:", *(_QWORD *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = v2 >> 1;

  v6 = (v2 >> 1);
  if (v6)
    memmove(*(void **)(*(_QWORD *)(a1 + 40) + 48), v4, 4 * v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) += v6;
  v15 = 0;
  v7 = BatchBeepCanceller::feedFloat(*(BatchBeepCanceller **)(*(_QWORD *)(a1 + 40) + 16), *(const float **)(*(_QWORD *)(a1 + 40) + 48), v5, (const float **)&v15);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 4 * v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:](CSFLPCMTypeConverter, "convertToShortLPCMBufFromFloatLPCMBuf:");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const void *)objc_msgSend(v8, "bytes");

  if (v7)
  {
    v10 = 2 * v7;
    memmove(*(void **)(*(_QWORD *)(a1 + 40) + 72), v9, v10);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) += v7;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(v12 + 72), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "beepCancellerDidCancelSamples:buffer:timestamp:", v12, v13, *(_QWORD *)(a1 + 48));

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);
  }

}

@end
