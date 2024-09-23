@implementation PHFetchResult(MediaAnalysis)

- (id)resultsAsArray
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PHFetchResult_MediaAnalysis__resultsAsArray__block_invoke;
  v5[3] = &unk_1E6B17A48;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

- (id)resultsAsSet
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PHFetchResult_MediaAnalysis__resultsAsSet__block_invoke;
  v5[3] = &unk_1E6B17A48;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

@end
