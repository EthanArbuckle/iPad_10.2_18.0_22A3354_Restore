@implementation BMEventBookmarkSQLColumns

id __BMEventBookmarkSQLColumns_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __BMEventBookmarkSQLColumns_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __BMEventBookmarkSQLColumns_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iterationStartTime");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __BMEventBookmarkSQLColumns_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLong:", objc_msgSend(v3, "offset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
