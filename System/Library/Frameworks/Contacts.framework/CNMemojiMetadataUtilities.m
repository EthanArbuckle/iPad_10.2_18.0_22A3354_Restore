@implementation CNMemojiMetadataUtilities

+ (id)os_log
{
  if (os_log_cn_once_token_2_2 != -1)
    dispatch_once(&os_log_cn_once_token_2_2, &__block_literal_global_83);
  return (id)os_log_cn_once_object_2_2;
}

void __35__CNMemojiMetadataUtilities_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNMemojiMetadataUtilities");
  v1 = (void *)os_log_cn_once_object_2_2;
  os_log_cn_once_object_2_2 = (uint64_t)v0;

}

+ (id)memojiMetadataDataForAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "memojiMetadataDataForAvatarRecord:poseConfiguration:backgroundColorDescription:cropTransform:", a3, a4, a5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memojiMetadataDataForAvatarRecordIdentifier:(id)a3 poseConfigurationData:(id)a4 backgroundColorDescription:(id)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:", a3, a4, a5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataForMemojiMetadata:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3)
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities dataForMemojiMetadata:].cold.1();

  }
  return v3;
}

+ (id)dataForMemojiMetadata:(id)a3 backgroundColorDescription:(id)a4 cropTransform:(CGAffineTransform *)a5
{
  id v7;
  id v8;
  CNMemojiMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  CNMemojiMetadata *v14;
  void *v15;
  _OWORD v17[3];

  v7 = a4;
  v8 = a3;
  v9 = [CNMemojiMetadata alloc];
  objc_msgSend(v8, "avatarRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "poseName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_OWORD *)&a5->c;
  v17[0] = *(_OWORD *)&a5->a;
  v17[1] = v13;
  v17[2] = *(_OWORD *)&a5->tx;
  v14 = -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](v9, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", v10, v11, v12, v7, v17);

  objc_msgSend((id)objc_opt_class(), "dataForMemojiMetadata:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)memojiMetadataDataForAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CNMemojiMetadata *v13;
  __int128 v14;
  NSObject *v15;
  void *v16;
  _BYTE v18[32];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    v13 = [CNMemojiMetadata alloc];
    v14 = *(_OWORD *)&a6->c;
    *(_OWORD *)v18 = *(_OWORD *)&a6->a;
    *(_OWORD *)&v18[16] = v14;
    v19 = *(_OWORD *)&a6->tx;
    v15 = -[CNMemojiMetadata initWithAvatarRecord:poseConfiguration:backgroundColorDescription:cropTransform:](v13, "initWithAvatarRecord:poseConfiguration:backgroundColorDescription:cropTransform:", v9, v10, v12, v18);
    objc_msgSend((id)objc_opt_class(), "dataForMemojiMetadata:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 138412802;
      *(_QWORD *)&v18[4] = v9;
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v10;
      *(_WORD *)&v18[22] = 2112;
      *(_QWORD *)&v18[24] = v12;
      _os_log_error_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_ERROR, "Error creating Memoji metadata for avatarRecord: %@, poseConfiguration: %@, backgroundColorDescription: %@ : received nil argument", v18, 0x20u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)memojiMetadataDataForAvatarRecordIdentifier:(id)a3 poseConfigurationData:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  CNMemojiMetadata *v14;
  __int128 v15;
  NSObject *v16;
  void *v17;
  _OWORD v19[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[CNMemojiMetadataUtilities avatarRecordForIdentifier:](CNMemojiMetadataUtilities, "avatarRecordForIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[CNMemojiMetadataUtilities poseConfigurationForData:withAvatarRecord:](CNMemojiMetadataUtilities, "poseConfigurationForData:withAvatarRecord:", v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = [CNMemojiMetadata alloc];
      v15 = *(_OWORD *)&a6->c;
      v19[0] = *(_OWORD *)&a6->a;
      v19[1] = v15;
      v19[2] = *(_OWORD *)&a6->tx;
      v16 = -[CNMemojiMetadata initWithAvatarRecord:poseConfiguration:backgroundColorDescription:cropTransform:](v14, "initWithAvatarRecord:poseConfiguration:backgroundColorDescription:cropTransform:", v12, v13, v11, v19);
      objc_msgSend((id)objc_opt_class(), "dataForMemojiMetadata:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[CNMemojiMetadataUtilities memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:].cold.2();
      v17 = 0;
    }

  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:].cold.1();
    v17 = 0;
  }

  return v17;
}

+ (id)memojiMetadataFromData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[CNMemojiMetadataUtilities memojiMetadataFromData:].cold.2();

    }
  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities memojiMetadataFromData:].cold.1();
    v4 = 0;
  }

  return v4;
}

