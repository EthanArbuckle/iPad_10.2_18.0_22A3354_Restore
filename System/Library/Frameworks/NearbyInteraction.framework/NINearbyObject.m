@implementation NINearbyObject

- (NINearbyObject)initWithToken:(id)a3
{
  id v6;
  NINearbyObject *v7;
  NINearbyObject *v8;
  simd_float3 v9;
  int v10;
  __int128 v11;
  NSString *deviceIdentifier;
  NSString *name;
  float v14;
  NSNumber *spatialScore;
  NSData *bluetoothAdvertisingAddress;
  NSUUID *bluetoothPeerIdentifier;
  uint64_t v18;
  uint64_t v19;
  UWBSignalFeatures *uwbSignalFeatures;
  char v21;
  NSString *debugDisplayInfo;
  void *v24;
  objc_super v25;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NINearbyObject.mm"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v25.receiver = self;
  v25.super_class = (Class)NINearbyObject;
  v7 = -[NINearbyObject init](&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_discoveryToken, a3);
    v8->_distance = NINearbyObjectDistanceNotAvailable;
    v9 = NINearbyObjectDirectionNotAvailable;
    v8->_distanceMeasurementQuality = 0;
    v10 = NINearbyObjectElevationNotAvailable;
    LODWORD(v8->_azimuth) = NINearbyObjectAzimuthNotAvailable;
    LODWORD(v8->_elevation) = v10;
    v11 = NINearbyObjectQuaternionNotAvailable;
    *(simd_float3 *)v8->_direction = v9;
    *(_OWORD *)v8->_anon_d0 = v11;
    *(_QWORD *)&v8->_timestamp = NINearbyObjectMachContTimeNotAvailable;
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_relationship = 4;
    v8->_deviceIdentifier = 0;

    name = v8->_name;
    v8->_motionState = 0;
    v8->_name = 0;
    v8->_verticalDirectionEstimate = 0;
    v14 = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngle = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngleAccuracy = v14;

    spatialScore = v8->_spatialScore;
    v8->_spatialScore = 0;

    bluetoothAdvertisingAddress = v8->_bluetoothAdvertisingAddress;
    v8->_bluetoothAdvertisingAddress = 0;

    bluetoothPeerIdentifier = v8->_bluetoothPeerIdentifier;
    v8->_bluetoothPeerIdentifier = 0;

    v18 = NINearbyObjectSignalStrengthNotAvailable;
    v8->_remoteTxAntennaMask = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
    v19 = NINearbyObjectRangeBiasEstimateNotAvailable;
    *(_QWORD *)&v8->_signalStrength = v18;
    *(_QWORD *)&v8->_rangeBiasEstimate = v19;
    *(_QWORD *)&v8->_rangeUncertainty = NINearbyObjectRangeUncertaintyNotAvailable;
    *(_OWORD *)v8->_worldPosition = NINearbyObjectWorldPositionNotAvailable;
    v8->_requiresBiasCorrection = NINearbyObjectBiasCorrectionNotRequired;
    uwbSignalFeatures = v8->_uwbSignalFeatures;
    v8->_uwbSignalFeatures = 0;

    v21 = NINearbyObjectRxStatusNotAvailable;
    v8->_nbRxStatus = NINearbyObjectRxStatusNotAvailable;
    v8->_mmsRxStatus = v21;
    *(_QWORD *)&v8->_nbRssi = NINearbyObjectNbRssiNotAvailable;
    *(_WORD *)&v8->_canInteract = 1;
    v8->_revokeFindingExperience = 0;
    LODWORD(v8->_boundedRegionRange) = NINearbyObjectRegionBoundaryRangeNotAvailable;
    debugDisplayInfo = v8->_debugDisplayInfo;
    v8->_algorithmSource = 1;
    v8->_debugDisplayInfo = 0;

  }
  return v8;
}

