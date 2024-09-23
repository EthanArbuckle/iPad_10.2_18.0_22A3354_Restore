@implementation BKMotionDetectStateInfo

- (BKMotionDetectStateInfo)initWithMotionMatrix:(id)a3
{
  id v5;
  BKMotionDetectStateInfo *v6;
  BKMotionDetectStateInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMotionDetectStateInfo;
  v6 = -[BKMotionDetectStateInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_motionMatrix, a3);

  return v7;
}

- (NSArray)motionMatrix
{
  return self->_motionMatrix;
}

- (void)setMotionMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_motionMatrix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionMatrix, 0);
}

@end
