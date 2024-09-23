@implementation CIFeature

- (CIFeature)init
{
  CIFeature *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIFeature;
  v2 = -[CIFeature init](&v5, sel_init);
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {

    return 0;
  }
  return v2;
}

- (NSString)type
{
  return 0;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)debugDescription
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGRect v17;
  CGRect v18;

  -[CIFeature bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (CGRectIsInfinite(v17))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p [infinite]>\n"), v11, self, v13, v14, v15, v16);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  if (CGRectIsEmpty(v18))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p [empty]>\n"), v11, self, v13, v14, v15, v16);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p [%g %g %g %g]>\n"), v11, self, *(_QWORD *)&v4, *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10);
}

@end
