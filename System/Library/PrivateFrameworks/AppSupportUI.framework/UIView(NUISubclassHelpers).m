@implementation UIView(NUISubclassHelpers)

- (double)_didInvalidateIntrinsicContentSize
{
  _NUIViewContainerViewInfo *IfNeeded;

  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  return -[_NUIViewContainerViewInfo resetCaches]((uint64_t)IfNeeded);
}

- (_NUIViewContainerViewInfo)effectiveAlignmentRectInsets
{
  _NUIViewContainerViewInfo *result;
  _NUIViewContainerViewInfo *v2;
  uint64_t v3;
  uint64_t v4;
  UIEdgeInsets *p_alignmentInsets;
  char *v6;
  __int128 v7;
  _OWORD v8[2];
  _OWORD v9[2];
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  v2 = result;
  if ((*(_BYTE *)&result->_flags & 8) == 0)
  {
    v3 = 0;
    v4 = 0;
    v9[0] = xmmword_1AA8376E8;
    v9[1] = unk_1AA8376F8;
    p_alignmentInsets = &result->_alignmentInsets;
    v8[0] = xmmword_1AA8376E8;
    v8[1] = unk_1AA8376F8;
    do
    {
      result = (_NUIViewContainerViewInfo *)NUIContainerViewLengthIsDefault(*(double *)((char *)&p_alignmentInsets->top
                                                                                      + v3));
      if ((_DWORD)result)
      {
        v6 = (char *)v9 + 8 * v4;
      }
      else
      {
        result = (_NUIViewContainerViewInfo *)NUIContainerViewLengthIsSystem(0, *(double *)((char *)&p_alignmentInsets->top + v3));
        if ((_DWORD)result)
          v6 = (char *)v8 + v3;
        else
          v6 = (char *)(&p_alignmentInsets->top + v4);
      }
      *(_QWORD *)((char *)v10 + v3) = *(_QWORD *)v6;
      ++v4;
      v3 += 8;
    }
    while (v3 != 32);
    v7 = v10[1];
    *(_OWORD *)&v2->_cachedAlignmentInsets.top = v10[0];
    *(_OWORD *)&v2->_cachedAlignmentInsets.bottom = v7;
    *(_BYTE *)&v2->_flags |= 8u;
  }
  return result;
}

- (uint64_t)effectiveFirstBaselineOffsetFromContentTop
{
  uint64_t result;
  double v3;
  double v4;
  double v5;
  double v6;

  result = objc_msgSend(a1, "effectiveFirstBaselineOffsetFromTop");
  v4 = v3;
  v5 = -v3;
  if (v4 >= 0.0)
    v6 = v4;
  else
    v6 = v5;
  if (v6 > 2.22507386e-308)
    return objc_msgSend(a1, "effectiveAlignmentRectInsets");
  return result;
}

- (uint64_t)effectiveBaselineOffsetFromContentBottom
{
  uint64_t result;
  double v3;
  double v4;
  double v5;
  double v6;

  result = objc_msgSend(a1, "effectiveBaselineOffsetFromBottom");
  v4 = v3;
  v5 = -v3;
  if (v4 >= 0.0)
    v6 = v4;
  else
    v6 = v5;
  if (v6 > 2.22507386e-308)
    return objc_msgSend(a1, "effectiveAlignmentRectInsets");
  return result;
}

- (_NUIViewContainerViewInfo)setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached
{
  _NUIViewContainerViewInfo *result;

  result = _NUIContainerViewInfoCreateIfNeeded(a1, 0);
  if ((*(_BYTE *)&result->_flags & 2) != 0)
  {
    *(_BYTE *)&result->_flags &= ~2u;
    return (_NUIViewContainerViewInfo *)objc_msgSend((id)-[objc_object superview](a1, "superview"), "setCurrentEffectiveLayoutSizeFittingSizeShouldNotBeCached");
  }
  return result;
}

- (uint64_t)systemSpacingToAdjecentSiblingView:()NUISubclassHelpers axis:baselineRelative:multiplier:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a4)
  {
    if (a5)
    {
      v6 = 6;
      v7 = 11;
      v8 = a3;
      v9 = 5;
      v10 = 12;
    }
    else
    {
      v6 = 4;
      v7 = 4;
      v8 = a3;
      v9 = 3;
      v10 = 3;
    }
  }
  else
  {
    v6 = 2;
    v7 = 6;
    v8 = a3;
    v9 = 1;
    v10 = 5;
  }
  return objc_msgSend(a1, "_autolayoutSpacingAtEdge:forAttribute:nextToNeighbor:edge:attribute:multiplier:", v6, v7, v8, v9, v10);
}

- (uint64_t)systemSpacingToSuperView:()NUISubclassHelpers edge:baselineRelative:multiplier:
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v6 = a4 - 1;
  v9 = 1;
  v10 = 1;
  switch(v6)
  {
    case 0:
      v11 = a5 == 0;
      v12 = 3;
      if (a5)
        v9 = 5;
      else
        v9 = 3;
      v13 = 12;
      goto LABEL_11;
    case 1:
      goto LABEL_15;
    case 3:
      v11 = a5 == 0;
      v12 = 4;
      if (a5)
        v9 = 6;
      else
        v9 = 4;
      v13 = 11;
LABEL_11:
      if (v11)
        v10 = v12;
      else
        v10 = v13;
      goto LABEL_15;
    case 7:
      v10 = 2;
      v9 = 2;
LABEL_15:
      objc_msgSend(a1, "_autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:", v9, v10, a3, 0);
      result = objc_msgSend(a1, "effectiveScreenScale");
      break;
    default:
      result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid edge %lu"), a4);
      break;
  }
  return result;
}

@end
