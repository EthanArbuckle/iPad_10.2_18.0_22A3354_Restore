@implementation BuildFactorizationGrammar

id ___BuildFactorizationGrammar_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___BuildFactorizationGrammar_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKFactorization factorizationWithFactor:exponent:](_HKFactorization, "factorizationWithFactor:exponent:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ___BuildFactorizationGrammar_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "evaluate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factorizationByDividing:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___BuildFactorizationGrammar_block_invoke()
{
  return +[_HKFactorization factorization](_HKFactorization, "factorization");
}

id ___BuildFactorizationGrammar_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___BuildFactorizationGrammar_block_invoke_5()
{
  return +[_HKFactorization factorization](_HKFactorization, "factorization");
}

id ___BuildFactorizationGrammar_block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "evaluate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKFactorization factorizationWithFactor:exponent:](_HKFactorization, "factorizationWithFactor:exponent:", v4, objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___BuildFactorizationGrammar_block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "evaluate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "factorizationByRaisingToExponent:", objc_msgSend(v4, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___BuildFactorizationGrammar_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___BuildFactorizationGrammar_block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "evaluate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factorizationByMultiplying:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___BuildFactorizationGrammar_block_invoke_11()
{
  return +[_HKFactorization factorization](_HKFactorization, "factorization");
}

@end
