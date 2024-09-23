@implementation BiometricKitEnrollProgressMergedComponent

- (BiometricKitEnrollProgressMergedComponent)init
{
  BiometricKitEnrollProgressMergedComponent *v2;
  BiometricKitEnrollProgressMergedComponent *v3;
  BiometricKitEnrollProgressCoordinates *transformationCoordinates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BiometricKitEnrollProgressMergedComponent;
  v2 = -[BiometricKitEnrollProgressMergedComponent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    transformationCoordinates = v2->_transformationCoordinates;
    v2->_transformationCoordinates = 0;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BiometricKitEnrollProgressMergedComponent setTransformationCoordinates:](self, "setTransformationCoordinates:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitEnrollProgressMergedComponent;
  -[BiometricKitEnrollProgressMergedComponent dealloc](&v3, sel_dealloc);
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (BiometricKitEnrollProgressCoordinates)transformationCoordinates
{
  return self->_transformationCoordinates;
}

- (void)setTransformationCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_transformationCoordinates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformationCoordinates, 0);
}

@end
