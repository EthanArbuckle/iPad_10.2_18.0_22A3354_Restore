@implementation CLPIonosphereData

- (void)setLatitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_latitudeDeg = a3;
}

- (void)setHasLatitudeDeg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLatitudeDeg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLongitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_longitudeDeg = a3;
}

- (void)setHasLongitudeDeg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLongitudeDeg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setGeodeticAltitudeM:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_geodeticAltitudeM = a3;
}

- (void)setHasGeodeticAltitudeM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGeodeticAltitudeM
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setApplicableTimeSec:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_applicableTimeSec = a3;
}

- (void)setHasApplicableTimeSec:(BOOL)a3
{
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasApplicableTimeSec
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHmaxKm:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hmaxKm = a3;
}

- (void)setHasHmaxKm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHmaxKm
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setVtec0:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_vtec0 = a3;
}

- (void)setHasVtec0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVtec0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDvtecDtheta:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dvtecDtheta = a3;
}

- (void)setHasDvtecDtheta:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDvtecDtheta
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDvtecDphi:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dvtecDphi = a3;
}

- (void)setHasDvtecDphi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDvtecDphi
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setD2vtecDtheta2:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_d2vtecDtheta2 = a3;
}

- (void)setHasD2vtecDtheta2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasD2vtecDtheta2
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setD2vtecDthetaphi:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_d2vtecDthetaphi = a3;
}

- (void)setHasD2vtecDthetaphi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasD2vtecDthetaphi
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setD2vtecDphi2:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_d2vtecDphi2 = a3;
}

- (void)setHasD2vtecDphi2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasD2vtecDphi2
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEstimatorAgeSec:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_estimatorAgeSec = a3;
}

- (void)setHasEstimatorAgeSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEstimatorAgeSec
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPhmaxHmaxKm2:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_phmaxHmaxKm2 = a3;
}

- (void)setHasPhmaxHmaxKm2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPhmaxHmaxKm2
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPvtec0Vtec0:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_pvtec0Vtec0 = a3;
}

- (void)setHasPvtec0Vtec0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPvtec0Vtec0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPdvtecDthetaDvtecDtheta:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_pdvtecDthetaDvtecDtheta = a3;
}

- (void)setHasPdvtecDthetaDvtecDtheta:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPdvtecDthetaDvtecDtheta
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPdvtecDphiDvtecDphi:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_pdvtecDphiDvtecDphi = a3;
}

- (void)setHasPdvtecDphiDvtecDphi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPdvtecDphiDvtecDphi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPd2vtecDtheta2D2vtecDtheta2:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pd2vtecDtheta2D2vtecDtheta2 = a3;
}

- (void)setHasPd2vtecDtheta2D2vtecDtheta2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPd2vtecDtheta2D2vtecDtheta2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setPd2vtecDthetadphiD2vtecDthetadphi:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_pd2vtecDthetadphiD2vtecDthetadphi = a3;
}

- (void)setHasPd2vtecDthetadphiD2vtecDthetadphi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPd2vtecDthetadphiD2vtecDthetadphi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPd2vtecDphi2D2vtecDphi2:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_pd2vtecDphi2D2vtecDphi2 = a3;
}

