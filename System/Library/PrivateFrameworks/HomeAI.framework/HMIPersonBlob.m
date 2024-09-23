@implementation HMIPersonBlob

- (HMIPersonBlob)initWithNewPersonEvent:(id)a3 timeStamp:(id *)a4
{
  id v6;
  char *v7;
  HMIPersonBlob *v8;
  int64_t var3;
  uint64_t v10;
  NSMutableIndexSet *personIndices;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HMIFaceprint *faceprint;
  void *v20;
  void *v21;
  uint64_t v22;
  HMITorsoprint *torsoprint;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMIPersonBlob;
  v7 = -[HMIPersonBlob init](&v27, sel_init);
  v8 = (HMIPersonBlob *)v7;
  if (v7)
  {
    var3 = a4->var3;
    *(_OWORD *)(v7 + 40) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v7 + 7) = var3;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v10 = objc_claimAutoreleasedReturnValue();
    personIndices = v8->_personIndices;
    v8->_personIndices = (NSMutableIndexSet *)v10;

    objc_msgSend(v6, "boundingBoxForTracker");
    v8->_boundingBox.origin.x = v12;
    v8->_boundingBox.origin.y = v13;
    v8->_boundingBox.size.width = v14;
    v8->_boundingBox.size.height = v15;
    objc_msgSend(v6, "face");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "faceRecognition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "faceprint");
    v18 = objc_claimAutoreleasedReturnValue();
    faceprint = v8->_faceprint;
    v8->_faceprint = (HMIFaceprint *)v18;

    objc_msgSend(v6, "torso");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "torsoRecognition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "torsoprint");
    v22 = objc_claimAutoreleasedReturnValue();
    torsoprint = v8->_torsoprint;
    v8->_torsoprint = (HMITorsoprint *)v22;

    objc_msgSend(v6, "sessionEntityUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_blobID, v25);
    if (!v24)

  }
  return v8;
}

- (void)trackPersonBlob:(id)a3
{
  id v4;

  objc_msgSend(a3, "blobID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIPersonBlob setBlobID:](self, "setBlobID:", v4);

}

- (float)similarityToPersonBlob:(id)a3
{
  id v4;
  uint64_t v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  float v35;
  void *v36;
  HMIPersonBlob *v37;
  NSObject *v38;
  Float64 Seconds;
  Float64 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  float v55;
  float v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CMTime v62;
  CMTime time;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  Float64 v67;
  __int16 v68;
  Float64 v69;
  __int16 v70;
  double v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  double v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  double v79;
  __int16 v80;
  unint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMIPersonBlob faceprint](self, "faceprint");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.17;
  if (v5)
  {
    v7 = (void *)v5;
    objc_msgSend(v4, "faceprint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMIPersonBlob faceprint](self, "faceprint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "faceprint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v10, v12);
      v6 = v13;

    }
  }
  -[HMIPersonBlob torsoprint](self, "torsoprint");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = 0.15;
  if (v14)
  {
    v16 = (void *)v14;
    objc_msgSend(v4, "torsoprint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[HMIPersonBlob torsoprint](self, "torsoprint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "torsoprint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v19, v21);
      v15 = v22;

    }
  }
  -[HMIPersonBlob boundingBox](self, "boundingBox");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v4, "boundingBox");
  v35 = HMICGRectGeneralizedIntersectionOverUnion(v24, v26, v28, v30, v31, v32, v33, v34);
  v36 = (void *)MEMORY[0x220735570]();
  v37 = self;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v36;
    if (v4)
      objc_msgSend(v4, "timeStamp");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    -[HMIPersonBlob timeStamp](v37, "timeStamp");
    v40 = CMTimeGetSeconds(&v62);
    objc_msgSend(v4, "boundingBox");
    HMICGRectDescription(v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blobID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "UUIDString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "substringToIndex:", 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonBlob boundingBox](v37, "boundingBox");
    HMICGRectDescription(v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIPersonBlob blobID](v37, "blobID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "UUIDString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "substringToIndex:", 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138546434;
    v65 = v60;
    v66 = 2048;
    v67 = Seconds;
    v68 = 2048;
    v69 = v40;
    v70 = 2048;
    v71 = v6;
    v72 = 2048;
    v73 = 0x3FC5C28F60000000;
    v74 = 2048;
    v75 = v15;
    v76 = 2048;
    v77 = 0x3FC3333340000000;
    v78 = 2048;
    v79 = v35;
    v80 = 2048;
    v81 = 0xBFE0000000000000;
    v82 = 2112;
    v83 = v45;
    v84 = 2112;
    v85 = v46;
    v86 = 2112;
    v87 = v51;
    v88 = 2112;
    v89 = v54;
    _os_log_impl(&dword_219D45000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Track(PTS:%.2f-%.2f), dF:%.2f(%.2f), dT:%.2f(%.2f), GIOU:%.2f(%.2f), %@(%@) vs %@(%@)", buf, 0x84u);

    v36 = v61;
  }

  objc_autoreleasePoolPop(v36);
  if (v6 >= 0.17)
  {
    v56 = 0.0;
    if (v35 > -0.5)
      v56 = (float)(v35 + 1.0) * 0.5;
    if (v15 < 0.15)
      v55 = (float)((float)(v35 + 1.0) * 0.5) + 1.0;
    else
      v55 = v56;
  }
  else
  {
    v55 = (float)(1.0 - v6) + 2.0;
  }

  return v55;
}

- (BOOL)isExpiredAtTimeStamp:(id *)a3
{
  CMTime v5;
  CMTime rhs;
  CMTime time;

  -[HMIPersonBlob timeStamp](self, "timeStamp");
  v5 = *(CMTime *)a3;
  CMTimeSubtract(&time, &v5, &rhs);
  return CMTimeGetSeconds(&time) > 5.0;
}

- (id)shortDescription
{
  Float64 Seconds;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  void *v21;
  CMTime time;

  v21 = (void *)MEMORY[0x24BDD17C8];
  -[HMIPersonBlob timeStamp](self, "timeStamp");
  Seconds = CMTimeGetSeconds(&time);
  -[HMIPersonBlob blobID](self, "blobID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringToIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIPersonBlob boundingBox](self, "boundingBox");
  HMICGRectDescription(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIPersonBlob faceprint](self, "faceprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR(", ");
  if (!v12)
  {
    -[HMIPersonBlob torsoprint](self, "torsoprint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      v13 = &stru_24DBF1B40;
  }
  -[HMIPersonBlob faceprint](self, "faceprint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("F");
  else
    v15 = &stru_24DBF1B40;
  -[HMIPersonBlob torsoprint](self, "torsoprint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("T");
  if (!v16)
    v17 = &stru_24DBF1B40;
  objc_msgSend(v21, "stringWithFormat:", CFSTR("PersonBlob(PTS:%.2f): %@ (%@%@%@%@)"), *(_QWORD *)&Seconds, v6, v11, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  return v18;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_timeStamp, 24, 1, 0);
  return result;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 8, 1);
}

- (HMITorsoprint)torsoprint
{
  return (HMITorsoprint *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableIndexSet)personIndices
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersonIndices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)blobID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBlobID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blobID, 0);
  objc_storeStrong((id *)&self->_personIndices, 0);
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
}

@end
