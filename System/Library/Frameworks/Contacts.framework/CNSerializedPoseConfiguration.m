@implementation CNSerializedPoseConfiguration

+ (id)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_15);
  return (id)log_cn_once_object_1;
}

void __36__CNSerializedPoseConfiguration_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNSerializedPoseConfiguration");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

- (CNSerializedPoseConfiguration)initWithPoseName:(id)a3 pose:(id)a4
{
  id v6;
  id v7;
  CNSerializedPoseConfiguration *v8;
  uint64_t v9;
  NSString *poseName;
  CNSerializedPoseConfiguration *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSerializedPoseConfiguration;
  v8 = -[CNSerializedPoseConfiguration init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    poseName = v8->_poseName;
    v8->_poseName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_pose, a4);
    v11 = v8;
  }

  return v8;
}

- (CNSerializedPoseConfiguration)initWithPoseConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNSerializedPoseConfiguration *v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "physicalizedPose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNSerializedPoseConfiguration initWithPoseName:pose:](self, "initWithPoseName:pose:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CNSerializedPoseConfiguration *v4;
  NSString *poseName;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (CNSerializedPoseConfiguration *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    poseName = self->_poseName;
    if ((unint64_t)poseName | (unint64_t)v4->_poseName)
    {
      if (!-[NSString isEqual:](poseName, "isEqual:"))
        goto LABEL_7;
    }
    -[AVTAvatarPhysicalizedPose pose](self->_pose, "pose");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarPhysicalizedPose pose](v4->_pose, "pose");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToDictionary:", v9);

    if (v10)
    {
      +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", self->_pose);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", v4->_pose);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToDictionary:", v12);

    }
    else
    {
LABEL_7:
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_poseName);
  v4 = (void *)MEMORY[0x1E0D13A78];
  -[AVTAvatarPhysicalizedPose pose](self->_pose, "pose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "dictionaryHash:", v6) - v3 + 32 * v3;

  v8 = (void *)MEMORY[0x1E0D13A78];
  +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", self->_pose);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "dictionaryHash:", v9) - v7 + 32 * v7 + 506447;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNSerializedPoseConfiguration *v4;
  void *v5;
  void *v6;
  CNSerializedPoseConfiguration *v7;

  v4 = [CNSerializedPoseConfiguration alloc];
  -[CNSerializedPoseConfiguration poseName](self, "poseName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSerializedPoseConfiguration pose](self, "pose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNSerializedPoseConfiguration initWithPoseName:pose:](v4, "initWithPoseName:pose:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSerializedPoseConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CNSerializedPoseConfiguration *v19;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("poseName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("poseRepresentation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("posePhysicsStatesRepresentation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc((Class)getAVTAvatarPhysicalizedPoseClass[0]()), "initWithPoseRepresentation:physicsStatesRepresentation:", v10, v17);
  v19 = -[CNSerializedPoseConfiguration initWithPoseName:pose:](self, "initWithPoseName:pose:", v21, v18);

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *poseName;
  id v5;
  void *v6;
  void *v7;
  id v8;

  poseName = self->_poseName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", poseName, CFSTR("poseName"));
  -[AVTAvatarPhysicalizedPose pose](self->_pose, "pose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("poseRepresentation"));

  +[CNMemojiMetadataUtilities physicsStatesDictionaryRepresentationForPose:](CNMemojiMetadataUtilities, "physicsStatesDictionaryRepresentationForPose:", self->_pose);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("posePhysicsStatesRepresentation"));

}

- (NSString)poseName
{
  return self->_poseName;
}

- (AVTAvatarPhysicalizedPose)pose
{
  return self->_pose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pose, 0);
  objc_storeStrong((id *)&self->_poseName, 0);
}

@end
