@implementation QLItem(Orb)

- (uint64_t)predictedPreferredContentSizeForOrbPlatter
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "hasDeterminedPredictedPreferredContentSizeForOrbPlatter") & 1) == 0)
  {
    objc_msgSend(a1, "previewItemURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(a1, "previewItemURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "preferredContentSizeForOrbPlatterWithURL:", v3);
      objc_msgSend(a1, "setPreferredContentSizeForOrbPlatter:");

    }
  }
  objc_msgSend(a1, "setHasDeterminedPredictedPreferredContentSizeForOrbPlatter:", 1);
  return objc_msgSend(a1, "preferredContentSizeForOrbPlatter");
}

@end
