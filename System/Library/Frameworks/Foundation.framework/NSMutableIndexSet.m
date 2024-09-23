@implementation NSMutableIndexSet

- (void)addIndex:(NSUInteger)value
{
  if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
  {
    if (value <= 0x3F)
    {
      self->super._internal._singleRange._range.location |= 1 << value;
      return;
    }
    -[NSMutableIndexSet _convertToUsingRanges](self, "_convertToUsingRanges");
  }
  -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", value, 1);
}

- (void)addIndexesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  NSUInteger *p_length;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  unint64_t v17;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *v19;
  $228E88DFACDD67E146FBAE62E08A49BD *v20;
  $228E88DFACDD67E146FBAE62E08A49BD *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  $A8859644891BA8F5A580113D622AC538 v29;
  NSString *v30;
  void *v31;
  NSRange v32;

  length = range.length;
  location = range.location;
  v6 = range.location + range.length;
  if (range.length && (v6 & 0x8000000000000000) != 0)
  {
    v30 = _NSMethodExceptionProem((objc_class *)self, a2);
    v32.location = location;
    v32.length = length;
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range %@ exceeds maximum index value of NSNotFound - 1"), v30, NSStringFromRange(v32)), 0);
    objc_exception_throw(v31);
  }
  if (range.length)
  {
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      if (v6 <= 0x40)
      {
        self->super._internal._singleRange._range.location |= 0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location);
        return;
      }
      -[NSMutableIndexSet _convertToUsingRanges](self, "_convertToUsingRanges");
    }
    v7 = -[NSIndexSet _indexOfRangeBeforeOrContainingIndex:](self, "_indexOfRangeBeforeOrContainingIndex:", location);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7;
    p_internal = &self->super._internal;
    p_length = &self->super._internal._singleRange._range.length;
    v11 = (uint64_t *)MEMORY[0x1E0DE7C58];
    v12 = *MEMORY[0x1E0DE7C58];
    if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007)
      v12 = 0;
    v13 = v12 ^ (unint64_t)self;
    v14 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v13 & 7) == 0)
      v14 = 0xFFFFFFFFFFFFFLL;
    v15 = v14 & (v13 >> 3);
    for (i = v8; ; ++i)
    {
      v17 = v15;
      if (((unint64_t)self & 0x8000000000000000) == 0)
      {
        indexSetFlags = self->super._indexSetFlags;
        v19 = &self->super._internal;
        if ((*(_BYTE *)&indexSetFlags & 2) == 0)
        {
          v19 = ($228E88DFACDD67E146FBAE62E08A49BD *)(&self->super._internal._singleBitfield + 1);
          if ((*(_BYTE *)&indexSetFlags & 1) == 0)
            v19 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location + 8);
        }
        v17 = v19->_singleRange._range.location;
      }
      if (v17)
      {
        if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
          v17 = 1;
        else
          v17 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
      }
      if (v8 >= v17)
        break;
      v20 = &self->super._internal;
      if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
        v20 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                  + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                  + 64);
      v21 = &v20[i];
      v22 = v21->_singleRange._range.location;
      v23 = v6 - v21->_singleRange._range.location;
      if (v6 < v21->_singleRange._range.location)
      {
        -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", location, length, v8);
        return;
      }
      v24 = v21->_singleRange._range.length + v22;
      if (location < v22)
      {
        v22 = location;
        if (v6 <= v24)
          v23 = v24 - location;
        else
          v23 = length;
        if (v6 <= v24)
          length = v24 - location;
LABEL_40:
        -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v8, v22, v23);
        break;
      }
      if (v6 <= v24)
        return;
      if (v24 >= location)
        goto LABEL_40;
      ++v8;
    }
    if (((unint64_t)self & 0x8000000000000000) != 0)
    {
      v25 = *v11;
      if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007)
        v25 = 0;
      v26 = v25 ^ (unint64_t)self;
      v27 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v26 & 7) == 0)
        v27 = 0xFFFFFFFFFFFFFLL;
      v28 = v27 & (v26 >> 3);
      if (!v28)
        goto LABEL_58;
    }
    else
    {
      v29 = self->super._indexSetFlags;
      if ((*(_BYTE *)&v29 & 2) != 0)
      {
        v28 = p_internal->_singleRange._range.location;
        if (!p_internal->_singleRange._range.location)
          goto LABEL_58;
      }
      else if ((*(_BYTE *)&v29 & 1) != 0)
      {
        v28 = *p_length;
        if (!*p_length)
          goto LABEL_58;
      }
      else
      {
        v28 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
        if (!v28)
          goto LABEL_58;
      }
    }
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
      v28 = 1;
    else
      v28 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
LABEL_58:
    if (v28 == v8)
      -[NSMutableIndexSet _addRangeToArray:](self, "_addRangeToArray:", location, length);
    -[NSMutableIndexSet _mergeOverlappingRangesStartingAtIndex:](self, "_mergeOverlappingRangesStartingAtIndex:", v8);
  }
}

- (void)_replaceRangeInArrayAtIndex:(unint64_t)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  $228E88DFACDD67E146FBAE62E08A49BD *v10;
  _NSRange *p_range;
  NSUInteger length;
  NSString *v13;

  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v4 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v4 = 0;
    v5 = v4 ^ (unint64_t)self;
    v6 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0)
      v6 = 0xFFFFFFFFFFFFFLL;
    location = v6 & (v5 >> 3);
    if (!location)
      goto LABEL_17;
  }
  else
  {
    indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      location = self->super._internal._singleRange._range.location;
      if (!location)
        goto LABEL_17;
    }
    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      location = self->super._internal._singleRange._range.length;
      if (!location)
        goto LABEL_17;
    }
    else
    {
      location = *(_QWORD *)(self->super._internal._singleRange._range.location + 8);
      if (!location)
        goto LABEL_17;
    }
  }
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
  {
    location = 1;
    if (a4.length)
      goto LABEL_18;
LABEL_25:
    -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", a3, a4.location);
    return;
  }
  location = *(_QWORD *)(self->super._internal._singleRange._range.location + 8);
