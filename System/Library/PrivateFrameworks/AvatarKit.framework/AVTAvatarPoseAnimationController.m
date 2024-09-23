@implementation AVTAvatarPoseAnimationController

- (AVTAvatarPoseAnimationController)initWithAvatar:(id)a3 animationKeys:(id)a4
{
  id v6;
  id v7;
  AVTAvatarPoseAnimationController *v8;
  AVTAvatarPoseAnimationController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarPoseAnimationController;
  v8 = -[AVTAvatarPoseAnimationController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_avatar, v6);
    objc_storeStrong((id *)&v9->_animationKeys, a4);
  }

  return v9;
}

- (void)removeAnimationWithBlendOutDuration:(double)a3
{
  id WeakRetained;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  objc_msgSend(WeakRetained, "avatarNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_animationKeys;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "removeAnimationForKey:blendOutDuration:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), a3, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationKeys, 0);
  objc_destroyWeak((id *)&self->_avatar);
}

@end
