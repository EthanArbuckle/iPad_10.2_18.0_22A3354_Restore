@implementation CRXFAppClipCodeTranscoder

+ (CRXFAppClipCodeTranscoder)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CRXFAppClipCodeTranscoder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE__ != -1)
    dispatch_once(&sharedInstance___once__LINE__, block);
  return (CRXFAppClipCodeTranscoder *)(id)sharedInstance_instance;
}

void __43__CRXFAppClipCodeTranscoder_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (CRXFAppClipCodeTranscoder)init
{
  CRXFAppClipCodeTranscoder *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRXFAppClipCodeTranscoder;
  v2 = -[CRXFAppClipCodeTranscoder init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

- (unint64_t)payloadLengthForAppClipCodeVersion:(unint64_t)a3
{
  if (a3 <= 5)
    return 16;
  else
    return 19;
}

- (unint64_t)decodeAppClipCodeVersionFromBuffer:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  unint64_t v10;

  v5 = a3;
  v10 = 0;
  if (objc_msgSend(v5, "byteCount") != 16)
  {
    if (objc_msgSend(v5, "byteCount") != 19)
    {
      v6 = 99;
LABEL_6:
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v6, MEMORY[0x24BDBD1B8]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_10;
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "skipBits:", 145) & 1) == 0)
    {
      v6 = 95;
      goto LABEL_6;
    }
  }
