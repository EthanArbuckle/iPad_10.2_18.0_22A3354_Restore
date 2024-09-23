@implementation LKNSValueCodingProxy

- (id)decodedObject
{
  void *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[5];
  _OWORD v14[4];
  _OWORD v15[8];
  uint64_t v16;

  v2 = 0;
  v16 = *MEMORY[0x1E0C80C00];
  switch(self->_kind)
  {
    case 0:
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", self->_u.point.x, self->_u.point.y);
    case 1:
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", self->_u.point.x, self->_u.point.y);
    case 2:
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_u.point.x, self->_u.point.y, self->_u.rect.size.width, self->_u.rect.size.height);
    case 3:
      v4 = *((_OWORD *)&self->_u.affine_transform + 5);
      v15[4] = *((_OWORD *)&self->_u.affine_transform + 4);
      v15[5] = v4;
      v5 = *((_OWORD *)&self->_u.affine_transform + 7);
      v15[6] = *((_OWORD *)&self->_u.affine_transform + 6);
      v15[7] = v5;
      v6 = *(_OWORD *)&self->_u.affine_transform.c;
      v15[0] = self->_u.point;
      v15[1] = v6;
      v7 = *((_OWORD *)&self->_u.affine_transform + 3);
      v15[2] = *(_OWORD *)&self->_u.affine_transform.tx;
      v15[3] = v7;
      v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v15);
      goto LABEL_10;
    case 8:
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAPoint3D:", self->_u.point.x, self->_u.point.y, self->_u.rect.size.width);
    case 9:
      v9 = *((_OWORD *)&self->_u.affine_transform + 3);
      v13[2] = *(_OWORD *)&self->_u.affine_transform.tx;
      v13[3] = v9;
      v13[4] = *((_OWORD *)&self->_u.affine_transform + 4);
      v10 = *(_OWORD *)&self->_u.affine_transform.c;
      v13[0] = self->_u.point;
      v13[1] = v10;
      v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v13);
      goto LABEL_10;
    case 0xA:
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_u, "{CGAffineTransform=dddddd}");
    case 0xB:
      v11 = *(_OWORD *)&self->_u.affine_transform.c;
      v14[0] = self->_u.point;
      v14[1] = v11;
      v12 = *((_OWORD *)&self->_u.affine_transform + 3);
      v14[2] = *(_OWORD *)&self->_u.affine_transform.tx;
      v14[3] = v12;
      v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCACornerRadii:", v14);
LABEL_10:
      v2 = (void *)v8;
      break;
    default:
      return v2;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKNSValueCodingProxy)initWithCoder:(id)a3
{
  LKNSValueCodingProxy *v4;
  int v5;
  float v6;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *p_u;
  const __CFString *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  int v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  __int128 v77;
  __int128 v78;
  objc_super v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v80.receiver = self;
  v80.super_class = (Class)LKNSValueCodingProxy;
  v4 = -[LKNSValueCodingProxy init](&v80, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("kind"));
    v4->_kind = v5;
    switch(v5)
    {
      case 0:
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("x"));
        p_u = &v4->_u;
        v4->_u.point.x = v6;
        v8 = CFSTR("y");
        goto LABEL_5;
      case 1:
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("width"));
        p_u = &v4->_u;
        v4->_u.point.x = v9;
        v8 = CFSTR("height");
