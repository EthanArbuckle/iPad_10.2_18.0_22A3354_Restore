@implementation ARParametricLights

- (ARParametricLights)initWithAmbientColor:(id)a3 areaLights:
{
  __int128 v3;
  id v6;
  ARParametricLights *v7;
  ARParametricLights *v8;
  __int128 v10;
  objc_super v11;

  v10 = v3;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARParametricLights;
  v7 = -[ARParametricLights init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    *(_OWORD *)v7->_ambientColor = v10;
    objc_storeStrong((id *)&v7->_areaLights, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARParametricLights)initWithCoder:(id)a3
{
  id v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ARParametricLights *v11;
  double v13;

  v4 = a3;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("ambientColor"));
  v13 = v5;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("areaLights"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ARParametricLights initWithAmbientColor:areaLights:](self, "initWithAmbientColor:areaLights:", v10, v13);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  __int128 v4;
  id v5;

  v4 = *(_OWORD *)self->_ambientColor;
  v5 = a3;
  objc_msgSend(v5, "ar_encodeVector3:forKey:", CFSTR("ambientColor"), *(double *)&v4);
  objc_msgSend(v5, "encodeObject:forKey:", self->_areaLights, CFSTR("areaLights"));

}

- (__n128)ambientColor
{
  return a1[1];
}

- (NSArray)areaLights
{
  return self->_areaLights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areaLights, 0);
}

@end
