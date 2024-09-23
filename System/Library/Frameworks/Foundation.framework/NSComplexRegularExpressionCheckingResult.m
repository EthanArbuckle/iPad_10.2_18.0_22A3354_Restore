@implementation NSComplexRegularExpressionCheckingResult

- (unint64_t)numberOfRanges
{
  return -[NSArray count](self->_rangeArray, "count");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSComplexRegularExpressionCheckingResult;
  -[NSComplexRegularExpressionCheckingResult dealloc](&v3, sel_dealloc);
}

- (NSComplexRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  NSComplexRegularExpressionCheckingResult *v8;
  void *v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: must have at least one range"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)NSComplexRegularExpressionCheckingResult;
  v8 = -[NSComplexRegularExpressionCheckingResult init](&v11, sel_init);
  if (v8)
  {
    v8->_regularExpression = (NSRegularExpression *)objc_msgSend(a4, "copy");
    v8->_rangeArray = (NSArray *)objc_msgSend(a3, "copy");
  }
  return v8;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(-[NSArray objectAtIndex:](self->_rangeArray, "objectAtIndex:", a3), "rangeValue");
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSComplexRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  void *v9;
  NSUInteger *p_length;

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a4)
  {
    p_length = &a3->length;
    do
    {
      objc_msgSend(v9, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", *(p_length - 1), *p_length));
      p_length += 2;
      --a4;
    }
    while (a4);
  }
  return -[NSComplexRegularExpressionCheckingResult initWithRangeArray:regularExpression:](self, "initWithRangeArray:regularExpression:", v9, a5);
}

- (id)regularExpression
{
  return self->_regularExpression;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = objc_msgSend(-[NSArray objectAtIndex:](self->_rangeArray, "objectAtIndex:", 0), "rangeValue");
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v13;
  objc_class *v14;
  NSUInteger v15;
  NSString *v16;
  void *v17;
  NSRange v18;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = -[NSComplexRegularExpressionCheckingResult numberOfRanges](self, "numberOfRanges");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = -[NSComplexRegularExpressionCheckingResult rangeAtIndex:](self, "rangeAtIndex:", i);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a3 < 0 && v10 < -a3)
        {
          v13 = v10;
          v14 = (objc_class *)self;
          v15 = v11;
          v16 = _NSFullMethodName(v14, a2);
          v18.location = v13;
          v18.length = v15;
          v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v16, a3, NSStringFromRange(v18)), 0);
          objc_exception_throw(v17);
        }
        objc_msgSend(v6, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v10 + a3, v11));
      }
    }
  }

  self->_rangeArray = (NSArray *)v6;
  return 1;
}

- (id)rangeArray
{
  return self->_rangeArray;
}

@end