- (void)setHasPd2vtecDphi2D2vtecDphi2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPd2vtecDphi2D2vtecDphi2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPIonosphereData;
  -[CLPIonosphereData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPIonosphereData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $183B9D190D05FF5DA7F347791C463DAE has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitudeDeg);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("latitude_deg"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitudeDeg);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("longitude_deg"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_geodeticAltitudeM);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("geodetic_altitude_m"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_applicableTimeSec);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("applicable_time_sec"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_hmaxKm);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("hmax_km"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_vtec0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("vtec0"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dvtecDtheta);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dvtec_dtheta"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dvtecDphi);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dvtec_dphi"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_d2vtecDtheta2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("d2vtec_dtheta2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_d2vtecDthetaphi);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("d2vtec_dthetaphi"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_d2vtecDphi2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("d2vtec_dphi2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_estimatorAgeSec);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("estimator_age_sec"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_phmaxHmaxKm2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("phmax_hmax_km2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pvtec0Vtec0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("pvtec0_vtec0"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pdvtecDthetaDvtecDtheta);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("pdvtec_dtheta_dvtec_dtheta"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pdvtecDphiDvtecDphi);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("pdvtec_dphi_dvtec_dphi"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pd2vtecDthetadphiD2vtecDthetadphi);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("pd2vtec_dthetadphi_d2vtec_dthetadphi"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return v3;
    goto LABEL_20;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pd2vtecDtheta2D2vtecDtheta2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("pd2vtec_dtheta2_d2vtec_dtheta2"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pd2vtecDphi2D2vtecDphi2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pd2vtec_dphi2_d2vtec_dphi2"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIonosphereDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $183B9D190D05FF5DA7F347791C463DAE has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
LABEL_39:
    PBDataWriterWriteDoubleField();
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
LABEL_20:
    PBDataWriterWriteDoubleField();
LABEL_21:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $183B9D190D05FF5DA7F347791C463DAE has;

  v4 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    v4[10] = *(_QWORD *)&self->_latitudeDeg;
    *((_DWORD *)v4 + 40) |= 0x200u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v4[11] = *(_QWORD *)&self->_longitudeDeg;
  *((_DWORD *)v4 + 40) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  v4[8] = *(_QWORD *)&self->_geodeticAltitudeM;
  *((_DWORD *)v4 + 40) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  v4[1] = *(_QWORD *)&self->_applicableTimeSec;
  *((_DWORD *)v4 + 40) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  v4[9] = *(_QWORD *)&self->_hmaxKm;
  *((_DWORD *)v4 + 40) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v4[19] = *(_QWORD *)&self->_vtec0;
  *((_DWORD *)v4 + 40) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  v4[6] = *(_QWORD *)&self->_dvtecDtheta;
  *((_DWORD *)v4 + 40) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v4[5] = *(_QWORD *)&self->_dvtecDphi;
  *((_DWORD *)v4 + 40) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v4[3] = *(_QWORD *)&self->_d2vtecDtheta2;
  *((_DWORD *)v4 + 40) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v4[4] = *(_QWORD *)&self->_d2vtecDthetaphi;
  *((_DWORD *)v4 + 40) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  v4[2] = *(_QWORD *)&self->_d2vtecDphi2;
  *((_DWORD *)v4 + 40) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v4[7] = *(_QWORD *)&self->_estimatorAgeSec;
  *((_DWORD *)v4 + 40) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v4[17] = *(_QWORD *)&self->_phmaxHmaxKm2;
  *((_DWORD *)v4 + 40) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  v4[18] = *(_QWORD *)&self->_pvtec0Vtec0;
  *((_DWORD *)v4 + 40) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v4[16] = *(_QWORD *)&self->_pdvtecDthetaDvtecDtheta;
  *((_DWORD *)v4 + 40) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  v4[15] = *(_QWORD *)&self->_pdvtecDphiDvtecDphi;
  *((_DWORD *)v4 + 40) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
LABEL_39:
    v4[14] = *(_QWORD *)&self->_pd2vtecDthetadphiD2vtecDthetadphi;
    *((_DWORD *)v4 + 40) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  v4[13] = *(_QWORD *)&self->_pd2vtecDtheta2D2vtecDtheta2;
  *((_DWORD *)v4 + 40) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    v4[12] = *(_QWORD *)&self->_pd2vtecDphi2D2vtecDphi2;
    *((_DWORD *)v4 + 40) |= 0x800u;
  }
LABEL_21:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $183B9D190D05FF5DA7F347791C463DAE has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *((_QWORD *)result + 10) = *(_QWORD *)&self->_latitudeDeg;
    *((_DWORD *)result + 40) |= 0x200u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 11) = *(_QWORD *)&self->_longitudeDeg;
  *((_DWORD *)result + 40) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_geodeticAltitudeM;
  *((_DWORD *)result + 40) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_applicableTimeSec;
  *((_DWORD *)result + 40) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_hmaxKm;
  *((_DWORD *)result + 40) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 19) = *(_QWORD *)&self->_vtec0;
  *((_DWORD *)result + 40) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_dvtecDtheta;
  *((_DWORD *)result + 40) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_dvtecDphi;
  *((_DWORD *)result + 40) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_d2vtecDtheta2;
  *((_DWORD *)result + 40) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_d2vtecDthetaphi;
  *((_DWORD *)result + 40) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_d2vtecDphi2;
  *((_DWORD *)result + 40) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_estimatorAgeSec;
  *((_DWORD *)result + 40) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 17) = *(_QWORD *)&self->_phmaxHmaxKm2;
  *((_DWORD *)result + 40) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 18) = *(_QWORD *)&self->_pvtec0Vtec0;
  *((_DWORD *)result + 40) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 16) = *(_QWORD *)&self->_pdvtecDthetaDvtecDtheta;
  *((_DWORD *)result + 40) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 15) = *(_QWORD *)&self->_pdvtecDphiDvtecDphi;
  *((_DWORD *)result + 40) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 13) = *(_QWORD *)&self->_pd2vtecDtheta2D2vtecDtheta2;
  *((_DWORD *)result + 40) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      return result;
    goto LABEL_20;
  }
