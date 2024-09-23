@implementation VNDefaultRecognizedObjectObservationsSortingComparator

uint64_t __VNDefaultRecognizedObjectObservationsSortingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  CGRect v33;
  CGRect v34;

  v4 = a2;
  v5 = a3;
  if (v4 == v5)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "confidence");
    v7 = v6;
    objc_msgSend(v5, "confidence");
    if (v7 > v8)
      v9 = -1;
    else
      v9 = v7 < v8;
    if (!v9)
    {
      objc_msgSend(v4, "boundingBox");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v4, "labels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      objc_msgSend(v5, "boundingBox");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      objc_msgSend(v5, "labels");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");
      if (v15 * v17 > v25 * v27)
      {
LABEL_7:
        v9 = -1;
LABEL_16:

        goto LABEL_17;
      }
      if (v15 * v17 >= v25 * v27)
      {
        v30 = v29;
        v33.origin.x = v11;
        v33.origin.y = v13;
        v33.size.width = v15;
        v33.size.height = v17;
        v34.origin.x = v21;
        v34.origin.y = v23;
        v34.size.width = v25;
        v34.size.height = v27;
        if (!CGRectIntersectsRect(v33, v34))
          goto LABEL_15;
        if (v19 > v30)
          goto LABEL_7;
        if (v19 >= v30)
        {
LABEL_15:
          v9 = 0;
          goto LABEL_16;
        }
      }
      v9 = 1;
      goto LABEL_16;
    }
  }
LABEL_17:

  return v9;
}

@end
