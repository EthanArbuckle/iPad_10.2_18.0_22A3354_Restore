@implementation CNAutocompleteCalendarServerOperationFactory

- (id)eventKitDirectorySearchOperationForSource:(id)a3 query:(id)a4 resultsBlock:(id)a5
{
  Class (__cdecl *v7)();
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (Class (__cdecl *)())getEKDirectorySearchOperationClass;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc(v7()), "initWithSource:query:resultsBlock:", v10, v9, v8);

  return v11;
}

@end
