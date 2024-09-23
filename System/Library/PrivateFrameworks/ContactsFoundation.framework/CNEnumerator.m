@implementation CNEnumerator

+ (id)combine:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_flatMap:", &__block_literal_global_76);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
