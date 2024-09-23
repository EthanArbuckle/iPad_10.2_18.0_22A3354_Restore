@implementation CLSFeederPrefetchOptions

- (CLSFeederPrefetchOptions)init
{
  CLSFeederPrefetchOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSFeederPrefetchOptions;
  result = -[CLSFeederPrefetchOptions init](&v3, sel_init);
  if (result)
  {
    result->_locationPrefetchMode = 0;
    *(_OWORD *)&result->_scenesPrefetchMode = 0u;
    *(_OWORD *)&result->_personCountPrefetchMode = 0u;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *((_QWORD *)result + 1) = self->_personCountPrefetchMode;
  *((_QWORD *)result + 2) = self->_personsPrefetchMode;
  *((_QWORD *)result + 3) = self->_scenesPrefetchMode;
  *((_QWORD *)result + 4) = self->_faceInformationPrefetchMode;
  *((_QWORD *)result + 5) = self->_locationPrefetchMode;
  return result;
}

- (void)mergeWithFeederPrefetchOptions:(id)a3
{
  unint64_t personCountPrefetchMode;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t personsPrefetchMode;
  unint64_t v9;
  unint64_t v10;
  unint64_t scenesPrefetchMode;
  unint64_t v12;
  unint64_t v13;
  unint64_t faceInformationPrefetchMode;
  unint64_t v15;
  unint64_t v16;
  unint64_t locationPrefetchMode;
  unint64_t v18;
  unint64_t v19;

  personCountPrefetchMode = self->_personCountPrefetchMode;
  v5 = a3;
  v6 = objc_msgSend(v5, "personCountPrefetchMode");
  if (personCountPrefetchMode <= v6)
    v7 = v6;
  else
    v7 = personCountPrefetchMode;
  self->_personCountPrefetchMode = v7;
  personsPrefetchMode = self->_personsPrefetchMode;
  v9 = objc_msgSend(v5, "personsPrefetchMode");
  if (personsPrefetchMode <= v9)
    v10 = v9;
  else
    v10 = personsPrefetchMode;
  self->_personsPrefetchMode = v10;
  scenesPrefetchMode = self->_scenesPrefetchMode;
  v12 = objc_msgSend(v5, "scenesPrefetchMode");
  if (scenesPrefetchMode <= v12)
    v13 = v12;
  else
    v13 = scenesPrefetchMode;
  self->_scenesPrefetchMode = v13;
  faceInformationPrefetchMode = self->_faceInformationPrefetchMode;
  v15 = objc_msgSend(v5, "faceInformationPrefetchMode");
  if (faceInformationPrefetchMode <= v15)
    v16 = v15;
  else
    v16 = faceInformationPrefetchMode;
  self->_faceInformationPrefetchMode = v16;
  locationPrefetchMode = self->_locationPrefetchMode;
  v18 = objc_msgSend(v5, "locationPrefetchMode");

  if (locationPrefetchMode <= v18)
    v19 = v18;
  else
    v19 = locationPrefetchMode;
  self->_locationPrefetchMode = v19;
}

- (unint64_t)personCountPrefetchMode
{
  return self->_personCountPrefetchMode;
}

- (void)setPersonCountPrefetchMode:(unint64_t)a3
{
  self->_personCountPrefetchMode = a3;
}

- (unint64_t)personsPrefetchMode
{
  return self->_personsPrefetchMode;
}

- (void)setPersonsPrefetchMode:(unint64_t)a3
{
  self->_personsPrefetchMode = a3;
}

- (unint64_t)scenesPrefetchMode
{
  return self->_scenesPrefetchMode;
}

- (void)setScenesPrefetchMode:(unint64_t)a3
{
  self->_scenesPrefetchMode = a3;
}

- (unint64_t)faceInformationPrefetchMode
{
  return self->_faceInformationPrefetchMode;
}

- (void)setFaceInformationPrefetchMode:(unint64_t)a3
{
  self->_faceInformationPrefetchMode = a3;
}

- (unint64_t)locationPrefetchMode
{
  return self->_locationPrefetchMode;
}

- (void)setLocationPrefetchMode:(unint64_t)a3
{
  self->_locationPrefetchMode = a3;
}

+ (id)feederPrefetchOptionsWithDefaultMode:(unint64_t)a3
{
  CLSFeederPrefetchOptions *v4;

  v4 = objc_alloc_init(CLSFeederPrefetchOptions);
  v4->_personCountPrefetchMode = a3;
  v4->_personsPrefetchMode = a3;
  v4->_scenesPrefetchMode = a3;
  v4->_faceInformationPrefetchMode = a3;
  v4->_locationPrefetchMode = a3;
  return v4;
}

@end
