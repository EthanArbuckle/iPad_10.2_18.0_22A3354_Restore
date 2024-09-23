@implementation AVTStickerPoseAdjustment

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTPresetCategoryToString(self->_presetCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | %@ %@ → %@>"), v5, self, v6, self->_presetIdentifier, self->_pose);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)poseByApplyingToPose:(id)a3 forAvatar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v7, "presetForCategory:", self->_presetCategory);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", self->_presetIdentifier);

  if (!v10)
  {

LABEL_5:
    v11 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v6, "poseByMergingPose:", self->_pose);
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

- (int64_t)presetCategory
{
  return self->_presetCategory;
}

- (void)setPresetCategory:(int64_t)a3
{
  self->_presetCategory = a3;
}

- (NSString)presetIdentifier
{
  return self->_presetIdentifier;
}

- (void)setPresetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presetIdentifier, a3);
}

- (AVTAvatarPose)pose
{
  return self->_pose;
}

- (void)setPose:(id)a3
{
  objc_storeStrong((id *)&self->_pose, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pose, 0);
  objc_storeStrong((id *)&self->_presetIdentifier, 0);
}

@end
