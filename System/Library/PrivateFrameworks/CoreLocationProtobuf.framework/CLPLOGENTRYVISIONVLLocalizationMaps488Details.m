@implementation CLPLOGENTRYVISIONVLLocalizationMaps488Details

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  PBRepeatedDoubleClear();
  PBRepeatedInt32Clear();
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationMaps488Details;
  -[CLPLOGENTRYVISIONVLLocalizationMaps488Details dealloc](&v3, sel_dealloc);
}

- (void)setNumInliers:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numInliers = a3;
}

- (void)setHasNumInliers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumInliers
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)points2dsCount
{
  return self->_points2ds.count;
}

- (float)points2ds
{
  return self->_points2ds.list;
}

- (void)clearPoints2ds
{
  PBRepeatedFloatClear();
}

- (void)addPoints2d:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)points2dAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_points2ds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_points2ds = &self->_points2ds;
  count = self->_points2ds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_points2ds->list[a3];
}

- (void)setPoints2ds:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)points3dsCount
{
  return self->_points3ds.count;
}

- (double)points3ds
{
  return self->_points3ds.list;
}

- (void)clearPoints3ds
{
  PBRepeatedDoubleClear();
}

- (void)addPoints3d:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)points3dAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_points3ds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_points3ds = &self->_points3ds;
  count = self->_points3ds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_points3ds->list[a3];
}

- (void)setPoints3ds:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (unint64_t)inlierIndicesCount
{
  return self->_inlierIndices.count;
}

- (int)inlierIndices
{
  return self->_inlierIndices.list;
}

- (void)clearInlierIndices
{
  PBRepeatedInt32Clear();
}

- (void)addInlierIndices:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)inlierIndicesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_inlierIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_inlierIndices = &self->_inlierIndices;
  count = self->_inlierIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_inlierIndices->list[a3];
}

- (void)setInlierIndices:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)slamOriginsCount
{
  return self->_slamOrigins.count;
}

- (double)slamOrigins
{
  return self->_slamOrigins.list;
}

- (void)clearSlamOrigins
{
  PBRepeatedDoubleClear();
}

- (void)addSlamOrigin:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)slamOriginAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_slamOrigins;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slamOrigins = &self->_slamOrigins;
  count = self->_slamOrigins.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_slamOrigins->list[a3];
}

- (void)setSlamOrigins:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (void)setNumSlamTracks:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numSlamTracks = a3;
}

- (void)setHasNumSlamTracks:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSlamTracks
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (unint64_t)slamTracksCount
{
  return self->_slamTracks.count;
}

- (float)slamTracks
{
  return self->_slamTracks.list;
}

- (void)clearSlamTracks
{
  PBRepeatedFloatClear();
}

- (void)addSlamTracks:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)slamTracksAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slamTracks;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slamTracks = &self->_slamTracks;
  count = self->_slamTracks.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_slamTracks->list[a3];
}

- (void)setSlamTracks:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (void)setDescriptorDimension:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_descriptorDimension = a3;
}

- (void)setHasDescriptorDimension:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDescriptorDimension
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSlamTrackDescriptors
{
  return self->_slamTrackDescriptors != 0;
}

- (unint64_t)slamTrackObservationsCount
{
  return self->_slamTrackObservations.count;
}

- (int)slamTrackObservations
{
  return self->_slamTrackObservations.list;
}

- (void)clearSlamTrackObservations
{
  PBRepeatedInt32Clear();
}

- (void)addSlamTrackObservations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)slamTrackObservationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_slamTrackObservations;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slamTrackObservations = &self->_slamTrackObservations;
  count = self->_slamTrackObservations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_slamTrackObservations->list[a3];
}

- (void)setSlamTrackObservations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)slamTracks2dsCount
{
  return self->_slamTracks2ds.count;
}

- (float)slamTracks2ds
{
  return self->_slamTracks2ds.list;
}

- (void)clearSlamTracks2ds
{
  PBRepeatedFloatClear();
}

- (void)addSlamTracks2d:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)slamTracks2dAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slamTracks2ds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slamTracks2ds = &self->_slamTracks2ds;
  count = self->_slamTracks2ds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_slamTracks2ds->list[a3];
}

