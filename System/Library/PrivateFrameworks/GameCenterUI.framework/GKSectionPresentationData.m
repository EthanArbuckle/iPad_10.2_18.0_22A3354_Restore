@implementation GKSectionPresentationData

- (GKSectionPresentationData)initWithSection:(int64_t)a3 presentationData:(id)a4
{
  id v6;
  GKSectionPresentationData *v7;
  GKSectionPresentationData *v8;
  double v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKSectionPresentationData;
  v7 = -[GKSectionPresentationData init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_showMoreMaxY = -1.0;
    v7->_itemsMinY = 1.79769313e308;
    v7->_minY = 1.79769313e308;
    v7->_section = a3;
    v7->_headerMinY = 1.79769313e308;
    v7->_footerMinY = 1.79769313e308;
    if (v6)
    {
      objc_msgSend(v6, "maxY");
      v8->_maxY = v9;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  double minY;
  const __CFString *v6;
  double headerMinY;
  uint64_t v8;
  __CFString *v9;
  double itemsMinY;
  uint64_t v11;
  const __CFString *v12;
  double footerMinY;
  uint64_t v14;
  const __CFString *v15;
  double showMoreMaxY;
  double maxY;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  unint64_t numItems;
  uint64_t v22;
  __CFString *v23;
  unint64_t numFooters;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  unint64_t numHeaders;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  __CFString *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_section);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" section: %@"), v54);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  minY = self->_minY;
  if (minY == 1.79769313e308)
  {
    v6 = &stru_1E59EB978;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minY);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxY);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@(%@-%@)"), CFSTR("y"), v3, v45);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  headerMinY = self->_headerMinY;
  if (headerMinY == 1.79769313e308)
  {
    v9 = &stru_1E59EB978;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_headerMinY);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_headerMaxY);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v8;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@(%@-%@)"), CFSTR("hdrY"), v8, v43);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  itemsMinY = self->_itemsMinY;
  if (itemsMinY == 1.79769313e308)
  {
    v12 = &stru_1E59EB978;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemsMinY);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemsMaxY);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v11;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@(%@-%@)"), CFSTR("itemsY"), v11, v41);
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  footerMinY = self->_footerMinY;
  if (footerMinY == 1.79769313e308)
  {
    v15 = &stru_1E59EB978;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_footerMinY);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_footerMaxY);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v14;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@(%@-%@)"), CFSTR("ftrY"), v14, v39);
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  maxY = self->_maxY;
  showMoreMaxY = self->_showMoreMaxY;
  if (showMoreMaxY <= maxY)
  {
    v19 = &stru_1E59EB978;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_showMoreMaxY);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v18;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@: %@"), v18, v33);
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v47 = (__CFString *)v19;
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" |%@%@%@%@%@|"), v6, v9, v12, v15, v19);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  numHeaders = self->_numHeaders;
  v53 = (__CFString *)v6;
  if (numHeaders)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numHeaders);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v20;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@: %@"), v20, v37);
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = &stru_1E59EB978;
  }
  v49 = (__CFString *)v15;
  v50 = (__CFString *)v12;
  numItems = self->_numItems;
  if (numItems)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numItems);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v22;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@: %@"), v22, v35);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = &stru_1E59EB978;
  }
  v52 = v9;
  numFooters = self->_numFooters;
  if (numFooters)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numFooters);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR(" %@: %@"), v9, v3);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = &stru_1E59EB978;
  }
  if (self->_numOverlays)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numOverlays);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR(" %@: %@"), v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringWithFormat:", CFSTR("%@%@%@%@%@%@"), v57, v56, v55, v23, v26, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v51, "stringWithFormat:", CFSTR("%@%@%@%@%@%@"), v57, v56, v55, v23, v26, &stru_1E59EB978);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (numFooters)
  {

  }
  if (numItems)
  {

  }
  if (numHeaders)
  {

  }
  if (showMoreMaxY > maxY)
  {

  }
  if (footerMinY != 1.79769313e308)
  {

  }
  if (itemsMinY != 1.79769313e308)
  {

  }
  if (headerMinY != 1.79769313e308)
  {

  }
  if (minY != 1.79769313e308)
  {

  }
  return v31;
}

- (double)showMoreMaxY
{
  double result;

  result = self->_showMoreMaxY;
  if (result < 0.0)
    return self->_maxY;
  return result;
}

- (double)itemsMinY
{
  double result;

  result = self->_itemsMinY;
  if (result == 1.79769313e308)
    return self->_headerMaxY;
  return result;
}

