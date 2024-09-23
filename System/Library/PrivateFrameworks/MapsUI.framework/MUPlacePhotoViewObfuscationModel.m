@implementation MUPlacePhotoViewObfuscationModel

- (MUPlacePhotoViewObfuscationModel)initWithProviderName:(id)a3
{
  id v5;
  MUPlacePhotoViewObfuscationModel *v6;
  MUPlacePhotoViewObfuscationModel *v7;
  MUPlacePhotoViewObfuscationModel *v8;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v10.receiver = self;
    v10.super_class = (Class)MUPlacePhotoViewObfuscationModel;
    v6 = -[MUPlacePhotoViewObfuscationModel init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_providerName, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_providerName, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
}

@end
