@implementation _HKCFGTerminal

- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;

  v6 = (void (**)(id, void *))a4;
  objc_msgSend(a3, "scanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "scanLocation");
  v12 = 0;
  v9 = -[_HKCFGTerminal _scanValue:withScanner:](self, "_scanValue:withScanner:", &v12, v7);
  v10 = v12;
  if (v9)
  {
    +[_HKCFGTerminalNode nodeWithValue:rangeOfString:](_HKCFGTerminalNode, "nodeWithValue:rangeOfString:", v10, v8, objc_msgSend(v7, "scanLocation") - v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

  }
  objc_msgSend(v7, "setScanLocation:", v8);

}

+ (id)terminalMatchingString:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  _HKCFGStringTerminal *v8;
  void *v10;

  v4 = a4;
  v7 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKContextFreeGrammar.m"), 507, CFSTR("CFG terminal expression cannot be empty string"));

  }
  v8 = objc_alloc_init(_HKCFGStringTerminal);
  -[_HKCFGStringTerminal setString:](v8, "setString:", v7);

  -[_HKCFGStringTerminal setCaseSensitive:](v8, "setCaseSensitive:", v4);
  return v8;
}

+ (id)terminalMatchingString:(id)a3
{
  return (id)objc_msgSend(a1, "terminalMatchingString:caseSensitive:", a3, 1);
}

+ (id)terminalMatchingCharacterInSet:(id)a3
{
  id v3;
  _HKCFGCharacterTerminal *v4;

  v3 = a3;
  v4 = objc_alloc_init(_HKCFGCharacterTerminal);
  -[_HKCFGCharacterTerminal setCharacterSet:](v4, "setCharacterSet:", v3);

  return v4;
}

+ (id)terminalMatchingCharacterInString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "terminalMatchingCharacterInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)terminalMatchingAnyInteger
{
  return (id)objc_msgSend(a1, "_terminalMatchingIntegerWithCondition:", 0);
}

+ (id)_terminalMatchingIntegerWithCondition:(id)a3
{
  id v3;
  _HKCFGIntegerTerminal *v4;

  v3 = a3;
  v4 = objc_alloc_init(_HKCFGIntegerTerminal);
  -[_HKCFGIntegerTerminal setCondition:](v4, "setCondition:", v3);

  return v4;
}

+ (id)terminalMatchingAnyDouble
{
  return (id)objc_msgSend(a1, "_terminalMatchingDoubleWithCondition:", 0);
}

+ (id)_terminalMatchingDoubleWithCondition:(id)a3
{
  id v3;
  _HKCFGDoubleTerminal *v4;

  v3 = a3;
  v4 = objc_alloc_init(_HKCFGDoubleTerminal);
  -[_HKCFGDoubleTerminal setCondition:](v4, "setCondition:", v3);

  return v4;
}

+ (id)terminalMatchingSequenceOfCharactersInSet:(id)a3
{
  id v3;
  _HKCFGCharacterSequenceTerminal *v4;

  v3 = a3;
  v4 = objc_alloc_init(_HKCFGCharacterSequenceTerminal);
  -[_HKCFGCharacterSequenceTerminal setCharacterSet:](v4, "setCharacterSet:", v3);

  return v4;
}

- (BOOL)_scanValue:(id *)a3 withScanner:(id)a4
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

- (id)_label
{
  id result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (unint64_t)_minimumLength
{
  unint64_t result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)characterSet
{
  id result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end