LABEL_17:
  if (!a4.length)
    goto LABEL_25;
LABEL_18:
  if (location < a3)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Index %ld out of range bounds [0...%ld]"), a4.location, a3, location);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0));
  }
  p_internal = &self->super._internal;
  v10 = &self->super._internal;
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
    v10 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                              + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                              + 64);
  p_range = &v10[a3]._singleRange._range;
  length = p_range->length;
  *p_range = a4;
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
  {
    atomic_store(0, (unint64_t *)(p_internal->_singleRange._range.location + 56));
    *(_QWORD *)(p_internal->_singleRange._range.location + 16) -= length;
    *(_QWORD *)(p_internal->_singleRange._range.location + 16) += a4.length;
  }
}

- (void)_mergeOverlappingRangesStartingAtIndex:(unint64_t)a3
{
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $A8859644891BA8F5A580113D622AC538 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger location;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;

  p_internal = &self->super._internal;
  v6 = (unint64_t)self & 0xC000000000000007;
  v7 = (uint64_t *)MEMORY[0x1E0DE7C58];
LABEL_2:
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    while (1)
    {
      indexSetFlags = self->super._indexSetFlags;
      if ((*(_BYTE *)&indexSetFlags & 2) != 0)
      {
        if (!p_internal->_singleRange._range.location)
          return;
      }
      else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      {
        if (!self->super._internal._singleRange._range.length)
          return;
      }
      else if (!*(_QWORD *)(p_internal->_singleRange._range.location + 8))
      {
        return;
      }
LABEL_17:
      v12 = self->super._indexSetFlags;
      if ((*(_BYTE *)&v12 & 1) == 0 && !*(_QWORD *)(p_internal->_singleRange._range.location + 8))
        return;
      if (((unint64_t)self & 0x8000000000000000) != 0)
        break;
      if ((*(_BYTE *)&v12 & 2) != 0)
      {
        location = p_internal->_singleRange._range.location;
        goto LABEL_34;
      }
      if ((*(_BYTE *)&v12 & 1) == 0)
      {
        v20 = p_internal->_singleRange._range.location;
        v27 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
        if (v27)
        {
          if (a3 >= v27 - 1)
            return;
LABEL_39:
          v20 = p_internal->_singleRange._range.location;
        }
        else if (a3 == -1)
        {
          return;
        }
        v18 = v20 + 16 * *(_QWORD *)(v20 + 24) + 64;
        goto LABEL_41;
      }
      if (self->super._internal._singleRange._range.length)
        v17 = 0;
      else
        v17 = -1;
      v18 = (uint64_t)p_internal;
      if (a3 >= v17)
        return;
LABEL_41:
      v21 = (uint64_t *)(v18 + 16 * a3);
      v22 = *v21;
      v23 = v21[1];
      v24 = (unint64_t *)(v18 + 16 * (a3 + 1));
      v25 = v23 + v22;
      if (v25 < *v24)
        return;
      v26 = v24[1] + *v24;
      if (v25 < v26)
      {
        -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", a3, v22, v26 - v22);
        -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", ++a3);
        goto LABEL_2;
      }
      -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", a3 + 1);
      if (((unint64_t)self & 0x8000000000000000) != 0)
        goto LABEL_3;
    }
    v13 = *v7;
    if (v6 == 0xC000000000000007)
      v13 = 0;
    v14 = v13 ^ (unint64_t)self;
    if ((~(_BYTE)v14 & 7) != 0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = 0xFFFFFFFFFFFFFLL;
    location = v15 & (v14 >> 3);
LABEL_34:
    v19 = location != 0;
    if ((*(_BYTE *)&v12 & 1) == 0)
    {
      if (location)
        v19 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
    }
    if (a3 >= v19 - 1)
      return;
    v18 = (uint64_t)p_internal;
    if ((*(_BYTE *)&v12 & 1) == 0)
      goto LABEL_39;
    goto LABEL_41;
  }
LABEL_3:
  v8 = *v7;
  if (v6 == 0xC000000000000007)
    v8 = 0;
  v9 = v8 ^ (unint64_t)self;
  if ((~(_BYTE)v9 & 7) != 0)
    v10 = 0xFFFFFFFFFFFFFFFLL;
  else
    v10 = 0xFFFFFFFFFFFFFLL;
  if ((v10 & (v9 >> 3)) != 0)
    goto LABEL_17;
}

- (void)removeIndex:(NSUInteger)value
{
  if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
  {
    if (value <= 0x3F)
      self->super._internal._singleRange._range.location &= ~(1 << value);
  }
  else
  {
    -[NSMutableIndexSet removeIndexesInRange:](self, "removeIndexesInRange:", value, 1);
  }
}

