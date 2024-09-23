@implementation AEGridOverlayConfiguration

- (AEGridOverlayConfiguration)initWithShowCloudDecoration:(BOOL)a3 showVideoDecoration:(BOOL)a4 showLoopDecoration:(BOOL)a5
{
  AEGridOverlayConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AEGridOverlayConfiguration;
  result = -[AEGridOverlayConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_showVideoDecoration = a4;
    result->_showCloudDecoration = a3;
    result->_showLoopDecoration = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "showVideoDecoration");
    if (v6 == -[AEGridOverlayConfiguration showVideoDecoration](self, "showVideoDecoration"))
    {
      v8 = objc_msgSend(v5, "showCloudDecoration");
      v7 = v8 ^ -[AEGridOverlayConfiguration showCloudDecoration](self, "showCloudDecoration") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)showVideoDecoration
{
  return self->_showVideoDecoration;
}

- (BOOL)showCloudDecoration
{
  return self->_showCloudDecoration;
}

- (BOOL)showLoopDecoration
{
  return self->_showLoopDecoration;
}

@end
