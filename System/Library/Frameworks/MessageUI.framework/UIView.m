@implementation UIView

id __68__UIView_MFUtilities__mf_pinToView_layoutMarginEdges_flexibleEdges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_mf_anchorForEdge:relativeToMargin:", a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_mf_anchorForEdge:relativeToMargin:", a2, (*(_QWORD *)(a1 + 56) & a2) != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & a2) != 0)
  {
    if ((a2 & 3) != 0)
      objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:", v6);
    else
      objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

@end
