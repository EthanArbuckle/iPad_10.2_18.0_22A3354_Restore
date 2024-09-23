@implementation _SSSScrollViewLayoutRects

- (_SSSScrollViewLayoutRects)initWithScrollView:(id)a3 visibleRectInScrollView:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  _SSSScrollViewLayoutRects *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
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
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  objc_super v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40.receiver = self;
  v40.super_class = (Class)_SSSScrollViewLayoutRects;
  v8 = a3;
  v9 = -[_SSSScrollViewLayoutRects init](&v40, "init");
  objc_msgSend(v8, "bounds", v40.receiver, v40.super_class);
  v9->_scrollViewRect.origin.x = v10;
  v9->_scrollViewRect.origin.y = v11;
  v9->_scrollViewRect.size.width = v12;
  v9->_scrollViewRect.size.height = v13;
  v9->_visibleRect.origin.x = x;
  v9->_visibleRect.origin.y = y;
  v9->_visibleRect.size.width = width;
  v9->_visibleRect.size.height = height;
  objc_msgSend(v8, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v8, "contentInset");
  v23 = v15 + v22;
  v25 = v17 + v24;
  v27 = v19 - (v22 + v26);
  v29 = v21 - (v24 + v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
  objc_msgSend(v8, "convertRect:fromView:", v30, v23, v25, v27, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v9->_contentInsetRect.origin.x = v32;
  v9->_contentInsetRect.origin.y = v34;
  v9->_contentInsetRect.size.width = v36;
  v9->_contentInsetRect.size.height = v38;

  return v9;
}

- (double)initWithScrollViewRect:(double)a3 contentInsetRect:(double)a4 visibleRect:(double)a5
{
  char *v25;
  double result;
  objc_super v29;

  v29.receiver = a1;
  v29.super_class = (Class)_SSSScrollViewLayoutRects;
  v25 = (char *)objc_msgSendSuper2(&v29, "init");
  *((double *)v25 + 1) = a2;
  *((double *)v25 + 2) = a3;
  *((double *)v25 + 3) = a4;
  *((double *)v25 + 4) = a5;
  *(_OWORD *)(v25 + 40) = a17;
  *((_QWORD *)v25 + 7) = a18;
  *((_QWORD *)v25 + 8) = a19;
  *((double *)v25 + 9) = a6;
  *((double *)v25 + 10) = a7;
  *((double *)v25 + 11) = a8;
  result = a9;
  *((double *)v25 + 12) = a9;
  return result;
}

- (id)layoutRectsByApplyingTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int128 v11;
  double height;
  double width;
  double y;
  double x;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[_SSSScrollViewLayoutRects scrollViewRect](self, "scrollViewRect");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v17.c = v5;
  *(_OWORD *)&v17.tx = *(_OWORD *)&a3->tx;
  v19 = CGRectApplyAffineTransform(v18, &v17);
  y = v19.origin.y;
  x = v19.origin.x;
  height = v19.size.height;
  width = v19.size.width;
  -[_SSSScrollViewLayoutRects visibleRect](self, "visibleRect");
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v17.c = v6;
  *(_OWORD *)&v17.tx = *(_OWORD *)&a3->tx;
  v21 = CGRectApplyAffineTransform(v20, &v17);
  v7 = v21.origin.x;
  v8 = v21.origin.y;
  v9 = v21.size.width;
  v10 = v21.size.height;
  -[_SSSScrollViewLayoutRects contentInsetRect](self, "contentInsetRect");
  v11 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tx = *(_OWORD *)&a3->tx;
  v23 = CGRectApplyAffineTransform(v22, &v17);
  return -[_SSSScrollViewLayoutRects initWithScrollViewRect:contentInsetRect:visibleRect:]([_SSSScrollViewLayoutRects alloc], "initWithScrollViewRect:contentInsetRect:visibleRect:", x, y, width, height, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height, *(_QWORD *)&v7, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10);
}

- (id)layoutRectsByConvertingFromView:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;

  v6 = a4;
  v7 = a3;
  -[_SSSScrollViewLayoutRects scrollViewRect](self, "scrollViewRect");
  objc_msgSend(v7, "convertRect:toView:", v6);
  v31 = v9;
  v32 = v8;
  v29 = v11;
  v30 = v10;
  -[_SSSScrollViewLayoutRects visibleRect](self, "visibleRect");
  objc_msgSend(v7, "convertRect:toView:", v6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_SSSScrollViewLayoutRects contentInsetRect](self, "contentInsetRect");
  objc_msgSend(v7, "convertRect:toView:", v6);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  return -[_SSSScrollViewLayoutRects initWithScrollViewRect:contentInsetRect:visibleRect:]([_SSSScrollViewLayoutRects alloc], "initWithScrollViewRect:contentInsetRect:visibleRect:", v32, v31, v30, v29, v21, v23, v25, v27, v13, v15, v17, v19);
}

- (CGRect)scrollViewRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollViewRect.origin.x;
  y = self->_scrollViewRect.origin.y;
  width = self->_scrollViewRect.size.width;
  height = self->_scrollViewRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)contentInsetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentInsetRect.origin.x;
  y = self->_contentInsetRect.origin.y;
  width = self->_contentInsetRect.size.width;
  height = self->_contentInsetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
