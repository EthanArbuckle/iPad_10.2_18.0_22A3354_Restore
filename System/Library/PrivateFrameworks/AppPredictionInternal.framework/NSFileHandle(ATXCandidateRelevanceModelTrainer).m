@implementation NSFileHandle(ATXCandidateRelevanceModelTrainer)

- (void)writeCommaSeparatedValues:()ATXCandidateRelevanceModelTrainer
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(","));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeData:", v5);

}

@end
