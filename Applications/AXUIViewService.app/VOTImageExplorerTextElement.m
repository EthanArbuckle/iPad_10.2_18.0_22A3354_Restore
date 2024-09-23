@implementation VOTImageExplorerTextElement

- (VOTImageExplorerTextElement)initWithImageView:(id)a3 forTextFeature:(id)a4 withParentTextFeature:(id)a5 hasFlippedYAxis:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  VOTImageExplorerTextElement *v10;
  objc_super v12;

  v6 = a6;
  v12.receiver = self;
  v12.super_class = (Class)VOTImageExplorerTextElement;
  v9 = a5;
  v10 = -[VOTImageExplorerElement initWithImageView:forFeature:hasFlippedYAxis:](&v12, "initWithImageView:forFeature:hasFlippedYAxis:", a3, a4, v6);
  objc_storeWeak((id *)&v10->_parentTextFeature, v9);

  return v10;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  CGRect v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTextElement accessibilityLabel](self, "accessibilityLabel"));
  -[VOTImageExplorerTextElement accessibilityFrame](self, "accessibilityFrame");
  v7 = NSStringFromCGRect(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, Label: %@, Frame: %@, Row: %li, Column: %li"), v5, v6, v8, -[VOTImageExplorerTextElement rowIndex](self, "rowIndex"), -[VOTImageExplorerTextElement columnIndex](self, "columnIndex")));

  return (NSString *)v9;
}

- (BOOL)isHeader
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v3 = objc_msgSend(v2, "ocrFeatureType") == (id)12;

  return v3;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[VOTImageExplorerTextElement rowIndex](self, "rowIndex");
  v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[VOTImageExplorerTextElement columnIndex](self, "columnIndex");
  v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));

  return v3;
}

- (id)accessibilityIdentifier
{
  return CFSTR("VOTImageExplorerTextElement");
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if (-[VOTImageExplorerTextElement accessibilityContainerType](self, "accessibilityContainerType") == (id)4)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    objc_msgSend(v10, "boundingBoxForRange:", location, length);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTextElement parentAccessibilityContainer](self, "parentAccessibilityContainer"));
    objc_msgSend(v19, "frame");
    x = UIAccessibilityFrameForBounds(v19, v12 * v20, (1.0 - v14 - v18) * v21, v16 * v20, v18 * v21);
    y = v22;
    width = v23;
    height = v24;

  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unsigned int v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unsigned int v54;
  double v55;
  double v56;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v61;
  double v62;
  double v63;
  double v64;
  CGRect v65;
  CGRect v66;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTextElement parentAccessibilityContainer](self, "parentAccessibilityContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTextElement parentTextFeature](self, "parentTextFeature"));
  v5 = objc_msgSend(v4, "ocrFeatureType");

  if (v5 == (id)16)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTextElement parentTextFeature](self, "parentTextFeature"));
    objc_msgSend(v6, "normalizedFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v3, "frame");
    v16 = v15;
    v18 = v17;
    v19 = -[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis");
    v20 = 1.0 - v10 - v14;
    if (v19)
      v20 = v10;
    v21 = v18 * v20;

    v22 = UIAccessibilityFrameForBounds(v3, v8 * v16, v21, v12 * v16, v14 * v18);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    objc_msgSend(v29, "normalizedFrame");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = -[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis");
    v39 = 1.0 - v33 - v37;
    if (!v38)
      v39 = v33;
    v40 = v28 * v39;

    v65.origin.x = v26 * v31;
    v65.origin.y = v40;
    v65.size.width = v26 * v35;
    v65.size.height = v28 * v37;
    v66 = CGRectOffset(v65, v22, v24);
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    objc_msgSend(v41, "normalizedFrame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    objc_msgSend(v3, "frame");
    v51 = v50;
    v53 = v52;
    v54 = -[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis");
    v55 = 1.0 - v45 - v49;
    if (!v54)
      v55 = v45;
    v56 = v53 * v55;

    v66.origin.x = UIAccessibilityFrameForBounds(v3, v43 * v51, v56, v47 * v51, v49 * v53);
  }
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;

  v61 = x;
  v62 = y;
  v63 = width;
  v64 = height;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (id)parentAccessibilityContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTextElement accessibilityContainer](self, "accessibilityContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityContainer"));

  return v3;
}

- (AXMVisionFeature)parentTextFeature
{
  return (AXMVisionFeature *)objc_loadWeakRetained((id *)&self->_parentTextFeature);
}

- (unint64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setRowIndex:(unint64_t)a3
{
  self->_rowIndex = a3;
}

- (unint64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->_columnIndex = a3;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTextFeature);
}

@end
