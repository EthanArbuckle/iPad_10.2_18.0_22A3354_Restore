@implementation AKFlexibleLinePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  objc_super v28;
  id v29;
  id v30;

  v29 = 0;
  v30 = 0;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___AKFlexibleLinePointOfInterestHelper;
  v9 = a6;
  v10 = a5;
  objc_msgSendSuper2(&v28, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v30, &v29, v10, v9);
  v11 = v30;
  v12 = v29;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count", v28.receiver, v28.super_class) + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v11);
  objc_msgSend(v14, "addObjectsFromArray:", v12);
  objc_msgSend(v10, "midPoint");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v9, "geometryHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "screenPixelAlignedPointForPoint:", v16, v18);
  v21 = v20;
  v23 = v22;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v24);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v25);

  v26 = objc_retainAutorelease(v13);
  *a3 = v26;
  v27 = objc_retainAutorelease(v14);
  *a4 = v27;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  objc_super v12;

  v8 = a4;
  v9 = a5;
  if (a3 >= 2)
  {
    if (a3 == 2)
      v10 = 11;
    else
      v10 = 0;
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___AKFlexibleLinePointOfInterestHelper;
    v10 = (unint64_t)objc_msgSendSuper2(&v12, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3, v8, v9);
  }

  return v10;
}

@end
