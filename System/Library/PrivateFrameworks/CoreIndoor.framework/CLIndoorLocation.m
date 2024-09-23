@implementation CLIndoorLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorLocation)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  _OWORD v31[35];
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CLIndoorLocation;
  v5 = -[CLIndoorLocation init](&v32, sel_init);
  if (v5)
  {
    sub_2164A840C(v4, (char *)v31);
    v6 = v31[3];
    *(_OWORD *)(v5 + 200) = v31[2];
    *(_OWORD *)(v5 + 216) = v6;
    v7 = v31[5];
    *(_OWORD *)(v5 + 232) = v31[4];
    *(_OWORD *)(v5 + 248) = v7;
    v8 = v31[1];
    *(_OWORD *)(v5 + 168) = v31[0];
    *(_OWORD *)(v5 + 184) = v8;
    v9 = v31[7];
    *(_OWORD *)(v5 + 264) = v31[6];
    *(_OWORD *)(v5 + 280) = v9;
    *(_OWORD *)(v5 + 296) = v31[8];
    *(_OWORD *)(v5 + 308) = *(_OWORD *)((char *)&v31[8] + 12);
    sub_2164A849C(v4, (char *)v31);
    memcpy(v5 + 328, v31, 0x230uLL);
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("locationId"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("locationDescription"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v18;

    v5[8] = objc_msgSend_decodeBoolForKey_(v4, v20, (uint64_t)CFSTR("gpsAssistance"), v21, v22);
    sub_2164A852C(v4, (char *)v31);
    v23 = *(_QWORD *)&v31[8];
    v24 = v31[7];
    *((_OWORD *)v5 + 8) = v31[6];
    *((_OWORD *)v5 + 9) = v24;
    *((_QWORD *)v5 + 20) = v23;
    v26 = v31[4];
    v25 = v31[5];
    v27 = v31[3];
    *((_OWORD *)v5 + 4) = v31[2];
    *((_OWORD *)v5 + 5) = v27;
    *((_OWORD *)v5 + 6) = v26;
    *((_OWORD *)v5 + 7) = v25;
    v28 = v31[1];
    *((_OWORD *)v5 + 2) = v31[0];
    *((_OWORD *)v5 + 3) = v28;
    v29 = v5;
  }

  return (CLIndoorLocation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  sub_216457C38((uint64_t)v10, (uint64_t)&self->_location);
  sub_216457C14((uint64_t)v10, (uint64_t)&self->_location.ellipsoidalAltitude);
  objc_msgSend_encodeObject_forKey_(v10, v4, (uint64_t)self->_locationId, (uint64_t)CFSTR("locationId"), v5);
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->_locationDescription, (uint64_t)CFSTR("locationDescription"), v7);
  objc_msgSend_encodeBool_forKey_(v10, v8, self->_requestsGpsAssistance, (uint64_t)CFSTR("gpsAssistance"), v9);
  sub_2164A85BC((uint64_t)v10, (uint64_t)&self->_diagnosticReport);

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;

  objc_msgSend_location(self, a2, v2, v3, v4);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_location(self, v7, v8, v9, v10);
  objc_msgSend_location(self, v11, v12, v13, v14);
  objc_msgSend_locationId(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locationDescription(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_location(self, v25, v26, v27, v28);
  v33 = objc_msgSend_requestsGpsAssistance(self, v29, v30, v31, v32);
  objc_msgSend_location(self, v34, v35, v36, v37);
  if (v33)
    objc_msgSend_stringWithFormat_(v6, v38, (uint64_t)CFSTR("lat/lon=[%lf, %lf] on floor %d (%@: %@) +/- %lf meters (gps assistance = %s) with location type %d"), v39, v40, v46, v45, v47, v19, v24, v44, "yes", v43);
  else
    objc_msgSend_stringWithFormat_(v6, v38, (uint64_t)CFSTR("lat/lon=[%lf, %lf] on floor %d (%@: %@) +/- %lf meters (gps assistance = %s) with location type %d"), v39, v40, v46, v45, v47, v19, v24, v44, "no", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- ($FC467A9753EF35A59AAA53554404748C)location
{
  __int128 v3;
  __int128 v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;

  v3 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var5 = v3;
  v4 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var9 = v4;
  var1 = self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var21;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var1.var1 = var1;
  v6 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self[1].var12;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self[1].var10;
  retstr->var13 = v6;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self[1].var13.var1;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)((char *)&self[1].var14 + 4);
  return self;
}

- (void)setLocation:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $AB5116BA7E623E054F959CECB034F4E7 var13;
  __int128 v9;

  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_location.coordinate.longitude = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_location.suitability = v3;
  v4 = *(_OWORD *)&a3->var3;
  v5 = *(_OWORD *)&a3->var5;
  v6 = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_location.timestamp = *(_OWORD *)&a3->var9;
  *(_OWORD *)&self->_location.course = v6;
  *(_OWORD *)&self->_location.speed = v5;
  *(_OWORD *)&self->_location.altitude = v4;
  v7 = *(_OWORD *)&a3->var11;
  var13 = ($AB5116BA7E623E054F959CECB034F4E7)a3->var13;
  v9 = *(_OWORD *)&a3->var14;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->var16;
  self->_location.rawCoordinate = var13;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- ($8346F60F14D5FFA78589B066C3F3C2F8)locationPrivate
{
  return ($8346F60F14D5FFA78589B066C3F3C2F8 *)memcpy(retstr, &self->_location.ellipsoidalAltitude, sizeof($8346F60F14D5FFA78589B066C3F3C2F8));
}

- (void)setLocationPrivate:(id *)a3
{
  memcpy(&self->_location.ellipsoidalAltitude, a3, 0x230uLL);
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
  objc_storeStrong((id *)&self->_locationId, a3);
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
  objc_storeStrong((id *)&self->_locationDescription, a3);
}

- (BOOL)requestsGpsAssistance
{
  return self->_requestsGpsAssistance;
}

- (void)setRequestsGpsAssistance:(BOOL)a3
{
  self->_requestsGpsAssistance = a3;
}

- ($146E4FC062DDF4A2C58C04BCAEC0B25D)diagnosticReport
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self->var12;
  *(_OWORD *)&retstr->var10 = v3;
  *(double *)&retstr->var12 = self[1].var3;
  v4 = *(_OWORD *)&self->var7[3];
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var7[1];
  *(_OWORD *)&retstr->var6 = v4;
  v5 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var7[1] = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var7[3] = v5;
  v6 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v6;
  return self;
}

- (void)setDiagnosticReport:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)&self->_diagnosticReport.yieldType = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var2;
  v4 = *(_OWORD *)&a3->var4;
  v5 = *(_OWORD *)&a3->var7[1];
  *(_OWORD *)&self->_diagnosticReport.prbOnFloors = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[1] = v5;
  *(_OWORD *)&self->_diagnosticReport.prbCoarseIndoorSaysIndoor = v3;
  *(_OWORD *)&self->_diagnosticReport.prbGpsSaysIndoor = v4;
  v6 = *(_OWORD *)&a3->var7[3];
  v7 = *(_OWORD *)&a3->var8;
  v8 = *(_OWORD *)&a3->var10;
  *(_QWORD *)&self->_diagnosticReport.pfYieldStatusBeforeCalculatePose = *(_QWORD *)&a3->var12;
  *(_OWORD *)&self->_diagnosticReport.prbInlier = v7;
  *(_OWORD *)&self->_diagnosticReport.prbInjectionOccupancyRetryLimitOk = v8;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[3] = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
}

@end
