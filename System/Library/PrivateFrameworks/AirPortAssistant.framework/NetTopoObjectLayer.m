@implementation NetTopoObjectLayer

- (void)initNetTopoObjectLayerCommonWithStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  CGPoint v12;
  CGSize v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  CGColor *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  CGColor *v27;
  CGColor *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  CGColor *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer initNetTopoObjectLayerCommonWithStyle:andOwningView:]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)self);
  self->_topoStyle = a3;
  objc_msgSend_setOwningView_(self, a2, (uint64_t)a4);
  objc_msgSend_setEdgeAntialiasingMask_(self, v11, 0);
  self->_layoutScale = 1.0;
  self->_isExpanded = 1;
  self->_smallSize = 0;
  self->_selectable = 1;
  self->_boundsSizeConstraint = (CGSize)*MEMORY[0x24BDBF148];
  self->_parent = 0;
  self->_children = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = (CGPoint)*MEMORY[0x24BDBF090];
  v13 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_imageFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_imageFrame.size = v13;
  self->_imageSelectionFrame.origin = v12;
  self->_imageSelectionFrame.size = v13;
  self->_selectionColor = sub_21A71CA30(0.0, 0.0, 0.0, 0.3);
  v16 = sub_21A731B64(a4, v14, v15);
  v17 = 20.0;
  v18 = 14.0;
  if (v16 == 1)
  {
    v17 = 14.0;
    v18 = 10.0;
  }
  self->_selectionCornerRadius = v17;
  self->_selectionRectOutset = v18;
  self->_labelUnselectedFillColor = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  self->_labelSelectedFillColor = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  v19 = sub_21A71CA30(1.0, 1.0, 1.0, 0.0);
  self->_labelSelectedFillColor2 = v19;
  if (sub_21A731938((uint64_t)v19, v20, v21))
  {
    v24 = (void *)objc_msgSend__secondaryLabelColor(MEMORY[0x24BDF6950], v22, v23);
    v27 = (CGColor *)objc_msgSend_CGColor(v24, v25, v26);
    v28 = CGColorRetain(v27);
  }
  else
  {
    v28 = sub_21A71CA30(0.305882353, 0.337254902, 0.423529412, 1.0);
  }
  self->_labelUnselectedTextColor = v28;
  v31 = (void *)objc_msgSend__tertiaryLabelColor(MEMORY[0x24BDF6950], v29, v30);
  v34 = (CGColor *)objc_msgSend_CGColor(v31, v32, v33);
  self->_secondaryLabelUnselectedTextColor = CGColorRetain(v34);
  self->_secondaryLabelSelectedTextColor = sub_21A71CA30(0.4, 0.4, 0.4, 1.0);
  self->_labelSelectedTextColor = sub_21A71CA30(1.0, 1.0, 1.0, 1.0);
  objc_msgSend_contentsScale(self, v35, v36);
  objc_msgSend_loadStatusImagesForScale_(self, v37, v38);
  objc_msgSend_setZPosition_(self, v39, v40, 1000.0);
  v43 = sub_21A731B64(a4, v41, v42);
  if (v43 == 2)
    v46 = 292.0;
  else
    v46 = 144.0;
  if (v43 == 2)
    objc_msgSend_setFrame_(self, v44, v45, 0.0, 0.0, 292.0, v46);
  else
    objc_msgSend_setFrame_(self, v44, v45, 0.0, 0.0, 124.0, v46);
}

- (NetTopoObjectLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NetTopoObjectLayer *v11;
  const char *v12;
  NetTopoObjectLayer *v13;
  objc_super v15;

  v9 = *(_QWORD *)&a3;
  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer initWithUIStyle:andOwningView:]", 800, (uint64_t)"\n", v4, v5, v6, v7, (uint64_t)v15.receiver);
  v15.receiver = self;
  v15.super_class = (Class)NetTopoObjectLayer;
  v11 = -[NetTopoObjectLayer init](&v15, sel_init);
  v13 = v11;
  if (v11)
    objc_msgSend_initNetTopoObjectLayerCommonWithStyle_andOwningView_(v11, v12, v9, a4);
  return v13;
}

- (NetTopoObjectLayer)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NetTopoObjectLayer *v7;
  const char *v8;
  NetTopoObjectLayer *v9;
  objc_super v11;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer init]", 800, (uint64_t)"\n", v2, v3, v4, v5, (uint64_t)v11.receiver);
  v11.receiver = self;
  v11.super_class = (Class)NetTopoObjectLayer;
  v7 = -[NetTopoObjectLayer init](&v11, sel_init);
  v9 = v7;
  if (v7)
    objc_msgSend_initNetTopoObjectLayerCommonWithStyle_andOwningView_(v7, v8, 0, 0);
  return v9;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer dealloc]", 800, (uint64_t)"%@\n", v2, v3, v4, v5, (uint64_t)self);

  objc_msgSend_setObjectImage_(self, v7, 0);
  objc_msgSend_deallocStatusImages(self, v8, v9);

  CGColorRelease(self->_selectionColor);
  CGColorRelease(self->_labelUnselectedFillColor);
  CGColorRelease(self->_labelSelectedFillColor);
  CGColorRelease(self->_labelUnselectedTextColor);
  CGColorRelease(self->_labelSelectedTextColor);
  CGColorRelease(self->_labelSelectedFillColor2);
  CGColorRelease(self->_secondaryLabelUnselectedTextColor);
  CGColorRelease(self->_secondaryLabelSelectedTextColor);
  v10.receiver = self;
  v10.super_class = (Class)NetTopoObjectLayer;
  -[NetTopoObjectLayer dealloc](&v10, sel_dealloc);
}

