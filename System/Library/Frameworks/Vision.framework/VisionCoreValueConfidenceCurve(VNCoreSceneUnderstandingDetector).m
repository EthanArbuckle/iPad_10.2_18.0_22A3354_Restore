@implementation VisionCoreValueConfidenceCurve(VNCoreSceneUnderstandingDetector)

+ (id)VNCurveForCSUMetricOperatingPointCurve:()VNCoreSceneUnderstandingDetector error:
{
  id v6;
  unint64_t v7;
  void *v8;
  _QWORD v10[7];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  void (*v16)(uint64_t);
  const char *v17;
  void *__p[3];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  __n128 (*v22)(__n128 *, __n128 *);
  void (*v23)(uint64_t);
  const char *v24;
  void *v25[3];

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v19 = 0;
  v20 = &v19;
  v21 = 0x4812000000;
  v22 = __Block_byref_object_copy__23475;
  v23 = __Block_byref_object_dispose__23476;
  v24 = "";
  std::vector<float>::vector(v25, v7);
  v12 = 0;
  v13 = &v12;
  v14 = 0x4812000000;
  v15 = __Block_byref_object_copy__23475;
  v16 = __Block_byref_object_dispose__23476;
  v17 = "";
  std::vector<float>::vector(__p, v7);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __113__VisionCoreValueConfidenceCurve_VNCoreSceneUnderstandingDetector__VNCurveForCSUMetricOperatingPointCurve_error___block_invoke;
  v10[3] = &unk_1E4546E10;
  v10[4] = &v19;
  v10[5] = v11;
  v10[6] = &v12;
  objc_msgSend(v6, "enumerateUsingBlock:", v10);
  objc_msgSend(a1, "curveWithValues:confidences:count:error:", v20[6], v13[6], v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  _Block_object_dispose(&v19, 8);
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }

  return v8;
}

@end
