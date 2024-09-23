@implementation NDOViewModelGenerationHelpers

+ (id)ctaTextWithWarranty:(id)a3 forDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_15;
  objc_msgSend(v5, "acOfferDisplayDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "acOfferEligible");
  if (v9)
  {
    if (!v10)
      goto LABEL_12;
    objc_msgSend(v5, "acOfferDisplayDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v7);
    if (v12 > 0.0)
    {

      goto LABEL_12;
    }
    objc_msgSend(v5, "acOfferEligibleUntil");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v7);
    v14 = v16;

  }
  else
  {
    if (!v10)
      goto LABEL_12;
    objc_msgSend(v5, "acOfferEligibleUntil");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v7);
    v14 = v13;
  }

  if (v14 > 0.0)
  {
    objc_msgSend(v5, "acLocalizedOfferStatusLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_12:
  v8 = 0;
LABEL_13:
  objc_msgSend(v5, "acLocalizedUnlinkedPlanStatusLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "acLocalizedUnlinkedPlanStatusLabel");
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v18;
  }
LABEL_15:

  return v8;
}

+ (id)ctaTextWithDevice:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "acLocalizedUnlinkedPlanStatusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    objc_msgSend(v3, "acLocalizedOfferStatusLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = objc_msgSend(v3, "acOfferEligible");

      if (v9)
      {
        objc_msgSend(v3, "acLocalizedOfferStatusLabel");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
    else
    {

    }
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "acLocalizedUnlinkedPlanStatusLabel");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v7 = (void *)v6;
LABEL_9:

  return v7;
}

@end
