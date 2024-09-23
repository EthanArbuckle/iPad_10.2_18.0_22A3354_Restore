@implementation NTKComplicationLayoutRule

- (id)initForDevice:(id)a3
{
  id result;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKComplicationLayoutRule;
  result = -[NTKLayoutRule initForDevice:](&v8, sel_initForDevice_, a3);
  if (result)
  {
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)((char *)result + 104) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)((char *)result + 120) = v6;
    v7 = *(_OWORD *)(v4 + 32);
    *(_OWORD *)((char *)result + 136) = v7;
    *(_OWORD *)((char *)result + 168) = v6;
    *(_OWORD *)((char *)result + 184) = v7;
    *(_OWORD *)((char *)result + 152) = v5;
  }
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id result;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  *((CGFloat *)result + 9) = top;
  *((CGFloat *)result + 10) = left;
  *((CGFloat *)result + 11) = bottom;
  *((CGFloat *)result + 12) = right;
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id result;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:clip:", a3, a5, a6, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  *((CGFloat *)result + 9) = top;
  *((CGFloat *)result + 10) = left;
  *((CGFloat *)result + 11) = bottom;
  *((CGFloat *)result + 12) = right;
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8 editingTransform:(CGAffineTransform *)a9
{
  id result;
  __int128 v11;
  __int128 v12;

  result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", a3, a5, a6, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7.top, a7.left, a7.bottom, a7.right);
  v12 = *(_OWORD *)&a9->c;
  v11 = *(_OWORD *)&a9->tx;
  *(_OWORD *)((char *)result + 104) = *(_OWORD *)&a9->a;
  *(_OWORD *)((char *)result + 120) = v12;
  *(_OWORD *)((char *)result + 136) = v11;
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8 contentTransform:(CGAffineTransform *)a9
{
  id result;
  __int128 v11;
  __int128 v12;

  result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", a3, a5, a6, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7.top, a7.left, a7.bottom, a7.right);
  v12 = *(_OWORD *)&a9->c;
  v11 = *(_OWORD *)&a9->tx;
  *(_OWORD *)((char *)result + 152) = *(_OWORD *)&a9->a;
  *(_OWORD *)((char *)result + 168) = v12;
  *(_OWORD *)((char *)result + 184) = v11;
  return result;
}

- (unint64_t)hash
{
  double v3;
  __int128 v4;
  void *v5;
  double v6;
  __int128 v7;
  void *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKComplicationLayoutRule;
  v3 = round(self->_keylinePadding.bottom * 1000000.0)
     + (double)-[NTKLayoutRule hash](&v14, sel_hash)
     + round(self->_keylinePadding.left * 10000000.0)
     + round(self->_keylinePadding.right * 100000000.0)
     + round(self->_keylinePadding.top * 1000000000.0);
  v4 = *(_OWORD *)&self->_editingTransform.c;
  v11 = *(_OWORD *)&self->_editingTransform.a;
  v12 = v4;
  v13 = *(_OWORD *)&self->_editingTransform.tx;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 + (double)(unint64_t)objc_msgSend(v5, "hash") * 1.0e10;
  v7 = *(_OWORD *)&self->_contentTransform.c;
  v11 = *(_OWORD *)&self->_contentTransform.a;
  v12 = v7;
  v13 = *(_OWORD *)&self->_contentTransform.tx;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (unint64_t)(v6 + (double)(unint64_t)objc_msgSend(v8, "hash") * 1.0e11);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  BOOL v10;
  __int128 v12;
  CGAffineTransform *p_contentTransform;
  BOOL v14;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform t2;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKComplicationLayoutRule;
  if (!-[NTKLayoutRule isEqual:](&v20, sel_isEqual_, v4))
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  objc_msgSend(v4, "keylinePadding");
  v9 = self->_keylinePadding.left == v8 && self->_keylinePadding.top == v5;
  v10 = v9 && self->_keylinePadding.right == v7;
  if (!v10 || self->_keylinePadding.bottom != v6)
    goto LABEL_20;
  if (v4)
    objc_msgSend(v4, "editingTransform");
  else
    memset(&t2, 0, sizeof(t2));
  v12 = *(_OWORD *)&self->_editingTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_editingTransform.a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_editingTransform.tx;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    p_contentTransform = &self->_contentTransform;
    if (v4)
      objc_msgSend(v4, "contentTransform");
    else
      memset(&v17, 0, sizeof(v17));
    v16 = *(_OWORD *)&p_contentTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_contentTransform->a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_contentTransform->tx;
    v14 = CGAffineTransformEqualToTransform(&t1, &v17);
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationLayoutRule;
  result = -[NTKLayoutRule copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = *(_OWORD *)&self->_keylinePadding.bottom;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_keylinePadding.top;
  *(_OWORD *)((char *)result + 88) = v5;
  v6 = *(_OWORD *)&self->_editingTransform.a;
  v7 = *(_OWORD *)&self->_editingTransform.tx;
  *(_OWORD *)((char *)result + 120) = *(_OWORD *)&self->_editingTransform.c;
  *(_OWORD *)((char *)result + 136) = v7;
  *(_OWORD *)((char *)result + 104) = v6;
  v8 = *(_OWORD *)&self->_contentTransform.tx;
  v9 = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)((char *)result + 168) = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)((char *)result + 184) = v8;
  *(_OWORD *)((char *)result + 152) = v9;
  return result;
}

- (UIEdgeInsets)keylinePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_keylinePadding.top;
  left = self->_keylinePadding.left;
  bottom = self->_keylinePadding.bottom;
  right = self->_keylinePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGAffineTransform)editingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setEditingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_editingTransform.c = v4;
  *(_OWORD *)&self->_editingTransform.tx = v3;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
}

@end
