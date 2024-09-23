void sub_226E71B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226E7252C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __ValidateGlyphNode(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t ChildCount;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  const __CFString *v10;
  uint64_t ChildAtIndex;
  int Type;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  uint64_t v23;

  if (CGSVGNodeGetType() != 1)
    goto LABEL_20;
  ChildCount = CGSVGNodeGetChildCount();
  if (!ChildCount)
  {
    v8 = 1;
    return v8 & 1;
  }
  v6 = ChildCount;
  v7 = 0;
  v23 = *MEMORY[0x24BDD0FC8];
  v8 = 1;
  v9 = 0x24BDD1000uLL;
  v10 = CFSTR("Symbol image file %@ contains a text node.");
  while (1)
  {
    ChildAtIndex = CGSVGNodeGetChildAtIndex();
    Type = CGSVGNodeGetType();
    if (Type == 1)
    {
      if ((__ValidateGlyphNode(ChildAtIndex, a2, a3) & 1) == 0)
        goto LABEL_20;
      goto LABEL_14;
    }
    if (Type == 2)
    {
      if (CGSVGShapeNodeGetPrimitive() == 10001)
      {
        v13 = objc_msgSend(*(id *)(v9 + 1992), "stringWithFormat:", v10, a2);
        if (a3)
        {
          v14 = objc_alloc(MEMORY[0x24BDD1540]);
          v15 = v10;
          v16 = v9;
          v17 = CoreThemeDefinitionErrorDomain[0];
          v18 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v13, v23, 0);
          v19 = v17;
          v9 = v16;
          v10 = v15;
          *a3 = objc_msgSend(v14, "initWithDomain:code:userInfo:", v19, 1010, v18);
        }
        NSLog(CFSTR("%@"), v13);
        v8 = 0;
      }
      goto LABEL_14;
    }
    if (Type == 3)
      break;
LABEL_14:
    if (v6 == ++v7)
      return v8 & 1;
  }
  v20 = objc_msgSend(*(id *)(v9 + 1992), "stringWithFormat:", CFSTR("Symbol image file %@ has a custom node."), a2);
  if (a3)
  {
    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    *a3 = objc_msgSend(v21, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v20, v23, 0));
  }
  NSLog(CFSTR("%@"), v20);
LABEL_20:
  v8 = 0;
  return v8 & 1;
}