- (void)removeIndexesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  NSUInteger v9;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *v16;
  $228E88DFACDD67E146FBAE62E08A49BD *v17;
  NSUInteger v18;
  NSUInteger v19;

  if (range.length)
  {
    length = range.length;
    location = range.location;
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      if (range.location <= 0x3F)
      {
        v7 = range.location + range.length;
        if (range.location + range.length >= 0x40)
          v7 = 64;
        if (v7 == range.location)
          v8 = -1;
        else
          v8 = ~(0xFFFFFFFFFFFFFFFFLL >> (LOBYTE(range.location) - v7) << SLOBYTE(range.location));
        self->super._internal._singleRange._range.location &= v8;
      }
    }
    else
    {
      if (!range.location)
      {
        v6 = 0;
LABEL_15:
        v9 = location + length;
        p_internal = &self->super._internal;
        while (1)
        {
          if (((unint64_t)self & 0x8000000000000000) != 0)
          {
            v11 = *MEMORY[0x1E0DE7C58];
            if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007)
              v11 = 0;
            v12 = v11 ^ (unint64_t)self;
            if ((~(_BYTE)v12 & 7) != 0)
              v13 = 0xFFFFFFFFFFFFFFFLL;
            else
              v13 = 0xFFFFFFFFFFFFFLL;
            v14 = v13 & (v12 >> 3);
            if (!v14)
              goto LABEL_34;
          }
          else
          {
            indexSetFlags = self->super._indexSetFlags;
            if ((*(_BYTE *)&indexSetFlags & 2) != 0)
            {
              v14 = p_internal->_singleRange._range.location;
              if (!p_internal->_singleRange._range.location)
                goto LABEL_34;
            }
            else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
            {
              v14 = self->super._internal._singleRange._range.length;
              if (!v14)
                goto LABEL_34;
            }
            else
            {
              v14 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
              if (!v14)
                goto LABEL_34;
            }
          }
          if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
            v14 = 1;
          else
            v14 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
LABEL_34:
          if (v6 >= v14)
            return;
          v16 = &self->super._internal;
          if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
            v16 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                      + 16
                                                      * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                      + 64);
          v17 = &v16[v6];
          v18 = v17->_singleRange._range.location;
          if (v9 < v17->_singleRange._range.location)
            return;
          v19 = v17->_singleRange._range.length + v18;
          if (location > v18)
          {
            if (v19 > v9)
            {
              -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v6, v9, v19 - v9);
              -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", v18, location - v18, v6);
              return;
            }
            if (location < v19)
              -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v6, v18, location - v18);
            ++v6;
          }
          else
          {
            if (v19 > v9)
            {
              -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v6, v9, v19 - v9);
              return;
            }
            -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", v6);
          }
        }
      }
      v6 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", range.location);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_15;
    }
  }
}

- (void)_insertRange:(_NSRange)a3 inArrayAtIndex:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v22;
  uint64_t v23;
  $228E88DFACDD67E146FBAE62E08A49BD *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  $228E88DFACDD67E146FBAE62E08A49BD *v28;
  $228E88DFACDD67E146FBAE62E08A49BD *v29;
  NSString *v30;

  length = a3.length;
  location = a3.location;
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      v11 = self->super._internal._singleRange._range.location;
      if (!v11)
        goto LABEL_18;
    }
    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      v11 = self->super._internal._singleRange._range.length;
      if (!v11)
        goto LABEL_18;
    }
    else
    {
      v11 = *(_QWORD *)(self->super._internal._singleRange._range.location + 8);
      if (!v11)
        goto LABEL_18;
    }
    goto LABEL_15;
  }
  v8 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v8 = 0;
  v9 = v8 ^ (unint64_t)self;
  v10 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v9 & 7) == 0)
    v10 = 0xFFFFFFFFFFFFFLL;
  v11 = v10 & (v9 >> 3);
  if (v11)
  {
LABEL_15:
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
      v11 = 1;
    else
      v11 = *(_QWORD *)(self->super._internal._singleRange._range.location + 8);
  }
LABEL_18:
  if (v11 < a4)
  {
    v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Index %ld out of range bounds [0...%ld]"), a4, v11);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v30, 0));
  }
  -[NSMutableIndexSet _ensureRangeCapacity:](self, "_ensureRangeCapacity:", v11 + 1);
  p_internal = &self->super._internal;
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
  {
    v24 = &p_internal[a4];
    v24->_singleRange._range.location = location;
    v24->_singleRange._range.length = length;
  }
  else
  {
    v14 = (_QWORD *)p_internal->_singleRange._range.location;
    v16 = *(_QWORD *)p_internal->_singleRange._range.location;
    v15 = *(_QWORD *)(p_internal->_singleRange._range.location + 8);
    v17 = v15 - a4;
    v18 = *(_QWORD *)(p_internal->_singleRange._range.location + 24);
    v19 = v18 + v15;
    if (v15 - a4 > a4 && v18 != 0 || v16 == v19)
    {
      if (v15 == a4)
      {
        if (v18 <= 1)
          v22 = 1;
        else
          v22 = v18 >> 1;
        memmove(&v14[2 * v18 + 8 + -2 * v22], &v14[2 * v18 + 8], 16 * a4);
        v14 = (_QWORD *)p_internal->_singleRange._range.location;
        v23 = *(_QWORD *)(p_internal->_singleRange._range.location + 24) - v22;
      }
      else
      {
        if (a4)
        {
          memmove(&v14[2 * v18 + 6], &v14[2 * v18 + 8], 16 * a4);
          v14 = (_QWORD *)p_internal->_singleRange._range.location;
          v18 = *(_QWORD *)(p_internal->_singleRange._range.location + 24);
        }
        v23 = v18 - 1;
      }
      v14[3] = v23;
    }
    else if (a4)
    {
      if (v15 != a4)
        memmove(&v14[2 * v18 + 10 + 2 * a4], &v14[2 * v18 + 8 + 2 * a4], 16 * v17);
    }
    else
    {
      v25 = v16 - v19;
      v26 = (unint64_t)(v16 - v19) >> 1;
      if (v25 <= 1)
        v27 = 1;
      else
        v27 = v26;
      memmove(&v14[2 * v18 + 8 + 2 * v27], &v14[2 * v18 + 8], 16 * v17);
      *(_QWORD *)(p_internal->_singleRange._range.location + 24) = v27 - 1;
    }
    v28 = &self->super._internal;
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
      v28 = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                + 64);
    v29 = &v28[a4];
    v29->_singleRange._range.location = location;
    v29->_singleRange._range.length = length;
    atomic_store(0, (unint64_t *)(p_internal->_singleRange._range.location + 56));
    ++*(_QWORD *)(p_internal->_singleRange._range.location + 8);
    *(_QWORD *)(p_internal->_singleRange._range.location + 16) += length;
  }
}