LABEL_7:
  if ((objc_msgSend(v5, "readUInteger:bitWidth:", &v10, 4) & 1) != 0)
  {
    v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 105, MEMORY[0x24BDBD1B8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  if (a4 && v7)
  {
    v7 = objc_retainAutorelease(v7);
    *a4 = v7;
  }
LABEL_13:
  v8 = v10;

  return v8;
}

- (id)decodeAppClipCodeFromBytes:(const char *)a3 length:(unint64_t)a4 allowUnsupportedRX:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v9;
  void *v10;

  v7 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  -[CRXFAppClipCodeTranscoder decodeAppClipCodeFromData:allowUnsupportedRX:error:](self, "decodeAppClipCodeFromData:allowUnsupportedRX:error:", v9, v7, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)decodeAppClipCodeFromHexString:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "crxu_dataWithHexString:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CRXFAppClipCodeTranscoder decodeAppClipCodeFromData:allowUnsupportedRX:error:](self, "decodeAppClipCodeFromData:allowUnsupportedRX:error:", v8, v6, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 32, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 129, MEMORY[0x24BDBD1B8]);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)isACCVersionSupported:(unint64_t)a3
{
  return a3 - 1 < 5;
}

- (id)decodeAppClipCodeFromData:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  CRXUBitBuffer *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    v9 = -[CRXUBitBuffer initWithData:]([CRXUBitBuffer alloc], "initWithData:", v8);
    v21 = 0;
    v10 = -[CRXFAppClipCodeTranscoder decodeAppClipCodeVersionFromBuffer:error:](self, "decodeAppClipCodeVersionFromBuffer:error:", v9, &v21);
    v11 = v21;
    v12 = v11;
    if (v11)
    {
      if (a5)
      {
        v13 = objc_retainAutorelease(v11);
LABEL_14:
        v14 = 0;
        *a5 = v13;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      if (-[CRXFAppClipCodeTranscoder isACCVersionSupported:](self, "isACCVersionSupported:", v10))
      {
        -[CRXUBitBuffer rewind](v9, "rewind");
        switch(v10)
        {
          case 1uLL:
            -[CRXFAppClipCodeTranscoder decodeAppClipCodeV1FromBuffer:allowUnsupportedRX:error:](self, "decodeAppClipCodeV1FromBuffer:allowUnsupportedRX:error:", v9, v6, a5);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 2uLL:
            -[CRXFAppClipCodeTranscoder decodeAppClipCodeV2FromBuffer:allowUnsupportedRX:error:](self, "decodeAppClipCodeV2FromBuffer:allowUnsupportedRX:error:", v9, v6, a5);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 3uLL:
            -[CRXFAppClipCodeTranscoder decodeAppClipCodeV3FromBuffer:allowUnsupportedRX:error:](self, "decodeAppClipCodeV3FromBuffer:allowUnsupportedRX:error:", v9, v6, a5);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 4uLL:
            -[CRXFAppClipCodeTranscoder decodeAppClipCodeV4FromBuffer:allowUnsupportedRX:error:](self, "decodeAppClipCodeV4FromBuffer:allowUnsupportedRX:error:", v9, v6, a5);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          case 5uLL:
            -[CRXFAppClipCodeTranscoder decodeAppClipCodeV5FromBuffer:allowUnsupportedRX:error:](self, "decodeAppClipCodeV5FromBuffer:allowUnsupportedRX:error:", v9, v6, a5);
            v15 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            if (!a5)
              goto LABEL_17;
            v16 = (void *)MEMORY[0x24BDD1540];
            v17 = MEMORY[0x24BDBD1B8];
            v18 = 2;
            v19 = 236;
            goto LABEL_13;
        }
        v14 = (void *)v15;
        goto LABEL_23;
      }
      if (a5)
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        v17 = MEMORY[0x24BDBD1B8];
        v18 = 48;
        v19 = 187;
LABEL_13:
        objc_msgSend(v16, "crxf_errorWithCode:file:line:userInfo:", v18, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v19, v17);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_17:
    v14 = 0;
    goto LABEL_23;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 32, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 169, MEMORY[0x24BDBD1B8]);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (BOOL)encodeAppClipCode:(id)a3 toBytes:(char *)a4 length:(unint64_t)a5 error:(id *)a6
{
  objc_class *v10;
  id v11;
  void *v12;

  v10 = (objc_class *)MEMORY[0x24BDBCEC8];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithBytesNoCopy:length:freeWhenDone:", a4, a5, 0);
  LOBYTE(a6) = -[CRXFAppClipCodeTranscoder encodeAppClipCode:toData:error:](self, "encodeAppClipCode:toData:error:", v11, v12, a6);

  return (char)a6;
}

- (id)encodeAppClipCodeToHexString:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = -[CRXFAppClipCodeTranscoder payloadLengthForAppClipCodeVersion:](self, "payloadLengthForAppClipCodeVersion:", objc_msgSend(v6, "version"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v7);
  LODWORD(a4) = -[CRXFAppClipCodeTranscoder encodeAppClipCode:toData:error:](self, "encodeAppClipCode:toData:error:", v6, v8, a4);

  if ((_DWORD)a4)
  {
    objc_msgSend(v8, "crxu_asHexString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)encodeAppClipCode:(id)a3 toData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CRXUBitBuffer *v10;
  BOOL v11;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  v10 = -[CRXUBitBuffer initWithMutableData:]([CRXUBitBuffer alloc], "initWithMutableData:", v9);

  switch(objc_msgSend(v8, "version"))
  {
    case 1:
      v11 = -[CRXFAppClipCodeTranscoder encodeAppClipCodeV1:toBuffer:error:](self, "encodeAppClipCodeV1:toBuffer:error:", v8, v10, a5);
      goto LABEL_9;
    case 2:
      v11 = -[CRXFAppClipCodeTranscoder encodeAppClipCodeV2:toBuffer:error:](self, "encodeAppClipCodeV2:toBuffer:error:", v8, v10, a5);
      goto LABEL_9;
    case 3:
      v11 = -[CRXFAppClipCodeTranscoder encodeAppClipCodeV3:toBuffer:error:](self, "encodeAppClipCodeV3:toBuffer:error:", v8, v10, a5);
      goto LABEL_9;
    case 4:
      v11 = -[CRXFAppClipCodeTranscoder encodeAppClipCodeV4:toBuffer:error:](self, "encodeAppClipCodeV4:toBuffer:error:", v8, v10, a5);
      goto LABEL_9;
    case 5:
      v11 = -[CRXFAppClipCodeTranscoder encodeAppClipCodeV5:toBuffer:error:](self, "encodeAppClipCodeV5:toBuffer:error:", v8, v10, a5);
LABEL_9:
      v12 = v11;
      break;
    default:
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 2, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 299, MEMORY[0x24BDBD1B8]);
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      break;
  }

  return v12;
}

- (id)generateAppClipCodeWithVersion:(unint64_t)a3 lensType:(unint64_t)a4 haveLeftLens:(BOOL)a5 leftSphere:(float)a6 leftCylinder:(float)a7 leftAxis:(unint64_t)a8 leftAddVR:(float)a9 haveRightLens:(BOOL)a10 rightSphere:(float)a11 rightCylinder:(float)a12 rightAxis:(unint64_t)a13 rightAddVR:(float)a14 identifyingColor:(unint64_t)a15 secret:(id)a16 error:(id *)a17
{
  _BOOL4 v18;
  _BOOL4 v20;
  id v30;
  double v31;
  double v32;
  void *v33;
  float v34;
  float v35;
  unint64_t v36;
  _BOOL4 v37;
  unint64_t v38;
  _BOOL4 v39;
  CRXFAppClipCode *v40;
  CRXFAppClipCode *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v18 = a10;
  v20 = a5;
  v30 = a16;
  v33 = v30;
  if (a7 <= 0.0)
  {
    v34 = a7;
  }
  else
  {
    a8 = (a8 + 90) % 0xB4;
    v34 = -a7;
  }
  if (a7 > 0.0)
    a6 = a6 + a7;
  if (a12 <= 0.0)
  {
    v35 = a12;
  }
  else
  {
    a11 = a11 + a12;
    v35 = -a12;
  }
  if (a12 > 0.0)
    a13 = (a13 + 90) % 0xB4;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "crxu_randomDataWithLength:", 10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = 0;
  v54 = 0;
  v51 = 0;
  v52 = 0;
  if (!v20)
  {
    v37 = 1;
    if (v18)
      goto LABEL_18;
LABEL_22:
    v39 = 1;
    goto LABEL_23;
  }
  *(float *)&v31 = a6;
  *(float *)&v32 = v34;
  v36 = -[CRXFAppClipCodeTranscoder encodeSphere:cylinder:axis:toRXID:axisID:](self, "encodeSphere:cylinder:axis:toRXID:axisID:", a8, &v54, &v52, v31, v32);
  v37 = v36 == 0;
  if (a17 && v36)
  {
    -[CRXFAppClipCodeTranscoder errorForStatus:leftLens:](self, "errorForStatus:leftLens:", v36, 1);
    v37 = 0;
    *a17 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v18)
    goto LABEL_22;
LABEL_18:
  *(float *)&v31 = a11;
  *(float *)&v32 = v35;
  v38 = -[CRXFAppClipCodeTranscoder encodeSphere:cylinder:axis:toRXID:axisID:](self, "encodeSphere:cylinder:axis:toRXID:axisID:", a13, &v53, &v51, v31, v32);
  v39 = v38 == 0;
  if (a17 && v38)
  {
    -[CRXFAppClipCodeTranscoder errorForStatus:leftLens:](self, "errorForStatus:leftLens:", v38, 0);
    v40 = 0;
    *a17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
LABEL_23:
  if (v37 && v39)
  {
    v41 = [CRXFAppClipCode alloc];
    *(float *)&v42 = a6;
    *(float *)&v43 = v34;
    *(float *)&v44 = a6;
    *(float *)&v45 = v34;
    *(float *)&v46 = a9;
    *(float *)&v47 = v35;
    *(float *)&v48 = a11;
    *(float *)&v49 = a11;
    v40 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:](v41, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:", a3, a4, a7 > 0.0, a12 > 0.0, v54, v54, v42, v43, v44, v45, v46, v48, v47,
            v49,
            v52,
            a8,
            a8,
            0,
            v53,
            v53,
            __PAIR64__(LODWORD(a14), LODWORD(v35)),
            v51,
            a13,
            a13,
            0,
            a15,
            v33);
  }
  else
  {
    v40 = 0;
  }
LABEL_26:

  return v40;
}

- (id)mergeLeftAppClipCode:(id)a3 withRightAppClipCode:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CRXFAppClipCode *v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int v60;
  CRXFAppClipCode *v61;
  uint64_t v62;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "version");
  if (v9 != objc_msgSend(v8, "version"))
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = MEMORY[0x24BDBD1B8];
      v12 = 22;
      v13 = 436;
      goto LABEL_8;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "rightRXID") && !objc_msgSend(v8, "leftRXID"))
  {
    v15 = objc_msgSend(v7, "lensType");
    if (v15 == objc_msgSend(v8, "lensType"))
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "crxu_randomDataWithLength:", 10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = [CRXFAppClipCode alloc];
      v59 = objc_msgSend(v7, "version");
      v62 = objc_msgSend(v7, "lensType");
      v60 = objc_msgSend(v7, "cylLeftSignFlipped");
      v58 = objc_msgSend(v7, "cylRightSignFlipped");
      v57 = objc_msgSend(v7, "leftRXID");
      v56 = objc_msgSend(v7, "leftCalibrationRXID");
      objc_msgSend(v7, "leftDisplaySphere");
      v55 = v17;
      objc_msgSend(v7, "leftDisplayCylinder");
      v54 = v18;
      objc_msgSend(v7, "leftCalibrationSphere");
      v20 = v19;
      objc_msgSend(v7, "leftCalibrationCylinder");
      v22 = v21;
      objc_msgSend(v7, "leftAddVR");
      v24 = v23;
      v53 = objc_msgSend(v7, "leftAxisID");
      v52 = objc_msgSend(v7, "leftDisplayAxis");
      v25 = objc_msgSend(v7, "leftCalibrationAxis");
      v26 = objc_msgSend(v7, "leftClamping");
      v27 = objc_msgSend(v8, "rightRXID");
      v28 = objc_msgSend(v8, "rightCalibrationRXID");
      objc_msgSend(v8, "rightDisplaySphere");
      v30 = v29;
      objc_msgSend(v8, "rightDisplayCylinder");
      v32 = v31;
      objc_msgSend(v7, "rightCalibrationSphere");
      v34 = v33;
      objc_msgSend(v7, "rightCalibrationCylinder");
      v36 = v35;
      objc_msgSend(v8, "rightAddVR");
      v38 = v37;
      v39 = objc_msgSend(v8, "rightAxisID");
      v40 = objc_msgSend(v8, "rightDisplayAxis");
      v41 = objc_msgSend(v8, "rightCalibrationAxis");
      v42 = objc_msgSend(v8, "rightClamping");
      LODWORD(v44) = v54;
      LODWORD(v43) = v55;
      LODWORD(v45) = v20;
      LODWORD(v46) = v22;
      LODWORD(v47) = v24;
      LODWORD(v48) = v30;
      LODWORD(v49) = v32;
      LODWORD(v50) = v34;
      v14 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:](v61, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:", v59, v62, v60, v58, v57, v56, v43, v44, v45, v46, v47, v48, v49,
              v50,
              v53,
              v52,
              v25,
              v26,
              v27,
              v28,
              __PAIR64__(v38, v36),
              v39,
              v40,
              v41,
              v42,
              0,
              v16);

      goto LABEL_14;
    }
    if (a5)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = MEMORY[0x24BDBD1B8];
      v12 = 31;
      v13 = 450;
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (!a5)
    goto LABEL_13;
  v10 = (void *)MEMORY[0x24BDD1540];
  v11 = MEMORY[0x24BDBD1B8];
  v12 = 5;
  v13 = 443;
