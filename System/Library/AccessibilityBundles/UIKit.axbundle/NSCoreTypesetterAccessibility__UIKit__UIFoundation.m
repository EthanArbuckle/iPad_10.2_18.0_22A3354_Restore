@implementation NSCoreTypesetterAccessibility__UIKit__UIFoundation

- (CGRect)_stringDrawingCoreTextEngineWithOriginalString:(id)a3 rect:(CGRect)a4 padding:(double)a5 graphicsContext:(id)a6 forceClipping:(BOOL)a7 attributes:(id)a8 stringDrawingOptions:(int64_t)a9 drawingContext:(id)a10 stringDrawingInterface:(id *)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  id v30;
  objc_super v31;
  $2963920F2A8C27706367690942654E5F *v32;
  id v33;
  int64_t v34;
  id v35;
  BOOL v36;
  id v37;
  double v38;
  id location[2];
  NSCoreTypesetterAccessibility__UIKit__UIFoundation *v40;
  CGRect v41;
  __int128 v42;
  __int128 v43;
  CGRect result;

  v41 = a4;
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = a5;
  v37 = 0;
  objc_storeStrong(&v37, a6);
  v36 = a7;
  v35 = 0;
  objc_storeStrong(&v35, a8);
  v34 = a9;
  v33 = 0;
  objc_storeStrong(&v33, a10);
  v32 = a11;
  v42 = 0u;
  v43 = 0u;
  v31.receiver = v40;
  v31.super_class = (Class)NSCoreTypesetterAccessibility__UIKit__UIFoundation;
  -[NSCoreTypesetterAccessibility__UIKit__UIFoundation _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:](&v31, sel__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface_, location[0], v37, v36, v35, v34, v33, v41.origin.x, v41.origin.y, v41.size.width, v41.size.height, v38, a11);
  *(_QWORD *)&v42 = v11;
  *((_QWORD *)&v42 + 1) = v12;
  *(_QWORD *)&v43 = v13;
  *((_QWORD *)&v43 + 1) = v14;
  v30 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(&v30, location[0]);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (id)objc_msgSend(location[0], "string");
      v16 = v30;
      v30 = v15;

    }
  }
  if (objc_msgSend(objc_retainAutorelease(v37), "CGContext") && objc_msgSend(v30, "length"))
  {
    v23 = (void *)MEMORY[0x24BDFFA90];
    v22 = v30;
    v17 = objc_msgSend(objc_retainAutorelease(v37), "CGContext");
    objc_msgSend(v23, "addLabel:boundingRect:withContext:", v22, v17, v42, v43);
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  v19 = *((double *)&v42 + 1);
  v18 = *(double *)&v42;
  v21 = *((double *)&v43 + 1);
  v20 = *(double *)&v43;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSCoreTypesetter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  v3 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSCoreTypesetter"), CFSTR("_stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "d", "@", "B", "@", "q", "@", "^{?=CqBB}", 0);
  objc_storeStrong(v4, v3);
}

@end
