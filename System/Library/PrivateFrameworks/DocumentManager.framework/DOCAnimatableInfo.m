@implementation DOCAnimatableInfo

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  CGSize size;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = self->_sourceContextId;
    *(_QWORD *)(v4 + 16) = self->_sourceLayerRenderId;
    size = self->_sourceFrame.size;
    *(CGPoint *)(v4 + 32) = self->_sourceFrame.origin;
    *(CGSize *)(v4 + 48) = size;
    objc_storeStrong((id *)(v4 + 24), self->_sourcePath);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCAnimatableInfo)initWithCoder:(id)a3
{
  id v4;
  DOCAnimatableInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  UIBezierPath *sourcePath;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DOCAnimatableInfo;
  v5 = -[DOCAnimatableInfo init](&v18, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_sourceContextId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceContextId = objc_msgSend(v4, "decodeInt32ForKey:", v6);

    NSStringFromSelector(sel_sourceLayerRenderId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceLayerRenderId = objc_msgSend(v4, "decodeInt64ForKey:", v7);

    NSStringFromSelector(sel_sourceFrame);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGRectForKey:", v8);
    v5->_sourceFrame.origin.x = v9;
    v5->_sourceFrame.origin.y = v10;
    v5->_sourceFrame.size.width = v11;
    v5->_sourceFrame.size.height = v12;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_sourcePath);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    sourcePath = v5->_sourcePath;
    v5->_sourcePath = (UIBezierPath *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sourceContextId;
  id v5;
  void *v6;
  unint64_t sourceLayerRenderId;
  void *v8;
  void *v9;
  UIBezierPath *sourcePath;
  id v11;

  sourceContextId = self->_sourceContextId;
  v5 = a3;
  NSStringFromSelector(sel_sourceContextId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt32:forKey:", sourceContextId, v6);

  sourceLayerRenderId = self->_sourceLayerRenderId;
  NSStringFromSelector(sel_sourceLayerRenderId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", sourceLayerRenderId, v8);

  NSStringFromSelector(sel_sourceFrame);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v9, self->_sourceFrame.origin.x, self->_sourceFrame.origin.y, self->_sourceFrame.size.width, self->_sourceFrame.size.height);

  sourcePath = self->_sourcePath;
  NSStringFromSelector(sel_sourcePath);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", sourcePath, v11);

}

- (unsigned)sourceContextId
{
  return self->_sourceContextId;
}

- (void)setSourceContextId:(unsigned int)a3
{
  self->_sourceContextId = a3;
}

- (unint64_t)sourceLayerRenderId
{
  return self->_sourceLayerRenderId;
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  self->_sourceLayerRenderId = a3;
}

- (CGRect)sourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceFrame.origin.x;
  y = self->_sourceFrame.origin.y;
  width = self->_sourceFrame.size.width;
  height = self->_sourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (UIBezierPath)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePath, 0);
}

@end
