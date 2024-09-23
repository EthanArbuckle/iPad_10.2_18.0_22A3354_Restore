@implementation CKOrganicImageLayoutRecipe

- (CKOrganicImageLayoutRecipe)initWithRotation:(double)a3 offset:(double)a4 targetSize:(CGSize)a5 overlap:(double)a6 wantsShadow:(BOOL)a7 groupIdentifier:(id)a8
{
  _BOOL8 v8;
  double height;
  double width;
  id v15;
  CKOrganicImageLayoutRecipe *v16;
  CKOrganicImageLayoutRecipe *v17;
  objc_super v19;

  v8 = a7;
  height = a5.height;
  width = a5.width;
  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)CKOrganicImageLayoutRecipe;
  v16 = -[CKOrganicImageLayoutRecipe init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[CKOrganicImageLayoutRecipe setRotation:](v16, "setRotation:", a3);
    -[CKOrganicImageLayoutRecipe setOffset:](v17, "setOffset:", a4);
    -[CKOrganicImageLayoutRecipe setTargetSize:](v17, "setTargetSize:", width, height);
    -[CKOrganicImageLayoutRecipe setOverlap:](v17, "setOverlap:", a6);
    -[CKOrganicImageLayoutRecipe setWantsShadow:](v17, "setWantsShadow:", v8);
    -[CKOrganicImageLayoutRecipe setGroupIdentifier:](v17, "setGroupIdentifier:", v15);
  }

  return v17;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKOrganicImageLayoutRecipe rotation](self, "rotation");
  v5 = v4;
  -[CKOrganicImageLayoutRecipe offset](self, "offset");
  v7 = v6;
  -[CKOrganicImageLayoutRecipe relativeGroupCenter](self, "relativeGroupCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  -[CKOrganicImageLayoutRecipe groupIdentifier](self, "groupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CKOrganicImageLayoutRecipe isLastItem](self, "isLastItem");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p> rotation %f offset %f relativeGroupCenter %f groupIdentifier %@ isLastItem %@"), self, v5, v7, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (BOOL)wantsShadow
{
  return self->_wantsShadow;
}

- (void)setWantsShadow:(BOOL)a3
{
  self->_wantsShadow = a3;
}

- (NSNumber)relativeGroupCenter
{
  return self->_relativeGroupCenter;
}

- (void)setRelativeGroupCenter:(id)a3
{
  objc_storeStrong((id *)&self->_relativeGroupCenter, a3);
}

- (NSNumber)groupMaxX
{
  return self->_groupMaxX;
}

- (void)setGroupMaxX:(id)a3
{
  objc_storeStrong((id *)&self->_groupMaxX, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (BOOL)isLastItem
{
  return self->_isLastItem;
}

- (void)setIsLastItem:(BOOL)a3
{
  self->_isLastItem = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (double)overlap
{
  return self->_overlap;
}

- (void)setOverlap:(double)a3
{
  self->_overlap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupMaxX, 0);
  objc_storeStrong((id *)&self->_relativeGroupCenter, 0);
}

@end
