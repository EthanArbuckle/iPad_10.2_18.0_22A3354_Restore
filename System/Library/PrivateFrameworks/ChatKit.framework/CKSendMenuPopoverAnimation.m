@implementation CKSendMenuPopoverAnimation

- (CKSendMenuPopoverAnimation)initWithAnimators:(id)a3
{
  id v4;
  CKSendMenuPopoverAnimation *v5;
  uint64_t v6;
  NSArray *animators;
  dispatch_group_t v8;
  OS_dispatch_group *group;
  id completion;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSendMenuPopoverAnimation;
  v5 = -[CKSendMenuPopoverAnimation init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    animators = v5->_animators;
    v5->_animators = (NSArray *)v6;

    v8 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v8;

    completion = v5->_completion;
    v5->_completion = &__block_literal_global_122;

  }
  return v5;
}

- (void)startAnimation
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *group;
  _QWORD v11[5];
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_animators;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        dispatch_group_enter((dispatch_group_t)self->_group);
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke;
        v12[3] = &unk_1E274C9E8;
        v12[4] = self;
        objc_msgSend(v9, "addCompletion:", v12);
        objc_msgSend(v9, "startAnimation");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  group = self->_group;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke_2;
  v11[3] = &unk_1E274A208;
  v11[4] = self;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], v11);
}

void __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
}

void __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke_2(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)animators
{
  return self->_animators;
}

- (void)setAnimators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_animators, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
