@implementation _CKPhotosSupportWeakBox

- (_CKPhotosSupportWeakBox)initWithObject:(id)a3
{
  id v4;
  _CKPhotosSupportWeakBox *v5;
  _CKPhotosSupportWeakBox *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CKPhotosSupportWeakBox;
  v5 = -[_CKPhotosSupportWeakBox init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_object, v4);

  return v6;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
