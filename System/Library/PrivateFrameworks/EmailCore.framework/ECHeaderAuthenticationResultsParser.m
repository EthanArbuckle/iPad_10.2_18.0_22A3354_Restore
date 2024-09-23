@implementation ECHeaderAuthenticationResultsParser

ECHeaderAuthenticationResults *__78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  NSObject *v11;
  ECHeaderAuthenticationResults *v12;
  NSObject *v13;
  ECHeaderAuthenticationResults *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v3);
  if (objc_msgSend(*(id *)(a1 + 32), "_skipCFWSWithScanner:", v4))
  {
    v5 = *(void **)(a1 + 32);
    v31 = 0;
    v6 = objc_msgSend(v5, "_scanToCFWSOrSemicolonWithScanner:intoString:", v4, &v31);
    v7 = v31;
    if (v6 && (objc_msgSend(*(id *)(a1 + 32), "_skipCFWSWithScanner:", v4) & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "_versionWithScanner:", v4);
      v9 = *(void **)(a1 + 32);
      v30 = 0;
      v10 = objc_msgSend(v9, "_statementsWithScanner:intoArray:", v4, &v30);
      v11 = v30;
      if ((v10 & 1) != 0)
      {
        v12 = [ECHeaderAuthenticationResults alloc];
        -[NSObject ef_notEmpty](v11, "ef_notEmpty");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[ECHeaderAuthenticationResults initWithAuthenticationServiceIdentifier:version:statements:](v12, "initWithAuthenticationServiceIdentifier:version:statements:", v7, v8, v13);
      }
      else
      {
        _ef_log_ECHeaderAuthenticationResults();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_1(v13, v23, v24, v25, v26, v27, v28, v29);
        v14 = 0;
      }

      goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
  }
  _ef_log_ECHeaderAuthenticationResults();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_2(v11, v15, v16, v17, v18, v19, v20, v21);
  v14 = 0;
LABEL_10:

  return v14;
}

void __61___ECHeaderAuthenticationResultsParser__skipCFWSWithScanner___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("()"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_skipCFWSWithScanner__parentheses;
  _skipCFWSWithScanner__parentheses = v0;

}

uint64_t __85___ECHeaderAuthenticationResultsParser__scanToCFWSOrSemicolonWithScanner_intoString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon;
  _scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon = v0;

  return objc_msgSend((id)_scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon, "addCharactersInString:", CFSTR("(;"));
}

uint64_t __81___ECHeaderAuthenticationResultsParser__scanToCFWSOrEqualWithScanner_intoString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual;
  _scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual = v0;

  return objc_msgSend((id)_scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual, "addCharactersInString:", CFSTR("(="));
}

uint64_t __93___ECHeaderAuthenticationResultsParser__scanToCFWSOrPeriodOrSemicolonWithScanner_intoString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon;
  _scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon = v0;

  return objc_msgSend((id)_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon, "addCharactersInString:", CFSTR("(.;"));
}

void __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B9ADE000, a1, a3, "Invalid authentication result statements", a5, a6, a7, a8, 0);
}

void __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B9ADE000, a1, a3, "Invalid authentication service identifier", a5, a6, a7, a8, 0);
}

@end
