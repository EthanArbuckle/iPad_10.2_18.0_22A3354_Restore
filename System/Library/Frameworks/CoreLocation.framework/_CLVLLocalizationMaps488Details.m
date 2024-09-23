@implementation _CLVLLocalizationMaps488Details

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  objc_msgSend_resetInliers(self, a2, v2, v3);
  objc_msgSend_resetSlamTracks(self, v5, v6, v7);
  objc_msgSend_resetFrames(self, v8, v9, v10);
  v11.receiver = self;
  v11.super_class = (Class)_CLVLLocalizationMaps488Details;
  -[_CLVLLocalizationMaps488Details dealloc](&v11, sel_dealloc);
}

- (void)resetInliers
{
  float *points2D;
  double *points3D;
  int *inlierIndices;

  points2D = self->_points2D;
  if (points2D)
  {
    free(points2D);
    self->_points2D = 0;
  }
  points3D = self->_points3D;
  if (points3D)
  {
    free(points3D);
    self->_points3D = 0;
  }
  inlierIndices = self->_inlierIndices;
  if (inlierIndices)
  {
    free(inlierIndices);
    self->_inlierIndices = 0;
  }
  self->_inliersCount = 0;
}

- (void)resetSlamTracks
{
  float *slamTracks;
  char *slamTrackDescriptors;
  signed __int16 *slamTrackObservations;
  float *slamTracks2D;
  signed __int16 *slamTrackImageIndices;

  slamTracks = self->_slamTracks;
  if (slamTracks)
  {
    free(slamTracks);
    self->_slamTracks = 0;
  }
  slamTrackDescriptors = self->_slamTrackDescriptors;
  if (slamTrackDescriptors)
  {
    free(slamTrackDescriptors);
    self->_slamTrackDescriptors = 0;
  }
  slamTrackObservations = self->_slamTrackObservations;
  if (slamTrackObservations)
  {
    free(slamTrackObservations);
    self->_slamTrackObservations = 0;
  }
  slamTracks2D = self->_slamTracks2D;
  if (slamTracks2D)
  {
    free(slamTracks2D);
    self->_slamTracks2D = 0;
  }
  slamTrackImageIndices = self->_slamTrackImageIndices;
  if (slamTrackImageIndices)
  {
    free(slamTrackImageIndices);
    self->_slamTrackImageIndices = 0;
  }
  self->_slamTracksCount = 0;
  self->_descriptorDimension = 0;
  self->_totalObservationsCount = 0;
}

