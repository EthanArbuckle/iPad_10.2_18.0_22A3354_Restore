@implementation NTKGreenfieldB640WatchFaceModel

- (NTKGreenfieldB640WatchFaceModel)initWithDecodedRecipe:(id)a3
{
  id v5;
  NTKGreenfieldB640WatchFaceModel *v6;
  NTKGreenfieldB640WatchFaceModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKGreenfieldB640WatchFaceModel;
  v6 = -[NTKGreenfieldB640WatchFaceModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_decodedRecipe, a3);

  return v7;
}

- (NTKGreenfieldDecodedRecipe)decodedRecipe
{
  return self->_decodedRecipe;
}

- (void)setDecodedRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_decodedRecipe, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedRecipe, 0);
}

@end
