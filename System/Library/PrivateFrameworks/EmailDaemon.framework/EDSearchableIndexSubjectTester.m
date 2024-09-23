@implementation EDSearchableIndexSubjectTester

- (id)transformDataForVerification:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "subject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length") || (v5 = v3, objc_msgSend(v4, "containsString:", CFSTR("\x00x01"))))
  {

    v5 = 0;
  }

  return v5;
}

- (id)expressionFromDataSamples:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_map:", &__block_literal_global_70);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E310], "queryStringByJoiningQueries:withOperand:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E318], "expressionWithQueryString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __60__EDSearchableIndexSubjectTester_expressionFromDataSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "em_stringForQuotingWithCharacter:", 39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ = '%@'"), *MEMORY[0x1E0CA68D8], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)fetchAttributes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CA68D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)verifySearchableItem:(id)a3 matchesDataSample:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  objc_msgSend(a3, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = 0;
  if (v7 && v8)
    v10 = objc_msgSend(v7, "compare:", v8) == 0;

  return v10;
}

@end
