@implementation NSPinyinString

- (unint64_t)length
{
  return -[NSString length](self->_string, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3);
}

- (NSPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 replacementCount:(unint64_t)a7 transpositionCount:(unint64_t)a8 insertionCount:(unint64_t)a9 deletionCount:(unint64_t)a10 indexOfFirstModification:(unint64_t)a11 rangeCount:(unint64_t)a12 ranges:(_NSRange *)a13
{
  NSPinyinString *v19;
  _NSRange *v20;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)NSPinyinString;
  v19 = -[NSString init](&v22, sel_init);
  v19->_string = (NSString *)objc_msgSend(a3, "copy");
  v19->_syllableCount = a4;
  v19->_lastSyllableIsPartial = a5;
  v19->_score = a6;
  v19->_replacementCount = a7;
  v19->_transpositionCount = a8;
  v19->_insertionCount = a9;
  v19->_deletionCount = a10;
  v19->_firstModificationIndex = a11;
  v19->_rangeCount = a12;
  if (a12)
  {
    v20 = (_NSRange *)malloc_type_malloc(16 * a12, 0x1000040451B5BE8uLL);
    v19->_ranges = v20;
    memmove(v20, a13, 16 * v19->_rangeCount);
  }
  return v19;
}

- (NSPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 replacementCount:(unint64_t)a7 transpositionCount:(unint64_t)a8 insertionCount:(unint64_t)a9 deletionCount:(unint64_t)a10 rangeCount:(unint64_t)a11 ranges:(_NSRange *)a12
{
  return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:](self, "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11, a12);
}

- (void)dealloc
{
  _NSRange *ranges;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  ranges = self->_ranges;
  if (ranges)
    free(ranges);
  v4.receiver = self;
  v4.super_class = (Class)NSPinyinString;
  -[NSPinyinString dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v13;
  unint64_t syllableCount;
  int lastSyllableIsPartial;
  unint64_t score;
  unint64_t rangeCount;
  unint64_t replacementCount;
  unint64_t transpositionCount;
  unint64_t insertionCount;
  unint64_t deletionCount;
  unint64_t firstModificationIndex;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v30 = v8;
    v31 = v7;
    v32 = v6;
    v33 = v5;
    v34 = v4;
    v35 = v3;
    v36 = v9;
    v37 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    v13 = -[NSString isEqualToString:](self->_string, "isEqualToString:", objc_msgSend(a3, "string"));
    if (!v13)
      return v13;
    syllableCount = self->_syllableCount;
    if (syllableCount != objc_msgSend(a3, "syllableCount"))
      goto LABEL_25;
    lastSyllableIsPartial = self->_lastSyllableIsPartial;
    if (lastSyllableIsPartial != objc_msgSend(a3, "lastSyllableIsPartial")
      || (score = self->_score, score != objc_msgSend(a3, "score"))
      || (rangeCount = self->_rangeCount, rangeCount != objc_msgSend(a3, "numberOfNonPinyinRanges"))
      || (replacementCount = self->_replacementCount, replacementCount != objc_msgSend(a3, "numberOfReplacements"))
      || (transpositionCount = self->_transpositionCount,
          transpositionCount != objc_msgSend(a3, "numberOfTranspositions"))
      || (insertionCount = self->_insertionCount, insertionCount != objc_msgSend(a3, "numberOfInsertions"))
      || (deletionCount = self->_deletionCount, deletionCount != objc_msgSend(a3, "numberOfDeletions"))
      || (firstModificationIndex = self->_firstModificationIndex,
          firstModificationIndex != objc_msgSend(a3, "indexOfFirstModification")))
    {
LABEL_25:
      LOBYTE(v13) = 0;
      return v13;
    }
    if (self->_rangeCount)
    {
      v23 = 0;
      do
      {
        v24 = -[NSPinyinString nonPinyinRangeAtIndex:](self, "nonPinyinRangeAtIndex:", v23, v30, v31, v32, v33, v34, v35, v36, v37);
        v26 = v25;
        v28 = v24 == objc_msgSend(a3, "nonPinyinRangeAtIndex:", v23) && v26 == v27;
        LOBYTE(v13) = v28;
        if (!v28)
          break;
        ++v23;
      }
      while (v23 < self->_rangeCount);
    }
    else
    {
      LOBYTE(v13) = 1;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  return self->_syllableCount ^ self->_score ^ -[NSString hash](self->_string, "hash") ^ self->_rangeCount;
}

- (id)nonPinyinIndexSet
{
  NSIndexSet *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  v3 = +[NSIndexSet indexSet](NSMutableIndexSet, "indexSet");
  v4 = -[NSPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = -[NSPinyinString nonPinyinRangeAtIndex:](self, "nonPinyinRangeAtIndex:", i);
      -[NSIndexSet addIndexesInRange:](v3, "addIndexesInRange:", v7, v8);
    }
  }
  return v3;
}

- (id)description
{
  NSString *v3;
  id v4;
  unint64_t v5;
  NSString *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = +[NSString string](NSMutableString, "string");
  v4 = -[NSPinyinString nonPinyinIndexSet](self, "nonPinyinIndexSet");
  v5 = -[NSPinyinString length](self, "length");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__NSPinyinString_description__block_invoke;
  v8[3] = &unk_1E0F51968;
  v8[5] = self;
  v8[6] = &v9;
  v8[4] = v3;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v8);
  if (v5 > v10[3])
    -[NSString appendString:](v3, "appendString:", -[NSString substringWithRange:](self, "substringWithRange:"));
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@> syllables %lu last partial %d repls %lu trans %lu inserts %lu deletes %lu fmi %lu score %lu ranges %lu"), v3, -[NSPinyinString syllableCount](self, "syllableCount"), -[NSPinyinString lastSyllableIsPartial](self, "lastSyllableIsPartial"), -[NSPinyinString numberOfReplacements](self, "numberOfReplacements"), -[NSPinyinString numberOfTranspositions](self, "numberOfTranspositions"), -[NSPinyinString numberOfInsertions](self, "numberOfInsertions"), -[NSPinyinString numberOfDeletions](self, "numberOfDeletions"), -[NSPinyinString indexOfFirstModification](self, "indexOfFirstModification"), -[NSPinyinString score](self, "score"), -[NSPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges"));
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __29__NSPinyinString_description__block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = result;
  if (a2 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    result = objc_msgSend(*(id *)(result + 32), "appendString:", objc_msgSend(*(id *)(result + 40), "substringWithRange:"));
  if (a3)
    result = objc_msgSend(*(id *)(v5 + 32), "appendFormat:", CFSTR("[%@]"), objc_msgSend(*(id *)(v5 + 40), "substringWithRange:", a2, a3));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) = a2 + a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requires keyed coding"), objc_opt_class()), 0);
    objc_exception_throw(v10);
  }
  v5 = -[NSPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPinyinString string](self, "string"), CFSTR("NSString"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString syllableCount](self, "syllableCount"), CFSTR("NSSyllableCount"));
  objc_msgSend(a3, "encodeBool:forKey:", -[NSPinyinString lastSyllableIsPartial](self, "lastSyllableIsPartial"), CFSTR("NSLastSyllableIsPartial"));
  objc_msgSend(a3, "encodeInt32:forKey:", v5, CFSTR("NSRangeCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString score](self, "score"), CFSTR("NSScore"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString numberOfReplacements](self, "numberOfReplacements"), CFSTR("NSReplacementCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString numberOfTranspositions](self, "numberOfTranspositions"), CFSTR("NSTranspositionCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString numberOfInsertions](self, "numberOfInsertions"), CFSTR("NSInsertionCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString numberOfDeletions](self, "numberOfDeletions"), CFSTR("NSDeletionCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", -[NSPinyinString indexOfFirstModification](self, "indexOfFirstModification"), CFSTR("NSModificationIndex"));
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    for (i = 0; i != v5; ++i)
    {
      v8 = -[NSPinyinString nonPinyinRangeAtIndex:](self, "nonPinyinRangeAtIndex:", i);
      objc_msgSend(v6, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", v8, v9));
    }
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSRanges"));
  }
}

