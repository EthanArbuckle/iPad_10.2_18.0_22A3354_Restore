@implementation DASLogConditionHistory

void __38___DASLogConditionHistory_description__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  objc_msgSend((id)description_formatter, "setDateStyle:", 1);
  objc_msgSend((id)description_formatter, "setTimeStyle:", 2);
  v2 = (void *)description_formatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v5 = (void *)description_shortFormatter;
  description_shortFormatter = (uint64_t)v4;

  objc_msgSend((id)description_shortFormatter, "setDateStyle:", 0);
  objc_msgSend((id)description_shortFormatter, "setTimeStyle:", 2);
  v6 = (void *)description_shortFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

}

@end
