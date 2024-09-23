@implementation _BMDKEventCodec_BMPBDKEvent

- (id)encodeAsProto:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v18;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v3, "dkEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  if (v8)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_BMDKEventCodec_BMPBDKEvent encodeAsProto:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "setDkEvent:", v7);
    v16 = v4;
  }

  return v16;
}

- (id)decodeWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BMDKEvent *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  id v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:].cold.4(v5, v22, v23, v24, v25, v26, v27, v28);
      v21 = 0;
      goto LABEL_25;
    }
    v5 = v4;
    if ((-[NSObject hasDkEvent](v5, "hasDkEvent") & 1) == 0)
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:].cold.3(v13, v29, v30, v31, v32, v33, v34, v35);
      v21 = 0;
      goto LABEL_24;
    }
    v6 = (void *)MEMORY[0x1E0C99E60];
    v48 = 0;
    v49 = &v48;
    v50 = 0x2050000000;
    v7 = (void *)get_DKEventClass_softClass_3;
    v51 = get_DKEventClass_softClass_3;
    if (!get_DKEventClass_softClass_3)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __get_DKEventClass_block_invoke_3;
      v47[3] = &unk_1E2647EA8;
      v47[4] = &v48;
      __get_DKEventClass_block_invoke_3((uint64_t)v47);
      v7 = (void *)v49[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v48, 8);
    objc_msgSend(v6, "setWithObject:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3710]);
    -[NSObject dkEvent](v5, "dkEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v12 = (void *)objc_msgSend(v10, "initForReadingFromData:error:", v11, &v46);
    v13 = v46;

    if (v13)
    {
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:].cold.2((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      objc_msgSend(v12, "setRequiresSecureCoding:", 1);
      objc_msgSend(v12, "setDecodingFailurePolicy:", 1);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "setDk_shouldSkipDecodingMetadata:", -[BMDKEventCodec decodeMetadata](self, "decodeMetadata") ^ 1);
      v36 = *MEMORY[0x1E0CB2CD0];
      v45 = 0;
      objc_msgSend(v12, "decodeTopLevelObjectOfClasses:forKey:error:", v9, v36, &v45);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = v45;
      if (!v13)
      {
        v21 = -[BMDKEvent initWithDKEvent:]([BMDKEvent alloc], "initWithDKEvent:", v14);
        goto LABEL_23;
      }
      __biome_log_for_category();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:].cold.1((uint64_t)v13, v37, v38, v39, v40, v41, v42, v43);

    }
    v21 = 0;
LABEL_23:

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (id)decodeWithProtoData:(id)a3
{
  id v4;
  BMPBDKEvent *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBDKEvent initWithData:]([BMPBDKEvent alloc], "initWithData:", v4);

    -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:](self, "decodeWithProto:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)encodeAsProto:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMDKEvent: Error while archiving Duet Knowledge Event for proto: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)decodeWithProto:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMDKEvent: Error while unarchiving Duet Knowledge Event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)decodeWithProto:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "BMDKEvent: Error while initializing unarchiver: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)decodeWithProto:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMDKEvent: tried to initialize with a proto missing required data.", a5, a6, a7, a8, 0);
}

- (void)decodeWithProto:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMDKEvent: tried to initialize with a non-BMDKEvent proto", a5, a6, a7, a8, 0);
}

@end
