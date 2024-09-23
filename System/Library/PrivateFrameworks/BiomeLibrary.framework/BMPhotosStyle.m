@implementation BMPhotosStyle

- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 version:(id)a15 sceneForAsset:(id)a16 subjectForAsset:(id)a17
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMPhotosStyle *v26;
  double v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  id v36;
  id v38;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v46 = a3;
  v36 = a4;
  v45 = a4;
  v38 = a6;
  v44 = a6;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v43 = a16;
  v42 = a17;
  v47.receiver = self;
  v47.super_class = (Class)BMPhotosStyle;
  v26 = -[BMEventBase init](&v47, sel_init);
  if (v26)
  {
    v26->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v26->_identifier, a3);
    objc_storeStrong((id *)&v26->_styleChoice, v36);
    v26->_styleSelectionType = a5;
    objc_storeStrong((id *)&v26->_sliderValues, v38);
    v26->_userLibrarySize = a7;
    v26->_userLibraryAgeInDays = a8;
    if (v19)
    {
      v26->_hasBrightnessValue = 1;
      objc_msgSend(v19, "doubleValue");
    }
    else
    {
      v26->_hasBrightnessValue = 0;
      v27 = -1.0;
    }
    v26->_brightnessValue = v27;
    if (v20)
    {
      v26->_hasStillImageProcessingFlags = 1;
      v28 = objc_msgSend(v20, "unsignedIntValue");
    }
    else
    {
      v28 = 0;
      v26->_hasStillImageProcessingFlags = 0;
    }
    v26->_stillImageProcessingFlags = v28;
    if (v21)
    {
      v26->_hasCamera = 1;
      v29 = objc_msgSend(v21, "unsignedIntValue");
    }
    else
    {
      v29 = 0;
      v26->_hasCamera = 0;
    }
    v26->_camera = v29;
    if (v22)
    {
      v26->_hasStillImageCaptureType = 1;
      v30 = objc_msgSend(v22, "unsignedIntValue");
    }
    else
    {
      v30 = 0;
      v26->_hasStillImageCaptureType = 0;
    }
    v26->_stillImageCaptureType = v30;
    if (v23)
    {
      v26->_hasFaceCount = 1;
      v31 = objc_msgSend(v23, "unsignedIntValue");
    }
    else
    {
      v31 = 0;
      v26->_hasFaceCount = 0;
    }
    v26->_faceCount = v31;
    if (v24)
    {
      v26->_hasPetCount = 1;
      v32 = objc_msgSend(v24, "unsignedIntValue");
    }
    else
    {
      v32 = 0;
      v26->_hasPetCount = 0;
    }
    v26->_petCount = v32;
    if (v25)
    {
      v26->_hasVersion = 1;
      v33 = objc_msgSend(v25, "unsignedIntValue");
    }
    else
    {
      v33 = 0;
      v26->_hasVersion = 0;
    }
    v26->_version = v33;
    objc_storeStrong((id *)&v26->_sceneForAsset, a16);
    objc_storeStrong((id *)&v26->_subjectForAsset, a17);
  }

  return v26;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPhotosStyle identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle styleChoice](self, "styleChoice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosStyleStyleSelectionTypeAsString(-[BMPhotosStyle styleSelectionType](self, "styleSelectionType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle sliderValues](self, "sliderValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosStyleLibrarySizeTypeAsString(-[BMPhotosStyle userLibrarySize](self, "userLibrarySize"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosStyleUserLibraryAgeInDaysTypeAsString(-[BMPhotosStyle userLibraryAgeInDays](self, "userLibraryAgeInDays"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPhotosStyle brightnessValue](self, "brightnessValue");
  objc_msgSend(v3, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle stillImageProcessingFlags](self, "stillImageProcessingFlags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle camera](self, "camera"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle stillImageCaptureType](self, "stillImageCaptureType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle faceCount](self, "faceCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle petCount](self, "petCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle version](self, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle sceneForAsset](self, "sceneForAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle subjectForAsset](self, "subjectForAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMPhotosStyle with identifier: %@, styleChoice: %@, styleSelectionType: %@, sliderValues: %@, userLibrarySize: %@, userLibraryAgeInDays: %@, brightnessValue: %@, stillImageProcessingFlags: %@, camera: %@, stillImageCaptureType: %@, faceCount: %@, petCount: %@, version: %@, sceneForAsset: %@, subjectForAsset: %@"), v17, v21, v20, v13, v16, v15, v14, v12, v4, v11, v5, v6, v7, v8, v9);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPhotosStyle *v5;
  void *v6;
  double v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  uint64_t v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  NSArray *sliderValues;
  int v93;
  BMPhotosStyle *v94;
  objc_super v96;

  v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)BMPhotosStyle;
  v5 = -[BMEventBase init](&v96, sel_init);
  if (!v5)
    goto LABEL_149;
  v6 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v10])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        v19 = v13++ >= 9;
        if (v19)
        {
          v14 = 0;
          v20 = *v10;
          v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = *v10;
      v21 = v4[v20];
      if (v4[v20])
        v14 = 0;
LABEL_15:
      if (v21 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_95;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_95;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v8;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v19 = v26++ >= 9;
                if (v19)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v27) = 0;
LABEL_99:
          if (v27 >= 3)
            LODWORD(v27) = 0;
          v87 = 36;
          goto LABEL_126;
        case 4u:
          v57 = (void *)MEMORY[0x1E0CB37E8];
          v58 = *v8;
          v59 = *(_QWORD *)&v4[v58];
          if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(_QWORD *)&v4[*v9])
          {
            LODWORD(v7) = *(_DWORD *)(*(_QWORD *)&v4[*v11] + v59);
            *(_QWORD *)&v4[v58] = v59 + 4;
          }
          else
          {
            v4[v20] = 1;
            LODWORD(v7) = 0;
          }
          objc_msgSend(v57, "numberWithFloat:", v7);
          v89 = objc_claimAutoreleasedReturnValue();
          if (!v89)
            goto LABEL_151;
          v90 = (void *)v89;
          objc_msgSend(v6, "addObject:", v89);

          continue;
        case 5u:
          v60 = 0;
          v61 = 0;
          v27 = 0;
          while (2)
          {
            v62 = *v8;
            v63 = *(_QWORD *)&v4[v62];
            v64 = v63 + 1;
            if (v63 == -1 || v64 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v63);
              *(_QWORD *)&v4[v62] = v64;
              v27 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                v19 = v61++ >= 9;
                if (v19)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v27) = 0;
