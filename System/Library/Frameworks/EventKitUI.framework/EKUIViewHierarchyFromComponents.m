@implementation EKUIViewHierarchyFromComponents

- (EKUIViewHierarchyFromComponents)initWithSize:(CGSize)a3 verticalSizeClass:(int64_t)a4 horizontalSizeClass:(int64_t)a5 interfaceOrientation:(int64_t)a6 tintColor:(id)a7 affineTranform:(CGAffineTransform *)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  EKUIViewHierarchyFromComponents *v17;
  EKUIViewHierarchyFromComponents *v18;
  EKUIViewHierarchy *ekui_rootViewHierarchy;
  __int128 v20;
  __int128 v21;
  objc_super v23;

  height = a3.height;
  width = a3.width;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)EKUIViewHierarchyFromComponents;
  v17 = -[EKUIViewHierarchyFromComponents init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_ekui_size.width = width;
    v17->_ekui_size.height = height;
    v17->_ekui_width = width;
    v17->_ekui_height = height;
    ekui_rootViewHierarchy = v17->_ekui_rootViewHierarchy;
    v17->_ekui_rootViewHierarchy = 0;

    v18->_ekui_horizontalSizeClass = a5;
    v18->_ekui_verticalSizeClass = a4;
    v18->_ekui_interfaceOrientation = a6;
    objc_storeStrong((id *)&v18->_ekui_tintColor, a7);
    v20 = *(_OWORD *)&a8->a;
    v21 = *(_OWORD *)&a8->tx;
    *(_OWORD *)&v18->_ekui_affineTransform.c = *(_OWORD *)&a8->c;
    *(_OWORD *)&v18->_ekui_affineTransform.tx = v21;
    *(_OWORD *)&v18->_ekui_affineTransform.a = v20;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKUIViewHierarchyFromComponents)initWithCoder:(id)a3
{
  id v5;
  EKUIViewHierarchyFromComponents *v6;
  CGFloat v7;
  CGFloat v8;
  EKUIViewHierarchy *ekui_rootViewHierarchy;
  uint64_t v10;
  UIColor *ekui_tintColor;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  CGFloat v18;
  void *v19;
  float v20;
  CGFloat v21;
  void *v22;
  float v23;
  CGFloat v24;
  void *v25;
  float v26;
  CGFloat v27;
  void *v28;
  float v29;
  CGFloat v30;
  void *v31;
  float v32;
  CGFloat v33;
  void *v34;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)EKUIViewHierarchyFromComponents;
  v6 = -[EKUIViewHierarchyFromComponents init](&v36, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeCGSizeForKey:", CFSTR("size"));
    v6->_ekui_size.width = v7;
    v6->_ekui_size.height = v8;
    v6->_ekui_width = v7;
    v6->_ekui_height = v8;
    ekui_rootViewHierarchy = v6->_ekui_rootViewHierarchy;
    v6->_ekui_rootViewHierarchy = 0;

    v6->_ekui_verticalSizeClass = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("verticalSizeClass"));
    v6->_ekui_horizontalSizeClass = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("horizontalSizeClass"));
    v6->_ekui_interfaceOrientation = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("interfaceOrientation"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    ekui_tintColor = v6->_ekui_tintColor;
    v6->_ekui_tintColor = (UIColor *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("affineTransform"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count") == 6)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v24 = v23;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      v27 = v26;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v30 = v29;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;

      v6->_ekui_affineTransform.a = v18;
      v6->_ekui_affineTransform.b = v21;
      v6->_ekui_affineTransform.c = v24;
      v6->_ekui_affineTransform.d = v27;
      v6->_ekui_affineTransform.tx = v30;
      v6->_ekui_affineTransform.ty = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EKUIViewHierarchy.m"), 135, CFSTR("affineTransform serialized array must only contain 6 elements"));

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  double height;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  width = self->_ekui_size.width;
  height = self->_ekui_size.height;
  v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("size"), width, height);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_ekui_verticalSizeClass, CFSTR("verticalSizeClass"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_ekui_horizontalSizeClass, CFSTR("horizontalSizeClass"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_ekui_interfaceOrientation, CFSTR("interfaceOrientation"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_ekui_tintColor, CFSTR("tintColor"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ekui_affineTransform.a);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ekui_affineTransform.b);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ekui_affineTransform.c);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ekui_affineTransform.d);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ekui_affineTransform.tx);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ekui_affineTransform.ty);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("affineTransform"));
}

- (CGSize)ekui_size
{
  double width;
  double height;
  CGSize result;

  width = self->_ekui_size.width;
  height = self->_ekui_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEkui_size:(CGSize)a3
{
  self->_ekui_size = a3;
}

- (double)ekui_width
{
  return self->_ekui_width;
}

- (void)setEkui_width:(double)a3
{
  self->_ekui_width = a3;
}

- (double)ekui_height
{
  return self->_ekui_height;
}

- (void)setEkui_height:(double)a3
{
  self->_ekui_height = a3;
}

- (EKUIViewHierarchy)ekui_rootViewHierarchy
{
  return self->_ekui_rootViewHierarchy;
}

- (void)setEkui_rootViewHierarchy:(id)a3
{
  objc_storeStrong((id *)&self->_ekui_rootViewHierarchy, a3);
}

- (int64_t)ekui_horizontalSizeClass
{
  return self->_ekui_horizontalSizeClass;
}

- (void)setEkui_horizontalSizeClass:(int64_t)a3
{
  self->_ekui_horizontalSizeClass = a3;
}

- (int64_t)ekui_verticalSizeClass
{
  return self->_ekui_verticalSizeClass;
}

- (void)setEkui_verticalSizeClass:(int64_t)a3
{
  self->_ekui_verticalSizeClass = a3;
}

- (int64_t)ekui_interfaceOrientation
{
  return self->_ekui_interfaceOrientation;
}

- (void)setEkui_interfaceOrientation:(int64_t)a3
{
  self->_ekui_interfaceOrientation = a3;
}

- (UIColor)ekui_tintColor
{
  return self->_ekui_tintColor;
}

- (void)setEkui_tintColor:(id)a3
{
  objc_storeStrong((id *)&self->_ekui_tintColor, a3);
}

- (CGAffineTransform)ekui_affineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (void)setEkui_affineTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_ekui_affineTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_ekui_affineTransform.tx = v4;
  *(_OWORD *)&self->_ekui_affineTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ekui_tintColor, 0);
  objc_storeStrong((id *)&self->_ekui_rootViewHierarchy, 0);
}

@end
