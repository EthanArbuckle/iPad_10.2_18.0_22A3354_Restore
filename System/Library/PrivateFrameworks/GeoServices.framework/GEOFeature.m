@implementation GEOFeature

- (void)dealloc
{
  objc_super v2;

  self->_feature = 0;
  v2.receiver = self;
  v2.super_class = (Class)GEOFeature;
  -[GEOFeature dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_attributes, 0);
  objc_destroyWeak((id *)&self->_containingTile);
}

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6;
  GEOFeature *v7;
  GEOFeature *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GEOFeature;
  v7 = -[GEOFeature init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_feature = a3;
    objc_storeWeak((id *)&v7->_containingTile, v6);
  }

  return v8;
}

- (void)get
{
  return self->_feature;
}

- (GEOVectorTile)containingTile
{
  return (GEOVectorTile *)objc_loadWeakRetained((id *)&self->_containingTile);
}

- (const)name
{
  void *feature;

  feature = self->_feature;
  if (feature)
    return (const char *)*((_QWORD *)feature + 2);
  else
    return 0;
}

- (unint64_t)labelOffset
{
  unsigned int *feature;

  feature = (unsigned int *)self->_feature;
  if (feature)
    return feature[14];
  else
    return 0;
}

- (unint64_t)labelCount
{
  unsigned __int8 *feature;

  feature = (unsigned __int8 *)self->_feature;
  if (feature)
    return feature[73];
  else
    return 0;
}

- (unint64_t)shieldOffset
{
  unsigned int *feature;

  feature = (unsigned int *)self->_feature;
  if (feature)
    return feature[15];
  else
    return 0;
}

- (unint64_t)shieldCount
{
  unsigned __int8 *feature;

  feature = (unsigned __int8 *)self->_feature;
  if (feature)
    return feature[72];
  else
    return 0;
}

- (unsigned)styleID
{
  return 0;
}

- (unint64_t)featureID
{
  _QWORD *feature;

  feature = self->_feature;
  if (feature)
    return feature[5];
  else
    return 0;
}

- (BOOL)hasBusinessID
{
  _BYTE *feature;

  feature = self->_feature;
  return feature && feature[75] != 0;
}

- (unint64_t)businessID
{
  _QWORD *feature;

  feature = self->_feature;
  if (feature)
    return feature[6];
  else
    return 0;
}

- (float)minZoomRank
{
  float *feature;

  feature = (float *)self->_feature;
  if (feature)
    return feature[17];
  else
    return 0.0;
}

- (unint64_t)flyoverAnimationID
{
  return 0;
}

- (GEOFeatureStyleAttributes)attributes
{
  once_flag *p_initAttributesFlag;
  GEOFeature *v3;
  unint64_t v4;
  GEOFeature *v6;
  id **v7;
  id *v8;

  p_initAttributesFlag = &self->_initAttributesFlag;
  v3 = self;
  v6 = v3;
  v4 = atomic_load(&p_initAttributesFlag->__state_);
  if (v4 != -1)
  {
    v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initAttributesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOFeature attributes]::$_0 &&>>);
  }

  return v3->_cached_attributes;
}

- (int)type
{
  return self->_type;
}

- (void)_setType:(int)a3
{
  self->_type = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
