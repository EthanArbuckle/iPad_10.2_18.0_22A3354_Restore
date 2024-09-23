@implementation CKBrowserDragControllerTarget

+ (id)targetWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7 associatedLayoutIntent:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:stickerIsRepositioning:stickerChatItem:", a8, 0, 0, a3.x, a3.y, a4.width, a4.height, a5, a6, a7);
}

+ (id)targetWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7 associatedLayoutIntent:(unint64_t)a8 stickerIsRepositioning:(BOOL)a9 stickerChatItem:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  CKBrowserDragControllerTarget *v20;
  void *v21;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v19 = a10;
  v20 = objc_alloc_init(CKBrowserDragControllerTarget);
  -[CKBrowserDragControllerTarget setScreenCoordinate:](v20, "setScreenCoordinate:", x, y);
  -[CKBrowserDragControllerTarget setInitialSize:](v20, "setInitialSize:", width, height);
  -[CKBrowserDragControllerTarget setScale:](v20, "setScale:", a5);
  -[CKBrowserDragControllerTarget setMeshScaleFactor:](v20, "setMeshScaleFactor:", a6);
  -[CKBrowserDragControllerTarget setRotation:](v20, "setRotation:", a7);
  -[CKBrowserDragControllerTarget setAssociatedLayoutIntent:](v20, "setAssociatedLayoutIntent:", a8);
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragControllerTarget setStickerIsRepositioning:](v20, "setStickerIsRepositioning:", objc_msgSend(v21, "isStickerRepositioningEnabled"));

  }
  else
  {
    -[CKBrowserDragControllerTarget setStickerIsRepositioning:](v20, "setStickerIsRepositioning:", 0);
  }
  -[CKBrowserDragControllerTarget setStickerChatItem:](v20, "setStickerChatItem:", v19);

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;
  CGPoint v15;
  CGSize v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKBrowserDragControllerTarget screenCoordinate](self, "screenCoordinate");
  NSStringFromCGPoint(v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragControllerTarget initialSize](self, "initialSize");
  NSStringFromCGSize(v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragControllerTarget scale](self, "scale");
  v7 = v6;
  -[CKBrowserDragControllerTarget rotation](self, "rotation");
  v9 = v8;
  v10 = -[CKBrowserDragControllerTarget associatedLayoutIntent](self, "associatedLayoutIntent");
  v11 = -[CKBrowserDragControllerTarget stickerIsRepositioning](self, "stickerIsRepositioning");
  v12 = CFSTR("No");
  if (v11)
    v12 = CFSTR("Yes");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CKBrowserDragControllerTarget coord: %@ size %@ scale %f rotation %f associatedIntent %tu isStickerRepositioning: %@"), v4, v5, v7, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGPoint)screenCoordinate
{
  double x;
  double y;
  CGPoint result;

  x = self->_screenCoordinate.x;
  y = self->_screenCoordinate.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScreenCoordinate:(CGPoint)a3
{
  self->_screenCoordinate = a3;
}

- (CGSize)initialSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialSize.width;
  height = self->_initialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInitialSize:(CGSize)a3
{
  self->_initialSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)meshScaleFactor
{
  return self->_meshScaleFactor;
}

- (void)setMeshScaleFactor:(double)a3
{
  self->_meshScaleFactor = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (unint64_t)associatedLayoutIntent
{
  return self->_associatedLayoutIntent;
}

- (void)setAssociatedLayoutIntent:(unint64_t)a3
{
  self->_associatedLayoutIntent = a3;
}

- (BOOL)stickerIsRepositioning
{
  return self->_stickerIsRepositioning;
}

- (void)setStickerIsRepositioning:(BOOL)a3
{
  self->_stickerIsRepositioning = a3;
}

- (CKAssociatedStickerChatItem)stickerChatItem
{
  return self->_stickerChatItem;
}

- (void)setStickerChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_stickerChatItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerChatItem, 0);
}

@end
