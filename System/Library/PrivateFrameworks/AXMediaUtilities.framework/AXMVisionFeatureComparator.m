@implementation AXMVisionFeatureComparator

- (int64_t)compareInitialResult:(id)a3 withFinalResult:(id)a4 indexOfUnequalItem:(int64_t *)a5 sortInitialResult:(BOOL)a6 sortFinalResult:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  int v20;
  int64_t *v22;

  v10 = a3;
  v11 = a4;
  if (a6)
  {
    objc_msgSend(v10, "sortedFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedFeatures");
  }
  else
  {
    objc_msgSend(v10, "features");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "features");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "count");
  v15 = objc_msgSend(v13, "count");
  if (v14 < v15)
  {
    v16 = -1;
    v17 = 1;
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v14 > v15)
  {
    v16 = -1;
    v17 = 2;
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (v14 < 1)
  {
    v17 = 0;
    v16 = -1;
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
  v22 = a5;
  v16 = 0;
  v17 = 3;
  while (1)
  {
    objc_msgSend(v12, "objectAtIndex:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      break;
    if (v14 == ++v16)
    {
      v17 = 0;
      v16 = -1;
      break;
    }
  }
  a5 = v22;
  if (v22)
LABEL_16:
    *a5 = v16;
LABEL_17:

  return v17;
}

@end
