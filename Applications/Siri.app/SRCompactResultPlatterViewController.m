@implementation SRCompactResultPlatterViewController

- (void)setSiriContentViewControllers:(id)a3
{
  NSArray *v5;
  NSArray **p_siriContentViewControllers;
  NSMutableArray *v7;
  unint64_t v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  double v18;
  id v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  SRCompactResultPlatterViewController *v26;

  v5 = (NSArray *)a3;
  p_siriContentViewControllers = &self->_siriContentViewControllers;
  if (self->_siriContentViewControllers != v5)
  {
    v24 = v5;
    objc_storeStrong((id *)&self->_siriContentViewControllers, a3);
    v7 = objc_opt_new(NSMutableArray);
    if (-[NSArray count](*p_siriContentViewControllers, "count"))
    {
      v8 = 0;
      v9 = NSArray_ptr;
      v26 = self;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](*p_siriContentViewControllers, "objectAtIndex:", v8, v24));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](*p_siriContentViewControllers, "lastObject"));

        objc_opt_class(v9[215], v12);
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
        {
          v14 = v10;
          -[NSMutableArray addObject:](v7, "addObject:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactResultPlatterViewController _createReusableViewWithClass:snippetViewController:](self, "_createReusableViewWithClass:snippetViewController:", objc_msgSend(v14, "footerViewClass"), v14));
          objc_msgSend(v14, "configureReusableFooterView:", v15);
          v16 = objc_alloc_init((Class)SiriUIFooterViewController);
          objc_msgSend(v16, "setView:", v15);
          if (v15)
          {
            *(_QWORD *)&v18 = objc_opt_class(v15, v17).n128_u64[0];
            objc_msgSend(v19, "defaultHeight", v18);
            if (v20 > 0.0)
            {
              v21 = objc_alloc_init((Class)UIViewController);
              v22 = objc_alloc_init((Class)SiriSharedUIContentPlatterSeparatorView);
              objc_msgSend(v22, "setSeparatorType:", 1);
              objc_msgSend(v21, "setView:", v22);
              -[NSMutableArray addObject:](v7, "addObject:", v21);

              self = v26;
            }
          }
          -[NSMutableArray addObject:](v7, "addObject:", v16);

          v9 = NSArray_ptr;
        }
        ++v8;
        if (v10 != v11)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](*p_siriContentViewControllers, "objectAtIndex:", v8));
          -[SRCompactResultPlatterViewController appendSeparatorToViewControllers:forNextViewController:](self, "appendSeparatorToViewControllers:forNextViewController:", v7, v23);

        }
      }
      while (-[NSArray count](*p_siriContentViewControllers, "count") > v8);
    }
    -[SRCompactResultPlatterViewController setContentViewControllers:](self, "setContentViewControllers:", v7, v24);

    v5 = v25;
  }

}

- (id)_createReusableViewWithClass:(Class)a3 snippetViewController:(id)a4
{
  id v5;

  v5 = a4;
  if (a3)
  {
    a3 = (Class)objc_msgSend([a3 alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    if ((objc_opt_respondsToSelector(a3, "setSnippetViewController:") & 1) != 0)
      -[objc_class setSnippetViewController:](a3, "setSnippetViewController:", v5);
  }

  return a3;
}

- (NSArray)siriContentViewControllers
{
  return self->_siriContentViewControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriContentViewControllers, 0);
}

@end
