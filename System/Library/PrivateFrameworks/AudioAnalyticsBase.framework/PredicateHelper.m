@implementation PredicateHelper

+ (id)logger
{
  if (+[PredicateHelper logger]::onceToken[0] != -1)
    dispatch_once(+[PredicateHelper logger]::onceToken, &__block_literal_global_0);
  return (id)+[PredicateHelper logger]::_logger;
}

void __25__PredicateHelper_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreaudio", "caro");
  v1 = (void *)+[PredicateHelper logger]::_logger;
  +[PredicateHelper logger]::_logger = (uint64_t)v0;

}

+ (id)buildPredicate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:argumentArray:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)evaluatePredicate:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "evaluateWithObject:", v6);

  return v7;
}

@end