- (void)pickCorrectImagesForContentsScale:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer pickCorrectImagesForContentsScale:]", 800, (uint64_t)"scale = %.1f\n", v4, v5, v6, v7, *(uint64_t *)&a3);
  objc_msgSend_loadStatusImagesForScale_(self, a2, v3, a3);
  v12 = objc_msgSend_statusLightMode(self, v10, v11);
  objc_msgSend_setStatusLightMode_(self, v13, v12);
}

- (NetTopoObjectLayer)parentDevice
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;

  if (!objc_msgSend_parent(self, a2, v2))
    return 0;
  objc_msgSend_parent(self, v4, v5);
  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
    return 0;
  v10 = (void *)objc_msgSend_parent(self, v7, v8);
  return (NetTopoObjectLayer *)objc_msgSend_parent(v10, v11, v12);
}

- (unint64_t)numberOfChildren
{
  uint64_t v2;

  return objc_msgSend_count(self->_children, a2, v2);
}

- (id)childAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer childAtIndex:]", 800, (uint64_t)"index %d  _children %@\n", v3, v4, v5, v6, a3);
  if (objc_msgSend_count(self->_children, a2, a3) <= a3)
    v14 = 0;
  else
    v14 = (void *)objc_msgSend_objectAtIndex_(self->_children, v9, a3);
  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer childAtIndex:]", 800, (uint64_t)"returning foundChild %@\n", v10, v11, v12, v13, (uint64_t)v14);
  return v14;
}

- (id)firstChild
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer firstChild]", 800, (uint64_t)"getting first child for %@\n", v2, v3, v4, v5, (uint64_t)self);
  v11 = (void *)objc_msgSend_childAtIndex_(self, a2, 0);
  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer firstChild]", 800, (uint64_t)"returning firstChild %@\n", v7, v8, v9, v10, (uint64_t)v11);
  return v11;
}

- (id)lastChild
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer lastChild]", 800, (uint64_t)"getting last child for %@\n", v3, v4, v5, v6, (uint64_t)self);
  v8 = objc_msgSend_count(self->_children, a2, v2);
  if (v8)
    v14 = (void *)objc_msgSend_childAtIndex_(self, v9, v8 - 1);
  else
    v14 = 0;
  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer lastChild]", 800, (uint64_t)"returning lastChild %@\n", v10, v11, v12, v13, (uint64_t)v14);
  return v14;
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer insertChild:atIndex:]", 800, (uint64_t)"inserting child %@ at index %d\n", v4, v5, v6, v7, (uint64_t)a3);
  if (objc_msgSend_count(self->_children, a2, (uint64_t)a3) <= a4)
  {
    if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer insertChild:atIndex:]", 800, (uint64_t)"growing child array\n", v12, v13, v14, v15, v22);
    objc_msgSend_addChild_(self, v11, (uint64_t)a3);
  }
  else
  {
    if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
    {
      v16 = objc_msgSend_objectAtIndex_(self->_children, v11, a4);
      sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer insertChild:atIndex:]", 800, (uint64_t)"replacing existing object %@\n", v17, v18, v19, v20, v16);
    }
    objc_msgSend_replaceObjectAtIndex_withObject_(self->_children, v11, a4, a3);
    objc_msgSend_setParent_(a3, v21, (uint64_t)self);
  }
}

- (void)addChild:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  if (objc_msgSend_indexOfObjectIdenticalTo_(self->_children, a2, (uint64_t)a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_addObject_(self->_children, v5, (uint64_t)a3);
    objc_msgSend_setParent_(a3, v10, (uint64_t)self);
  }
  else if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer addChild:]", 800, (uint64_t)"new child %@ is already in the child array\n", v6, v7, v8, v9, (uint64_t)a3);
  }
}

- (void)removeChild:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  const char *v10;

  if (a3 && objc_msgSend_containsObject_(self->_children, a2, (uint64_t)a3))
  {
    objc_msgSend_setParent_(a3, v9, 0);
    objc_msgSend_removeObject_(self->_children, v10, (uint64_t)a3);
  }
  else if (dword_2550F48E8 <= 800 && (dword_2550F48E8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48E8, 0x320u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550F48E8, (uint64_t)"-[NetTopoObjectLayer removeChild:]", 800, (uint64_t)"attempting to remove child %@ that's not in the child array\n", v3, v4, v5, v6, (uint64_t)a3);
  }
}

- (void)setBoundsSizeConstraint:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double height;
  double width;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  height = a3.height;
  width = a3.width;
  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer setBoundsSizeConstraint:]", 800, (uint64_t)"constraint = (w = %.2f h = %.2f)\n", v4, v5, v6, v7, *(uint64_t *)&width);
  self->_boundsSizeConstraint.width = width;
  self->_boundsSizeConstraint.height = height;
  objc_msgSend_setBoundsSizeConstraint_(self->_labelLayer, a2, v3, width, height);
  objc_msgSend_setBoundsSizeConstraint_(self->_secondaryLabelLayer, v11, v12, width, height);
  objc_msgSend_setNeedsLayout(self, v13, v14);
}

