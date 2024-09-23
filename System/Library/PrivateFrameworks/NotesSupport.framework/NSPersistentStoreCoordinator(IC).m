@implementation NSPersistentStoreCoordinator(IC)

- (id)ic_managedObjectIDForURIRepresentation:()IC
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "scheme"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("x-coredata")),
        v6,
        v7))
  {
    objc_msgSend(a1, "managedObjectIDForURIRepresentation:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIRepresentation:].cold.1(v5, v9);

    v8 = 0;
  }

  return v8;
}

- (id)ic_managedObjectIDForURIString:()IC
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIString:].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIString:].cold.2(v6, v16, v17, v18, v19, v20, v21, v22);
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_managedObjectIDForURIRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[NSPersistentStoreCoordinator(IC) ic_managedObjectIDForURIString:].cold.3((uint64_t)v5, (uint64_t)a1, v8);

  }
LABEL_12:

  return v7;
}

- (void)ic_managedObjectIDForURIString:()IC .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Trying to create managed object ID from nil URI string", a5, a6, a7, a8, 0);
}

- (void)ic_managedObjectIDForURIString:()IC .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Trying to create managed object ID from zero-length URI string", a5, a6, a7, a8, 0);
}

- (void)ic_managedObjectIDForURIString:()IC .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, a3, (uint64_t)a3, "Could not create object ID from string %@ in coordinator %@", (uint8_t *)&v3);
}

- (void)ic_managedObjectIDForURIRepresentation:()IC .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Unable to get object ID URL for HTML note uriString: %@", (uint8_t *)&v4, 0xCu);

}

- (void)ic_managedObjectIDForURIRepresentation:()IC .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_begin_catch(a1);
  v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = a3;
    v9 = 2112;
    v10 = v4;
    OUTLINED_FUNCTION_3(&dword_1DDAA5000, v5, v6, "Failed to get managed object ID from URL %@: %@", (uint8_t *)&v7);
  }

  objc_end_catch();
}

@end