- (void)_ensureRangeCapacity:(unint64_t)a3
{
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  NSUInteger v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger location;
  uint64_t v22;
  _BOOL8 v23;
  NSUInteger length;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t *v26;
  unint64_t v27;
  $228E88DFACDD67E146FBAE62E08A49BD internal;

  indexSetFlags = self->super._indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    v5 = 1;
  else
    v5 = *(_QWORD *)self->super._internal._singleRange._range.location;
  if (v5 < a3)
  {
    if (a3 == 1)
    {
      self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags | 1);
    }
    else
    {
      v6 = 2 * v5;
      if (v6 <= a3)
        v6 = a3;
      if (a3 >= 4)
        v7 = v6;
      else
        v7 = 4;
      if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      {
        if (((unint64_t)self & 0x8000000000000000) != 0)
        {
          v17 = *MEMORY[0x1E0DE7C58];
          if ((~(unint64_t)self & 0xC000000000000007) == 0)
            v17 = 0;
          v18 = v17 ^ (unint64_t)self;
          v19 = 0xFFFFFFFFFFFFFFFLL;
          if ((~(_BYTE)v18 & 7) == 0)
            v19 = 0xFFFFFFFFFFFFFLL;
          v20 = v19 & (v18 >> 3);
          location = v20;
        }
        else
        {
          v22 = 16;
          if ((*(_BYTE *)&indexSetFlags & 2) == 0)
            v22 = 24;
          v20 = *(NSUInteger *)((char *)&self->super.super.isa + v22);
          if ((*(_BYTE *)&indexSetFlags & 2) != 0)
            location = self->super._internal._singleRange._range.location;
          else
            location = self->super._internal._singleRange._range.length;
        }
        v23 = v20 != 0;
        if (location)
          length = self->super._internal._singleRange._range.length;
        else
          length = 0;
        p_internal = &self->super._internal;
        internal = self->super._internal;
        self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags & 0xFFFFFFFE);
        v26 = (unint64_t *)malloc_type_malloc(16 * v7 + 64, 0xF39377F9uLL);
        self->super._internal._singleRange._range.location = (NSUInteger)v26;
        atomic_store(0, v26 + 7);
        *(_QWORD *)self->super._internal._singleRange._range.location = v7;
        *(_QWORD *)(self->super._internal._singleRange._range.location + 8) = v23;
        *(_QWORD *)(self->super._internal._singleRange._range.location + 16) = length;
        v27 = (v7 - v23) >> 1;
        if (v7 < 5)
          v27 = 0;
        *(_QWORD *)(self->super._internal._singleRange._range.location + 24) = v27;
        if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
          p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                           + 16
                                                           * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                           + 64);
        *p_internal = internal;
      }
      else
      {
        v8 = *(_QWORD *)(self->super._internal._singleRange._range.location + 24);
        v9 = (unint64_t *)MEMORY[0x186DA80E4]();
        self->super._internal._singleRange._range.location = (NSUInteger)v9;
        *v9 = v7;
        v10 = self->super._internal._singleRange._range.location;
        v11 = *(_QWORD *)(v10 + 8);
        v13 = v7 >= v11;
        v12 = v7 - v11;
        v13 = v13 && v7 >= 5;
        v14 = v12 >> 1;
        if (!v13)
          v14 = 0;
        *(_QWORD *)(v10 + 24) = v14;
        v15 = self->super._internal._singleRange._range.location;
        v16 = *(_QWORD *)(v15 + 24);
        if (v8 != v16)
          memmove((void *)(v15 + 64 + 16 * v16), (const void *)(v15 + 64 + 16 * v8), 16 * *(_QWORD *)(v15 + 8));
      }
    }
  }
}

- (void)_removeRangeInArrayAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  NSString *v14;

  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      location = self->super._internal._singleRange._range.location;
      if (!location)
        goto LABEL_18;
    }
    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      location = self->super._internal._singleRange._range.length;
      if (!location)
        goto LABEL_18;
    }
    else
    {
      location = *(_QWORD *)(self->super._internal._singleRange._range.location + 8);
      if (!location)
        goto LABEL_18;
    }
    goto LABEL_15;
  }
  v4 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v4 = 0;
  v5 = v4 ^ (unint64_t)self;
  v6 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v5 & 7) == 0)
    v6 = 0xFFFFFFFFFFFFFLL;
  location = v6 & (v5 >> 3);
  if (location)
  {
LABEL_15:
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
      location = 1;
    else
      location = *(_QWORD *)(self->super._internal._singleRange._range.location + 8);
  }
LABEL_18:
  if (location < a3)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Index %ld out of range bounds [0...%ld]"), a3, location);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
  {
    self->super._internal._singleRange._range.length = 0;
  }
  else
  {
    v9 = self->super._internal._singleRange._range.location;
    v10 = *(_QWORD *)(v9 + 24);
    v11 = (_QWORD *)(v9 + 16 * v10 + 64);
    v12 = v11[2 * a3 + 1];
    v13 = *(_QWORD *)(v9 + 8) + ~a3;
    if (v13 <= a3)
    {
      if (v13)
        memmove(&v11[2 * a3], &v11[2 * a3 + 2], 16 * v13);
    }
    else
    {
      if (a3)
      {
        memmove((void *)(v9 + 16 * v10 + 80), v11, 16 * a3);
        v9 = self->super._internal._singleRange._range.location;
        v10 = *(_QWORD *)(v9 + 24);
      }
      *(_QWORD *)(v9 + 24) = v10 + 1;
    }
    atomic_store(0, (unint64_t *)(self->super._internal._singleRange._range.location + 56));
    --*(_QWORD *)(self->super._internal._singleRange._range.location + 8);
    *(_QWORD *)(self->super._internal._singleRange._range.location + 16) -= v12;
  }
}