- (NSPinyinString)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSPinyinString *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ requires keyed coding"), objc_opt_class()), 0);
    objc_exception_throw(v27);
  }
  v4 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSString"));
  v5 = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSSyllableCount"));
  v6 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSLastSyllableIsPartial"));
  v7 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSRangeCount"));
  v8 = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSScore"));
  v9 = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSReplacementCount"));
  v10 = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSTranspositionCount"));
  v11 = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSInsertionCount"));
  v12 = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSDeletionCount"));
  v13 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSModificationIndex"));
  if (!v7)
    return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:](self, "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:", v4, v5, v6, v8, v9, v10, v11, v12, v13, 0, 0);
  v29 = v13;
  v30 = v12;
  v14 = v4;
  v15 = v5;
  v16 = v14;
  v31 = v8;
  v32 = v6;
  v17 = v7;
  v18 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSRanges"));
  if (objc_msgSend(v18, "count") != v17)
    return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:](self, "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:", v16, v15, v32, v8, v9, v10, v11, v12, v29, 0, 0);
  v19 = malloc_type_malloc(16 * v17, 0x1000040451B5BE8uLL);
  if (!v19)
    return -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:](self, "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:", v16, v15, v32, v8, v9, v10, v11, v12, v29, 0, 0);
  v20 = v19;
  v28 = v16;
  v21 = 0;
  if (v17 <= 1)
    v22 = 1;
  else
    v22 = v17;
  v23 = v19 + 1;
  do
  {
    *(v23 - 1) = objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", v21), "rangeValue");
    *v23 = v24;
    ++v21;
    v23 += 2;
  }
  while (v22 != v21);
  v25 = -[NSPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:](self, "initWithString:syllableCount:lastSyllableIsPartial:score:replacementCount:transpositionCount:insertionCount:deletionCount:indexOfFirstModification:rangeCount:ranges:", v28, v15, v32, v31, v9, v10, v11, v30, v29, v17, v20);
  free(v20);
  return v25;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (id)string
{
  return self->_string;
}

