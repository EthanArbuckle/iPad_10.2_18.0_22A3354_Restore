@implementation BWVideoProcessingInferenceAdapter

id __108__BWVideoProcessingInferenceAdapter_inferenceProviderForType_version_configuration_resourceProvider_status___block_invoke(uint64_t a1, void *a2)
{
  BWInferenceVideoFormatRequirements *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  v4 = objc_msgSend(a2, "width");
  v5 = objc_msgSend(a2, "height");
  v6 = v5;
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", (580 * v4 / v7) & 0xFFFFFFFFFFFFFFFELL);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", (580 * v6 / v7) & 0xFFFFFFFFFFFFFFFELL);
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v3, "setSupportedColorSpaceProperties:", &unk_1E4A00248);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", &unk_1E4A00260);
  v9[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
}

- (id)inferenceProviderForType:(int)a3 version:(id)a4 configuration:(id)a5 resourceProvider:(id)a6 status:(int *)a7
{
  uint64_t v12;
  BWVideoProcessingInferenceProvider *v13;
  int v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v12 = objc_msgSend(MEMORY[0x1E0C99E60], "set", *(_QWORD *)&a3, *(_QWORD *)&a4.var0);
  if (a3 != 2001)
  {
    v13 = 0;
    v14 = -31710;
    if (!a7)
      return v13;
    goto LABEL_3;
  }
  v13 = -[BWVideoProcessingInferenceProvider initWithType:analysisType:executionTarget:schedulerPriority:preventionReasons:resourceProvider:]([BWVideoProcessingInferenceProvider alloc], "initWithType:analysisType:executionTarget:schedulerPriority:preventionReasons:resourceProvider:", 2001, 4, -[BWVideoProcessingInferenceAdapter _executionTargetForAnalysisType:]((uint64_t)self, 4), objc_msgSend(a5, "priority"), v12, a6);
  -[BWVideoProcessingInferenceProvider bindVideoInputFromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:](v13, "bindVideoInputFromAttachedMediaUsingKey:preparedByAttachedMediaKey:withVideoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_8);
  v16[0] = getVCPCaptureAnalysisSubjectMotionScoreKey();
  v16[1] = getVCPCaptureAnalysisMotionDivScoreKey();
  -[BWVideoProcessingInferenceProvider bindOutputMetadataKeys:](v13, "bindOutputMetadataKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2));
  v14 = 0;
  if (a7)
LABEL_3:
    *a7 = v14;
  return v13;
}

- (uint64_t)_executionTargetForAnalysisType:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    if (a2 == 4)
      return 4;
    if (a2 <= 127)
    {
      if (((unint64_t)(a2 - 8) > 0x38 || ((1 << (a2 - 8)) & 0x100000001000101) == 0)
        && (unint64_t)a2 >= 3)
      {
        goto LABEL_19;
      }
LABEL_17:
      v2 = (void *)MEMORY[0x1E0C99DA0];
      v3 = *MEMORY[0x1E0C99750];
      v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Analysis type %lu is not currently known to the BWInferenceEngine"), a2);
      v5 = v2;
      v6 = v3;
      goto LABEL_18;
    }
    if (a2 <= 511)
    {
      if (a2 == 128 || a2 == 256)
        goto LABEL_17;
    }
    else if (a2 == 512 || a2 == 2048 || a2 == 1024)
    {
      goto LABEL_17;
    }
LABEL_19:
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v4 = CFSTR("BWInferenceEngine does not currently support the combination of multiple VCPCaptureAnalysisTypes");
LABEL_18:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v4, 0));
  }
  return result;
}

@end
