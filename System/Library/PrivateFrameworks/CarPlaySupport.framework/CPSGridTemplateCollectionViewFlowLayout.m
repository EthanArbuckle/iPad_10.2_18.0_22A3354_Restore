@implementation CPSGridTemplateCollectionViewFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;
  CPSGridTemplateCollectionViewFlowLayout *v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, void *, unint64_t);
  void *v16;
  id v17[2];
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  objc_super v25;
  id v26[2];
  CPSGridTemplateCollectionViewFlowLayout *v27;
  CGRect v28;

  v28 = a3;
  v27 = self;
  v26[1] = (id)a2;
  v25.receiver = self;
  v25.super_class = (Class)CPSGridTemplateCollectionViewFlowLayout;
  v26[0] = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v25, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v24 = objc_msgSend(v26[0], "count");
  if (v24)
  {
    v9 = v27;
    v10 = (id)-[CPSGridTemplateCollectionViewFlowLayout collectionView](v27, "collectionView");
    objc_msgSend(v10, "frame");
    v19 = v3;
    v20 = v4;
    v21 = v5;
    v22 = v6;
    v23 = -[CPSGridTemplateCollectionViewFlowLayout gridItemLayoutInRect:numberOfItems:](v9, "gridItemLayoutInRect:numberOfItems:", v24, v3, v4, v5, v6);

    v18 = (void *)objc_msgSend(v23, "count");
    v11 = v26[0];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __77__CPSGridTemplateCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
    v16 = &unk_24E270518;
    v17[1] = v18;
    v17[0] = v23;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v12);
    objc_storeStrong(v17, 0);
    objc_storeStrong(&v23, 0);
  }
  v8 = v26[0];
  objc_storeStrong(v26, 0);
  return v8;
}

void __77__CPSGridTemplateCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a3 < *(_QWORD *)(a1 + 40))
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    objc_msgSend(v7, "CGRectValue");
    objc_msgSend(location[0], "setFrame:", v3, v4, v5, v6);

  }
  objc_storeStrong(location, 0);
}

- (id)gridItemLayoutInRect:(CGRect)a3 numberOfItems:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v39;
  id v40;
  id v41;
  double v42;
  BOOL v43;
  BOOL v44;
  double Width;
  double v46;
  double Height;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  unint64_t i;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  unint64_t j;
  double v63;
  double v64;
  unint64_t v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  CGRect rect;
  double v72;
  double v73;
  id location;
  unint64_t v75;
  SEL v76;
  CPSGridTemplateCollectionViewFlowLayout *v77;
  CGRect v78;
  id v79;

  v78 = a3;
  v77 = self;
  v76 = a2;
  v75 = a4;
  location = (id)objc_opt_new();
  Width = CGRectGetWidth(v78);
  -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
  v46 = Width - v4;
  -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
  v73 = v46 - v5;
  Height = CGRectGetHeight(v78);
  -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
  v48 = Height - v6;
  -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
  v72 = v48 - v7;
  -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
  -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
  CGRectMake_2();
  rect.origin.x = v8;
  rect.origin.y = v9;
  rect.size.width = v10;
  rect.size.height = v11;
  -[CPSGridTemplateCollectionViewFlowLayout preferredItemWidth](v77, "preferredItemWidth");
  v69 = v12;
  v13 = CGRectGetWidth(rect) / v12;
  v68 = vcvtms_s32_f32(v13);
  v14 = CGRectGetHeight(rect) / 60.0;
  v67 = vcvtms_s32_f32(v14);
  while (v68 * v67 < v75)
  {
    ++v68;
    v15 = v72 / 60.0;
    v67 = vcvtms_s32_f32(v15);
    -[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing");
    v69 = (v73 - (double)(v68 - 1) * v16) / (double)v68;
  }
  if (v75 > v68
    || (-[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing"),
        v73 < (double)v75 + -1.0 * v17 + (double)v75 * v69))
  {
    while (1)
    {
      if ((uint64_t)v75 % v68 > 0 || (v44 = 0, v75 > 2) && (v44 = 0, ceil((double)(v75 / v68)) < (double)v67))
      {
        v44 = 0;
        if (v68 - 1 >= (uint64_t)v75 % v68)
          v44 = v68 > 2;
      }
      if (!v44)
        break;
      v18 = (double)v75 / ((double)v68 - 1.0);
      v66 = ceilf(v18);
      v65 = v68 - 1;
      -[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing");
      v64 = (v73 - (double)(v68 - 2) * v19) / (double)(v68 - 1);
      if (v66 * 60.0 > v72)
        break;
      --v68;
      -[CPSGridTemplateCollectionViewFlowLayout preferredItemWidth](v77, "preferredItemWidth");
      if (v64 >= v20)
      {
        v43 = 0;
        if (v75 % v65)
          v43 = v75 % (v65 - 1) == 0;
        if (!v43)
          break;
      }
    }
  }
  else
  {
    v67 = 1;
  }
  if (v68 >= 1)
  {
    -[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing");
    if (v67 == 1)
      v70 = (v73 - (double)(v75 - 1) * v21) / (double)v75;
    else
      v70 = (v73 - (double)(v68 - 1) * v21) / (double)v68;
    if (v75 > v68)
    {
      -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
      v57 = v29;
      v30 = (double)v75 / (double)v68;
      v56 = v72 / (double)(uint64_t)vcvtps_s32_f32(v30) + 1.0;
      CGPointMake();
      v54 = v31;
      v55 = v32;
      for (i = 0; i < v75; ++i)
      {
        CGRectMake_2();
        v49 = v33;
        v50 = v34;
        v51 = v35;
        v52 = v36;
        if ((uint64_t)(i + 1) % v68)
        {
          -[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing");
          v54 = v54 + v70 + v37;
        }
        else
        {
          v55 = v55 + v56;
          v54 = v57;
        }
        v40 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v49, v50, v51, v52, location);
        objc_msgSend(v39, "addObject:");

      }
    }
    else
    {
      CGRectGetMidX(rect);
      CGRectGetMidY(rect);
      CGPointMake();
      -[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing");
      v42 = (v73 - (double)(v75 - 1) * v22 - (double)v75 * v70) / 2.0;
      -[UICollectionViewFlowLayout sectionInset](v77, "sectionInset");
      v63 = v42 + v23;
      for (j = 0; j < v75; ++j)
      {
        CGRectMake_2();
        v58 = v24;
        v59 = v25;
        v60 = v26;
        v61 = v27;
        -[UICollectionViewFlowLayout minimumInteritemSpacing](v77, "minimumInteritemSpacing");
        v63 = v63 + v70 + v28;
        v41 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v58, v59, v60, v61);
        objc_msgSend(location, "addObject:");

      }
    }
  }
  v79 = location;
  objc_storeStrong(&location, 0);
  return v79;
}

- (double)preferredItemWidth
{
  return self->_preferredItemWidth;
}

- (void)setPreferredItemWidth:(double)a3
{
  self->_preferredItemWidth = a3;
}

@end