LABEL_123:
          if (v27 >= 6)
            LODWORD(v27) = 0;
          v87 = 40;
          goto LABEL_126;
        case 6u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          while (2)
          {
            v34 = *v8;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v19 = v33++ >= 9;
                if (v19)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v27) = 0;
LABEL_105:
          if (v27 >= 6)
            LODWORD(v27) = 0;
          v87 = 44;
LABEL_126:
          *(_DWORD *)((char *)&v5->super.super.isa + v87) = v27;
          continue;
        case 7u:
          v5->_hasBrightnessValue = 1;
          v66 = *v8;
          v67 = *(_QWORD *)&v4[v66];
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v7 = *(double *)(*(_QWORD *)&v4[*v11] + v67);
            *(_QWORD *)&v4[v66] = v67 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v7 = 0.0;
          }
          v5->_brightnessValue = v7;
          continue;
        case 8u:
          v68 = 0;
          v69 = 0;
          v40 = 0;
          v5->_hasStillImageProcessingFlags = 1;
          while (2)
          {
            v70 = *v8;
            v71 = *(_QWORD *)&v4[v70];
            v72 = v71 + 1;
            if (v71 == -1 || v72 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v71);
              *(_QWORD *)&v4[v70] = v72;
              v40 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                v19 = v69++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v40) = 0;
LABEL_130:
          v88 = 48;
          goto LABEL_139;
        case 9u:
          v74 = 0;
          v75 = 0;
          v40 = 0;
          v5->_hasCamera = 1;
          while (2)
          {
            v76 = *v8;
            v77 = *(_QWORD *)&v4[v76];
            v78 = v77 + 1;
            if (v77 == -1 || v78 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v77);
              *(_QWORD *)&v4[v76] = v78;
              v40 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                v19 = v75++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v40) = 0;
LABEL_134:
          v88 = 52;
          goto LABEL_139;
        case 0xAu:
          v80 = 0;
          v81 = 0;
          v40 = 0;
          v5->_hasStillImageCaptureType = 1;
          while (2)
          {
            v82 = *v8;
            v83 = *(_QWORD *)&v4[v82];
            v84 = v83 + 1;
            if (v83 == -1 || v84 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v83);
              *(_QWORD *)&v4[v82] = v84;
              v40 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                v19 = v81++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v40) = 0;
LABEL_138:
          v88 = 56;
          goto LABEL_139;
        case 0xBu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasFaceCount = 1;
          while (2)
          {
            v41 = *v8;
            v42 = *(_QWORD *)&v4[v41];
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v42);
              *(_QWORD *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                v19 = v39++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v40) = 0;
LABEL_111:
          v88 = 60;
          goto LABEL_139;
        case 0xCu:
          v45 = 0;
          v46 = 0;
          v40 = 0;
          v5->_hasPetCount = 1;
          while (2)
          {
            v47 = *v8;
            v48 = *(_QWORD *)&v4[v47];
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v48);
              *(_QWORD *)&v4[v47] = v49;
              v40 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                v19 = v46++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            LODWORD(v40) = 0;
LABEL_115:
          v88 = 64;
          goto LABEL_139;
        case 0x13u:
          v51 = 0;
          v52 = 0;
          v40 = 0;
          v5->_hasVersion = 1;
          break;
        case 0x14u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_95;
        case 0x15u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
LABEL_95:
          v86 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_151:

          goto LABEL_148;
      }
      while (1)
      {
        v53 = *v8;
        v54 = *(_QWORD *)&v4[v53];
        v55 = v54 + 1;
        if (v54 == -1 || v55 > *(_QWORD *)&v4[*v9])
          break;
        v56 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v54);
        *(_QWORD *)&v4[v53] = v55;
        v40 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0)
          goto LABEL_117;
        v51 += 7;
        v19 = v52++ >= 9;
        if (v19)
        {
          LODWORD(v40) = 0;
          goto LABEL_119;
        }
      }
      v4[*v10] = 1;
LABEL_117:
      if (v4[*v10])
        LODWORD(v40) = 0;
LABEL_119:
      v88 = 68;
