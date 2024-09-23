@implementation FBKMergePolicy

- (FBKMergePolicy)initWithType:(unint64_t)a3
{
  uint64_t v4;
  FBKMergePolicy *result;
  objc_super v6;

  if (a3)
    v4 = 2;
  else
    v4 = 1;
  v6.receiver = self;
  v6.super_class = (Class)FBKMergePolicy;
  result = -[NSMergePolicy initWithMergeType:](&v6, sel_initWithMergeType_, v4);
  if (result)
    result->_type = a3;
  return result;
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  objc_super v12;

  v6 = a3;
  +[FBKLog model](FBKLog, "model");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FBKMergePolicy resolveConflicts:error:].cold.2((uint64_t)v6, v7, v8);

  +[FBKLog model](FBKLog, "model");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[FBKMergePolicy resolveConflicts:error:].cold.1(self, v9);

  v12.receiver = self;
  v12.super_class = (Class)FBKMergePolicy;
  v10 = -[NSMergePolicy resolveConflicts:error:](&v12, sel_resolveConflicts_error_, v6, a4);

  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)resolveConflicts:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a1, "type");
  v4 = CFSTR("Foreground: ObjectTrumpMergePolicy");
  if (!v3)
    v4 = CFSTR("Background: StoreTrumpMergePolicy");
  v5 = v4;
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v6, "Will resolve with [%@]", (uint8_t *)&v7);

}

- (void)resolveConflicts:(uint64_t)a3 error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, a3, "Resolving merge conflicts [%@]", (uint8_t *)&v3);
}

@end