uint64_t __nodesAreInterpolationCompatible(uint64_t a1, uint64_t a2)
{
  uint64_t ChildCount;
  uint64_t v5;
  uint64_t ChildAtIndex;
  uint64_t v7;
  uint64_t v8;
  unsigned int Primitive;
  int v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  const CGPath *CGPath;
  const CGPath *v16;
  const CGPath *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  char v23;
  uint64_t v25;
  int v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;

  ChildCount = CGSVGNodeGetChildCount();
  if (CGSVGNodeGetChildCount() != ChildCount || CGSVGNodeGetChildCount() != ChildCount)
    return 1;
  if (ChildCount)
  {
    v5 = 0;
    v26 = 1;
    v25 = ChildCount;
    while (1)
    {
      ChildAtIndex = CGSVGNodeGetChildAtIndex();
      v7 = CGSVGNodeGetChildAtIndex();
      v8 = CGSVGNodeGetChildAtIndex();
      if (CGSVGNodeGetType() == 2)
      {
        Primitive = CGSVGShapeNodeGetPrimitive();
        v10 = CGSVGShapeNodeGetPrimitive();
        v11 = CGSVGShapeNodeGetPrimitive();
        v12 = 0;
        if (Primitive != v10 || v11 != v10)
          return v12 & 1;
        if (Primitive <= 0x2D && ((1 << Primitive) & 0x340000000000) != 0)
        {
          v13 = a1;
          v14 = a2;
          CGSVGShapeNodeGetPath();
          CGSVGShapeNodeGetPath();
          CGSVGShapeNodeGetPath();
          CGPath = (const CGPath *)CGSVGPathCreateCGPath();
          v16 = (const CGPath *)CGSVGPathCreateCGPath();
          v17 = (const CGPath *)CGSVGPathCreateCGPath();
          v57 = 0;
          v58 = &v57;
          v59 = 0x2020000000;
          v60 = 0;
          v53 = 0;
          v54 = &v53;
          v55 = 0x2020000000;
          v56 = 0;
          v49 = 0;
          v50 = &v49;
          v51 = 0x2020000000;
          v52 = 0;
          v18 = MEMORY[0x24BDAC760];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = ____nodesAreInterpolationCompatible_block_invoke;
          block[3] = &unk_24EF2BD00;
          block[4] = &v57;
          CGPathApplyWithBlock(CGPath, block);
          v47[0] = v18;
          v47[1] = 3221225472;
          v47[2] = ____nodesAreInterpolationCompatible_block_invoke_2;
          v47[3] = &unk_24EF2BD00;
          v47[4] = &v53;
          CGPathApplyWithBlock(v16, v47);
          v46[0] = v18;
          v46[1] = 3221225472;
          v46[2] = ____nodesAreInterpolationCompatible_block_invoke_3;
          v46[3] = &unk_24EF2BD00;
          v46[4] = &v49;
          CGPathApplyWithBlock(v17, v46);
          v19 = v54[3];
          if (v19)
          {
            a2 = v14;
            if (v58[3] == v19)
            {
              a1 = v13;
              if (v50[3] == v19)
              {
                v42 = 0;
                v43 = &v42;
                v44 = 0x2020000000;
                v45 = 0;
                v20 = malloc_type_calloc(v54[3], 4uLL, 0x100004052888210uLL);
                v21 = MEMORY[0x24BDAC760];
                ChildCount = v25;
                v45 = v20;
                v38 = 0;
                v39 = &v38;
                v40 = 0x2020000000;
                v41 = 0;
                v37[0] = MEMORY[0x24BDAC760];
                v37[1] = 3221225472;
                v37[2] = ____nodesAreInterpolationCompatible_block_invoke_4;
                v37[3] = &unk_24EF2BD28;
                v37[4] = &v42;
                v37[5] = &v38;
                CGPathApplyWithBlock(v16, v37);
                v33 = 0;
                v34 = &v33;
                v35 = 0x2020000000;
                v36 = 1;
                v39[3] = 0;
                v32[0] = v21;
                v32[1] = 3221225472;
                v32[2] = ____nodesAreInterpolationCompatible_block_invoke_5;
                v32[3] = &unk_24EF2BD50;
                v32[4] = &v42;
                v32[5] = &v38;
                v32[6] = &v33;
                CGPathApplyWithBlock(CGPath, v32);
                v28 = 0;
                v29 = &v28;
                v30 = 0x2020000000;
                v31 = 1;
                v39[3] = 0;
                v27[0] = MEMORY[0x24BDAC760];
                v27[1] = 3221225472;
                v27[2] = ____nodesAreInterpolationCompatible_block_invoke_6;
                v27[3] = &unk_24EF2BD50;
                v27[4] = &v42;
                v27[5] = &v38;
                v27[6] = &v28;
                CGPathApplyWithBlock(v17, v27);
                v22 = v26;
                if (!*((_BYTE *)v34 + 24) || !*((_BYTE *)v29 + 24))
                  v22 = 0;
                free((void *)v43[3]);
                CGPathRelease(CGPath);
                CGPathRelease(v16);
                CGPathRelease(v17);
                _Block_object_dispose(&v28, 8);
                _Block_object_dispose(&v33, 8);
                _Block_object_dispose(&v38, 8);
                _Block_object_dispose(&v42, 8);
                v23 = 1;
LABEL_23:
                _Block_object_dispose(&v49, 8);
                _Block_object_dispose(&v53, 8);
                _Block_object_dispose(&v57, 8);
                v26 = v22;
                v12 = v22;
                if ((v23 & 1) == 0)
                  return v12 & 1;
                goto LABEL_24;
              }
              v23 = 0;
              v22 = 0;
LABEL_22:
              ChildCount = v25;
              goto LABEL_23;
            }
            v23 = 0;
            v22 = 0;
          }
          else
          {
            v23 = 0;
            v22 = 0;
            a2 = v14;
          }
          a1 = v13;
          goto LABEL_22;
        }
      }
      else if (CGSVGNodeGetChildCount())
      {
        v26 = __nodesAreInterpolationCompatible(ChildAtIndex, v7, v8);
      }
LABEL_24:
      ++v5;
      v12 = v26;
      if (ChildCount == v5)
        return v12 & 1;
    }
  }
  v12 = 1;
  return v12 & 1;
}

