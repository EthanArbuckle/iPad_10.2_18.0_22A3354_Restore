@implementation NSValue(CCUILayout)

+ (id)ccui_valueWithLayoutSize:()CCUILayout
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v5, kCCUILayoutSizeObjCType);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ccui_valueWithLayoutPoint:()CCUILayout
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v5, kCCUILayoutPointObjCType);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)ccui_valueWithLayoutRect:()CCUILayout
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", a3, kCCUILayoutRectObjCType);
}

- (uint64_t)ccui_sizeValue
{
  id v1;
  const char *v2;
  const char *v3;
  _QWORD v5[2];
  NSUInteger v6;
  NSUInteger sizep;

  v5[0] = 0;
  v5[1] = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, "objCType");
  v3 = (const char *)kCCUILayoutSizeObjCType;
  v6 = 0;
  sizep = 0;
  NSGetSizeAndAlignment(v2, &sizep, 0);
  NSGetSizeAndAlignment(v3, &v6, 0);
  if (sizep != v6 || strncmp(v2, v3, sizep))
    return 0;
  objc_msgSend(v1, "getValue:", v5);
  return v5[0];
}

- (const)ccui_rectValue
{
  id v3;
  const char *v4;
  const char *v5;
  const char *result;
  NSUInteger v7;
  NSUInteger sizep;

  *a2 = 0u;
  a2[1] = 0u;
  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, "objCType");
  v5 = (const char *)kCCUILayoutRectObjCType;
  v7 = 0;
  sizep = 0;
  NSGetSizeAndAlignment(v4, &sizep, 0);
  result = NSGetSizeAndAlignment(v5, &v7, 0);
  if (sizep == v7)
  {
    result = (const char *)strncmp(v4, v5, sizep);
    if (!(_DWORD)result)
      return (const char *)objc_msgSend(v3, "getValue:", a2);
  }
  return result;
}

- (uint64_t)ccui_pointValue
{
  id v1;
  const char *v2;
  const char *v3;
  _QWORD v5[2];
  NSUInteger v6;
  NSUInteger sizep;

  v5[0] = 0;
  v5[1] = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, "objCType");
  v3 = (const char *)kCCUILayoutPointObjCType;
  v6 = 0;
  sizep = 0;
  NSGetSizeAndAlignment(v2, &sizep, 0);
  NSGetSizeAndAlignment(v3, &v6, 0);
  if (sizep != v6 || strncmp(v2, v3, sizep))
    return 0;
  objc_msgSend(v1, "getValue:", v5);
  return v5[0];
}

@end