uint64_t __32__NSMutableIndexSet_addIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
}

uint64_t __35__NSMutableIndexSet_removeIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
}

- (void)_incrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  NSUInteger location;
  uint64_t v12;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  $228E88DFACDD67E146FBAE62E08A49BD *v17;
  $228E88DFACDD67E146FBAE62E08A49BD *v18;
  $228E88DFACDD67E146FBAE62E08A49BD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSUInteger length;
  $A8859644891BA8F5A580113D622AC538 v26;
  $228E88DFACDD67E146FBAE62E08A49BD *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  if (!a3)
    return;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v7 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v7 = 0;
    v8 = v7 ^ (unint64_t)self;
    v9 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v8 & 7) == 0)
      v9 = 0xFFFFFFFFFFFFFLL;
    if ((v9 & (v8 >> 3)) == 0)
      goto LABEL_23;
  }
  else
  {
    indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      if (!self->super._internal._singleRange._range.location)
        goto LABEL_23;
    }
    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      if (!self->super._internal._singleRange._range.length)
        goto LABEL_23;
    }
    else if (!*(_QWORD *)(self->super._internal._singleRange._range.location + 8))
    {
      goto LABEL_23;
    }
  }
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
  {
    if (a4 <= 0x7FFFFFFFFFFFFFFELL)
    {
      v14 = 0;
      p_internal = &self->super._internal;
LABEL_22:
      if (a3 + p_internal[v14]._singleRange._range.location + p_internal[v14]._singleRange._range.length - 1 >= 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Incrementing by %ld would push last index beyond maximum index value of NSNotFound - 1"), _NSMethodExceptionProem((objc_class *)self, a2), a3), 0);
        objc_exception_throw(v28);
      }
    }
  }
  else if (a4 <= 0x7FFFFFFFFFFFFFFELL)
  {
    location = self->super._internal._singleRange._range.location;
    v12 = *(_QWORD *)(location + 8);
    if (v12)
    {
      p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(location + 16 * *(_QWORD *)(location + 24) + 64);
      v14 = v12 - 1;
      goto LABEL_22;
    }
  }
LABEL_23:
  v15 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", a4);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    return;
  v16 = v15;
  v17 = &self->super._internal;
  v18 = &self->super._internal;
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
    v18 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v17->_singleRange._range.location
                                              + 16 * *(_QWORD *)(v17->_singleRange._range.location + 24)
                                              + 64);
  v19 = &v18[v15];
  v31 = v19->_singleRange._range.location;
  if (v19->_singleRange._range.location >= a4)
  {
    v29 = 0;
    v30 = 0;
  }
  else
  {
    v30 = v19->_singleRange._range.location - a4 + v19->_singleRange._range.length;
    v29 = a4 + a3;
    -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v15, v19->_singleRange._range.location, a4 - v19->_singleRange._range.location);
    ++v16;
  }
  v20 = v16;
  v21 = (uint64_t *)MEMORY[0x1E0DE7C58];
  if (((unint64_t)self & 0x8000000000000000) != 0)
    goto LABEL_30;
LABEL_37:
  v26 = self->super._indexSetFlags;
  if ((*(_BYTE *)&v26 & 2) != 0)
  {
    length = v17->_singleRange._range.location;
    if (v17->_singleRange._range.location)
      goto LABEL_44;
    goto LABEL_47;
  }
  if ((*(_BYTE *)&v26 & 1) != 0)
  {
    length = self->super._internal._singleRange._range.length;
    if (length)
      goto LABEL_44;
    goto LABEL_47;
  }
  length = *(_QWORD *)(v17->_singleRange._range.location + 8);
  if (length)
  {
LABEL_44:
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
      length = 1;
    else
      length = *(_QWORD *)(v17->_singleRange._range.location + 8);
  }
LABEL_47:
  while (v16 < length)
  {
    v27 = &self->super._internal;
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
      v27 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v17->_singleRange._range.location
                                                + 16 * *(_QWORD *)(v17->_singleRange._range.location + 24)
                                                + 64);
    -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v16++, v27[v20]._singleRange._range.location + a3, v27[v20]._singleRange._range.length);
    ++v20;
    if (((unint64_t)self & 0x8000000000000000) == 0)
      goto LABEL_37;
LABEL_30:
    v22 = *v21;
    if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007)
      v22 = 0;
    v23 = v22 ^ (unint64_t)self;
    if ((~(_BYTE)v23 & 7) != 0)
      v24 = 0xFFFFFFFFFFFFFFFLL;
    else
      v24 = 0xFFFFFFFFFFFFFLL;
    length = v24 & (v23 >> 3);
    if (length)
      goto LABEL_44;
  }
  if (v31 < a4)
    -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v29, v30);
}

- (void)_addRangeToArray:(_NSRange)a3
{
  -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", a3.location, a3.length, -[NSIndexSet rangeCount](self, "rangeCount"));
}