- (void)resetFrames
{
  int *perFrameVioStatusCodes;
  float *perFrameVioPoses;
  float *perFrameCalibrationMatrices;
  float *perFrameDistortion;

  perFrameVioStatusCodes = self->_perFrameVioStatusCodes;
  if (perFrameVioStatusCodes)
  {
    free(perFrameVioStatusCodes);
    self->_perFrameVioStatusCodes = 0;
  }
  perFrameVioPoses = self->_perFrameVioPoses;
  if (perFrameVioPoses)
  {
    free(perFrameVioPoses);
    self->_perFrameVioPoses = 0;
  }
  perFrameCalibrationMatrices = self->_perFrameCalibrationMatrices;
  if (perFrameCalibrationMatrices)
  {
    free(perFrameCalibrationMatrices);
    self->_perFrameCalibrationMatrices = 0;
  }
  perFrameDistortion = self->_perFrameDistortion;
  if (perFrameDistortion)
  {
    free(perFrameDistortion);
    self->_perFrameDistortion = 0;
  }
  self->_frameCount = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  if ((objc_msgSend_setInliersCount_points2D_points3D_inlierIndices_((void *)v12, v13, self->_inliersCount, (uint64_t)self->_points2D, self->_points3D, self->_inlierIndices) & 1) != 0&& (v15 = *(_OWORD *)self->_slamOrigin, v16 = *(_OWORD *)&self->_slamOrigin[2], *(_OWORD *)(v12 + 40) = *(_OWORD *)&self->_slamOrigin[4], *(_OWORD *)(v12 + 24) = v16, *(_OWORD *)(v12 + 8) = v15, (objc_msgSend_setSlamTracksCount_slamTracks_descriptorDimension_slamTrackDescriptors_slamTrackObservations_slamTracks2D_slamTrackImageIndices_((void *)v12, v14, self->_slamTracksCount, (uint64_t)self->_slamTracks, self->_descriptorDimension, self->_slamTrackDescriptors, self->_slamTrackObservations,
           self->_slamTracks2D,
           self->_slamTrackImageIndices) & 1) != 0)
    && (objc_msgSend_setFrameCount_perFrameVioStatusCodes_perFrameVioPoses_perFrameCalibrationMatrices_perFrameDistortion_((void *)v12, v17, self->_frameCount, (uint64_t)self->_perFrameVioStatusCodes, self->_perFrameVioPoses, self->_perFrameCalibrationMatrices, self->_perFrameDistortion) & 1) != 0)
  {
    *(_OWORD *)(v12 + 56) = *(_OWORD *)&self->_resultPoseRotation[0][0];
    v18 = *(_OWORD *)&self->_resultPoseRotation[0][2];
    v19 = *(_OWORD *)&self->_resultPoseRotation[1][1];
    v20 = *(_OWORD *)&self->_resultPoseRotation[2][0];
    *(double *)(v12 + 120) = self->_resultPoseRotation[2][2];
    *(_OWORD *)(v12 + 104) = v20;
    *(_OWORD *)(v12 + 88) = v19;
    *(_OWORD *)(v12 + 72) = v18;
    v21 = *(_OWORD *)self->_resultPoseTranslation;
    *(double *)(v12 + 144) = self->_resultPoseTranslation[2];
    *(_OWORD *)(v12 + 128) = v21;
  }
  else
  {

    return 0;
  }
  return (id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVLLocalizationMaps488Details)initWithCoder:(id)a3
{
  const char *v4;
  char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  __int128 *v14;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __int16 *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)_CLVLLocalizationMaps488Details;
  v5 = -[_CLVLLocalizationMaps488Details init](&v70, sel_init);
  if (v5)
  {
    v68 = 0;
    v69 = 0;
    v67 = 0;
    v6 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v4, (uint64_t)CFSTR("points2D"), (uint64_t)&v69);
    v8 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v7, (uint64_t)CFSTR("points3D"), (uint64_t)&v68);
    v10 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v9, (uint64_t)CFSTR("inlierIndices"), (uint64_t)&v67);
    v12 = v67 >> 2;
    if (v69 != 8 * (v67 >> 2))
      goto LABEL_25;
    if (v68 != 24 * v12)
      goto LABEL_25;
    if ((objc_msgSend_setInliersCount_points2D_points3D_inlierIndices_(v5, v11, v12, v6, v8, v10) & 1) == 0)
      goto LABEL_25;
    v66 = 0;
    v14 = (__int128 *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v13, (uint64_t)CFSTR("slamOrigin"), (uint64_t)&v66);
    if (v66 != 48)
      goto LABEL_25;
    v17 = *v14;
    v18 = v14[1];
    *(_OWORD *)(v5 + 40) = v14[2];
    *(_OWORD *)(v5 + 24) = v18;
    *(_OWORD *)(v5 + 8) = v17;
    v19 = objc_msgSend_decodeIntegerForKey_(a3, v15, (uint64_t)CFSTR("descriptorDimension"), v16);
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v61 = 0;
    v21 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v20, (uint64_t)CFSTR("slamTracks"), (uint64_t)&v65);
    v23 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v22, (uint64_t)CFSTR("slamTrackDescriptors"), (uint64_t)&v64);
    v25 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v24, (uint64_t)CFSTR("slamTrackObservations"), (uint64_t)&v63);
    v27 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v26, (uint64_t)CFSTR("slamTracks2D"), (uint64_t)&v62);
    v29 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v28, (uint64_t)CFSTR("slamTrackImageIndices"), (uint64_t)&v61);
    v31 = 0;
    v32 = v63 >> 1;
    if (v25 && v63 >= 2)
    {
      v31 = 0;
      if (v32 <= 1)
        v33 = 1;
      else
        v33 = v63 >> 1;
      v34 = (__int16 *)v25;
      do
      {
        v35 = *v34++;
        v31 += v35;
        --v33;
      }
      while (v33);
    }
    if (v65 != 12 * v32)
      goto LABEL_25;
    if (v64 != v32 * v19)
      goto LABEL_25;
    if (v62 != 8 * v31)
      goto LABEL_25;
    if (v61 != 2 * v31)
      goto LABEL_25;
    if ((objc_msgSend_setSlamTracksCount_slamTracks_descriptorDimension_slamTrackDescriptors_slamTrackObservations_slamTracks2D_slamTrackImageIndices_(v5, v30, v32, v21, v19, v23, v25, v27, v29) & 1) == 0)goto LABEL_25;
    v59 = 0;
    v60 = 0;
    v57 = 0;
    v58 = 0;
    v37 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v36, (uint64_t)CFSTR("perFrameVioStatusCodes"), (uint64_t)&v60);
    v39 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v38, (uint64_t)CFSTR("perFrameVioPoses"), (uint64_t)&v59);
    v41 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v40, (uint64_t)CFSTR("perFrameCalibrationMatrices"), (uint64_t)&v58);
    v43 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v42, (uint64_t)CFSTR("perFrameDistortion"), (uint64_t)&v57);
    v45 = v60 >> 2;
    if (v59 != 48 * (v60 >> 2))
      goto LABEL_25;
    if (v58 == 36 * v45
      && v57 == 8 * v45
      && (objc_msgSend_setFrameCount_perFrameVioStatusCodes_perFrameVioPoses_perFrameCalibrationMatrices_perFrameDistortion_(v5, v44, v45, v37, v39, v41, v43) & 1) != 0&& (v55 = 0, v56 = 0, v47 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v46, (uint64_t)CFSTR("resultPoseRotation"), (uint64_t)&v56), v49 = objc_msgSend_decodeBytesForKey_returnedLength_(a3, v48, (uint64_t)CFSTR("resultPoseTranslation"), (uint64_t)&v55),
          v56 == 72)
      && v55 == 24)
    {
      *(_OWORD *)(v5 + 56) = *(_OWORD *)v47;
      v50 = *(_OWORD *)(v47 + 16);
      v51 = *(_OWORD *)(v47 + 32);
      v52 = *(_OWORD *)(v47 + 48);
      *((_QWORD *)v5 + 15) = *(_QWORD *)(v47 + 64);
      *(_OWORD *)(v5 + 104) = v52;
      *(_OWORD *)(v5 + 88) = v51;
      *(_OWORD *)(v5 + 72) = v50;
      v53 = *(_OWORD *)v49;
      *((_QWORD *)v5 + 18) = *(_QWORD *)(v49 + 16);
      *((_OWORD *)v5 + 8) = v53;
    }
    else
    {
LABEL_25:

      return 0;
    }
  }
  return (_CLVLLocalizationMaps488Details *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t inliersCount;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  unint64_t slamTracksCount;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t totalObservationsCount;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  unint64_t frameCount;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;

  inliersCount = self->_inliersCount;
  if (inliersCount)
  {
    v6 = 24 * inliersCount;
    v7 = 4 * inliersCount;
    objc_msgSend_encodeBytes_length_forKey_(a3, a2, (uint64_t)self->_points2D, 8 * inliersCount, CFSTR("points2D"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v8, (uint64_t)self->_points3D, v6, CFSTR("points3D"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v9, (uint64_t)self->_inlierIndices, v7, CFSTR("inlierIndices"));
  }
  objc_msgSend_encodeBytes_length_forKey_(a3, a2, (uint64_t)self->_slamOrigin, 48, CFSTR("slamOrigin"));
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_descriptorDimension, (uint64_t)CFSTR("descriptorDimension"));
  slamTracksCount = self->_slamTracksCount;
  if (slamTracksCount)
  {
    v13 = 12 * slamTracksCount;
    v14 = self->_descriptorDimension * slamTracksCount;
    v15 = 2 * slamTracksCount;
    totalObservationsCount = self->_totalObservationsCount;
    v17 = 8 * totalObservationsCount;
    v18 = 2 * totalObservationsCount;
    objc_msgSend_encodeBytes_length_forKey_(a3, v11, (uint64_t)self->_slamTracks, v13, CFSTR("slamTracks"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v19, (uint64_t)self->_slamTrackDescriptors, v14, CFSTR("slamTrackDescriptors"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v20, (uint64_t)self->_slamTrackObservations, v15, CFSTR("slamTrackObservations"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v21, (uint64_t)self->_slamTracks2D, v17, CFSTR("slamTracks2D"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v22, (uint64_t)self->_slamTrackImageIndices, v18, CFSTR("slamTrackImageIndices"));
  }
  frameCount = self->_frameCount;
  if (frameCount)
  {
    v24 = 48 * frameCount;
    v25 = 36 * frameCount;
    v26 = 8 * frameCount;
    objc_msgSend_encodeBytes_length_forKey_(a3, v11, (uint64_t)self->_perFrameVioStatusCodes, 4 * frameCount, CFSTR("perFrameVioStatusCodes"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v27, (uint64_t)self->_perFrameVioPoses, v24, CFSTR("perFrameVioPoses"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v28, (uint64_t)self->_perFrameCalibrationMatrices, v25, CFSTR("perFrameCalibrationMatrices"));
    objc_msgSend_encodeBytes_length_forKey_(a3, v29, (uint64_t)self->_perFrameDistortion, v26, CFSTR("perFrameDistortion"));
  }
  objc_msgSend_encodeBytes_length_forKey_(a3, v11, (uint64_t)self->_resultPoseRotation, 72, CFSTR("resultPoseRotation"));
  objc_msgSend_encodeBytes_length_forKey_(a3, v30, (uint64_t)self->_resultPoseTranslation, 24, CFSTR("resultPoseTranslation"));
}

- (BOOL)setInliersCount:(unint64_t)a3 points2D:(const float *)a4 points3D:(const double *)a5 inlierIndices:(const int *)a6
{
  BOOL result;
  size_t v12;
  size_t v13;
  size_t v14;
  float *points2D;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;

  if (!a3)
  {
    objc_msgSend_resetInliers(self, a2, 0, (uint64_t)a4, a5, a6);
    return 1;
  }
  result = 0;
  if (a4 && a5 && a6)
  {
    v12 = 8 * a3;
    v13 = 24 * a3;
    v14 = 4 * a3;
    if (self->_inliersCount == a3)
    {
      points2D = self->_points2D;
    }
    else
    {
      objc_msgSend_resetInliers(self, a2, a3, (uint64_t)a4);
      self->_points2D = (float *)malloc_type_malloc(v12, 0x3716E0E5uLL);
      self->_points3D = (double *)malloc_type_malloc(v13, 0xAD1130D6uLL);
      v19 = (int *)malloc_type_malloc(v14, 0x6454C56BuLL);
      self->_inlierIndices = v19;
      points2D = self->_points2D;
      if (!points2D || !self->_points3D || !v19)
      {
        objc_msgSend_resetInliers(self, v16, v17, v18);
        return 0;
      }
    }
    self->_inliersCount = a3;
    memcpy(points2D, a4, v12);
    memcpy(self->_points3D, a5, v13);
    memcpy(self->_inlierIndices, a6, v14);
    return 1;
  }
  return result;
}

- (BOOL)setSlamTracksCount:(unint64_t)a3 slamTracks:(const float *)a4 descriptorDimension:(unint64_t)a5 slamTrackDescriptors:(const char *)a6 slamTrackObservations:(const signed __int16 *)a7 slamTracks2D:(const float *)a8 slamTrackImageIndices:(const signed __int16 *)a9
{
  unint64_t v16;
  const signed __int16 *v17;
  unint64_t v18;
  uint64_t v19;
  BOOL result;
  BOOL v21;
  BOOL v22;
  float *slamTracks;
  signed __int16 *slamTrackObservations;
  signed __int16 *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  char *slamTrackDescriptors;
  char *v30;
  float *slamTracks2D;
  signed __int16 *slamTrackImageIndices;
  signed __int16 *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t __n;
  unint64_t size;

  v16 = 0;
  if (a3 && a7)
  {
    v16 = 0;
    v17 = a7;
    v18 = a3;
    do
    {
      v19 = *v17++;
      v16 += v19;
      --v18;
    }
    while (v18);
  }
  if (!a3)
  {
    objc_msgSend_resetSlamTracks(self, a2, 0, (uint64_t)a4);
    self->_descriptorDimension = a5;
    return 1;
  }
  if (!a4)
    return 0;
  result = 0;
  if (a6)
    v21 = 1;
  else
    v21 = a5 == 0;
  if (v21 && a7)
  {
    if (a9)
      v22 = a8 == 0;
    else
      v22 = 1;
    if (v22 && v16)
      return 0;
    __n = a5 * a3;
    size = 12 * a3;
    if (self->_slamTracksCount == a3)
      goto LABEL_20;
    slamTracks = self->_slamTracks;
    if (slamTracks)
    {
      free(slamTracks);
      self->_slamTracks = 0;
    }
    slamTrackObservations = self->_slamTrackObservations;
    if (slamTrackObservations)
    {
      free(slamTrackObservations);
      self->_slamTrackObservations = 0;
    }
    self->_slamTracks = (float *)malloc_type_malloc(size, 0xF36568ADuLL);
    v25 = (signed __int16 *)malloc_type_malloc(2 * a3, 0xDBE51934uLL);
    self->_slamTrackObservations = v25;
    if (!self->_slamTracks || !v25)
      goto LABEL_42;
    if (self->_slamTracksCount == a3)
    {
LABEL_20:
      if (self->_descriptorDimension == a5)
        goto LABEL_34;
    }
    slamTrackDescriptors = self->_slamTrackDescriptors;
    if (slamTrackDescriptors)
    {
      free(slamTrackDescriptors);
      self->_slamTrackDescriptors = 0;
    }
    v30 = (char *)malloc_type_malloc(__n, 0xFE438E5FuLL);
    self->_slamTrackDescriptors = v30;
    if (v30)
    {
LABEL_34:
      v34 = 2 * a3;
      v35 = 2 * v16;
      if (self->_totalObservationsCount == v16)
        goto LABEL_41;
      slamTracks2D = self->_slamTracks2D;
      if (slamTracks2D)
      {
        free(slamTracks2D);
        self->_slamTracks2D = 0;
      }
      slamTrackImageIndices = self->_slamTrackImageIndices;
      if (slamTrackImageIndices)
      {
        free(slamTrackImageIndices);
        self->_slamTrackImageIndices = 0;
      }
      self->_slamTracks2D = (float *)malloc_type_malloc(8 * v16, 0xC411E7B4uLL);
      v33 = (signed __int16 *)malloc_type_malloc(v35, 0x1EA59CBFuLL);
      self->_slamTrackImageIndices = v33;
      if (self->_slamTracks2D)
      {
        if (v33)
        {
LABEL_41:
          self->_slamTracksCount = a3;
          self->_descriptorDimension = a5;
          self->_totalObservationsCount = v16;
          memcpy(self->_slamTracks, a4, size);
          memcpy(self->_slamTrackDescriptors, a6, __n);
          memcpy(self->_slamTrackObservations, a7, v34);
          memcpy(self->_slamTracks2D, a8, 8 * v16);
          memcpy(self->_slamTrackImageIndices, a9, v35);
          return 1;
        }
      }
    }
LABEL_42:
    objc_msgSend_resetSlamTracks(self, v26, v27, v28, v34);
    return 0;
  }
  return result;
}

- (BOOL)setFrameCount:(unint64_t)a3 perFrameVioStatusCodes:(const int *)a4 perFrameVioPoses:(const float *)a5 perFrameCalibrationMatrices:(const float *)a6 perFrameDistortion:(const float *)a7
{
  BOOL result;
  size_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  int *perFrameVioStatusCodes;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  float *v22;

  if (!a3)
  {
    objc_msgSend_resetFrames(self, a2, 0, (uint64_t)a4, a5, a6, a7);
    return 1;
  }
  result = 0;
  if (a4 && a5 && a6 && a7)
  {
    v14 = 4 * a3;
    v15 = 48 * a3;
    v16 = 36 * a3;
    v17 = 8 * a3;
    if (self->_frameCount == a3)
    {
      perFrameVioStatusCodes = self->_perFrameVioStatusCodes;
    }
    else
    {
      objc_msgSend_resetFrames(self, a2, a3, (uint64_t)a4);
      self->_perFrameVioStatusCodes = (int *)malloc_type_malloc(v14, 0x61159052uLL);
      self->_perFrameVioPoses = (float *)malloc_type_malloc(v15, 0x83185973uLL);
      self->_perFrameCalibrationMatrices = (float *)malloc_type_malloc(v16, 0xC824F49EuLL);
      v22 = (float *)malloc_type_malloc(v17, 0x3FD7CECEuLL);
      self->_perFrameDistortion = v22;
      perFrameVioStatusCodes = self->_perFrameVioStatusCodes;
      if (!perFrameVioStatusCodes || !self->_perFrameVioPoses || !self->_perFrameCalibrationMatrices || !v22)
      {
        objc_msgSend_resetFrames(self, v19, v20, v21);
        return 0;
      }
    }
    self->_frameCount = a3;
    memcpy(perFrameVioStatusCodes, a4, v14);
    memcpy(self->_perFrameVioPoses, a5, v15);
    memcpy(self->_perFrameCalibrationMatrices, a6, v16);
    memcpy(self->_perFrameDistortion, a7, v17);
    return 1;
  }
  return result;
}

- (double)slamOrigin
{
  return self->_slamOrigin;
}

- (void)setSlamOrigin:(const double *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)a3;
  v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&self->_slamOrigin[4] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->_slamOrigin[2] = v4;
  *(_OWORD *)self->_slamOrigin = v3;
}

- (double)resultPoseRotation
{
  return self->_resultPoseRotation[0];
}

- (void)setResultPoseRotation:(const double *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_resultPoseRotation[0][0] = *(_OWORD *)a3;
  v3 = *((_OWORD *)a3 + 1);
  v4 = *((_OWORD *)a3 + 2);
  v5 = *((_OWORD *)a3 + 3);
  self->_resultPoseRotation[2][2] = a3[8];
  *(_OWORD *)&self->_resultPoseRotation[2][0] = v5;
  *(_OWORD *)&self->_resultPoseRotation[1][1] = v4;
  *(_OWORD *)&self->_resultPoseRotation[0][2] = v3;
}

- (double)resultPoseTranslation
{
  return self->_resultPoseTranslation;
}

- (void)setResultPoseTranslation:(const double *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3;
  self->_resultPoseTranslation[2] = a3[2];
  *(_OWORD *)self->_resultPoseTranslation = v3;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
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
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;

  v191 = objc_msgSend_stringByAppendingString_(a3, a2, (uint64_t)CFSTR("\t"), (uint64_t)a4);
  v200 = (void *)MEMORY[0x1E0CB3940];
  v199 = objc_msgSend_inliersCount(self, v6, v7, v8);
  v198 = objc_msgSend_points2D(self, v9, v10, v11);
  v197 = 2 * objc_msgSend_inliersCount(self, v12, v13, v14);
  v196 = objc_msgSend_points3D(self, v15, v16, v17);
  v195 = 3 * objc_msgSend_inliersCount(self, v18, v19, v20);
  v194 = objc_msgSend_inlierIndices(self, v21, v22, v23);
  v193 = objc_msgSend_inliersCount(self, v24, v25, v26);
  v192 = objc_msgSend_slamOrigin(self, v27, v28, v29);
  v190 = *(_QWORD *)objc_msgSend_slamOrigin(self, v30, v31, v32);
  v189 = *(_QWORD *)(objc_msgSend_slamOrigin(self, v33, v34, v35) + 8);
  v188 = *(_QWORD *)(objc_msgSend_slamOrigin(self, v36, v37, v38) + 16);
  v187 = *(_QWORD *)(objc_msgSend_slamOrigin(self, v39, v40, v41) + 24);
  v186 = *(_QWORD *)(objc_msgSend_slamOrigin(self, v42, v43, v44) + 32);
  v185 = *(_QWORD *)(objc_msgSend_slamOrigin(self, v45, v46, v47) + 40);
  v184 = objc_msgSend_slamTracksCount(self, v48, v49, v50);
  v183 = objc_msgSend_slamTracks(self, v51, v52, v53);
  v182 = 3 * objc_msgSend_slamTracksCount(self, v54, v55, v56);
  v181 = objc_msgSend_descriptorDimension(self, v57, v58, v59);
  v180 = objc_msgSend_slamTrackDescriptors(self, v60, v61, v62);
  v66 = objc_msgSend_descriptorDimension(self, v63, v64, v65);
  v179 = objc_msgSend_slamTracksCount(self, v67, v68, v69) * v66;
  v178 = objc_msgSend_slamTrackObservations(self, v70, v71, v72);
  v177 = objc_msgSend_slamTracksCount(self, v73, v74, v75);
  v176 = objc_msgSend_slamTracks2D(self, v76, v77, v78);
  v175 = 2 * objc_msgSend_totalObservationsCount(self, v79, v80, v81);
  v174 = objc_msgSend_slamTrackImageIndices(self, v82, v83, v84);
  v173 = objc_msgSend_totalObservationsCount(self, v85, v86, v87);
  v172 = objc_msgSend_frameCount(self, v88, v89, v90);
  v171 = objc_msgSend_perFrameVioStatusCodes(self, v91, v92, v93);
  v170 = objc_msgSend_frameCount(self, v94, v95, v96);
  v100 = objc_msgSend_perFrameVioPoses(self, v97, v98, v99);
  v104 = 12 * objc_msgSend_frameCount(self, v101, v102, v103);
  v108 = objc_msgSend_perFrameCalibrationMatrices(self, v105, v106, v107);
  v112 = 9 * objc_msgSend_frameCount(self, v109, v110, v111);
  v116 = objc_msgSend_perFrameDistortion(self, v113, v114, v115);
  v120 = 2 * objc_msgSend_frameCount(self, v117, v118, v119);
  v124 = objc_msgSend_resultPoseRotation(self, v121, v122, v123);
  v169 = *(_QWORD *)objc_msgSend_resultPoseRotation(self, v125, v126, v127);
  v168 = *(_QWORD *)(objc_msgSend_resultPoseRotation(self, v128, v129, v130) + 8);
  v167 = *(_QWORD *)(objc_msgSend_resultPoseRotation(self, v131, v132, v133) + 16);
  objc_msgSend_resultPoseRotation(self, v134, v135, v136);
  objc_msgSend_resultPoseRotation(self, v137, v138, v139);
  objc_msgSend_resultPoseRotation(self, v140, v141, v142);
  objc_msgSend_resultPoseRotation(self, v143, v144, v145);
  objc_msgSend_resultPoseRotation(self, v146, v147, v148);
  objc_msgSend_resultPoseRotation(self, v149, v150, v151);
  objc_msgSend_resultPoseTranslation(self, v152, v153, v154);
  objc_msgSend_resultPoseTranslation(self, v155, v156, v157);
  objc_msgSend_resultPoseTranslation(self, v158, v159, v160);
  objc_msgSend_resultPoseTranslation(self, v161, v162, v163);
  return (id)objc_msgSend_stringWithFormat_(v200, v164, (uint64_t)CFSTR("<_CLVLLocalizationMaps488Details: %p> {\n%@.inliersCount = %zu,\n%@.points2D = <float: %p> {length = %zu},\n%@.points3D = <double: %p> {length = %zu},\n%@.inlierIndices = <int: %p> {length = %zu},\n%@.slamOrigin = <double: %p> {length = 6, values = [%f, %f, %f, %f, %f, %f]},\n%@.slamTracksCount = %zu,\n%@.slamTracks = <float: %p> {length = %zu},\n%@.descriptorDimension = %zu,\n%@.slamTrackDescriptors = <unsigned char: %p> {length = %zu},\n%@.slamTrackObservations = <short: %p> {length = %zu},\n%@.slamTracks2D = <float: %p> {length = %zu},\n%@.slamTrackImageIndices = <short: %p> {length = %zu},\n%@.frameCount = %zu,\n%@.perFrameVioStatusCodes = <int: %p> {length = %zu},\n%@.perFrameVioPoses = <float: %p> {length = %zu},\n%@.perFrameCalibrationMatrices = <float: %p> {length = %zu},\n%@.perFrameDistortion = <float: %p> {length = %zu},\n%@.resultPoseRotation = <double: %p> {length = 9, values = [%f, %f, %f;\n%@%f, %f, %f;\n%@%f, %f, %f]},\n%@.resultPoseTranslation = <double: %p> {length = 3, values = [%f, %f, %f]}\n%@}"),
               v165,
               self,
               a3,
               v199,
               a3,
               v198,
               v197,
               a3,
               v196,
               v195,
               a3,
               v194,
               v193,
               a3,
               v192,
               v190,
               v189,
               v188,
               v187,
               v186,
               v185,
               a3,
               v184,
               a3,
               v183,
               v182,
               a3,
               v181,
               a3,
               v180,
               v179,
               a3,
               v178,
               v177,
               a3,
               v176,
               v175,
               a3,
               v174,
               v173,
               a3,
               v172,
               a3,
               v171,
               v170,
               a3,
               v100,
               v104,
               a3,
               v108,
               v112,
               a3,
               v116,
               v120,
               a3,
               v124,
               v169,
               v168,
               v167,
               v191);
}

- (unint64_t)inliersCount
{
  return self->_inliersCount;
}

- (float)points2D
{
  return self->_points2D;
}

- (double)points3D
{
  return self->_points3D;
}

- (int)inlierIndices
{
  return self->_inlierIndices;
}

- (unint64_t)slamTracksCount
{
  return self->_slamTracksCount;
}

- (float)slamTracks
{
  return self->_slamTracks;
}

- (unint64_t)descriptorDimension
{
  return self->_descriptorDimension;
}

- (char)slamTrackDescriptors
{
  return self->_slamTrackDescriptors;
}

- (signed)slamTrackObservations
{
  return self->_slamTrackObservations;
}

- (unint64_t)totalObservationsCount
{
  return self->_totalObservationsCount;
}

- (float)slamTracks2D
{
  return self->_slamTracks2D;
}

- (signed)slamTrackImageIndices
{
  return self->_slamTrackImageIndices;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (int)perFrameVioStatusCodes
{
  return self->_perFrameVioStatusCodes;
}

- (float)perFrameVioPoses
{
  return self->_perFrameVioPoses;
}

- (float)perFrameCalibrationMatrices
{
  return self->_perFrameCalibrationMatrices;
}

- (float)perFrameDistortion
{
  return self->_perFrameDistortion;
}

@end
