@implementation CNUIAvatarLayoutLayerItem

- (CNUIAvatarLayoutLayerItem)initWithLayer:(id)a3
{
  id v5;
  CNUIAvatarLayoutLayerItem *v6;
  CNUIAvatarLayoutLayerItem *v7;
  CNUIAvatarLayoutLayerItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIAvatarLayoutLayerItem;
  v6 = -[CNUIAvatarLayoutLayerItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layer, a3);
    v8 = v7;
  }

  return v7;
}

- (void)resetToken
{
  void *v3;

  -[CNUIAvatarLayoutLayerItem avatarImageRendererToken](self, "avatarImageRendererToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNUIAvatarLayoutLayerItem setAvatarImageRendererToken:](self, "setAvatarImageRendererToken:", 0);
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (CNCancelable)avatarImageRendererToken
{
  return self->_avatarImageRendererToken;
}

- (void)setAvatarImageRendererToken:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageRendererToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageRendererToken, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