- (NINearbyObject)initWithNearbyObject:(id)a3
{
  id v5;
  NINearbyObject *v6;
  uint64_t v7;
  NIDiscoveryToken *discoveryToken;
  float v9;
  __int128 v10;
  float v11;
  float v12;
  __int128 v13;
  uint64_t v14;
  NSString *deviceIdentifier;
  double v16;
  uint64_t v17;
  NSString *name;
  float v19;
  float v20;
  uint64_t v21;
  NSNumber *spatialScore;
  uint64_t v23;
  NSData *bluetoothAdvertisingAddress;
  uint64_t v25;
  NSUUID *bluetoothPeerIdentifier;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  uint64_t v31;
  UWBSignalFeatures *uwbSignalFeatures;
  double v33;
  float v34;
  uint64_t v35;
  NSString *debugDisplayInfo;
  void *v38;
  objc_super v39;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NINearbyObject.mm"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v39.receiver = self;
  v39.super_class = (Class)NINearbyObject;
  v6 = -[NINearbyObject init](&v39, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "discoveryToken");
    v7 = objc_claimAutoreleasedReturnValue();
    discoveryToken = v6->_discoveryToken;
    v6->_discoveryToken = (NIDiscoveryToken *)v7;

    objc_msgSend(v5, "distance");
    v6->_distance = v9;
    objc_msgSend(v5, "direction");
    *(_OWORD *)v6->_direction = v10;
    v6->_distanceMeasurementQuality = objc_msgSend(v5, "distanceMeasurementQuality");
    objc_msgSend(v5, "azimuth");
    v6->_azimuth = v11;
    objc_msgSend(v5, "elevation");
    v6->_elevation = v12;
    objc_msgSend(v5, "quaternion");
    *(_OWORD *)v6->_anon_d0 = v13;
    v6->_relationship = objc_msgSend(v5, "relationship");
    objc_msgSend(v5, "deviceIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v14;

    objc_msgSend(v5, "timestamp");
    v6->_timestamp = v16;
    v6->_motionState = objc_msgSend(v5, "motionState");
    objc_msgSend(v5, "name");
    v17 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v17;

    v6->_verticalDirectionEstimate = objc_msgSend(v5, "verticalDirectionEstimate");
    objc_msgSend(v5, "horizontalAngle");
    v6->_horizontalAngle = v19;
    objc_msgSend(v5, "horizontalAngleAccuracy");
    v6->_horizontalAngleAccuracy = v20;
    objc_msgSend(v5, "spatialScore");
    v21 = objc_claimAutoreleasedReturnValue();
    spatialScore = v6->_spatialScore;
    v6->_spatialScore = (NSNumber *)v21;

    objc_msgSend(v5, "bluetoothAdvertisingAddress");
    v23 = objc_claimAutoreleasedReturnValue();
    bluetoothAdvertisingAddress = v6->_bluetoothAdvertisingAddress;
    v6->_bluetoothAdvertisingAddress = (NSData *)v23;

    objc_msgSend(v5, "bluetoothPeerIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    bluetoothPeerIdentifier = v6->_bluetoothPeerIdentifier;
    v6->_bluetoothPeerIdentifier = (NSUUID *)v25;

    objc_msgSend(v5, "signalStrength");
    v6->_signalStrength = v27;
    v6->_remoteTxAntennaMask = objc_msgSend(v5, "remoteTxAntennaMask");
    objc_msgSend(v5, "rangeBiasEstimate");
    v6->_rangeBiasEstimate = v28;
    objc_msgSend(v5, "rangeUncertainty");
    v6->_rangeUncertainty = v29;
    objc_msgSend(v5, "worldPosition");
    *(_OWORD *)v6->_worldPosition = v30;
    v6->_requiresBiasCorrection = objc_msgSend(v5, "requiresBiasCorrection");
    objc_msgSend(v5, "uwbSignalFeatures");
    v31 = objc_claimAutoreleasedReturnValue();
    uwbSignalFeatures = v6->_uwbSignalFeatures;
    v6->_uwbSignalFeatures = (UWBSignalFeatures *)v31;

    v6->_nbRxStatus = objc_msgSend(v5, "nbRxStatus");
    v6->_mmsRxStatus = objc_msgSend(v5, "mmsRxStatus");
    objc_msgSend(v5, "nbRssi");
    v6->_nbRssi = v33;
    v6->_canInteract = objc_msgSend(v5, "canInteract");
    v6->_resetARSession = objc_msgSend(v5, "resetARSession");
    v6->_revokeFindingExperience = objc_msgSend(v5, "revokeFindingExperience");
    objc_msgSend(v5, "boundedRegionRange");
    v6->_boundedRegionRange = v34;
    v6->_algorithmSource = objc_msgSend(v5, "algorithmSource");
    objc_msgSend(v5, "debugDisplayInfo");
    v35 = objc_claimAutoreleasedReturnValue();
    debugDisplayInfo = v6->_debugDisplayInfo;
    v6->_debugDisplayInfo = (NSString *)v35;

  }
  return v6;
}

- (NINearbyObject)init
{
  __assert_rtn("-[NINearbyObject init]", "NINearbyObject.mm", 199, "NO");
}

+ (NINearbyObject)new
{
  __assert_rtn("+[NINearbyObject new]", "NINearbyObject.mm", 204, "NO");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithNearbyObject:", self);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_discoveryToken, CFSTR("discoveryToken"));
  *(float *)&v4 = self->_distance;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("distance"), v4);
  objc_msgSend(v10, "encodeVector3:forKey:", CFSTR("direction"), *(double *)self->_direction);
  *(float *)&v5 = self->_azimuth;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("azimuth"), v5);
  *(float *)&v6 = self->_elevation;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("elevation"), v6);
  objc_msgSend(v10, "encodeQuat:forKey:", CFSTR("quaternion"), *(double *)self->_anon_d0);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_relationship, CFSTR("relationship"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_distanceMeasurementQuality, CFSTR("measurementQuality"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_motionState, CFSTR("motionState"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_verticalDirectionEstimate, CFSTR("verticalDirectionEstimate"));
  *(float *)&v7 = self->_horizontalAngle;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("horizontalAngle"), v7);
  *(float *)&v8 = self->_horizontalAngleAccuracy;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("horizontalAngleAccuracy"), v8);
  objc_msgSend(v10, "encodeObject:forKey:", self->_spatialScore, CFSTR("spatialScore"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_bluetoothAdvertisingAddress, CFSTR("bluetoothAdvertisingAddress"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_bluetoothPeerIdentifier, CFSTR("bluetoothPeerIdentifier"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("signalStrength"), self->_signalStrength);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_remoteTxAntennaMask, CFSTR("remoteTxAntennaMask"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("rangeBiasEstimate"), self->_rangeBiasEstimate);
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("rangeUncertainty"), self->_rangeUncertainty);
  objc_msgSend(v10, "encodeVector3:forKey:", CFSTR("worldPosition"), *(double *)self->_worldPosition);
  objc_msgSend(v10, "encodeBool:forKey:", self->_requiresBiasCorrection, CFSTR("requiresBiasCorrection"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_uwbSignalFeatures, CFSTR("uwbSignalFeatures"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_nbRxStatus, CFSTR("nbRxStatus"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_mmsRxStatus, CFSTR("mmsRxStatus"));
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("nbRssi"), self->_nbRssi);
  objc_msgSend(v10, "encodeBool:forKey:", self->_canInteract, CFSTR("canInteract"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_resetARSession, CFSTR("resetARSession"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_revokeFindingExperience, CFSTR("revokeFindingExperience"));
  *(float *)&v9 = self->_boundedRegionRange;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundedRegionRange"), v9);
  objc_msgSend(v10, "encodeInteger:forKey:", self->_algorithmSource, CFSTR("algorithmSource"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_debugDisplayInfo, CFSTR("debugDisplayInfo"));

}

- (NINearbyObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  float v6;
  __int128 v7;
  float v8;
  float v9;
  __int128 v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  double v30;
  double v31;
  float v32;
  float v33;
  void *v34;
  NINearbyObject *v35;
  NINearbyObject *v36;
  NINearbyObject *v37;
  uint64_t v39;
  char v40;
  char v41;
  char v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  char v45;
  __int128 v46;
  unsigned __int8 v47;
  __int128 v48;
  float v49;
  float v50;
  __int128 v51;
  float v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  objc_super v57;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoveryToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("distance"));
    v52 = v6;
    objc_msgSend(v4, "decodeVector3ForKey:", CFSTR("direction"));
    v51 = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("azimuth"));
    v50 = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("elevation"));
    v49 = v9;
    objc_msgSend(v4, "decodeQuatForKey:", CFSTR("quaternion"));
    v48 = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("relationship"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v13 = v12;
    v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("measurementQuality"));
    v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("motionState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spatialScore"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothAdvertisingAddress"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothPeerIdentifier"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("verticalDirectionEstimate"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("horizontalAngle"));
    v20 = v19;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("horizontalAngleAccuracy"));
    v22 = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("signalStrength"));
    v24 = v23;
    v47 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("remoteTxAntennaMask"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rangeBiasEstimate"));
    v26 = v25;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rangeUncertainty"));
    v28 = v27;
    objc_msgSend(v4, "decodeVector3ForKey:", CFSTR("worldPosition"));
    v46 = v29;
    v45 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresBiasCorrection"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uwbSignalFeatures"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("nbRxStatus"));
    v43 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("mmsRxStatus"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("nbRssi"));
    v31 = v30;
    v42 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canInteract"));
    v41 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resetARSession"));
    v40 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revokeFindingExperience"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundedRegionRange"));
    v33 = v32;
    v39 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("algorithmSource"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugDisplayInfo"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57.receiver = self;
    v57.super_class = (Class)NINearbyObject;
    v35 = -[NINearbyObject init](&v57, sel_init);
    v36 = v35;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_discoveryToken, v5);
      v36->_distance = v52;
      v36->_azimuth = v50;
      v36->_elevation = v49;
      *(_OWORD *)v36->_direction = v51;
      *(_OWORD *)v36->_anon_d0 = v48;
      v36->_relationship = v11;
      objc_storeStrong((id *)&v36->_deviceIdentifier, v56);
      v36->_timestamp = v13;
      v36->_distanceMeasurementQuality = v14;
      v36->_motionState = v15;
      objc_storeStrong((id *)&v36->_name, v16);
      v36->_verticalDirectionEstimate = v18;
      v36->_horizontalAngle = v20;
      v36->_horizontalAngleAccuracy = v22;
      objc_storeStrong((id *)&v36->_spatialScore, v55);
      objc_storeStrong((id *)&v36->_bluetoothAdvertisingAddress, v17);
      objc_storeStrong((id *)&v36->_bluetoothPeerIdentifier, v54);
      v36->_remoteTxAntennaMask = v47;
      v36->_signalStrength = v24;
      v36->_rangeBiasEstimate = v26;
      v36->_rangeUncertainty = v28;
      *(_OWORD *)v36->_worldPosition = v46;
      v36->_requiresBiasCorrection = v45;
      objc_storeStrong((id *)&v36->_uwbSignalFeatures, v53);
      v36->_nbRxStatus = v44;
      v36->_mmsRxStatus = v43;
      v36->_nbRssi = v31;
      v36->_canInteract = v42;
      v36->_resetARSession = v41;
      v36->_revokeFindingExperience = v40;
      v36->_boundedRegionRange = v33;
      v36->_algorithmSource = v39;
      objc_storeStrong((id *)&v36->_debugDisplayInfo, v34);
    }
    self = v36;

    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NINearbyObject *v5;
  NINearbyObject *v6;
  NIDiscoveryToken *discoveryToken;
  void *v8;
  void *v9;
  char v10;
  NSString *deviceIdentifier;
  void *v12;
  void *v13;
  char v14;
  float distance;
  float v16;
  float v17;
  float32x4_t v18;
  int64_t distanceMeasurementQuality;
  uint64_t v20;
  unint64_t relationship;
  uint64_t v22;
  double timestamp;
  double v24;
  double v25;
  int64_t motionState;
  double signalStrength;
  double v28;
  double v29;
  double rangeBiasEstimate;
  double v31;
  double v32;
  double v33;
  NSString *name;
  void *v35;
  void *v36;
  char v37;
  int64_t verticalDirectionEstimate;
  uint64_t v39;
  float v40;
  float v41;
  NSNumber *spatialScore;
  void *v43;
  void *v44;
  NSData *bluetoothAdvertisingAddress;
  void *v46;
  void *v47;
  NSUUID *bluetoothPeerIdentifier;
  void *v49;
  void *v50;
  char v51;
  float32x4_t v52;
  UWBSignalFeatures *uwbSignalFeatures;
  void *v54;
  void *v55;
  BOOL v56;
  int nbRxStatus;
  int v58;
  int mmsRxStatus;
  double v60;
  _BOOL4 canInteract;
  char v62;
  char v63;
  float v64;
  uint64_t v65;
  NSString *debugDisplayInfo;
  void *v67;
  void *v68;
  char v69;
  uint32x4_t v70;
  BOOL v71;
  uint32x4_t v72;
  int v73;
  char v74;
  char v75;
  char v76;
  char v77;
  int64_t algorithmSource;
  float v80;
  float boundedRegionRange;
  int v82;
  int revokeFindingExperience;
  int v84;
  char v85;
  int v86;
  int resetARSession;
  int v88;
  int v89;
  double v90;
  double nbRssi;
  int v92;
  uint64_t v93;
  int v94;
  int requiresBiasCorrection;
  char v96;
  float32x4_t v97;
  float32x4_t v98;
  char v99;
  char v100;
  float v101;
  float horizontalAngleAccuracy;
  uint64_t v103;
  int64_t v104;
  char v105;
  float v106;
  float horizontalAngle;
  double v108;
  double rangeUncertainty;
  int64_t v110;
  uint64_t v111;
  unint64_t v112;
  int v113;
  int remoteTxAntennaMask;
  uint64_t v115;
  float32x4_t v116;
  float32x4_t v117;
  id v118;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NINearbyObject *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v77 = 1;
