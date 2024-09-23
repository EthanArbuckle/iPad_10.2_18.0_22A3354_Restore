@implementation CHParseTableCell

- (CHParseTableCell)initWithRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  CHParseTableCell *result;

  length = a3.length;
  location = a3.location;
  result = (CHParseTableCell *)objc_msgSend_init(self, a2, a3.location, a3.length, v3, v4);
  if (result)
  {
    result->_inputRange.location = location;
    result->_inputRange.length = length;
  }
  return result;
}

- (id)initNonTerminal:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v14 = objc_msgSend_init(self, v9, v10, v11, v12, v13);
  v15 = (_QWORD *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 8), a3);
    v15[12] = location;
    v15[13] = length;
  }

  return v15;
}

- (int64_t)length
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_inputRange(self, a2, v2, v3, v4, v5);
  return v6;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  NSUInteger location;
  NSUInteger length;
  double probability;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_description(self->_nonTerminal, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_inputRange.location;
  length = self->_inputRange.length;
  probability = self->_probability;
  objc_msgSend_description(self->_rule, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v18, (uint64_t)CFSTR("ParseCell: non-terminal='%@' range=[%lu, %lu]' probability=%.6f rule='%@'"), v19, v20, v21, v8, location, length + location, *(_QWORD *)&probability, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)stringForRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%lu-%lu"), a3.length, v3, v4, a3.location, a3.length);
}

+ (_NSRange)rangeFromString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  _NSRange result;

  objc_msgSend_componentsSeparatedByString_(a3, a2, (uint64_t)CFSTR("-"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_integerValue(v11, v12, v13, v14, v15, v16);
  objc_msgSend_objectAtIndexedSubscript_(v6, v18, 1, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_integerValue(v22, v23, v24, v25, v26, v27);

  v29 = v17;
  v30 = v28;
  result.length = v30;
  result.location = v29;
  return result;
}

- (_NSRange)terminalsRange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  objc_msgSend_nonTerminal(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend__terminalsRangeRecursive_(self, v8, (uint64_t)v7, v9, v10, v11);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (_NSRange)_terminalsRangeRecursive:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  const char *v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSRange v34;
  NSUInteger location;
  NSUInteger length;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  NSRange v45;
  _NSRange result;
  NSRange v47;

  v4 = a3;
  objc_msgSend_rightNode(v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_leftNode(v4, v11, v12, v13, v14, v15);
  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend__terminalsRangeRecursive_(self, v17, (uint64_t)v16, v18, v19, v20);
    v23 = (NSUInteger)v22;
    objc_msgSend_rightNode(v4, v22, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47.location = objc_msgSend__terminalsRangeRecursive_(self, v29, (uint64_t)v28, v30, v31, v32);
    v47.length = v33;
    v45.location = v21;
    v45.length = v23;
    v34 = NSUnionRange(v45, v47);
    location = v34.location;
    length = v34.length;

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    location = objc_msgSend_inputRange(v16, v37, v38, v39, v40, v41);
    length = v42;
  }

  v43 = location;
  v44 = length;
  result.length = v44;
  result.location = v43;
  return result;
}

- (CHNonTerminal)nonTerminal
{
  return self->_nonTerminal;
}

- (void)setNonTerminal:(id)a3
{
  objc_storeStrong((id *)&self->_nonTerminal, a3);
}

- (_NSRange)inputRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_inputRange.length;
  location = self->_inputRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setInputRange:(_NSRange)a3
{
  self->_inputRange = a3;
}

- (void)setTerminalsRange:(_NSRange)a3
{
  self->_terminalsRange = a3;
}

- (_NSRange)originalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalRange.length;
  location = self->_originalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setOriginalRange:(_NSRange)a3
{
  self->_originalRange = a3;
}

- (int64_t)combinations
{
  return self->_combinations;
}

- (void)setCombinations:(int64_t)a3
{
  self->_combinations = a3;
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (int64_t)terminalsCount
{
  return self->_terminalsCount;
}

- (void)setTerminalsCount:(int64_t)a3
{
  self->_terminalsCount = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (CHProductionRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
  objc_storeStrong((id *)&self->_rule, a3);
}

- (CHTerminal)terminal
{
  return self->_terminal;
}

- (void)setTerminal:(id)a3
{
  objc_storeStrong((id *)&self->_terminal, a3);
}

- (CHParseTableCell)leftChild
{
  return self->_leftChild;
}

- (void)setLeftChild:(id)a3
{
  objc_storeStrong((id *)&self->_leftChild, a3);
}

- (CHParseTableCell)rightChild
{
  return self->_rightChild;
}

- (void)setRightChild:(id)a3
{
  objc_storeStrong((id *)&self->_rightChild, a3);
}

- (CHParseTree)parseTree
{
  return self->_parseTree;
}

- (void)setParseTree:(id)a3
{
  objc_storeStrong((id *)&self->_parseTree, a3);
}

- (NSMutableArray)replacedCells
{
  return self->_replacedCells;
}

- (void)setReplacedCells:(id)a3
{
  objc_storeStrong((id *)&self->_replacedCells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedCells, 0);
  objc_storeStrong((id *)&self->_parseTree, 0);
  objc_storeStrong((id *)&self->_rightChild, 0);
  objc_storeStrong((id *)&self->_leftChild, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_nonTerminal, 0);
}

@end
