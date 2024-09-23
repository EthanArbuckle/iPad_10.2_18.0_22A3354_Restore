@implementation SingleHandEnrolmentData

- (SingleHandEnrolmentData)init
{
  SingleHandEnrolmentData *v2;
  NSArray *boneLengths;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SingleHandEnrolmentData;
  v2 = -[SingleHandEnrolmentData init](&v5, sel_init);
  boneLengths = v2->_boneLengths;
  v2->_boneLengths = 0;

  return v2;
}

- (SingleHandEnrolmentData)initWithBoneLength:(id)a3
{
  NSArray *v4;
  SingleHandEnrolmentData *v5;
  NSArray *boneLengths;
  objc_super v8;

  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SingleHandEnrolmentData;
  v5 = -[SingleHandEnrolmentData init](&v8, sel_init);
  boneLengths = v5->_boneLengths;
  v5->_boneLengths = v4;

  return v5;
}

- (id)toJSONString
{
  return self->_boneLengths;
}

- (NSArray)boneLengths
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boneLengths, 0);
}

@end
