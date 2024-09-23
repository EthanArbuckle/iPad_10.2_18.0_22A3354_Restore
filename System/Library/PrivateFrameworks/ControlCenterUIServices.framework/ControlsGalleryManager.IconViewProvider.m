@implementation ControlsGalleryManager.IconViewProvider

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
  uint64_t v6;
  id v7;
  id v8;

  v6 = MEMORY[0x23B837864](self->iconViewDelegate, a2);
  v7 = a3;
  v8 = a4;
  swift_retain();
  objc_msgSend(v7, sel_setDelegate_, v6);

  swift_release();
  swift_unknownObjectRelease();
}

@end
