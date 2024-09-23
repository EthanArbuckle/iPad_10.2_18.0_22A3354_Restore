@implementation CIBarcodeDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIBarcodeDescriptor)init
{
  CIBarcodeDescriptor *v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIBarcodeDescriptor;
  v2 = -[CIBarcodeDescriptor init](&v6, sel_init);
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CIBarcodeDescriptor init].cold.1();

    return 0;
  }
  return v2;
}

- (CIBarcodeDescriptor)initWithCoder:(id)a3
{
  NSObject *v4;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CIBarcodeDescriptor initWithCoder:].cold.1();
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1921E4000, v0, v1, "%{public}s %{public}@: instantiating abstract barcode descriptor objects is prohibited", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1921E4000, v0, v1, "%{public}s %{public}@: requires coder that supports keyed coding of objects", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