- (void)setSlamTracks2ds:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)slamTrackImageIndicesCount
{
  return self->_slamTrackImageIndices.count;
}

- (int)slamTrackImageIndices
{
  return self->_slamTrackImageIndices.list;
}

- (void)clearSlamTrackImageIndices
{
  PBRepeatedInt32Clear();
}

- (void)addSlamTrackImageIndices:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)slamTrackImageIndicesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_slamTrackImageIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slamTrackImageIndices = &self->_slamTrackImageIndices;
  count = self->_slamTrackImageIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_slamTrackImageIndices->list[a3];
}

- (void)setSlamTrackImageIndices:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setNumFrames:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numFrames = a3;
}

- (void)setHasNumFrames:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumFrames
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)perFrameVioStatusCodesCount
{
  return self->_perFrameVioStatusCodes.count;
}

- (int)perFrameVioStatusCodes
{
  return self->_perFrameVioStatusCodes.list;
}

- (void)clearPerFrameVioStatusCodes
{
  PBRepeatedInt32Clear();
}

- (void)addPerFrameVioStatusCodes:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)perFrameVioStatusCodesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_perFrameVioStatusCodes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_perFrameVioStatusCodes = &self->_perFrameVioStatusCodes;
  count = self->_perFrameVioStatusCodes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_perFrameVioStatusCodes->list[a3];
}

- (void)setPerFrameVioStatusCodes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)perFrameVioPosesCount
{
  return self->_perFrameVioPoses.count;
}

- (float)perFrameVioPoses
{
  return self->_perFrameVioPoses.list;
}

- (void)clearPerFrameVioPoses
{
  PBRepeatedFloatClear();
}

- (void)addPerFrameVioPoses:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)perFrameVioPosesAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_perFrameVioPoses;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_perFrameVioPoses = &self->_perFrameVioPoses;
  count = self->_perFrameVioPoses.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_perFrameVioPoses->list[a3];
}

- (void)setPerFrameVioPoses:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)perFrameCalibrationMatricesCount
{
  return self->_perFrameCalibrationMatrices.count;
}

- (float)perFrameCalibrationMatrices
{
  return self->_perFrameCalibrationMatrices.list;
}

- (void)clearPerFrameCalibrationMatrices
{
  PBRepeatedFloatClear();
}

- (void)addPerFrameCalibrationMatrices:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)perFrameCalibrationMatricesAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_perFrameCalibrationMatrices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_perFrameCalibrationMatrices = &self->_perFrameCalibrationMatrices;
  count = self->_perFrameCalibrationMatrices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_perFrameCalibrationMatrices->list[a3];
}

- (void)setPerFrameCalibrationMatrices:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)perFrameDistortionsCount
{
  return self->_perFrameDistortions.count;
}

- (float)perFrameDistortions
{
  return self->_perFrameDistortions.list;
}

- (void)clearPerFrameDistortions
{
  PBRepeatedFloatClear();
}

- (void)addPerFrameDistortion:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)perFrameDistortionAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_perFrameDistortions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_perFrameDistortions = &self->_perFrameDistortions;
  count = self->_perFrameDistortions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_perFrameDistortions->list[a3];
}

- (void)setPerFrameDistortions:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)resultPoseRotationsCount
{
  return self->_resultPoseRotations.count;
}

- (double)resultPoseRotations
{
  return self->_resultPoseRotations.list;
}

- (void)clearResultPoseRotations
{
  PBRepeatedDoubleClear();
}

- (void)addResultPoseRotation:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)resultPoseRotationAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_resultPoseRotations;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_resultPoseRotations = &self->_resultPoseRotations;
  count = self->_resultPoseRotations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_resultPoseRotations->list[a3];
}

- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (unint64_t)resultPoseTranslationsCount
{
  return self->_resultPoseTranslations.count;
}

- (double)resultPoseTranslations
{
  return self->_resultPoseTranslations.list;
}

- (void)clearResultPoseTranslations
{
  PBRepeatedDoubleClear();
}

