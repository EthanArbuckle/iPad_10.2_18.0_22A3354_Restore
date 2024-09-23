@implementation BWSharpnessScoreReferenceFrameSelector

+ (id)externalMemoryDescriptorWithMaxInputDimensions:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D08A80]), "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", a3, 0, 0, 0, 0);
  return (id)objc_msgSend(MEMORY[0x1E0D08AB0], "externalMemoryDescriptorForConfiguration:", v3);
}

- (BWSharpnessScoreReferenceFrameSelector)initWithCommandQueue:(id)a3 externalMemoryResource:(id)a4 candidateCount:(int)a5
{
  BWSharpnessScoreReferenceFrameSelector *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWSharpnessScoreReferenceFrameSelector;
  v8 = -[BWSharpnessScoreReferenceFrameSelector init](&v10, sel_init);
  if (v8)
  {
    if (a4)
      v8->_sharpnessScoreCalculator = (CMISharpnessScore *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08AB0]), "initWithOptionalCommandQueue:externalMemoryResource:kernelWeights:", a3, a4, 0);
    v8->_candidateFrameCount = a5;
    v8->_currentCandidateSharpnessScore = NAN;
    v8->_faceScoresEnabled = 0;
    v8->_maxNumberOfFaceScores = 1;
  }
  return v8;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *currentCandidateFrame;
  objc_super v4;

  currentCandidateFrame = self->_currentCandidateFrame;
  if (currentCandidateFrame)
    CFRelease(currentCandidateFrame);
  v4.receiver = self;
  v4.super_class = (Class)BWSharpnessScoreReferenceFrameSelector;
  -[BWSharpnessScoreReferenceFrameSelector dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)addReferenceFrameCandidate:(opaqueCMSampleBuffer *)a3 referenceFrameOut:(opaqueCMSampleBuffer *)a4
{
  opaqueCMSampleBuffer *v5;
  int candidateFrameCount;
  int receivedCandidateFrameCount;
  int v9;
  opaqueCMSampleBuffer *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CFDictionaryRef DictionaryRepresentation;
  unint64_t v18;
  unint64_t maxNumberOfFaceScores;
  uint64_t v20;
  int v21;
  float v22;
  float v23;
  void *v24;
  float currentCandidateSharpnessScore;
  opaqueCMSampleBuffer *currentCandidateFrame;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  float v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;

  v5 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  if (!a3
    || (candidateFrameCount = self->_candidateFrameCount,
        receivedCandidateFrameCount = self->_receivedCandidateFrameCount,
        v9 = receivedCandidateFrameCount + 1,
        self->_receivedCandidateFrameCount = receivedCandidateFrameCount + 1,
        receivedCandidateFrameCount >= candidateFrameCount))
  {
LABEL_41:
    v10 = 0;
    if (!a4)
      return v5;
    goto LABEL_39;
  }
  if (candidateFrameCount <= 1)
  {
    v10 = (opaqueCMSampleBuffer *)CFRetain(a3);
    v5 = 0;
    if (!a4)
      return v5;
    goto LABEL_39;
  }
  if (self->_sharpnessScoreCalculator)
  {
    if (self->_faceScoresEnabled
      && self->_maxNumberOfFaceScores >= 1
      && (v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]), "objectForKeyedSubscript:", *MEMORY[0x1E0D064A0]), "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]), objc_msgSend(v11, "count")))
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      BWPixelBufferDimensionsFromSampleBuffer(v5);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v43;
        v34 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        v35 = *MEMORY[0x1E0C9D628];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v43 != v15)
              objc_enumerationMutation(v11);
            v40 = v35;
            v41 = v34;
            if (FigCFDictionaryGetCGRectIfPresent())
            {
              FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v40, *((double *)&v40 + 1), *(double *)&v41, *((double *)&v41 + 1));
              DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v49);
              objc_msgSend(v12, "addObject:", DictionaryRepresentation);

            }
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v14);
      }
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_102, v34, v35);
      v18 = objc_msgSend(v12, "count");
      if (v18 >= self->_maxNumberOfFaceScores)
        maxNumberOfFaceScores = self->_maxNumberOfFaceScores;
      else
        maxNumberOfFaceScores = v18;
      v20 = objc_msgSend(v12, "subarrayWithRange:", 0, maxNumberOfFaceScores);
    }
    else
    {
      v20 = 0;
    }
    *(_QWORD *)&v40 = 0;
    v21 = -[CMISharpnessScore calculateFromPixelBuffer:andFromRoi:sourceComponent:toResult:](self->_sharpnessScoreCalculator, "calculateFromPixelBuffer:andFromRoi:sourceComponent:toResult:", CMSampleBufferGetImageBuffer(v5), v20, 0, &v40);
    objc_msgSend((id)v40, "fullImageScore");
    v23 = v22;
    v24 = (void *)objc_msgSend((id)v40, "facesScores");
    if (v21)
    {
      v23 = 1.1755e-38;
    }
    else
    {
      v28 = v24;
      if (objc_msgSend(v24, "count"))
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v37 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "floatValue");
              if (v23 < v33)
                v23 = v33;
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          }
          while (v30);
        }
      }
    }
    candidateFrameCount = self->_candidateFrameCount;
    v9 = self->_receivedCandidateFrameCount;
  }
  else if (receivedCandidateFrameCount <= 0)
  {
    v23 = 0.0;
  }
  else
  {
    v23 = 1.1755e-38;
  }
  currentCandidateSharpnessScore = self->_currentCandidateSharpnessScore;
  if (v9 != candidateFrameCount)
  {
    if (v23 > currentCandidateSharpnessScore)
    {
      currentCandidateFrame = self->_currentCandidateFrame;
      v10 = 0;
      self->_currentCandidateFrame = (opaqueCMSampleBuffer *)CFRetain(v5);
      self->_currentCandidateSharpnessScore = v23;
      v5 = currentCandidateFrame;
      if (!a4)
        return v5;
      goto LABEL_39;
    }
    v5 = (opaqueCMSampleBuffer *)CFRetain(v5);
    goto LABEL_41;
  }
  if (v23 <= currentCandidateSharpnessScore)
  {
    v10 = self->_currentCandidateFrame;
    v5 = (opaqueCMSampleBuffer *)CFRetain(v5);
  }
  else
  {
    v10 = (opaqueCMSampleBuffer *)CFRetain(v5);
    v5 = self->_currentCandidateFrame;
  }
  self->_currentCandidateFrame = 0;
  if (a4)
LABEL_39:
    *a4 = v10;
  return v5;
}

uint64_t __87__BWSharpnessScoreReferenceFrameSelector_addReferenceFrameCandidate_referenceFrameOut___block_invoke(int a1, CFDictionaryRef dict, const __CFDictionary *a3)
{
  CGSize v4;
  _BOOL4 v5;
  uint64_t result;
  CGRect v7;
  CGRect rect;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v4;
  v7.origin = rect.origin;
  v7.size = v4;
  if (!CGRectMakeWithDictionaryRepresentation(dict, &rect))
    return -1;
  v5 = CGRectMakeWithDictionaryRepresentation(a3, &v7);
  result = -1;
  if (v5 && rect.size.width * rect.size.height > v7.size.width * v7.size.height)
    return 1;
  return result;
}

@end
