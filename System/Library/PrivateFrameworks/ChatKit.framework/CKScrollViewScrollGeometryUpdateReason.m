@implementation CKScrollViewScrollGeometryUpdateReason

- (CKScrollViewScrollGeometryUpdateReason)initWithReasonType:(id)a3 animationProperties:(id)a4
{
  id v7;
  id v8;
  CKScrollViewScrollGeometryUpdateReason *v9;
  CKScrollViewScrollGeometryUpdateReason *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKScrollViewScrollGeometryUpdateReason;
  v9 = -[CKScrollViewScrollGeometryUpdateReason init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reasonType, a3);
    objc_storeStrong((id *)&v10->_animationProperties, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ScrollGeometryUpdate, type=%@, animation=%@>"), self->_reasonType, self->_animationProperties);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_reasonType, "hash");
  return -[CKScrollViewAnimationProperties hash](self->_animationProperties, "hash") ^ v3;
}

- (BOOL)isEqualToUpdateReason:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (-[NSString isEqualToString:](self->_reasonType, "isEqualToString:", v4[1]))
    v5 = -[CKScrollViewAnimationProperties isEqual:](self->_animationProperties, "isEqual:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CKScrollViewScrollGeometryUpdateReason isEqualToUpdateReason:](self, "isEqualToUpdateReason:", v4);

  return v5;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(id)a3
{
  objc_storeStrong((id *)&self->_reasonType, a3);
}

- (CKScrollViewAnimationProperties)animationProperties
{
  return self->_animationProperties;
}

- (void)setAnimationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_animationProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationProperties, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
}

@end