LABEL_8:
  objc_msgSend(v10, "crxf_errorWithCode:file:line:userInfo:", v12, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v13, v11);
  v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v14;
}

- (float)vRxFromAddValue:(float)a3 andSphereValue:(float)a4
{
  return roundf((float)((float)(a3 + a4) / (float)((float)((float)(a3 + a4) * 0.003) + 1.0)) * 4.0) * 0.25;
}

- (unint64_t)decodeCalibrationRXID:(unint64_t *)a3 calibrationSphere:(float *)a4 calibrationCylinder:(float *)a5 calibrationAxis:(unint64_t *)a6 addVR:(float *)a7 clampingStatus:(unint64_t *)a8 displaySphere:(float *)a9 displayCylinder:(float *)a10 displayAxis:(unint64_t *)a11 fromRXID:(unint64_t)a12 RXOffsetID:(unint64_t)a13 cylinderSignFlipped:(BOOL)a14 axisID:(unint64_t)a15 allowUnsupportedRX:(BOOL)a16
{
  float *v16;
  unint64_t *v17;
  float *v18;
  float *v19;
  unint64_t *v20;
  unint64_t v22;
  _BOOL4 v23;
  unint64_t v24;
  NSObject *v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  double v38;
  double v39;
  NSObject *log;
  unint64_t v41;
  unint64_t v42;
  float v43;
  unint64_t *v44;
  uint64_t v45;
  NSObject *v47;
  NSObject *v48;
  uint64_t v50;
  unint64_t v51;
  _BYTE buf[12];
  __int16 v53;
  int v54;
  uint64_t v55;

  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v22 = a15;
  v55 = *MEMORY[0x24BDAC8D0];
  v50 = 0;
  v51 = a12;
  if (a8)
    *a8 = 0;
  v23 = a14;
  if (a12 == 1023)
  {
    if (a16)
    {
      v24 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:].cold.1();
      v24 = 8;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calib"
                           "rationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID"
                           ":cylinderSignFlipped:axisID:allowUnsupportedRX:]";
      v53 = 1024;
      v54 = 541;
      _os_log_impl(&dword_239FC4000, log, OS_LOG_TYPE_INFO, "%s @%d: rxID is out of range, allow unsupported RX", buf, 0x12u);
    }
    goto LABEL_19;
  }
  v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibra"
                         "tionAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cyl"
                         "inderSignFlipped:axisID:allowUnsupportedRX:]";
    v53 = 1024;
    v54 = 543;
    _os_log_impl(&dword_239FC4000, v30, OS_LOG_TYPE_INFO, "%s @%d: rxID is in range", buf, 0x12u);
  }
  v24 = -[CRXFAppClipCodeTranscoder lookUpSphereValue:cylinderValue:forRXID:](self, "lookUpSphereValue:cylinderValue:forRXID:", (char *)&v50 + 4, &v50, a12);
  v23 = a14;
  v16 = a7;
  v17 = a6;
  v22 = a15;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  if (!v24)
  {
    v33 = *((float *)&v50 + 1);
    v34 = *(float *)&v50;
    if (a13)
    {
      v35 = (float)a13 * 0.25;
      *(float *)&v31 = v35;
      LODWORD(v32) = HIDWORD(v50);
      -[CRXFAppClipCodeTranscoder vRxFromAddValue:andSphereValue:](self, "vRxFromAddValue:andSphereValue:", v31, v32);
      v37 = v36;
      *((float *)&v50 + 1) = v36;
      LODWORD(v38) = v50;
      *(float *)&v39 = v37;
      if (-[CRXFAppClipCodeTranscoder lookupBestValidRXID:andSphere:matchingCylinder:nearSphere:](self, "lookupBestValidRXID:andSphere:matchingCylinder:nearSphere:", &v51, (char *)&v50 + 4, v38, v39))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:].cold.3();
        v24 = 32;
LABEL_30:
        v44 = a8;
        if (!a8)
          goto LABEL_33;
        v45 = 3;
        goto LABEL_32;
      }
      if (v37 == *((float *)&v50 + 1))
      {
        v24 = 0;
      }
      else
      {
        v47 = self->_log;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:c"
                               "alibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RX"
                               "OffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]";
          v53 = 1024;
          v54 = 572;
          _os_log_impl(&dword_239FC4000, v47, OS_LOG_TYPE_INFO, "%s @%d: AddVR clamped successfully!", buf, 0x12u);
        }
        v24 = 0;
        v44 = a8;
        if (a8)
        {
          v45 = 2;
LABEL_32:
          *v44 = v45;
        }
      }
    }
    else
    {
      LODWORD(v32) = HIDWORD(v50);
      LODWORD(v31) = v50;
      if (-[CRXFAppClipCodeTranscoder lookupBestValidRXID:andSphere:matchingCylinder:nearSphere:](self, "lookupBestValidRXID:andSphere:matchingCylinder:nearSphere:", &v51, (char *)&v50 + 4, v31, v32))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:].cold.2();
        v35 = 0.0;
        v24 = 8;
        goto LABEL_30;
      }
      if (v33 == *((float *)&v50 + 1))
      {
        v24 = 0;
        v35 = 0.0;
      }
      else
      {
        v48 = self->_log;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:c"
                               "alibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RX"
                               "OffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]";
          v53 = 1024;
          v54 = 589;
          _os_log_impl(&dword_239FC4000, v48, OS_LOG_TYPE_INFO, "%s @%d: RX clamped successfully!", buf, 0x12u);
        }
        v24 = 0;
        v35 = 0.0;
        v44 = a8;
        if (a8)
        {
          v45 = 1;
          goto LABEL_32;
        }
      }
    }