void sub_226E74A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  uint64_t v45;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 200), 8);
  _Block_object_dispose((const void *)(v45 - 168), 8);
  _Block_object_dispose((const void *)(v45 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __interpolateChildShapes(double a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t ChildCount;
  uint64_t result;
  uint64_t i;
  uint64_t ChildAtIndex;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int Type;
  int Primitive;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t Attribute;
  uint64_t v31;
  void *v32;
  uint64_t v33;

  ChildCount = CGSVGNodeGetChildCount();
  result = CGSVGNodeGetChildCount();
  v33 = ChildCount;
  if (result == ChildCount)
  {
    result = CGSVGNodeGetChildCount();
    if (result == ChildCount)
    {
      result = CGSVGNodeGetChildCount();
      if (result == ChildCount)
      {
        if (ChildCount)
        {
          for (i = 0; v33 != i; ++i)
          {
            ChildAtIndex = CGSVGNodeGetChildAtIndex();
            v20 = CGSVGNodeGetChildAtIndex();
            v21 = CGSVGNodeGetChildAtIndex();
            v22 = CGSVGNodeGetChildAtIndex();
            Type = CGSVGNodeGetType();
            result = CGSVGNodeGetChildCount();
            if (result)
              result = __interpolateChildShapes(ChildAtIndex, v20, v21, v22, a1, a2, a3, a4, a5);
            if (Type != 2)
              continue;
            Primitive = CGSVGShapeNodeGetPrimitive();
            if (Primitive > 31)
            {
              if (Primitive == 32)
              {
                CGSVGShapeNodeGetLineGeometry();
                CGSVGShapeNodeGetLineGeometry();
                CGSVGShapeNodeGetLineGeometry();
                CGSVGShapeNodeSetLineGeometry();
              }
              else
              {
                if (Primitive != 49)
                {
LABEL_18:
                  v32 = (void *)CUICreatePathFromSVGShapeNode();
                  v25 = (void *)CUICreatePathFromSVGShapeNode();
                  v26 = (void *)CUICreatePathFromSVGShapeNode();
                  v27 = a8;
                  v28 = a9;
                  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28CB0]), "initWithPointSize:regular:ultralight:black:", v25, v32, v26, a5);
                  objc_msgSend(v29, "pathForScalars:andTransform:", a1, a2, a3, a4);
                  CUIAddPathToSVGShapeNode();

                  a9 = v28;
                  a8 = v27;

                  goto LABEL_19;
                }
                CGSVGShapeNodeGetRectGeometry();
                CGSVGShapeNodeGetRectGeometry();
                CGSVGShapeNodeGetRectGeometry();
                CGSVGShapeNodeSetRectGeometry();
              }
            }
            else if (Primitive == 3)
            {
              CGSVGShapeNodeGetCircleGeometry();
              CGSVGShapeNodeGetCircleGeometry();
              CGSVGShapeNodeGetCircleGeometry();
              CGSVGShapeNodeSetCircleGeometry();
            }
            else
            {
              if (Primitive != 16)
                goto LABEL_18;
              CGSVGShapeNodeGetEllipseGeometry();
              CGSVGShapeNodeGetEllipseGeometry();
              CGSVGShapeNodeGetEllipseGeometry();
              CGSVGShapeNodeSetEllipseGeometry();
            }
LABEL_19:
            CGSVGNodeGetAttributeMap();
            CGSVGNodeGetAttributeMap();
            CGSVGNodeGetAttributeMap();
            Attribute = CGSVGAttributeMapGetAttribute();
            v31 = CGSVGAttributeMapGetAttribute();
            result = CGSVGAttributeMapGetAttribute();
            if (Attribute)
            {
              if (v31)
              {
                if (result)
                {
                  result = CGSVGAttributeGetFloat();
                  if ((_DWORD)result)
                  {
                    result = CGSVGAttributeGetFloat();
                    if ((_DWORD)result)
                    {
                      result = CGSVGAttributeGetFloat();
                      if ((_DWORD)result)
                      {
                        CGSVGAttributeCreateWithFloat();
                        CGSVGNodeSetAttribute();
                        result = CGSVGAttributeRelease();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke_3(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke_4(uint64_t result, int *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a2;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5 + 1;
  *(_DWORD *)(v3 + 4 * v5) = v2;
  return result;
}

_QWORD *____nodesAreInterpolationCompatible_block_invoke_5(_QWORD *result, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  v3 = *(_QWORD *)(result[5] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  v5 = *(_QWORD *)(result[6] + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    if (*a2 != *(_DWORD *)(v2 + 4 * v4))
      *(_BYTE *)(v5 + 24) = 0;
  }
  return result;
}

_QWORD *____nodesAreInterpolationCompatible_block_invoke_6(_QWORD *result, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  v3 = *(_QWORD *)(result[5] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  v5 = *(_QWORD *)(result[6] + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    if (*a2 != *(_DWORD *)(v2 + 4 * v4))
      *(_BYTE *)(v5 + 24) = 0;
  }
  return result;
}

uint64_t indexOfFirstUncommonItemInArrays(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(a2, "count");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = v4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __indexOfFirstUncommonItemInArrays_block_invoke;
  v8[3] = &unk_24EF2C518;
  v8[5] = &v9;
  v8[6] = v5;
  v8[4] = a2;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_226E87BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __valueForAttributeNamed(void *a1, unsigned int a2)
{
  void *v3;
  void *v4;
  uint64_t result;

  v3 = (void *)objc_msgSend(a1, "keySpec");
  switch(a2)
  {
    case 1u:
      v4 = (void *)objc_msgSend(v3, "element");
      goto LABEL_28;
    case 2u:
      v4 = (void *)objc_msgSend(v3, "part");
      goto LABEL_28;
    case 3u:
      v4 = (void *)objc_msgSend(v3, "size");
      goto LABEL_28;
    case 4u:
      v4 = (void *)objc_msgSend(v3, "direction");
      goto LABEL_28;
    case 6u:
      v4 = (void *)objc_msgSend(v3, "value");
      goto LABEL_28;
    case 7u:
      v4 = (void *)objc_msgSend(v3, "appearance");
      goto LABEL_28;
    case 8u:
      LODWORD(result) = objc_msgSend(v3, "dimension1");
      goto LABEL_29;
    case 9u:
      LODWORD(result) = objc_msgSend(v3, "dimension2");
      goto LABEL_29;
    case 0xAu:
    case 0xEu:
      v4 = (void *)objc_msgSend(v3, "state");
      goto LABEL_28;
    case 0xBu:
      v4 = (void *)objc_msgSend(v3, "layer");
      goto LABEL_28;
    case 0xCu:
      LODWORD(result) = objc_msgSend(v3, "scaleFactor");
      goto LABEL_29;
    case 0xDu:
      v4 = (void *)objc_msgSend(v3, "localization");
      goto LABEL_28;
    case 0xFu:
      v4 = (void *)objc_msgSend(v3, "idiom");
      goto LABEL_28;
    case 0x10u:
      LODWORD(result) = objc_msgSend(v3, "subtype");
      goto LABEL_29;
    case 0x11u:
      LODWORD(result) = objc_msgSend(v3, "nameIdentifier");
      goto LABEL_29;
    case 0x12u:
      v4 = (void *)objc_msgSend(v3, "previousValue");
      goto LABEL_28;
    case 0x13u:
      v4 = (void *)objc_msgSend(v3, "previousState");
      goto LABEL_28;
    case 0x14u:
      v4 = (void *)objc_msgSend(v3, "sizeClassHorizontal");
      goto LABEL_28;
    case 0x15u:
      v4 = (void *)objc_msgSend(v3, "sizeClassVertical");
      goto LABEL_28;
    case 0x16u:
      LODWORD(result) = objc_msgSend(v3, "memoryClass");
      goto LABEL_29;
    case 0x17u:
      v4 = (void *)objc_msgSend(v3, "graphicsFeatureSetClass");
      goto LABEL_28;
    case 0x18u:
      v4 = (void *)objc_msgSend(v3, "gamut");
      goto LABEL_28;
    case 0x19u:
      v4 = (void *)objc_msgSend(v3, "target");
      goto LABEL_28;
    case 0x1Au:
      v4 = (void *)objc_msgSend(v3, "glyphWeight");
      goto LABEL_28;
    case 0x1Bu:
      v4 = (void *)objc_msgSend(v3, "glyphSize");
LABEL_28:
      LODWORD(result) = objc_msgSend(v4, "identifier");
LABEL_29:
      result = result;
      break;
    default:
      NSLog(CFSTR("%s called with attribute not in case statement %d"), "__valueForAttributeNamed", a2);
      result = 0;
      break;
  }
  return result;
}

void sub_226E96798(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_226E975BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    if (*(_QWORD *)(v13 + 144))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreThemeDefinition"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Exception Raised during asset import")));
      NSLog(CFSTR("asset import didn't finish Got exception %@"));
      (*(void (**)(void))(*(_QWORD *)(v13 + 144) + 16))();
    }
    objc_end_catch();
    JUMPOUT(0x226E972D4);
  }
  _Unwind_Resume(exception_object);
}

void sub_226E97A78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    if (*(_QWORD *)(v13 + 136))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreThemeDefinition"), 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Exception Raised during asset import (2)")));
      NSLog(CFSTR("asset import didn't finish Got exception %@"));
      (*(void (**)(void))(*(_QWORD *)(v13 + 136) + 16))();
    }
    objc_end_catch();
    JUMPOUT(0x226E97A18);
  }
  _Unwind_Resume(exception_object);
}

void sub_226E9ADC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    NSLog(CFSTR("got exception %@"));
    objc_end_catch();
    JUMPOUT(0x226E9ADA0);
  }
  _Unwind_Resume(exception_object);
}

void sub_226E9D4E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226EA0B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_226EA127C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __indexOfFirstUncommonItemInArrays_block_invoke(uint64_t result, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v6;

  v6 = result;
  if (*(_QWORD *)(result + 48) <= a3
    || (result = objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(result + 32), "objectAtIndex:", a3)),
        (result & 1) == 0))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

double ____indexAreaOverMax_block_invoke(uint64_t a1, void *a2)
{
  double v3;

  v3 = (double)(int)(objc_msgSend(a2, "width") + 2);
  objc_msgSend(a2, "height");
  return v3;
}

uint64_t TDColorSpaceGetExtendedRangeSRGB()
{
  if (TDColorSpaceGetExtendedRangeSRGB___once != -1)
    dispatch_once(&TDColorSpaceGetExtendedRangeSRGB___once, &__block_literal_global_4);
  return TDColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace;
}

void TDSchemaLog(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;

  v10 = getenv("CoreThemeLoggingEnabled");
  if (v10)
  {
    if (*v10 == 49)
      NSLogv(a1, &a9);
  }
}

void sub_226EAB8A8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_226EAB8C8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x226EAB830);
}

