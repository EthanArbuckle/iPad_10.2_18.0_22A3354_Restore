@implementation GKConstraintUpdateController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GKConstraintUpdateController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_controller;
}

void __48__GKConstraintUpdateController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v1;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKConstraintUpdateController;
  -[GKConstraintUpdateController dealloc](&v4, sel_dealloc);
}

- (void)updateConstraint:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  if (a3)
  {
    v3 = a3;
    objc_getAssociatedObject(v3, sel__gkConstraintInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/NSLayoutConstraint+GKAdditions.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (leadingInfo != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKConstraintUpdateController updateConstraint:]", objc_msgSend(v8, "UTF8String"), 546);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
      v4 = 0;
    }
    objc_msgSend(v4, "leading");
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0D25B28];
    objc_msgSend(v16, "fontTextStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == 0.0)
      objc_msgSend(v12, "standardLeadingForFontTextStyle:", v13);
    else
      objc_msgSend(v12, "scaledValueFromHISpecLeading:forFontTextStyle:", v13, v11);
    v15 = v14;

    objc_msgSend(v3, "setConstant:", v15);
  }
}

- (void)_updateConstraints
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSPointerArray compact](self->_constraintsToUpdate, "compact");
  if (-[NSPointerArray count](self->_constraintsToUpdate, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_constraintsToUpdate;
    v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[GKConstraintUpdateController updateConstraint:](self, "updateConstraint:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

  }
}

- (void)registerConstraint:(id)a3 leading:(double)a4 forFontTextStyle:(id)a5
{
  id v8;
  GKConstraintLeadingInfo *v9;
  NSPointerArray *constraintsToUpdate;
  NSPointerArray *v11;
  NSPointerArray *v12;
  void *v13;
  id object;

  object = a3;
  v8 = a5;
  v9 = objc_alloc_init(GKConstraintLeadingInfo);
  -[GKConstraintLeadingInfo setLeading:](v9, "setLeading:", a4);
  -[GKConstraintLeadingInfo setFontTextStyle:](v9, "setFontTextStyle:", v8);

  objc_setAssociatedObject(object, sel__gkConstraintInfo, v9, (void *)1);
  constraintsToUpdate = self->_constraintsToUpdate;
  if (!constraintsToUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "pointerArrayWithOptions:", 5);
    v11 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_constraintsToUpdate;
    self->_constraintsToUpdate = v11;

    constraintsToUpdate = self->_constraintsToUpdate;
  }
  if (!-[NSPointerArray count](constraintsToUpdate, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__updateConstraints, *MEMORY[0x1E0DC48E8], 0);

  }
  -[GKConstraintUpdateController updateConstraint:](self, "updateConstraint:", object);
  -[NSPointerArray addPointer:](self->_constraintsToUpdate, "addPointer:", object);

}

- (NSPointerArray)constraintsToUpdate
{
  return self->_constraintsToUpdate;
}

- (void)setConstraintsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsToUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsToUpdate, 0);
}

@end
