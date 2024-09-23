@implementation SGAddressCoalescingState

- (SGAddressCoalescingState)init
{
  SGAddressCoalescingState *v2;
  uint64_t v3;
  NSMutableArray *matches;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGAddressCoalescingState;
  v2 = -[SGAddressCoalescingState init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    matches = v2->_matches;
    v2->_matches = (NSMutableArray *)v3;

    v2->_lastAddressIndex = -1;
    v2->_lastAddressEndPos = -1;
  }
  return v2;
}

- (void)dealloc
{
  __DDResult *lastResult;
  objc_super v4;

  lastResult = self->_lastResult;
  if (lastResult)
    CFRelease(lastResult);
  v4.receiver = self;
  v4.super_class = (Class)SGAddressCoalescingState;
  -[SGAddressCoalescingState dealloc](&v4, sel_dealloc);
}

- (void)coalesceAddress:(__DDResult *)a3 orAppendMatch:(id)a4
{
  uint64_t Range;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t lastAddressIndex;
  BOOL v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  SGDataDetectorMatch *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SGDataDetectorMatch *v20;
  __DDResult *lastResult;
  id v22;

  v22 = a4;
  if ((DDResultHasType() & 1) != 0)
  {
    Range = DDResultGetRange();
    v8 = Range + v7;
    v9 = -[NSMutableArray count](self->_matches, "count");
    v10 = v9;
    lastAddressIndex = self->_lastAddressIndex;
    v12 = lastAddressIndex != -1 && v9 == lastAddressIndex + 1;
    if (v12 && Range - self->_lastAddressEndPos <= 19 && DDAddressResultCanBeMergedWith())
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_matches, "objectAtIndexedSubscript:", self->_lastAddressIndex);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "range");
      v15 = v8 - objc_msgSend(v13, "range");
      v16 = [SGDataDetectorMatch alloc];
      v17 = objc_msgSend(v13, "matchType");
      v18 = objc_msgSend(v13, "labelRange");
      v20 = -[SGDataDetectorMatch initWithMatchType:range:labelRange:labelString:valueRange:valueString:](v16, "initWithMatchType:range:labelRange:labelString:valueRange:valueString:", v17, v14, v15, v18, v19, 0, v14, v15, 0);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_matches, "setObject:atIndexedSubscript:", v20, self->_lastAddressIndex);

    }
    else
    {
      -[NSMutableArray addObject:](self->_matches, "addObject:", v22);
    }
    self->_lastAddressIndex = v10;
    self->_lastAddressEndPos = v8;
    lastResult = self->_lastResult;
    if (lastResult)
      CFRelease(lastResult);
    self->_lastResult = (__DDResult *)CFRetain(a3);
  }
  else
  {
    -[NSMutableArray addObject:](self->_matches, "addObject:", v22);
  }

}

- (NSArray)matches
{
  return &self->_matches->super;
}

- (void)setMatches:(id)a3
{
  objc_storeStrong((id *)&self->_matches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matches, 0);
}

@end