LABEL_39:
  *((_QWORD *)result + 14) = *(_QWORD *)&self->_pd2vtecDthetadphiD2vtecDthetadphi;
  *((_DWORD *)result + 40) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return result;
LABEL_20:
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_pd2vtecDphi2D2vtecDphi2;
  *((_DWORD *)result + 40) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $183B9D190D05FF5DA7F347791C463DAE has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_97;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 40);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_latitudeDeg != *((double *)v4 + 10))
      goto LABEL_97;
  }
  else if ((v6 & 0x200) != 0)
  {
LABEL_97:
    v7 = 0;
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_longitudeDeg != *((double *)v4 + 11))
      goto LABEL_97;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_geodeticAltitudeM != *((double *)v4 + 8))
      goto LABEL_97;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_applicableTimeSec != *((double *)v4 + 1))
      goto LABEL_97;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_hmaxKm != *((double *)v4 + 9))
      goto LABEL_97;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_vtec0 != *((double *)v4 + 19))
      goto LABEL_97;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dvtecDtheta != *((double *)v4 + 6))
      goto LABEL_97;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dvtecDphi != *((double *)v4 + 5))
      goto LABEL_97;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_d2vtecDtheta2 != *((double *)v4 + 3))
      goto LABEL_97;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_d2vtecDthetaphi != *((double *)v4 + 4))
      goto LABEL_97;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_d2vtecDphi2 != *((double *)v4 + 2))
      goto LABEL_97;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_estimatorAgeSec != *((double *)v4 + 7))
      goto LABEL_97;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_phmaxHmaxKm2 != *((double *)v4 + 17))
      goto LABEL_97;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_pvtec0Vtec0 != *((double *)v4 + 18))
      goto LABEL_97;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_pdvtecDthetaDvtecDtheta != *((double *)v4 + 16))
      goto LABEL_97;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_pdvtecDphiDvtecDphi != *((double *)v4 + 15))
      goto LABEL_97;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_pd2vtecDtheta2D2vtecDtheta2 != *((double *)v4 + 13))
      goto LABEL_97;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_pd2vtecDthetadphiD2vtecDthetadphi != *((double *)v4 + 14))
      goto LABEL_97;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_pd2vtecDphi2D2vtecDphi2 != *((double *)v4 + 12))
      goto LABEL_97;
    v7 = 1;
  }
  else
  {
    v7 = (*((_DWORD *)v4 + 40) & 0x800) == 0;
  }
