@implementation CLEmergencyLocationSelectorConfig

- (id)initForFeature:(int64_t)a3 withUpdatesEnabled:(BOOL)a4
{
  CLEmergencyLocationSelectorConfig *v6;
  CLEmergencyLocationSelectorConfig *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v16;
  char *v18;
  objc_super v19;
  uint8_t buf[1640];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)CLEmergencyLocationSelectorConfig;
  v6 = -[CLEmergencyLocationSelectorConfig init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_firstUpdateEnabled = 0;
    v6->_feature = a3;
    v6->_firstUpdateTimeout = 25.0;
    v6->_periodicUpdatesEnabled = a4;
    v6->_firstLocationUsabilityCriteria = objc_alloc_init(CLEmergencyLocationUsabilityCriteria);
    v7->_locationUpdateUsabilityCriteria = objc_alloc_init(CLEmergencyLocationUsabilityCriteria);
    v7->_firstLocationEarlyReturnEnabled = 1;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)&v7->_firstLocationTimeout = _Q0;
    v7->_locationUpdateMinDelay = 1.0;
    *(_OWORD *)&v7->_firstLocationMaxEarlyReturnHunc = xmmword_18F776340;
    *(_OWORD *)&v7->_locationUpdateHuncReductionToSendEarly = xmmword_18F776350;
    *(_OWORD *)&v7->_locationUpdateDistanceMovedToSendEarly = xmmword_18F776360;
    if (!v7->_feature)
      objc_msgSend_setDefaultsForSIP(v7, v8, v9, v10);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v16 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorConfig,initForFeature:withUpdatesEnabled:,completed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelectorConfig initForFeature:withUpdatesEnabled:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
  }
  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  char *v4;
  objc_super v5;
  int v6;
  CLEmergencyLocationSelectorConfig *v7;
  uint8_t buf[4];
  CLEmergencyLocationSelectorConfig *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v9 = self;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorConfig,self:%{private}@,dealloc,initiated", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v6 = 138477827;
    v7 = self;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelectorConfig dealloc]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)CLEmergencyLocationSelectorConfig;
  -[CLEmergencyLocationSelectorConfig dealloc](&v5, sel_dealloc);
}

- (void)setDefaultsForSIP
{
  uint64_t v2;
  uint64_t v3;
  _BOOL4 periodicUpdatesEnabled;

  self->_firstLocationTimeout = 6.0;
  objc_msgSend_setMaxUsableHunc_(self->_firstLocationUsabilityCriteria, a2, v2, v3, 1000.0);
  self->_firstLocationMaxEarlyReturnVunc = 1.79769313e308;
  periodicUpdatesEnabled = self->_periodicUpdatesEnabled;
  self->_firstUpdateEnabled = periodicUpdatesEnabled;
  self->_firstUpdateTimeout = 25.0;
  if (periodicUpdatesEnabled)
  {
    *(_OWORD *)&self->_locationUpdateTimeout = xmmword_18F776370;
    self->_firstLocationMaxEarlyReturnHunc = 165.0;
  }
  else
  {
    self->_firstLocationEarlyReturnEnabled = 0;
  }
}

+ (id)featureString:(int64_t)a3
{
  return CFSTR("SIP");
}