LABEL_60:

      goto LABEL_61;
    }
    discoveryToken = self->_discoveryToken;
    v118 = v4;
    if (!discoveryToken)
    {
      -[NINearbyObject discoveryToken](v5, "discoveryToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v10 = 1;
LABEL_7:
        deviceIdentifier = self->_deviceIdentifier;
        if (!deviceIdentifier)
        {
          -[NINearbyObject deviceIdentifier](v6, "deviceIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v14 = 1;
LABEL_11:
            distance = self->_distance;
            -[NINearbyObject distance](v6, "distance");
            v17 = v16;
            v117 = *(float32x4_t *)self->_direction;
            -[NINearbyObject direction](v6, "direction");
            v116 = v18;
            distanceMeasurementQuality = self->_distanceMeasurementQuality;
            v20 = -[NINearbyObject distanceMeasurementQuality](v6, "distanceMeasurementQuality");
            relationship = self->_relationship;
            v22 = -[NINearbyObject relationship](v6, "relationship");
            timestamp = self->_timestamp;
            -[NINearbyObject timestamp](v6, "timestamp");
            v25 = v24;
            motionState = self->_motionState;
            v115 = -[NINearbyObject motionState](v6, "motionState");
            signalStrength = self->_signalStrength;
            -[NINearbyObject signalStrength](v6, "signalStrength");
            v29 = v28;
            remoteTxAntennaMask = self->_remoteTxAntennaMask;
            v113 = -[NINearbyObject remoteTxAntennaMask](v6, "remoteTxAntennaMask");
            rangeBiasEstimate = self->_rangeBiasEstimate;
            -[NINearbyObject rangeBiasEstimate](v6, "rangeBiasEstimate");
            v32 = v31;
            v110 = motionState;
            v111 = v22;
            v112 = relationship;
            rangeUncertainty = self->_rangeUncertainty;
            -[NINearbyObject rangeUncertainty](v6, "rangeUncertainty");
            v108 = v33;
            name = self->_name;
            if (!name)
            {
              -[NINearbyObject name](v6, "name");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v35)
              {
                v37 = 1;
LABEL_15:
                verticalDirectionEstimate = self->_verticalDirectionEstimate;
                v39 = -[NINearbyObject verticalDirectionEstimate](v6, "verticalDirectionEstimate");
                horizontalAngle = self->_horizontalAngle;
                -[NINearbyObject horizontalAngle](v6, "horizontalAngle");
                v106 = v40;
                v103 = v39;
                v104 = verticalDirectionEstimate;
                v105 = v37;
                horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
                -[NINearbyObject horizontalAngleAccuracy](v6, "horizontalAngleAccuracy");
                v101 = v41;
                spatialScore = self->_spatialScore;
                if (!spatialScore)
                {
                  -[NINearbyObject spatialScore](v6, "spatialScore");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v43)
                  {
                    v100 = 1;
LABEL_19:
                    bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    if (!bluetoothAdvertisingAddress)
                    {
                      -[NINearbyObject bluetoothAdvertisingAddress](v6, "bluetoothAdvertisingAddress");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v46)
                      {
                        v99 = 1;
LABEL_23:
                        bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        if (!bluetoothPeerIdentifier)
                        {
                          -[NINearbyObject bluetoothPeerIdentifier](v6, "bluetoothPeerIdentifier");
                          v49 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v49)
                          {
                            v51 = 1;
LABEL_27:
                            v98 = *(float32x4_t *)self->_worldPosition;
                            -[NINearbyObject worldPosition](v6, "worldPosition");
                            v97 = v52;
                            requiresBiasCorrection = self->_requiresBiasCorrection;
                            v96 = v51;
                            v94 = -[NINearbyObject requiresBiasCorrection](v6, "requiresBiasCorrection");
                            uwbSignalFeatures = self->_uwbSignalFeatures;
                            v93 = v20;
                            if (!uwbSignalFeatures)
                            {
                              -[NINearbyObject uwbSignalFeatures](v6, "uwbSignalFeatures");
                              v54 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v54)
                                goto LABEL_31;
                              uwbSignalFeatures = self->_uwbSignalFeatures;
                            }
                            -[NINearbyObject uwbSignalFeatures](v6, "uwbSignalFeatures");
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            v56 = -[UWBSignalFeatures isEqual:](uwbSignalFeatures, "isEqual:", v55);

                            LOBYTE(v54) = !v56;
LABEL_31:
                            nbRxStatus = self->_nbRxStatus;
                            v58 = -[NINearbyObject nbRxStatus](v6, "nbRxStatus");
                            mmsRxStatus = self->_mmsRxStatus;
                            v92 = -[NINearbyObject mmsRxStatus](v6, "mmsRxStatus");
                            v89 = mmsRxStatus;
                            nbRssi = self->_nbRssi;
                            -[NINearbyObject nbRssi](v6, "nbRssi");
                            v90 = v60;
                            canInteract = self->_canInteract;
                            v88 = -[NINearbyObject canInteract](v6, "canInteract");
                            resetARSession = self->_resetARSession;
                            v86 = -[NINearbyObject resetARSession](v6, "resetARSession");
                            v84 = canInteract;
                            v85 = (char)v54;
                            revokeFindingExperience = self->_revokeFindingExperience;
                            v82 = -[NINearbyObject revokeFindingExperience](v6, "revokeFindingExperience");
                            v62 = v14;
                            v63 = v10;
                            boundedRegionRange = self->_boundedRegionRange;
                            -[NINearbyObject boundedRegionRange](v6, "boundedRegionRange");
                            v80 = v64;
                            algorithmSource = self->_algorithmSource;
                            v65 = -[NINearbyObject algorithmSource](v6, "algorithmSource");
                            debugDisplayInfo = self->_debugDisplayInfo;
                            if (!debugDisplayInfo)
                            {
                              -[NINearbyObject debugDisplayInfo](v6, "debugDisplayInfo");
                              v67 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v67)
                              {
                                v69 = 1;
                                goto LABEL_35;
                              }
                              debugDisplayInfo = self->_debugDisplayInfo;
                            }
                            -[NINearbyObject debugDisplayInfo](v6, "debugDisplayInfo");
                            v68 = (void *)objc_claimAutoreleasedReturnValue();
                            v69 = -[NSString isEqualToString:](debugDisplayInfo, "isEqualToString:", v68);

LABEL_35:
                            v70 = (uint32x4_t)vceqq_f32(v98, v97);
                            v70.i32[3] = v70.i32[2];
                            v71 = (vminvq_u32(v70) & 0x80000000) == 0;
                            v72 = (uint32x4_t)vceqq_f32(v117, v116);
                            v72.i32[3] = v72.i32[2];
                            v73 = vminvq_u32(v72);
                            v74 = v63 ^ 1;
                            if (distance != v17)
                              v74 = 1;
                            if (v73 >= 0)
                              v74 = 1;
                            if (distanceMeasurementQuality != v93)
                              v74 = 1;
                            v75 = v74 | v62 ^ 1;
                            if (v112 != v111)
                              v75 = 1;
                            v76 = (nbRxStatus == v58) & ~(v75 | (timestamp != v25 || v110 != v115) | v105 ^ 1 | (v104 != v103) | (horizontalAngle != v106) | (horizontalAngleAccuracy != v101) | v100 ^ 1 | v99 ^ 1 | v96 ^ 1 | (signalStrength != v29) | (remoteTxAntennaMask != v113) | v71 | (requiresBiasCorrection != v94) | (rangeUncertainty != v108) | (rangeBiasEstimate != v32) | v85);
                            if (v89 != v92)
                              v76 = 0;
                            if (nbRssi != v90)
                              v76 = 0;
                            if (v84 != v88)
                              v76 = 0;
                            if (resetARSession != v86)
                              v76 = 0;
                            if (revokeFindingExperience != v82)
                              v76 = 0;
                            if (boundedRegionRange != v80)
                              v76 = 0;
                            if (algorithmSource != v65)
                              v76 = 0;
                            v77 = v76 & v69;
                            v4 = v118;
                            goto LABEL_60;
                          }
                          bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        }
                        -[NINearbyObject bluetoothPeerIdentifier](v6, "bluetoothPeerIdentifier");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        v51 = -[NSUUID isEqual:](bluetoothPeerIdentifier, "isEqual:", v50);

                        goto LABEL_27;
                      }
                      bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    }
                    -[NINearbyObject bluetoothAdvertisingAddress](v6, "bluetoothAdvertisingAddress");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = -[NSData isEqualToData:](bluetoothAdvertisingAddress, "isEqualToData:", v47);

                    goto LABEL_23;
                  }
                  spatialScore = self->_spatialScore;
                }
                -[NINearbyObject spatialScore](v6, "spatialScore");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = -[NSNumber isEqualToNumber:](spatialScore, "isEqualToNumber:", v44);

                goto LABEL_19;
              }
              name = self->_name;
            }
            -[NINearbyObject name](v6, "name");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[NSString isEqualToString:](name, "isEqualToString:", v36);

            goto LABEL_15;
          }
          deviceIdentifier = self->_deviceIdentifier;
        }
        -[NINearbyObject deviceIdentifier](v6, "deviceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", v13);

        goto LABEL_11;
      }
      discoveryToken = self->_discoveryToken;
    }
    -[NINearbyObject discoveryToken](v6, "discoveryToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NIDiscoveryToken isEqual:](discoveryToken, "isEqual:", v9);

    goto LABEL_7;
  }
  v77 = 0;
