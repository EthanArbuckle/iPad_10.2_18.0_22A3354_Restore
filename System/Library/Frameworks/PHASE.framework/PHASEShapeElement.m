@implementation PHASEShapeElement

- (PHASEShapeElement)init
{
  -[PHASEShapeElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEShapeElement)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEShapeElement)initWithOwner:(id)a3
{
  return -[PHASEShapeElement initWithOwner:material:](self, "initWithOwner:material:", a3, 0);
}

- (PHASEShapeElement)initWithOwner:(id)a3 material:(id)a4
{
  id v6;
  id v7;
  PHASEShapeElement *v8;
  PHASEShapeElement *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PHASEShapeElement;
  v8 = -[PHASEShapeElement init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_owner, v6);
    objc_storeStrong((id *)&v9->_material, a4);
  }

  return v9;
}

- (void)setMaterial:(PHASEMaterial *)material
{
  id WeakRetained;

  objc_storeStrong((id *)&self->_material, material);
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "updateMaterialForElement:", self);

}

- (PHASEMaterial)material
{
  return self->_material;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_material, 0);
  objc_destroyWeak((id *)&self->_owner);
}

@end
