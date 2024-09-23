@implementation UIBezierPath(OBAdditions)

- (void)ax_enumerateElementsUsingBlock:()OBAdditions
{
  id v4;
  id info;

  v4 = objc_retainAutorelease(a1);
  info = a3;
  CGPathApply((CGPathRef)objc_msgSend(v4, "CGPath"), info, (CGPathApplierFunction)CGPathEnumerationCallback);

}

- (id)ax_description
{
  id v1;
  const CGPath *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  CGRect PathBoundingBox;
  CGRect BoundingBox;
  CGRect v22;
  CGRect v23;

  v1 = objc_retainAutorelease(a1);
  v2 = (const CGPath *)objc_msgSend(v1, "CGPath");
  PathBoundingBox = CGPathGetPathBoundingBox(v2);
  x = PathBoundingBox.origin.x;
  y = PathBoundingBox.origin.y;
  width = PathBoundingBox.size.width;
  height = PathBoundingBox.size.height;
  BoundingBox = CGPathGetBoundingBox(v2);
  v7 = BoundingBox.origin.x;
  v8 = BoundingBox.origin.y;
  v9 = BoundingBox.size.width;
  v10 = BoundingBox.size.height;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("%@ <%p>\n"), objc_opt_class(), v1);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  NSStringFromCGRect(v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("  Bounds: %@\n"), v12);

  v23.origin.x = v7;
  v23.origin.y = v8;
  v23.size.width = v9;
  v23.size.height = v10;
  NSStringFromCGRect(v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("  Control Point Bounds: %@\n"), v13);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __43__UIBezierPath_OBAdditions__ax_description__block_invoke;
  v17[3] = &unk_24FF86B08;
  v18 = v11;
  v19 = v1;
  v14 = v11;
  objc_msgSend(v1, "ax_enumerateElementsUsingBlock:", v17);
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (__CFString)ax_descriptionForPathElement:()OBAdditions
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  __CFString *result;
  uint64_t *v9;
  _QWORD *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  switch(*(_DWORD *)a3)
  {
    case 0:
      v3 = *(uint64_t **)(a3 + 8);
      v4 = *v3;
      v5 = v3[1];
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("moveto");
      goto LABEL_5;
    case 1:
      v9 = *(uint64_t **)(a3 + 8);
      v4 = *v9;
      v5 = v9[1];
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("lineto");
LABEL_5:
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%f %f %@"), v4, v5, v7, v12, v13, v14, v15);
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f %f %f %f %@"), **(_QWORD **)(a3 + 8), *(_QWORD *)(*(_QWORD *)(a3 + 8) + 8), *(_QWORD *)(*(_QWORD *)(a3 + 8) + 16), *(_QWORD *)(*(_QWORD *)(a3 + 8) + 24), CFSTR("quadcurveto"), v14, v15);
      goto LABEL_8;
    case 3:
      v10 = *(_QWORD **)(a3 + 8);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f %f %f %f %f %f %@"), *v10, v10[1], v10[2], v10[3], v10[4], v10[5], CFSTR("curveto"));
LABEL_8:
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      v11 = CFSTR("closepath");
LABEL_10:
      result = v11;
      break;
    default:
      result = (__CFString *)0;
      break;
  }
  return result;
}

@end
