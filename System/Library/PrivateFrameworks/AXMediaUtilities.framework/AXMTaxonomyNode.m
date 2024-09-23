@implementation AXMTaxonomyNode

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (unsigned)sceneClassId
{
  return self->_sceneClassId;
}

- (void)setSceneClassId:(unsigned int)a3
{
  self->_sceneClassId = a3;
}

- (NSMutableSet)detectorSceneClassIds
{
  return self->_detectorSceneClassIds;
}

- (void)setDetectorSceneClassIds:(id)a3
{
  objc_storeStrong((id *)&self->_detectorSceneClassIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorSceneClassIds, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
