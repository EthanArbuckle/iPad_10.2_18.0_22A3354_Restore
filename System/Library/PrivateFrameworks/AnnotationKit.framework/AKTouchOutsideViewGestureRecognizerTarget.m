@implementation AKTouchOutsideViewGestureRecognizerTarget

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  const char *v8;

  v4 = a3;
  if (v4)
  {
    -[AKTouchOutsideViewGestureRecognizerTarget target](self, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v8 = -[AKTouchOutsideViewGestureRecognizerTarget action](self, "action");
      v7 = v8 == (const char *)objc_msgSend(v4, "action");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AKTouchOutsideViewGestureRecognizerTarget target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)target
{
  return objc_loadWeakRetained(&self->mTarget);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->mTarget, a3);
}

- (SEL)action
{
  return self->mAction;
}

- (void)setAction:(SEL)a3
{
  self->mAction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->mTarget);
}

@end
