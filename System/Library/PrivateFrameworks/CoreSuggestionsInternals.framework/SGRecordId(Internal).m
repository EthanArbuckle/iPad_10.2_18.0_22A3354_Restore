@implementation SGRecordId(Internal)

- (unint64_t)tableId
{
  return (unint64_t)objc_msgSend(a1, "internalEntityId") >> 56;
}

- (uint64_t)rowId
{
  return objc_msgSend(a1, "internalEntityId") & 0xFFFFFFFFFFFFFFLL;
}

+ (uint64_t)recordIdWithTableId:()Internal rowId:
{
  void *v6;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D19920];
  if (HIBYTE(a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int64_t makeInternalEntityId(SGTableId, int64_t)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SGRecordId+Internal.m"), 22, CFSTR("rowId out of range"));

  }
  return objc_msgSend(v6, "recordIdWithInternalEntityId:", a4 | (a3 << 56));
}

+ (uint64_t)recordIdForEmailWithRowId:()Internal
{
  return objc_msgSend(MEMORY[0x1E0D19920], "recordIdWithTableId:rowId:", 1, a3);
}

+ (uint64_t)recordIdForContactWithRowId:()Internal
{
  return objc_msgSend(MEMORY[0x1E0D19920], "recordIdWithTableId:rowId:", 0, a3);
}

+ (uint64_t)recordIdForContactDetailWithRowId:()Internal
{
  return objc_msgSend(MEMORY[0x1E0D19920], "recordIdWithTableId:rowId:", 0, a3);
}

+ (uint64_t)recordIdForEventWithRowId:()Internal
{
  return objc_msgSend(MEMORY[0x1E0D19920], "recordIdWithTableId:rowId:", 0, a3);
}

@end
