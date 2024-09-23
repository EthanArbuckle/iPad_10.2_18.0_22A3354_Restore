@implementation CPSAlternateRoutesView

- (CPSAlternateRoutesView)initWithFrame:(CGRect)a3
{
  CPSAlternateRoutesView *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;
  SEL v21;
  CPSAlternateRoutesView *v22;
  CGRect v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v21 = a2;
  v22 = 0;
  v20.receiver = self;
  v20.super_class = (Class)CPSAlternateRoutesView;
  v22 = -[CPSAlternateRoutesView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    -[CPSAlternateRoutesView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSAlternateRoutesView setIndexForSelectedRoute:](v22, "setIndexForSelectedRoute:", 0x7FFFFFFFFFFFFFFFLL);
    v19 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSAlternateRoutesView setRowStack:](v22, "setRowStack:", v19);
    -[CPSAlternateRoutesView addSubview:](v22, "addSubview:", v19);
    v5 = (void *)MEMORY[0x24BDD1628];
    v18 = (id)objc_msgSend(v19, "leadingAnchor");
    v17 = (id)-[CPSAlternateRoutesView leadingAnchor](v22, "leadingAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v24[0] = v16;
    v15 = (id)objc_msgSend(v19, "trailingAnchor");
    v14 = (id)-[CPSAlternateRoutesView trailingAnchor](v22, "trailingAnchor");
    v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v24[1] = v13;
    v12 = (id)objc_msgSend(v19, "topAnchor");
    v11 = (id)-[CPSAlternateRoutesView topAnchor](v22, "topAnchor");
    v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v24[2] = v10;
    v9 = (id)objc_msgSend(v19, "bottomAnchor");
    v8 = (id)-[CPSAlternateRoutesView bottomAnchor](v22, "bottomAnchor");
    v7 = (id)objc_msgSend(v9, "constraintEqualToAnchor:");
    v24[3] = v7;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    objc_msgSend(v5, "activateConstraints:");

    objc_storeStrong(&v19, 0);
  }
  v4 = v22;
  objc_storeStrong((id *)&v22, 0);
  return v4;
}

- (void)_reloadRows
{
  id v2;
  id v3;
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSArray *obj;
  UIView *v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, void *, uint64_t, void *);
  void *v18;
  id v19;
  id v20[5];
  _QWORD v21[2];
  int v22;
  int v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id v34;
  _QWORD __b[8];
  id v36;
  SEL v37;
  CPSAlternateRoutesView *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v38 = self;
  v37 = a2;
  memset(__b, 0, sizeof(__b));
  v13 = -[CPSAlternateRoutesView rowStack](v38, "rowStack");
  obj = -[UIView subviews](v13, "subviews");

  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
  if (v11)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v11;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v36 = *(id *)(__b[1] + 8 * v9);
      objc_msgSend(v36, "removeFromSuperview");
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
        if (!v10)
          break;
      }
    }
  }

  v34 = -[CPSAlternateRoutesView rowStack](v38, "rowStack");
  v27 = 0;
  v28 = &v27;
  v29 = 838860800;
  v30 = 48;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = (id)objc_msgSend(v34, "topAnchor");
  v21[0] = 0;
  v21[1] = v21;
  v22 = 838860800;
  v23 = 48;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v6 = -[CPSAlternateRoutesView availableRouteChoices](v38, "availableRouteChoices");
  v14 = MEMORY[0x24BDAC760];
  v15 = -1073741824;
  v16 = 0;
  v17 = __37__CPSAlternateRoutesView__reloadRows__block_invoke;
  v18 = &unk_24E270200;
  v19 = v34;
  v20[0] = v38;
  v20[1] = &v27;
  v20[2] = v21;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", &v14);

  v4 = v34;
  v5 = (void *)v28[5];
  v3 = (id)objc_msgSend(v34, "bottomAnchor");
  v2 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  objc_msgSend(v4, "addConstraint:");

  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  _Block_object_dispose(v21, 8);
  objc_storeStrong(&v26, 0);
  _Block_object_dispose(&v27, 8);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
}

