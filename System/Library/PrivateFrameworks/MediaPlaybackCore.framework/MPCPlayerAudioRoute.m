@implementation MPCPlayerAudioRoute

- (MPCPlayerAudioRoute)initWithRoute:(id)a3 spatialIsAlwaysOn:(BOOL)a4
{
  id v6;
  MPCPlayerAudioRoute *v7;
  MPCPlayerAudioRoute *v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlayerAudioRoute;
  v7 = -[MPCPlayerAudioRoute init](&v16, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_32;
  v7->_multiChannelSupport = 0;
  if (!objc_msgSend(v6, "isAirPlayRoute"))
  {
    if (a4)
      goto LABEL_18;
    v10 = (objc_msgSend(v6, "isB515Route") & 1) != 0 ? 1 : objc_msgSend(v6, "isB298Route");
    if ((objc_msgSend(v6, "isW1Route") & 1) != 0 || (objc_msgSend(v6, "isH1Route") & 1) != 0)
    {
      v11 = 1;
      if (v10)
      {
LABEL_11:
        v8->_multiChannelSupport = 1;
        v8->_supportsSpatialization = objc_msgSend(v6, "supportsHeadTrackedSpatialAudio");
        v9 = objc_msgSend(v6, "supportsHeadTrackedSpatialAudio");
        if (v9)
          LOBYTE(v9) = objc_msgSend(v6, "headTrackedSpatialAudioEnabled");
        v8->_isSpatializationEnabled = v9;
        if (!v8->_supportsSpatialization)
          LOBYTE(v9) = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v11 = objc_msgSend(v6, "isB507Route");
      if (v10)
        goto LABEL_11;
    }
    if ((v11 & 1) != 0 || (objc_msgSend(v6, "isDeviceSpeakerRoute") & 1) != 0)
LABEL_18:
      v8->_multiChannelSupport = 1;
    *(_WORD *)&v8->_supportsSpatialization = 257;
    LOBYTE(v9) = 1;
    goto LABEL_20;
  }
  LOBYTE(v9) = 0;
  v8->_multiChannelSupport = 2;
  *(_WORD *)&v8->_supportsSpatialization = 0;
LABEL_20:
  v8->_canRenderSpatial = v9;
  v8->_canStreamSpatial = v9;
  objc_msgSend(v6, "routeName");
  v12 = objc_claimAutoreleasedReturnValue();
  name = v8->_name;
  v8->_name = (NSString *)v12;

  v8->_type = 0;
  if ((objc_msgSend(v6, "isDeviceSpeakerRoute") & 1) != 0)
  {
    v14 = 1;
  }
  else if (objc_msgSend(v6, "routeSubtype") == 5 || objc_msgSend(v6, "routeSubtype") == 6)
  {
    v14 = 2;
  }
  else if (objc_msgSend(v6, "routeSubtype") == 2 || objc_msgSend(v6, "routeSubtype") == 3)
  {
    v14 = 3;
  }
  else if (objc_msgSend(v6, "routeSubtype") == 11 || objc_msgSend(v6, "routeSubtype") == 12)
  {
    v14 = 4;
  }
  else if (objc_msgSend(v6, "routeSubtype") == 21)
  {
    v14 = 5;
  }
  else if (objc_msgSend(v6, "routeSubtype") == 7)
  {
    v14 = 6;
  }
  else if ((objc_msgSend(v6, "isCarplayRoute") & 1) != 0
         || objc_msgSend(v6, "routeSubtype") == 15
         || objc_msgSend(v6, "routeSubtype") == 19)
  {
    v14 = 7;
  }
  else if (objc_msgSend(v6, "routeSubtype") == 10)
  {
    v14 = 8;
  }
  else
  {
    if (!objc_msgSend(v6, "isAirPlayRoute"))
      goto LABEL_32;
    v14 = 9;
  }
  v8->_type = v14;
LABEL_32:

  return v8;
}

- (MPCPlayerAudioRoute)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MPCPlayerAudioRoute *v5;
  MPCPlayerAudioRoute *v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlayerAudioRoute;
  v5 = -[MPCPlayerAudioRoute init](&v16, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (MPCPlayerAudioRoute *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rmcs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_multiChannelSupport = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spzs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsSpatialization = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spze"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSpatializationEnabled = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spzcs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canStreamSpatial = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spzcr"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canRenderSpatial = objc_msgSend(v14, "BOOLValue");

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (MPCPlayerAudioRoute)initWithNowPlayingInfoAudioRoute:(id)a3
{
  id v4;
  MPCPlayerAudioRoute *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCPlayerAudioRoute;
  v5 = -[MPCPlayerAudioRoute init](&v9, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_supportsSpatialization = objc_msgSend(v4, "supportsSpatialization");
    v5->_isSpatializationEnabled = objc_msgSend(v4, "isSpatializationEnabled");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MPCPlayerAudioRoute *v4;
  MPCPlayerAudioRoute *v5;
  MPCPlayerAudioRoute *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  BOOL v12;

  v4 = (MPCPlayerAudioRoute *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_type == v5->_type)
      {
        name = self->_name;
        v8 = v5->_name;
        if (name == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = name;
          v11 = -[NSString isEqual:](v10, "isEqual:", v9);

          if (!v11)
            goto LABEL_15;
        }
        if (self->_multiChannelSupport == v6->_multiChannelSupport
          && !self->_supportsSpatialization != v6->_supportsSpatialization
          && !self->_isSpatializationEnabled != v6->_isSpatializationEnabled
          && !self->_canStreamSpatial != v6->_canStreamSpatial)
        {
          v12 = !self->_canRenderSpatial ^ v6->_canRenderSpatial;
LABEL_16:

          goto LABEL_17;
        }
      }
LABEL_15:
      v12 = 0;
      goto LABEL_16;
    }
    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *name;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  name = (const __CFString *)self->_name;
  if (!name)
    name = &stru_24CABB5D0;
  v14[0] = v3;
  v14[1] = name;
  v13[1] = CFSTR("name");
  v13[2] = CFSTR("rmcs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_multiChannelSupport);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("spzs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsSpatialization);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("spze");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSpatializationEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v13[5] = CFSTR("spzcs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canStreamSpatial);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  v13[6] = CFSTR("spzcr");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canRenderSpatial);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCPlayerAudioRoute humanDescription](self, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)humanDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t multiChannelSupport;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromMPCPlayerAudioRouteType(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("type: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("name: %@"), self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  multiChannelSupport = self->_multiChannelSupport;
  v9 = CFSTR("Unknown [CM-driven]");
  if (multiChannelSupport == 1)
    v9 = CFSTR("Available");
  if (multiChannelSupport == 2)
    v10 = CFSTR("Unavailable");
  else
    v10 = v9;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("multichannel support: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  if (self->_supportsSpatialization)
    objc_msgSend(v3, "addObject:", CFSTR("supportsSpatialization"));
  if (self->_isSpatializationEnabled)
    objc_msgSend(v3, "addObject:", CFSTR("spatializationIsEnabled"));
  if (self->_canRenderSpatial)
    objc_msgSend(v3, "addObject:", CFSTR("canRenderSpatialAudio"));
  if (self->_canStreamSpatial)
    objc_msgSend(v3, "addObject:", CFSTR("canStreamSpatialAudio"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (MPNowPlayingInfoAudioRoute)nowPlayingAudioRoute
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDDCAC0]);
  objc_msgSend(v3, "setType:", self->_type);
  objc_msgSend(v3, "setName:", self->_name);
  objc_msgSend(v3, "setSupportsSpatialization:", self->_supportsSpatialization);
  objc_msgSend(v3, "setSpatializationEnabled:", self->_isSpatializationEnabled);
  return (MPNowPlayingInfoAudioRoute *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)supportsSpatialization
{
  return self->_supportsSpatialization;
}

- (BOOL)isSpatializationEnabled
{
  return self->_isSpatializationEnabled;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  return self->_nowPlayingAudioFormat;
}

- (BOOL)canStreamSpatial
{
  return self->_canStreamSpatial;
}

- (BOOL)canRenderSpatial
{
  return self->_canRenderSpatial;
}

- (int64_t)multiChannelSupport
{
  return self->_multiChannelSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingAudioFormat, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionaryRepresentation:", v4);

  return v5;
}

@end
