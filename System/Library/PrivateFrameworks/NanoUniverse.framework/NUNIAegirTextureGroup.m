@implementation NUNIAegirTextureGroup

- (NSArray)albedos
{
  return self->_albedos;
}

- (void)setAlbedos:(id)a3
{
  objc_storeStrong((id *)&self->_albedos, a3);
}

- (NSArray)normals
{
  return self->_normals;
}

- (void)setNormals:(id)a3
{
  objc_storeStrong((id *)&self->_normals, a3);
}

- (NSArray)emissives
{
  return self->_emissives;
}

- (void)setEmissives:(id)a3
{
  objc_storeStrong((id *)&self->_emissives, a3);
}

- (NSArray)cloudsLo
{
  return self->_cloudsLo;
}

- (void)setCloudsLo:(id)a3
{
  objc_storeStrong((id *)&self->_cloudsLo, a3);
}

- (NSArray)cloudsMd
{
  return self->_cloudsMd;
}

- (void)setCloudsMd:(id)a3
{
  objc_storeStrong((id *)&self->_cloudsMd, a3);
}

- (NSArray)cloudsHi
{
  return self->_cloudsHi;
}

- (void)setCloudsHi:(id)a3
{
  objc_storeStrong((id *)&self->_cloudsHi, a3);
}

- (NSArray)gradients
{
  return self->_gradients;
}

- (void)setGradients:(id)a3
{
  objc_storeStrong((id *)&self->_gradients, a3);
}

- (CLKUITexture)starfield
{
  return self->_starfield;
}

- (void)setStarfield:(id)a3
{
  objc_storeStrong((id *)&self->_starfield, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starfield, 0);
  objc_storeStrong((id *)&self->_gradients, 0);
  objc_storeStrong((id *)&self->_cloudsHi, 0);
  objc_storeStrong((id *)&self->_cloudsMd, 0);
  objc_storeStrong((id *)&self->_cloudsLo, 0);
  objc_storeStrong((id *)&self->_emissives, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_albedos, 0);
}

@end
