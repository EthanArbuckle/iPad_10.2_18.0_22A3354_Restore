@implementation AR3DSkeletonDetectionResults

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  v6 = -[NSArray copyWithZone:](self->_detectedSkeletons, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  return (id)v5;
}

- (NSArray)detectedSkeletons
{
  return self->_detectedSkeletons;
}

- (void)setDetectedSkeletons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedSkeletons, 0);
}

@end