LABEL_33:
    if (a14)
    {
      v43 = -v34;
      v33 = v33 + v34;
      *(_QWORD *)buf = 0;
      v41 = -[CRXFAppClipCodeTranscoder lookUpAxisValue:forAxisID:](self, "lookUpAxisValue:forAxisID:", buf, a15);
      v34 = -v34;
      if (!v41)
        goto LABEL_24;
    }
    else
    {
      *(_QWORD *)buf = 0;
      v41 = -[CRXFAppClipCodeTranscoder lookUpAxisValue:forAxisID:](self, "lookUpAxisValue:forAxisID:", buf, a15);
      if (!v41)
        goto LABEL_37;
    }
LABEL_21:
    v42 = 0;
    v24 |= v41;
    if (!v20)
      goto LABEL_39;
LABEL_38:
    *v20 = v51;
    goto LABEL_39;
  }
LABEL_19:
  *(_QWORD *)buf = 0;
  v41 = -[CRXFAppClipCodeTranscoder lookUpAxisValue:forAxisID:](self, "lookUpAxisValue:forAxisID:", buf, v22);
  if (v41)
  {
    v33 = 0.0;
    v34 = 0.0;
    v35 = 0.0;
    goto LABEL_21;
  }
  v35 = 0.0;
  v43 = 0.0;
  v33 = 0.0;
  v34 = 0.0;
  if (!v23)
  {
LABEL_37:
    v42 = *(_QWORD *)buf;
    if (!v20)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_24:
  v42 = (*(_QWORD *)buf + 90) % 0xB4uLL;
  v34 = v43;
  if (v20)
    goto LABEL_38;
LABEL_39:
  if (v19)
    *v19 = *((float *)&v50 + 1);
  if (v18)
    *(_DWORD *)v18 = v50;
  if (a9)
    *a9 = v33;
  if (a10)
    *a10 = v34;
  if (a11)
    *a11 = v42;
  if (v17)
    *v17 = *(_QWORD *)buf;
  if (v16)
    *v16 = v35;
  return v24;
}

- (unint64_t)encodeSphere:(float)a3 cylinder:(float)a4 axis:(unint64_t)a5 toRXID:(unint64_t *)a6 axisID:(unint64_t *)a7
{
  unint64_t v11;
  unint64_t v12;

  if (!a6)
  {
    v11 = 0;
    if (!a7)
      return v11;
    goto LABEL_7;
  }
  v11 = -[CRXFAppClipCodeTranscoder lookUpRXID:forSphereValue:cylinderValue:](self, "lookUpRXID:forSphereValue:cylinderValue:", a6);
  if (v11)
    *a6 = 0;
  if (a7)
  {
LABEL_7:
    v12 = -[CRXFAppClipCodeTranscoder lookUpAxisID:forAxisValue:](self, "lookUpAxisID:forAxisValue:", a7, a5);
    if (v12)
    {
      *a7 = 0;
      v11 |= v12;
    }
  }
  return v11;
}

- (id)errorForStatus:(unint64_t)a3 leftLens:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  __CFString **v8;
  void *v9;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = kCRXFErrorKeyLeftLensDecodeStatus;
  if (!v4)
    v8 = kCRXFErrorKeyRightLensDecodeStatus;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *v8);

  objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 706, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)lookUpAxisID:(unint64_t *)a3 forAxisValue:(unint64_t)a4
{
  unint64_t result;
  unint64_t v5;

  if (a4 > 0xB4)
    return 4;
  result = 0;
  v5 = (a4 + 2) >> 2;
  if (a4 >= 0xB2)
    v5 -= 45;
  *a3 = rxid_axis_table[v5];
  return result;
}

- (unint64_t)lookUpAxisValue:(unint64_t *)a3 forAxisID:(unint64_t)a4
{
  int *v5;
  int *v6;
  unint64_t result;
  int __key;

  __key = a4;
  v5 = (int *)bsearch(&__key, &rxid_axis_lookup_table, 0x2DuLL, 8uLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v5)
    return 16;
  v6 = v5;
  result = 0;
  *a3 = 4 * v6[1];
  return result;
}

- (unint64_t)lookUpRXID:(unint64_t *)a3 forSphereValue:(float)a4 cylinderValue:(float)a5
{
  int *v7;
  int *v8;
  int *v9;
  unint64_t result;
  int __key;

  __key = (int)(float)(a4 * 100.0);
  v7 = (int *)bsearch(&__key, &rxid_sph_table, 0x49uLL, 0xCuLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v7)
    return 1;
  __key = (int)(float)(a5 * 100.0);
  v8 = (int *)bsearch(&__key, (char *)&rxid_cyl_table + 8 * v7[1], v7[2], 8uLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v8)
    return 2;
  v9 = v8;
  result = 0;
  *a3 = v9[1];
  return result;
}

- (unint64_t)lookUpSphereValue:(float *)a3 cylinderValue:(float *)a4 forRXID:(unint64_t)a5
{
  int *v7;
  int *v8;
  unint64_t result;
  int __key;

  __key = a5;
  v7 = (int *)bsearch(&__key, &rxid_sph_cyl_lookup_table, 0x451uLL, 0xCuLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v7)
    return 8;
  v8 = v7;
  result = 0;
  *a3 = (float)v8[1] / 100.0;
  *a4 = (float)v8[2] / 100.0;
  return result;
}

- (unint64_t)lookupBestValidRXID:(unint64_t *)a3 andSphere:(float *)a4 matchingCylinder:(float)a5 nearSphere:(float)a6
{
  uint64_t v6;
  int v7;
  int *v9;
  int v10;

  v6 = 0;
  v7 = (int)(float)(a6 * 100.0);
  while (valid_cyl_sph_range_table[v6] != (int)(float)(a5 * 100.0))
  {
    v6 += 3;
    if (v6 == 57)
      return 2;
  }
  v9 = &valid_cyl_sph_range_table[v6];
  v10 = valid_cyl_sph_range_table[v6 + 1];
  if (v10 <= v7)
  {
    v10 = v9[2];
    if (v10 >= v7)
      v10 = (int)(float)(a6 * 100.0);
  }
  *a4 = (float)v10 / 100.0;
  return -[CRXFAppClipCodeTranscoder lookUpRXID:forSphereValue:cylinderValue:](self, "lookUpRXID:forSphereValue:cylinderValue:", a3);
}