void __37__CPSAlternateRoutesView__reloadRows__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  CPSRouteRowView *v43;
  id v44[3];
  uint64_t v45;
  id location[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v45 = a3;
  v44[2] = a4;
  v44[1] = (id)a1;
  v44[0] = 0;
  if (a3)
  {
    v4 = +[CPSHairlineView grayHairlineViewAlongAxis:](CPSHairlineView, "grayHairlineViewAlongAxis:", 0);
    v5 = v44[0];
    v44[0] = v4;

    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v44[0]);
  }
  v43 = objc_alloc_init(CPSRouteRowView);
  -[CPSRouteRowView setRepresentedRouteChoice:](v43, "setRepresentedRouteChoice:", location[0]);
  -[CPSRouteRowView setInteractionDelegate:](v43, "setInteractionDelegate:", *(_QWORD *)(a1 + 40));
  -[CPSRouteRowView setSelected:](v43, "setSelected:", v45 == objc_msgSend(*(id *)(a1 + 40), "indexForSelectedRoute"));
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v43);
  if (v44[0])
  {
    v30 = *(void **)(a1 + 32);
    v39 = (id)objc_msgSend(v44[0], "widthAnchor");
    v38 = (id)objc_msgSend(*(id *)(a1 + 32), "widthAnchor");
    v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:");
    v48[0] = v37;
    v36 = (id)objc_msgSend(v44[0], "centerXAnchor");
    v35 = (id)objc_msgSend(*(id *)(a1 + 32), "centerXAnchor");
    v34 = (id)objc_msgSend(v36, "constraintEqualToAnchor:");
    v48[1] = v34;
    v33 = (id)objc_msgSend(v44[0], "topAnchor");
    v32 = (id)objc_msgSend(v33, "constraintEqualToAnchor:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v48[2] = v32;
    v31 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
    objc_msgSend(v30, "addConstraints:");

  }
  v22 = *(void **)(a1 + 32);
  v29 = (id)-[CPSRouteRowView widthAnchor](v43, "widthAnchor");
  v28 = (id)objc_msgSend(*(id *)(a1 + 32), "widthAnchor");
  v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
  v47[0] = v27;
  v26 = (id)-[CPSRouteRowView centerXAnchor](v43, "centerXAnchor");
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "centerXAnchor");
  v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
  v47[1] = v24;
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
  objc_msgSend(v22, "addConstraints:");

  if (v44[0])
  {
    v18 = *(void **)(a1 + 32);
    v21 = (id)-[CPSRouteRowView topAnchor](v43, "topAnchor");
    v20 = (id)objc_msgSend(v44[0], "bottomAnchor");
    v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    objc_msgSend(v18, "addConstraint:");

  }
  else
  {
    v15 = *(void **)(a1 + 32);
    v17 = (id)-[CPSRouteRowView topAnchor](v43, "topAnchor");
    v16 = (id)objc_msgSend(v17, "constraintEqualToAnchor:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(v15, "addConstraint:");

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v12 = *(void **)(a1 + 32);
    v14 = (id)-[CPSRouteRowView heightAnchor](v43, "heightAnchor");
    v13 = (id)objc_msgSend(v14, "constraintEqualToAnchor:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(v12, "addConstraint:");

  }
  else
  {
    v6 = (id)-[CPSRouteRowView heightAnchor](v43, "heightAnchor");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = (id)-[CPSRouteRowView bottomAnchor](v43, "bottomAnchor");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_storeStrong((id *)&v43, 0);
  objc_storeStrong(v44, 0);
  objc_storeStrong(location, 0);
}

- (void)setAvailableRouteChoices:(id)a3
{
  id *p_obj;
  id obj;
  id location[2];
  CPSAlternateRoutesView *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)objc_msgSend(location[0], "count") <= 3)
  {
    objc_storeStrong((id *)&v6->_availableRouteChoices, location[0]);
  }
  else
  {
    v8 = 0;
    v7 = 3;
    v9 = 0;
    v10 = 3;
    p_obj = &obj;
    obj = (id)objc_msgSend(location[0], "subarrayWithRange:", 0, 3);
    objc_storeStrong((id *)&v6->_availableRouteChoices, obj);
    objc_storeStrong(&obj, 0);
  }
  -[CPSAlternateRoutesView _reloadRows](v6, "_reloadRows", p_obj);
  objc_storeStrong(location, 0);
}

