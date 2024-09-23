@implementation EKObjectValidationContext

- (EKObjectValidationContext)initWithRootObject:(id)a3
{
  id v5;
  EKObjectValidationContext *v6;
  EKObjectValidationContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKObjectValidationContext;
  v6 = -[EKObjectValidationContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rootObject, a3);

  return v7;
}

- (void)faultIfNeededForObject:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[EKObjectValidationContext reachedMaxDepth](self, "reachedMaxDepth"))
  {
    -[EKObjectValidationContext rootObject](self, "rootObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      v6 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
        -[EKObjectValidationContext faultIfNeededForObject:].cold.1(v6, v4);
    }
  }

}

- (EKObject)rootObject
{
  return self->_rootObject;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void)setDepth:(unint64_t)a3
{
  self->_depth = a3;
}

- (BOOL)reachedMaxDepth
{
  return self->_reachedMaxDepth;
}

- (void)setReachedMaxDepth:(BOOL)a3
{
  self->_reachedMaxDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObject, 0);
}

- (void)faultIfNeededForObject:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "privacyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1A2318000, v3, OS_LOG_TYPE_FAULT, "Reached maximum depth while validating root object %{public}@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

@end
