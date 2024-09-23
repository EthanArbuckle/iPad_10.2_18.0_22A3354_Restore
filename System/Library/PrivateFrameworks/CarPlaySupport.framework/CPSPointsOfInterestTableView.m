@implementation CPSPointsOfInterestTableView

- (CPSPointsOfInterestTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CPSPointsOfInterestTableView *v5;
  objc_super v6;
  int64_t v7;
  SEL v8;
  CPSPointsOfInterestTableView *v9;
  CGRect v10;

  v10 = a3;
  v8 = a2;
  v7 = a4;
  v9 = 0;
  v6.receiver = self;
  v6.super_class = (Class)CPSPointsOfInterestTableView;
  v9 = -[CPSPointsOfInterestTableView initWithFrame:style:](&v6, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
    -[CPSPointsOfInterestTableView setScrollEnabled:](v9, "setScrollEnabled:", 1);
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  id v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id obj;
  uint64_t v27;
  _QWORD __b[8];
  id v30;
  id v31;
  objc_super v32;
  int64_t v33;
  id location[2];
  CPSPointsOfInterestTableView *v35;
  _BYTE v36[128];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = a4;
  v32.receiver = v35;
  v32.super_class = (Class)CPSPointsOfInterestTableView;
  -[CPSPointsOfInterestTableView setAccessoryView:atEdge:](&v32, sel_setAccessoryView_atEdge_, location[0], 4);
  if (location[0])
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v31 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    objc_msgSend(v31, "setBackgroundColor:");

    objc_msgSend(location[0], "insertSubview:atIndex:", v31, 0);
    v12 = location[0];
    v25 = (id)objc_msgSend(v31, "topAnchor");
    v24 = (id)objc_msgSend(location[0], "topAnchor");
    v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v37[0] = v23;
    v22 = (id)objc_msgSend(v31, "leftAnchor");
    v21 = (id)objc_msgSend(location[0], "leftAnchor");
    v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
    v37[1] = v20;
    v19 = (id)objc_msgSend(v31, "rightAnchor");
    v18 = (id)objc_msgSend(location[0], "rightAnchor");
    v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v37[2] = v17;
    v16 = (id)objc_msgSend(v31, "bottomAnchor");
    v15 = (id)objc_msgSend(location[0], "bottomAnchor");
    v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v37[3] = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    objc_msgSend(v12, "addConstraints:");

    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location[0], "_CPS_recursiveSubviewsWithClass:", objc_opt_class());
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v27)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v27;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(obj);
        v30 = *(id *)(__b[1] + 8 * v9);
        LODWORD(v5) = 0;
        objc_msgSend(v30, "setCharge:", v5, v10);
        ++v9;
        v10 = v6;
        if (v7 + 1 >= v6)
        {
          v9 = 0;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
          if (!v10)
            break;
        }
      }
    }

    objc_storeStrong(&v31, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  objc_super v4;
  int64_t v5;
  SEL v6;
  CPSPointsOfInterestTableView *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointsOfInterestTableView;
  return -[CPSPointsOfInterestTableView accessoryViewAtEdge:](&v4, sel_accessoryViewAtEdge_, 4);
}

- (id)visibleCells
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  BOOL (*v27)(CGRect *, void *);
  void *v28;
  __int128 v29;
  __int128 v30;
  id v31[5];
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  int v44;
  objc_super v45;
  id v46[2];
  CPSPointsOfInterestTableView *v47;
  id v48;

  v47 = self;
  v46[1] = (id)a2;
  v45.receiver = self;
  v45.super_class = (Class)CPSPointsOfInterestTableView;
  v46[0] = -[CPSPointsOfInterestTableView visibleCells](&v45, sel_visibleCells);
  if (v46[0] && objc_msgSend(v46[0], "count"))
  {
    v42 = 0u;
    v43 = 0u;
    -[CPSPointsOfInterestTableView frame](v47, "frame");
    v38 = v2;
    v39 = v3;
    v40 = v4;
    v41 = v5;
    -[CPSPointsOfInterestTableView _sectionContentInset](v47, "_sectionContentInset");
    v34 = v6;
    v35 = v7;
    v36 = v8;
    v37 = v9;
    *(_QWORD *)&v42 = UIEdgeInsetsInsetRect(v38, v39, v40, v41, v6, v7);
    *((_QWORD *)&v42 + 1) = v10;
    *(_QWORD *)&v43 = v11;
    *((_QWORD *)&v43 + 1) = v12;
    -[CPSPointsOfInterestTableView contentOffset](v47, "contentOffset");
    v31[3] = v13;
    v31[4] = v14;
    -[CPSPointsOfInterestTableView contentOffset](v47, "contentOffset");
    v31[1] = v15;
    v31[2] = v16;
    CGRectMake_8();
    *(_QWORD *)&v32 = v17;
    *((_QWORD *)&v32 + 1) = v18;
    *(_QWORD *)&v33 = v19;
    *((_QWORD *)&v33 + 1) = v20;
    v22 = v46[0];
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __44__CPSPointsOfInterestTableView_visibleCells__block_invoke;
    v28 = &__block_descriptor_64_e32_B32__0__UITableViewCell_8Q16_B24l;
    v29 = v32;
    v30 = v33;
    v23 = (id)objc_msgSend(v46[0], "indexesOfObjectsPassingTest:", &v24);
    v31[0] = (id)objc_msgSend(v22, "objectsAtIndexes:");

    v48 = v31[0];
    v44 = 1;
    objc_storeStrong(v31, 0);
  }
  else
  {
    v48 = MEMORY[0x24BDBD1A8];
    v44 = 1;
  }
  objc_storeStrong(v46, 0);
  return v48;
}

BOOL __44__CPSPointsOfInterestTableView_visibleCells__block_invoke(CGRect *a1, void *a2)
{
  BOOL v4;
  id location[2];
  CGRect v6;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "frame");
  v4 = CGRectIntersectsRect(v6, a1[1]);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
