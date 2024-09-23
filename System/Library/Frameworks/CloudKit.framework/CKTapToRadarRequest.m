@implementation CKTapToRadarRequest

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_radarDescription, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
  objc_storeStrong((id *)&self->_componentID, a3);
}

- (NSString)relatedRadar
{
  return self->_relatedRadar;
}

- (void)setRelatedRadar:(id)a3
{
  objc_storeStrong((id *)&self->_relatedRadar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedRadar, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
