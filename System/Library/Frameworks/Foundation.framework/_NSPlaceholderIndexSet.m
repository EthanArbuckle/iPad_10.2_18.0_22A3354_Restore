@implementation _NSPlaceholderIndexSet

- (_NSPlaceholderIndexSet)initWithCoder:(id)a3
{
  return (_NSPlaceholderIndexSet *)objc_msgSend(+[NSIndexSet _alloc](NSIndexSet, "_alloc"), "initWithCoder:", a3);
}

- (_NSPlaceholderIndexSet)initWithIndexSet:(id)a3
{
  _NSPlaceholderIndexSet *v3;
  uint64_t v5;
  uint64_t v7;
  unint64_t v9;
  __objc2_class *v10;
  __objc2_class *v12;
  _QWORD v13[2];

  v3 = (_NSPlaceholderIndexSet *)a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (_NSTaggedIndexSetAllowed == 1 && v5 == 0)
  {
    v3 = (_NSPlaceholderIndexSet *)0x8580000000000007;
    v9 = *MEMORY[0x1E0DE7C58] ^ 0x8580000000000007;
    if ((~v9 & 0xC000000000000007) != 0)
      return (_NSPlaceholderIndexSet *)(v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v9 & 7)));
    return v3;
  }
  v7 = v5;
  if (v5 == 1)
    return -[_NSPlaceholderIndexSet initWithIndex:](self, "initWithIndex:", -[NSIndexSet firstIndex](v3, "firstIndex"));
  v10 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet == v10
    || _NSConstantIndexSet == v10
    || NSMutableIndexSet == v10)
  {
    v13[0] = 0;
    if (-[NSIndexSet getBitfield:](v3, "getBitfield:", v13))
      return -[_NSPlaceholderIndexSet initWithBitfield:](self, "initWithBitfield:", v13[0]);
  }
  v12 = (__objc2_class *)objc_opt_class();
  if (v12 == _NSConstantIndexSet || v7)
  {
    if (v3 && v12 == _NSConstantIndexSet)
      return v3;
    return (_NSPlaceholderIndexSet *)objc_msgSend(+[NSIndexSet _alloc](NSIndexSet, "_alloc"), "initWithIndexSet:", v3);
  }
  objc_opt_self();
  return (_NSPlaceholderIndexSet *)&_NSEmptyIndexSet_struct;
}

- (_NSPlaceholderIndexSet)initWithBitfield:(unint64_t)a3
{
  _NSPlaceholderIndexSet *result;
  unint64_t v4;

  if (_NSTaggedIndexSetAllowed != 1 || a3 && (__clz(a3) ^ 0x3C) > 0x33)
    return (_NSPlaceholderIndexSet *)objc_msgSend(+[NSIndexSet _alloc](NSIndexSet, "_alloc"), "initWithBitfield:", a3);
  result = (_NSPlaceholderIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (_NSPlaceholderIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

- (_NSPlaceholderIndexSet)init
{
  _NSPlaceholderIndexSet *result;
  unint64_t v3;

  if (_NSTaggedIndexSetAllowed != 1)
    return -[_NSPlaceholderIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:", 0, 0);
  result = (_NSPlaceholderIndexSet *)0x8580000000000007;
  v3 = *MEMORY[0x1E0DE7C58] ^ 0x8580000000000007;
  if ((~v3 & 0xC000000000000007) != 0)
    return (_NSPlaceholderIndexSet *)(v3 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v3 & 7)));
  return result;
}

- (_NSPlaceholderIndexSet)initWithIndex:(unint64_t)a3
{
  if (a3 > 0x3F)
    return -[_NSPlaceholderIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:");
  else
    return -[_NSPlaceholderIndexSet initWithBitfield:](self, "initWithBitfield:", 1 << a3);
}

- (_NSPlaceholderIndexSet)initWithIndexesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v5;
  unint64_t v6;
  NSString *v8;
  void *v9;
  NSRange v10;

  length = a3.length;
  location = a3.location;
  v5 = a3.location + a3.length;
  if (a3.length && (v5 & 0x8000000000000000) != 0)
  {
    v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    v10.location = location;
    v10.length = length;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range %@ exceeds maximum index value of NSNotFound - 1"), v8, NSStringFromRange(v10)), 0);
    objc_exception_throw(v9);
  }
  if (a3.length && (a3.location > 0x3F || v5 > 0x40 || v5 < a3.location))
  {
    objc_opt_self();
    if (length == 1 && location < 0xA)
      return (_NSPlaceholderIndexSet *)(&_NSConstantIndexSets + 4 * location);
    else
      return (_NSPlaceholderIndexSet *)objc_msgSend(+[NSIndexSet _alloc](NSIndexSet, "_alloc"), "initWithIndexesInRange:", location, length);
  }
  else
  {
    if (a3.length)
      v6 = 0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(a3.length) << SLOBYTE(a3.location);
    else
      v6 = 0;
    return -[_NSPlaceholderIndexSet initWithBitfield:](self, "initWithBitfield:", v6);
  }
}

- (unint64_t)retainCount
{
  return -1;
}

@end