- (CGSize)boundsSizeConstraint
{
  double width;
  double height;
  CGSize result;

  width = self->_boundsSizeConstraint.width;
  height = self->_boundsSizeConstraint.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOwningView:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_owningView = a3;
  v4 = (void *)objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  objc_msgSend_setNeedsDisplay(self, a2, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setGhosted:(BOOL)a3
{
  self->_ghosted = a3;
  objc_msgSend_setNeedsDisplay(self, a2, a3);
}

- (BOOL)isGhosted
{
  return self->_ghosted;
}

- (NSString)label
{
  return self->_labelString;
}

- (void)setLabel:(id)a3
{
  BubbleTextLayer *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int topoStyle;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;

  if (!self->_labelLayer)
  {
    v5 = [BubbleTextLayer alloc];
    v8 = objc_msgSend_owningView(self, v6, v7);
    self->_labelLayer = (BubbleTextLayer *)objc_msgSend_initWithOwningView_(v5, v9, v8);
    if (objc_msgSend_smallSize(self, v10, v11))
    {
      v14 = objc_msgSend_setFontSize_(self->_labelLayer, v12, v13, 13.0);
    }
    else
    {
      topoStyle = self->_topoStyle;
      if (topoStyle != 1)
      {
        if (topoStyle)
        {
LABEL_14:
          objc_msgSend_setForegroundColor_(self->_labelLayer, v12, (uint64_t)self->_labelUnselectedTextColor);
          objc_msgSend_addSublayer_(self, v35, (uint64_t)self->_labelLayer);
          goto LABEL_15;
        }
        objc_msgSend_setStatusLightMode_(self, v12, 0);
        v20 = objc_msgSend_setFontSize_(self->_labelLayer, v18, v19, 17.0);
        if (!sub_21A731938(v20, v21, v22))
        {
          objc_msgSend_setFont_(self->_labelLayer, v23, (uint64_t)CFSTR("Helvetica-Bold"));
          goto LABEL_14;
        }
        v25 = (void *)MEMORY[0x24BDF6A70];
        objc_msgSend_fontSize(self->_labelLayer, v23, v24);
        v28 = objc_msgSend_boldSystemFontOfSize_(v25, v26, v27);
LABEL_11:
        objc_msgSend_setFont_(self->_labelLayer, v29, v28);
        goto LABEL_14;
      }
      v14 = objc_msgSend_setFontSize_(self->_labelLayer, v12, v13, 15.0);
    }
    if (!sub_21A731938(v14, v15, v16))
    {
      objc_msgSend_setFont_(self->_labelLayer, v30, (uint64_t)CFSTR("Helvetica"));
      goto LABEL_14;
    }
    v32 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend_fontSize(self->_labelLayer, v30, v31);
    v28 = objc_msgSend_systemFontOfSize_(v32, v33, v34);
    goto LABEL_11;
  }
LABEL_15:
  v36 = a3;

  self->_labelString = (NSString *)a3;
  objc_msgSend_setString_(self->_labelLayer, v37, (uint64_t)a3);
  objc_msgSend_setNeedsLayout(self->_labelLayer, v38, v39);
  objc_msgSend_layoutSublayers(self, v40, v41);
}

- (void)setLabelPinnedHeight:(double)a3
{
  uint64_t v3;

  self->_labelPinnedHeight = a3;
  objc_msgSend_setNeedsLayout(self, a2, v3);
}

- (double)labelPinnedHeight
{
  return self->_labelPinnedHeight;
}

- (NSString)secondaryLabel
{
  return self->_secondaryLabelString;
}

- (void)setSecondaryLabel:(id)a3
{
  BubbleTextLayer *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;

  if (!self->_secondaryLabelLayer)
  {
    v5 = [BubbleTextLayer alloc];
    v8 = objc_msgSend_owningView(self, v6, v7);
    self->_secondaryLabelLayer = (BubbleTextLayer *)objc_msgSend_initWithOwningView_(v5, v9, v8);
    if (objc_msgSend_smallSize(self, v10, v11))
      v14 = objc_msgSend_setFontSize_(self->_secondaryLabelLayer, v12, v13, 11.0);
    else
      v14 = objc_msgSend_setFontSize_(self->_secondaryLabelLayer, v12, v13, 14.0);
    if (sub_21A731938(v14, v15, v16))
    {
      v19 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend_fontSize(self->_secondaryLabelLayer, v17, v18);
      v22 = objc_msgSend_systemFontOfSize_(v19, v20, v21);
      objc_msgSend_setFont_(self->_secondaryLabelLayer, v23, v22);
    }
    else
    {
      objc_msgSend_setFont_(self->_secondaryLabelLayer, v17, (uint64_t)CFSTR("Helvetica"));
    }
    objc_msgSend_setForegroundColor_(self->_secondaryLabelLayer, v24, (uint64_t)self->_secondaryLabelUnselectedTextColor);
    objc_msgSend_addSublayer_(self, v25, (uint64_t)self->_secondaryLabelLayer);
  }
  v26 = a3;

  self->_secondaryLabelString = (NSString *)a3;
  objc_msgSend_setString_(self->_secondaryLabelLayer, v27, (uint64_t)a3);
  objc_msgSend_setNeedsLayout(self->_secondaryLabelLayer, v28, v29);
  objc_msgSend_layoutSublayers(self, v30, v31);
}

- (float)topoProgressValue
{
  float result;

  ((void (*)(TopoProgressBar *, char *))MEMORY[0x24BEDD108])(self->_topoProgressBar, sel_progressValue);
  return result;
}

- (void)setTopoProgressValue:(float)a3
{
  uint64_t v3;
  TopoProgressBar *topoProgressBar;
  TopoProgressBar *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  TopoProgressBar *v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;

  topoProgressBar = self->_topoProgressBar;
  if (!topoProgressBar)
  {
    v7 = [TopoProgressBar alloc];
    v10 = objc_msgSend_owningView(self, v8, v9);
    v12 = (TopoProgressBar *)objc_msgSend_initWithOwningView_(v7, v11, v10);
    self->_topoProgressBar = v12;
    objc_msgSend_addSublayer_(self, v13, (uint64_t)v12);
    topoProgressBar = self->_topoProgressBar;
  }
  *(float *)&v14 = a3;
  objc_msgSend_setProgressValue_(topoProgressBar, a2, v3, v14);
  objc_msgSend_layoutSublayers(self, v15, v16);
}

- (void)setTopoBadgeNumber:(unint64_t)a3
{
  TopoNumberBadge *topoNumberBadge;
  TopoNumberBadge *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  topoNumberBadge = self->_topoNumberBadge;
  if (!topoNumberBadge)
  {
    v6 = [TopoNumberBadge alloc];
    v9 = objc_msgSend_owningView(self, v7, v8);
    topoNumberBadge = (TopoNumberBadge *)objc_msgSend_initWithOwningView_(v6, v10, v9);
    self->_topoNumberBadge = topoNumberBadge;
  }
  objc_msgSend_setCount_(topoNumberBadge, a2, a3);
  self->_topoBadgeNumber = a3;
  MEMORY[0x24BEDD108](self->_labelLayer, sel_setRightAccessoryLayer_, self->_topoNumberBadge);
}

- (void)loadStatusImagesForScale:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer loadStatusImagesForScale:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v28);
  if (!self->_statusLights[0])
  {
    v8 = (void *)MEMORY[0x24BDD1488];
    v9 = objc_opt_class();
    v11 = objc_msgSend_bundleForClass_(v8, v10, v9);
    self->_statusLights[0] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v12, (uint64_t)CFSTR("StatusLightGrayOff.png"), v11);
  }
  if (!self->_statusLights[1])
  {
    v13 = (void *)MEMORY[0x24BDD1488];
    v14 = objc_opt_class();
    v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
    self->_statusLights[1] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v17, (uint64_t)CFSTR("StatusLightAmberOn.png"), v16);
  }
  if (!self->_statusLights[2])
  {
    v18 = (void *)MEMORY[0x24BDD1488];
    v19 = objc_opt_class();
    v21 = objc_msgSend_bundleForClass_(v18, v20, v19);
    self->_statusLights[2] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v22, (uint64_t)CFSTR("StatusLightBlueOn.png"), v21);
  }
  if (!self->_statusLights[3])
  {
    v23 = (void *)MEMORY[0x24BDD1488];
    v24 = objc_opt_class();
    v26 = objc_msgSend_bundleForClass_(v23, v25, v24);
    self->_statusLights[3] = (UIImage *)(id)objc_msgSend_imageNamed_inBundle_(ImageStore, v27, (uint64_t)CFSTR("StatusLightGreenOn.png"), v26);
  }
}

