@implementation CKServerFieldNameForUserFieldName

void __CKServerFieldNameForUserFieldName_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[7];
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C94A00];
  v8[0] = CFSTR("recordID");
  v8[1] = CFSTR("creationDate");
  v1 = *MEMORY[0x1E0C949C0];
  v9[0] = v0;
  v9[1] = v1;
  v2 = *MEMORY[0x1E0C949E0];
  v8[2] = CFSTR("modificationDate");
  v8[3] = CFSTR("creatorUserRecordID");
  v3 = *MEMORY[0x1E0C949C8];
  v9[2] = v2;
  v9[3] = v3;
  v4 = *MEMORY[0x1E0C949D8];
  v8[4] = CFSTR("lastModifiedUserRecordID");
  v8[5] = CFSTR("recordChangeTag");
  v5 = *MEMORY[0x1E0C949D0];
  v9[4] = v4;
  v9[5] = v5;
  v8[6] = CFSTR("shareID");
  v9[6] = *MEMORY[0x1E0C94A18];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED0F8338;
  qword_1ED0F8338 = v6;

}

@end