_WORD *__CUITransmutePathSlashes(_WORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v2 = *a2;
  if (*a2 >= 2 && *result == 92)
    v3 = 2 * (result[1] == 92);
  else
    v3 = 0;
  if (v3 >= v2)
  {
    v4 = v3;
  }
  else
  {
    v4 = v3;
    while (1)
    {
      v5 = (unsigned __int16)result[v3];
      if (v5 == 47)
        break;
      v8 = v3 + 1;
      result[v4] = v5;
LABEL_16:
      ++v4;
      v3 = v8;
      if (v8 >= v2)
        goto LABEL_20;
    }
    result[v4] = 47;
    if (v2 <= v3 + 1)
      v6 = v3 + 1;
    else
      v6 = v2;
    v7 = v6 - 1;
    while (v7 != v3)
    {
      v8 = v3 + 1;
      v9 = (unsigned __int16)result[++v3];
      if (v9 != 47)
        goto LABEL_16;
    }
    ++v4;
  }
LABEL_20:
  *a2 = v4;
  return result;
}

uint64_t _pathHasDotDot(unsigned __int16 *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v3 = 0;
  v4 = *a1;
  v6 = v4 != 126 && v4 != 47;
  if (a2 >= 2 && !v6)
  {
    if (a3)
    {
      v7 = 3;
      if ((unint64_t)a2 >= 4)
      {
        while (a1[v7] != 47)
        {
          if (a2 == ++v7)
          {
            v7 = a2;
            break;
          }
        }
      }
      v8 = v7 + 1;
      if (a2 <= v7 + 1)
        v9 = v7 + 1;
      else
        v9 = a2;
      v10 = v9 - 1;
      while (v8 < a2)
      {
        v11 = a1[v8++];
        if (v11 == 47)
        {
          v10 = v8 - 2;
          break;
        }
      }
      v12 = v10 + 2;
    }
    else
    {
      v12 = 0;
    }
    if (v12 < a2 - 1)
    {
      do
      {
        v3 = v12 + 1;
        if (a1[v12] == 46 && a1[v3] == 46)
        {
          if (a2 < 3 || v12)
          {
            if (v12 >= 1 && a1[v12 - 1] == 47)
            {
              v13 = v12 + 2;
              v14 = v13 == a2;
              if (v13 < a2)
                v14 = a1[v13] == 47;
              if (v14)
                return 1;
            }
          }
          else
          {
            v3 = 1;
            if (a1[2] == 47)
              return v3;
          }
        }
        v12 = v3;
      }
      while (v3 != a2 - 1);
    }
    return 0;
  }
  return v3;
}

