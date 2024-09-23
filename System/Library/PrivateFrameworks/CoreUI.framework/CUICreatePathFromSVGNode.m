@implementation CUICreatePathFromSVGNode

void __CUICreatePathFromSVGNode_block_invoke(_QWORD *a1, uint64_t a2, int a3, _BYTE *a4)
{
  __int128 v6;
  uint64_t AttributeMap;
  uint64_t Attribute;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform v15;
  CGAffineTransform v16;

  if (a3)
  {
    if (a1[8] == a2)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "lastObject");
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeLastObject");
  }
  else
  {
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v16.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v16.c = v6;
    *(_OWORD *)&v16.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    AttributeMap = CGSVGNodeGetAttributeMap(a2);
    if (AttributeMap)
    {
      Attribute = CGSVGAttributeMapGetAttribute(AttributeMap, 63);
      if (Attribute)
        CGSVGAttributeGetTransform(Attribute, &v16);
    }
    memset(&v15, 0, sizeof(v15));
    v9 = a1[4];
    v10 = *(void **)(*(_QWORD *)(v9 + 8) + 40);
    if (v10)
    {
      objc_msgSend(v10, "cgAffineTransformValue");
      v9 = a1[4];
    }
    else
    {
      memset(&t2, 0, sizeof(t2));
    }
    v13 = v16;
    CGAffineTransformConcat(&v15, &v13, &t2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(v9 + 8) + 40));
    v13 = v15;
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = +[NSValue valueWithCGAffineTransform:](NSValue, "valueWithCGAffineTransform:", &v13);
    if (a1[8] == a2)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v13 = v15;
      v11 = CUICreatePathFromSVGShapeNode(a2, &v13);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v11);

      }
    }
  }
}

@end