- (id)decodeAppClipCodeV1FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "bitCount") == 128)
  {
    v42 = 0;
    v43 = 0;
    v40 = 0;
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "skipBits:", 4)
      && objc_msgSend(v8, "skipBits:", 12)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v43, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v41, 6)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v42, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v40, 6)
      && (objc_msgSend(v8, "readData:bitWidth:", v9, 80) & 1) != 0)
    {
      v38 = 0;
      v39 = 0;
      v36 = 0;
      v37 = 0;
      v34 = 0;
      v35 = 0;
      if (v43)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        v10 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", 0, 0, 0, 0, 0, &v39, (char *)&v37 + 4, &v37, &v35, v43, 0, v18, v41, v19);
      }
      else
      {
        v10 = 0;
      }
      if (v42)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        v12 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", 0, 0, 0, 0, 0, &v38, (char *)&v36 + 4, &v36, &v34, v42, 0, v18, v40, v19);
      }
      else
      {
        v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV1FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_250B03BA8;
        v30 = HIDWORD(v37);
        v31 = v37;
        v22 = v43;
        v23 = v41;
        v24 = v35;
        v25 = v39;
        v32 = HIDWORD(v36);
        v33 = v36;
        v26 = v42;
        v27 = v40;
        v28 = v34;
        v29 = v38;
        v21 = v9;
        +[CRXFAppClipCode appClipCodeWithBlock:](CRXFAppClipCode, "appClipCodeWithBlock:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        goto LABEL_27;
      }
      if (a5)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v44[0] = CFSTR("leftLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v14;
        v44[1] = CFSTR("rightLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 894, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_27:

        goto LABEL_24;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 843, MEMORY[0x24BDBD1B8]);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    v11 = 0;
    goto LABEL_24;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 827, MEMORY[0x24BDBD1B8]);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_25:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV1FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "setVersion:", 1);
  objc_msgSend(v11, "setLeftRXID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v11, "setLeftCalibrationRXID:", *(_QWORD *)(a1 + 40));
  LODWORD(v3) = *(_DWORD *)(a1 + 104);
  objc_msgSend(v11, "setLeftDisplaySphere:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 108);
  objc_msgSend(v11, "setLeftDisplayCylinder:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 104);
  objc_msgSend(v11, "setLeftCalibrationSphere:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 108);
  objc_msgSend(v11, "setLeftCalibrationCylinder:", v6);
  objc_msgSend(v11, "setLeftAxisID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v11, "setLeftDisplayAxis:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v11, "setLeftCalibrationAxis:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v11, "setLeftClamping:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v11, "setRightRXID:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v11, "setRightCalibrationRXID:", *(_QWORD *)(a1 + 72));
  LODWORD(v7) = *(_DWORD *)(a1 + 112);
  objc_msgSend(v11, "setRightDisplaySphere:", v7);
  LODWORD(v8) = *(_DWORD *)(a1 + 116);
  objc_msgSend(v11, "setRightDisplayCylinder:", v8);
  LODWORD(v9) = *(_DWORD *)(a1 + 112);
  objc_msgSend(v11, "setRightCalibrationSphere:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 116);
  objc_msgSend(v11, "setRightCalibrationCylinder:", v10);
  objc_msgSend(v11, "setRightAxisID:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v11, "setRightDisplayAxis:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v11, "setRightCalibrationAxis:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v11, "setRightClamping:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v11, "setSecret:", *(_QWORD *)(a1 + 32));

}

- (BOOL)encodeAppClipCodeV1:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "version"), 4)
    && objc_msgSend(v8, "skipBits:", 12)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftAxisID"), 6)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightAxisID"), 6))
  {
    objc_msgSend(v7, "secret");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "writeData:bitWidth:", v9, 80);

  }
  else
  {
    v10 = 0;
  }
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 4, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 936, MEMORY[0x24BDBD1B8]);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)decodeAppClipCodeV2FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "bitCount") == 128)
  {
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v44 = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "skipBits:", 4)
      && objc_msgSend(v8, "skipBits:", 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v44, 4)
      && objc_msgSend(v8, "skipBits:", 6)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v48, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v46, 6)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v47, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v45, 6)
      && (objc_msgSend(v8, "readData:bitWidth:", v9, 80) & 1) != 0)
    {
      v42 = 0;
      v43 = 0;
      v40 = 0;
      v41 = 0;
      v39 = 0;
      v38 = 0;
      v37 = 0;
      v35 = 0;
      v36 = 0;
      if (v48)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        v10 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v43, 0, 0, 0, 0, &v41, (char *)&v39 + 4, &v39, &v36, v48, 0, v18, v46, v19);
      }
      else
      {
        v10 = 0;
      }
      if (v47)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        v12 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v42, 0, 0, 0, 0, &v40, &v38, &v37, &v35, v47, 0, v18, v45, v19);
      }
      else
      {
        v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV2FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_250B03BD0;
        v31 = HIDWORD(v39);
        v32 = v39;
        v22 = v48;
        v23 = v46;
        v24 = v36;
        v25 = v41;
        v33 = v38;
        v34 = v37;
        v26 = v47;
        v27 = v45;
        v28 = v35;
        v29 = v40;
        v30 = v44;
        v21 = v9;
        +[CRXFAppClipCode appClipCodeWithBlock:](CRXFAppClipCode, "appClipCodeWithBlock:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        goto LABEL_29;
      }
      if (a5)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v49[0] = CFSTR("leftLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v14;
        v49[1] = CFSTR("rightLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1039, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_29:

        goto LABEL_26;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 987, MEMORY[0x24BDBD1B8]);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    v11 = 0;
    goto LABEL_26;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 968, MEMORY[0x24BDBD1B8]);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_27:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV2FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "setVersion:", 2);
  objc_msgSend(v11, "setLeftRXID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v11, "setLeftCalibrationRXID:", *(_QWORD *)(a1 + 40));
  LODWORD(v3) = *(_DWORD *)(a1 + 112);
  objc_msgSend(v11, "setLeftDisplaySphere:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 116);
  objc_msgSend(v11, "setLeftDisplayCylinder:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 112);
  objc_msgSend(v11, "setLeftCalibrationSphere:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 116);
  objc_msgSend(v11, "setLeftCalibrationCylinder:", v6);
  objc_msgSend(v11, "setLeftAxisID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v11, "setLeftDisplayAxis:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v11, "setLeftCalibrationAxis:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v11, "setLeftClamping:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v11, "setRightRXID:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v11, "setRightCalibrationRXID:", *(_QWORD *)(a1 + 72));
  LODWORD(v7) = *(_DWORD *)(a1 + 120);
  objc_msgSend(v11, "setRightDisplaySphere:", v7);
  LODWORD(v8) = *(_DWORD *)(a1 + 124);
  objc_msgSend(v11, "setRightDisplayCylinder:", v8);
  LODWORD(v9) = *(_DWORD *)(a1 + 120);
  objc_msgSend(v11, "setRightCalibrationSphere:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 124);
  objc_msgSend(v11, "setRightCalibrationCylinder:", v10);
  objc_msgSend(v11, "setRightAxisID:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v11, "setRightDisplayAxis:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v11, "setRightCalibrationAxis:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v11, "setRightClamping:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v11, "setIdentifyingColor:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v11, "setSecret:", *(_QWORD *)(a1 + 32));

}

- (BOOL)encodeAppClipCodeV2:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "version"), 4)
    && objc_msgSend(v8, "skipBits:", 2)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "identifyingColor"), 4)
    && objc_msgSend(v8, "skipBits:", 6)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftAxisID"), 6)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightAxisID"), 6))
  {
    objc_msgSend(v7, "secret");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "writeData:bitWidth:", v9, 80);

  }
  else
  {
    v10 = 0;
  }
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 4, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1084, MEMORY[0x24BDBD1B8]);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)decodeAppClipCodeV3FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int16 v67;
  _QWORD v68[2];
  _QWORD v69[3];

  v69[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "bitCount") == 128)
  {
    v67 = 0;
    v65 = 0;
    v66 = 0;
    v63 = 0;
    v64 = 0;
    v61 = 0;
    v62 = 0;
    v60 = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "skipBits:", 4)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v62, 4)
      && objc_msgSend(v8, "readBool:", (char *)&v67 + 1)
      && objc_msgSend(v8, "readBool:", &v67)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v61, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v60, 2)
      && objc_msgSend(v8, "skipBits:", 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v66, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v64, 6)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v65, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v63, 6)
      && (objc_msgSend(v8, "readData:bitWidth:", v9, 80) & 1) != 0)
    {
      v58 = 0;
      v59 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v51 = 0;
      v49 = 0;
      v50 = 0;
      v47 = 0;
      v48 = 0;
      if (v66)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = HIBYTE(v67);
        v10 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v48, (char *)&v55 + 4, &v55, &v50, (char *)&v53 + 4, &v59, (char *)&v57 + 4, &v57, &v52, v66, v61, v18, v64, v19);
      }
      else
      {
        v10 = 0;
      }
      if (v65)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = v67;
        v12 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v47, (char *)&v54 + 4, &v54, &v49, &v53, &v58, (char *)&v56 + 4, &v56, &v51, v65, v60, v18, v63, v19);
      }
      else
      {
        v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV3FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_250B03BF8;
        v45 = HIBYTE(v67);
        v46 = v67;
        v22 = v66;
        v23 = v48;
        v35 = HIDWORD(v57);
        v36 = v57;
        v37 = HIDWORD(v55);
        v38 = v55;
        v24 = v64;
        v25 = v52;
        v26 = v50;
        v27 = v59;
        v28 = v65;
        v29 = v47;
        v39 = HIDWORD(v53);
        v40 = HIDWORD(v56);
        v41 = v56;
        v42 = HIDWORD(v54);
        v43 = v54;
        v44 = v53;
        v30 = v63;
        v31 = v51;
        v32 = v49;
        v33 = v58;
        v34 = v62;
        v21 = v9;
        +[CRXFAppClipCode appClipCodeWithBlock:](CRXFAppClipCode, "appClipCodeWithBlock:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        goto LABEL_32;
      }
      if (a5)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v68[0] = CFSTR("leftLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v14;
        v68[1] = CFSTR("rightLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1195, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_32:

        goto LABEL_29;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1139, MEMORY[0x24BDBD1B8]);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    v11 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1115, MEMORY[0x24BDBD1B8]);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_30:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV3FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "setVersion:", 3);
  objc_msgSend(v13, "setCylLeftSignFlipped:", *(unsigned __int8 *)(a1 + 184));
  objc_msgSend(v13, "setCylRightSignFlipped:", *(unsigned __int8 *)(a1 + 185));
  objc_msgSend(v13, "setLeftRXID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v13, "setLeftCalibrationRXID:", *(_QWORD *)(a1 + 48));
  LODWORD(v3) = *(_DWORD *)(a1 + 144);
  objc_msgSend(v13, "setLeftDisplaySphere:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 148);
  objc_msgSend(v13, "setLeftDisplayCylinder:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 152);
  objc_msgSend(v13, "setLeftCalibrationSphere:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 156);
  objc_msgSend(v13, "setLeftCalibrationCylinder:", v6);
  LODWORD(v7) = *(_DWORD *)(a1 + 160);
  objc_msgSend(v13, "setLeftAddVR:", v7);
  objc_msgSend(v13, "setLeftAxisID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v13, "setLeftDisplayAxis:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v13, "setLeftCalibrationAxis:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v13, "setLeftClamping:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v13, "setRightRXID:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v13, "setRightCalibrationRXID:", *(_QWORD *)(a1 + 96));
  LODWORD(v8) = *(_DWORD *)(a1 + 164);
  objc_msgSend(v13, "setRightDisplaySphere:", v8);
  LODWORD(v9) = *(_DWORD *)(a1 + 168);
  objc_msgSend(v13, "setRightDisplayCylinder:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 172);
  objc_msgSend(v13, "setRightCalibrationSphere:", v10);
  LODWORD(v11) = *(_DWORD *)(a1 + 176);
  objc_msgSend(v13, "setRightCalibrationCylinder:", v11);
  LODWORD(v12) = *(_DWORD *)(a1 + 180);
  objc_msgSend(v13, "setRightAddVR:", v12);
  objc_msgSend(v13, "setRightAxisID:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v13, "setRightDisplayAxis:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v13, "setRightCalibrationAxis:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v13, "setRightClamping:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v13, "setIdentifyingColor:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v13, "setSecret:", *(_QWORD *)(a1 + 32));

}

- (BOOL)encodeAppClipCodeV3:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = 0;
  objc_msgSend(v8, "leftAddVR");
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v19))
  {
    if (!a5)
      goto LABEL_23;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = MEMORY[0x24BDBD1B8];
    v15 = 15;
    v16 = 1241;
LABEL_22:
    objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", v15, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v16, v14);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v8, "rightAddVR");
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v18))
  {
    if (!a5)
      goto LABEL_23;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = MEMORY[0x24BDBD1B8];
    v15 = 16;
    v16 = 1251;
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "version"), 4)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "identifyingColor"), 4)
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylLeftSignFlipped"))
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylRightSignFlipped"))
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", v19, 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", v18, 2)
    || !objc_msgSend(v9, "skipBits:", 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightAxisID"), 6)
    || (objc_msgSend(v8, "secret"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "writeData:bitWidth:", v10, 80),
        v10,
        (v11 & 1) == 0))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = MEMORY[0x24BDBD1B8];
      v15 = 4;
      v16 = 1269;
      goto LABEL_22;
    }
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  v12 = 1;
LABEL_24:

  return v12;
}

