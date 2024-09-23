@implementation ATXScoreTypes

void __38___ATXScoreTypes_scoreInputForString___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)scoreInputForString__scoreInputMap;
  scoreInputForString__scoreInputMap = v0;

  for (i = 0; i != 817; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)scoreInputForString__scoreInputMap;
    +[_ATXScoreTypes stringForScoreInput:](_ATXScoreTypes, "stringForScoreInput:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

@end
