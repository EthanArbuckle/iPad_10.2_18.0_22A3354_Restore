@implementation CSL1CandidateQueue

- (void)dealloc
{
  __CFBinaryHeap *sparseQueue;
  __CFBinaryHeap *denseQueue;
  __CFBinaryHeap *hybridQueue;
  __CFBinaryHeap *scoreQueue;
  objc_super v7;

  sparseQueue = self->_sparseQueue;
  if (sparseQueue)
    CFRelease(sparseQueue);
  denseQueue = self->_denseQueue;
  if (denseQueue)
    CFRelease(denseQueue);
  hybridQueue = self->_hybridQueue;
  if (hybridQueue)
    CFRelease(hybridQueue);
  scoreQueue = self->_scoreQueue;
  if (scoreQueue)
    CFRelease(scoreQueue);
  v7.receiver = self;
  v7.super_class = (Class)CSL1CandidateQueue;
  -[CSL1CandidateQueue dealloc](&v7, sel_dealloc);
}

- (BOOL)onlyEmbeddingResults
{
  return !self->_sparseQueue && !self->_hybridQueue && self->_denseQueue != 0;
}

- (id)getAllItemsAndClearHeap
{
  void *v3;
  __CFBinaryHeap *sparseQueue;
  CFIndex Count;
  CFIndex v6;
  void *v7;
  __CFBinaryHeap *denseQueue;
  CFIndex v9;
  CFIndex v10;
  void *v11;
  __CFBinaryHeap *hybridQueue;
  CFIndex v13;
  CFIndex v14;
  void *v15;
  __CFBinaryHeap *scoreQueue;
  CFIndex v17;
  CFIndex v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  sparseQueue = self->_sparseQueue;
  if (sparseQueue)
  {
    Count = CFBinaryHeapGetCount(self->_sparseQueue);
    if (Count >= 1)
    {
      v6 = Count;
      do
      {
        CFBinaryHeapGetMinimum(sparseQueue);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CFBinaryHeapRemoveMinimumValue(sparseQueue);
        objc_msgSend(v3, "addObject:", v7);

        --v6;
      }
      while (v6);
    }
  }
  denseQueue = self->_denseQueue;
  if (denseQueue)
  {
    v9 = CFBinaryHeapGetCount(self->_denseQueue);
    if (v9 >= 1)
    {
      v10 = v9;
      do
      {
        CFBinaryHeapGetMinimum(denseQueue);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CFBinaryHeapRemoveMinimumValue(denseQueue);
        objc_msgSend(v3, "addObject:", v11);

        --v10;
      }
      while (v10);
    }
  }
  hybridQueue = self->_hybridQueue;
  if (hybridQueue)
  {
    v13 = CFBinaryHeapGetCount(self->_hybridQueue);
    if (v13 >= 1)
    {
      v14 = v13;
      do
      {
        CFBinaryHeapGetMinimum(hybridQueue);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CFBinaryHeapRemoveMinimumValue(hybridQueue);
        objc_msgSend(v3, "addObject:", v15);

        --v14;
      }
      while (v14);
    }
  }
  scoreQueue = self->_scoreQueue;
  if (scoreQueue)
  {
    v17 = CFBinaryHeapGetCount(scoreQueue);
    if (v17 >= 1)
    {
      v18 = v17;
      do
      {
        CFBinaryHeapGetMinimum(scoreQueue);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        CFBinaryHeapRemoveMinimumValue(scoreQueue);
        objc_msgSend(v3, "addObject:", v19);

        --v18;
      }
      while (v18);
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