LABEL_5:
        objc_msgSend(a3, "decodeFloatForKey:", v8);
        p_u->point.y = v10;
        return v4;
      case 2:
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("x"));
        v4->_u.point.x = v11;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("y"));
        v4->_u.point.y = v12;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("width"));
        v4->_u.rect.size.width = v13;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("height"));
        v4->_u.rect.size.height = v14;
        return v4;
      case 3:
        if (objc_msgSend(a3, "containsValueForKey:", CFSTR("m11")))
        {
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m11"));
          v4->_u.point.x = v15;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m12"));
          v4->_u.point.y = v16;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m13"));
          v4->_u.rect.size.width = v17;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m14"));
          v4->_u.rect.size.height = v18;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m21"));
          v4->_u.transform.m21 = v19;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m22"));
          v4->_u.transform.m22 = v20;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m23"));
          v4->_u.transform.m23 = v21;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m24"));
          v4->_u.transform.m24 = v22;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m31"));
          v4->_u.transform.m31 = v23;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m32"));
          v4->_u.transform.m32 = v24;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m33"));
          v4->_u.transform.m33 = v25;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m34"));
          v4->_u.transform.m34 = v26;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m41"));
          v4->_u.transform.m41 = v27;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m42"));
          v4->_u.transform.m42 = v28;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m43"));
          v4->_u.transform.m43 = v29;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m44"));
          v4->_u.transform.m44 = v30;
        }
        else
        {
          v4->_u.transform = CATransform3DIdentity;
        }
        return v4;
      case 5:
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("x"));
        v4->_u.point.x = v31;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("y"));
        v4->_u.point.y = v32;
        v4->_kind = 0;
        return v4;
      case 6:
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("width"));
        v4->_u.point.x = v33;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("height"));
        v4->_u.point.y = v34;
        v35 = 1;
        goto LABEL_12;
      case 7:
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("x"));
        v4->_u.point.x = v36;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("y"));
        v4->_u.point.y = v37;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("width"));
        v4->_u.rect.size.width = v38;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("height"));
        v4->_u.rect.size.height = v39;
        v35 = 2;