void sub_226EB4470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_226EB89A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226EB9554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  _Unwind_Resume(exception_object);
}

const __CFString *__arrayToString(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  const __CFString *v10;

  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return CFSTR("*");
  v3 = v2;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  for (i = 0; i != v3; ++i)
  {
    v6 = (void *)objc_msgSend(a1, "objectAtIndex:", i);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(v4, "appendString:", CFSTR("("));
      if (v7)
      {
        for (j = 0; j != v7; ++j)
        {
          objc_msgSend(v4, "appendString:", objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", j), "stringValue"));
          if (v7 - 1 != j)
            objc_msgSend(v4, "appendString:", CFSTR(","));
        }
      }
      v9 = v4;
      v10 = CFSTR(")");
    }
    else
    {
      v10 = (const __CFString *)objc_msgSend(v6, "stringValue");
      v9 = v4;
    }
    objc_msgSend(v9, "appendString:", v10);
    if (i != v3 - 1)
      objc_msgSend(v4, "appendString:", CFSTR(","));
  }
  return (const __CFString *)v4;
}

void __midpointQuickPermuteInRange(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v6 = a2 + (a3 >> 1);
  if (a3 < 2)
  {
    if (a3 == 1)
      objc_msgSend(a4, "addObject:", objc_msgSend(a1, "objectAtIndex:", a2));
  }
  else
  {
    v8 = a3 >> 1;
    v9 = a3 + a2 - 1;
    v10 = (void *)MEMORY[0x2276A576C](objc_msgSend(a4, "addObject:", objc_msgSend(a1, "objectAtIndex:", a2 + (a3 >> 1))));
    __midpointQuickPermuteInRange(a1, a2, v8, a4);
    if (v9 > v6)
      __midpointQuickPermuteInRange(a1, v6 + 1, v9 - v6, a4);
    objc_autoreleasePoolPop(v10);
  }
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x24BDE5420]();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return MEMORY[0x24BDE5428]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x24BDBC668](string);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x24BDBD948](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x24BDBD950](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBD960](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x24BDBD980]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x24BDBDB00](colorName);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x24BDBDBC8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

uint64_t CGContextDrawSVGDocument()
{
  return MEMORY[0x24BE28028]();
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x24BDBDFC0]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE148](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

uint64_t CGGetImageIOVersion()
{
  return MEMORY[0x24BDD9008]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x24BDD9068](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD9138](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x24BDBE848](array);
}