- (id)decodeAppClipCodeV4FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int16 v69;
  _QWORD v70[2];
  _QWORD v71[3];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "bitCount") == 128)
  {
    v69 = 0;
    v67 = 0;
    v68 = 0;
    v65 = 0;
    v66 = 0;
    v63 = 0;
    v64 = 0;
    v62 = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    if (objc_msgSend(v8, "skipBits:", 4)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v64, 4)
      && objc_msgSend(v8, "readBool:", (char *)&v69 + 1)
      && objc_msgSend(v8, "readBool:", &v69)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v63, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v62, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v61, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v68, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v66, 6)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v67, 10)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v65, 6)
      && (objc_msgSend(v8, "readData:bitWidth:", v9, 80) & 1) != 0)
    {
      v59 = 0;
      v60 = 0;
      v57 = 0;
      v58 = 0;
      v55 = 0;
      v56 = 0;
      v53 = 0;
      v54 = 0;
      v51 = 0;
      v52 = 0;
      v49 = 0;
      v50 = 0;
      v48 = 0;
      if (v68)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = HIBYTE(v69);
        v10 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v49, (char *)&v56 + 4, &v56, &v51, (char *)&v54 + 4, &v60, (char *)&v58 + 4, &v58, &v53, v68, v63, v18, v66, v19);
      }
      else
      {
        v10 = 0;
      }
      if (v67)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = v69;
        v12 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v48, (char *)&v55 + 4, &v55, &v50, &v54, &v59, (char *)&v57 + 4, &v57, &v52, v67, v62, v18, v65, v19);
      }
      else
      {
        v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV4FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_250B03C20;
        v46 = HIBYTE(v69);
        v47 = v69;
        v22 = v61;
        v23 = v68;
        v36 = HIDWORD(v58);
        v37 = v58;
        v38 = HIDWORD(v56);
        v39 = v56;
        v24 = v49;
        v25 = v66;
        v26 = v53;
        v27 = v51;
        v28 = v60;
        v29 = v67;
        v40 = HIDWORD(v54);
        v41 = HIDWORD(v57);
        v42 = v57;
        v43 = HIDWORD(v55);
        v44 = v55;
        v45 = v54;
        v30 = v48;
        v31 = v65;
        v32 = v52;
        v33 = v50;
        v34 = v59;
        v35 = v64;
        v21 = v9;
        +[CRXFAppClipCode appClipCodeWithBlock:](CRXFAppClipCode, "appClipCodeWithBlock:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        goto LABEL_32;
      }
      if (a5)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v70[0] = CFSTR("leftLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v14;
        v70[1] = CFSTR("rightLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v71[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1365, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_32:

        goto LABEL_29;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1309, MEMORY[0x24BDBD1B8]);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    v11 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1284, MEMORY[0x24BDBD1B8]);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_30:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV4FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "setVersion:", 4);
  objc_msgSend(v13, "setLensType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v13, "setCylLeftSignFlipped:", *(unsigned __int8 *)(a1 + 192));
  objc_msgSend(v13, "setCylRightSignFlipped:", *(unsigned __int8 *)(a1 + 193));
  objc_msgSend(v13, "setLeftRXID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v13, "setLeftCalibrationRXID:", *(_QWORD *)(a1 + 56));
  LODWORD(v3) = *(_DWORD *)(a1 + 152);
  objc_msgSend(v13, "setLeftDisplaySphere:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 156);
  objc_msgSend(v13, "setLeftDisplayCylinder:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 160);
  objc_msgSend(v13, "setLeftCalibrationSphere:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 164);
  objc_msgSend(v13, "setLeftCalibrationCylinder:", v6);
  LODWORD(v7) = *(_DWORD *)(a1 + 168);
  objc_msgSend(v13, "setLeftAddVR:", v7);
  objc_msgSend(v13, "setLeftAxisID:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v13, "setLeftDisplayAxis:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v13, "setLeftCalibrationAxis:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v13, "setLeftClamping:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v13, "setRightRXID:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v13, "setRightCalibrationRXID:", *(_QWORD *)(a1 + 104));
  LODWORD(v8) = *(_DWORD *)(a1 + 172);
  objc_msgSend(v13, "setRightDisplaySphere:", v8);
  LODWORD(v9) = *(_DWORD *)(a1 + 176);
  objc_msgSend(v13, "setRightDisplayCylinder:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 180);
  objc_msgSend(v13, "setRightCalibrationSphere:", v10);
  LODWORD(v11) = *(_DWORD *)(a1 + 184);
  objc_msgSend(v13, "setRightCalibrationCylinder:", v11);
  LODWORD(v12) = *(_DWORD *)(a1 + 188);
  objc_msgSend(v13, "setRightAddVR:", v12);
  objc_msgSend(v13, "setRightAxisID:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v13, "setRightDisplayAxis:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v13, "setRightCalibrationAxis:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v13, "setRightClamping:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v13, "setIdentifyingColor:", *(_QWORD *)(a1 + 144));
  objc_msgSend(v13, "setSecret:", *(_QWORD *)(a1 + 32));

}

- (BOOL)encodeAppClipCodeV4:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = 0;
  objc_msgSend(v8, "leftAddVR");
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v19))
  {
    if (!a5)
      goto LABEL_23;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = MEMORY[0x24BDBD1B8];
    v15 = 15;
    v16 = 1412;
LABEL_22:
    objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", v15, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v16, v14);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v8, "rightAddVR");
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v18))
  {
    if (!a5)
      goto LABEL_23;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = MEMORY[0x24BDBD1B8];
    v15 = 16;
    v16 = 1422;
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "version"), 4)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "identifyingColor"), 4)
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylLeftSignFlipped"))
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylRightSignFlipped"))
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", v19, 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", v18, 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "lensType"), 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightAxisID"), 6)
    || (objc_msgSend(v8, "secret"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "writeData:bitWidth:", v10, 80),
        v10,
        (v11 & 1) == 0))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = MEMORY[0x24BDBD1B8];
      v15 = 4;
      v16 = 1441;
      goto LABEL_22;
    }
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  v12 = 1;
LABEL_24:

  return v12;
}