- (void)deallocStatusImages
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSTimer *statusLightTimer;
  id *statusLights;
  uint64_t v10;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer deallocStatusImages]", 800, (uint64_t)"\n", v3, v4, v5, v6, v10);
  statusLightTimer = self->_statusLightTimer;
  if (statusLightTimer)
  {
    objc_msgSend_invalidate(statusLightTimer, a2, v2);
    self->_statusLightTimer = 0;
  }
  statusLights = (id *)self->_statusLights;

  *statusLights = 0;
  statusLights[1] = 0;

  statusLights[2] = 0;
  statusLights[3] = 0;
}

- (void)setStatusBadgeImagePriv:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  CGImage *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  CGImage *v15;
  double Width;
  const char *v17;
  uint64_t v18;
  CGImage *v19;
  double Height;
  const char *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v27;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer setStatusBadgeImagePriv:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v27);
  if (!a3)
  {
    if (!objc_msgSend_image(self->_labelLayer, a2, (uint64_t)a3))
      return;
    objc_msgSend_setImage_(self->_labelLayer, v21, 0);
    goto LABEL_15;
  }
  objc_msgSend_contentsScale(self, a2, (uint64_t)a3);
  v10 = (CGImage *)objc_msgSend_cgImageFromImage_forContentsScale_(ImageStore, v9, (uint64_t)a3);
  if (objc_msgSend_image(self->_labelLayer, v11, v12))
  {
    v15 = (CGImage *)objc_msgSend_image(self->_labelLayer, v13, v14);
    Width = (double)CGImageGetWidth(v15);
    v19 = (CGImage *)objc_msgSend_image(self->_labelLayer, v17, v18);
    Height = (double)CGImageGetHeight(v19);
  }
  else
  {
    Width = *MEMORY[0x24BDBF148];
    Height = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  objc_msgSend_setImage_(self->_labelLayer, v13, (uint64_t)v10);
  v24 = (double)CGImageGetWidth(v10);
  v25 = (double)CGImageGetHeight(v10);
  if (Width != v24 || Height != v25)
LABEL_15:
    objc_msgSend_setNeedsLayout(self, v22, v23);
}

- (UIImage)statusBadgeImage
{
  return self->_statusBadgeImage;
}

- (void)setStatusBadgeImage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  const char *v10;
  uint64_t v11;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer setStatusBadgeImage:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v11);
  v9 = a3;

  self->_statusBadgeImage = (UIImage *)a3;
  objc_msgSend_setStatusLightMode_(self, v10, 1);
}

- (void)setStatusLightStateFromMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  UIImage **p_statusBadgeImage;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer setStatusLightStateFromMode]", 800, (uint64_t)"entered with _statusLightMode = %d\n", v2, v3, v4, v5, self->_statusLightMode);
  switch(self->_statusLightMode)
  {
    case 2u:
      v7 = 1;
      goto LABEL_17;
    case 3u:
      v7 = self->_statusLightState == 0;
      goto LABEL_17;
    case 4u:
      v7 = 3;
      goto LABEL_17;
    case 5u:
      if (self->_statusLightState)
        v7 = 0;
      else
        v7 = 3;
      goto LABEL_17;
    case 6u:
      v7 = 2;
      goto LABEL_17;
    case 7u:
      if (self->_statusLightState == 1)
        v7 = 3;
      else
        v7 = 1;
LABEL_17:
      self->_statusLightState = v7;
      break;
    default:
      v7 = 0;
      self->_statusLightState = 0;
      break;
  }
  if (self->_statusLightMode == 1)
    p_statusBadgeImage = &self->_statusBadgeImage;
  else
    p_statusBadgeImage = &self->_statusLights[v7];
  MEMORY[0x24BEDD108](self, sel_setStatusBadgeImagePriv_, *p_statusBadgeImage);
}

