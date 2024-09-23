@implementation CNMemojiMetadata

+ (id)log
{
  if (log_cn_once_token_2_0 != -1)
    dispatch_once(&log_cn_once_token_2_0, &__block_literal_global_78);
  return (id)log_cn_once_object_2_0;
}

void __23__CNMemojiMetadata_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNMemojiMetadata");
  v1 = (void *)log_cn_once_object_2_0;
  log_cn_once_object_2_0 = (uint64_t)v0;

}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseName:(id)a4 pose:(id)a5 backgroundColorDescription:(id)a6
{
  __int128 v6;
  _OWORD v8[3];

  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](self, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", a3, a4, a5, a6, v8);
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseName:(id)a4 pose:(id)a5 backgroundColorDescription:(id)a6 cropTransform:(CGAffineTransform *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CNMemojiMetadata *v17;
  CNMemojiMetadata *v18;
  uint64_t v19;
  NSString *poseName;
  uint64_t v21;
  NSString *backgroundColorDescription;
  CNMemojiBackgroundParameters *v23;
  CNMemojiBackgroundParameters *backgroundParameters;
  __int128 v25;
  __int128 v26;
  CNMemojiMetadata *v27;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CNMemojiMetadata;
  v17 = -[CNMemojiMetadata init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_avatarRecord, a3);
    v19 = objc_msgSend(v14, "copy");
    poseName = v18->_poseName;
    v18->_poseName = (NSString *)v19;

    objc_storeStrong((id *)&v18->_pose, a5);
    if (v16)
    {
      v21 = objc_msgSend(v16, "copy");
    }
    else
    {
      +[CNMemojiBackgroundParameters defaultBackgroundColorDescription](CNMemojiBackgroundParameters, "defaultBackgroundColorDescription");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    backgroundColorDescription = v18->_backgroundColorDescription;
    v18->_backgroundColorDescription = (NSString *)v21;

    v23 = -[CNMemojiBackgroundParameters initWithColorDescription:]([CNMemojiBackgroundParameters alloc], "initWithColorDescription:", v18->_backgroundColorDescription);
    backgroundParameters = v18->_backgroundParameters;
    v18->_backgroundParameters = v23;

    v25 = *(_OWORD *)&a7->a;
    v26 = *(_OWORD *)&a7->tx;
    *(_OWORD *)&v18->_cropTransform.c = *(_OWORD *)&a7->c;
    *(_OWORD *)&v18->_cropTransform.tx = v26;
    *(_OWORD *)&v18->_cropTransform.a = v25;
    v27 = v18;
  }

  return v18;
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  CNMemojiMetadata *v14;
  _OWORD v16[3];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "physicalizedPose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v13;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v14 = -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](self, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", v10, v11, v12, v8, v16);

  return v14;
}

- (CNMemojiMetadata)initWithAvatarRecord:(id)a3 poseConfiguration:(id)a4 backgroundColorDescription:(id)a5 cropTransform:(CGAffineTransform *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  CNMemojiMetadata *v16;
  _OWORD v18[3];

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "physicalizedPose");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_OWORD *)&a6->c;
  v18[0] = *(_OWORD *)&a6->a;
  v18[1] = v15;
  v18[2] = *(_OWORD *)&a6->tx;
  v16 = -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](self, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", v12, v13, v14, v10, v18);

  return v16;
}

- (CNMemojiMetadata)initWithBackgroundColorDescription:(id)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](self, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", 0, 0, 0, a3, v5);
}

- (AVTStickerConfiguration)poseConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMemojiMetadata poseName](self, "poseName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMemojiMetadata pose](self, "pose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNMemojiMetadataUtilities stickerConfigurationForAvatarRecord:stickerName:pose:](CNMemojiMetadataUtilities, "stickerConfigurationForAvatarRecord:stickerName:pose:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "loadIfNeeded");
  return (AVTStickerConfiguration *)v6;
}

- (AVTAvatar)avatar
{
  void *v3;
  Class v4;
  void *v5;
  void *v6;

  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (Class)getAVTAvatarRecordRenderingClass[0]();
    -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class avatarForRecord:](v4, "avatarForRecord:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (AVTAvatar *)v6;
}

- (AVTAvatarDescriptor)avatarDescriptor
{
  void *v3;
  Class v4;
  void *v5;
  void *v6;

  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (Class)getAVTAvatarRecordRenderingClass[0]();
    -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class avatarDescriptorForRecord:](v4, "avatarDescriptorForRecord:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (AVTAvatarDescriptor *)v6;
}

