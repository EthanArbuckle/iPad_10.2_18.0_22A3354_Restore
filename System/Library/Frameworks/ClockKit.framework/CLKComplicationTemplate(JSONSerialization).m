@implementation CLKComplicationTemplate(JSONSerialization)

+ (void)createJSONRepresentationFromDictionary:()JSONSerialization bundlePath:purpose:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_4_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2114F4000, v2, v3, "Cannot encode class: %@ since it does not respond to JSONObjectRepresentation or JSONObjectRepresentationWritingResourcesToBundlePath, or is not a NSJSONSerialization compatible class", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)objectFromJSON:()JSONSerialization bundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, v0, v1, "embeddedSuperclass is nil so the value cannot be encoded, embeddedClass is: %@", v2);
}

+ (void)objectFromJSON:()JSONSerialization bundle:.cold.2(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2114F4000, v3, v4, "Cannot encode class: %@ since it is not a supported CLK type", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)objectFromJSON:()JSONSerialization bundle:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a1, a3, "embeddedClass is nil so the value cannot be encoded, embeddedClass is: %@", (uint8_t *)&v3);
}

+ (void)_jsonObjectRepresentationFromObject:()JSONSerialization bundlePath:purpose:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_4_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2114F4000, v2, v3, "Class %@ is not compatible with JSONSerialization.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