- (void)statusLightUpdateTimer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer statusLightUpdateTimer:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v8);
  MEMORY[0x24BEDD108](self, sel_setStatusLightStateFromMode, a3);
}

- (unsigned)statusLightMode
{
  return self->_statusLightMode;
}

- (void)setStatusLightMode:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSTimer *statusLightTimer;
  float v10;

  v7 = *(_QWORD *)&a3;
  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer setStatusLightMode:]", 800, (uint64_t)"entered with mode = %d\n", v3, v4, v5, v6, v7);
  statusLightTimer = self->_statusLightTimer;
  if (statusLightTimer)
  {
    objc_msgSend_invalidate(statusLightTimer, a2, *(uint64_t *)&a3);
    self->_statusLightTimer = 0;
  }
  self->_statusLightMode = v7;
  if (v7 <= 7)
  {
    if (((1 << v7) & 0x57) == 0)
    {
      v10 = *(float *)"333?";
      if ((_DWORD)v7 != 7)
        v10 = 1.0;
      self->_statusLightInterval = v10;
      self->_statusLightTimer = (NSTimer *)objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], a2, (uint64_t)self, sel_statusLightUpdateTimer_, 0, 1, v10);
    }
    MEMORY[0x24BEDD108](self, sel_setStatusLightStateFromMode, *(_QWORD *)&a3);
  }
}

- (void)setLayoutScale:(double)a3
{
  uint64_t v3;

  self->_layoutScale = a3;
  objc_msgSend_setNeedsLayout(self, a2, v3);
}

- (double)layoutScale
{
  return self->_layoutScale;
}

