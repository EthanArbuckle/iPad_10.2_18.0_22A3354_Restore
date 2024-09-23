@implementation DESNumericMetadataEncoder

- (id)encodeString:(id)a3 toLength:(unint64_t)a4
{
  NSObject *v6;
  uint8_t v8[16];

  +[DESLogging coreChannel](DESLogging, "coreChannel", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B96E5000, v6, OS_LOG_TYPE_INFO, "Numeric metadata encoder does not support string.", v8, 2u);
  }

  -[DESNumericMetadataEncoder zeroWithLength:](self, "zeroWithLength:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)encodeNumber:(id)a3 toLength:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DESNumericMetadataEncoder encodeNumberVector:toLength:](self, "encodeNumberVector:toLength:", v8, a4, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)encodeStringVector:(id)a3 toLength:(unint64_t)a4
{
  NSObject *v6;
  uint8_t v8[16];

  +[DESLogging coreChannel](DESLogging, "coreChannel", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B96E5000, v6, OS_LOG_TYPE_INFO, "Numeric metadata encoder does not support string vector.", v8, 2u);
  }

  -[DESNumericMetadataEncoder zeroWithLength:](self, "zeroWithLength:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)encodeNumberVector:(id)a3 toLength:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  int v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") <= a4)
    v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4 * v7);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v10, "floatValue");
      v14 = v11;
      objc_msgSend(v8, "appendBytes:length:", &v14, 4);

    }
  }
  if (objc_msgSend(v6, "count") < a4)
  {
    -[DESNumericMetadataEncoder zeroWithLength:](self, "zeroWithLength:", a4 - objc_msgSend(v6, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendData:", v12);

  }
  return v8;
}

- (id)zeroWithLength:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * a3);
}

@end
