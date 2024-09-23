@implementation NSCloudKitMirroringResetMetadataRequest

- (void)dealloc
{
  objc_super v3;

  self->_objectIDsToReset = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringResetMetadataRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringResetMetadataRequest;
  v4 = -[NSCloudKitMirroringRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[10] = self->_objectIDsToReset;
  return v4;
}

- (NSSet)objectIDsToReset
{
  return self->_objectIDsToReset;
}

- (void)setObjectIDsToReset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