LABEL_139:
      *(_DWORD *)((char *)&v5->super.super.isa + v88) = v40;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v91 = objc_msgSend(v6, "copy");
  sliderValues = v5->_sliderValues;
  v5->_sliderValues = (NSArray *)v91;

  v93 = v4[*v10];
  if (v93)
LABEL_148:
    v94 = 0;
  else
LABEL_149:
    v94 = v5;

  return v94;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_styleChoice)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sliderValues;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "floatValue", (_QWORD)v10);
        PBDataWriterWriteFloatField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasBrightnessValue)
    PBDataWriterWriteDoubleField();
  if (self->_hasStillImageProcessingFlags)
    PBDataWriterWriteUint32Field();
  if (self->_hasCamera)
    PBDataWriterWriteUint32Field();
  if (self->_hasStillImageCaptureType)
    PBDataWriterWriteUint32Field();
  if (self->_hasFaceCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasPetCount)
    PBDataWriterWriteUint32Field();
  if (self->_hasVersion)
    PBDataWriterWriteUint32Field();
  if (self->_sceneForAsset)
    PBDataWriterWriteStringField();
  if (self->_subjectForAsset)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPhotosStyle writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPhotosStyle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  BMPhotosStyle *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id *v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  uint64_t v111;
  id v112;
  id v113;
  uint64_t v114;
  id v115;
  void *v116;
  void *v117;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  id *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  id *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  _BYTE v185[128];
  uint64_t v186;
  void *v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD v193[3];

  v193[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v13 = *MEMORY[0x1E0D025B8];
        v192 = *MEMORY[0x1E0CB2D50];
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v193[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, &v192, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, v7);
        v6 = 0;
        v16 = 0;
        *a4 = v15;
        goto LABEL_158;
      }
      v6 = 0;
      v16 = 0;
      goto LABEL_159;
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("styleChoice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v190 = *MEMORY[0x1E0CB2D50];
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("styleChoice"));
        v191 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2);
        v14 = 0;
        v16 = 0;
        *a4 = v20;
        v10 = (void *)v19;
        goto LABEL_157;
      }
      v14 = 0;
      v16 = 0;
      goto LABEL_158;
    }
    v150 = v7;
  }
  else
  {
    v150 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("styleSelectionType"));
  v8 = objc_claimAutoreleasedReturnValue();
  v149 = v7;
  v151 = (void *)v8;
  if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v46 = *MEMORY[0x1E0D025B8];
          v188 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("styleSelectionType"));
          v189 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2);
          v10 = 0;
          v16 = 0;
          *a4 = v47;
          v14 = v150;
          goto LABEL_155;
        }
        v10 = 0;
        v16 = 0;
        v14 = v150;
        goto LABEL_157;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosStyleStyleSelectionTypeFromString(v9));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v11;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sliderValues"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  v147 = v6;
  v148 = v10;
  if (v23)
  {

    v21 = 0;
  }
  else if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v16 = 0;
        v14 = v150;
        goto LABEL_156;
      }
      v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v42 = *MEMORY[0x1E0D025B8];
      v186 = *MEMORY[0x1E0CB2D50];
      v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("sliderValues"));
      v187 = v154;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v30);
      v16 = 0;
      *a4 = v43;
LABEL_47:
      v14 = v150;
      goto LABEL_154;
    }
  }
  v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v21 = v21;
  v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v155, v185, 16);
  if (!v24)
    goto LABEL_36;
  v25 = v24;
  v26 = *(_QWORD *)v156;
  while (2)
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v156 != v26)
        objc_enumerationMutation(v21);
      v28 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = a4;
        if (a4)
        {
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = *MEMORY[0x1E0D025B8];
          v183 = *MEMORY[0x1E0CB2D50];
          v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("sliderValues"));
          v184 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v32;
          v37 = v33;
          v29 = (void *)v34;
LABEL_43:
          v40 = (id *)v35;
          v6 = v147;
          v14 = v150;
          v16 = 0;
          *v31 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2);
          v30 = v21;
          goto LABEL_152;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v181 = *MEMORY[0x1E0CB2D50];
          v31 = a4;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sliderValues"));
          v182 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v38;
          v37 = v39;
          goto LABEL_43;
        }
LABEL_44:
        v16 = 0;
        v30 = v21;
        v6 = v147;
        goto LABEL_47;
      }
      objc_msgSend(v154, "addObject:", v28);
    }
    v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v155, v185, 16);
    if (v25)
      continue;
    break;
  }
LABEL_36:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userLibrarySize"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v30 = 0;
LABEL_58:
    v6 = v147;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userLibraryAgeInDays"));
    v48 = objc_claimAutoreleasedReturnValue();
    v144 = (void *)v48;
    if (v48)
    {
      v49 = (void *)v48;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v132 = v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v142 = v49;
          goto LABEL_65;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosStyleUserLibraryAgeInDaysTypeFromString(v49));
          v142 = (id *)objc_claimAutoreleasedReturnValue();
          goto LABEL_65;
        }
        v40 = a4;
        if (a4)
        {
          v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v92 = *MEMORY[0x1E0D025B8];
          v177 = *MEMORY[0x1E0CB2D50];
          v143 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userLibraryAgeInDays"));
          v178 = v143;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v92, 2, v146);
          v40 = 0;
          v16 = 0;
          *a4 = v93;
          v14 = v150;
          v30 = v132;
          goto LABEL_150;
        }
        v16 = 0;
        v14 = v150;
        goto LABEL_151;
      }
    }
    v142 = 0;