+ (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4 pose:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("custom_capture")))
    {
      v12 = (void *)objc_msgSend(objc_alloc(getAVTStickerConfigurationClass()), "initWithName:pose:props:shaders:camera:options:", v9, v11, 0, 0, 0, 0);
    }
    else
    {
      getkAVTStickerPackPoses[0]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "stickerConfigurationForAvatarRecord:stickerName:stickerPack:", v8, v9, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        if ((softLinkAVTUIShowPrereleaseStickerPack_once[0]() & 1) != 0)
        {
          getkAVTStickerPackPosesPrerelease[0]();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "stickerConfigurationForAvatarRecord:stickerName:stickerPack:", v8, v9, v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            goto LABEL_18;
          +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:stickerName:pose:].cold.1();
        }
        else
        {
          +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:stickerName:pose:].cold.1();
          v12 = 0;
        }

      }
    }
  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_18F8BD000, v13, OS_LOG_TYPE_ERROR, "Error creating pose configuration for avatarRecord: %@, poseName: %@, pose: %@ : received nil argument", (uint8_t *)&v18, 0x20u);
    }

    v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4 stickerPack:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  Class AVTStickerConfigurationClass;
  Class v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v7, "isEditable");
  AVTStickerConfigurationClass = getAVTStickerConfigurationClass();
  v12 = AVTStickerConfigurationClass;
  if (v10)
  {
    -[objc_class stickerConfigurationForMemojiInStickerPack:stickerName:](AVTStickerConfigurationClass, "stickerConfigurationForMemojiInStickerPack:stickerName:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    -[objc_class stickerConfigurationForAnimojiNamed:inStickerPack:stickerName:](v12, "stickerConfigurationForAnimojiNamed:inStickerPack:stickerName:", v14, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v9;
    v9 = (id)v14;
  }

  return v13;
}

+ (id)dataForPoseConfiguration:(id)a3
{
  id v3;
  CNSerializedPoseConfiguration *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  if (v3)
  {
    v4 = -[CNSerializedPoseConfiguration initWithPoseConfiguration:]([CNSerializedPoseConfiguration alloc], "initWithPoseConfiguration:", v3);
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (!v5)
    {
      +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CNMemojiMetadataUtilities dataForPoseConfiguration:].cold.2();

    }
  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v4 = (CNSerializedPoseConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities dataForPoseConfiguration:].cold.1();
    v5 = 0;
  }

  return v5;
}

+ (id)poseConfigurationForData:(id)a3 withAvatarRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
    {
      objc_msgSend(v8, "poseName");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pose");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:stickerName:pose:](CNMemojiMetadataUtilities, "stickerConfigurationForAvatarRecord:stickerName:pose:", v7, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CNMemojiMetadataUtilities poseConfigurationForData:withAvatarRecord:].cold.1();
      v12 = 0;
    }

  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities poseConfigurationForData:withAvatarRecord:].cold.2();
    v12 = 0;
  }

  return v12;
}

+ (id)avatarRecordForIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)getAVTPAvatarStoreClass[0]());
    objc_msgSend((Class)getAVTAvatarFetchRequestClass[0](), "requestForAvatarWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    -[NSObject avatarsForFetchRequest:error:](v4, "avatarsForFetchRequest:error:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v6)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[CNMemojiMetadataUtilities avatarRecordForIdentifier:].cold.2();

      v8 = 0;
    }

  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities avatarRecordForIdentifier:].cold.1();
    v8 = 0;
  }

  return v8;
}

+ (id)physicsStatesDictionaryRepresentationForPose:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "physicsStates");
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setValue:forKey:", v12, v10);

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
  }
  else
  {
    +[CNMemojiMetadataUtilities os_log](CNMemojiMetadataUtilities, "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:].cold.1();
  }

  return v4;
}

+ (void)dataForMemojiMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error archiving Memoji metadata: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error creating Memoji metadata: could not find avatar record for identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)memojiMetadataDataForAvatarRecordIdentifier:poseConfigurationData:backgroundColorDescription:cropTransform:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error creating Memoji metadata: pose configuration is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)memojiMetadataFromData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error creating Memoji metadata from data: data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)memojiMetadataFromData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error unarchiving Memoji metadata: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)stickerConfigurationForAvatarRecord:stickerName:pose:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Error finding sticker configuration for poseName: %@, avatarRecord: %@ in pack kAVTStickerPackPoses");
  OUTLINED_FUNCTION_2_0();
}

+ (void)dataForPoseConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error creating data from pose configuration: pose configuration is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)dataForPoseConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error archiving pose configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)poseConfigurationForData:withAvatarRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error unarchiving pose configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)poseConfigurationForData:withAvatarRecord:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Error retrieving pose configuration from data: %@, avatarRecord: %@ : received nil argument");
  OUTLINED_FUNCTION_2_0();
}

+ (void)avatarRecordForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Avatar record could not be fetched: record identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)avatarRecordForIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Avatar record could not be fetched: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)physicsStatesDictionaryRepresentationForPose:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error retrieving physics states dictionary from pose: pose is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
