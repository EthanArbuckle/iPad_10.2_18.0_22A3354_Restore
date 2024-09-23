@implementation NSUserActivity

void __40__NSUserActivity_MKMapItem__setMapItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    NSLog(CFSTR("Failed to serialize map item: %@"), v11);
  (*((void (**)(id, id, void *, _QWORD, _QWORD))v8 + 2))(v8, v7, v10, 0, 0);

}

@end
