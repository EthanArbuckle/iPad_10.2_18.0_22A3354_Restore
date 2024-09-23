@implementation PHASESpatialMixer

- (PHASESpatialMixer)init
{
  -[PHASESpatialMixer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESpatialMixer)initWithIdentifier:(id)a3 spatialModelerSends:(id)a4 source:(id)a5 listener:(id)a6 sourceDirectivityModel:(Handle64)a7 listenerDirectivityModel:(Handle64)a8 distanceModel:(Handle64)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  PHASESpatialMixer *v19;
  uint64_t v20;
  NSArray *spatialModelerSends;
  PHASESpatialMixer *v22;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PHASESpatialMixer;
  v19 = -[PHASEMixer initWithIdentifier:](&v24, sel_initWithIdentifier_, v15);
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    spatialModelerSends = v19->_spatialModelerSends;
    v19->_spatialModelerSends = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_source, a5);
    objc_storeStrong((id *)&v19->_listener, a6);
    v19->_sourceDirectivityModel = a7;
    v19->_listenerDirectivityModel = a8;
    v19->_distanceModel = a9;
    v22 = v19;
  }

  return v19;
}

- (PHASESource)source
{
  return self->_source;
}

- (PHASEListener)listener
{
  return self->_listener;
}

- (NSArray)spatialModelerSends
{
  return self->_spatialModelerSends;
}

- (Handle64)sourceDirectivityModel
{
  return self->_sourceDirectivityModel;
}

- (void)setSourceDirectivityModel:(Handle64)a3
{
  self->_sourceDirectivityModel = a3;
}

- (Handle64)listenerDirectivityModel
{
  return self->_listenerDirectivityModel;
}

- (void)setListenerDirectivityModel:(Handle64)a3
{
  self->_listenerDirectivityModel = a3;
}

- (Handle64)distanceModel
{
  return self->_distanceModel;
}

- (void)setDistanceModel:(Handle64)a3
{
  self->_distanceModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialModelerSends, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
