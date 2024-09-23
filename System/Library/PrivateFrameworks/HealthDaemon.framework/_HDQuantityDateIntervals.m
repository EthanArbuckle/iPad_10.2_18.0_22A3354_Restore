@implementation _HDQuantityDateIntervals

- (uint64_t)insideRanges:(uint64_t)result
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (result)
  {
    v2 = result;
    result = *(_QWORD *)(result + 40);
    if (result)
    {
      while (1)
      {
        if (*(double *)(v2 + 8) > a2)
          return 0;
        v4 = *(_QWORD *)(v2 + 24);
        if (v4 >= objc_msgSend((id)result, "count"))
          return 0;
        if (*(double *)(v2 + 16) >= a2)
          break;
        v5 = *(_QWORD *)(v2 + 24) + 1;
        *(_QWORD *)(v2 + 24) = v5;
        if (v5 >= objc_msgSend(*(id *)(v2 + 40), "count"))
          return 0;
        objc_msgSend(*(id *)(v2 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(v2 + 24));
        v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v8 = 0;
        if (v6)
          v8 = v6[1];
        *(_QWORD *)(v2 + 8) = v8;

        objc_msgSend(*(id *)(v2 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(v2 + 24));
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v7 = v9[2];
        *(_QWORD *)(v2 + 16) = v7;

        result = *(_QWORD *)(v2 + 40);
        if (!result)
          return result;
      }
      return 1;
    }
  }
  return result;
}

- (_HDQuantityDateIntervals)init
{
  _HDQuantityDateIntervals *v2;
  _HDQuantityDateIntervals *v3;
  NSMutableArray *intervalPairs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HDQuantityDateIntervals;
  v2 = -[_HDQuantityDateIntervals init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentStartInterval = 0.0;
    v2->_currentEndInterval = 0.0;
    v2->_containsUUIDs = 0;
    v2->_currentPairIndex = 0;
    intervalPairs = v2->_intervalPairs;
    v2->_intervalPairs = 0;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalPairs, 0);
}

@end