BOOL CGPDFArrayGetString(CGPDFArrayRef array, size_t index, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBE880](array, index, value);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x24BDBE8D8](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x24BDBE8E8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x24BDBE900](context);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBE9A0](dict, key, value);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA08](url);
}

uint64_t CGPDFDocumentEnableTaggedStructureSerialization()
{
  return MEMORY[0x24BDBEA18]();
}

CGPDFArrayRef CGPDFDocumentGetID(CGPDFDocumentRef document)
{
  return (CGPDFArrayRef)MEMORY[0x24BDBEA58](document);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBEA60](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x24BDBEAC8](document);
}

uint64_t CGPDFPageContainsWideGamutContent()
{
  return MEMORY[0x24BDBEBA8]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDateRef CGPDFStringCopyDate(CGPDFStringRef string)
{
  return (CFDateRef)MEMORY[0x24BDBED38](string);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x24BDBED40](string);
}

const unsigned __int8 *__cdecl CGPDFStringGetBytePtr(CGPDFStringRef string)
{
  return (const unsigned __int8 *)MEMORY[0x24BDBED48](string);
}

size_t CGPDFStringGetLength(CGPDFStringRef string)
{
  return MEMORY[0x24BDBED50](string);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x24BDBEE10](path, block);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGSVGAtomCopyString()
{
  return MEMORY[0x24BE28030]();
}

uint64_t CGSVGAtomFromString()
{
  return MEMORY[0x24BE28038]();
}

uint64_t CGSVGAttributeCopyString()
{
  return MEMORY[0x24BE28040]();
}

uint64_t CGSVGAttributeCreateWithFloat()
{
  return MEMORY[0x24BE28048]();
}

uint64_t CGSVGAttributeCreateWithString()
{
  return MEMORY[0x24BE28050]();
}

uint64_t CGSVGAttributeCreateWithTransform()
{
  return MEMORY[0x24BE28058]();
}

uint64_t CGSVGAttributeGetFloat()
{
  return MEMORY[0x24BE28068]();
}

uint64_t CGSVGAttributeGetTransform()
{
  return MEMORY[0x24BE28078]();
}

uint64_t CGSVGAttributeMapCopy()
{
  return MEMORY[0x24BE28080]();
}

uint64_t CGSVGAttributeMapEnumerate()
{
  return MEMORY[0x24BE28088]();
}

uint64_t CGSVGAttributeMapGetAttribute()
{
  return MEMORY[0x24BE28090]();
}

uint64_t CGSVGAttributeMapRelease()
{
  return MEMORY[0x24BE28098]();
}

uint64_t CGSVGAttributeMapRemoveAttribute()
{
  return MEMORY[0x24BE280A0]();
}

uint64_t CGSVGAttributeMapSetAttribute()
{
  return MEMORY[0x24BE280A8]();
}

uint64_t CGSVGAttributeRelease()
{
  return MEMORY[0x24BE280B0]();
}

uint64_t CGSVGDocumentAddNamedStyle()
{
  return MEMORY[0x24BE280C0]();
}

uint64_t CGSVGDocumentContainsWideGamutContent()
{
  return MEMORY[0x24BE280C8]();
}

uint64_t CGSVGDocumentCreate()
{
  return MEMORY[0x24BE280D0]();
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x24BE280D8]();
}

uint64_t CGSVGDocumentCreateFromURL()
{
  return MEMORY[0x24BE280E0]();
}

uint64_t CGSVGDocumentGetCanvasSize()
{
  return MEMORY[0x24BE280E8]();
}

uint64_t CGSVGDocumentGetNamedStyle()
{
  return MEMORY[0x24BE280F8]();
}

uint64_t CGSVGDocumentGetRootNode()
{
  return MEMORY[0x24BE28108]();
}

uint64_t CGSVGDocumentRelease()
{
  return MEMORY[0x24BE28118]();
}

uint64_t CGSVGDocumentRetain()
{
  return MEMORY[0x24BE28120]();
}

uint64_t CGSVGDocumentWriteToData()
{
  return MEMORY[0x24BE28128]();
}

uint64_t CGSVGNodeAddChild()
{
  return MEMORY[0x24BE28130]();
}

uint64_t CGSVGNodeCopy()
{
  return MEMORY[0x24BE28138]();
}

uint64_t CGSVGNodeCreate()
{
  return MEMORY[0x24BE28140]();
}

uint64_t CGSVGNodeEnumerate()
{
  return MEMORY[0x24BE28148]();
}

uint64_t CGSVGNodeFindAttribute()
{
  return MEMORY[0x24BE28158]();
}

uint64_t CGSVGNodeFindChildWithCStringIdentifier()
{
  return MEMORY[0x24BE28168]();
}

uint64_t CGSVGNodeFindChildWithStringIdentifier()
{
  return MEMORY[0x24BE28170]();
}

uint64_t CGSVGNodeGetAttributeMap()
{
  return MEMORY[0x24BE28178]();
}