- (void)removeIndexes:(NSIndexSet *)indexSet
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  __objc2_class *v9;
  NSUInteger v10;
  NSUInteger i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger location;
  NSUInteger v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  if (!indexSet)
    return;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v5 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v5 = 0;
    v6 = v5 ^ (unint64_t)self;
    v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0)
      v7 = 0xFFFFFFFFFFFFFLL;
    if ((v7 & (v6 >> 3)) == 0)
      return;
  }
  else
  {
    indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      if (!self->super._internal._singleRange._range.location)
        return;
    }
    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      if (!self->super._internal._singleRange._range.length)
        return;
    }
    else if (!*(_QWORD *)(self->super._internal._singleRange._range.location + 8))
    {
      return;
    }
  }
  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0
    || *(_QWORD *)(self->super._internal._singleRange._range.location + 8))
  {
    if (indexSet == (NSIndexSet *)self)
    {
      -[NSIndexSet removeAllIndexes](indexSet, "removeAllIndexes");
      return;
    }
    v9 = (__objc2_class *)objc_opt_class();
    if (NSIndexSet == v9
      || _NSConstantIndexSet == v9
      || NSMutableIndexSet == v9)
    {
      if (((unint64_t)indexSet & 0x8000000000000000) != 0)
      {
        v12 = *MEMORY[0x1E0DE7C58];
        if ((~(unint64_t)indexSet & 0xC000000000000007) == 0)
          v12 = 0;
        v13 = v12 ^ (unint64_t)indexSet;
        v14 = 0xFFFFFFFFFFFFFFFLL;
        if ((~(_BYTE)v13 & 7) == 0)
          v14 = 0xFFFFFFFFFFFFFLL;
        location = v14 & (v13 >> 3);
      }
      else
      {
        if ((*(_BYTE *)&indexSet->_indexSetFlags & 2) == 0)
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __35__NSMutableIndexSet_removeIndexes___block_invoke;
          v23[3] = &unk_1E0F4E7A8;
          v23[4] = self;
          -[NSIndexSet enumerateRangesUsingBlock:](indexSet, "enumerateRangesUsingBlock:", v23);
          return;
        }
        location = indexSet->_internal._singleRange._range.location;
      }
      v16 = ~location;
      if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
      {
        self->super._internal._singleRange._range.location &= v16;
      }
      else
      {
        v17 = 0;
        v18 = 0;
LABEL_38:
        if (v18)
          v19 = v17;
        else
          v19 = 0;
        v20 = v19 - 1;
        while (((-1 << v18) & location) != 0)
        {
          v21 = __clz(__rbit64((-1 << v18) & location));
          v22 = (-1 << v21) & v16;
          v18 = __clz(__rbit64(v22));
          if (v17 == ++v20)
          {
            ++v17;
            -[NSMutableIndexSet removeIndexesInRange:](self, "removeIndexesInRange:", v21, v18 - v21);
            if (v18 <= 0x3F)
              goto LABEL_38;
            return;
          }
          if (!v22 || v18 > 0x3F)
            return;
        }
      }
    }
    else
    {
      v10 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (i = v10;
              i != 0x7FFFFFFFFFFFFFFFLL;
              i = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", i))
        {
          -[NSMutableIndexSet removeIndex:](self, "removeIndex:", i);
        }
      }
    }
  }
}

- (void)addIndexes:(NSIndexSet *)indexSet
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  __objc2_class *v9;
  NSUInteger v10;
  NSUInteger i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger location;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (!indexSet || indexSet == (NSIndexSet *)self)
    return;
  if (((unint64_t)self & 0x8000000000000000) != 0)
  {
    v5 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v5 = 0;
    v6 = v5 ^ (unint64_t)self;
    v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0)
      v7 = 0xFFFFFFFFFFFFFLL;
    if ((v7 & (v6 >> 3)) == 0)
      goto LABEL_31;
    goto LABEL_15;
  }
  indexSetFlags = self->super._indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    if (self->super._internal._singleRange._range.location)
      goto LABEL_15;
LABEL_31:
    -[NSMutableIndexSet removeAllIndexes](self, "removeAllIndexes");
    -[NSIndexSet _setContentToContentFromIndexSet:](self, "_setContentToContentFromIndexSet:", indexSet);
    return;
  }
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->super._internal._singleRange._range.length)
      goto LABEL_15;
    goto LABEL_31;
  }
  if (!*(_QWORD *)(self->super._internal._singleRange._range.location + 8))
    goto LABEL_31;
LABEL_15:
  v9 = (__objc2_class *)objc_opt_class();
  if (NSIndexSet == v9
    || _NSConstantIndexSet == v9
    || NSMutableIndexSet == v9)
  {
    if (((unint64_t)indexSet & 0x8000000000000000) != 0)
    {
      v12 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)indexSet & 0xC000000000000007) == 0)
        v12 = 0;
      v13 = v12 ^ (unint64_t)indexSet;
      v14 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v13 & 7) == 0)
        v14 = 0xFFFFFFFFFFFFFLL;
      location = v14 & (v13 >> 3);
    }
    else
    {
      if ((*(_BYTE *)&indexSet->_indexSetFlags & 2) == 0)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __32__NSMutableIndexSet_addIndexes___block_invoke;
        v22[3] = &unk_1E0F4E7A8;
        v22[4] = self;
        -[NSIndexSet enumerateRangesUsingBlock:](indexSet, "enumerateRangesUsingBlock:", v22);
        return;
      }
      location = indexSet->_internal._singleRange._range.location;
    }
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      self->super._internal._singleRange._range.location |= location;
    }
    else
    {
      v16 = 0;
      v17 = 0;
LABEL_35:
      if (v17)
        v18 = v16;
      else
        v18 = 0;
      v19 = v18 - 1;
      while (((-1 << v17) & location) != 0)
      {
        v20 = __clz(__rbit64((-1 << v17) & location));
        v21 = (-1 << v20) & ~location;
        v17 = __clz(__rbit64(v21));
        if (v16 == ++v19)
        {
          ++v16;
          -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v20, v17 - v20);
          if (v17 <= 0x3F)
            goto LABEL_35;
          return;
        }
        if (!v21 || v17 > 0x3F)
          return;
      }
    }
  }
  else
  {
    v10 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v10;
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", i))
      {
        -[NSMutableIndexSet addIndex:](self, "addIndex:", i);
      }
    }
  }
}

