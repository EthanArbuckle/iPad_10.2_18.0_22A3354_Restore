@implementation CRKFeatureDataStoreHeuristics

void __62__CRKFeatureDataStoreHeuristics_MCX_overrideIsForcedByFeature__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  +[CRKRestrictions remoteScreenObservationAllowed](CRKRestrictions, "remoteScreenObservationAllowed");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  +[CRKRestrictions screenShotAllowed](CRKRestrictions, "screenShotAllowed");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  +[CRKRestrictions classroomScreenObservationAllowed](CRKRestrictions, "classroomScreenObservationAllowed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[CRKRestrictions remoteScreenObservationAllowed](CRKRestrictions, "remoteScreenObservationAllowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions screenShotAllowed](CRKRestrictions, "screenShotAllowed", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)overrideIsForcedByFeature_overrideIsForcedByFeature;
  overrideIsForcedByFeature_overrideIsForcedByFeature = v7;

}

void __62__CRKFeatureDataStoreHeuristics_MCX_overrideFeaturesByFeature__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  +[CRKRestrictions remoteScreenObservationAllowed](CRKRestrictions, "remoteScreenObservationAllowed");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  +[CRKRestrictions screenShotAllowed](CRKRestrictions, "screenShotAllowed");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  +[CRKRestrictions classroomScreenObservationAllowed](CRKRestrictions, "classroomScreenObservationAllowed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[CRKRestrictions remoteScreenObservationAllowed](CRKRestrictions, "remoteScreenObservationAllowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions screenShotAllowed](CRKRestrictions, "screenShotAllowed", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)overrideFeaturesByFeature_overrideFeaturesByFeature;
  overrideFeaturesByFeature_overrideFeaturesByFeature = v7;

}

@end