- (void)setIndexForSelectedRoute:(unint64_t)a3
{
  id v3;
  NSArray *v4;
  UIView *v5;
  NSArray *v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *, void *, void *, void *);
  void *v11;
  id v12;
  char v13;
  id v14;
  char v15;
  NSArray *v16;
  id v17;
  unint64_t v18;
  SEL v19;
  CPSAlternateRoutesView *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  self->_indexForSelectedRoute = a3;
  v6 = -[CPSAlternateRoutesView availableRouteChoices](v20, "availableRouteChoices");
  v15 = 0;
  v13 = 0;
  if (v18 >= -[NSArray count](v6, "count"))
  {
    v3 = 0;
  }
  else
  {
    v16 = -[CPSAlternateRoutesView availableRouteChoices](v20, "availableRouteChoices");
    v15 = 1;
    v14 = -[NSArray objectAtIndex:](v16, "objectAtIndex:", v18);
    v13 = 1;
    v3 = v14;
  }
  v17 = v3;
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  v5 = -[CPSAlternateRoutesView rowStack](v20, "rowStack");
  v4 = -[UIView subviews](v5, "subviews");
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __51__CPSAlternateRoutesView_setIndexForSelectedRoute___block_invoke;
  v11 = &unk_24E26F190;
  v12 = v17;
  -[NSArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", &v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v17, 0);
}

void __51__CPSAlternateRoutesView_setIndexForSelectedRoute___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v5;
  char v6;
  id v10[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    v10[0] = CPSSafeCast_10(v4, location[0]);
    v5 = (id)objc_msgSend(v10[0], "representedRouteChoice");
    v6 = objc_msgSend(v5, "isEqual:", a1[4]);

    objc_msgSend(v10[0], "setSelected:", v6 & 1);
    objc_storeStrong(v10, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)didSelectRow:(id)a3 representingRouteChoice:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id location[2];
  CPSAlternateRoutesView *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = -[CPSAlternateRoutesView availableRouteChoices](v11, "availableRouteChoices");
  v6 = -[NSArray indexOfObjectIdenticalTo:](v5, "indexOfObjectIdenticalTo:", v9);

  v8 = v6;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CPSAlternateRoutesView setIndexForSelectedRoute:](v11, "setIndexForSelectedRoute:", v8);
    v7 = -[CPSAlternateRoutesView selectionDelegate](v11, "selectionDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "alternateRoutesView:didSelectRouteChoice:", v11, v9);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  UIView *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[CPSAlternateRoutesView rowStack](self, "rowStack");
  v5[0] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);

  return v4;
}

- (id)_linearFocusItems
{
  NSArray *v3;
  UIView *v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *, void *, void *);
  void *v10;
  id v11;
  id v12[2];
  CPSAlternateRoutesView *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[CPSAlternateRoutesView rowStack](v13, "rowStack");
  v3 = -[UIView subviews](v4, "subviews");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __43__CPSAlternateRoutesView__linearFocusItems__block_invoke;
  v10 = &unk_24E26F190;
  v11 = v12[0];
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  v5 = v12[0];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return v5;
}

void __43__CPSAlternateRoutesView__linearFocusItems__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  void *v5;
  id v6;
  id v10[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  v4 = (void *)objc_opt_class();
  v10[0] = CPSSafeCast_10(v4, location[0]);
  if (v10[0])
  {
    v5 = (void *)a1[4];
    v6 = (id)objc_msgSend(v10[0], "rowButton");
    objc_msgSend(v5, "addObject:");

  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (NSArray)availableRouteChoices
{
  return self->_availableRouteChoices;
}

- (unint64_t)indexForSelectedRoute
{
  return self->_indexForSelectedRoute;
}

- (CPSAlternateRouteSelecting)selectionDelegate
{
  return (CPSAlternateRouteSelecting *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (UIView)rowStack
{
  return self->_rowStack;
}

- (void)setRowStack:(id)a3
{
  objc_storeStrong((id *)&self->_rowStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowStack, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_availableRouteChoices, 0);
}

@end