- (void)removeAllIndexes
{
  int indexSetFlags;

  indexSetFlags = (int)self->super._indexSetFlags;
  if ((indexSetFlags & 1) == 0)
  {
    free(self->super._internal._multipleRanges._data);
    indexSetFlags = *(_DWORD *)&self->super._indexSetFlags | 1;
  }
  self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(indexSetFlags | 2);
  self->super._internal._singleRange._range.location = 0;
}

- (void)shiftIndexesStartingAtIndex:(NSUInteger)index by:(NSInteger)delta
{
  if (delta && -[NSIndexSet count](self, "count"))
  {
    if (((unint64_t)self & 0x8000000000000000) != 0 || (*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
      -[NSMutableIndexSet _convertToUsingRanges](self, "_convertToUsingRanges");
    if (delta < 1)
      -[NSMutableIndexSet _removeAndDecrementBy:startingAtIndex:](self, "_removeAndDecrementBy:startingAtIndex:");
    else
      -[NSMutableIndexSet _incrementBy:startingAtIndex:](self, "_incrementBy:startingAtIndex:", delta, index);
  }
}

- (void)_convertToUsingRanges
{
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  NSUInteger location;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;

  p_internal = &self->super._internal;
  location = self->super._internal._singleRange._range.location;
  if (location)
  {
    v5 = ~location;
    v6 = 1;
    v7 = self->super._internal._singleRange._range.location;
    while (1)
    {
      v8 = (-1 << __clz(__rbit64(v7))) & v5;
      if (!v8)
        break;
      ++v6;
      v7 = (-1 << __clz(__rbit64(v8))) & location;
      if (!v7)
      {
        --v6;
        break;
      }
    }
    self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->super._indexSetFlags & 0xFFFFFFFC | 1);
    self->super._internal._singleRange._range.length = 0;
    if (v6)
    {
      if (v6 == 1)
      {
        v9 = __clz(__rbit64(location));
        self->super._internal._singleRange._range.location = v9;
        self->super._internal._singleRange._range.length = __clz(__rbit64((-1 << v9) & v5)) - v9;
      }
      else
      {
        -[NSMutableIndexSet _ensureRangeCapacity:](self, "_ensureRangeCapacity:", v6 + 1);
        v10 = 0;
        v11 = 0;
        *(_QWORD *)(self->super._internal._singleRange._range.location + 24) = 0;
LABEL_11:
        if (v11)
          v12 = v10;
        else
          v12 = 0;
        v13 = v12 - 1;
        do
        {
          v14 = (-1 << v11) & location;
          if (!v14)
            break;
          v15 = __clz(__rbit64(v14));
          v16 = (-1 << v15) & v5;
          v11 = __clz(__rbit64(v16));
          if (v10 == ++v13)
          {
            v17 = (uint64_t)p_internal;
            if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
              v17 = p_internal->_singleRange._range.location
                  + 16 * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                  + 64;
            v18 = (unint64_t *)(v17 + 16 * v10++);
            *v18 = v15;
            v18[1] = v11 - v15;
            *(_QWORD *)(p_internal->_singleRange._range.location + 16) += v11 - v15;
            if (v11 < 0x40)
              goto LABEL_11;
            break;
          }
        }
        while (v16 && v11 <= 0x3F);
        *(_QWORD *)(p_internal->_singleRange._range.location + 8) = v6;
      }
    }
  }
  else
  {
    self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->super._indexSetFlags & 0xFFFFFFFC | 1);
    self->super._internal._singleRange._range.length = 0;
  }
}

- (Class)classForCoder
{
  return (Class)NSMutableIndexSet;
}

- (void)addIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      v12 = 0;
      v13 = a4;
      do
      {
        v14 = a3[v13 - 1];
        if (v14 > 0x3F)
        {
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_3;
        }
        else
        {
          v12 |= 1 << v14;
        }
        --v13;
      }
      while (v13);
      self->super._internal._singleRange._range.location |= v12;
    }
    else
    {
LABEL_3:
      v5 = _NSGroupIndexesIntoSimpleRanges((uint64_t *)a3, a4);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            v10 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "rangeValue");
            -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v10, v11);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        }
        while (v7);
      }
    }
  }
}

- (void)addIndexesWithBitfield:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
  {
    self->super._internal._singleRange._range.location |= a3;
  }
  else
  {
    v5 = 0;
    v6 = 0;
LABEL_3:
    if (v6)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7 - 1;
    while (((-1 << v6) & a3) != 0)
    {
      v9 = __clz(__rbit64((-1 << v6) & a3));
      v10 = (-1 << v9) & ~a3;
      v6 = __clz(__rbit64(v10));
      if (v5 == ++v8)
      {
        ++v5;
        -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v9, v6 - v9);
        if (v6 < 0x40)
          goto LABEL_3;
        return;
      }
      if (!v10 || v6 > 0x3F)
        return;
    }
  }
}

- (void)removeIndexesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  unint64_t v6;
  NSMutableIndexSet *v7;
  _QWORD v8[7];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((a3 & 2) != 0)
    v6 = a3 & 0xFFFFFFFFFFFFFFFELL;
  else
    v6 = a3;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v6, 0, 0x7FFFFFFFFFFFFFFELL);
  v7 = objc_alloc_init(NSMutableIndexSet);
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NSMutableIndexSet_removeIndexesWithOptions_passingTest___block_invoke;
  v8[3] = &unk_1E0F4E7D0;
  v8[5] = a4;
  v8[6] = &v9;
  v8[4] = v7;
  __NSIndexSetEnumerate((uint64_t)self, v6, 0, 0x7FFFFFFFFFFFFFFELL, (uint64_t)v8);
  -[NSMutableIndexSet removeIndexes:](self, "removeIndexes:", v7);

}

