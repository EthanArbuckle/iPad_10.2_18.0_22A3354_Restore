@implementation EKObjectChangeOwnerIDHelper

+ (id)createOwnerIDWithRowID:(id)a3 objectType:(int64_t)a4 databaseID:(int)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:].cold.1(v10);
    goto LABEL_14;
  }
  if (a4 <= 0)
  {
    v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:].cold.2(v11, a4);
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "integerValue") < 0)
  {
    v12 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:].cold.3((uint64_t)v8, v12, v13);
    goto LABEL_14;
  }
  if ((v5 & 0x80000000) != 0)
  {
    v14 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:].cold.4(v5, v14);
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", a4, objc_msgSend(v8, "intValue"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v9;
}

+ (void)createOwnerIDWithRowID:(os_log_t)log objectType:databaseID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Nil rowID passed in to createOwnerIDWithRowID:objectType:", v1, 2u);
}

+ (void)createOwnerIDWithRowID:(void *)a1 objectType:(uint64_t)a2 databaseID:.cold.2(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v4, v6, "Invalid owner object type. Type: %@", (uint8_t *)&v7);

}

+ (void)createOwnerIDWithRowID:(uint64_t)a1 objectType:(NSObject *)a2 databaseID:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a2, a3, "Invalid rowID passed in. rowID: %@", (uint8_t *)&v3);
}

+ (void)createOwnerIDWithRowID:(int)a1 objectType:(NSObject *)a2 databaseID:.cold.4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Invalid databaseID: %d", (uint8_t *)v2, 8u);
}

@end