uint64_t CGSVGNodeGetBoundingBox()
{
  return MEMORY[0x24BE28180]();
}

uint64_t CGSVGNodeGetBoundingBoxWithOptions()
{
  return MEMORY[0x24BE28188]();
}

uint64_t CGSVGNodeGetChildAtIndex()
{
  return MEMORY[0x24BE28190]();
}

uint64_t CGSVGNodeGetChildCount()
{
  return MEMORY[0x24BE28198]();
}

uint64_t CGSVGNodeGetParent()
{
  return MEMORY[0x24BE281A0]();
}

uint64_t CGSVGNodeGetType()
{
  return MEMORY[0x24BE281A8]();
}

uint64_t CGSVGNodeRelease()
{
  return MEMORY[0x24BE281B8]();
}

uint64_t CGSVGNodeRetain()
{
  return MEMORY[0x24BE281C0]();
}

uint64_t CGSVGNodeSetAttribute()
{
  return MEMORY[0x24BE281C8]();
}

uint64_t CGSVGNodeSetStringIdentifier()
{
  return MEMORY[0x24BE281D0]();
}

uint64_t CGSVGPathCreateCGPath()
{
  return MEMORY[0x24BE281E8]();
}

uint64_t CGSVGShapeNodeCopyText()
{
  return MEMORY[0x24BE281F8]();
}

uint64_t CGSVGShapeNodeGetCircleGeometry()
{
  return MEMORY[0x24BE28200]();
}

uint64_t CGSVGShapeNodeGetEllipseGeometry()
{
  return MEMORY[0x24BE28210]();
}

uint64_t CGSVGShapeNodeGetLineGeometry()
{
  return MEMORY[0x24BE28228]();
}

uint64_t CGSVGShapeNodeGetPath()
{
  return MEMORY[0x24BE28238]();
}

uint64_t CGSVGShapeNodeGetPrimitive()
{
  return MEMORY[0x24BE28240]();
}

uint64_t CGSVGShapeNodeGetRectGeometry()
{
  return MEMORY[0x24BE28258]();
}

uint64_t CGSVGShapeNodeSetCircleGeometry()
{
  return MEMORY[0x24BE28260]();
}

uint64_t CGSVGShapeNodeSetEllipseGeometry()
{
  return MEMORY[0x24BE28268]();
}

uint64_t CGSVGShapeNodeSetLineGeometry()
{
  return MEMORY[0x24BE28270]();
}

uint64_t CGSVGShapeNodeSetRectGeometry()
{
  return MEMORY[0x24BE28278]();
}

uint64_t CSIEqualMetrics()
{
  return MEMORY[0x24BE28A60]();
}

uint64_t CUIAddPathToSVGShapeNode()
{
  return MEMORY[0x24BE28A70]();
}

uint64_t CUICGImageGetAlphaInfo()
{
  return MEMORY[0x24BE28A78]();
}

uint64_t CUICalcNonAlphaAreaOfImage()
{
  return MEMORY[0x24BE28A80]();
}

uint64_t CUICalculateExtrusionMaskOfImage()
{
  return MEMORY[0x24BE28A88]();
}

uint64_t CUIColorHistogramARGBIntersection()
{
  return MEMORY[0x24BE28A90]();
}

uint64_t CUIColorHistogramARGBIsMonochrome()
{
  return MEMORY[0x24BE28A98]();
}

uint64_t CUICompareRenditionKey()
{
  return MEMORY[0x24BE28AA0]();
}

uint64_t CUIComputeImageColorHistogramARGB()
{
  return MEMORY[0x24BE28AA8]();
}

uint64_t CUIConvertCGImageFormat()
{
  return MEMORY[0x24BE28AB0]();
}

uint64_t CUIConvertDeepImageTo8()
{
  return MEMORY[0x24BE28AB8]();
}

uint64_t CUIConvertFromTXRPixelFormat()
{
  return MEMORY[0x24BE28AC0]();
}

uint64_t CUICreatePathFromSVGNode()
{
  return MEMORY[0x24BE28AC8]();
}

uint64_t CUICreatePathFromSVGShapeNode()
{
  return MEMORY[0x24BE28AD0]();
}

uint64_t CUICreateSDFEdgeTextureFromImage()
{
  return MEMORY[0x24BE28AD8]();
}

uint64_t CUICreateSDFEdgeTexturePixelFormat()
{
  return MEMORY[0x24BE28AE0]();
}

uint64_t CUICreateSDFGradientTextureFromImage()
{
  return MEMORY[0x24BE28AE8]();
}

uint64_t CUICreateSDFGradientTexturePixelFormat()
{
  return MEMORY[0x24BE28AF0]();
}

uint64_t CUICreateSubpathsFromSVGNode()
{
  return MEMORY[0x24BE28AF8]();
}

uint64_t CUICurrentPlatform()
{
  return MEMORY[0x24BE28B00]();
}

uint64_t CUIDeallocateRGBAImageBuffer()
{
  return MEMORY[0x24BE28B08]();
}