- (void)updateWithLayoutAttributes:(id)a3 supplementaryLocation:(unint64_t)a4
{
  uint64_t v6;
  double v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  int8x16_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  float64x2_t v18;
  float64x2_t v19;
  int8x16_t v20;
  CGFloat MaxY;
  CGFloat MinY;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a3;
  objc_msgSend(v23, "frame");
  MinY = CGRectGetMinY(v24);
  objc_msgSend(v23, "frame");
  MaxY = CGRectGetMaxY(v25);
  v6 = objc_msgSend(v23, "representedElementCategory");
  if (!v6)
  {
    v14 = 40;
    v15 = 32;
    v7 = MaxY;
    v8 = MinY;
LABEL_9:
    v16 = *(double *)((char *)&self->super.isa + v15);
    if (v16 > v8)
      v16 = v8;
    *(double *)((char *)&self->super.isa + v15) = v16;
    goto LABEL_12;
  }
  v7 = MaxY;
  v8 = MinY;
  if (v6 != 1)
    goto LABEL_15;
  if (!a4)
  {
    v14 = 24;
    v15 = 16;
    goto LABEL_9;
  }
  if (a4 != 1)
    goto LABEL_15;
  v9.f64[0] = self->_footerMinY;
  v9.f64[1] = MaxY;
  v10.f64[1] = self->_footerMaxY;
  v10.f64[0] = MinY;
  v11 = (int8x16_t)vcgtq_f64(v9, v10);
  v9.f64[0] = MinY;
  *(int8x16_t *)&self->_footerMinY = vbslq_s8(v11, (int8x16_t)v9, *(int8x16_t *)&self->_footerMinY);
  objc_msgSend(v23, "representedElementKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("IncrementalReveal"));

  v7 = MaxY;
  v8 = MinY;
  if ((v13 & 1) == 0)
    goto LABEL_15;
  v14 = 80;
LABEL_12:
  v17 = *(double *)((char *)&self->super.isa + v14);
  if (v17 < v7)
    v17 = v7;
  *(double *)((char *)&self->super.isa + v14) = v17;
LABEL_15:
  v18.f64[0] = self->_minY;
  v18.f64[1] = v7;
  v19.f64[1] = self->_maxY;
  v19.f64[0] = v8;
  v20 = (int8x16_t)vcgtq_f64(v18, v19);
  v18.f64[0] = v8;
  *(int8x16_t *)&self->_minY = vbslq_s8(v20, (int8x16_t)v18, *(int8x16_t *)&self->_minY);

}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (double)headerMinY
{
  return self->_headerMinY;
}

- (void)setHeaderMinY:(double)a3
{
  self->_headerMinY = a3;
}

- (double)headerMaxY
{
  return self->_headerMaxY;
}

- (void)setHeaderMaxY:(double)a3
{
  self->_headerMaxY = a3;
}

- (void)setItemsMinY:(double)a3
{
  self->_itemsMinY = a3;
}

- (double)itemsMaxY
{
  return self->_itemsMaxY;
}

- (void)setItemsMaxY:(double)a3
{
  self->_itemsMaxY = a3;
}

- (double)footerMinY
{
  return self->_footerMinY;
}

- (void)setFooterMinY:(double)a3
{
  self->_footerMinY = a3;
}

- (double)footerMaxY
{
  return self->_footerMaxY;
}

- (void)setFooterMaxY:(double)a3
{
  self->_footerMaxY = a3;
}

- (double)minY
{
  return self->_minY;
}

- (void)setMinY:(double)a3
{
  self->_minY = a3;
}

- (double)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(double)a3
{
  self->_maxY = a3;
}

- (void)setShowMoreMaxY:(double)a3
{
  self->_showMoreMaxY = a3;
}

- (unint64_t)numHeaders
{
  return self->_numHeaders;
}

- (void)setNumHeaders:(unint64_t)a3
{
  self->_numHeaders = a3;
}

- (unint64_t)numFooters
{
  return self->_numFooters;
}

- (void)setNumFooters:(unint64_t)a3
{
  self->_numFooters = a3;
}

- (unint64_t)numOverlays
{
  return self->_numOverlays;
}

- (void)setNumOverlays:(unint64_t)a3
{
  self->_numOverlays = a3;
}

- (unint64_t)numItems
{
  return self->_numItems;
}

- (void)setNumItems:(unint64_t)a3
{
  self->_numItems = a3;
}

- (unint64_t)overlayOffset
{
  return self->_overlayOffset;
}

- (void)setOverlayOffset:(unint64_t)a3
{
  self->_overlayOffset = a3;
}

@end