- (NSString)avatarRecordIdentifier
{
  void *v2;
  void *v3;

  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)avatarRecordData
{
  Class v3;
  void *v4;
  void *v5;

  v3 = (Class)getAVTAvatarRecordSerializerClass[0]();
  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class dataFromAvatarRecord:](v3, "dataFromAvatarRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (BOOL)avatarRecordIsEditable
{
  void *v2;
  char v3;

  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditable");

  return v3;
}

- (NSData)poseConfigurationData
{
  void *v2;
  void *v3;

  -[CNMemojiMetadata poseConfiguration](self, "poseConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNMemojiMetadataUtilities dataForPoseConfiguration:](CNMemojiMetadataUtilities, "dataForPoseConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)poseHasBody
{
  void *v3;
  void *v4;
  void *v5;

  -[CNMemojiMetadata poseConfiguration](self, "poseConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadIfNeeded");

  -[CNMemojiMetadata poseConfiguration](self, "poseConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyPose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMemojiMetadata)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  CNMemojiMetadata *v45;
  void *v47;
  CNMemojiMetadata *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[7];

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  if (v5 >= 3)
  {
    v43 = v5;
    objc_msgSend((id)objc_opt_class(), "log");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[CNMemojiMetadata initWithCoder:].cold.1(v43, v44);
    v45 = 0;
  }
  else
  {
    v48 = self;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColorDescription"));
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avatarRecordData"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((Class)getAVTAvatarRecordSerializerClass[0](), "avatarRecordFromData:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poseName"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("poseRepresentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("posePhysicsStatesRepresentation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc((Class)getAVTAvatarPhysicalizedPoseClass_0[0]()), "initWithPoseRepresentation:physicsStatesRepresentation:", v12, v19);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v21, CFSTR("cropTransformValues"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v47 = v19;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = v30;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
      v32 = v12;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleValue");
      v35 = v34;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 4);
      v36 = v20;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;
      objc_msgSend(v22, "objectAtIndexedSubscript:", 5);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      v42 = v41;

      v20 = v36;
      v12 = v32;

      v19 = v47;
    }
    else
    {
      v25 = *MEMORY[0x1E0C9BAA8];
      v28 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 8);
      v31 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v35 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 24);
      v39 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v42 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 40);
    }
    v53[0] = v25;
    v53[1] = v28;
    v53[2] = v31;
    v53[3] = v35;
    v53[4] = v39;
    v53[5] = v42;
    v44 = v52;
    self = -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](v48, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", v50, v49, v20, v52, v53);

    v45 = self;
  }

  return v45;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 2, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundColorDescription, CFSTR("backgroundColorDescription"));
  if (self->_avatarRecord)
  {
    objc_msgSend((Class)getAVTAvatarRecordSerializerClass[0](), "dataFromAvatarRecord:", self->_avatarRecord);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("avatarRecordData"));

  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_poseName, CFSTR("poseName"));
  -[AVTAvatarPhysicalizedPose pose](self->_pose, "pose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("poseRepresentation"));

  +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", self->_pose);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("posePhysicsStatesRepresentation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cropTransform.a);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cropTransform.b);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cropTransform.c);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cropTransform.d);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cropTransform.tx);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cropTransform.ty);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("cropTransformValues"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNMemojiMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNMemojiMetadata *v9;
  uint64_t v11;

  v4 = [CNMemojiMetadata alloc];
  -[CNMemojiMetadata avatarRecord](self, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMemojiMetadata poseName](self, "poseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMemojiMetadata pose](self, "pose");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMemojiMetadata backgroundColorDescription](self, "backgroundColorDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMemojiMetadata cropTransform](self, "cropTransform");
  v9 = -[CNMemojiMetadata initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:](v4, "initWithAvatarRecord:poseName:pose:backgroundColorDescription:cropTransform:", v5, v6, v7, v8, &v11);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CNMemojiMetadata *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;

  v4 = (CNMemojiMetadata *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v5 = (unint64_t)-[CNMemojiMetadata backgroundColorDescription](self, "backgroundColorDescription");
    v6 = (unint64_t)-[CNMemojiMetadata backgroundColorDescription](v4, "backgroundColorDescription");
    if (v5 | v6)
    {
      if (!objc_msgSend((id)v5, "isEqual:", v6))
        goto LABEL_11;
    }
    v7 = (unint64_t)-[CNMemojiMetadata avatarRecord](self, "avatarRecord");
    v8 = (unint64_t)-[CNMemojiMetadata avatarRecord](v4, "avatarRecord");
    if (v7 | v8)
    {
      if (!objc_msgSend((id)v7, "isEqual:", v8))
        goto LABEL_11;
    }
    v9 = (unint64_t)-[CNMemojiMetadata poseName](self, "poseName");
    v10 = (unint64_t)-[CNMemojiMetadata poseName](v4, "poseName");
    if (v9 | v10)
    {
      if (!objc_msgSend((id)v9, "isEqual:", v10))
        goto LABEL_11;
    }
    -[CNMemojiMetadata pose](self, "pose");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pose");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMemojiMetadata pose](v4, "pose");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pose");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "isEqualToDictionary:", v16);

    if (v17)
    {
      -[CNMemojiMetadata pose](self, "pose");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMemojiMetadata pose](v4, "pose");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "isEqualToDictionary:", v21);

    }
    else
    {
LABEL_11:
      v22 = 0;
    }
  }

  return v22;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (NSString)poseName
{
  return self->_poseName;
}

- (AVTAvatarPhysicalizedPose)pose
{
  return self->_pose;
}

- (NSString)backgroundColorDescription
{
  return self->_backgroundColorDescription;
}

- (CNMemojiBackgroundParameters)backgroundParameters
{
  return self->_backgroundParameters;
}

- (CGAffineTransform)cropTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundParameters, 0);
  objc_storeStrong((id *)&self->_backgroundColorDescription, 0);
  objc_storeStrong((id *)&self->_pose, 0);
  objc_storeStrong((id *)&self->_poseName, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Memoji metadata has a higher version number than we know how to handle: %ld", (uint8_t *)&v2, 0xCu);
}

@end
