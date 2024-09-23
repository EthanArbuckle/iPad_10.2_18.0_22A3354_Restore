@implementation FIDataSeparatedICloudDrive

+ (pair<FINode)findUnderlyingNodes
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  pair<FINode *, FINode *> result;

  v3 = v2;
  +[FINode dataSeparatedICloudLibrariesContainer](FINode, "dataSeparatedICloudLibrariesContainer");
  v4 = objc_claimAutoreleasedReturnValue();
  +[FINode dataSeparatedICloudDefaultContainer](FINode, "dataSeparatedICloudDefaultContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = v4;
  v3[1] = (uint64_t)v5;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

@end
