@implementation NUIBoxArrangement

- (NUIBoxArrangement)initWithContainer:(id)a3 dataSource:(id)a4
{
  uint64_t v8;
  const __CFString *v9;
  char v10;
  NUIBoxArrangement *v11;
  NUIBoxArrangement *v12;
  char v14;
  uint64_t v15;
  const __CFString *v16;
  objc_super v17;

  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3)
      goto LABEL_10;
  }
  else
  {
    v10 = _NUIIsDebuggerAttached();
    if (a3 || (v10 & 1) == 0)
      goto LABEL_9;
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIBoxArrangement.mm");
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("<Unknown File>");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container != nil"));
LABEL_9:
  if (_NUIEnableAPIMisuseAssertions)
  {
LABEL_10:
    if (a4)
      goto LABEL_11;
LABEL_16:
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIBoxArrangement.mm");
    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = CFSTR("<Unknown File>");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource != nil"));
    goto LABEL_11;
  }
  v14 = _NUIIsDebuggerAttached();
  if (!a4 && (v14 & 1) != 0)
    goto LABEL_16;
LABEL_11:
  v17.receiver = self;
  v17.super_class = (Class)NUIBoxArrangement;
  v11 = -[NUIBoxArrangement init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_container, a3);
    objc_storeWeak((id *)&v12->_dataSource, a4);
    v12->_arrangement.container = (_NUIBoxArrangementContainer *)v12;
    *(_BYTE *)&v12->_flags = *(_BYTE *)&v12->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, -1);
  objc_storeWeak((id *)&self->_container, 0);
  objc_storeWeak((id *)&self->_dataSource, 0);
  v3.receiver = self;
  v3.super_class = (Class)NUIBoxArrangement;
  -[NUIBoxArrangement dealloc](&v3, sel_dealloc);
}

- (NUIArrangementContainer)container
{
  return (NUIArrangementContainer *)objc_loadWeak((id *)&self->_container);
}

- (NUIBoxArrangementDataSource)dataSource
{
  return (NUIBoxArrangementDataSource *)objc_loadWeak((id *)&self->_dataSource);
}

- (void)reloadData
{
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, -1);
}

- (void)populateBoxArrangementCells:(void *)a3
{
  NUIBoxArrangementDataSource *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = self->_dataSource;
  v6 = -[NUIBoxArrangementDataSource numberOfItemsInBoxArrangement:](v5, "numberOfItemsInBoxArrangement:", self);
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v10 = 3;
      v11 = 3;
      v9 = 0;
      v9 = -[NUIBoxArrangementDataSource boxArrangement:itemAtIndex:horizontalAlignment:verticalAlignment:](v5, "boxArrangement:itemAtIndex:horizontalAlignment:verticalAlignment:", self, i, &v11, &v10);
      std::vector<_NUIBoxArrangementCell>::emplace_back<objc_object  {objcproto18NUIArrangementItem}*&,NUIContainerAlignment &,NUIContainerAlignment>((void **)a3, &v9, &v11, &v10);
    }
  }

}

- (CGSize)layoutSizeFittingSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _NUIBoxArrangement *p_arrangement;
  double v6;
  double v7;
  CGSize v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  p_arrangement = &self->_arrangement;
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, 0);
  v8.width = width;
  v8.height = height;
  v6 = _NUIBoxArrangement::measureCells(p_arrangement, v8);
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)_cacheDisplayScaleIfNeeded
{
  double *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (result[18] <= 0.0)
    {
      objc_msgSend(result, "container");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        result = (double *)objc_msgSend((id)objc_msgSend(v1, "container"), "displayScale");
      else
        result = (double *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
      *((_QWORD *)v1 + 18) = v2;
    }
  }
  return result;
}