LABEL_98:

  return v7;
}

- (unint64_t)hash
{
  $183B9D190D05FF5DA7F347791C463DAE has;
  unint64_t v4;
  double latitudeDeg;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double longitudeDeg;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double geodeticAltitudeM;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double applicableTimeSec;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double hmaxKm;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double vtec0;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double dvtecDtheta;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double dvtecDphi;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double d2vtecDtheta2;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  double d2vtecDthetaphi;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  double d2vtecDphi2;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  double estimatorAgeSec;
  double v61;
  long double v62;
  double v63;
  unint64_t v64;
  double phmaxHmaxKm2;
  double v66;
  long double v67;
  double v68;
  unint64_t v69;
  double pvtec0Vtec0;
  double v71;
  long double v72;
  double v73;
  unint64_t v74;
  double pdvtecDthetaDvtecDtheta;
  double v76;
  long double v77;
  double v78;
  unint64_t v79;
  double pdvtecDphiDvtecDphi;
  double v81;
  long double v82;
  double v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  double pd2vtecDtheta2D2vtecDtheta2;
  double v88;
  long double v89;
  double v90;
  unint64_t v91;
  double pd2vtecDthetadphiD2vtecDthetadphi;
  double v93;
  long double v94;
  double v95;
  unint64_t v96;
  double pd2vtecDphi2D2vtecDphi2;
  double v98;
  long double v99;
  double v100;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    latitudeDeg = self->_latitudeDeg;
    v6 = -latitudeDeg;
    if (latitudeDeg >= 0.0)
      v6 = self->_latitudeDeg;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    longitudeDeg = self->_longitudeDeg;
    v11 = -longitudeDeg;
    if (longitudeDeg >= 0.0)
      v11 = self->_longitudeDeg;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    geodeticAltitudeM = self->_geodeticAltitudeM;
    v16 = -geodeticAltitudeM;
    if (geodeticAltitudeM >= 0.0)
      v16 = self->_geodeticAltitudeM;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    applicableTimeSec = self->_applicableTimeSec;
    v21 = -applicableTimeSec;
    if (applicableTimeSec >= 0.0)
      v21 = self->_applicableTimeSec;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    hmaxKm = self->_hmaxKm;
    v26 = -hmaxKm;
    if (hmaxKm >= 0.0)
      v26 = self->_hmaxKm;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    vtec0 = self->_vtec0;
    v31 = -vtec0;
    if (vtec0 >= 0.0)
      v31 = self->_vtec0;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    dvtecDtheta = self->_dvtecDtheta;
    v36 = -dvtecDtheta;
    if (dvtecDtheta >= 0.0)
      v36 = self->_dvtecDtheta;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    dvtecDphi = self->_dvtecDphi;
    v41 = -dvtecDphi;
    if (dvtecDphi >= 0.0)
      v41 = self->_dvtecDphi;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v108 = v39;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    d2vtecDtheta2 = self->_d2vtecDtheta2;
    v46 = -d2vtecDtheta2;
    if (d2vtecDtheta2 >= 0.0)
      v46 = self->_d2vtecDtheta2;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v107 = v44;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    d2vtecDthetaphi = self->_d2vtecDthetaphi;
    v51 = -d2vtecDthetaphi;
    if (d2vtecDthetaphi >= 0.0)
      v51 = self->_d2vtecDthetaphi;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v106 = v49;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    d2vtecDphi2 = self->_d2vtecDphi2;
    v56 = -d2vtecDphi2;
    if (d2vtecDphi2 >= 0.0)
      v56 = self->_d2vtecDphi2;
    v57 = floor(v56 + 0.5);
    v58 = (v56 - v57) * 1.84467441e19;
    v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v105 = v54;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    estimatorAgeSec = self->_estimatorAgeSec;
    v61 = -estimatorAgeSec;
    if (estimatorAgeSec >= 0.0)
      v61 = self->_estimatorAgeSec;
    v62 = floor(v61 + 0.5);
    v63 = (v61 - v62) * 1.84467441e19;
    v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0)
        v59 += (unint64_t)v63;
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    v59 = 0;
  }
  v104 = v59;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    phmaxHmaxKm2 = self->_phmaxHmaxKm2;
    v66 = -phmaxHmaxKm2;
    if (phmaxHmaxKm2 >= 0.0)
      v66 = self->_phmaxHmaxKm2;
    v67 = floor(v66 + 0.5);
    v68 = (v66 - v67) * 1.84467441e19;
    v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0)
        v64 += (unint64_t)v68;
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    v64 = 0;
  }
  v103 = v64;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    pvtec0Vtec0 = self->_pvtec0Vtec0;
    v71 = -pvtec0Vtec0;
    if (pvtec0Vtec0 >= 0.0)
      v71 = self->_pvtec0Vtec0;
    v72 = floor(v71 + 0.5);
    v73 = (v71 - v72) * 1.84467441e19;
    v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  v102 = v69;
  v111 = v24;
  v112 = v4;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    pdvtecDthetaDvtecDtheta = self->_pdvtecDthetaDvtecDtheta;
    v76 = -pdvtecDthetaDvtecDtheta;
    if (pdvtecDthetaDvtecDtheta >= 0.0)
      v76 = self->_pdvtecDthetaDvtecDtheta;
    v77 = floor(v76 + 0.5);
    v78 = (v76 - v77) * 1.84467441e19;
    v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0)
        v74 += (unint64_t)v78;
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    v74 = 0;
  }
  v109 = v29;
  v110 = v9;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    pdvtecDphiDvtecDphi = self->_pdvtecDphiDvtecDphi;
    v81 = -pdvtecDphiDvtecDphi;
    if (pdvtecDphiDvtecDphi >= 0.0)
      v81 = self->_pdvtecDphiDvtecDphi;
    v82 = floor(v81 + 0.5);
    v83 = (v81 - v82) * 1.84467441e19;
    v79 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
    if (v83 >= 0.0)
    {
      if (v83 > 0.0)
        v79 += (unint64_t)v83;
    }
    else
    {
      v79 -= (unint64_t)fabs(v83);
    }
  }
  else
  {
    v79 = 0;
  }
  v84 = v14;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    pd2vtecDtheta2D2vtecDtheta2 = self->_pd2vtecDtheta2D2vtecDtheta2;
    v88 = -pd2vtecDtheta2D2vtecDtheta2;
    if (pd2vtecDtheta2D2vtecDtheta2 >= 0.0)
      v88 = self->_pd2vtecDtheta2D2vtecDtheta2;
    v89 = floor(v88 + 0.5);
    v90 = (v88 - v89) * 1.84467441e19;
    v86 = 2654435761u * (unint64_t)fmod(v89, 1.84467441e19);
    v85 = v34;
    if (v90 >= 0.0)
    {
      if (v90 > 0.0)
        v86 += (unint64_t)v90;
    }
    else
    {
      v86 -= (unint64_t)fabs(v90);
    }
  }
  else
  {
    v85 = v34;
    v86 = 0;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    pd2vtecDthetadphiD2vtecDthetadphi = self->_pd2vtecDthetadphiD2vtecDthetadphi;
    v93 = -pd2vtecDthetadphiD2vtecDthetadphi;
    if (pd2vtecDthetadphiD2vtecDthetadphi >= 0.0)
      v93 = self->_pd2vtecDthetadphiD2vtecDthetadphi;
    v94 = floor(v93 + 0.5);
    v95 = (v93 - v94) * 1.84467441e19;
    v91 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
    if (v95 >= 0.0)
    {
      if (v95 > 0.0)
        v91 += (unint64_t)v95;
    }
    else
    {
      v91 -= (unint64_t)fabs(v95);
    }
  }
  else
  {
    v91 = 0;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    pd2vtecDphi2D2vtecDphi2 = self->_pd2vtecDphi2D2vtecDphi2;
    v98 = -pd2vtecDphi2D2vtecDphi2;
    if (pd2vtecDphi2D2vtecDphi2 >= 0.0)
      v98 = self->_pd2vtecDphi2D2vtecDphi2;
    v99 = floor(v98 + 0.5);
    v100 = (v98 - v99) * 1.84467441e19;
    v96 = 2654435761u * (unint64_t)fmod(v99, 1.84467441e19);
    if (v100 >= 0.0)
    {
      if (v100 > 0.0)
        v96 += (unint64_t)v100;
    }
    else
    {
      v96 -= (unint64_t)fabs(v100);
    }
  }
  else
  {
    v96 = 0;
  }
  return v110 ^ v112 ^ v84 ^ v19 ^ v111 ^ v109 ^ v85 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v74 ^ v79 ^ v86 ^ v91 ^ v96;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x200) != 0)
  {
    self->_latitudeDeg = *((double *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
    v5 = *((_DWORD *)v4 + 40);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_longitudeDeg = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_geodeticAltitudeM = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_applicableTimeSec = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_hmaxKm = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x40000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_vtec0 = *((double *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_dvtecDtheta = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_dvtecDphi = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_d2vtecDtheta2 = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_d2vtecDthetaphi = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  self->_d2vtecDphi2 = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  self->_estimatorAgeSec = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x10000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_phmaxHmaxKm2 = *((double *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x20000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_pvtec0Vtec0 = *((double *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x8000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_pdvtecDthetaDvtecDtheta = *((double *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  self->_pdvtecDphiDvtecDphi = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0)
      goto LABEL_19;
LABEL_39:
    self->_pd2vtecDthetadphiD2vtecDthetadphi = *((double *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
    if ((*((_DWORD *)v4 + 40) & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  self->_pd2vtecDtheta2D2vtecDtheta2 = *((double *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x2000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((v5 & 0x800) != 0)
  {
LABEL_20:
    self->_pd2vtecDphi2D2vtecDphi2 = *((double *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_21:

}

- (double)latitudeDeg
{
  return self->_latitudeDeg;
}

- (double)longitudeDeg
{
  return self->_longitudeDeg;
}

- (double)geodeticAltitudeM
{
  return self->_geodeticAltitudeM;
}

- (double)applicableTimeSec
{
  return self->_applicableTimeSec;
}

- (double)hmaxKm
{
  return self->_hmaxKm;
}

- (double)vtec0
{
  return self->_vtec0;
}

- (double)dvtecDtheta
{
  return self->_dvtecDtheta;
}

- (double)dvtecDphi
{
  return self->_dvtecDphi;
}

- (double)d2vtecDtheta2
{
  return self->_d2vtecDtheta2;
}

- (double)d2vtecDthetaphi
{
  return self->_d2vtecDthetaphi;
}

- (double)d2vtecDphi2
{
  return self->_d2vtecDphi2;
}

- (double)estimatorAgeSec
{
  return self->_estimatorAgeSec;
}

- (double)phmaxHmaxKm2
{
  return self->_phmaxHmaxKm2;
}

- (double)pvtec0Vtec0
{
  return self->_pvtec0Vtec0;
}

- (double)pdvtecDthetaDvtecDtheta
{
  return self->_pdvtecDthetaDvtecDtheta;
}

- (double)pdvtecDphiDvtecDphi
{
  return self->_pdvtecDphiDvtecDphi;
}

- (double)pd2vtecDtheta2D2vtecDtheta2
{
  return self->_pd2vtecDtheta2D2vtecDtheta2;
}

- (double)pd2vtecDthetadphiD2vtecDthetadphi
{
  return self->_pd2vtecDthetadphiD2vtecDthetadphi;
}

- (double)pd2vtecDphi2D2vtecDphi2
{
  return self->_pd2vtecDphi2D2vtecDphi2;
}

@end
