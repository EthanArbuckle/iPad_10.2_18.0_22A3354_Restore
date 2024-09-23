@implementation ATXCategoricalFeatureSpecificGeohash

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "locationMotionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "geohash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
