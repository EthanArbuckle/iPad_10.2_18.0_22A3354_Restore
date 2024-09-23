@implementation HMITorsoClassifier

- (HMITorsoClassifier)init
{
  HMITorsoClassifier *v2;
  HMITorsoprinter *v3;
  HMITorsoprinter *torsoprinter;
  void *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMITorsoClassifier;
  v2 = -[HMITorsoClassifier init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HMITorsoprinter);
    torsoprinter = v2->_torsoprinter;
    v2->_torsoprinter = v3;

    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberPreferenceForKey:defaultValue:", CFSTR("torsoPersonsModelClassificationThresholdKnown"), &unk_24DC15580);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v2->_classificationThresholdKnown = v7;

  }
  return v2;
}

- (id)classifyTorsoEvent:(id)a3 regionOfInterest:(CGRect)a4 pixelBuffer:(__CVBuffer *)a5 homeUUID:(id)a6 error:(id *)a7
{
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  _BOOL8 v19;
  void *v20;
  HMITorsoClassifier *v21;
  NSObject *v22;
  void *v23;
  double Size;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  float v36;
  void *v37;
  HMITorsoClassifier *v38;
  NSObject *v39;
  void *v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  float v48;
  void *v49;
  HMITorsoClassifier *v50;
  NSObject *v51;
  void *v52;
  __CVBuffer *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMIVideoAnalyzerEventTorso *v60;
  void *v61;
  id v62;
  void *v63;
  HMITorsoClassifier *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  HMITorsoClassification *v72;
  HMITorsoRecognition *v73;
  void *v74;
  void *v75;
  HMITorsoRecognition *v76;
  HMIVideoAnalyzerEventTorso *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  HMITorsoClassification *v89;
  void *v90;
  void *v91;
  void *v92;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v96;
  id v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  double v101;
  __int16 v102;
  double v103;
  __int16 v104;
  CGFloat v105;
  __int16 v106;
  CGFloat v107;
  __int16 v108;
  CGFloat v109;
  uint64_t v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v110 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  objc_msgSend(v12, "roll");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "roll");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

  }
  else
  {
    v17 = 0.0;
  }

  v18 = fabsf(v17);
  v19 = v18 > 1.5708;
  if (v18 > 1.5708)
  {
    v20 = (void *)MEMORY[0x220735570]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v23;
      v100 = 2048;
      v101 = v17 * 57.2957795;
      _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_INFO, "%{public}@Skip torsoEvent with extreme roll (%.0f deg)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }
  Size = HMICVPixelBufferGetSize(a5);
  v26 = v25;
  objc_msgSend(v12, "boundingBox");
  HMICGRectPixelFromNormalized(v27, v28, v29, v30, Size, v26);
  v112 = CGRectIntegral(v111);
  v31 = v112.origin.x;
  v32 = v112.origin.y;
  v33 = v112.size.width;
  v34 = v112.size.height;
  v35 = CGRectGetWidth(v112);
  v113.origin.x = v31;
  v113.origin.y = v32;
  v113.size.width = v33;
  v113.size.height = v34;
  v36 = v35 / (CGRectGetHeight(v113) + 0.00000999999975);
  if (v36 > 0.9)
  {
    v37 = (void *)MEMORY[0x220735570]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v36;
      objc_msgSend(v12, "boundingBox");
      v42 = CGRectGetWidth(v114);
      objc_msgSend(v12, "boundingBox");
      v43 = CGRectGetHeight(v115);
      *(_DWORD *)buf = 138544642;
      v99 = v40;
      v100 = 2048;
      v101 = v41;
      v102 = 2048;
      v103 = Size;
      v104 = 2048;
      v105 = v26;
      v106 = 2048;
      v107 = v42;
      v108 = 2048;
      v109 = v43;
      _os_log_impl(&dword_219D45000, v39, OS_LOG_TYPE_INFO, "%{public}@Skip torsoEvent with extreme aspect ratio (w/h) (%.2f) pixelDim:(%f, %f) bbox:(%f, %f)", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v37);
    v19 = 1;
  }
  objc_msgSend(v12, "boundingBox");
  v48 = HMICGRectMinElementwiseDistance(v44, v45, v46, v47, x, y, width, height);
  if (v48 < 0.01)
  {
    v49 = (void *)MEMORY[0x220735570]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v52;
      v100 = 2048;
      v101 = v48;
      _os_log_impl(&dword_219D45000, v51, OS_LOG_TYPE_INFO, "%{public}@Skip torsoEvent with torsoBox close to roi boundary. Dist: (%.4f)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v49);
    v19 = 1;
  }
  v97 = 0;
  v53 = +[HMITorsoprinter createTorsoPixelBufferForTorsoEvent:pixelBuffer:error:](HMITorsoprinter, "createTorsoPixelBufferForTorsoEvent:pixelBuffer:error:", v12, a5, &v97);
  v54 = v97;
  if (v53)
  {
    -[HMITorsoClassifier torsoprinter](self, "torsoprinter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "torsoprintForTorsoPixelBuffer:unrecognizable:error:", v53, v19, a7);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferRelease(v53);
    if (!v56)
    {
      v60 = (HMIVideoAnalyzerEventTorso *)v12;
LABEL_36:

      goto LABEL_37;
    }
    if ((objc_msgSend(v56, "unrecognizable") & 1) != 0)
    {
      v57 = 0;
    }
    else
    {
      +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v54;
      objc_msgSend(v61, "predictPersonFromTorsoObservation:homeUUID:error:", v56, v13, &v96);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v96;

      if (v62)
      {
        v63 = (void *)MEMORY[0x220735570]();
        v64 = self;
        HMFGetOSLogHandle();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v99 = v66;
          _os_log_impl(&dword_219D45000, v65, OS_LOG_TYPE_INFO, "%{public}@Failed to predict using torso vip model", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v63);
        if (a7)
          *a7 = objc_retainAutorelease(v62);
        HMIErrorLog(v64, v62);
        v60 = 0;
        v54 = v62;
        goto LABEL_35;
      }
      if (v57)
      {
        objc_msgSend(v57, "confidence");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "doubleValue");
        v69 = v68;
        -[HMITorsoClassifier classificationThresholdKnown](self, "classificationThresholdKnown");
        v71 = v70;

        if (v69 >= v71)
        {
          v89 = [HMITorsoClassification alloc];
          objc_msgSend(v57, "personUUID");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "sourceUUID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "confidence");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "doubleValue");
          v72 = -[HMITorsoClassification initWithPersonUUID:sourceUUID:confidence:](v89, "initWithPersonUUID:sourceUUID:confidence:", v90, v91);

          v54 = 0;
          goto LABEL_34;
        }
      }
      v54 = 0;
    }
    v72 = 0;
LABEL_34:
    v73 = [HMITorsoRecognition alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "UUID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[HMITorsoRecognition initWithTorsoprint:classification:predictedLinkedEntityUUIDs:sessionEntityAssignment:sessionEntityUUID:](v73, "initWithTorsoprint:classification:predictedLinkedEntityUUIDs:sessionEntityAssignment:sessionEntityUUID:", v56, v72, v74, 0, v75);

    v77 = [HMIVideoAnalyzerEventTorso alloc];
    objc_msgSend(v12, "confidence");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingBox");
    v80 = v79;
    v82 = v81;
    v84 = v83;
    v86 = v85;
    objc_msgSend(v12, "roll");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v77, "initWithConfidence:boundingBox:roll:torsoRecognition:", v78, v87, v76, v80, v82, v84, v86);

LABEL_35:
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1021, v54);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (a7)
    *a7 = objc_retainAutorelease(v58);
  HMIErrorLog(self, v59);

  v60 = (HMIVideoAnalyzerEventTorso *)v12;
LABEL_37:

  return v60;
}

- (HMITorsoprinter)torsoprinter
{
  return (HMITorsoprinter *)objc_getProperty(self, a2, 8, 1);
}

- (double)classificationThresholdKnown
{
  return self->_classificationThresholdKnown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprinter, 0);
}

@end
