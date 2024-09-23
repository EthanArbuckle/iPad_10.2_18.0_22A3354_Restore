@implementation CKTranscriptCollectionViewLayoutAttributes

- (CKTranscriptCollectionViewLayoutAttributes)init
{
  CKTranscriptCollectionViewLayoutAttributes *result;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptCollectionViewLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes init](&v8, sel_init);
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x1E0CD2610];
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&result->_contentTransform3D.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&result->_contentTransform3D.m43 = v4;
    v5 = v3[5];
    *(_OWORD *)&result->_contentTransform3D.m31 = v3[4];
    *(_OWORD *)&result->_contentTransform3D.m33 = v5;
    v6 = v3[1];
    *(_OWORD *)&result->_contentTransform3D.m11 = *v3;
    *(_OWORD *)&result->_contentTransform3D.m13 = v6;
    v7 = v3[3];
    *(_OWORD *)&result->_contentTransform3D.m21 = v3[2];
    *(_OWORD *)&result->_contentTransform3D.m23 = v7;
    result->_insertingReply = 0;
  }
  return result;
}

- (CKTranscriptCollectionViewLayoutAttributes)initWithLayoutAttributes:(id)a3
{
  id v4;
  CKTranscriptCollectionViewLayoutAttributes *v5;
  void *v6;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  v5 = -[CKTranscriptCollectionViewLayoutAttributes init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "frame");
    -[UICollectionViewLayoutAttributes setFrame:](v5, "setFrame:");
    objc_msgSend(v4, "center");
    -[UICollectionViewLayoutAttributes setCenter:](v5, "setCenter:");
    objc_msgSend(v4, "size");
    -[UICollectionViewLayoutAttributes setSize:](v5, "setSize:");
    if (v4)
    {
      objc_msgSend(v4, "transform3D");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
    }
    v12[4] = v17;
    v12[5] = v18;
    v12[6] = v19;
    v12[7] = v20;
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    v12[3] = v16;
    -[UICollectionViewLayoutAttributes setTransform3D:](v5, "setTransform3D:", v12);
    objc_msgSend(v4, "bounds");
    -[UICollectionViewLayoutAttributes setBounds:](v5, "setBounds:");
    if (v4)
    {
      objc_msgSend(v4, "transform");
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
      v9 = 0u;
    }
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    -[UICollectionViewLayoutAttributes setTransform:](v5, "setTransform:", v8);
    objc_msgSend(v4, "alpha");
    -[UICollectionViewLayoutAttributes setAlpha:](v5, "setAlpha:");
    -[UICollectionViewLayoutAttributes setZIndex:](v5, "setZIndex:", objc_msgSend(v4, "zIndex"));
    objc_msgSend(v4, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayoutAttributes setIndexPath:](v5, "setIndexPath:", v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  CGSize size;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptCollectionViewLayoutAttributes;
  v5 = -[UICollectionViewLayoutAttributes copyWithZone:](&v20, sel_copyWithZone_);
  objc_storeStrong((id *)v5 + 82, self->_chatItem);
  size = self->_targetFrame.size;
  *((_OWORD *)v5 + 22) = self->_targetFrame.origin;
  *((CGSize *)v5 + 23) = size;
  v7 = *(_OWORD *)&self->_contentTransform3D.m11;
  v9 = *(_OWORD *)&self->_contentTransform3D.m21;
  v8 = *(_OWORD *)&self->_contentTransform3D.m23;
  *(_OWORD *)(v5 + 472) = *(_OWORD *)&self->_contentTransform3D.m13;
  *(_OWORD *)(v5 + 488) = v9;
  *(_OWORD *)(v5 + 456) = v7;
  v10 = *(_OWORD *)&self->_contentTransform3D.m31;
  v12 = *(_OWORD *)&self->_contentTransform3D.m41;
  v11 = *(_OWORD *)&self->_contentTransform3D.m43;
  *(_OWORD *)(v5 + 536) = *(_OWORD *)&self->_contentTransform3D.m33;
  *(_OWORD *)(v5 + 552) = v12;
  *(_OWORD *)(v5 + 504) = v8;
  *(_OWORD *)(v5 + 520) = v10;
  *(_OWORD *)(v5 + 568) = v11;
  *(CGSize *)(v5 + 680) = self->_parentChatItemSize;
  *((_QWORD *)v5 + 84) = *(_QWORD *)&self->_parentRotationOffset;
  *((_QWORD *)v5 + 78) = *(_QWORD *)&self->_associatedVerticalShift;
  v13 = -[NSMutableArray mutableCopyWithZone:](self->_associatedLayoutAttributes, "mutableCopyWithZone:", a3);
  v14 = (void *)*((_QWORD *)v5 + 79);
  *((_QWORD *)v5 + 79) = v13;

  v15 = -[CKTranscriptCollectionViewLayoutAttributes copy](self->_initialParentLayoutAttributes, "copy");
  v16 = (void *)*((_QWORD *)v5 + 80);
  *((_QWORD *)v5 + 80) = v15;

  v17 = -[NSArray copy](self->_threadGroupLayoutAttributes, "copy");
  v18 = (void *)*((_QWORD *)v5 + 81);
  *((_QWORD *)v5 + 81) = v17;

  v5[664] = self->_insertingReply;
  *((_QWORD *)v5 + 55) = *(_QWORD *)&self->_initialBalloonOffsetX;
  *((_QWORD *)v5 + 56) = *(_QWORD *)&self->_currentBalloonOffsetX;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CKTranscriptCollectionViewLayoutAttributes *v4;
  CKTranscriptCollectionViewLayoutAttributes *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  BOOL v16;
  CKTranscriptCollectionViewLayoutAttributes *initialParentLayoutAttributes;
  objc_super v19;
  CATransform3D b;
  CATransform3D a;

  v4 = (CKTranscriptCollectionViewLayoutAttributes *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = *(_OWORD *)&v5->_contentTransform3D.m11;
      v7 = *(_OWORD *)&v5->_contentTransform3D.m13;
      v8 = *(_OWORD *)&v5->_contentTransform3D.m23;
      *(_OWORD *)&a.m21 = *(_OWORD *)&v5->_contentTransform3D.m21;
      *(_OWORD *)&a.m23 = v8;
      *(_OWORD *)&a.m11 = v6;
      *(_OWORD *)&a.m13 = v7;
      v9 = *(_OWORD *)&v5->_contentTransform3D.m31;
      v10 = *(_OWORD *)&v5->_contentTransform3D.m33;
      v11 = *(_OWORD *)&v5->_contentTransform3D.m43;
      *(_OWORD *)&a.m41 = *(_OWORD *)&v5->_contentTransform3D.m41;
      *(_OWORD *)&a.m43 = v11;
      *(_OWORD *)&a.m31 = v9;
      *(_OWORD *)&a.m33 = v10;
      v12 = *(_OWORD *)&self->_contentTransform3D.m33;
      *(_OWORD *)&b.m31 = *(_OWORD *)&self->_contentTransform3D.m31;
      *(_OWORD *)&b.m33 = v12;
      v13 = *(_OWORD *)&self->_contentTransform3D.m43;
      *(_OWORD *)&b.m41 = *(_OWORD *)&self->_contentTransform3D.m41;
      *(_OWORD *)&b.m43 = v13;
      v14 = *(_OWORD *)&self->_contentTransform3D.m13;
      *(_OWORD *)&b.m11 = *(_OWORD *)&self->_contentTransform3D.m11;
      *(_OWORD *)&b.m13 = v14;
      v15 = *(_OWORD *)&self->_contentTransform3D.m23;
      *(_OWORD *)&b.m21 = *(_OWORD *)&self->_contentTransform3D.m21;
      *(_OWORD *)&b.m23 = v15;
      if (!CATransform3DEqualToTransform(&a, &b))
        goto LABEL_16;
      v16 = 0;
      if (v5->_parentChatItemSize.width != self->_parentChatItemSize.width
        || v5->_parentChatItemSize.height != self->_parentChatItemSize.height)
      {
        goto LABEL_17;
      }
      if (v5->_parentRotationOffset == self->_parentRotationOffset
        && v5->_associatedVerticalShift == self->_associatedVerticalShift
        && ((initialParentLayoutAttributes = v5->_initialParentLayoutAttributes,
             initialParentLayoutAttributes == self->_initialParentLayoutAttributes)
         || -[CKTranscriptCollectionViewLayoutAttributes isEqual:](initialParentLayoutAttributes, "isEqual:"))
        && v5->_threadGroupLayoutAttributes == self->_threadGroupLayoutAttributes
        && v5->_insertingReply == self->_insertingReply
        && v5->_currentBalloonOffsetX == self->_currentBalloonOffsetX)
      {
        v19.receiver = self;
        v19.super_class = (Class)CKTranscriptCollectionViewLayoutAttributes;
        v16 = -[UICollectionViewLayoutAttributes isEqual:](&v19, sel_isEqual_, v5);
      }
      else
      {
LABEL_16:
        v16 = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    v16 = 0;
  }
LABEL_18:

  return v16;
}

- (CATransform3D)contentTransform3D
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[4].m14;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m12;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[4].m24;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m22;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[3].m34;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m32;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[3].m44;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m42;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (CKChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (CGSize)parentChatItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_parentChatItemSize.width;
  height = self->_parentChatItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setParentChatItemSize:(CGSize)a3
{
  self->_parentChatItemSize = a3;
}

- (double)parentRotationOffset
{
  return self->_parentRotationOffset;
}

- (void)setParentRotationOffset:(double)a3
{
  self->_parentRotationOffset = a3;
}

- (BOOL)isInsertingReply
{
  return self->_insertingReply;
}

- (void)setInsertingReply:(BOOL)a3
{
  self->_insertingReply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_threadGroupLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_initialParentLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_associatedLayoutAttributes, 0);
}

@end
