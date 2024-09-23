@implementation ABPKAlgOutput

- (ABPKAlgOutput)initWithConfig:(id)a3
{
  id v4;
  ABPKAlgOutput *v5;
  ABPK2dSkeleton *v6;
  ABPK2dSkeleton *v7;
  ABPK2dSkeleton *v8;
  id v9;
  ABPKSkeleton *v10;
  ABPK2dSkeleton *v11;
  ABPKSkeleton *v12;
  ABPKAlgorithmState *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ABPKAlgOutput;
  v5 = -[ABPKAlgOutput init](&v15, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "algMode") == 4)
    {
      v6 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 1);
      -[ABPKAlgOutput setRawDetection2dSkeletonABPK:](v5, "setRawDetection2dSkeletonABPK:", v6);

      v7 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 1);
    }
    else
    {
      v8 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 0);
      -[ABPKAlgOutput setRawDetection2dSkeletonABPK:](v5, "setRawDetection2dSkeletonABPK:", v8);

      v7 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 0);
    }
    -[ABPKAlgOutput setDetection2dSkeletonABPK:](v5, "setDetection2dSkeletonABPK:", v7);

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ABPKAlgOutput setRawDetection2dSkeletonABPKArray:](v5, "setRawDetection2dSkeletonABPKArray:", v9);

    v10 = -[ABPKSkeleton initWithType:]([ABPKSkeleton alloc], "initWithType:", 3);
    -[ABPKAlgOutput setLiftingSkeletonABPK:](v5, "setLiftingSkeletonABPK:", v10);

    v11 = -[ABPK2dSkeleton initWithType:]([ABPK2dSkeleton alloc], "initWithType:", 2);
    -[ABPKAlgOutput setRegistered2dSkeletonABPK:](v5, "setRegistered2dSkeletonABPK:", v11);

    v12 = -[ABPKSkeleton initWithType:]([ABPKSkeleton alloc], "initWithType:", 4);
    -[ABPKAlgOutput setRetargetedSkeletonABPK:](v5, "setRetargetedSkeletonABPK:", v12);

    v13 = objc_alloc_init(ABPKAlgorithmState);
    -[ABPKAlgOutput setAlgState:](v5, "setAlgState:", v13);

  }
  return v5;
}

- (ABPK2dSkeleton)rawDetection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawDetection2dSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ABPK2dSkeleton)detection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetection2dSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)rawDetection2dSkeletonABPKArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRawDetection2dSkeletonABPKArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (ABPKSkeleton)liftingSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLiftingSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (ABPK2dSkeleton)registered2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegistered2dSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (ABPKSkeleton)retargetedSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRetargetedSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (ABPKAlgorithmState)algState
{
  return (ABPKAlgorithmState *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAlgState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algState, 0);
  objc_storeStrong((id *)&self->_retargetedSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_registered2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_liftingSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPKArray, 0);
  objc_storeStrong((id *)&self->_detection2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPK, 0);
}

@end