- (void)printConfiguration
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int UpdateEnabled;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int LocationEarlyReturnEnabled;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *LocationUsabilityCriteria;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *updated;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint8_t buf[4];
  uint64_t v131;
  __int16 v132;
  int v133;
  __int16 v134;
  int v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  double v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  int v145;
  __int16 v146;
  uint64_t v147;
  __int16 v148;
  uint64_t v149;
  __int16 v150;
  uint64_t v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v3 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend_feature(self, v4, v5, v6);
    v10 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v8, v7, v9);
    UpdateEnabled = objc_msgSend_firstUpdateEnabled(self, v11, v12, v13);
    v18 = objc_msgSend_periodicUpdatesEnabled(self, v15, v16, v17);
    objc_msgSend_firstLocationMaxEarlyReturnHunc(self, v19, v20, v21);
    v23 = v22;
    objc_msgSend_firstLocationMaxEarlyReturnVunc(self, v24, v25, v26);
    v30 = -1.0;
    if (v31 != 1.79769313e308)
    {
      objc_msgSend_firstLocationMaxEarlyReturnVunc(self, v27, v28, v29);
      v30 = v32;
    }
    objc_msgSend_locationUpdateHuncReductionToSendEarly(self, v27, v28, v29);
    v34 = v33;
    objc_msgSend_locationUpdateDistanceMovedToSendEarly(self, v35, v36, v37);
    v39 = v38;
    LocationEarlyReturnEnabled = objc_msgSend_firstLocationEarlyReturnEnabled(self, v40, v41, v42);
    objc_msgSend_firstLocationTimeout(self, v44, v45, v46);
    v48 = v47;
    objc_msgSend_locationUpdateTimeout(self, v49, v50, v51);
    v53 = v52;
    objc_msgSend_locationUpdateMinDelay(self, v54, v55, v56);
    *(_DWORD *)buf = 138545922;
    v131 = v10;
    v132 = 1026;
    v133 = UpdateEnabled;
    v134 = 1026;
    v135 = v18;
    v136 = 2050;
    v137 = v23;
    v138 = 2050;
    v139 = v30;
    v140 = 2050;
    v141 = v34;
    v142 = 2050;
    v143 = v39;
    v144 = 1026;
    v145 = LocationEarlyReturnEnabled;
    v146 = 2050;
    v147 = v48;
    v148 = 2050;
    v149 = v53;
    v150 = 2050;
    v151 = v57;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,printConfiguration,firstUpdateEnabled,%{public}d,periodicUpdatesEnabled,%{public}d,firstLocationMaxEarlyReturnHunc,%{public}f,firstLocationMaxEarlyReturnVunc,%{public}f,locationUpdateHuncReductionToSendEarly,%{public}f,locationUpdateDistanceMovedToSendEarly,%{public}f,firstLocationEarlyReturnEnabled,%{public}d,firstLocationTimeout,%{public}f,locationUpdateTimeout,%{public}f,locationUpdateMinDelay,%{public}f", buf, 0x64u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v95 = objc_msgSend_feature(self, v92, v93, v94);
    objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v96, v95, v97);
    objc_msgSend_firstUpdateEnabled(self, v98, v99, v100);
    objc_msgSend_periodicUpdatesEnabled(self, v101, v102, v103);
    objc_msgSend_firstLocationMaxEarlyReturnHunc(self, v104, v105, v106);
    objc_msgSend_firstLocationMaxEarlyReturnVunc(self, v107, v108, v109);
    if (v113 != 1.79769313e308)
      objc_msgSend_firstLocationMaxEarlyReturnVunc(self, v110, v111, v112);
    objc_msgSend_locationUpdateHuncReductionToSendEarly(self, v110, v111, v112);
    objc_msgSend_locationUpdateDistanceMovedToSendEarly(self, v114, v115, v116);
    objc_msgSend_firstLocationEarlyReturnEnabled(self, v117, v118, v119);
    objc_msgSend_firstLocationTimeout(self, v120, v121, v122);
    objc_msgSend_locationUpdateTimeout(self, v123, v124, v125);
    objc_msgSend_locationUpdateMinDelay(self, v126, v127, v128);
    v129 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationSelectorConfig printConfiguration]", "CoreLocation: %s\n", v129);
    if (v129 != (char *)buf)
      free(v129);
  }
  LocationUsabilityCriteria = (void *)objc_msgSend_firstLocationUsabilityCriteria(self, v58, v59, v60);
  v62 = (void *)MEMORY[0x1E0CB3940];
  v66 = objc_msgSend_feature(self, v63, v64, v65);
  v69 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v67, v66, v68);
  v72 = objc_msgSend_stringWithFormat_(v62, v70, (uint64_t)CFSTR("#CLELS,%@,first location usability criteria"), v71, v69);
  objc_msgSend_printUsabilityCriteria_(LocationUsabilityCriteria, v73, v72, v74);
  updated = (void *)objc_msgSend_locationUpdateUsabilityCriteria(self, v75, v76, v77);
  v79 = (void *)MEMORY[0x1E0CB3940];
  v83 = objc_msgSend_feature(self, v80, v81, v82);
  v86 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v84, v83, v85);
  v89 = objc_msgSend_stringWithFormat_(v79, v87, (uint64_t)CFSTR("#CLELS,%@,location update usability criteria"), v88, v86);
  objc_msgSend_printUsabilityCriteria_(updated, v90, v89, v91);
}

