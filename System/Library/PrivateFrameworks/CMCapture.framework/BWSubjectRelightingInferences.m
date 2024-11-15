@implementation BWSubjectRelightingInferences

- (void)dealloc
{
  __CVBuffer *skinMask;
  __CVBuffer *personMask;
  objc_super v5;

  skinMask = self->_skinMask;
  if (skinMask)
    CFRelease(skinMask);
  personMask = self->_personMask;
  if (personMask)
    CFRelease(personMask);

  v5.receiver = self;
  v5.super_class = (Class)BWSubjectRelightingInferences;
  -[BWSubjectRelightingInferences dealloc](&v5, sel_dealloc);
}

- (__CVBuffer)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (__CVBuffer)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSArray)lowResPersonInstanceMasks
{
  return self->_lowResPersonInstanceMasks;
}

- (void)setLowResPersonInstanceMasks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)lowResPersonInstanceConfidences
{
  return self->_lowResPersonInstanceConfidences;
}

- (void)setLowResPersonInstanceConfidences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)lowResPersonInstanceBoundingBoxes
{
  return self->_lowResPersonInstanceBoundingBoxes;
}

- (void)setLowResPersonInstanceBoundingBoxes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)skinToneClassificationsForFaces
{
  return self->_skinToneClassificationsForFaces;
}

- (void)setSkinToneClassificationsForFaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
