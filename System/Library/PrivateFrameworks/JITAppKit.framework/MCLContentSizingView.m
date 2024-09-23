@implementation MCLContentSizingView

- (void)setContentView:(id)a3
{
  double v3;
  double v4;
  TKKeyPathObserver *observer;
  uint64_t v6;
  TKKeyPathObserver *v7;
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
  id v20;
  void *v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(id *, void *, void *);
  void *v26;
  id v27;
  id from;
  id location[2];
  MCLContentSizingView *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[TKKeyPathObserver stopObserving](v30->_observer, "stopObserving");
  -[UIScrollView removeFromSuperview](v30->_contentView, "removeFromSuperview");
  objc_storeStrong((id *)&v30->_contentView, location[0]);
  if (location[0])
  {
    objc_msgSend(location[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MCLContentSizingView addSubview:](v30, "addSubview:", location[0]);
    LODWORD(v3) = 1148846080;
    -[MCLContentSizingView setContentCompressionResistancePriority:forAxis:](v30, "setContentCompressionResistancePriority:forAxis:", 1, v3);
    LODWORD(v4) = 1148846080;
    -[MCLContentSizingView setContentHuggingPriority:forAxis:](v30, "setContentHuggingPriority:forAxis:", 1, v4);
    v21 = (void *)MEMORY[0x24BDD1628];
    v20 = (id)objc_msgSend(location[0], "leadingAnchor");
    v19 = (id)-[MCLContentSizingView leadingAnchor](v30, "leadingAnchor");
    v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v31[0] = v18;
    v17 = (id)objc_msgSend(location[0], "trailingAnchor");
    v16 = (id)-[MCLContentSizingView trailingAnchor](v30, "trailingAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v31[1] = v15;
    v14 = (id)objc_msgSend(location[0], "topAnchor");
    v13 = (id)-[MCLContentSizingView topAnchor](v30, "topAnchor");
    v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v31[2] = v12;
    v11 = (id)objc_msgSend(location[0], "bottomAnchor");
    v10 = (id)-[MCLContentSizingView bottomAnchor](v30, "bottomAnchor");
    v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
    v31[3] = v9;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
    objc_msgSend(v21, "activateConstraints:");

    if (!v30->_observer)
    {
      objc_initWeak(&from, v30);
      v7 = [TKKeyPathObserver alloc];
      v22 = MEMORY[0x24BDAC760];
      v23 = -1073741824;
      v24 = 0;
      v25 = __39__MCLContentSizingView_setContentView___block_invoke;
      v26 = &unk_24E09A120;
      objc_copyWeak(&v27, &from);
      v6 = -[TKKeyPathObserver initWithBlock:](v7, "initWithBlock:", &v22);
      observer = v30->_observer;
      v30->_observer = (TKKeyPathObserver *)v6;

      -[TKKeyPathObserver observe:keyPath:](v30->_observer, "observe:keyPath:", location[0], CFSTR("contentSize"));
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
    }
  }
  objc_storeStrong(location, 0);
}

void __39__MCLContentSizingView_setContentView___block_invoke(id *a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  if (self->_contentView)
  {
    -[UIScrollView contentSize](self->_contentView, "contentSize");
    *(_QWORD *)&v6 = v2;
    *((_QWORD *)&v6 + 1) = v3;
  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
  }
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIScrollView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
