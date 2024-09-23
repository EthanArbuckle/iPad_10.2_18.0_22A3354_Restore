@implementation CompareOccurrences

uint64_t CUIKSingleDayTimelineLayout_CompareOccurrences_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "hideTravelTime") & 1) != 0)
    objc_msgSend(v4, "start");
  else
    objc_msgSend(v4, "startWithTravelTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hideTravelTime") & 1) != 0)
    objc_msgSend(v5, "start");
  else
    objc_msgSend(v5, "startWithTravelTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v4, "end");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  objc_msgSend(v5, "end");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  if (vabdd_f64(v17, v11) >= 2.22044605e-16)
  {
    v18 = (v14 - v9) / (v17 - v11);
    if (v18 > 0.85 && v18 < 1.2)
    {
      if (v9 >= v11)
      {
        if (v9 <= v11)
          goto LABEL_17;
        goto LABEL_14;
      }
LABEL_16:
      v19 = -1;
      goto LABEL_18;
    }
  }
  if (v14 >= v17)
  {
    if (v14 <= v17)
    {
LABEL_17:
      objc_msgSend(v4, "eventIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v20, "compare:", v21);

      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_14:
  v19 = 1;
LABEL_18:

  return v19;
}

@end
