@implementation CKMutableIntervalMap

- (void)addIndexes:(id)a3 withObject:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7064CC;
  v12[3] = &unk_1E1F624F8;
  v12[4] = self;
  v11 = v6;
  v13 = v11;
  objc_msgSend_enumerateRangesUsingBlock_(a3, v7, (uint64_t)v12, v8);
  objc_msgSend_setDirty_(self, v9, 1, v10);

}

@end
