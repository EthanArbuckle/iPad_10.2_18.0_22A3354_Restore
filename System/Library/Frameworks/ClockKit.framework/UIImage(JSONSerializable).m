@implementation UIImage(JSONSerializable)

+ (id)imageWithJSONObjectRepresentation:()JSONSerializable bundle:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("file name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("file name"), v7);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("scale"), v8);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("renderingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("renderingMode"), v9);
  v10 = objc_msgSend((id)objc_opt_class(), "_renderingModeForNumber:", v9);
  objc_msgSend(v8, "floatValue");
  v12 = v11;
  objc_msgSend(v6, "bundlePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByAppendingPathComponent:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentsAtPath:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:scale:", v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithRenderingMode:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:()JSONSerializable
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("png"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("file name"));
  objc_msgSend(v4, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  UIImagePNGRepresentation(a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v11 = objc_msgSend(v10, "writeToFile:options:error:", v9, 1, &v18);
  v12 = v18;

  if ((v11 & 1) == 0)
  {
    CLKLoggingObjectForDomain(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[UIImage(JSONSerializable) JSONObjectRepresentationWritingResourcesToBundlePath:].cold.1((uint64_t)v12, (uint64_t)v9, v13);

  }
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[UIImage scale](a1, "scale");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("scale"));

  objc_msgSend((id)objc_opt_class(), "_numberForRenderingMode:", -[UIImage renderingMode](a1, "renderingMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("renderingMode"));

  return v5;
}

+ (uint64_t)_numberForRenderingMode:()JSONSerializable
{
  uint64_t v3;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = a3 == 1;
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
}

+ (uint64_t)_renderingModeForNumber:()JSONSerializable
{
  int v3;

  v3 = objc_msgSend(a3, "intValue");
  if (v3 == 2)
    return 2;
  else
    return v3 == 1;
}

- (void)JSONObjectRepresentationWritingResourcesToBundlePath:()JSONSerializable .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2114F4000, log, OS_LOG_TYPE_ERROR, "Error %@: failed to write CLKImageProvider onePieceImage to disk. Path: %@", (uint8_t *)&v3, 0x16u);
}

@end