LABEL_65:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("brightnessValue"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v143 = v146;
        goto LABEL_68;
      }
      if (!a4)
      {
        v143 = 0;
        v16 = 0;
        v14 = v150;
        v40 = v142;
        goto LABEL_150;
      }
      v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v133 = v30;
      v64 = v29;
      v65 = *MEMORY[0x1E0D025B8];
      v175 = *MEMORY[0x1E0CB2D50];
      v141 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("brightnessValue"));
      v176 = v141;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v65;
      v29 = v64;
      v30 = v133;
      v140 = (void *)v66;
      v68 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v67, 2);
      v16 = 0;
      v143 = 0;
      *a4 = v68;
      v6 = v147;
    }
    else
    {
      v143 = 0;
LABEL_68:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stillImageProcessingFlags"));
      v50 = objc_claimAutoreleasedReturnValue();
      v140 = (void *)v50;
      if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v141 = 0;
LABEL_71:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("camera"));
        v52 = objc_claimAutoreleasedReturnValue();
        v130 = (void *)v52;
        if (!v52 || (v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v131 = 0;
LABEL_74:
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stillImageCaptureType"));
          v54 = objc_claimAutoreleasedReturnValue();
          v128 = (void *)v54;
          if (!v54 || (v55 = (void *)v54, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v129 = 0;
LABEL_77:
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceCount"));
            v56 = objc_claimAutoreleasedReturnValue();
            v126 = (void *)v56;
            if (!v56 || (v57 = (void *)v56, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v127 = 0;
LABEL_80:
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("petCount"));
              v58 = objc_claimAutoreleasedReturnValue();
              v122 = (void *)v58;
              if (!v58 || (v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v125 = 0;
LABEL_83:
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
                v60 = objc_claimAutoreleasedReturnValue();
                v124 = v29;
                v121 = (void *)v60;
                if (!v60 || (v61 = (void *)v60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v123 = 0;
                  goto LABEL_86;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v123 = v61;
LABEL_86:
                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneForAsset"));
                  v62 = (id)objc_claimAutoreleasedReturnValue();
                  v119 = v62;
                  if (v62)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v62 = 0;
                      goto LABEL_112;
                    }
                    v136 = v30;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v62 = v62;
                      goto LABEL_112;
                    }
                    if (a4)
                    {
                      v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v111 = *MEMORY[0x1E0D025B8];
                      v161 = *MEMORY[0x1E0CB2D50];
                      v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sceneForAsset"));
                      v162 = v82;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v112 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v111, 2, v81);
                      v16 = 0;
                      v120 = 0;
                      *a4 = v112;
                      goto LABEL_140;
                    }
                    v120 = 0;
                    v16 = 0;
                    v14 = v150;
LABEL_142:
                    v40 = v142;
                    v108 = v119;
LABEL_143:

                    v29 = v124;
LABEL_144:

LABEL_145:
LABEL_146:

LABEL_147:
LABEL_148:

LABEL_149:
LABEL_150:

LABEL_151:
LABEL_152:

                    goto LABEL_153;
                  }
LABEL_112:
                  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subjectForAsset"));
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v120 = v62;
                  if (!v81 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v82 = 0;
                    goto LABEL_115;
                  }
                  v136 = v30;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v82 = v81;
LABEL_115:
                    v16 = objc_retain(-[BMPhotosStyle initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:](self, "initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:", v147, v150, objc_msgSend(v148, "intValue"), v154, objc_msgSend(v30, "intValue"), objc_msgSend(v142, "intValue"), v143, v141, v131, v129, v127, v125, v123, v62,
                              v82));
                    self = v16;
                  }
                  else
                  {
                    if (a4)
                    {
                      v113 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v114 = *MEMORY[0x1E0D025B8];
                      v159 = *MEMORY[0x1E0CB2D50];
                      v115 = v4;
                      v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subjectForAsset"));
                      v160 = v116;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      *a4 = (id)objc_msgSend(v113, "initWithDomain:code:userInfo:", v114, 2, v117);

                      v4 = v115;
                    }
                    v82 = 0;
                    v16 = 0;
LABEL_140:
                    v30 = v136;
                  }

                  v14 = v150;
                  goto LABEL_142;
                }
                if (a4)
                {
                  v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v107 = *MEMORY[0x1E0D025B8];
                  v163 = *MEMORY[0x1E0CB2D50];
                  v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("version"));
                  v164 = v120;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  v109 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v107, 2, v108);
                  v16 = 0;
                  v123 = 0;
                  *a4 = v109;
                  v14 = v150;
                  v40 = v142;
                  goto LABEL_143;
                }
                v123 = 0;
                v16 = 0;
LABEL_169:
                v14 = v150;
                v40 = v142;
                goto LABEL_144;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v125 = v59;
                goto LABEL_83;
              }
              if (a4)
              {
                v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v139 = v30;
                v101 = v29;
                v102 = *MEMORY[0x1E0D025B8];
                v165 = *MEMORY[0x1E0CB2D50];
                v123 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("petCount"));
                v166 = v123;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
                v103 = objc_claimAutoreleasedReturnValue();
                v104 = v102;
                v29 = v101;
                v30 = v139;
                v121 = (void *)v103;
                v105 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v104, 2);
                v16 = 0;
                v125 = 0;
                *a4 = v105;
                v6 = v147;
                goto LABEL_169;
              }
              v125 = 0;
              v16 = 0;
