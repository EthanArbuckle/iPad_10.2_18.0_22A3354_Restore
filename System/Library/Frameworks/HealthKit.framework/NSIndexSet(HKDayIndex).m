@implementation NSIndexSet(HKDayIndex)

+ (uint64_t)hk_indexSetWithDayIndexRange:()HKDayIndex
{
  void *v8;
  void *v9;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HKDayIndexRange.h"), 46, CFSTR("Cannot convert day index ranges less than 0 to NSRange"));

  }
  return objc_msgSend(a1, "indexSetWithIndexesInRange:", a3, a4);
}

- (void)hk_enumerateDayIndexRangesUsingBlock:()HKDayIndex
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__NSIndexSet_HKDayIndex__hk_enumerateDayIndexRangesUsingBlock___block_invoke;
  v6[3] = &unk_1E37E9E70;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v6);

}

- (void)hk_enumerateDayIndexRangesWithOptions:()HKDayIndex usingBlock:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__NSIndexSet_HKDayIndex__hk_enumerateDayIndexRangesWithOptions_usingBlock___block_invoke;
  v8[3] = &unk_1E37E9E70;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "enumerateRangesWithOptions:usingBlock:", a3, v8);

}

@end
