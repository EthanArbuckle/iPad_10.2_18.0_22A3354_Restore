@implementation AKTwoPointLinePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;

  v9 = (void *)MEMORY[0x24BDBCEB8];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startPoint");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v11, "endPoint");
  v19 = v18;
  v21 = v20;

  objc_msgSend(v10, "geometryHelper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "screenPixelAlignedPointForPoint:", v15, v17);
  v24 = v23;
  v26 = v25;

  objc_msgSend(v10, "geometryHelper");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "screenPixelAlignedPointForPoint:", v19, v21);
  v29 = v28;
  v31 = v30;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v24, v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v32);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v33);

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v29, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v34);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v35);

  v37 = objc_retainAutorelease(v12);
  *a3 = v37;
  v36 = objc_retainAutorelease(v13);
  *a4 = v36;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  unint64_t v5;

  v5 = 10;
  if (a3 != 1)
    v5 = 0;
  if (a3)
    return v5;
  else
    return 9;
}

@end