LABEL_167:
              v14 = v150;
              v40 = v142;
              goto LABEL_145;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v127 = v57;
              goto LABEL_80;
            }
            if (a4)
            {
              v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v138 = v30;
              v95 = v29;
              v96 = *MEMORY[0x1E0D025B8];
              v167 = *MEMORY[0x1E0CB2D50];
              v125 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("faceCount"));
              v168 = v125;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
              v97 = objc_claimAutoreleasedReturnValue();
              v98 = v96;
              v29 = v95;
              v30 = v138;
              v122 = (void *)v97;
              v99 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v98, 2);
              v16 = 0;
              v127 = 0;
              *a4 = v99;
              v6 = v147;
              goto LABEL_167;
            }
            v127 = 0;
            v16 = 0;
LABEL_165:
            v14 = v150;
            v40 = v142;
            goto LABEL_146;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v129 = v55;
            goto LABEL_77;
          }
          if (a4)
          {
            v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v137 = v30;
            v84 = v29;
            v85 = *MEMORY[0x1E0D025B8];
            v169 = *MEMORY[0x1E0CB2D50];
            v127 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stillImageCaptureType"));
            v170 = v127;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
            v86 = objc_claimAutoreleasedReturnValue();
            v87 = v85;
            v29 = v84;
            v30 = v137;
            v126 = (void *)v86;
            v88 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v87, 2);
            v16 = 0;
            v129 = 0;
            *a4 = v88;
            v6 = v147;
            goto LABEL_165;
          }
          v129 = 0;
          v16 = 0;
LABEL_161:
          v14 = v150;
          v40 = v142;
          goto LABEL_147;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v131 = v53;
          goto LABEL_74;
        }
        if (a4)
        {
          v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v135 = v30;
          v76 = v29;
          v77 = *MEMORY[0x1E0D025B8];
          v171 = *MEMORY[0x1E0CB2D50];
          v129 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("camera"));
          v172 = v129;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
          v78 = objc_claimAutoreleasedReturnValue();
          v79 = v77;
          v29 = v76;
          v30 = v135;
          v128 = (void *)v78;
          v80 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v79, 2);
          v16 = 0;
          v131 = 0;
          *a4 = v80;
          v6 = v147;
          goto LABEL_161;
        }
        v131 = 0;
        v16 = 0;
LABEL_136:
        v14 = v150;
        v40 = v142;
        goto LABEL_148;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v141 = v51;
        goto LABEL_71;
      }
      if (a4)
      {
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v134 = v30;
        v70 = v29;
        v71 = *MEMORY[0x1E0D025B8];
        v173 = *MEMORY[0x1E0CB2D50];
        v131 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stillImageProcessingFlags"));
        v174 = v131;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = v71;
        v29 = v70;
        v30 = v134;
        v130 = (void *)v72;
        v74 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v73, 2);
        v16 = 0;
        v141 = 0;
        *a4 = v74;
        v6 = v147;
        goto LABEL_136;
      }
      v141 = 0;
      v16 = 0;
    }
    v14 = v150;
    v40 = v142;
    goto LABEL_149;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v29;
LABEL_57:
    v30 = v44;
    goto LABEL_58;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosStyleLibrarySizeTypeFromString(v29));
    v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
  v30 = a4;
  if (a4)
  {
    v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v90 = *MEMORY[0x1E0D025B8];
    v179 = *MEMORY[0x1E0CB2D50];
    v40 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userLibrarySize"));
    v180 = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 2);
    v30 = 0;
    v6 = v147;
    v14 = v150;

    goto LABEL_152;
  }
  v16 = 0;
  v6 = v147;
  v14 = v150;
LABEL_153:

LABEL_154:
  v10 = v148;
LABEL_155:

LABEL_156:
  v7 = v149;
LABEL_157:

LABEL_158:
LABEL_159:

  return v16;
}

