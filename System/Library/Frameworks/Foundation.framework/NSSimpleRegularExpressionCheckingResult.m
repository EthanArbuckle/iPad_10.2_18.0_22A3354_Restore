@implementation NSSimpleRegularExpressionCheckingResult

- (unint64_t)numberOfRanges
{
  char v2;
  _NSRange *ranges;
  uint64_t v4;
  unint64_t result;
  char v6;
  unint64_t v7;
  NSUInteger length;

  v2 = 0;
  ranges = self->_ranges;
  v4 = 1;
  result = 3;
  do
  {
    while (1)
    {
      v6 = v2;
      if (ranges[v4].location == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v2 = 1;
      v4 = 2;
      if ((v6 & 1) != 0)
        return result;
    }
    v7 = v4;
    length = ranges[v4].length;
    v2 = 1;
    v4 = 2;
  }
  while (!(v6 & 1 | (length == 0x7FFFFFFFFFFFFFFFLL)));
  if (length == 0x7FFFFFFFFFFFFFFFLL)
    return v7;
  else
    return 3;
}

- (NSSimpleRegularExpressionCheckingResult)initWithRanges:(_NSRange *)a3 count:(unint64_t)a4 regularExpression:(id)a5
{
  NSSimpleRegularExpressionCheckingResult *v8;
  _NSRange *ranges;
  unint64_t v10;
  _NSRange v11;
  void *v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a4 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: must have 1-3 ranges"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v13);
  }
  v14.receiver = self;
  v14.super_class = (Class)NSSimpleRegularExpressionCheckingResult;
  v8 = -[NSSimpleRegularExpressionCheckingResult init](&v14, sel_init);
  if (v8)
  {
    v8->_regularExpression = (NSRegularExpression *)objc_msgSend(a5, "copy");
    ranges = v8->_ranges;
    v10 = a4;
    do
    {
      v11 = *a3++;
      *ranges++ = v11;
      --v10;
    }
    while (v10);
    if (a4 <= 2)
      memset_pattern16(&v8->_ranges[a4], &unk_1822CCAE0, 48 - 16 * a4);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSimpleRegularExpressionCheckingResult;
  -[NSSimpleRegularExpressionCheckingResult dealloc](&v3, sel_dealloc);
}

- (_NSRange)range
{
  _NSRange *ranges;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  ranges = self->_ranges;
  location = self->_ranges[0].location;
  length = ranges->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  uint64_t length;
  uint64_t location;
  _NSRange *v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  _NSRange result;

  length = 0x7FFFFFFFFFFFFFFFLL;
  location = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 <= 2)
  {
    v5 = &self->_ranges[a3];
    location = v5->location;
    length = v5->length;
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL && length == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index %lu out of range"), _NSFullMethodName((objc_class *)self, a2), a3), 0);
    objc_exception_throw(v8);
  }
  v6 = location;
  v7 = length;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSSimpleRegularExpressionCheckingResult)initWithRangeArray:(id)a3 regularExpression:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _BYTE v14[8];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  v8 = v7;
  if (v7 >= 3)
    v9 = 3;
  else
    v9 = v7;
  if (v9)
  {
    v10 = 0;
    v11 = v15;
    do
    {
      *(v11 - 1) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v10), "rangeValue");
      *v11 = v12;
      ++v10;
      v11 += 2;
    }
    while (v9 != v10);
  }
  return -[NSSimpleRegularExpressionCheckingResult initWithRanges:count:regularExpression:](self, "initWithRanges:count:regularExpression:", v14, v8, a4);
}

- (id)regularExpression
{
  return self->_regularExpression;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  unint64_t v3;
  _NSRange *i;
  unint64_t location;
  NSRange *v8;
  NSString *v9;
  void *v10;

  v3 = 0;
  for (i = self->_ranges; ; ++i)
  {
    location = i->location;
    if (i->location != 0x7FFFFFFFFFFFFFFFLL)
      break;
    if (v3 > 1 || i->length == 0x7FFFFFFFFFFFFFFFLL)
      return 1;
LABEL_9:
    ++v3;
  }
  if (a3 < 0 && location < -a3)
  {
    v8 = i;
    v9 = _NSFullMethodName((objc_class *)self, a2);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %ld invalid offset for range %@"), v9, a3, NSStringFromRange(*v8)), 0);
    objc_exception_throw(v10);
  }
  i->location = location + a3;
  if (v3 <= 1)
    goto LABEL_9;
  return 1;
}

- (id)rangeArray
{
  void *v3;
  uint64_t v4;
  _NSRange *ranges;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = 0;
  ranges = self->_ranges;
  do
  {
    if (ranges[v4].location == 0x7FFFFFFFFFFFFFFFLL && ranges[v4].length == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v3, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:"));
    ++v4;
  }
  while (v4 != 3);
  return v3;
}

@end