- (BOOL)firstLocationEarlyReturnEnabled
{
  return self->_firstLocationEarlyReturnEnabled;
}

- (void)setFirstLocationEarlyReturnEnabled:(BOOL)a3
{
  self->_firstLocationEarlyReturnEnabled = a3;
}

- (double)firstLocationTimeout
{
  return self->_firstLocationTimeout;
}

- (void)setFirstLocationTimeout:(double)a3
{
  self->_firstLocationTimeout = a3;
}

- (double)locationUpdateTimeout
{
  return self->_locationUpdateTimeout;
}

- (void)setLocationUpdateTimeout:(double)a3
{
  self->_locationUpdateTimeout = a3;
}

- (double)locationUpdateMinDelay
{
  return self->_locationUpdateMinDelay;
}

- (void)setLocationUpdateMinDelay:(double)a3
{
  self->_locationUpdateMinDelay = a3;
}

- (int64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(int64_t)a3
{
  self->_feature = a3;
}

- (BOOL)firstUpdateEnabled
{
  return self->_firstUpdateEnabled;
}

- (void)setFirstUpdateEnabled:(BOOL)a3
{
  self->_firstUpdateEnabled = a3;
}

- (double)firstUpdateTimeout
{
  return self->_firstUpdateTimeout;
}

- (void)setFirstUpdateTimeout:(double)a3
{
  self->_firstUpdateTimeout = a3;
}

- (BOOL)periodicUpdatesEnabled
{
  return self->_periodicUpdatesEnabled;
}

- (void)setPeriodicUpdatesEnabled:(BOOL)a3
{
  self->_periodicUpdatesEnabled = a3;
}

- (CLEmergencyLocationUsabilityCriteria)firstLocationUsabilityCriteria
{
  return self->_firstLocationUsabilityCriteria;
}

- (void)setFirstLocationUsabilityCriteria:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (double)firstLocationMaxEarlyReturnHunc
{
  return self->_firstLocationMaxEarlyReturnHunc;
}

- (void)setFirstLocationMaxEarlyReturnHunc:(double)a3
{
  self->_firstLocationMaxEarlyReturnHunc = a3;
}

- (double)firstLocationMaxEarlyReturnVunc
{
  return self->_firstLocationMaxEarlyReturnVunc;
}

- (void)setFirstLocationMaxEarlyReturnVunc:(double)a3
{
  self->_firstLocationMaxEarlyReturnVunc = a3;
}

- (CLEmergencyLocationUsabilityCriteria)locationUpdateUsabilityCriteria
{
  return self->_locationUpdateUsabilityCriteria;
}

- (void)setLocationUpdateUsabilityCriteria:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (double)locationUpdateHuncReductionToSendEarly
{
  return self->_locationUpdateHuncReductionToSendEarly;
}

- (void)setLocationUpdateHuncReductionToSendEarly:(double)a3
{
  self->_locationUpdateHuncReductionToSendEarly = a3;
}

- (double)locationUpdateVuncReductionToSendEarly
{
  return self->_locationUpdateVuncReductionToSendEarly;
}

- (void)setLocationUpdateVuncReductionToSendEarly:(double)a3
{
  self->_locationUpdateVuncReductionToSendEarly = a3;
}

- (double)locationUpdateDistanceMovedToSendEarly
{
  return self->_locationUpdateDistanceMovedToSendEarly;
}

- (void)setLocationUpdateDistanceMovedToSendEarly:(double)a3
{
  self->_locationUpdateDistanceMovedToSendEarly = a3;
}

- (double)locationUpdateChangeInAltitudeToSendEarly
{
  return self->_locationUpdateChangeInAltitudeToSendEarly;
}

- (void)setLocationUpdateChangeInAltitudeToSendEarly:(double)a3
{
  self->_locationUpdateChangeInAltitudeToSendEarly = a3;
}

@end