- (id)decodeAppClipCodeV5FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int16 v67;
  _QWORD v68[2];
  _QWORD v69[3];

  v69[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "bitCount") == 128)
  {
    v67 = 0;
    v65 = 0;
    v66 = 0;
    v63 = 0;
    v64 = 0;
    v61 = 0;
    v62 = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    if (objc_msgSend(v8, "skipBits:", 4)
      && objc_msgSend(v8, "readBool:", (char *)&v67 + 1)
      && objc_msgSend(v8, "readBool:", &v67)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v62, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v61, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v60, 2)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v66, 11)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v64, 6)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v65, 11)
      && objc_msgSend(v8, "readUInteger:bitWidth:", &v63, 6)
      && objc_msgSend(v8, "skipBits:", 2)
      && (objc_msgSend(v8, "readData:bitWidth:", v9, 80) & 1) != 0)
    {
      v58 = 0;
      v59 = 0;
      v56 = 0;
      v57 = 0;
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v51 = 0;
      v49 = 0;
      v50 = 0;
      v47 = 0;
      v48 = 0;
      if (v66)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = HIBYTE(v67);
        v10 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v48, (char *)&v55 + 4, &v55, &v50, (char *)&v53 + 4, &v59, (char *)&v57 + 4, &v57, &v52, v66, v62, v18, v64, v19);
      }
      else
      {
        v10 = 0;
      }
      if (v65)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = v67;
        v12 = -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:](self, "decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:", &v47, (char *)&v54 + 4, &v54, &v49, &v53, &v58, (char *)&v56 + 4, &v56, &v51, v65, v61, v18, v63, v19);
      }
      else
      {
        v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV5FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_250B03BF8;
        v45 = HIBYTE(v67);
        v46 = v67;
        v22 = v60;
        v23 = v66;
        v35 = HIDWORD(v57);
        v36 = v57;
        v37 = HIDWORD(v55);
        v38 = v55;
        v24 = v48;
        v25 = v64;
        v26 = v52;
        v27 = v50;
        v28 = v59;
        v29 = v65;
        v39 = HIDWORD(v53);
        v40 = HIDWORD(v56);
        v41 = v56;
        v42 = HIDWORD(v54);
        v43 = v54;
        v44 = v53;
        v30 = v47;
        v31 = v63;
        v32 = v51;
        v33 = v49;
        v34 = v58;
        v21 = v9;
        +[CRXFAppClipCode appClipCodeWithBlock:](CRXFAppClipCode, "appClipCodeWithBlock:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        goto LABEL_32;
      }
      if (a5)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v68[0] = CFSTR("leftLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v14;
        v68[1] = CFSTR("rightLensDecodeStatus");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1555, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
LABEL_32:

        goto LABEL_29;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1499, MEMORY[0x24BDBD1B8]);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    v11 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1474, MEMORY[0x24BDBD1B8]);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_30:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV5FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "setVersion:", 5);
  objc_msgSend(v13, "setLensType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v13, "setCylLeftSignFlipped:", *(unsigned __int8 *)(a1 + 184));
  objc_msgSend(v13, "setCylRightSignFlipped:", *(unsigned __int8 *)(a1 + 185));
  objc_msgSend(v13, "setLeftRXID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v13, "setLeftCalibrationRXID:", *(_QWORD *)(a1 + 56));
  LODWORD(v3) = *(_DWORD *)(a1 + 144);
  objc_msgSend(v13, "setLeftDisplaySphere:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 148);
  objc_msgSend(v13, "setLeftDisplayCylinder:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 152);
  objc_msgSend(v13, "setLeftCalibrationSphere:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 156);
  objc_msgSend(v13, "setLeftCalibrationCylinder:", v6);
  LODWORD(v7) = *(_DWORD *)(a1 + 160);
  objc_msgSend(v13, "setLeftAddVR:", v7);
  objc_msgSend(v13, "setLeftAxisID:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v13, "setLeftDisplayAxis:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v13, "setLeftCalibrationAxis:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v13, "setLeftClamping:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v13, "setRightRXID:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v13, "setRightCalibrationRXID:", *(_QWORD *)(a1 + 104));
  LODWORD(v8) = *(_DWORD *)(a1 + 164);
  objc_msgSend(v13, "setRightDisplaySphere:", v8);
  LODWORD(v9) = *(_DWORD *)(a1 + 168);
  objc_msgSend(v13, "setRightDisplayCylinder:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 172);
  objc_msgSend(v13, "setRightCalibrationSphere:", v10);
  LODWORD(v11) = *(_DWORD *)(a1 + 176);
  objc_msgSend(v13, "setRightCalibrationCylinder:", v11);
  LODWORD(v12) = *(_DWORD *)(a1 + 180);
  objc_msgSend(v13, "setRightAddVR:", v12);
  objc_msgSend(v13, "setRightAxisID:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v13, "setRightDisplayAxis:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v13, "setRightCalibrationAxis:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v13, "setRightClamping:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v13, "setIdentifyingColor:", 0);
  objc_msgSend(v13, "setSecret:", *(_QWORD *)(a1 + 32));

}

- (BOOL)encodeAppClipCodeV5:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v18 = 0;
  v19 = 0;
  objc_msgSend(v8, "leftAddVR");
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v19))
  {
    if (!a5)
      goto LABEL_23;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = MEMORY[0x24BDBD1B8];
    v15 = 15;
    v16 = 1603;
LABEL_22:
    objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", v15, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v16, v14);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v8, "rightAddVR");
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v18))
  {
    if (!a5)
      goto LABEL_23;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = MEMORY[0x24BDBD1B8];
    v15 = 16;
    v16 = 1613;
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "version"), 4)
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylLeftSignFlipped"))
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylRightSignFlipped"))
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", v19, 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", v18, 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "lensType"), 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftRXID"), 11)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightRXID"), 11)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightAxisID"), 6)
    || !objc_msgSend(v9, "skipBits:", 2)
    || (objc_msgSend(v8, "secret"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "writeData:bitWidth:", v10, 80),
        v10,
        (v11 & 1) == 0))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = MEMORY[0x24BDBD1B8];
      v15 = 4;
      v16 = 1631;
      goto LABEL_22;
    }
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  v12 = 1;
LABEL_24:

  return v12;
}