- (id)_sliderValuesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMPhotosStyle sliderValues](self, "sliderValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[15];
  _QWORD v54[17];

  v54[15] = *MEMORY[0x1E0C80C00];
  -[BMPhotosStyle identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle styleChoice](self, "styleChoice");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosStyle styleSelectionType](self, "styleSelectionType"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle _sliderValuesJSONArray](self, "_sliderValuesJSONArray");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosStyle userLibrarySize](self, "userLibrarySize"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosStyle userLibraryAgeInDays](self, "userLibraryAgeInDays"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!-[BMPhotosStyle hasBrightnessValue](self, "hasBrightnessValue")
    || (-[BMPhotosStyle brightnessValue](self, "brightnessValue"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMPhotosStyle brightnessValue](self, "brightnessValue");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPhotosStyle brightnessValue](self, "brightnessValue");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMPhotosStyle hasStillImageProcessingFlags](self, "hasStillImageProcessingFlags"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle stillImageProcessingFlags](self, "stillImageProcessingFlags"));
    v52 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  if (-[BMPhotosStyle hasCamera](self, "hasCamera"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle camera](self, "camera"));
    v51 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }
  if (-[BMPhotosStyle hasStillImageCaptureType](self, "hasStillImageCaptureType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle stillImageCaptureType](self, "stillImageCaptureType"));
    v50 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  if (-[BMPhotosStyle hasFaceCount](self, "hasFaceCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle faceCount](self, "faceCount"));
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  if (-[BMPhotosStyle hasPetCount](self, "hasPetCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle petCount](self, "petCount"));
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = 0;
  }
  if (-[BMPhotosStyle hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPhotosStyle version](self, "version"));
    v47 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v47 = 0;
  }
  -[BMPhotosStyle sceneForAsset](self, "sceneForAsset");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosStyle subjectForAsset](self, "subjectForAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("identifier");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v13;
  v54[0] = v13;
  v53[1] = CFSTR("styleChoice");
  v14 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v14;
  v54[1] = v14;
  v53[2] = CFSTR("styleSelectionType");
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v15;
  v54[2] = v15;
  v53[3] = CFSTR("sliderValues");
  v16 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v16;
  v54[3] = v16;
  v53[4] = CFSTR("userLibrarySize");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v17;
  v54[4] = v17;
  v53[5] = CFSTR("userLibraryAgeInDays");
  v18 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v18;
  v54[5] = v18;
  v53[6] = CFSTR("brightnessValue");
  v19 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v8;
  v44 = (void *)v7;
  v34 = (void *)v19;
  v54[6] = v19;
  v53[7] = CFSTR("stillImageProcessingFlags");
  v20 = (uint64_t)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v5;
  v54[7] = v20;
  v53[8] = CFSTR("camera");
  v21 = (uint64_t)v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v20;
  v54[8] = v21;
  v53[9] = CFSTR("stillImageCaptureType");
  v22 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v21;
  v54[9] = v22;
  v53[10] = CFSTR("faceCount");
  v23 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v21, v33, v34, v35, v36, v37, v38, v39, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v6;
  v24 = (void *)v3;
  v54[10] = v23;
  v53[11] = CFSTR("petCount");
  v25 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v4;
  v54[11] = v25;
  v53[12] = CFSTR("version");
  v27 = v47;
  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[12] = v27;
  v53[13] = CFSTR("sceneForAsset");
  v28 = v46;
  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[13] = v28;
  v53[14] = CFSTR("subjectForAsset");
  v29 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54[14] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 15, v31);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v46)
  if (!v47)

  if (!v48)
  if (!v49)

  if (!v50)
  if (!v51)

  if (!v52)
  if (v11)
  {
    if (v43)
      goto LABEL_71;
  }
  else
  {

    if (v43)
    {
LABEL_71:
      if (v44)
        goto LABEL_72;
      goto LABEL_79;
    }
  }

  if (v44)
  {
LABEL_72:
    if (v42)
      goto LABEL_73;
    goto LABEL_80;
  }
LABEL_79:

  if (v42)
  {
LABEL_73:
    if (v45)
      goto LABEL_74;
    goto LABEL_81;
  }
LABEL_80:

  if (v45)
  {
LABEL_74:
    if (v26)
      goto LABEL_75;
LABEL_82:

    if (v24)
      goto LABEL_76;
LABEL_83:

    goto LABEL_76;
  }
LABEL_81:

  if (!v26)
    goto LABEL_82;
LABEL_75:
  if (!v24)
    goto LABEL_83;
LABEL_76:

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPhotosStyle identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPhotosStyle identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_55;
    }
    -[BMPhotosStyle styleChoice](self, "styleChoice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleChoice");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPhotosStyle styleChoice](self, "styleChoice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "styleChoice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_55;
    }
    v19 = -[BMPhotosStyle styleSelectionType](self, "styleSelectionType");
    if (v19 == objc_msgSend(v5, "styleSelectionType"))
    {
      -[BMPhotosStyle sliderValues](self, "sliderValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sliderValues");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMPhotosStyle sliderValues](self, "sliderValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sliderValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_55;
      }
      v26 = -[BMPhotosStyle userLibrarySize](self, "userLibrarySize");
      if (v26 != objc_msgSend(v5, "userLibrarySize"))
        goto LABEL_55;
      v27 = -[BMPhotosStyle userLibraryAgeInDays](self, "userLibraryAgeInDays");
      if (v27 != objc_msgSend(v5, "userLibraryAgeInDays"))
        goto LABEL_55;
      if (-[BMPhotosStyle hasBrightnessValue](self, "hasBrightnessValue")
        || objc_msgSend(v5, "hasBrightnessValue"))
      {
        if (!-[BMPhotosStyle hasBrightnessValue](self, "hasBrightnessValue"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasBrightnessValue"))
          goto LABEL_55;
        -[BMPhotosStyle brightnessValue](self, "brightnessValue");
        v29 = v28;
        objc_msgSend(v5, "brightnessValue");
        if (v29 != v30)
          goto LABEL_55;
      }
      if (-[BMPhotosStyle hasStillImageProcessingFlags](self, "hasStillImageProcessingFlags")
        || objc_msgSend(v5, "hasStillImageProcessingFlags"))
      {
        if (!-[BMPhotosStyle hasStillImageProcessingFlags](self, "hasStillImageProcessingFlags"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasStillImageProcessingFlags"))
          goto LABEL_55;
        v31 = -[BMPhotosStyle stillImageProcessingFlags](self, "stillImageProcessingFlags");
        if (v31 != objc_msgSend(v5, "stillImageProcessingFlags"))
          goto LABEL_55;
      }
      if (-[BMPhotosStyle hasCamera](self, "hasCamera") || objc_msgSend(v5, "hasCamera"))
      {
        if (!-[BMPhotosStyle hasCamera](self, "hasCamera"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasCamera"))
          goto LABEL_55;
        v32 = -[BMPhotosStyle camera](self, "camera");
        if (v32 != objc_msgSend(v5, "camera"))
          goto LABEL_55;
      }
      if (-[BMPhotosStyle hasStillImageCaptureType](self, "hasStillImageCaptureType")
        || objc_msgSend(v5, "hasStillImageCaptureType"))
      {
        if (!-[BMPhotosStyle hasStillImageCaptureType](self, "hasStillImageCaptureType"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasStillImageCaptureType"))
          goto LABEL_55;
        v33 = -[BMPhotosStyle stillImageCaptureType](self, "stillImageCaptureType");
        if (v33 != objc_msgSend(v5, "stillImageCaptureType"))
          goto LABEL_55;
      }
      if (-[BMPhotosStyle hasFaceCount](self, "hasFaceCount") || objc_msgSend(v5, "hasFaceCount"))
      {
        if (!-[BMPhotosStyle hasFaceCount](self, "hasFaceCount"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasFaceCount"))
          goto LABEL_55;
        v34 = -[BMPhotosStyle faceCount](self, "faceCount");
        if (v34 != objc_msgSend(v5, "faceCount"))
          goto LABEL_55;
      }
      if (-[BMPhotosStyle hasPetCount](self, "hasPetCount") || objc_msgSend(v5, "hasPetCount"))
      {
        if (!-[BMPhotosStyle hasPetCount](self, "hasPetCount"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasPetCount"))
          goto LABEL_55;
        v35 = -[BMPhotosStyle petCount](self, "petCount");
        if (v35 != objc_msgSend(v5, "petCount"))
          goto LABEL_55;
      }
      if (-[BMPhotosStyle hasVersion](self, "hasVersion") || objc_msgSend(v5, "hasVersion"))
      {
        if (!-[BMPhotosStyle hasVersion](self, "hasVersion"))
          goto LABEL_55;
        if (!objc_msgSend(v5, "hasVersion"))
          goto LABEL_55;
        v36 = -[BMPhotosStyle version](self, "version");
        if (v36 != objc_msgSend(v5, "version"))
          goto LABEL_55;
      }
      -[BMPhotosStyle sceneForAsset](self, "sceneForAsset");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sceneForAsset");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v37 == (void *)v38)
      {

      }
      else
      {
        v39 = (void *)v38;
        -[BMPhotosStyle sceneForAsset](self, "sceneForAsset");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sceneForAsset");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqual:", v41);

        if (!v42)
          goto LABEL_55;
      }
      -[BMPhotosStyle subjectForAsset](self, "subjectForAsset");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subjectForAsset");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44 == v45)
      {
        v12 = 1;
      }
      else
      {
        -[BMPhotosStyle subjectForAsset](self, "subjectForAsset");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subjectForAsset");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v46, "isEqual:", v47);

      }
      goto LABEL_56;
    }
LABEL_55:
    v12 = 0;
LABEL_56:

    goto LABEL_57;
  }
  v12 = 0;
LABEL_57:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)styleChoice
{
  return self->_styleChoice;
}

- (int)styleSelectionType
{
  return self->_styleSelectionType;
}

- (NSArray)sliderValues
{
  return self->_sliderValues;
}

- (int)userLibrarySize
{
  return self->_userLibrarySize;
}

- (int)userLibraryAgeInDays
{
  return self->_userLibraryAgeInDays;
}

- (double)brightnessValue
{
  return self->_brightnessValue;
}

- (BOOL)hasBrightnessValue
{
  return self->_hasBrightnessValue;
}

- (void)setHasBrightnessValue:(BOOL)a3
{
  self->_hasBrightnessValue = a3;
}

- (unsigned)stillImageProcessingFlags
{
  return self->_stillImageProcessingFlags;
}

- (BOOL)hasStillImageProcessingFlags
{
  return self->_hasStillImageProcessingFlags;
}

- (void)setHasStillImageProcessingFlags:(BOOL)a3
{
  self->_hasStillImageProcessingFlags = a3;
}

- (unsigned)camera
{
  return self->_camera;
}

- (BOOL)hasCamera
{
  return self->_hasCamera;
}

- (void)setHasCamera:(BOOL)a3
{
  self->_hasCamera = a3;
}

- (unsigned)stillImageCaptureType
{
  return self->_stillImageCaptureType;
}

- (BOOL)hasStillImageCaptureType
{
  return self->_hasStillImageCaptureType;
}

- (void)setHasStillImageCaptureType:(BOOL)a3
{
  self->_hasStillImageCaptureType = a3;
}

- (unsigned)faceCount
{
  return self->_faceCount;
}

- (BOOL)hasFaceCount
{
  return self->_hasFaceCount;
}

- (void)setHasFaceCount:(BOOL)a3
{
  self->_hasFaceCount = a3;
}

- (unsigned)petCount
{
  return self->_petCount;
}

- (BOOL)hasPetCount
{
  return self->_hasPetCount;
}

- (void)setHasPetCount:(BOOL)a3
{
  self->_hasPetCount = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (NSString)sceneForAsset
{
  return self->_sceneForAsset;
}

- (NSString)subjectForAsset
{
  return self->_subjectForAsset;
}

- (double)faceSizeRatio
{
  return self->_faceSizeRatio;
}

- (BOOL)hasFaceSizeRatio
{
  return self->_hasFaceSizeRatio;
}

- (void)setHasFaceSizeRatio:(BOOL)a3
{
  self->_hasFaceSizeRatio = a3;
}

- (BOOL)isSunsetSunrise
{
  return self->_isSunsetSunrise;
}

- (BOOL)hasIsSunsetSunrise
{
  return self->_hasIsSunsetSunrise;
}

- (void)setHasIsSunsetSunrise:(BOOL)a3
{
  self->_hasIsSunsetSunrise = a3;
}

- (BOOL)isOutdoor
{
  return self->_isOutdoor;
}

- (BOOL)hasIsOutdoor
{
  return self->_hasIsOutdoor;
}

- (void)setHasIsOutdoor:(BOOL)a3
{
  self->_hasIsOutdoor = a3;
}

- (BOOL)isFood
{
  return self->_isFood;
}

- (BOOL)hasIsFood
{
  return self->_hasIsFood;
}

- (void)setHasIsFood:(BOOL)a3
{
  self->_hasIsFood = a3;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (BOOL)hasIsIndoor
{
  return self->_hasIsIndoor;
}

- (void)setHasIsIndoor:(BOOL)a3
{
  self->_hasIsIndoor = a3;
}

- (NSArray)salientScenes
{
  return self->_salientScenes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salientScenes, 0);
  objc_storeStrong((id *)&self->_subjectForAsset, 0);
  objc_storeStrong((id *)&self->_sceneForAsset, 0);
  objc_storeStrong((id *)&self->_sliderValues, 0);
  objc_storeStrong((id *)&self->_styleChoice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMPhotosStyle initByReadFrom:]([BMPhotosStyle alloc], "initByReadFrom:", v7);
    v4[8] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
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
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("styleChoice"), 2, 0, 2, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("styleSelectionType"), 0, 0, 3, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("sliderValues_json"), 5, 1, &__block_literal_global_98);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userLibrarySize"), 0, 0, 5, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userLibraryAgeInDays"), 0, 0, 6, 4, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("brightnessValue"), 1, 0, 7, 0, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stillImageProcessingFlags"), 0, 0, 8, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("camera"), 0, 0, 9, 4, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stillImageCaptureType"), 0, 0, 10, 4, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("faceCount"), 0, 0, 11, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("petCount"), 0, 0, 12, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("faceSizeRatio"), 1, 0, 13, 1, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSunsetSunrise"), 0, 0, 14, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isOutdoor"), 0, 0, 15, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFood"), 0, 0, 16, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isIndoor"), 0, 0, 17, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("salientScenes_json"), 5, 1, &__block_literal_global_99);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("version"), 0, 0, 19, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sceneForAsset"), 2, 0, 20, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subjectForAsset"), 2, 0, 21, 13, 0);
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v13;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v14;
  v25[14] = v4;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v7;
  v25[18] = v12;
  v25[19] = v8;
  v25[20] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D428;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v25[0] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("styleChoice"), 2, 13, 0);
  v25[1] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("styleSelectionType"), 3, 4, 0);
  v25[2] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sliderValues"), 4, 1, 0);
  v25[3] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userLibrarySize"), 5, 4, 0);
  v25[4] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userLibraryAgeInDays"), 6, 4, 0);
  v25[5] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("brightnessValue"), 7, 0, 0);
  v25[6] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stillImageProcessingFlags"), 8, 4, 0);
  v25[7] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("camera"), 9, 4, 0);
  v25[8] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stillImageCaptureType"), 10, 4, 0);
  v25[9] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("faceCount"), 11, 4, 0);
  v25[10] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("petCount"), 12, 4, 0);
  v25[11] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("faceSizeRatio"), 13, 1, 0);
  v25[12] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSunsetSunrise"), 14, 12, 0);
  v25[13] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isOutdoor"), 15, 12, 0);
  v25[14] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFood"), 16, 12, 0);
  v25[15] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isIndoor"), 17, 12, 0);
  v25[16] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("salientScenes"), 18, 4, 0);
  v25[17] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("version"), 19, 4, 0);
  v25[18] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sceneForAsset"), 20, 13, 0);
  v25[19] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subjectForAsset"), 21, 13, 0);
  v25[20] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __24__BMPhotosStyle_columns__block_invoke_2()
{
  return 0;
}

id __24__BMPhotosStyle_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sliderValuesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 faceSizeRatio:(id)a15 isSunsetSunrise:(id)a16 isOutdoor:(id)a17 isFood:(id)a18 isIndoor:(id)a19 salientScenes:(id)a20
{
  return -[BMPhotosStyle initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:](self, "initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:", a3, a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 faceSizeRatio:(id)a15 isSunsetSunrise:(id)a16 isOutdoor:(id)a17 isFood:(id)a18 isIndoor:(id)a19 salientScenes:(id)a20 version:(id)a21 sceneForAsset:(id)a22 subjectForAsset:(id)a23
{
  return -[BMPhotosStyle initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:](self, "initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:", a3, a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

@end