LABEL_61:

  return v77;
}

- (unint64_t)hash
{
  double v2;
  NIDiscoveryToken *discoveryToken;
  float distance;
  float v6;
  __n128 v7;
  uint32x4_t v8;
  double timestamp;
  double v10;
  double v11;
  float horizontalAngle;
  float v13;
  float v14;
  float horizontalAngleAccuracy;
  __n128 v16;
  uint32x4_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSUInteger v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  void *v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t HashFromSimdFloat3;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;

  discoveryToken = self->_discoveryToken;
  if (discoveryToken)
    v64 = -[NIDiscoveryToken hash](discoveryToken, "hash");
  else
    v64 = 0;
  distance = self->_distance;
  v6 = NINearbyObjectDistanceNotAvailable;
  if (distance == NINearbyObjectDistanceNotAvailable)
  {
    v63 = 0;
  }
  else
  {
    *(float *)&v2 = self->_distance;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v33, "hash");
  }
  v7 = *(__n128 *)self->_direction;
  v8 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectDirectionNotAvailable, (float32x4_t)v7);
  v8.i32[3] = v8.i32[2];
  if ((vminvq_u32(v8) & 0x80000000) != 0)
    HashFromSimdFloat3 = 0;
  else
    HashFromSimdFloat3 = extractHashFromSimdFloat3(v7);
  timestamp = self->_timestamp;
  v10 = *(double *)&NINearbyObjectMachContTimeNotAvailable;
  if (timestamp == *(double *)&NINearbyObjectMachContTimeNotAvailable)
  {
    v61 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v32, "hash");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_distanceMeasurementQuality);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v71, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_motionState);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v70, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_relationship);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v69, "hash");
  v56 = -[NSString hash](self->_deviceIdentifier, "hash");
  v54 = -[NSString hash](self->_name, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_verticalDirectionEstimate);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v68, "hash");
  horizontalAngle = self->_horizontalAngle;
  v13 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable)
  {
    v52 = 0;
  }
  else
  {
    *(float *)&v11 = self->_horizontalAngle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v31, "hash");
  }
  v14 = NINearbyObjectAngleNotAvailable;
  horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
  {
    v49 = 0;
  }
  else
  {
    *(float *)&v11 = self->_horizontalAngleAccuracy;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v30, "hash");
  }
  v50 = -[NSNumber hash](self->_spatialScore, "hash");
  v48 = -[NSData hash](self->_bluetoothAdvertisingAddress, "hash");
  v47 = -[NSUUID hash](self->_bluetoothPeerIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_signalStrength);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v67, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_remoteTxAntennaMask);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v66, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rangeBiasEstimate);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v65, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rangeUncertainty);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v59, "hash");
  v16 = *(__n128 *)self->_worldPosition;
  v17 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectWorldPositionNotAvailable, (float32x4_t)v16);
  v17.i32[3] = v17.i32[2];
  if ((vminvq_u32(v17) & 0x80000000) != 0)
    v42 = 0;
  else
    v42 = extractHashFromSimdFloat3(v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresBiasCorrection);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v55, "hash");
  v40 = -[UWBSignalFeatures hash](self->_uwbSignalFeatures, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nbRxStatus);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v51, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mmsRxStatus);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v18, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_nbRssi);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canInteract);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v20, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_resetARSession);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_revokeFindingExperience);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v22, "hash");
  *(float *)&v23 = self->_boundedRegionRange;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_algorithmSource);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");
  v28 = -[NSString hash](self->_debugDisplayInfo, "hash");

  if (horizontalAngleAccuracy != v14)
  if (horizontalAngle != v13)

  if (timestamp != v10)
  if (distance != v6)

  return v63 ^ v64 ^ HashFromSimdFloat3 ^ v61 ^ v60 ^ v58 ^ v57 ^ v56 ^ v54 ^ v53 ^ v52 ^ v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v25 ^ v27 ^ v28;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NIDiscoveryToken *discoveryToken;
  void *v8;
  float distance;
  float32x4_t v10;
  uint32x4_t v11;
  float horizontalAngle;
  unint64_t verticalDirectionEstimate;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  discoveryToken = self->_discoveryToken;
  if (discoveryToken)
  {
    -[NIDiscoveryToken descriptionInternal](discoveryToken, "descriptionInternal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Token: %@"), v8);

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR("Token: null"));
  }
  distance = self->_distance;
  if (distance == NINearbyObjectDistanceNotAvailable)
    objc_msgSend(v6, "appendString:", CFSTR(", Distance not available"));
  else
    objc_msgSend(v6, "appendFormat:", CFSTR(", Distance: %.2fm"), distance);
  v10 = *(float32x4_t *)self->_direction;
  v11 = (uint32x4_t)vceqq_f32(v10, (float32x4_t)NINearbyObjectDirectionNotAvailable);
  v11.i32[3] = v11.i32[2];
  if ((vminvq_u32(v11) & 0x80000000) != 0)
    objc_msgSend(v6, "appendString:", CFSTR(", Direction not available"));
  else
    objc_msgSend(v6, "appendFormat:", CFSTR(", Direction: (%.3f,%.3f,%.3f)"), v10.f32[0], v10.f32[1], v10.f32[2]);
  horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable)
    objc_msgSend(v6, "appendFormat:", CFSTR(", Horizontal Angle: %.2frad"), horizontalAngle);
  else
    objc_msgSend(v6, "appendString:", CFSTR(", Horizontal Angle not available"));
  verticalDirectionEstimate = self->_verticalDirectionEstimate;
  if (verticalDirectionEstimate >= 5)
    __assert_rtn("NINearbyObjectVerticalDirectionEstimateToString", "NINearbyObject.mm", 78, "false");
  objc_msgSend(v6, "appendFormat:", CFSTR(", Vertical Direction Estimate: %@ "), off_1E4362AD0[verticalDirectionEstimate]);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)descriptionInternal
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float horizontalAngleAccuracy;
  float v10;
  __CFString *v11;
  unint64_t distanceMeasurementQuality;
  unint64_t motionState;
  double signalStrength;
  double v15;
  __CFString *v16;
  int remoteTxAntennaMask;
  int v18;
  __CFString *v19;
  float32x4_t v20;
  uint32x4_t v21;
  const __CFString *v22;
  double rangeBiasEstimate;
  double v24;
  __CFString *v25;
  double rangeUncertainty;
  double v27;
  __CFString *v28;
  void *v29;
  int nbRxStatus;
  int v31;
  __CFString *v32;
  int mmsRxStatus;
  int v34;
  __CFString *v35;
  double nbRssi;
  double v37;
  __CFString *v38;
  const __CFString *v39;
  int v41;
  const char *v42;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[NINearbyObject description](self, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  -[NINearbyObject deviceIdentifer](self, "deviceIdentifer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", deviceIdentifier: %@"), v8);

  horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  v10 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
  {
    v11 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2frad"), horizontalAngleAccuracy);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", HorizAngleAcc: %@"), v11);
  if (horizontalAngleAccuracy != v10)

  distanceMeasurementQuality = self->_distanceMeasurementQuality;
  if (distanceMeasurementQuality > 3)
  {
    v41 = 46;
    v42 = "NIDistanceMeasurementQualityToString";
    goto LABEL_55;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", Ranging Quality: %@ "), off_1E4362AF8[distanceMeasurementQuality]);
  motionState = self->_motionState;
  if (motionState >= 3)
  {
    v41 = 60;
    v42 = "NIMotionActivityStateToString";
LABEL_55:
    __assert_rtn(v42, "NINearbyObject.mm", v41, "false");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", Motion State: %@"), off_1E4362B18[motionState]);
  signalStrength = self->_signalStrength;
  v15 = *(double *)&NINearbyObjectSignalStrengthNotAvailable;
  if (signalStrength == *(double *)&NINearbyObjectSignalStrengthNotAvailable)
  {
    v16 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f dBm"), *(_QWORD *)&self->_signalStrength);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", Signal Strength: %@"), v16);
  if (signalStrength != v15)

  remoteTxAntennaMask = self->_remoteTxAntennaMask;
  v18 = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
  if (remoteTxAntennaMask == NINearbyObjectRemoteTxAntennaMaskNotAvailable)
  {
    v19 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%02x"), self->_remoteTxAntennaMask);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", Remote Tx Antenna Mask: %@"), v19);
  if (remoteTxAntennaMask != v18)

  v20 = *(float32x4_t *)self->_worldPosition;
  v21 = (uint32x4_t)vceqq_f32(v20, (float32x4_t)NINearbyObjectWorldPositionNotAvailable);
  v21.i32[3] = v21.i32[2];
  if ((vminvq_u32(v21) & 0x80000000) != 0)
    objc_msgSend(v6, "appendString:", CFSTR(", World Position not available"));
  else
    objc_msgSend(v6, "appendFormat:", CFSTR(", World Position: (%.2f,%.2f,%.2f)"), v20.f32[0], v20.f32[1], v20.f32[2]);
  if (self->_requiresBiasCorrection)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(", Require Bias Correction: %@"), v22);
  rangeBiasEstimate = self->_rangeBiasEstimate;
  v24 = *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable;
  if (rangeBiasEstimate == *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable)
  {
    v25 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f m"), *(_QWORD *)&self->_rangeBiasEstimate);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", Range Bias Estimate: %@"), v25);
  if (rangeBiasEstimate != v24)

  rangeUncertainty = self->_rangeUncertainty;
  v27 = *(double *)&NINearbyObjectRangeUncertaintyNotAvailable;
  if (rangeUncertainty == *(double *)&NINearbyObjectRangeUncertaintyNotAvailable)
  {
    v28 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f m"), *(_QWORD *)&self->_rangeUncertainty);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", Range Uncertainty: %@"), v28);
  if (rangeUncertainty != v27)

  -[UWBSignalFeatures description](self->_uwbSignalFeatures, "description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", Bias features: %@"), v29);

  nbRxStatus = self->_nbRxStatus;
  v31 = NINearbyObjectRxStatusNotAvailable;
  if (nbRxStatus == NINearbyObjectRxStatusNotAvailable)
  {
    v32 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_nbRxStatus);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", NB Rx status: %@"), v32);
  if (nbRxStatus != v31)

  mmsRxStatus = self->_mmsRxStatus;
  v34 = NINearbyObjectRxStatusNotAvailable;
  if (mmsRxStatus == NINearbyObjectRxStatusNotAvailable)
  {
    v35 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_mmsRxStatus);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", UWB Rx status: %@"), v35);
  if (mmsRxStatus != v34)

  nbRssi = self->_nbRssi;
  v37 = *(double *)&NINearbyObjectNbRssiNotAvailable;
  if (nbRssi == *(double *)&NINearbyObjectNbRssiNotAvailable)
  {
    v38 = CFSTR("-");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f dBm"), *(_QWORD *)&self->_nbRssi);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(", NB RSSI: %@"), v38);
  if (nbRssi != v37)

  if (self->_canInteract)
    v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(", Can Interact: %@"), v39);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)deviceIdentifer
{
  return self->_deviceIdentifier;
}