- (void)layoutSublayers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **p_labelLayer;
  BubbleTextLayer *secondaryLabelLayer;
  double v10;
  double v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  float v20;
  double v21;
  const char *v22;
  uint64_t v23;
  float v24;
  const char *v25;
  uint64_t v26;
  TopoProgressBar *topoProgressBar;
  double v28;
  double v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  float v34;
  double v35;
  const char *v36;
  uint64_t v37;
  float MaxY;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  float v57;
  double v58;
  double v59;
  int v60;
  double v61;
  double v62;
  double v63;
  float v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGImage *v74;
  double v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  double Width;
  const char *v81;
  uint64_t v82;
  double v83;
  double v84;
  double Height;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  int topoStyle;
  double v91;
  double v92;
  float v93;
  CGSize size;
  CGSize v95;
  double v96;
  double v97;
  double v98;
  float v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  float v109;
  float v110;
  float v111;
  CGFloat v112;
  float v113;
  CGFloat v114;
  float v115;
  CGSize v116;
  CGFloat x;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  if (dword_2550F4928 <= 800 && (dword_2550F4928 != -1 || sub_21A69876C((uint64_t)&dword_2550F4928, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4928, (uint64_t)"-[NetTopoObjectLayer layoutSublayers]", 800, (uint64_t)"entered %@\n", v3, v4, v5, v6, (uint64_t)self);
  p_labelLayer = (void **)&self->_labelLayer;
  if (self->_labelLayer || self->_secondaryLabelLayer)
  {
    objc_msgSend_bounds(self, a2, v2);
    if (!CGRectIsEmpty(v121))
    {
      secondaryLabelLayer = self->_secondaryLabelLayer;
      if (secondaryLabelLayer)
      {
        objc_msgSend_preferredFrameSize(secondaryLabelLayer, a2, v2);
        v11 = v10;
        v13 = v12;
        objc_msgSend_textBaselineOffset(self->_secondaryLabelLayer, v14, v15);
        v17 = v16;
        objc_msgSend_bounds(self, v18, v19);
        v20 = (CGRectGetWidth(v122) - v11) * 0.5;
        v21 = ceilf(v20);
        objc_msgSend_bounds(self, v22, v23);
        v24 = CGRectGetMaxY(v123) - v13;
        objc_msgSend_setFrame_(self->_secondaryLabelLayer, v25, v26, v21, ceilf(v24), v11, v13);
        topoProgressBar = self->_topoProgressBar;
        if (topoProgressBar)
        {
          objc_msgSend_preferredFrameSize(topoProgressBar, a2, v2);
          v29 = v28;
          v31 = v30;
          objc_msgSend_bounds(self, v32, v33);
          v34 = (CGRectGetWidth(v124) - v29) * 0.5;
          v35 = ceilf(v34);
          objc_msgSend_bounds(self, v36, v37);
          MaxY = CGRectGetMaxY(v125);
          objc_msgSend_setFrame_(self->_topoProgressBar, v39, v40, v35, ceilf(MaxY), v29, v31);
        }
      }
      else
      {
        v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
        v17 = 0.0;
      }
      if (*p_labelLayer)
      {
        objc_msgSend_preferredFrameSize(*p_labelLayer, a2, v2);
        v42 = v41;
        v44 = v43;
        objc_msgSend_labelPinnedHeight(self, v45, v46);
        if (v49 != 0.0)
        {
          objc_msgSend_labelPinnedHeight(self, v47, v48);
          v44 = v50;
        }
        objc_msgSend_textBaselineOffset(*p_labelLayer, v47, v48);
        v52 = v51;
        objc_msgSend_bounds(self, v53, v54);
        v57 = (CGRectGetWidth(v126) - v42) * 0.5;
        v58 = ceilf(v57);
        v59 = 0.0;
        if (v17 > 0.0)
        {
          v60 = objc_msgSend_smallSize(self, v55, v56);
          v61 = v17 + v44 - v52;
          v62 = 23.0 - v61;
          v63 = 13.0 - v61;
          if (v60)
            v59 = v63;
          else
            v59 = v62;
        }
        objc_msgSend_bounds(self, v55, v56);
        v64 = CGRectGetMaxY(v127) - v44 - v13 - v59;
        objc_msgSend_setFrame_(*p_labelLayer, v65, v66, v58, ceilf(v64), v42, v44);
      }
    }
  }
  v67 = objc_msgSend_objectImage(self, a2, v2);
  if (v67)
  {
    v74 = (CGImage *)v67;
    if (*p_labelLayer || (p_labelLayer = (void **)&self->_secondaryLabelLayer, self->_secondaryLabelLayer))
    {
      objc_msgSend_bounds(self, v68, v69);
      v76 = v75;
      objc_msgSend_frame(*p_labelLayer, v77, v78);
      self->_imageFrame.origin.y = v76 - v79;
    }
    Width = (double)CGImageGetWidth(v74);
    objc_msgSend_contentsScale(self, v81, v82);
    v84 = Width / v83;
    Height = (double)CGImageGetHeight(v74);
    objc_msgSend_contentsScale(self, v86, v87);
    topoStyle = self->_topoStyle;
    v92 = Height / v91;
    if (topoStyle)
    {
      if (topoStyle == 1)
      {
        objc_msgSend_bounds(self, v88, v89);
        v93 = (CGRectGetWidth(v128) - v84) * 0.5;
        self->_imageFrame.origin.x = ceilf(v93);
        self->_imageFrame.size.width = v84;
        self->_imageFrame.size.height = v92;
        size = self->_imageFrame.size;
        self->_imageCoreFrame.origin = self->_imageFrame.origin;
        self->_imageCoreFrame.size = size;
        v95 = self->_imageFrame.size;
        self->_imageSelectionFrame.origin = self->_imageFrame.origin;
        self->_imageSelectionFrame.size = v95;
      }
    }
    else
    {
      v96 = v84 + -60.0;
      v97 = v92 + -60.0;
      objc_msgSend_bounds(self, v88, v89);
      v99 = v98 + (self->_selectionRectOutset + 2.0) * -2.0;
      v102 = sub_21A731B64(self->_owningView, v100, v101);
      v109 = 100.0;
      if (v102 == 2)
        v109 = 260.0;
      v110 = v99 / v109;
      if (dword_2550F4928 <= 800 && (dword_2550F4928 != -1 || sub_21A69876C((uint64_t)&dword_2550F4928, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4928, (uint64_t)"-[NetTopoObjectLayer layoutSublayers]", 800, (uint64_t)"image scale set to %.4f)\n", v105, v106, v107, v108, COERCE__INT64(v110));
      v111 = v96 * v110;
      v112 = floorf(v111);
      v113 = v97 * v110;
      v114 = floorf(v113);
      objc_msgSend_bounds(self, v103, v104);
      v115 = (CGRectGetWidth(v129) - v112) * 0.5;
      self->_imageFrame.origin.x = ceilf(v115);
      self->_imageFrame.origin.y = self->_selectionRectOutset + self->_imageFrame.origin.y;
      self->_imageFrame.size.width = v112;
      self->_imageFrame.size.height = v114;
      v116 = self->_imageFrame.size;
      self->_imageCoreFrame.origin = self->_imageFrame.origin;
      self->_imageCoreFrame.size = v116;
      x = self->_imageFrame.origin.x;
      v116.width = self->_imageFrame.origin.y;
      v118 = self->_imageFrame.size.width;
      v119 = self->_imageFrame.size.height;
      self->_imageSelectionFrame = CGRectInset(*(CGRect *)((char *)&v116 - 8), -self->_selectionRectOutset, -self->_selectionRectOutset);
      v120 = ceilf(v110 * -30.0);
      self->_imageFrame = CGRectInset(self->_imageFrame, v120, v120);
    }
  }
  if (dword_2550F4928 <= 800 && (dword_2550F4928 != -1 || sub_21A69876C((uint64_t)&dword_2550F4928, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4928, (uint64_t)"-[NetTopoObjectLayer layoutSublayers]", 800, (uint64_t)"done %@\n", v70, v71, v72, v73, (uint64_t)self);
}

- (void)drawInContext:(CGContext *)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  BubbleTextLayer *labelLayer;
  const char *v15;
  const char *v16;
  BubbleTextLayer *secondaryLabelLayer;
  int *v18;
  BubbleTextLayer *v19;
  const char *v20;
  const char *v21;
  int isGhosted;
  double v23;
  const char *v24;
  uint64_t v25;
  CGImage *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NetTopoObjectLayer;
  -[NetTopoObjectLayer drawInContext:](&v27, sel_drawInContext_);
  CGContextSaveGState(a3);
  if (!objc_msgSend_objectImage(self, v5, v6))
    goto LABEL_16;
  CGContextScaleCTM(a3, 1.0, -1.0);
  objc_msgSend_bounds(self, v7, v8);
  CGContextTranslateCTM(a3, 0.0, -v9);
  if (objc_msgSend_isSelectable(self, v10, v11) && objc_msgSend_isSelected(self, v12, v13))
  {
    sub_21A71CE0C(a3, self->_imageSelectionFrame.origin.x, self->_imageSelectionFrame.origin.y, self->_imageSelectionFrame.size.width, self->_imageSelectionFrame.size.height, self->_selectionCornerRadius);
    CGContextClosePath(a3);
    CGContextSetFillColorWithColor(a3, self->_selectionColor);
    CGContextDrawPath(a3, kCGPathFill);
    CGContextSetStrokeColorWithColor(a3, self->_secondaryLabelUnselectedTextColor);
    sub_21A71CE0C(a3, self->_imageSelectionFrame.origin.x, self->_imageSelectionFrame.origin.y, self->_imageSelectionFrame.size.width, self->_imageSelectionFrame.size.height, self->_selectionCornerRadius);
    CGContextSetLineWidth(a3, 2.0);
    CGContextClosePath(a3);
    CGContextStrokePath(a3);
    labelLayer = self->_labelLayer;
    if (labelLayer)
    {
      objc_msgSend_setForegroundColor_(labelLayer, v12, (uint64_t)self->_labelSelectedTextColor);
      objc_msgSend_setFillColor_(self->_labelLayer, v15, (uint64_t)self->_labelSelectedFillColor);
      objc_msgSend_setFillColor2_(self->_labelLayer, v16, (uint64_t)self->_labelSelectedFillColor2);
    }
    secondaryLabelLayer = self->_secondaryLabelLayer;
    if (!secondaryLabelLayer)
      goto LABEL_13;
    v18 = &OBJC_IVAR___NetTopoObjectLayer__secondaryLabelSelectedTextColor;
  }
  else
  {
    v19 = self->_labelLayer;
    if (v19)
    {
      objc_msgSend_setForegroundColor_(v19, v12, (uint64_t)self->_labelUnselectedTextColor);
      objc_msgSend_setFillColor_(self->_labelLayer, v20, (uint64_t)self->_labelUnselectedFillColor);
      objc_msgSend_setFillColor2_(self->_labelLayer, v21, 0);
    }
    secondaryLabelLayer = self->_secondaryLabelLayer;
    if (!secondaryLabelLayer)
      goto LABEL_13;
    v18 = &OBJC_IVAR___NetTopoObjectLayer__secondaryLabelUnselectedTextColor;
  }
  objc_msgSend_setForegroundColor_(secondaryLabelLayer, v12, *(uint64_t *)((char *)&self->super.super.isa + *v18));
LABEL_13:
  isGhosted = objc_msgSend_isGhosted(self, v12, v13);
  v23 = 0.3;
  if (!isGhosted)
    v23 = 1.0;
  CGContextSetAlpha(a3, v23);
  v26 = (CGImage *)objc_msgSend_objectImage(self, v24, v25);
  CGContextDrawImage(a3, self->_imageFrame, v26);
LABEL_16:
  CGContextRestoreGState(a3);
}

- ($E32549A47AE6FE03C4AA404FAEB37148)getConnectionAttachmentLocations
{
  CGRect *p_imageSelectionFrame;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  $E32549A47AE6FE03C4AA404FAEB37148 *result;
  CGPoint v11;
  double MinX;
  const char *v13;
  uint64_t v14;
  double MaxY;
  float MidY;
  double v17;
  float MidX;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  const char *v31;
  CGFloat v32;
  CGFloat v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  CGFloat v38;
  CGFloat v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  CGFloat v44;
  CGFloat v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  retstr->var2 = 0u;
  retstr->var3 = 0u;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  p_imageSelectionFrame = &self->_imageSelectionFrame;
  x = self->_imageSelectionFrame.origin.x;
  y = self->_imageSelectionFrame.origin.y;
  width = self->_imageSelectionFrame.size.width;
  height = self->_imageSelectionFrame.size.height;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  result = ($E32549A47AE6FE03C4AA404FAEB37148 *)CGRectIsNull(v54);
  if ((_DWORD)result)
  {
    v11 = (CGPoint)*MEMORY[0x24BDBEFB0];
    retstr->var0 = (CGPoint)*MEMORY[0x24BDBEFB0];
    retstr->var1 = v11;
    retstr->var2 = v11;
    retstr->var3 = v11;
  }
  else
  {
    MinX = CGRectGetMinX(*p_imageSelectionFrame);
    retstr->var0.x = MinX;
    objc_msgSend_bounds(self, v13, v14);
    MaxY = CGRectGetMaxY(v55);
    MidY = CGRectGetMidY(*p_imageSelectionFrame);
    v17 = MaxY - floorf(MidY);
    retstr->var0.y = v17;
    v53 = MinX + CGRectGetWidth(*p_imageSelectionFrame);
    retstr->var1.x = v53;
    retstr->var1.y = v17;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MidX = CGRectGetMidX(v56);
    v19 = floorf(MidX);
    retstr->var2.x = v19;
    objc_msgSend_bounds(self, v20, v21);
    v22 = CGRectGetMaxY(v57);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v25 = v22 - CGRectGetMaxY(v58) + -6.0;
    retstr->var2.y = v25;
    retstr->var3.x = v19;
    if (self->_labelLayer || self->_secondaryLabelLayer)
    {
      objc_msgSend_bounds(self, v23, v24);
      v28 = CGRectGetMaxY(v59);
    }
    else
    {
      objc_msgSend_bounds(self, v23, v24);
      v52 = CGRectGetMaxY(v60);
      v28 = v52 - CGRectGetMinY(*p_imageSelectionFrame);
    }
    v29 = v28 + 4.0;
    retstr->var3.y = v28 + 4.0;
    v30 = objc_msgSend_superlayer(self, v26, v27);
    objc_msgSend_convertPoint_toLayer_(self, v31, v30, MinX, v17);
    retstr->var0.x = v32;
    retstr->var0.y = v33;
    v36 = objc_msgSend_superlayer(self, v34, v35);
    objc_msgSend_convertPoint_toLayer_(self, v37, v36, v53, v17);
    retstr->var1.x = v38;
    retstr->var1.y = v39;
    v42 = objc_msgSend_superlayer(self, v40, v41);
    objc_msgSend_convertPoint_toLayer_(self, v43, v42, v19, v25);
    retstr->var2.x = v44;
    retstr->var2.y = v45;
    v48 = objc_msgSend_superlayer(self, v46, v47);
    result = ($E32549A47AE6FE03C4AA404FAEB37148 *)objc_msgSend_convertPoint_toLayer_(self, v49, v48, v19, v29);
    retstr->var3.x = v50;
    retstr->var3.y = v51;
  }
  return result;
}

- (CGRect)getUserInteractionBounds
{
  uint64_t v2;
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  x = self->_imageCoreFrame.origin.x;
  y = self->_imageCoreFrame.origin.y;
  width = self->_imageCoreFrame.size.width;
  height = self->_imageCoreFrame.size.height;
  objc_msgSend_bounds(self, a2, v2);
  v8 = v7 - height - y;
  v9 = x;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (CGRect)getFrameContainingAllSublayers
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  BubbleTextLayer *labelLayer;
  double v19;
  double x;
  double v21;
  double y;
  double v23;
  CGFloat width;
  double v25;
  CGFloat height;
  BubbleTextLayer *secondaryLabelLayer;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;
  CGRect v44;

  objc_msgSend_frame(self, a2, v2);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"topo frame =(x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&v11);
  labelLayer = self->_labelLayer;
  if (labelLayer)
  {
    objc_msgSend_frame(labelLayer, v4, v5);
    x = v19;
    y = v21;
    width = v23;
    height = v25;
    if (dword_2550F48A8 <= 800 && (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"label frame =(x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&x);
  }
  else
  {
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  secondaryLabelLayer = self->_secondaryLabelLayer;
  if (secondaryLabelLayer)
  {
    objc_msgSend_frame(secondaryLabelLayer, v4, v5);
    v43.origin.x = v28;
    v43.origin.y = v29;
    v43.size.width = v30;
    v43.size.height = v31;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = CGRectUnion(v38, v43);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    v32 = dword_2550F48A8;
    if (dword_2550F48A8 > 800)
      goto LABEL_17;
    if (dword_2550F48A8 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"label frame unioned with secondary frame =(x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&x);
  }
  v32 = dword_2550F48A8;
LABEL_17:
  if (x < 0.0)
  {
    if (v32 <= 800 && (v32 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"label origin outside parent frame\n", v6, v7, v8, v9, v37);
    v40.origin.x = v11 + x;
    v40.origin.y = v13 + y;
    v40.size.width = width;
    v40.size.height = height;
    v44.origin.x = v11;
    v44.origin.y = v13;
    v44.size.width = v15;
    v44.size.height = v17;
    v41 = CGRectUnion(v40, v44);
    v11 = v41.origin.x;
    v13 = v41.origin.y;
    v15 = v41.size.width;
    v17 = v41.size.height;
    v32 = dword_2550F48A8;
  }
  if (v32 <= 800 && (v32 != -1 || sub_21A69876C((uint64_t)&dword_2550F48A8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F48A8, (uint64_t)"-[NetTopoObjectLayer getFrameContainingAllSublayers]", 800, (uint64_t)"final basic frame =(x = %.2f y = %.2f w = %.2f h = %.2f)\n", v6, v7, v8, v9, *(uint64_t *)&v11);
  v33 = v11;
  v34 = v13;
  v35 = v15;
  v36 = v17;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  const char *v5;
  const char *v6;
  objc_super v8;

  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("objectImage")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v5, (uint64_t)CFSTR("selected")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("ghosted")) & 1) != 0)
  {
    return 1;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___NetTopoObjectLayer;
  return objc_msgSendSuper2(&v8, sel_needsDisplayForKey_, a3);
}

- (id)describeOne:(id)a3 uiLayer:(id)a4 indent:(unint64_t)a5
{
  objc_class *v7;
  const char *Name;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;

  v7 = (objc_class *)objc_opt_class();
  Name = class_getName(v7);
  v11 = objc_msgSend_retainCount(a4, v9, v10);
  v14 = objc_msgSend_row(a4, v12, v13);
  v17 = objc_msgSend_column(a4, v15, v16);
  objc_msgSend_appendFormat_(a3, v18, (uint64_t)CFSTR("<%s: %p retains %d> (row=%d col=%d)"), Name, a4, v11, v14, v17);
  return a3;
}

- (id)debugDescription
{
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], a2, (uint64_t)&stru_24DD08368);
  objc_msgSend_describeOne_uiLayer_indent_(self, v4, (uint64_t)v3, self, 0);
  return v3;
}

- (BOOL)smallSize
{
  return self->_smallSize;
}

- (void)setSmallSize:(BOOL)a3
{
  self->_smallSize = a3;
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (unint64_t)column
{
  return self->_column;
}

- (void)setColumn:(unint64_t)a3
{
  self->_column = a3;
}

- (CGPoint)layoutOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_layoutOrigin.x;
  y = self->_layoutOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLayoutOrigin:(CGPoint)a3
{
  self->_layoutOrigin = a3;
}

- (double)prelim
{
  return self->_prelim;
}

- (void)setPrelim:(double)a3
{
  self->_prelim = a3;
}

- (double)mod
{
  return self->_mod;
}

- (void)setMod:(double)a3
{
  self->_mod = a3;
}

- (double)change
{
  return self->_change;
}

- (void)setChange:(double)a3
{
  self->_change = a3;
}

- (double)shift
{
  return self->_shift;
}

- (void)setShift:(double)a3
{
  self->_shift = a3;
}

- (unint64_t)number
{
  return self->_number;
}

- (void)setNumber:(unint64_t)a3
{
  self->_number = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (NetTopoObjectLayer)contourThread
{
  return self->_contourThread;
}

- (void)setContourThread:(id)a3
{
  self->_contourThread = (NetTopoObjectLayer *)a3;
}

- (NetTopoObjectLayer)ancestor
{
  return self->_ancestor;
}

- (void)setAncestor:(id)a3
{
  self->_ancestor = (NetTopoObjectLayer *)a3;
}

- (id)associatedNode
{
  return self->_associatedNode;
}

- (void)setAssociatedNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NetTopoObjectLayer)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
}

- (unint64_t)topoBadgeNumber
{
  return self->_topoBadgeNumber;
}

- (id)userObject
{
  return self->_userObject;
}

- (void)setUserObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (NSString)saveLabel
{
  return self->_saveLabel;
}

- (void)setSaveLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (CGImage)objectImage
{
  return self->_objectImage;
}

- (void)setObjectImage:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

@end
