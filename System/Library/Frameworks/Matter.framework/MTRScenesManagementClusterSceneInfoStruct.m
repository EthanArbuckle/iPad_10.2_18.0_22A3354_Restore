@implementation MTRScenesManagementClusterSceneInfoStruct

- (MTRScenesManagementClusterSceneInfoStruct)init
{
  MTRScenesManagementClusterSceneInfoStruct *v2;
  MTRScenesManagementClusterSceneInfoStruct *v3;
  NSNumber *sceneCount;
  NSNumber *currentScene;
  NSNumber *currentGroup;
  NSNumber *sceneValid;
  NSNumber *remainingCapacity;
  NSNumber *fabricIndex;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRScenesManagementClusterSceneInfoStruct;
  v2 = -[MTRScenesManagementClusterSceneInfoStruct init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    sceneCount = v2->_sceneCount;
    v2->_sceneCount = (NSNumber *)&unk_250591B18;

    currentScene = v3->_currentScene;
    v3->_currentScene = (NSNumber *)&unk_250591B18;

    currentGroup = v3->_currentGroup;
    v3->_currentGroup = (NSNumber *)&unk_250591B18;

    sceneValid = v3->_sceneValid;
    v3->_sceneValid = (NSNumber *)&unk_250591B18;

    remainingCapacity = v3->_remainingCapacity;
    v3->_remainingCapacity = (NSNumber *)&unk_250591B18;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRScenesManagementClusterSceneInfoStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRScenesManagementClusterSceneInfoStruct);
  objc_msgSend_sceneCount(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneCount_(v4, v8, (uint64_t)v7);

  objc_msgSend_currentScene(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentScene_(v4, v12, (uint64_t)v11);

  objc_msgSend_currentGroup(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentGroup_(v4, v16, (uint64_t)v15);

  objc_msgSend_sceneValid(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSceneValid_(v4, v20, (uint64_t)v19);

  objc_msgSend_remainingCapacity(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemainingCapacity_(v4, v24, (uint64_t)v23);

  objc_msgSend_fabricIndex(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: sceneCount:%@; currentScene:%@; currentGroup:%@; sceneValid:%@; remainingCapacity:%@; fabricIndex:%@; >"),
    v5,
    self->_sceneCount,
    self->_currentScene,
    self->_currentGroup,
    self->_sceneValid,
    self->_remainingCapacity,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)sceneCount
{
  return self->_sceneCount;
}

- (void)setSceneCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)currentScene
{
  return self->_currentScene;
}

- (void)setCurrentScene:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)currentGroup
{
  return self->_currentGroup;
}

- (void)setCurrentGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)sceneValid
{
  return self->_sceneValid;
}

- (void)setSceneValid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)remainingCapacity
{
  return self->_remainingCapacity;
}

- (void)setRemainingCapacity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_remainingCapacity, 0);
  objc_storeStrong((id *)&self->_sceneValid, 0);
  objc_storeStrong((id *)&self->_currentGroup, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_sceneCount, 0);
}

@end
