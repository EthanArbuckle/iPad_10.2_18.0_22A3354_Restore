@implementation ICNoteAllAccountVisibilityTesting

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_41);
  return (id)sharedInstance_instance;
}

void __51__ICNoteAllAccountVisibilityTesting_sharedInstance__block_invoke()
{
  ICNoteAllAccountVisibilityTesting *v0;
  void *v1;

  v0 = objc_alloc_init(ICNoteAllAccountVisibilityTesting);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (BOOL)supportsVisibilityTestingType:(int64_t)a3
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "visibilityTestingType != ICNoteVisibilityTestingTypeInvalid", "-[ICNoteAllAccountVisibilityTesting supportsVisibilityTestingType:]", 1, 0, CFSTR("Invalid visibilityTestingType"));
  return a3 != 0;
}

- (id)predicateForSearchableNotes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isHiddenFromSearch == NO"));
}

- (id)predicateForSearchableAttachments
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isHiddenFromSearch == NO"));
}

@end
