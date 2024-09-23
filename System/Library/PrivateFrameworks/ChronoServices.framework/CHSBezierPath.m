@implementation CHSBezierPath

- (CHSBezierPath)initWithCGPath:(CGPath *)a3
{
  const CGPath *Mutable;
  uint64_t v6;
  void *v9;
  _QWORD block[5];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSBezierPath.m"), 147, CFSTR("CHSBezierPath created with a nil path reference. path is non-optional!"));

  }
  Mutable = CGPathCreateMutable();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____copyPathByApplying_block_invoke;
  block[3] = &__block_descriptor_40_e36_v16__0r__CGPathElement_i__CGPoint__8l;
  block[4] = Mutable;
  CGPathApplyWithBlock(a3, block);
  v6 = MEMORY[0x194008C34](Mutable);
  CGPathRelease(Mutable);
  return (CHSBezierPath *)-[CHSBezierPath _initWithCGPathNoCopy:](self, "_initWithCGPathNoCopy:", v6);
}

- (id)_initWithCGPathNoCopy:(CGPath *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHSBezierPath;
  result = -[CHSBezierPath init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)CHSBezierPath;
  -[CHSBezierPath dealloc](&v3, sel_dealloc);
}

- (CGPath)cgPath
{
  return self->_path;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  CGPathRef *v4;
  BOOL v5;

  v4 = (CGPathRef *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && CGPathEqualToPath(self->_path, v4[1]);

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  CGPath *path;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  path = self->_path;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  CGPathApply(path, v6, (CGPathApplierFunction)__encodePathElementIntoData);
  if (!v6)
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CHSBezierPath encodeWithBSXPCCoder:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("data"));

}

- (CHSBezierPath)initWithBSXPCCoder:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  CGPath *Mutable;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  BOOL v22;
  float64x2_t *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CHSBezierPath *v34;
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
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  objc_msgSend(v47, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CHSBezierPath initWithBSXPCCoder:].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);

    v3 = 0;
  }
  v12 = v3;
  v13 = objc_msgSend(v12, "length");
  if (!v13)
  {

LABEL_37:
    CHSLogChronoServices();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CHSBezierPath initWithBSXPCCoder:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    v25 = 0;
    goto LABEL_40;
  }
  Mutable = CGPathCreateMutable();
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v15, "bytes");
  v17 = 0;
  v48 = *MEMORY[0x1E0C9D538];
  do
  {
    v18 = *(unsigned int *)(v16 + v17 + 4);
    v19 = *(int *)(v16 + v17);
    v49 = v48;
    v50 = v48;
    v51 = v48;
    if (v19 > 3)
      v20 = 0;
    else
      v20 = dword_18FBD5400[v19];
    v21 = v17 + 8;
    if ((_DWORD)v18)
      v22 = (_DWORD)v18 == v20;
    else
      v22 = 0;
    if (v22)
    {
      v23 = (float64x2_t *)&v49;
      v24 = v18;
      do
      {
        v17 = v21 + 8;
        *v23++ = vcvtq_f64_f32(*(float32x2_t *)(v16 + v21));
        v21 += 8;
        --v24;
      }
      while (v24);
    }
    else
    {
      v17 += 8;
    }
    switch((int)v19)
    {
      case 0:
        if ((_DWORD)v18 != v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPathRef __createPathByDecodingData(NSData *__strong)");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("CHSBezierPath.m"), 86, CFSTR("incorrect number of points for path element type kCGPathElementMoveToPoint"));

        }
        CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v49, *((CGFloat *)&v49 + 1));
        break;
      case 1:
        if ((_DWORD)v18 != v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPathRef __createPathByDecodingData(NSData *__strong)");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("CHSBezierPath.m"), 90, CFSTR("incorrect number of points for path element type kCGPathElementAddLineToPoint"));

        }
        CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v49, *((CGFloat *)&v49 + 1));
        break;
      case 2:
        if ((_DWORD)v18 != v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPathRef __createPathByDecodingData(NSData *__strong)");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("CHSBezierPath.m"), 94, CFSTR("incorrect number of points for path element type kCGPathElementAddQuadCurveToPoint"));

        }
        CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v49, *((CGFloat *)&v49 + 1), *(CGFloat *)&v50, *((CGFloat *)&v50 + 1));
        break;
      case 3:
        if ((_DWORD)v18 != v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPathRef __createPathByDecodingData(NSData *__strong)");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("CHSBezierPath.m"), 98, CFSTR("incorrect number of points for path element type kCGPathElementAddCurveToPoint"));

        }
        CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v49, *((CGFloat *)&v49 + 1), *(CGFloat *)&v50, *((CGFloat *)&v50 + 1), *(CGFloat *)&v51, *((CGFloat *)&v51 + 1));
        break;
      case 4:
        if ((_DWORD)v18 != v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPathRef __createPathByDecodingData(NSData *__strong)");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("CHSBezierPath.m"), 102, CFSTR("incorrect number of points for path element type kCGPathElementCloseSubpath"));

        }
        CGPathCloseSubpath(Mutable);
        break;
      default:
        break;
    }
  }
  while (v17 < v13);
  v25 = MEMORY[0x194008C34](Mutable);
  CGPathRelease(Mutable);

  if (!v25)
    goto LABEL_37;
LABEL_40:
  v34 = -[CHSBezierPath _initWithCGPathNoCopy:](self, "_initWithCGPathNoCopy:", v25);

  return v34;
}

- (void)encodeWithBSXPCCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, a1, a3, "Unexpected got nil data encoding CHSBezierPath", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)initWithBSXPCCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, a1, a3, "Unexpected got nil path decoding CHSBezierPath", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)initWithBSXPCCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, a1, a3, "Unexpected got nil data decoding CHSBezierPath", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