- (void)addResultPoseTranslation:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)resultPoseTranslationAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_resultPoseTranslations;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_resultPoseTranslations = &self->_resultPoseTranslations;
  count = self->_resultPoseTranslations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_resultPoseTranslations->list[a3];
}

- (void)setResultPoseTranslations:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
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
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationMaps488Details;
  -[CLPLOGENTRYVISIONVLLocalizationMaps488Details description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONVLLocalizationMaps488Details dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSData *slamTrackDescriptors;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numInliers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("num_inliers"));

  }
  PBRepeatedFloatNSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("points2d"));

  PBRepeatedDoubleNSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("points3d"));

  PBRepeatedInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("inlier_indices"));

  PBRepeatedDoubleNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("slam_origin"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numSlamTracks);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("num_slam_tracks"));

  }
  PBRepeatedFloatNSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("slam_tracks"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_descriptorDimension);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("descriptor_dimension"));

  }
  slamTrackDescriptors = self->_slamTrackDescriptors;
  if (slamTrackDescriptors)
    objc_msgSend(v3, "setObject:forKey:", slamTrackDescriptors, CFSTR("slam_track_descriptors"));
  PBRepeatedInt32NSArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("slam_track_observations"));

  PBRepeatedFloatNSArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("slam_tracks2d"));

  PBRepeatedInt32NSArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("slam_track_image_indices"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numFrames);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("num_frames"));

  }
  PBRepeatedInt32NSArray();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("per_frame_vio_status_codes"));

  PBRepeatedFloatNSArray();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("per_frame_vio_poses"));

  PBRepeatedFloatNSArray();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("per_frame_calibration_matrices"));

  PBRepeatedFloatNSArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("per_frame_distortion"));

  PBRepeatedDoubleNSArray();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("result_pose_rotation"));

  PBRepeatedDoubleNSArray();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("result_pose_translation"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocalizationMaps488DetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_resultPoseTranslations;
  unint64_t v19;
  id v20;

  v4 = a3;
  v20 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v20;
  }
  if (self->_points2ds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v20;
      ++v5;
    }
    while (v5 < self->_points2ds.count);
  }
  if (self->_points3ds.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v4 = v20;
      ++v6;
    }
    while (v6 < self->_points3ds.count);
  }
  if (self->_inlierIndices.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v20;
      ++v7;
    }
    while (v7 < self->_inlierIndices.count);
  }
  if (self->_slamOrigins.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v4 = v20;
      ++v8;
    }
    while (v8 < self->_slamOrigins.count);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v20;
  }
  if (self->_slamTracks.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v20;
      ++v9;
    }
    while (v9 < self->_slamTracks.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v20;
  }
  if (self->_slamTrackDescriptors)
  {
    PBDataWriterWriteDataField();
    v4 = v20;
  }
  if (self->_slamTrackObservations.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v20;
      ++v10;
    }
    while (v10 < self->_slamTrackObservations.count);
  }
  if (self->_slamTracks2ds.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v20;
      ++v11;
    }
    while (v11 < self->_slamTracks2ds.count);
  }
  if (self->_slamTrackImageIndices.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v20;
      ++v12;
    }
    while (v12 < self->_slamTrackImageIndices.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v20;
  }
  if (self->_perFrameVioStatusCodes.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v20;
      ++v13;
    }
    while (v13 < self->_perFrameVioStatusCodes.count);
  }
  if (self->_perFrameVioPoses.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v20;
      ++v14;
    }
    while (v14 < self->_perFrameVioPoses.count);
  }
  if (self->_perFrameCalibrationMatrices.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v20;
      ++v15;
    }
    while (v15 < self->_perFrameCalibrationMatrices.count);
  }
  if (self->_perFrameDistortions.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v20;
      ++v16;
    }
    while (v16 < self->_perFrameDistortions.count);
  }
  if (self->_resultPoseRotations.count)
  {
    v17 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v4 = v20;
      ++v17;
    }
    while (v17 < self->_resultPoseRotations.count);
  }
  p_resultPoseTranslations = &self->_resultPoseTranslations;
  if (p_resultPoseTranslations->count)
  {
    v19 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v4 = v20;
      ++v19;
    }
    while (v19 < p_resultPoseTranslations->count);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  unint64_t v23;
  unint64_t v24;
  uint64_t jj;
  unint64_t v26;
  unint64_t v27;
  uint64_t kk;
  unint64_t v29;
  unint64_t v30;
  uint64_t mm;
  unint64_t v32;
  unint64_t v33;
  uint64_t nn;
  unint64_t v35;
  unint64_t v36;
  uint64_t i1;
  unint64_t v38;
  unint64_t v39;
  uint64_t i2;
  unint64_t v41;
  unint64_t v42;
  uint64_t i3;
  unint64_t v44;
  unint64_t v45;
  uint64_t i4;
  id v47;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[45] = self->_numInliers;
    *((_BYTE *)v4 + 384) |= 4u;
  }
  v47 = v4;
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details points2dsCount](self, "points2dsCount"))
  {
    objc_msgSend(v47, "clearPoints2ds");
    v5 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details points2dsCount](self, "points2dsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details points2dAtIndex:](self, "points2dAtIndex:", i);
        objc_msgSend(v47, "addPoints2d:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details points3dsCount](self, "points3dsCount"))
  {
    objc_msgSend(v47, "clearPoints3ds");
    v8 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details points3dsCount](self, "points3dsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details points3dAtIndex:](self, "points3dAtIndex:", j);
        objc_msgSend(v47, "addPoints3d:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details inlierIndicesCount](self, "inlierIndicesCount"))
  {
    objc_msgSend(v47, "clearInlierIndices");
    v11 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details inlierIndicesCount](self, "inlierIndicesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v47, "addInlierIndices:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details inlierIndicesAtIndex:](self, "inlierIndicesAtIndex:", k));
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamOriginsCount](self, "slamOriginsCount"))
  {
    objc_msgSend(v47, "clearSlamOrigins");
    v14 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamOriginsCount](self, "slamOriginsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamOriginAtIndex:](self, "slamOriginAtIndex:", m);
        objc_msgSend(v47, "addSlamOrigin:");
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v47 + 46) = self->_numSlamTracks;
    *((_BYTE *)v47 + 384) |= 8u;
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTracksCount](self, "slamTracksCount"))
  {
    objc_msgSend(v47, "clearSlamTracks");
    v17 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTracksCount](self, "slamTracksCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTracksAtIndex:](self, "slamTracksAtIndex:", n);
        objc_msgSend(v47, "addSlamTracks:");
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v47 + 43) = self->_descriptorDimension;
    *((_BYTE *)v47 + 384) |= 1u;
  }
  if (self->_slamTrackDescriptors)
    objc_msgSend(v47, "setSlamTrackDescriptors:");
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackObservationsCount](self, "slamTrackObservationsCount"))
  {
    objc_msgSend(v47, "clearSlamTrackObservations");
    v20 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackObservationsCount](self, "slamTrackObservationsCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(v47, "addSlamTrackObservations:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackObservationsAtIndex:](self, "slamTrackObservationsAtIndex:", ii));
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTracks2dsCount](self, "slamTracks2dsCount"))
  {
    objc_msgSend(v47, "clearSlamTracks2ds");
    v23 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTracks2dsCount](self, "slamTracks2dsCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTracks2dAtIndex:](self, "slamTracks2dAtIndex:", jj);
        objc_msgSend(v47, "addSlamTracks2d:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackImageIndicesCount](self, "slamTrackImageIndicesCount"))
  {
    objc_msgSend(v47, "clearSlamTrackImageIndices");
    v26 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackImageIndicesCount](self, "slamTrackImageIndicesCount");
    if (v26)
    {
      v27 = v26;
      for (kk = 0; kk != v27; ++kk)
        objc_msgSend(v47, "addSlamTrackImageIndices:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackImageIndicesAtIndex:](self, "slamTrackImageIndicesAtIndex:", kk));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v47 + 44) = self->_numFrames;
    *((_BYTE *)v47 + 384) |= 2u;
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioStatusCodesCount](self, "perFrameVioStatusCodesCount"))
  {
    objc_msgSend(v47, "clearPerFrameVioStatusCodes");
    v29 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioStatusCodesCount](self, "perFrameVioStatusCodesCount");
    if (v29)
    {
      v30 = v29;
      for (mm = 0; mm != v30; ++mm)
        objc_msgSend(v47, "addPerFrameVioStatusCodes:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioStatusCodesAtIndex:](self, "perFrameVioStatusCodesAtIndex:", mm));
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioPosesCount](self, "perFrameVioPosesCount"))
  {
    objc_msgSend(v47, "clearPerFrameVioPoses");
    v32 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioPosesCount](self, "perFrameVioPosesCount");
    if (v32)
    {
      v33 = v32;
      for (nn = 0; nn != v33; ++nn)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioPosesAtIndex:](self, "perFrameVioPosesAtIndex:", nn);
        objc_msgSend(v47, "addPerFrameVioPoses:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameCalibrationMatricesCount](self, "perFrameCalibrationMatricesCount"))
  {
    objc_msgSend(v47, "clearPerFrameCalibrationMatrices");
    v35 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameCalibrationMatricesCount](self, "perFrameCalibrationMatricesCount");
    if (v35)
    {
      v36 = v35;
      for (i1 = 0; i1 != v36; ++i1)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameCalibrationMatricesAtIndex:](self, "perFrameCalibrationMatricesAtIndex:", i1);
        objc_msgSend(v47, "addPerFrameCalibrationMatrices:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameDistortionsCount](self, "perFrameDistortionsCount"))
  {
    objc_msgSend(v47, "clearPerFrameDistortions");
    v38 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameDistortionsCount](self, "perFrameDistortionsCount");
    if (v38)
    {
      v39 = v38;
      for (i2 = 0; i2 != v39; ++i2)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameDistortionAtIndex:](self, "perFrameDistortionAtIndex:", i2);
        objc_msgSend(v47, "addPerFrameDistortion:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details resultPoseRotationsCount](self, "resultPoseRotationsCount"))
  {
    objc_msgSend(v47, "clearResultPoseRotations");
    v41 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details resultPoseRotationsCount](self, "resultPoseRotationsCount");
    if (v41)
    {
      v42 = v41;
      for (i3 = 0; i3 != v42; ++i3)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details resultPoseRotationAtIndex:](self, "resultPoseRotationAtIndex:", i3);
        objc_msgSend(v47, "addResultPoseRotation:");
      }
    }
  }
  if (-[CLPLOGENTRYVISIONVLLocalizationMaps488Details resultPoseTranslationsCount](self, "resultPoseTranslationsCount"))
  {
    objc_msgSend(v47, "clearResultPoseTranslations");
    v44 = -[CLPLOGENTRYVISIONVLLocalizationMaps488Details resultPoseTranslationsCount](self, "resultPoseTranslationsCount");
    if (v44)
    {
      v45 = v44;
      for (i4 = 0; i4 != v45; ++i4)
      {
        -[CLPLOGENTRYVISIONVLLocalizationMaps488Details resultPoseTranslationAtIndex:](self, "resultPoseTranslationAtIndex:", i4);
        objc_msgSend(v47, "addResultPoseTranslation:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 360) = self->_numInliers;
    *(_BYTE *)(v5 + 384) |= 4u;
  }
  PBRepeatedFloatCopy();
  PBRepeatedDoubleCopy();
  PBRepeatedInt32Copy();
  PBRepeatedDoubleCopy();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v6 + 368) = self->_numSlamTracks;
    *(_BYTE *)(v6 + 384) |= 8u;
  }
  PBRepeatedFloatCopy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 344) = self->_descriptorDimension;
    *(_BYTE *)(v6 + 384) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_slamTrackDescriptors, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 376);
  *(_QWORD *)(v6 + 376) = v7;

  PBRepeatedInt32Copy();
  PBRepeatedFloatCopy();
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 352) = self->_numFrames;
    *(_BYTE *)(v6 + 384) |= 2u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedDoubleCopy();
  PBRepeatedDoubleCopy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *slamTrackDescriptors;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 384) & 4) == 0 || self->_numInliers != *((_QWORD *)v4 + 45))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 384) & 4) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedDoubleIsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedDoubleIsEqual())
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 384) & 8) == 0 || self->_numSlamTracks != *((_QWORD *)v4 + 46))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 384) & 8) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedFloatIsEqual())
  {
LABEL_38:
    IsEqual = 0;
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 384) & 1) == 0 || self->_descriptorDimension != *((_QWORD *)v4 + 43))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 384) & 1) != 0)
  {
    goto LABEL_38;
  }
  slamTrackDescriptors = self->_slamTrackDescriptors;
  if ((unint64_t)slamTrackDescriptors | *((_QWORD *)v4 + 47)
    && !-[NSData isEqual:](slamTrackDescriptors, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 384) & 2) == 0 || self->_numFrames != *((_QWORD *)v4 + 44))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 384) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedDoubleIsEqual())
  {
    goto LABEL_38;
  }
  IsEqual = PBRepeatedDoubleIsEqual();
