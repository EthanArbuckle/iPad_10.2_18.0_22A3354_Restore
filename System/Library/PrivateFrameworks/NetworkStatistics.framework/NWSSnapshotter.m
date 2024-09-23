@implementation NWSSnapshotter

- (id)snapshot
{
  return 0;
}

- (unint64_t)kernelSourceRef
{
  return self->_kernelSourceRef;
}

- (void)setKernelSourceRef:(unint64_t)a3
{
  self->_kernelSourceRef = a3;
}

- (NWSSnapshotSource)snapshotSource
{
  return (NWSSnapshotSource *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSnapshotSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotSource, 0);
}

@end
