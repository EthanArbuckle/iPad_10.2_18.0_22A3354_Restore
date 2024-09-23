@implementation MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName

uint64_t __MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName_block_invoke(id *a1, const void *a2)
{
  uint64_t v4;
  ABPropertyID v5;
  void *v6;
  unsigned int HasPrefix;
  ABPropertyID v8;
  void *v9;
  unsigned int v10;
  ABPropertyID v11;
  void *v12;
  unsigned int v13;
  ABPropertyID v14;
  void *v15;
  unsigned int v16;
  ABPropertyID v17;
  void *v18;
  unsigned int v19;

  v4 = objc_msgSend(a1[4], "countForObject:", a2);
  v5 = *MEMORY[0x1E0CF61D8];
  objc_msgSend(a1[5], "namePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HasPrefix = _personPropertyHasPrefix(a2, v5, v6);

  v8 = *MEMORY[0x1E0CF5FD8];
  objc_msgSend(a1[5], "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _personPropertyHasPrefix(a2, v8, v9);

  v11 = *MEMORY[0x1E0CF6108];
  objc_msgSend(a1[5], "middleName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _personPropertyHasPrefix(a2, v11, v12);

  v14 = *MEMORY[0x1E0CF60D0];
  objc_msgSend(a1[5], "familyName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _personPropertyHasPrefix(a2, v14, v15);

  v17 = *MEMORY[0x1E0CF6280];
  objc_msgSend(a1[5], "nameSuffix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _personPropertyHasPrefix(a2, v17, v18);

  return v4
       + HasPrefix
       + v10
       + v13
       + v16
       + v19
       + _personPropertyHasPrefix(a2, *MEMORY[0x1E0CF6138], a1[6]);
}

@end
