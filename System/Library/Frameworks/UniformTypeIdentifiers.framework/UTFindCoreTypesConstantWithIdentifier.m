@implementation UTFindCoreTypesConstantWithIdentifier

void ____UTFindCoreTypesConstantWithIdentifier_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v0 = objc_alloc(MEMORY[0x1E0C99E40]);
  _UTGetAllCoreTypesConstants();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithArray:");
  v2 = (void *)qword_1ECD26C78;
  qword_1ECD26C78 = v1;

  v3 = (void *)qword_1ECD26C78;
  if (!qword_1ECD26C78)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef __UTFindCoreTypesConstantWithIdentifier(NSString *const __strong _Nonnull, NSInteger)_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UTCoreTypes.mm"), 267, CFSTR("Failed to construct O(1) lookup table for constant UTType instances."));

    v3 = (void *)qword_1ECD26C78;
  }
  if (objc_msgSend(v3, "count") != 171)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef __UTFindCoreTypesConstantWithIdentifier(NSString *const __strong _Nonnull, NSInteger)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UTCoreTypes.mm"), 268, CFSTR("Lookup table is the wrong size."));

  }
}

@end