- (unint64_t)syllableCount
{
  return self->_syllableCount;
}

- (BOOL)lastSyllableIsPartial
{
  return self->_lastSyllableIsPartial;
}

- (unint64_t)score
{
  return self->_score;
}

- (unint64_t)numberOfNonPinyinRanges
{
  return self->_rangeCount;
}

- (unint64_t)numberOfReplacements
{
  return self->_replacementCount;
}

- (unint64_t)numberOfTranspositions
{
  return self->_transpositionCount;
}

- (unint64_t)numberOfInsertions
{
  return self->_insertionCount;
}

- (unint64_t)numberOfDeletions
{
  return self->_deletionCount;
}

- (unint64_t)indexOfFirstModification
{
  return self->_firstModificationIndex;
}

- (_NSRange)nonPinyinRangeAtIndex:(unint64_t)a3
{
  unint64_t rangeCount;
  _NSRange *v4;
  NSUInteger location;
  NSUInteger length;
  NSString *v7;
  _NSRange result;

  rangeCount = self->_rangeCount;
  if (rangeCount <= a3)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("index %lu count %lu"), a3, rangeCount);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  v4 = &self->_ranges[a3];
  location = v4->location;
  length = v4->length;
  result.length = length;
  result.location = location;
  return result;
}

+ (id)alternativesForInputString:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(a1, "_alternativesForInputString:", a3);
  else
    return 0;
}

+ (id)prefixesForInputString:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(a1, "_prefixesForInputString:", a3);
  else
    return 0;
}

@end
