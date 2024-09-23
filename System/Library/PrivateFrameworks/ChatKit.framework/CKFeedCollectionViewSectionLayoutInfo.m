@implementation CKFeedCollectionViewSectionLayoutInfo

- (CKFeedCollectionViewSectionLayoutInfo)init
{
  CKFeedCollectionViewSectionLayoutInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFeedCollectionViewSectionLayoutInfo;
  result = -[CKFeedCollectionViewSectionLayoutInfo init](&v3, sel_init);
  if (result)
    *(int64x2_t *)&result->_firstJoinedSection = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return result;
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[CKFeedCollectionViewSectionLayoutInfo origin](self, "origin");
  v4 = v3;
  v6 = v5;
  -[CKFeedCollectionViewSectionLayoutInfo size](self, "size");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  double x;
  double y;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v21 = *MEMORY[0x1E0C80C00];
  x = self->_origin.x;
  y = self->_origin.y;
  if (a3.x != x || a3.y != y)
  {
    v6 = a3.y;
    v7 = a3.x;
    self->_origin = a3;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CKFeedCollectionViewSectionLayoutInfo fixedLayoutAttributes](self, "fixedLayoutAttributes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = v7 - x;
      v12 = v6 - y;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v15, "frame");
          v23 = CGRectOffset(v22, v11, v12);
          objc_msgSend(v15, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)headerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerSize.width;
  height = self->_headerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderSize:(CGSize)a3
{
  self->_headerSize = a3;
}

- (CGSize)footerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_footerSize.width;
  height = self->_footerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFooterSize:(CGSize)a3
{
  self->_footerSize = a3;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (NSArray)fixedLayoutAttributes
{
  return self->_fixedLayoutAttributes;
}

- (void)setFixedLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_fixedLayoutAttributes, a3);
}

- (NSArray)tileLayoutAttributes
{
  return self->_tileLayoutAttributes;
}

- (void)setTileLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_tileLayoutAttributes, a3);
}

- (NSArray)floatingLayoutAttributes
{
  return self->_floatingLayoutAttributes;
}

- (void)setFloatingLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_floatingLayoutAttributes, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (int64_t)previousVisibleSection
{
  return self->_previousVisibleSection;
}

- (void)setPreviousVisibleSection:(int64_t)a3
{
  self->_previousVisibleSection = a3;
}

- (int64_t)nextVisibleSection
{
  return self->_nextVisibleSection;
}

- (void)setNextVisibleSection:(int64_t)a3
{
  self->_nextVisibleSection = a3;
}

- (int64_t)firstJoinedSection
{
  return self->_firstJoinedSection;
}

- (void)setFirstJoinedSection:(int64_t)a3
{
  self->_firstJoinedSection = a3;
}

- (int64_t)lastJoinedSection
{
  return self->_lastJoinedSection;
}

- (void)setLastJoinedSection:(int64_t)a3
{
  self->_lastJoinedSection = a3;
}

- (id)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong(&self->_groupID, a3);
}

- (int64_t)numberOfTilesOmitted
{
  return self->_numberOfTilesOmitted;
}

- (void)setNumberOfTilesOmitted:(int64_t)a3
{
  self->_numberOfTilesOmitted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupID, 0);
  objc_storeStrong((id *)&self->_floatingLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_tileLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_fixedLayoutAttributes, 0);
}

@end