+ (id)fauxObjectWithDiscoveryToken:(id)a3 name:(id)a4 deviceIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  NINearbyObject *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v7);
  -[NINearbyObject setName:](v10, "setName:", v8);
  -[NINearbyObject setDeviceIdentifier:](v10, "setDeviceIdentifier:", v9);

  return v10;
}

- (void)overrideDistance:(float)a3
{
  self->_distance = a3;
}

- (void)overrideDirection:(NINearbyObject *)self
{
  __int128 v2;

  *(_OWORD *)self->_direction = v2;
}

- (void)overrideRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (void)overrideDistanceMeasurementQuality:(int64_t)a3
{
  self->_distanceMeasurementQuality = a3;
}

- (void)overrideMotionState:(int64_t)a3
{
  self->_motionState = a3;
}

- (void)overrideTimestamp:(float)a3
{
  self->_timestamp = a3;
}

- (void)overrideSpatialScore:(id)a3
{
  objc_storeStrong((id *)&self->_spatialScore, a3);
}

- (NIDiscoveryToken)discoveryToken
{
  return self->_discoveryToken;
}

- (void)setDiscoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (simd_float3)direction
{
  return *(simd_float3 *)self->_direction;
}

- (void)setDirection:(NINearbyObject *)self
{
  __int128 v2;

  *(_OWORD *)self->_direction = v2;
}

