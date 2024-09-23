@implementation ASDTRawProperty

- (ASDTRawProperty)initWithConfig:(id)a3
{
  id v4;
  ASDTRawProperty *v5;
  ASDTRawProperty *v6;
  void *v7;
  ASDTRawProperty *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTRawProperty;
  v5 = -[ASDTCustomProperty initWithConfig:propertyDataType:qualifierDataType:](&v10, sel_initWithConfig_propertyDataType_qualifierDataType_, v4, 1918990199, 0);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  -[ASDTCustomProperty setCacheMode:](v5, "setCacheMode:", 2);
  objc_msgSend(v4, "asdtPropertyValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ASDTRawProperty storePropertyValue:](v6, "storePropertyValue:", v7);

LABEL_4:
    v8 = v6;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTRawProperty initWithConfig:].cold.1(v6);

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[ASDTCustomProperty setPropertyValueSize:](self, "setPropertyValueSize:", objc_msgSend(v4, "length"));
  v6.receiver = self;
  v6.super_class = (Class)ASDTRawProperty;
  LOBYTE(self) = -[ASDTCustomProperty storePropertyValue:](&v6, sel_storePropertyValue_, v4);

  return (char)self;
}

- (void)initWithConfig:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412546;
  v3 = v1;
  v4 = 2112;
  v5 = CFSTR("Value");
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Key %@ must specify an NSData object.", (uint8_t *)&v2, 0x16u);

}

@end
