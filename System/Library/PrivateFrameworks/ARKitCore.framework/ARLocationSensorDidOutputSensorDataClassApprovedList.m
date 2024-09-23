@implementation ARLocationSensorDidOutputSensorDataClassApprovedList

void __ARLocationSensorDidOutputSensorDataClassApprovedList_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ARLocationSensorDidOutputSensorDataClassApprovedList_locationSensorDidOutputSensorDataClassApprovedList;
  ARLocationSensorDidOutputSensorDataClassApprovedList_locationSensorDidOutputSensorDataClassApprovedList = v2;

}

@end