- (NINearbyObjectVerticalDirectionEstimate)verticalDirectionEstimate
{
  return self->_verticalDirectionEstimate;
}

- (void)setVerticalDirectionEstimate:(int64_t)a3
{
  self->_verticalDirectionEstimate = a3;
}

- (float)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(float)a3
{
  self->_horizontalAngle = a3;
}

- (__n128)quaternion
{
  return a1[13];
}

- (__n128)setQuaternion:(__n128 *)result
{
  result[13] = a2;
  return result;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)elevation
{
  return self->_elevation;
}

- (void)setElevation:(float)a3
{
  self->_elevation = a3;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)distanceMeasurementQuality
{
  return self->_distanceMeasurementQuality;
}

- (void)setDistanceMeasurementQuality:(int64_t)a3
{
  self->_distanceMeasurementQuality = a3;
}

- (int64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int64_t)a3
{
  self->_motionState = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)spatialScore
{
  return self->_spatialScore;
}

- (void)setSpatialScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)bluetoothAdvertisingAddress
{
  return self->_bluetoothAdvertisingAddress;
}

- (void)setBluetoothAdvertisingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSUUID)bluetoothPeerIdentifier
{
  return self->_bluetoothPeerIdentifier;
}

- (void)setBluetoothPeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (float)horizontalAngleAccuracy
{
  return self->_horizontalAngleAccuracy;
}

