@implementation BSCanonicalOrientationMapResolver

- (BOOL)isEqual:(id)a3
{
  BSCanonicalOrientationMapResolver *v4;
  BSCanonicalOrientationMapResolver *v5;
  BSCanonicalOrientationMapResolver *v6;
  char v7;

  v4 = (BSCanonicalOrientationMapResolver *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (v5->_targetOrientation == self->_targetOrientation && v5->_currentOrientation == self->_currentOrientation)
        v7 = -[NSArray isEqualToArray:](v5->_fallbackOrientations, "isEqualToArray:", self->_fallbackOrientations);
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  _QWORD v16[5];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_targetOrientation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentOrientation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", self->_fallbackOrientations);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__BSCanonicalOrientationMapResolver_interfaceOrientationForSupportedOrientations_preferredOrientation___block_invoke;
  v16[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v16[4] = a3;
  objc_msgSend(v11, "bs_firstObjectPassingTest:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");
  if ((unint64_t)(v13 - 1) >= 4)
    v14 = 0;
  else
    v14 = v13;

  return v14;
}

BOOL __103__BSCanonicalOrientationMapResolver_interfaceOrientationForSupportedOrientations_preferredOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "integerValue");
  v5 = (unint64_t)(v4 - 1) <= 3 && (*(_QWORD *)(a1 + 32) & (1 << v4)) != 0;

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_targetOrientation, CFSTR("targetOrientation"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_currentOrientation, CFSTR("currentOrientation"));
  objc_msgSend(v4, "encodeCollection:forKey:", self->_fallbackOrientations, CFSTR("fallbackOrientations"));

}

- (BSCanonicalOrientationMapResolver)initWithBSXPCCoder:(id)a3
{
  id v4;
  BSCanonicalOrientationMapResolver *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *fallbackOrientations;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BSCanonicalOrientationMapResolver;
  v5 = -[BSCanonicalOrientationMapResolver init](&v10, sel_init);
  if (v5)
  {
    v5->_targetOrientation = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("targetOrientation"));
    v5->_currentOrientation = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("currentOrientation"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("fallbackOrientations"));
    v7 = objc_claimAutoreleasedReturnValue();
    fallbackOrientations = v5->_fallbackOrientations;
    v5->_fallbackOrientations = (NSArray *)v7;

  }
  return v5;
}

- (BSCanonicalOrientationMapResolver)initWithTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4 fallbackOrientations:(id)a5
{
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BSCanonicalOrientationMapResolver *v15;
  BSCanonicalOrientationMapResolver *v16;
  uint64_t v17;
  NSArray *fallbackOrientations;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = a5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
  {

LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSCanonicalOrientationMapResolver.m"), 40, CFSTR("The fallback orientation order does not contain all interface orientations."));

    goto LABEL_12;
  }
  v11 = 0;
  v12 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v9);
      v11 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "unsignedIntegerValue");
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v10);

  if ((~v11 & 0x1ELL) != 0)
    goto LABEL_11;
LABEL_12:
  v20.receiver = self;
  v20.super_class = (Class)BSCanonicalOrientationMapResolver;
  v15 = -[BSCanonicalOrientationMapResolver init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_targetOrientation = a3;
    v15->_currentOrientation = a4;
    v17 = objc_msgSend(v9, "copy");
    fallbackOrientations = v16->_fallbackOrientations;
    v16->_fallbackOrientations = (NSArray *)v17;

  }
  return v16;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BSCanonicalOrientationMapResolver)initWithTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4
{
  return -[BSCanonicalOrientationMapResolver initWithTargetOrientation:currentOrientation:fallbackOrientations:](self, "initWithTargetOrientation:currentOrientation:fallbackOrientations:", a3, a4, &unk_1E1EDA1D0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackOrientations, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  BSInterfaceOrientationDescription(self->_targetOrientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription(self->_currentOrientation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("target: %@, current: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription(self->_targetOrientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription(self->_currentOrientation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p target: %@, current: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

@end
