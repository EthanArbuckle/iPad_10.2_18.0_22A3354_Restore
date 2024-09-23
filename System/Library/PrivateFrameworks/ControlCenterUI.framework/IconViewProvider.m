@implementation IconViewProvider

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return objc_msgSend(*(id *)self->iconViewMap, sel_dequeueReusableViewOfClass_, a3);
}

- (void)recycleIconView:(id)a3
{
  objc_msgSend(*(id *)self->iconViewMap, sel_recycleView_, a3);
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return objc_msgSend(*(id *)self->iconViewMap, sel_isViewRecycled_, a3);
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_retain();
  sub_1CFBC3F48(v5);

  swift_release();
}

@end