- (void)setHorizontalAngleAccuracy:(float)a3
{
  self->_horizontalAngleAccuracy = a3;
}

- (double)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(double)a3
{
  self->_signalStrength = a3;
}

- (double)rangeBiasEstimate
{
  return self->_rangeBiasEstimate;
}

- (void)setRangeBiasEstimate:(double)a3
{
  self->_rangeBiasEstimate = a3;
}

- (double)rangeUncertainty
{
  return self->_rangeUncertainty;
}

- (void)setRangeUncertainty:(double)a3
{
  self->_rangeUncertainty = a3;
}

- (unsigned)remoteTxAntennaMask
{
  return self->_remoteTxAntennaMask;
}

- (void)setRemoteTxAntennaMask:(unsigned __int8)a3
{
  self->_remoteTxAntennaMask = a3;
}

- (__n128)worldPosition
{
  return a1[14];
}

- (void)setWorldPosition:(NINearbyObject *)self
{
  __int128 v2;

  *(_OWORD *)self->_worldPosition = v2;
}

- (BOOL)requiresBiasCorrection
{
  return self->_requiresBiasCorrection;
}

- (void)setRequiresBiasCorrection:(BOOL)a3
{
  self->_requiresBiasCorrection = a3;
}

- (UWBSignalFeatures)uwbSignalFeatures
{
  return self->_uwbSignalFeatures;
}

