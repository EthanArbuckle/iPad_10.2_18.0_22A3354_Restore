@implementation IRBiomeParameters

- (IRBiomeParameters)initWithBiomeEventType:(int64_t)a3
{
  IRBiomeParameters *v4;
  IRBiomeParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IRBiomeParameters;
  v4 = -[IRBiomeParameters init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[IRBiomeParameters setEventType:](v4, "setEventType:", a3);
  return v5;
}

- (id)queryPublisherWithOptions:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  switch(-[IRBiomeParameters eventType](self, "eventType"))
  {
    case 0:
    case 4:
      -[IRBiomeParameters queryPublisherWithOptions:].cold.1((char *)self);
    case 1:
      BiomeLibrary();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "Device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "Wireless");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "WiFi");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "publisherWithOptions:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    case 2:
      BiomeLibrary();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "Media");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "Route");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
      BiomeLibrary();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "Device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "Metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v8 = v10;
      objc_msgSend(v10, "publisherWithOptions:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

      break;
    default:
      break;
  }

  return v3;
}

- (id)contextPublisher
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  switch(-[IRBiomeParameters eventType](self, "eventType"))
  {
    case 0:
    case 4:
      -[IRBiomeParameters contextPublisher].cold.1((char *)self);
    case 1:
      BiomeLibrary();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "Wireless");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "WiFi");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "DSLPublisher");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    case 2:
      BiomeLibrary();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Media");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "Route");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3:
      BiomeLibrary();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "Metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v6 = v8;
      objc_msgSend(v8, "DSLPublisher");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

      break;
    default:
      return v2;
  }
  return v2;
}

- (Class)biomeEventClass
{
  void *v3;

  v3 = -[IRBiomeParameters eventType](self, "eventType");
  switch((unint64_t)v3)
  {
    case 0uLL:
    case 4uLL:
      -[IRBiomeParameters biomeEventClass].cold.1((char *)self);
    case 1uLL:
    case 2uLL:
    case 3uLL:
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (Class)v3;
  }
  return (Class)v3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void)queryPublisherWithOptions:(char *)a1 .cold.1(char *a1)
{
  const void **v2;
  void *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint8_t v19;

  v2 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4_0())
  {
    v4 = OUTLINED_FUNCTION_6_0();
    IRBiomeEventTypeToString(a1);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    OUTLINED_FUNCTION_7_0(v5, v6);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_2_1(&dword_23FFBA000, v7, v8, "%s[%@], [ErrorId - Biome query publisher unsupported] couldn't find a publisher for biome event type %s", v9, v10, v11, v12, v19);

  }
  dispatch_get_specific(*v2);
  objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_0_4())
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_1_1(&dword_23FFBA000, v13, v14, "%s[%@], %s:%d: assertion failure in %s", v15, v16, v17, v18, v19);
  }

  abort();
}

- (void)contextPublisher
{
  const void **v2;
  void *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint8_t v19;

  v2 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4_0())
  {
    v4 = OUTLINED_FUNCTION_6_0();
    IRBiomeEventTypeToString(a1);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    OUTLINED_FUNCTION_7_0(v5, v6);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_2_1(&dword_23FFBA000, v7, v8, "%s[%@], [ErrorId - Biome context publisher unsupported] couldn't find a publisher for biome event type %s", v9, v10, v11, v12, v19);

  }
  dispatch_get_specific(*v2);
  objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_0_4())
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_1_1(&dword_23FFBA000, v13, v14, "%s[%@], %s:%d: assertion failure in %s", v15, v16, v17, v18, v19);
  }

  abort();
}

- (void)biomeEventClass
{
  const void **v2;
  void *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
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
  uint8_t v19;

  v2 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4_0())
  {
    v4 = OUTLINED_FUNCTION_6_0();
    IRBiomeEventTypeToString(a1);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    OUTLINED_FUNCTION_7_0(v5, v6);
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_2_1(&dword_23FFBA000, v7, v8, "%s[%@], [ErrorId - Unsupported biome event class] couldn't find a Class for biome event type %s", v9, v10, v11, v12, v19);

  }
  dispatch_get_specific(*v2);
  objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_0_4())
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_1_1(&dword_23FFBA000, v13, v14, "%s[%@], %s:%d: assertion failure in %s", v15, v16, v17, v18, v19);
  }

  abort();
}

@end