- (void)positionItemsInBounds:(CGRect)a3 block:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CGSize v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUIBoxArrangement _cacheDisplayScaleIfNeeded]((double *)self);
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, 0);
  v10.width = width;
  v10.height = height;
  _NUIBoxArrangement::measureCells(&self->_arrangement, v10);
  self->_bounds.origin.x = x;
  self->_bounds.origin.y = y;
  self->_bounds.size.width = width;
  self->_bounds.size.height = height;
  _NUIBoxArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)a4, x, y, width, height);
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  -[NUIArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](-[NUIBoxArrangement container](self, "container"), "contentLayoutSizeFittingSize:forArrangedSubview:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double scale;
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double MaxX;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect result;

  -[NUIArrangementContainer layoutFrameForArrangedSubview:withProposedContentFrame:](-[NUIBoxArrangement container](self, "container"), "layoutFrameForArrangedSubview:withProposedContentFrame:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  scale = self->_scale;
  MinX = CGRectGetMinX(v58);
  if (scale == 1.0)
  {
    v11 = ceil(MinX);
    v12 = v11 - MinX;
    v13 = floor(MinX);
    if (v12 >= 0.001)
      v14 = v13;
    else
      v14 = v11;
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    MinY = CGRectGetMinY(v59);
    v16 = ceil(MinY);
    v17 = v16 - MinY;
    v18 = floor(MinY);
    if (v17 >= 0.001)
      v19 = v18;
    else
      v19 = v16;
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v20 = CGRectGetWidth(v60);
    v21 = floor(v20);
    v22 = v20 - v21;
    v23 = ceil(v20);
    if (v22 >= 0.001)
      v24 = v23;
    else
      v24 = v21;
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v25 = CGRectGetHeight(v61);
    v26 = floor(v25);
    v27 = v25 - v26;
    v28 = ceil(v25);
    if (v27 >= 0.001)
      v29 = v28;
    else
      v29 = v26;
  }
  else
  {
    v30 = scale * MinX;
    v31 = ceil(v30);
    v32 = v31 - v30;
    v33 = floor(v30);
    if (v32 < 0.001)
      v33 = v31;
    v55 = v33 / scale;
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    v34 = scale * CGRectGetMinY(v62);
    v35 = ceil(v34);
    v36 = v35 - v34;
    v37 = floor(v34);
    if (v36 < 0.001)
      v37 = v35;
    v19 = v37 / scale;
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v38 = scale * CGRectGetWidth(v63);
    v39 = floor(v38);
    v40 = v38 - v39;
    v41 = ceil(v38);
    if (v40 < 0.001)
      v41 = v39;
    v24 = v41 / scale;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v42 = scale * CGRectGetHeight(v64);
    v43 = floor(v42);
    v44 = v42 - v43;
    v45 = ceil(v42);
    v14 = v55;
    if (v44 < 0.001)
      v45 = v43;
    v29 = v45 / scale;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0
    && -[NUIArrangementContainer effectiveUserInterfaceLayoutDirection](self->_container, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v46 = self->_bounds.origin.x;
    v47 = self->_bounds.origin.y;
    v48 = self->_bounds.size.width;
    v49 = self->_bounds.size.height;
    v65.origin.x = v14;
    v65.origin.y = v19;
    v65.size.width = v24;
    v65.size.height = v29;
    v56 = CGRectGetMinX(v65);
    v66.origin.x = v46;
    v66.origin.y = v47;
    v66.size.width = v48;
    v66.size.height = v49;
    v57 = v56 - CGRectGetMinX(v66);
    v67.origin.x = v46;
    v67.origin.y = v47;
    v67.size.width = v48;
    v67.size.height = v49;
    MaxX = CGRectGetMaxX(v67);
    v68.origin.x = v14;
    v68.origin.y = v19;
    v68.size.width = v24;
    v68.size.height = v29;
    v14 = MaxX - (v57 + CGRectGetWidth(v68));
  }
  v51 = v14;
  v52 = v19;
  v53 = v24;
  v54 = v29;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (void).cxx_destruct
{
  CGRect *begin;
  _NUIBoxArrangementCell *v4;

  begin = self->_arrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_arrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_arrangement.cells.__begin_;
  if (v4)
  {
    self->_arrangement.cells.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  _NUIBoxArrangement::_NUIBoxArrangement(&self->_arrangement);
  return self;
}

@end
