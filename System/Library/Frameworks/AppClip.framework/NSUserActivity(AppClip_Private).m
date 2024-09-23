@implementation NSUserActivity(AppClip_Private)

- (id)appClipActivationPayload
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v13;

  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("com.apple.AppClip.useractivity.appClipActivationPayload"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSUserActivity(AppClip_Private) appClipActivationPayload].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = 0;
  }
  else
  {
    v11 = v2;
  }

  return v11;
}

- (void)setAppClipActivationPayload:()AppClip_Private
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[NSUserActivity(AppClip_Private) setAppClipActivationPayload:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
    else
    {
      objc_msgSend(a1, "_setPayload:object:identifier:dirty:", v5, 0, CFSTR("com.apple.AppClip.useractivity.appClipActivationPayload"), 0);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NSUserActivity(AppClip_Private) setAppClipActivationPayload:].cold.2();
  }

}

- (void)appClipActivationPayload
{
  OUTLINED_FUNCTION_0(&dword_2295E7000, MEMORY[0x24BDACB70], a3, "An error occurred when unarchiving activation payload, %@", a5, a6, a7, a8, 2u);
}

- (void)setAppClipActivationPayload:()AppClip_Private .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2295E7000, MEMORY[0x24BDACB70], a3, "An error occurred when archiving activation payload, %@", a5, a6, a7, a8, 2u);
}

- (void)setAppClipActivationPayload:()AppClip_Private .cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2295E7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "The payload is not an instance of APActivationPayload.", v0, 2u);
}

@end
