@implementation VNSceneClassificationRequestConfiguration

- (VNSceneClassificationRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNSceneClassificationRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNSceneClassificationRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_maximumLeafObservations = 5;
    result->_maximumHierarchicalObservations = 5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNSceneClassificationRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSceneObservation:", self->_sceneObservation);
    objc_msgSend(v5, "setCustomHierarchy:", self->_customHierarchy);
    objc_msgSend(v5, "setMaximumLeafObservations:", self->_maximumLeafObservations);
    objc_msgSend(v5, "setMaximumHierarchicalObservations:", self->_maximumHierarchicalObservations);
  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)VNSceneClassificationRequestConfiguration;
  -[VNRequestConfiguration description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[VNSceneClassificationRequestConfiguration sceneObservation](self, "sceneObservation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR(" leaf=%lu hierarchy=%lu"), -[VNSceneClassificationRequestConfiguration maximumLeafObservations](self, "maximumLeafObservations"), -[VNSceneClassificationRequestConfiguration maximumHierarchicalObservations](self, "maximumHierarchicalObservations"));
  -[VNSceneClassificationRequestConfiguration customHierarchy](self, "customHierarchy");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v7);

  return v3;
}

- (VNSceneObservation)sceneObservation
{
  return self->_sceneObservation;
}

- (void)setSceneObservation:(id)a3
{
  objc_storeStrong((id *)&self->_sceneObservation, a3);
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  return self->_customHierarchy;
}

- (void)setCustomHierarchy:(id)a3
{
  objc_storeStrong((id *)&self->_customHierarchy, a3);
}

- (unint64_t)maximumLeafObservations
{
  return self->_maximumLeafObservations;
}

- (void)setMaximumLeafObservations:(unint64_t)a3
{
  self->_maximumLeafObservations = a3;
}

- (unint64_t)maximumHierarchicalObservations
{
  return self->_maximumHierarchicalObservations;
}

- (void)setMaximumHierarchicalObservations:(unint64_t)a3
{
  self->_maximumHierarchicalObservations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHierarchy, 0);
  objc_storeStrong((id *)&self->_sceneObservation, 0);
}

@end
