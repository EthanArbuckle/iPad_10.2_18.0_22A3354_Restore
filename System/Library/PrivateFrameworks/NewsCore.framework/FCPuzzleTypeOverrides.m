@implementation FCPuzzleTypeOverrides

- (FCPuzzleTypeOverrides)initWithThemeColor:(id)a3 darkStyleThemeColor:(id)a4 exploreTileImageAssetHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCPuzzleTypeOverrides *v11;
  FCPuzzleTypeOverrides *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FCPuzzleTypeOverrides;
  v11 = -[FCPuzzleTypeOverrides init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[FCPuzzleTypeOverrides setThemeColor:](v11, "setThemeColor:", v8);
    -[FCPuzzleTypeOverrides setDarkStyleThemeColor:](v12, "setDarkStyleThemeColor:", v9);
    -[FCPuzzleTypeOverrides setExploreTileImageAssetHandle:](v12, "setExploreTileImageAssetHandle:", v10);
  }

  return v12;
}

- (FCColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
  objc_storeStrong((id *)&self->_themeColor, a3);
}

- (FCColor)darkStyleThemeColor
{
  return self->_darkStyleThemeColor;
}

- (void)setDarkStyleThemeColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkStyleThemeColor, a3);
}

- (FCAssetHandle)exploreTileImageAssetHandle
{
  return self->_exploreTileImageAssetHandle;
}

- (void)setExploreTileImageAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_exploreTileImageAssetHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreTileImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_darkStyleThemeColor, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
}

@end
