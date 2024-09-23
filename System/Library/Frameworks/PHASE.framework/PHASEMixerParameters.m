@implementation PHASEMixerParameters

- (PHASEMixerParameters)init
{
  PHASEMixerParameters *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *parameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHASEMixerParameters;
  v2 = -[PHASEMixerParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parameters = v2->_parameters;
    v2->_parameters = v3;

  }
  return v2;
}

- (void)addSpatialMixerParametersWithIdentifier:(NSString *)identifier source:(PHASESource *)source listener:(PHASEListener *)listener
{
  PHASESource *v8;
  PHASEListener *v9;
  PHASEMixerParameterEntry *v10;
  NSString *v11;

  v11 = identifier;
  v8 = source;
  v9 = listener;
  v10 = objc_alloc_init(PHASEMixerParameterEntry);
  -[PHASEMixerParameterEntry setSource:](v10, "setSource:", v8);
  -[PHASEMixerParameterEntry setListener:](v10, "setListener:", v9);
  -[PHASEMixerParameterEntry setMixerType:](v10, "setMixerType:", 1);
  -[NSMutableDictionary setObject:forKey:](self->_parameters, "setObject:forKey:", v10, v11);

}

- (void)addAmbientMixerParametersWithIdentifier:(NSString *)identifier listener:(PHASEListener *)listener
{
  PHASEListener *v6;
  PHASEMixerParameterEntry *v7;
  NSString *v8;

  v8 = identifier;
  v6 = listener;
  v7 = objc_alloc_init(PHASEMixerParameterEntry);
  -[PHASEMixerParameterEntry setSource:](v7, "setSource:", 0);
  -[PHASEMixerParameterEntry setListener:](v7, "setListener:", v6);
  -[PHASEMixerParameterEntry setMixerType:](v7, "setMixerType:", 2);
  -[NSMutableDictionary setObject:forKey:](self->_parameters, "setObject:forKey:", v7, v8);

}

- (NSDictionary)parameterDictionary
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_parameters);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
