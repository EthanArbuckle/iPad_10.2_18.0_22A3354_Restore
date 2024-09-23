@implementation PHASEMixerParameterEntry

- (PHASEMixerParameterEntry)init
{
  PHASEMixerParameterEntry *v2;
  PHASEMixerParameterEntry *v3;
  PHASESource *source;
  PHASEListener *listener;
  PHASEMixerParameterEntry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHASEMixerParameterEntry;
  v2 = -[PHASEMixerParameterEntry init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    source = v2->_source;
    v2->_source = 0;

    listener = v3->_listener;
    v3->_listener = 0;

    v3->_mixerType = 0;
    v6 = v3;
  }

  return v3;
}

- (int64_t)mixerType
{
  return self->_mixerType;
}

- (void)setMixerType:(int64_t)a3
{
  self->_mixerType = a3;
}

- (PHASESource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (PHASEListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