- (void)setUwbSignalFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unsigned)nbRxStatus
{
  return self->_nbRxStatus;
}

- (void)setNbRxStatus:(unsigned __int8)a3
{
  self->_nbRxStatus = a3;
}

- (unsigned)mmsRxStatus
{
  return self->_mmsRxStatus;
}

- (void)setMmsRxStatus:(unsigned __int8)a3
{
  self->_mmsRxStatus = a3;
}

- (double)nbRssi
{
  return self->_nbRssi;
}

- (void)setNbRssi:(double)a3
{
  self->_nbRssi = a3;
}

- (BOOL)canInteract
{
  return self->_canInteract;
}

- (void)setCanInteract:(BOOL)a3
{
  self->_canInteract = a3;
}

- (float)boundedRegionRange
{
  return self->_boundedRegionRange;
}

- (void)setBoundedRegionRange:(float)a3
{
  self->_boundedRegionRange = a3;
}

- (int64_t)algorithmSource
{
  return self->_algorithmSource;
}

- (void)setAlgorithmSource:(int64_t)a3
{
  self->_algorithmSource = a3;
}

- (NSString)debugDisplayInfo
{
  return self->_debugDisplayInfo;
}

- (void)setDebugDisplayInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)resetARSession
{
  return self->_resetARSession;
}

- (void)setResetARSession:(BOOL)a3
{
  self->_resetARSession = a3;
}

- (BOOL)revokeFindingExperience
{
  return self->_revokeFindingExperience;
}

- (void)setRevokeFindingExperience:(BOOL)a3
{
  self->_revokeFindingExperience = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDisplayInfo, 0);
  objc_storeStrong((id *)&self->_uwbSignalFeatures, 0);
  objc_storeStrong((id *)&self->_bluetoothPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_spatialScore, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveryToken, 0);
}

@end
