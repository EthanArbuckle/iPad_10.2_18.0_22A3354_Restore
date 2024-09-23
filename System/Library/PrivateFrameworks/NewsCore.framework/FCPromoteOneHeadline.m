@implementation FCPromoteOneHeadline

uint64_t ____FCPromoteOneHeadline_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithDouble:", FCScoreForHeadline(a3, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = FCScoreForHeadline(v5, 1);

  objc_msgSend(v7, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

uint64_t ___FCPromoteOneHeadline_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasThumbnail");
}

@end