LABEL_12:
        v4->_kind = v35;
        break;
      case 8:
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("x"));
        v4->_u.point.x = v40;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("y"));
        v4->_u.point.y = v41;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("z"));
        v4->_u.rect.size.width = v42;
        break;
      case 9:
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m11"));
        v4->_u.color_matrix.m11 = v43;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m12"));
        v4->_u.color_matrix.m12 = v44;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m13"));
        v4->_u.color_matrix.m13 = v45;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m14"));
        v4->_u.color_matrix.m14 = v46;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m15"));
        v4->_u.color_matrix.m15 = v47;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m21"));
        v4->_u.color_matrix.m21 = v48;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m22"));
        v4->_u.color_matrix.m22 = v49;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m23"));
        v4->_u.color_matrix.m23 = v50;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m24"));
        v4->_u.color_matrix.m24 = v51;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m25"));
        v4->_u.color_matrix.m25 = v52;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m31"));
        v4->_u.color_matrix.m31 = v53;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m32"));
        v4->_u.color_matrix.m32 = v54;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m33"));
        v4->_u.color_matrix.m33 = v55;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m34"));
        v4->_u.color_matrix.m34 = v56;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m35"));
        v4->_u.color_matrix.m35 = v57;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m41"));
        v4->_u.color_matrix.m41 = v58;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m42"));
        v4->_u.color_matrix.m42 = v59;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m43"));
        v4->_u.color_matrix.m43 = v60;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m44"));
        v4->_u.color_matrix.m44 = v61;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("m45"));
        v4->_u.color_matrix.m45 = v62;
        break;
      case 10:
        if (objc_msgSend(a3, "containsValueForKey:", CFSTR("a")))
        {
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("a"));
          v4->_u.point.x = v63;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("b"));
          v4->_u.point.y = v64;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("c"));
          v4->_u.rect.size.width = v65;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("d"));
          v4->_u.rect.size.height = v66;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("tx"));
          v4->_u.transform.m21 = v67;
          objc_msgSend(a3, "decodeFloatForKey:", CFSTR("ty"));
          v4->_u.transform.m22 = v68;
        }
        else
        {
          v78 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v77 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v4->_u.point = (CGPoint)*MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v4->_u.affine_transform.c = v78;
          *(_OWORD *)&v4->_u.affine_transform.tx = v77;
        }
        break;
      case 11:
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("min_max_w"));
        v4->_u.point.x = v69;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("min_max_h"));
        v4->_u.point.y = v70;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("max_max_w"));
        v4->_u.rect.size.width = v71;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("max_max_h"));
        v4->_u.rect.size.height = v72;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("max_min_w"));
        v4->_u.transform.m21 = v73;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("max_min_h"));
        v4->_u.transform.m22 = v74;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("min_min_w"));
        v4->_u.transform.m23 = v75;
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("min_min_h"));
        v4->_u.transform.m24 = v76;
        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (LKNSValueCodingProxy)initWithObject:(id)a3
{
  LKNSValueCodingProxy *v4;
  const char *v5;
  const char *v6;
  int v7;
  int *p_kind;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGPoint v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)LKNSValueCodingProxy;
  v4 = -[LKNSValueCodingProxy init](&v27, sel_init);
  if (!v4)
    return v4;
  v5 = (const char *)objc_msgSend(a3, "objCType");
  v6 = v5;
  if (!v5)
  {
    if (strcmp(0, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      p_kind = &v4->_kind;
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  if (!strcmp(v5, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    v4->_kind = 2;
    objc_msgSend(a3, "rectValue");
    v4->_u.point.x = v9;
    v4->_u.point.y = v10;
    v4->_u.rect.size.width = v11;
    v4->_u.rect.size.height = v12;
    return v4;
  }
  if (!strcmp(v6, "{CGPoint=dd}"))
  {
    v4->_kind = 0;
    objc_msgSend(a3, "pointValue");
LABEL_21:
    v4->_u.point.x = v13;
    v4->_u.point.y = v14;
    return v4;
  }
  if (!strcmp(v6, "{CGSize=dd}"))
  {
    v4->_kind = 1;
    objc_msgSend(a3, "sizeValue");
    goto LABEL_21;
  }
  if (!strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
  {
    v4->_kind = 3;
    if (a3)
    {
      objc_msgSend(a3, "CATransform3DValue");
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = (CGPoint)0;
      v20 = 0u;
    }
    *(_OWORD *)&v4->_u.affine_transform.tx = v21;
    *((_OWORD *)&v4->_u.affine_transform + 3) = v22;
    v4->_u.point = v19;
    *(_OWORD *)&v4->_u.affine_transform.c = v20;
    *((_OWORD *)&v4->_u.affine_transform + 6) = v25;
    *((_OWORD *)&v4->_u.affine_transform + 7) = v26;
    *((_OWORD *)&v4->_u.affine_transform + 4) = v23;
    *((_OWORD *)&v4->_u.affine_transform + 5) = v24;
  }
  else
  {
    if (!strcmp(v6, "{CAPoint3D=ddd}"))
    {
      v4->_kind = 8;
      objc_msgSend(a3, "CAPoint3DValue");
      v4->_u.point.x = v15;
      v4->_u.point.y = v16;
      v4->_u.rect.size.width = v17;
      return v4;
    }
    if (strcmp(v6, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
    {
      if (strcmp(v6, "{CAColorMatrix=ffffffffffffffffffff}"))
      {
        v7 = strcmp(v6, "{CGAffineTransform=dddddd}");
        p_kind = &v4->_kind;
        if (!v7)
        {
          *p_kind = 10;
          if (a3)
          {
            objc_msgSend(a3, "CA_CGAffineTransformValue");
          }
          else
          {
            v20 = 0u;
            v21 = 0u;
            v19 = (CGPoint)0;
          }
          v4->_u.point = v19;
          *(_OWORD *)&v4->_u.affine_transform.c = v20;
          *(_OWORD *)&v4->_u.affine_transform.tx = v21;
          return v4;
        }
LABEL_15:
        *p_kind = 4;
        NSLog(CFSTR("CoreAnimation: unable to encode NSValue of type %s"), v6);
        return v4;
      }
LABEL_17:
      v4->_kind = 9;
      if (a3)
      {
        objc_msgSend(a3, "CAColorMatrixValue");
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v19 = (CGPoint)0;
      }
      v4->_u.point = v19;
      *((_OWORD *)&v4->_u.affine_transform + 3) = v22;
      *((_OWORD *)&v4->_u.affine_transform + 4) = v23;
      *(_OWORD *)&v4->_u.affine_transform.c = v20;
      *(_OWORD *)&v4->_u.affine_transform.tx = v21;
      return v4;
    }
    v4->_kind = 11;
    if (a3)
    {
      objc_msgSend(a3, "CACornerRadiiValue");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = (CGPoint)0;
      v20 = 0u;
    }
    *(_OWORD *)&v4->_u.affine_transform.tx = v21;
    *((_OWORD *)&v4->_u.affine_transform + 3) = v22;
    v4->_u.point = v19;
    *(_OWORD *)&v4->_u.affine_transform.c = v20;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *p_u;
  double x;
  double y;
  const __CFString *v9;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v10;
  double v11;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v12;
  double v13;
  double v14;
  double width;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double m24;
  double m31;
  double m32;
  double m33;
  double m34;
  double m41;
  double m42;
  double m43;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v32;
  double v33;
  double v34;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v35;
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
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v54;
  __int128 v55;
  double v56;
  double v57;
  double v58;
  double height;
  double m21;
  double m22;
  $91B18C3BF41CF8C5EA0ADC8C81D26934 *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double m23;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  CGAffineTransform v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "encodeInt:forKey:", self->_kind, CFSTR("kind"));
  switch(self->_kind)
  {
    case 0:
      p_u = &self->_u;
      x = p_u->point.x;
      *(float *)&x = p_u->point.x;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("x"), x);
      y = p_u->point.y;
      *(float *)&y = y;
      v9 = CFSTR("y");
      goto LABEL_14;
    case 1:
      v10 = &self->_u;
      v11 = v10->point.x;
      *(float *)&v11 = v10->point.x;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("width"), v11);
      y = v10->point.y;
      goto LABEL_5;
    case 2:
      v12 = &self->_u;
      v13 = v12->point.x;
      *(float *)&v13 = v12->point.x;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("x"), v13);
      v14 = v12->point.y;
      *(float *)&v14 = v14;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("y"), v14);
      width = v12->rect.size.width;
      *(float *)&width = width;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("width"), width);
      y = v12->rect.size.height;
LABEL_5:
      *(float *)&y = y;
      v9 = CFSTR("height");
      goto LABEL_14;
    case 3:
      v16 = &self->_u;
      v17 = v16->point.x;
      if (v16->point.x != 1.0)
        goto LABEL_7;
      v70 = 1;
      break;
    case 8:
      v32 = &self->_u;
      v33 = v32->point.x;
      *(float *)&v33 = v32->point.x;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("x"), v33);
      v34 = v32->point.y;
      *(float *)&v34 = v34;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("y"), v34);
      y = v32->rect.size.width;
      *(float *)&y = y;
      v9 = CFSTR("z");
      goto LABEL_14;
    case 9:
      v35 = &self->_u;
      *(float *)&v5 = v35->color_matrix.m11;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m11"), v5);
      *(float *)&v36 = v35->color_matrix.m12;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m12"), v36);
      *(float *)&v37 = v35->color_matrix.m13;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m13"), v37);
      *(float *)&v38 = v35->color_matrix.m14;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m14"), v38);
      *(float *)&v39 = v35->color_matrix.m15;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m15"), v39);
      *(float *)&v40 = v35->color_matrix.m21;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m21"), v40);
      *(float *)&v41 = v35->color_matrix.m22;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m22"), v41);
      *(float *)&v42 = v35->color_matrix.m23;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m23"), v42);
      *(float *)&v43 = v35->color_matrix.m24;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m24"), v43);
      *(float *)&v44 = v35->color_matrix.m25;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m25"), v44);
      *(float *)&v45 = v35->color_matrix.m31;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m31"), v45);
      *(float *)&v46 = v35->color_matrix.m32;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m32"), v46);
      *(float *)&v47 = v35->color_matrix.m33;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m33"), v47);
      *(float *)&v48 = v35->color_matrix.m34;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m34"), v48);
      *(float *)&v49 = v35->color_matrix.m35;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m35"), v49);
      *(float *)&v50 = v35->color_matrix.m41;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m41"), v50);
      *(float *)&v51 = v35->color_matrix.m42;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m42"), v51);
      *(float *)&v52 = v35->color_matrix.m43;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m43"), v52);
      *(float *)&v53 = v35->color_matrix.m44;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m44"), v53);
      *(float *)&y = v35->color_matrix.m45;
      v9 = CFSTR("m45");
      goto LABEL_14;
    case 0xA:
      v54 = &self->_u;
      v55 = *(_OWORD *)&v54->affine_transform.c;
      *(CGPoint *)&v74.a = v54->point;
      *(_OWORD *)&v74.c = v55;
      *(_OWORD *)&v74.tx = *(_OWORD *)&v54->affine_transform.tx;
      if (!CGAffineTransformIsIdentity(&v74))
      {
        v56 = v54->point.x;
        *(float *)&v56 = v54->point.x;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("a"), v56);
        v57 = v54->point.y;
        *(float *)&v57 = v57;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("b"), v57);
        v58 = v54->rect.size.width;
        *(float *)&v58 = v58;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("c"), v58);
        height = v54->rect.size.height;
        *(float *)&height = height;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("d"), height);
        m21 = v54->transform.m21;
        *(float *)&m21 = m21;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("tx"), m21);
        m22 = v54->transform.m22;
        *(float *)&m22 = m22;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("ty"), m22);
      }
      return;
    case 0xB:
      v62 = &self->_u;
      v63 = v62->point.x;
      *(float *)&v63 = v62->point.x;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("min_max_w"), v63);
      v64 = v62->point.y;
      *(float *)&v64 = v64;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("min_max_h"), v64);
      v65 = v62->rect.size.width;
      *(float *)&v65 = v65;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("max_max_w"), v65);
      v66 = v62->rect.size.height;
      *(float *)&v66 = v66;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("max_max_h"), v66);
      v67 = v62->transform.m21;
      *(float *)&v67 = v67;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("max_min_w"), v67);
      v68 = v62->transform.m22;
      *(float *)&v68 = v68;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("max_min_h"), v68);
      m23 = v62->transform.m23;
      *(float *)&m23 = m23;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("min_min_w"), m23);
      y = v62->transform.m24;
      *(float *)&y = y;
      v9 = CFSTR("min_min_h");
      goto LABEL_14;
    default:
      return;
  }
  while (v70 != 16)
  {
    v71 = v70;
    v72 = *(&v16->point.x + v70);
    v73 = *(&CATransform3DIdentity.m11 + v70++);
    if (v72 != v73)
    {
      if ((unint64_t)(v71 - 1) <= 0xE)
      {
LABEL_7:
        *(float *)&v17 = v17;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m11"), v17);
        v18 = v16->point.y;
        *(float *)&v18 = v18;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m12"), v18);
        v19 = v16->rect.size.width;
        *(float *)&v19 = v19;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m13"), v19);
        v20 = v16->rect.size.height;
        *(float *)&v20 = v20;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m14"), v20);
        v21 = v16->transform.m21;
        *(float *)&v21 = v21;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m21"), v21);
        v22 = v16->transform.m22;
        *(float *)&v22 = v22;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m22"), v22);
        v23 = v16->transform.m23;
        *(float *)&v23 = v23;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m23"), v23);
        m24 = v16->transform.m24;
        *(float *)&m24 = m24;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m24"), m24);
        m31 = v16->transform.m31;
        *(float *)&m31 = m31;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m31"), m31);
        m32 = v16->transform.m32;
        *(float *)&m32 = m32;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m32"), m32);
        m33 = v16->transform.m33;
        *(float *)&m33 = m33;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m33"), m33);
        m34 = v16->transform.m34;
        *(float *)&m34 = m34;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m34"), m34);
        m41 = v16->transform.m41;
        *(float *)&m41 = m41;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m41"), m41);
        m42 = v16->transform.m42;
        *(float *)&m42 = m42;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m42"), m42);
        m43 = v16->transform.m43;
        *(float *)&m43 = m43;
        objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("m43"), m43);
        y = v16->transform.m44;
        *(float *)&y = y;
        v9 = CFSTR("m44");
LABEL_14:
        objc_msgSend(a3, "encodeFloat:forKey:", v9, y);
      }
      return;
    }
  }
}

@end
