@implementation IMChatTranscriptLayoutSpecification

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p, layoutBoundsSize: {%.1f, %.1f}"), v4, self, *(_QWORD *)&self->_layoutBoundsSize.width, *(_QWORD *)&self->_layoutBoundsSize.height);
}

- (BOOL)isEqual:(id)a3
{
  IMChatTranscriptLayoutSpecification *v4;
  double *v5;
  BOOL v6;
  BOOL v7;

  v4 = (IMChatTranscriptLayoutSpecification *)a3;
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
      v6 = self->_layoutBoundsSize.width == v5[10] && self->_layoutBoundsSize.height == v5[11];
      v7 = v6
        && self->_maximumBubbleWidth == v5[1]
        && self->_topMargin == v5[2]
        && self->_bottomMargin == v5[3]
        && self->_leadingMargin == v5[4]
        && self->_trailingMargin == v5[5]
        && self->_smallVerticalItemSpacing == v5[7]
        && self->_mediumVerticalItemSpacing == v5[8]
        && self->_largeVerticalItemSpacing == v5[9]
        && self->_zeroVerticalItemSpacing == v5[6];

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t height;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  height = (unint64_t)self->_layoutBoundsSize.height;
  if (height <= 1)
    height = 1;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, (unint64_t)self->_layoutBoundsSize.width % height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(IMChatTranscriptLayoutSpecification);
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_maximumBubbleWidth;
  *((_OWORD *)result + 5) = self->_layoutBoundsSize;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_topMargin;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_bottomMargin;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_leadingMargin;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_trailingMargin;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_smallVerticalItemSpacing;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_mediumVerticalItemSpacing;
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_largeVerticalItemSpacing;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_zeroVerticalItemSpacing;
  return result;
}

- (CGSize)layoutBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutBoundsSize.width;
  height = self->_layoutBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLayoutBoundsSize:(CGSize)a3
{
  self->_layoutBoundsSize = a3;
}

- (double)maximumBubbleWidth
{
  return self->_maximumBubbleWidth;
}

- (void)setMaximumBubbleWidth:(double)a3
{
  self->_maximumBubbleWidth = a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_topMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (double)zeroVerticalItemSpacing
{
  return self->_zeroVerticalItemSpacing;
}

- (void)setZeroVerticalItemSpacing:(double)a3
{
  self->_zeroVerticalItemSpacing = a3;
}

- (double)smallVerticalItemSpacing
{
  return self->_smallVerticalItemSpacing;
}

- (void)setSmallVerticalItemSpacing:(double)a3
{
  self->_smallVerticalItemSpacing = a3;
}

- (double)mediumVerticalItemSpacing
{
  return self->_mediumVerticalItemSpacing;
}

- (void)setMediumVerticalItemSpacing:(double)a3
{
  self->_mediumVerticalItemSpacing = a3;
}

- (double)largeVerticalItemSpacing
{
  return self->_largeVerticalItemSpacing;
}

- (void)setLargeVerticalItemSpacing:(double)a3
{
  self->_largeVerticalItemSpacing = a3;
}

@end
