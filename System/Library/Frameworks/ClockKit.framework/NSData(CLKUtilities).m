@implementation NSData(CLKUtilities)

+ (id)dataWithJSONObjectRepresentation:()CLKUtilities bundle:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("must be a dictionary. Invalid value: %@"), v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("file name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("file name"), v8);
  objc_msgSend(v7, "bundlePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dataWithContentsOfFile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:()CLKUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("sui"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("file name"));
  objc_msgSend(v4, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  LOBYTE(v4) = objc_msgSend(a1, "writeToFile:options:error:", v9, 1, &v13);
  v10 = v13;
  if ((v4 & 1) == 0)
  {
    CLKLoggingObjectForDomain(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NSData(CLKUtilities) JSONObjectRepresentationWritingResourcesToBundlePath:].cold.1((uint64_t)v10, (uint64_t)v9, v11);

  }
  return v5;
}

- (id)clk_hexEncodedString
{
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v4 + v5++));
    while (v5 < objc_msgSend(v3, "length"));
  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

- (void)JSONObjectRepresentationWritingResourcesToBundlePath:()CLKUtilities .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_2114F4000, log, OS_LOG_TYPE_ERROR, "Error %@: failed to write SwiftUI data to disk. Path: %@", (uint8_t *)&v3, 0x16u);
}

@end