- (BOOL)getQuarterDiopterValueForIndex:(unint64_t)a3 minValue:(float)a4 maxValue:(float)a5 value:(float *)a6
{
  float v6;

  v6 = a4 + (float)((float)a3 * 0.25);
  if (v6 <= a5)
    *a6 = v6;
  return v6 <= a5;
}

- (BOOL)getIndexForQuarterDiopterValue:(float)a3 minValue:(float)a4 maxValue:(float)a5 index:(unint64_t *)a6
{
  _BOOL4 v6;

  v6 = a3 <= a5 && a3 >= a4;
  if (v6)
    *a6 = ((unint64_t)(float)((float)(a3 - a4) * 100.0) + 24) / 0x19;
  return v6;
}

- (id)derivePayloadWithSoftwareBitsZeroedFromPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;

  v4 = a3;
  v8 = 0;
  -[CRXFAppClipCodeTranscoder decodeAppClipCodeFromData:allowUnsupportedRX:error:](self, "decodeAppClipCodeFromData:allowUnsupportedRX:error:", v4, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AxisToIDMap, 0);
  objc_storeStrong((id *)&self->_IDToAxisMap, 0);
  objc_storeStrong((id *)&self->_RXToIDMap, 0);
  objc_storeStrong((id *)&self->_IDToRXMap, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_239FC4000, v0, v1, "%s @%d: rxID is out of range", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_239FC4000, v0, v1, "%s @%d: Failed to find any valid Rx without VRX", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_239FC4000, v0, v1, "%s @%d: Failed to find any valid VRx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
