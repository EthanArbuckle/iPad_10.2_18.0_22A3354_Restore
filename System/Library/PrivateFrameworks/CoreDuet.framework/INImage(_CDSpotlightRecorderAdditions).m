@implementation INImage(_CDSpotlightRecorderAdditions)

- (id)cd_dataImage
{
  void *v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v18;
  uint8_t buf[16];

  if (objc_msgSend(a1, "_requiresRetrieval"))
  {
    objc_msgSend(a1, "_uri");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2 && (objc_msgSend(v2, "isFileURL") & 1) == 0)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEFAULT, "Retrieving populated intent images with remote URLs is not supported", buf, 2u);
      }

      v7 = 0;
    }
    else
    {
      slRESupergreenSuggestedImageDonationWidth();
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v6, "loadDataImageFromImage:scaledSize:error:", a1, &v18, v5, v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v18;

      if (!v7)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[INImage(_CDSpotlightRecorderAdditions) cd_dataImage].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

      }
    }
  }
  else
  {
    v7 = a1;
  }
  return v7;
}

- (id)cd_encodedDataImage
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  objc_msgSend(a1, "cd_dataImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v12);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v12;
    if (!v2)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[INImage(_CDSpotlightRecorderAdditions) cd_encodedDataImage].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)cd_dataImage
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Error retrieving populated intent image: %@", a5, a6, a7, a8, 2u);
}

- (void)cd_encodedDataImage
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Error archiving intents image: %@", a5, a6, a7, a8, 2u);
}

@end
