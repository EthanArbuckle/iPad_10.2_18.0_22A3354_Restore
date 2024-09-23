@implementation AVTAvatarPhysicalizedPose

- (AVTAvatarPhysicalizedPose)initWithSceneAtURL:(id)a3
{
  id v4;
  AVTAvatarPhysicalizedPose *v5;
  void *v6;
  id v7;
  NSObject *v8;
  AVTAvatarPose *v9;
  AVTAvatarPose *pose;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTAvatarPhysicalizedPose;
  v5 = -[AVTAvatarPhysicalizedPose init](&v13, sel_init);
  if (v5)
  {
    v12 = 0;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CD5A10], "avt_newSceneWithURL:options:error:", v4, 0, &v12);
    v7 = v12;
    objc_msgSend(v6, "avt_fixQuirksOfNewUSDSchemaWithOptions:handler:", 0, 0);
    if (v7)
    {
      avt_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AVTAnimoji _load].cold.2(v4, v7, v8);

    }
    v9 = -[AVTAvatarPose initWithScene:]([AVTAvatarPose alloc], "initWithScene:", v6);
    pose = v5->_pose;
    v5->_pose = v9;

  }
  return v5;
}

- (AVTAvatarPhysicalizedPose)initWithPose:(id)a3 physicsStates:(id)a4
{
  id v7;
  id v8;
  AVTAvatarPhysicalizedPose *v9;
  AVTAvatarPhysicalizedPose *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarPhysicalizedPose;
  v9 = -[AVTAvatarPhysicalizedPose init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pose, a3);
    objc_storeStrong((id *)&v10->_physicsStates, a4);
  }

  return v10;
}

- (AVTAvatarPhysicalizedPose)initWithPoseRepresentation:(id)a3 physicsStatesRepresentation:(id)a4
{
  id v6;
  id v7;
  AVTAvatarPhysicalizedPose *v8;
  AVTAvatarPose *v9;
  AVTAvatarPose *pose;
  void *v11;
  NSDictionary *v12;
  NSDictionary *physicsStates;
  NSDictionary *v14;
  _QWORD v16[4];
  NSDictionary *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarPhysicalizedPose;
  v8 = -[AVTAvatarPhysicalizedPose init](&v18, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = -[AVTAvatarPose initWithDictionaryRepresentation:]([AVTAvatarPose alloc], "initWithDictionaryRepresentation:", v6);
      pose = v8->_pose;
      v8->_pose = v9;

    }
    if (v7)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __84__AVTAvatarPhysicalizedPose_initWithPoseRepresentation_physicsStatesRepresentation___block_invoke;
      v16[3] = &unk_1EA61E580;
      v12 = v11;
      v17 = v12;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v16);
      physicsStates = v8->_physicsStates;
      v8->_physicsStates = v12;
      v14 = v12;

    }
  }

  return v8;
}

void __84__AVTAvatarPhysicalizedPose_initWithPoseRepresentation_physicsStatesRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AVTAvatarPhysicsState *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[AVTAvatarPhysicsState initWithDictionaryRepresentation:]([AVTAvatarPhysicsState alloc], "initWithDictionaryRepresentation:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

- (void)applyToAvatar:(id)a3
{
  -[AVTAvatarPhysicalizedPose applyWithTransitionToAvatar:duration:completionHandler:](self, "applyWithTransitionToAvatar:duration:completionHandler:", a3, 0, 0.0);
}

- (void)applyWithTransitionToAvatar:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  AVTAvatarPose *pose;
  id v9;
  void *v10;
  NSDictionary *physicsStates;
  void *v12;
  uint64_t v13;
  void (**v14)(void);

  v14 = (void (**)(void))a5;
  pose = self->_pose;
  v9 = a3;
  v10 = v9;
  if (a4 <= 0.0)
  {
    objc_msgSend(v9, "setPose:", pose);
    physicsStates = self->_physicsStates;
    objc_msgSend(v10, "stickerPhysicsStateIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](physicsStates, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "resetToPhysicsState:assumeRestStateIfNil:", v13, 1);
    if (v14)
      v14[2]();
    v10 = (void *)v13;
  }
  else
  {
    objc_msgSend(v9, "transitionFromPose:toPose:duration:delay:completionHandler:", 0, pose, v14, a4, 0.0);
  }

}

- (AVTAvatarPose)pose
{
  return self->_pose;
}

- (NSDictionary)physicsStates
{
  return self->_physicsStates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicsStates, 0);
  objc_storeStrong((id *)&self->_pose, 0);
}

@end