LABEL_39:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v23 = 2654435761u * self->_numInliers;
  else
    v23 = 0;
  v22 = PBRepeatedFloatHash();
  v21 = PBRepeatedDoubleHash();
  v19 = PBRepeatedInt32Hash();
  v3 = PBRepeatedDoubleHash();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v4 = 2654435761u * self->_numSlamTracks;
  else
    v4 = 0;
  v5 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_descriptorDimension;
  else
    v6 = 0;
  v7 = -[NSData hash](self->_slamTrackDescriptors, "hash", v19);
  v8 = PBRepeatedInt32Hash();
  v9 = PBRepeatedFloatHash();
  v10 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761u * self->_numFrames;
  else
    v11 = 0;
  v12 = v22 ^ v23 ^ v21 ^ v20 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7;
  v13 = v8 ^ v9 ^ v10 ^ v11 ^ PBRepeatedInt32Hash();
  v14 = v12 ^ v13 ^ PBRepeatedFloatHash();
  v15 = PBRepeatedFloatHash();
  v16 = v15 ^ PBRepeatedFloatHash();
  v17 = v16 ^ PBRepeatedDoubleHash();
  return v14 ^ v17 ^ PBRepeatedDoubleHash();
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ii;
  uint64_t v24;
  uint64_t v25;
  uint64_t jj;
  uint64_t v27;
  uint64_t v28;
  uint64_t kk;
  uint64_t v30;
  uint64_t v31;
  uint64_t mm;
  uint64_t v33;
  uint64_t v34;
  uint64_t nn;
  uint64_t v36;
  uint64_t v37;
  uint64_t i1;
  uint64_t v39;
  uint64_t v40;
  uint64_t i2;
  uint64_t v42;
  uint64_t v43;
  uint64_t i3;
  uint64_t v45;
  uint64_t v46;
  uint64_t i4;
  unint64_t *v48;

  v4 = (unint64_t *)a3;
  if ((v4[48] & 4) != 0)
  {
    self->_numInliers = v4[45];
    *(_BYTE *)&self->_has |= 4u;
  }
  v48 = v4;
  v5 = objc_msgSend(v4, "points2dsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v48, "points2dAtIndex:", i);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPoints2d:](self, "addPoints2d:");
    }
  }
  v8 = objc_msgSend(v48, "points3dsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
    {
      objc_msgSend(v48, "points3dAtIndex:", j);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPoints3d:](self, "addPoints3d:");
    }
  }
  v11 = objc_msgSend(v48, "inlierIndicesCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addInlierIndices:](self, "addInlierIndices:", objc_msgSend(v48, "inlierIndicesAtIndex:", k));
  }
  v14 = objc_msgSend(v48, "slamOriginsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
    {
      objc_msgSend(v48, "slamOriginAtIndex:", m);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamOrigin:](self, "addSlamOrigin:");
    }
  }
  if ((v48[48] & 8) != 0)
  {
    self->_numSlamTracks = v48[46];
    *(_BYTE *)&self->_has |= 8u;
  }
  v17 = objc_msgSend(v48, "slamTracksCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
    {
      objc_msgSend(v48, "slamTracksAtIndex:", n);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTracks:](self, "addSlamTracks:");
    }
  }
  v20 = v48;
  if ((v48[48] & 1) != 0)
  {
    self->_descriptorDimension = v48[43];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v48[47])
  {
    -[CLPLOGENTRYVISIONVLLocalizationMaps488Details setSlamTrackDescriptors:](self, "setSlamTrackDescriptors:");
    v20 = v48;
  }
  v21 = objc_msgSend(v20, "slamTrackObservationsCount");
  if (v21)
  {
    v22 = v21;
    for (ii = 0; ii != v22; ++ii)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTrackObservations:](self, "addSlamTrackObservations:", objc_msgSend(v48, "slamTrackObservationsAtIndex:", ii));
  }
  v24 = objc_msgSend(v48, "slamTracks2dsCount");
  if (v24)
  {
    v25 = v24;
    for (jj = 0; jj != v25; ++jj)
    {
      objc_msgSend(v48, "slamTracks2dAtIndex:", jj);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTracks2d:](self, "addSlamTracks2d:");
    }
  }
  v27 = objc_msgSend(v48, "slamTrackImageIndicesCount");
  if (v27)
  {
    v28 = v27;
    for (kk = 0; kk != v28; ++kk)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTrackImageIndices:](self, "addSlamTrackImageIndices:", objc_msgSend(v48, "slamTrackImageIndicesAtIndex:", kk));
  }
  if ((v48[48] & 2) != 0)
  {
    self->_numFrames = v48[44];
    *(_BYTE *)&self->_has |= 2u;
  }
  v30 = objc_msgSend(v48, "perFrameVioStatusCodesCount");
  if (v30)
  {
    v31 = v30;
    for (mm = 0; mm != v31; ++mm)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameVioStatusCodes:](self, "addPerFrameVioStatusCodes:", objc_msgSend(v48, "perFrameVioStatusCodesAtIndex:", mm));
  }
  v33 = objc_msgSend(v48, "perFrameVioPosesCount");
  if (v33)
  {
    v34 = v33;
    for (nn = 0; nn != v34; ++nn)
    {
      objc_msgSend(v48, "perFrameVioPosesAtIndex:", nn);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameVioPoses:](self, "addPerFrameVioPoses:");
    }
  }
  v36 = objc_msgSend(v48, "perFrameCalibrationMatricesCount");
  if (v36)
  {
    v37 = v36;
    for (i1 = 0; i1 != v37; ++i1)
    {
      objc_msgSend(v48, "perFrameCalibrationMatricesAtIndex:", i1);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameCalibrationMatrices:](self, "addPerFrameCalibrationMatrices:");
    }
  }
  v39 = objc_msgSend(v48, "perFrameDistortionsCount");
  if (v39)
  {
    v40 = v39;
    for (i2 = 0; i2 != v40; ++i2)
    {
      objc_msgSend(v48, "perFrameDistortionAtIndex:", i2);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameDistortion:](self, "addPerFrameDistortion:");
    }
  }
  v42 = objc_msgSend(v48, "resultPoseRotationsCount");
  if (v42)
  {
    v43 = v42;
    for (i3 = 0; i3 != v43; ++i3)
    {
      objc_msgSend(v48, "resultPoseRotationAtIndex:", i3);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addResultPoseRotation:](self, "addResultPoseRotation:");
    }
  }
  v45 = objc_msgSend(v48, "resultPoseTranslationsCount");
  if (v45)
  {
    v46 = v45;
    for (i4 = 0; i4 != v46; ++i4)
    {
      objc_msgSend(v48, "resultPoseTranslationAtIndex:", i4);
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addResultPoseTranslation:](self, "addResultPoseTranslation:");
    }
  }

}

- (unint64_t)numInliers
{
  return self->_numInliers;
}

- (unint64_t)numSlamTracks
{
  return self->_numSlamTracks;
}

- (unint64_t)descriptorDimension
{
  return self->_descriptorDimension;
}

- (NSData)slamTrackDescriptors
{
  return self->_slamTrackDescriptors;
}

- (void)setSlamTrackDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_slamTrackDescriptors, a3);
}

- (unint64_t)numFrames
{
  return self->_numFrames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slamTrackDescriptors, 0);
}

@end
