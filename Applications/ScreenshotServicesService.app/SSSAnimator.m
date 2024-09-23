@implementation SSSAnimator

+ (id)animatorWithPropertyAnimator:(id)a3
{
  id v4;
  uint64_t v5;
  Class v6;
  id v7;

  v4 = a3;
  objc_opt_class(a1, v5);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setPropertyAnimator:", v4);

  return v7;
}

+ (id)animatorWithDragAnimating:(id)a3
{
  id v4;
  uint64_t v5;
  Class v6;
  id v7;

  v4 = a3;
  objc_opt_class(a1, v5);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setDragAnimating:", v4);

  return v7;
}

- (void)addAnimations:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSAnimator propertyAnimator](self, "propertyAnimator"));
  objc_msgSend(v5, "addAnimations:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSAnimator dragAnimating](self, "dragAnimating"));
  objc_msgSend(v6, "addAnimations:", v4);

}

- (void)addCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSAnimator propertyAnimator](self, "propertyAnimator"));
  objc_msgSend(v5, "addCompletion:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSAnimator dragAnimating](self, "dragAnimating"));
  objc_msgSend(v6, "addCompletion:", v4);

}

- (UIViewPropertyAnimator)propertyAnimator
{
  return (UIViewPropertyAnimator *)objc_loadWeakRetained((id *)&self->_propertyAnimator);
}

- (void)setPropertyAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_propertyAnimator, a3);
}

- (UIDragAnimating)dragAnimating
{
  return (UIDragAnimating *)objc_loadWeakRetained((id *)&self->_dragAnimating);
}

- (void)setDragAnimating:(id)a3
{
  objc_storeWeak((id *)&self->_dragAnimating, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragAnimating);
  objc_destroyWeak((id *)&self->_propertyAnimator);
}

@end
