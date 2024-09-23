@implementation AVTAvatarDescriptor

- (id)dataRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA655948, CFSTR("version"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA655948, CFSTR("minVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend((id)objc_opt_class(), "classIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("class"));

  -[AVTAvatarDescriptor encodeInDictionaryRepresentation:](self, "encodeInDictionaryRepresentation:", v3);
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_dictionaryRepresentationFromDataRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = v7;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v6;
LABEL_13:

        goto LABEL_14;
      }
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0CB2D50];
        v21 = CFSTR("Recipe is invalid");
        v13 = (void *)MEMORY[0x1E0C99D80];
        v14 = &v21;
        v15 = &v20;
        v16 = 1;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB3388];
      v22[0] = *MEMORY[0x1E0CB2D50];
      v22[1] = v12;
      v23[0] = CFSTR("Data is not a JSON object");
      v23[1] = v7;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = (const __CFString **)v23;
      v15 = v22;
      v16 = 2;
LABEL_11:
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 3, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = CFSTR("There's no data to load");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 3, v8);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v9;
}

+ (BOOL)_canLoadDataRepresentationWithVersion:(unsigned __int16)a3 minimumCompatibleVersion:(unsigned __int16)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3 <= 6u)
  {
    if (a5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recipe is too old (%d < %d)"), a4, a3, 7);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v10 = 1;
LABEL_7:
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), v10, v8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
    return 0;
  }
  if (a4 >= 0xDu)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recipe is too new (%d > %d)"), a4, 12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v10 = 2;
      goto LABEL_7;
    }
    return 0;
  }
  return 1;
}

+ (BOOL)canLoadDataRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v9;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
    objc_msgSend(v4, "avt_objectForKey:ofClass:didFail:error:", CFSTR("minVersion"), objc_opt_class(), &v9, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avt_objectForKey:ofClass:didFail:error:", CFSTR("version"), objc_opt_class(), &v9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!v9)
      v7 = objc_msgSend(a1, "_canLoadDataRepresentationWithVersion:minimumCompatibleVersion:error:", (unsigned __int16)objc_msgSend(v6, "intValue"), (unsigned __int16)objc_msgSend(v5, "intValue"), 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_descriptorWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  __objc2_class **v13;
  char v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    objc_msgSend(v5, "avt_objectForKey:ofClass:didFail:error:", CFSTR("minVersion"), objc_opt_class(), &v14, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avt_objectForKey:ofClass:didFail:error:", CFSTR("version"), objc_opt_class(), &v14, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      || !objc_msgSend((id)objc_opt_class(), "_canLoadDataRepresentationWithVersion:minimumCompatibleVersion:error:", (unsigned __int16)objc_msgSend(v7, "intValue"), (unsigned __int16)objc_msgSend(v6, "intValue"), a4))
    {
      v10 = 0;
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v5, "avt_objectForKey:ofClass:didFail:error:", CFSTR("class"), objc_opt_class(), &v14, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v14)
      goto LABEL_5;
    v12 = objc_msgSend(v8, "intValue");
    if (v12 == 1)
    {
      v13 = off_1EA61CD40;
    }
    else
    {
      if (v12 != 2)
      {
LABEL_5:
        v10 = 0;
LABEL_15:

        goto LABEL_8;
      }
      v13 = off_1EA61CDB8;
    }
    v10 = (void *)objc_msgSend(objc_alloc(*v13), "initWithDictionaryRepresentation:error:", v5, a4);
    goto LABEL_15;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)descriptorWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "descriptorWithDataRepresentation:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)descriptorWithDataRepresentation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_dictionaryRepresentationFromDataRepresentation:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_descriptorWithDictionaryRepresentation:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dataRepresentationFromUnsecureDataRepresentation:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "descriptorWithDataRepresentation:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unsigned)classIdentifier
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[AVTAvatarDescriptor classIdentifier].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (void)encodeInDictionaryRepresentation:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  avt_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[AVTAvatarDescriptor encodeInDictionaryRepresentation:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (AVTAvatarDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  avt_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[AVTAvatarDescriptor initWithDictionaryRepresentation:error:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  avt_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[AVTAvatarDescriptor copyWithZone:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "encodeInteger:forKey:", 12, CFSTR("version"));
  objc_msgSend(v3, "encodeInteger:forKey:", 12, CFSTR("minVersion"));

}

- (AVTAvatarDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  AVTAvatarDescriptor *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minVersion"));

  if (v5 > 6)
  {
    if (v6 < 13)
    {
      v8 = self;
      goto LABEL_9;
    }
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTAvatarDescriptor initWithCoder:].cold.2();
  }
  else
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTAvatarDescriptor initWithCoder:].cold.1();
  }

  v8 = 0;
LABEL_9:

  return v8;
}

+ (void)classIdentifier
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Abstract method called: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)encodeInDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Abstract method called: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Abstract method called: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Abstract method called: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1DD1FA000, v0, v1, "Error: Recipe is too old (%u < %d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1DD1FA000, v0, v1, "Error: Recipe is too new (%u > %d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