void __58__NSMutableIndexSet_removeIndexesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 48));
  }
}

- (void)removeIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  NSMutableIndexSet *v11;
  _QWORD v12[7];
  int v13;
  uint64_t v14;

  length = a3.length;
  location = a3.location;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = a4 & 0xF7FFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0)
    v9 = a4;
  v10 = v9 | 0x800000000000000;
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v9 | 0x800000000000000, a3.location, a3.length);
  v11 = objc_alloc_init(NSMutableIndexSet);
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__NSMutableIndexSet_removeIndexesInRange_options_passingTest___block_invoke;
  v12[3] = &unk_1E0F4E7D0;
  v12[5] = a5;
  v12[6] = &v13;
  v12[4] = v11;
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)v12);
  -[NSMutableIndexSet removeIndexes:](self, "removeIndexes:", v11);

}

void __62__NSMutableIndexSet_removeIndexesInRange_options_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 48));
  }
}

- (void)removeIndexesPassingTest:(id)a3
{
  -[NSMutableIndexSet removeIndexesWithOptions:passingTest:](self, "removeIndexesWithOptions:passingTest:", 0, a3);
}

- (void)_removeAndDecrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4
{
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  $228E88DFACDD67E146FBAE62E08A49BD *p_internal;
  unint64_t *p_location;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  $228E88DFACDD67E146FBAE62E08A49BD *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSUInteger location;
  $A8859644891BA8F5A580113D622AC538 indexSetFlags;
  $228E88DFACDD67E146FBAE62E08A49BD *v25;
  $228E88DFACDD67E146FBAE62E08A49BD *v26;
  unint64_t v27;
  NSUInteger length;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  if (a3)
  {
    v7 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", a4);
    v8 = v7;
    v9 = v7;
    if (v7)
    {
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        return;
      p_internal = &self->super._internal;
      if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
        p_internal = ($228E88DFACDD67E146FBAE62E08A49BD *)(p_internal->_singleRange._range.location
                                                         + 16
                                                         * *(_QWORD *)(p_internal->_singleRange._range.location + 24)
                                                         + 64);
      p_location = &p_internal[v7]._singleRange._range.location;
      v13 = *p_location;
      v12 = p_location[1];
      v15 = a4 >= v13;
      v14 = a4 - v13;
      v15 = !v15 || v14 >= v12;
      v16 = v15;
      v9 = v7 - v16;
    }
    v34 = v9;
    v17 = a3 + a4 - 1;
    v18 = &self->super._internal;
    v19 = (uint64_t *)MEMORY[0x1E0DE7C58];
    while (((unint64_t)self & 0x8000000000000000) == 0)
    {
      indexSetFlags = self->super._indexSetFlags;
      if ((*(_BYTE *)&indexSetFlags & 2) != 0)
      {
        location = v18->_singleRange._range.location;
        if (v18->_singleRange._range.location)
          goto LABEL_30;
      }
      else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      {
        location = self->super._internal._singleRange._range.length;
        if (location)
          goto LABEL_30;
      }
      else
      {
        location = *(_QWORD *)(v18->_singleRange._range.location + 8);
        if (location)
          goto LABEL_30;
      }
LABEL_33:
      if (v8 >= location)
      {
        -[NSMutableIndexSet _mergeOverlappingRangesStartingAtIndex:](self, "_mergeOverlappingRangesStartingAtIndex:", v34);
        return;
      }
      v25 = &self->super._internal;
      if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
        v25 = ($228E88DFACDD67E146FBAE62E08A49BD *)(v18->_singleRange._range.location
                                                  + 16 * *(_QWORD *)(v18->_singleRange._range.location + 24)
                                                  + 64);
      v26 = &v25[v8];
      v27 = v26->_singleRange._range.location;
      length = v26->_singleRange._range.length;
      v15 = v17 >= v26->_singleRange._range.location;
      v29 = v17 - v26->_singleRange._range.location;
      if (!v15)
      {
        v27 -= a3;
        goto LABEL_51;
      }
      v30 = v27 + length - 1;
      if (v27 >= a4 && v30 <= v17)
      {
LABEL_44:
        -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", v8, v34);
      }
      else
      {
        if (v27 <= a4 && v17 <= v30)
        {
          v32 = a3;
LABEL_49:
          length -= v32;
LABEL_51:
          -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:](self, "_replaceRangeInArrayAtIndex:withRange:", v8, v27, length, v34);
          goto LABEL_52;
        }
        if (v17 <= v30)
        {
          v31 = v29 + 1;
          length -= v31;
          if (length)
          {
            v27 = v27 - a3 + v31;
            goto LABEL_51;
          }
          goto LABEL_44;
        }
        if (v27 <= a4)
        {
          v33 = v30 - a4;
          if (v30 >= a4)
          {
            v15 = __CFADD__(v33, 1);
            v32 = v33 + 1;
            if (!v15)
              goto LABEL_49;
          }
        }
LABEL_52:
        ++v8;
      }
    }
    v20 = *v19;
    if (((unint64_t)self & 0xC000000000000007) == 0xC000000000000007)
      v20 = 0;
    v21 = v20 ^ (unint64_t)self;
    if ((~(_BYTE)v21 & 7) != 0)
      v22 = 0xFFFFFFFFFFFFFFFLL;
    else
      v22 = 0xFFFFFFFFFFFFFLL;
    location = v22 & (v21 >> 3);
    if (!location)
      goto LABEL_33;
LABEL_30:
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
      location = 1;
    else
      location = *(_QWORD *)(v18->_singleRange._range.location + 8);
    goto LABEL_33;
  }
}

@end
