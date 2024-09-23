@implementation EARLanguageDetectorV2

void __51___EARLanguageDetectorV2_languageDetectorV2Result___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  float v7;
  float v8;
  int v9;
  double v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = a3;
  objc_msgSend(v6, "floatValue");
  v8 = v7;
  v9 = objc_msgSend(v12, "hasPrefix:", CFSTR("en"));
  v10 = v8;
  if (v9)
    *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = *(double *)(*(_QWORD *)(a1[4] + 8) + 24) + v10;
  v11 = *(_QWORD *)(a1[5] + 8);
  if (*(double *)(v11 + 24) < v10)
  {
    *(double *)(v11 + 24) = v10;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __43___EARLanguageDetectorV2__startComputeTask__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  int v5;
  void *v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _EARLanguageDetectorV2LoggingInfo *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[16];
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v2 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 48) + 16) + 8))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
  v3 = quasar::PSRAudioProcessor::frameDurationMs(*(quasar::PSRAudioProcessor **)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "lidDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = 0;
  v28 = 0;
  kaldi::Vector<float>::Resize(&v26, v2, 0);
  v5 = 0;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    kaldi::Matrix<float>::Matrix((uint64_t)buf, 1, v2, 0, 0);
    v8 = quasar::PSRAudioProcessor::compute(*(_QWORD *)(a1 + 48), (uint64_t)buf);
    if ((int)kaldi::MatrixBase<float>::NumRows((uint64_t)buf) >= 1)
      break;
LABEL_13:
    kaldi::Matrix<float>::~Matrix((uint64_t)buf);
    if ((v8 & 1) == 0)
      goto LABEL_16;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1608), "useMaxpool"))
  {
    if (!v7)
    {
      v22 = 0;
      v23 = 0;
      v21 = *(_QWORD *)buf;
      v9 = kaldi::MatrixBase<float>::NumCols((uint64_t)buf);
      LODWORD(v22) = v9;
      kaldi::Vector<float>::Resize(&v26, v9, 1);
      kaldi::VectorBase<float>::CopyFromVec((uint64_t)&v26, (const void **)&v21);
    }
    maxpool((uint64_t)buf, &v26);
    v21 = 0;
    v22 = 0;
    v23 = 0;
    kaldi::Vector<float>::Resize((void **)&v21, v27, 1);
    kaldi::VectorBase<float>::CopyFromVec((uint64_t)&v21, (const void **)&v26);
    objc_msgSend(*(id *)(a1 + 32), "earLIDScores:", &v21);
    v10 = objc_claimAutoreleasedReturnValue();

    kaldi::Vector<float>::Destroy((uint64_t)&v21);
  }
  else
  {
    v11 = kaldi::MatrixBase<float>::NumRows((uint64_t)buf);
    v22 = 0;
    v23 = 0;
    v21 = *(_QWORD *)buf + 4 * v25 * (v11 - 1);
    LODWORD(v22) = kaldi::MatrixBase<float>::NumCols((uint64_t)buf);
    objc_msgSend(*(id *)(a1 + 32), "earLIDScores:", &v21);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)v10;
  v7 += kaldi::MatrixBase<float>::NumRows((uint64_t)buf) * v3;
  if ((v8 & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldReportResults:reportingFrequency:", v7 - v5, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1608), "reportingFrequency")))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v12, "languageDetectorV2Result:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "languageDetector:didProduceResult:processedAudioDuration:", v12, v13, (double)v7 / 1000.0);

      }
      v5 = v7;
    }
    goto LABEL_13;
  }
  kaldi::Matrix<float>::~Matrix((uint64_t)buf);
LABEL_16:
  if (v5 < v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "languageDetectorV2Result:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "languageDetector:didProduceResult:processedAudioDuration:", v14, v15, (double)v7 / 1000.0);

  }
  v16 = objc_opt_respondsToSelector();
  if ((v16 & 1) != 0)
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_alloc_init(_EARLanguageDetectorV2LoggingInfo);
    objc_msgSend(v20, "languageDetector:didCompleteProcessingWithLoggingInfo:", v17, v18);

  }
  EARLogger::QuasarOSLogger((EARLogger *)v16);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v19, OS_LOG_TYPE_INFO, "ComputeTask done", buf, 2u);
  }

  kaldi::Vector<float>::Destroy((uint64_t)&v26);
}

@end