uint64_t CUIDefaultThemeRenditionKeyFormat()
{
  return MEMORY[0x24BE28B10]();
}

uint64_t CUIDrawExtrudedImageInContext()
{
  return MEMORY[0x24BE28B18]();
}

uint64_t CUIEdgeInsetsMake()
{
  return MEMORY[0x24BE28B28]();
}

uint64_t CUIEdgeInsetsValid()
{
  return MEMORY[0x24BE28B30]();
}

uint64_t CUIEqualRenditionKeys()
{
  return MEMORY[0x24BE28B38]();
}

uint64_t CUIFillCARKeyArrayForRenditionKey()
{
  return MEMORY[0x24BE28B40]();
}

uint64_t CUIGetFormatForFeatureSetAndPixelFormat()
{
  return MEMORY[0x24BE28B48]();
}

uint64_t CUIGetRGBAImageBuffer()
{
  return MEMORY[0x24BE28B50]();
}

uint64_t CUIImageIsMonochrome()
{
  return MEMORY[0x24BE28B58]();
}

uint64_t CUIImageIsWideGamut()
{
  return MEMORY[0x24BE28B60]();
}

uint64_t CUILogLogToStderr()
{
  return MEMORY[0x24BE28B68]();
}

uint64_t CUIMaxDimensionForVectorGlyph()
{
  return MEMORY[0x24BE28B70]();
}

uint64_t CUIMaxScaleForTargetPlatform()
{
  return MEMORY[0x24BE28B78]();
}

uint64_t CUIMinDimensionForVectorGlyph()
{
  return MEMORY[0x24BE28B80]();
}

uint64_t CUIMinScaleForTargetPlatform()
{
  return MEMORY[0x24BE28B88]();
}

uint64_t CUIParseDeploymentTarget()
{
  return MEMORY[0x24BE28B90]();
}

uint64_t CUIPlatformForPlatformString()
{
  return MEMORY[0x24BE28B98]();
}

uint64_t CUIPlatformNameForPlatform()
{
  return MEMORY[0x24BE28BA0]();
}

uint64_t CUIPointSizeForDimensionForVectorGlyph()
{
  return MEMORY[0x24BE28BA8]();
}

uint64_t CUIPreferredVectorGlyphConfigurationsForPlatform()
{
  return MEMORY[0x24BE28BB0]();
}

uint64_t CUIRenditionKeyCopy()
{
  return MEMORY[0x24BE28BB8]();
}

uint64_t CUIRenditionKeyFormatRemoveAttribute()
{
  return MEMORY[0x24BE28BC0]();
}

uint64_t CUIRenditionKeyHasIdentifier()
{
  return MEMORY[0x24BE28BC8]();
}

uint64_t CUIRenditionKeySetValueForAttribute()
{
  return MEMORY[0x24BE28BD0]();
}

uint64_t CUIRenditionKeyStandardize()
{
  return MEMORY[0x24BE28BD8]();
}

uint64_t CUIRenditionKeyTokenCount()
{
  return MEMORY[0x24BE28BE0]();
}

uint64_t CUIRenditionKeyValueForAttribute()
{
  return MEMORY[0x24BE28BE8]();
}

uint64_t CUISDFTexturesSupported()
{
  return MEMORY[0x24BE28BF0]();
}

uint64_t CUISVGNodeCanBeRepresentedAsPath()
{
  return MEMORY[0x24BE28BF8]();
}

uint64_t CUISystemThemeRenditionKeyFormat()
{
  return MEMORY[0x24BE28C00]();
}

uint64_t CUIThemeInfoVersion()
{
  return MEMORY[0x24BE28C08]();
}

uint64_t CUIWatchSubTypeFallbackOrder()
{
  return MEMORY[0x24BE28C10]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x24BDD0BE8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void NSLogv(NSString *format, va_list args)
{
  MEMORY[0x24BDD1008](format, args);
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x24BDD11D8](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSSize NSSizeFromString(NSString *aString)
{
  double v1;
  double v2;
  NSSize result;

  MEMORY[0x24BDD1220](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x24BDD1270]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSRect NSUnionRect(NSRect aRect, NSRect bRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x24BDD13E0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x24BDAC8F8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x24BDADBB8](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x24BDADBC0]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x24BDADBC8](a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

lldiv_t div(uint64_t __x, uint64_t __y)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x24BDAE050](__x, __y);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x24BDAEF80](a1, *(_QWORD *)&a2);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF90](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFEC8](__dst, __src, __n);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

CGImageRef vImageCreateCGImageFromBuffer(const vImage_Buffer *buf, const vImage_CGImageFormat *format, void (__cdecl *callback)(void *, void *), void *userData, vImage_Flags flags, vImage_Error *error)
{
  return (CGImageRef)MEMORY[0x24BDB38B0](buf, format, callback, userData, *(_QWORD *)&flags, error);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A10](src, dest, tempBuffer, *(_QWORD *)&flags);
}

