@implementation BMCameraCaptureAutoFocusROI

- (BMCameraCaptureAutoFocusROI)initWithPortType:(id)a3 focusRegionType:(int)a4 topLeftCornerRow:(id)a5 topLeftCornerColumn:(id)a6 width:(id)a7 height:(id)a8 luxLevel:(id)a9 subjectDistance:(id)a10 clientApplicationIDType:(int)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BMCameraCaptureAutoFocusROI *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  float v31;
  double v32;
  objc_super v34;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v34.receiver = self;
  v34.super_class = (Class)BMCameraCaptureAutoFocusROI;
  v25 = -[BMEventBase init](&v34, sel_init);
  if (v25)
  {
    v25->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v25->_portType, a3);
    v25->_focusRegionType = a4;
    if (v19)
    {
      v25->_hasTopLeftCornerRow = 1;
      v26 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v26 = 0;
      v25->_hasTopLeftCornerRow = 0;
    }
    v25->_topLeftCornerRow = v26;
    if (v20)
    {
      v25->_hasTopLeftCornerColumn = 1;
      v27 = objc_msgSend(v20, "unsignedIntValue");
    }
    else
    {
      v27 = 0;
      v25->_hasTopLeftCornerColumn = 0;
    }
    v25->_topLeftCornerColumn = v27;
    if (v21)
    {
      v25->_hasWidth = 1;
      v28 = objc_msgSend(v21, "unsignedIntValue");
    }
    else
    {
      v28 = 0;
      v25->_hasWidth = 0;
    }
    v25->_width = v28;
    if (v22)
    {
      v25->_hasHeight = 1;
      v29 = objc_msgSend(v22, "unsignedIntValue");
    }
    else
    {
      v29 = 0;
      v25->_hasHeight = 0;
    }
    v25->_height = v29;
    if (v23)
    {
      v25->_hasLuxLevel = 1;
      v30 = objc_msgSend(v23, "unsignedIntValue");
    }
    else
    {
      v30 = 0;
      v25->_hasLuxLevel = 0;
    }
    v25->_luxLevel = v30;
    if (v24)
    {
      v25->_hasSubjectDistance = 1;
      objc_msgSend(v24, "floatValue");
      v32 = v31;
    }
    else
    {
      v25->_hasSubjectDistance = 0;
      v32 = -1.0;
    }
    v25->_subjectDistance = v32;
    v25->_clientApplicationIDType = a11;
  }

  return v25;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMCameraCaptureAutoFocusROI portType](self, "portType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMCameraCaptureAutoFocusROIFocusRegionTypeAsString(-[BMCameraCaptureAutoFocusROI focusRegionType](self, "focusRegionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerRow](self, "topLeftCornerRow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerColumn](self, "topLeftCornerColumn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI width](self, "width"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI height](self, "height"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI luxLevel](self, "luxLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMCameraCaptureAutoFocusROI subjectDistance](self, "subjectDistance");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BMCameraCaptureAutoFocusROIClientApplicationIDTypeAsString(-[BMCameraCaptureAutoFocusROI clientApplicationIDType](self, "clientApplicationIDType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMCameraCaptureAutoFocusROI with portType: %@, focusRegionType: %@, topLeftCornerRow: %@, topLeftCornerColumn: %@, width: %@, height: %@, luxLevel: %@, subjectDistance: %@, clientApplicationIDType: %@"), v4, v5, v6, v7, v8, v9, v10, v12, v13);

  return (NSString *)v14;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMCameraCaptureAutoFocusROI *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  NSString *portType;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  unint64_t v61;
  float v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  BMCameraCaptureAutoFocusROI *v71;
  objc_super v73;

  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BMCameraCaptureAutoFocusROI;
  v5 = -[BMEventBase init](&v73, sel_init);
  if (!v5)
    goto LABEL_114;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          portType = v5->_portType;
          v5->_portType = (NSString *)v20;

          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (1)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
              break;
            v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
            *(_QWORD *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0)
              goto LABEL_76;
            v22 += 7;
            v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_78;
            }
          }
          v4[*v8] = 1;
LABEL_76:
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_78:
          if (v24 >= 5)
            LODWORD(v24) = 0;
          v69 = 28;
          goto LABEL_108;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasTopLeftCornerRow = 1;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_84:
          v70 = 32;
          goto LABEL_101;
        case 4u:
          v36 = 0;
          v37 = 0;
          v31 = 0;
          v5->_hasTopLeftCornerColumn = 1;
          while (2)
          {
            v38 = *v6;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v31 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_88:
          v70 = 36;
          goto LABEL_101;
        case 5u:
          v42 = 0;
          v43 = 0;
          v31 = 0;
          v5->_hasWidth = 1;
          while (2)
          {
            v44 = *v6;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v31 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v17 = v43++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_92:
          v70 = 40;
          goto LABEL_101;
        case 6u:
          v48 = 0;
          v49 = 0;
          v31 = 0;
          v5->_hasHeight = 1;
          while (2)
          {
            v50 = *v6;
            v51 = *(_QWORD *)&v4[v50];
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
              *(_QWORD *)&v4[v50] = v52;
              v31 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                v17 = v49++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_96:
          v70 = 44;
          goto LABEL_101;
        case 7u:
          v54 = 0;
          v55 = 0;
          v31 = 0;
          v5->_hasLuxLevel = 1;
          while (2)
          {
            v56 = *v6;
            v57 = *(_QWORD *)&v4[v56];
            v58 = v57 + 1;
            if (v57 == -1 || v58 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v57);
              *(_QWORD *)&v4[v56] = v58;
              v31 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                v17 = v55++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_100:
          v70 = 48;
LABEL_101:
          *(_DWORD *)((char *)&v5->super.super.isa + v70) = v31;
          continue;
        case 8u:
          v5->_hasSubjectDistance = 1;
          v60 = *v6;
          v61 = *(_QWORD *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFFBLL && v61 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v62 = *(float *)(*(_QWORD *)&v4[*v9] + v61);
            *(_QWORD *)&v4[v60] = v61 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v62 = 0.0;
          }
          v5->_subjectDistance = v62;
          continue;
        case 9u:
          v63 = 0;
          v64 = 0;
          v24 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_113;
          continue;
      }
      while (1)
      {
        v65 = *v6;
        v66 = *(_QWORD *)&v4[v65];
        v67 = v66 + 1;
        if (v66 == -1 || v67 > *(_QWORD *)&v4[*v7])
          break;
        v68 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v66);
        *(_QWORD *)&v4[v65] = v67;
        v24 |= (unint64_t)(v68 & 0x7F) << v63;
        if ((v68 & 0x80) == 0)
          goto LABEL_103;
        v63 += 7;
        v17 = v64++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_105;
        }
      }
      v4[*v8] = 1;
LABEL_103:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_105:
      if (v24 >= 0x2F)
        LODWORD(v24) = 0;
      v69 = 52;
LABEL_108:
      *(_DWORD *)((char *)&v5->super.super.isa + v69) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_113:
    v71 = 0;
  else
LABEL_114:
    v71 = v5;

  return v71;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_portType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasTopLeftCornerRow)
    PBDataWriterWriteUint32Field();
  if (self->_hasTopLeftCornerColumn)
    PBDataWriterWriteUint32Field();
  if (self->_hasWidth)
    PBDataWriterWriteUint32Field();
  if (self->_hasHeight)
    PBDataWriterWriteUint32Field();
  if (self->_hasLuxLevel)
    PBDataWriterWriteUint32Field();
  if (self->_hasSubjectDistance)
    PBDataWriterWriteFloatField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMCameraCaptureAutoFocusROI writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMCameraCaptureAutoFocusROI)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  BMCameraCaptureAutoFocusROI *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BMCameraCaptureAutoFocusROI *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id *v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  BMCameraCaptureAutoFocusROI *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  BMCameraCaptureAutoFocusROI *v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  id *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  _QWORD v114[3];

  v114[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("portType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("focusRegionType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
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
          if (!a4)
          {
            v10 = 0;
            a4 = 0;
            goto LABEL_79;
          }
          v59 = a4;
          v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v111 = *MEMORY[0x1E0CB2D50];
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("focusRegionType"));
          v112 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = v61;
          v16 = (void *)v62;
          v64 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v63, 2, v62);
          v10 = 0;
          a4 = 0;
          *v59 = v64;
          goto LABEL_78;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMCameraCaptureAutoFocusROIFocusRegionTypeFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topLeftCornerRow"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = a4;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v34 = 0;
LABEL_78:

          goto LABEL_79;
        }
        v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v109 = *MEMORY[0x1E0CB2D50];
        v29 = v10;
        v30 = objc_alloc(MEMORY[0x1E0CB3940]);
        v75 = objc_opt_class();
        v31 = v30;
        v10 = v29;
        v94 = (id)objc_msgSend(v31, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v75, CFSTR("topLeftCornerRow"));
        v110 = v94;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v28, 2, v32);
        v34 = 0;
        a4 = 0;
        *v88 = v33;
LABEL_77:

        goto LABEL_78;
      }
      v95 = v8;
      v17 = self;
      v93 = v16;
    }
    else
    {
      v95 = v8;
      v17 = self;
      v93 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topLeftCornerColumn"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v16;
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v94 = 0;
          v34 = v93;
          v32 = v18;
          self = v17;
          v8 = v95;
          goto LABEL_77;
        }
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = *MEMORY[0x1E0D025B8];
        v107 = *MEMORY[0x1E0CB2D50];
        v37 = v10;
        v38 = objc_alloc(MEMORY[0x1E0CB3940]);
        v76 = objc_opt_class();
        v39 = v38;
        v10 = v37;
        v32 = v18;
        v92 = (id)objc_msgSend(v39, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v76, CFSTR("topLeftCornerColumn"));
        v108 = v92;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v36;
        v16 = v89;
        v90 = (void *)v40;
        v42 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v41, 2);
        v94 = 0;
        a4 = 0;
        *v88 = v42;
        goto LABEL_83;
      }
      v84 = v18;
      v94 = v18;
    }
    else
    {
      v84 = v18;
      v94 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("width"));
    v19 = objc_claimAutoreleasedReturnValue();
    v90 = (void *)v19;
    if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v92 = 0;
LABEL_25:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("height"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      self = v17;
      v87 = v10;
      if (v21 && (objc_opt_class(), v8 = v95, (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v91 = 0;
            a4 = 0;
            v32 = v84;
            goto LABEL_75;
          }
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = *MEMORY[0x1E0D025B8];
          v103 = *MEMORY[0x1E0CB2D50];
          v54 = self;
          v55 = objc_alloc(MEMORY[0x1E0CB3940]);
          v78 = objc_opt_class();
          v56 = v55;
          self = v54;
          v85 = (id)objc_msgSend(v56, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v78, CFSTR("height"));
          v104 = v85;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v52;
          v16 = v89;
          v58 = v53;
          v10 = v87;
          v91 = 0;
          a4 = 0;
          *v88 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v22);
          goto LABEL_73;
        }
        v91 = v21;
      }
      else
      {
        v91 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("luxLevel"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v7;
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v85 = 0;
            a4 = 0;
            goto LABEL_73;
          }
          v65 = self;
          v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v86 = *MEMORY[0x1E0D025B8];
          v101 = *MEMORY[0x1E0CB2D50];
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("luxLevel"));
          v102 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v66;
          self = v65;
          v7 = v83;
          v68 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v86, 2, v23);
          v85 = 0;
          a4 = 0;
          *v88 = v68;
LABEL_72:

          v10 = v87;
          v16 = v89;
LABEL_73:
          v32 = v84;

          goto LABEL_74;
        }
        v85 = v22;
      }
      else
      {
        v85 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subjectDistance"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v25 = 0;
            a4 = 0;
            goto LABEL_72;
          }
          v24 = self;
          v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v99 = *MEMORY[0x1E0CB2D50];
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("subjectDistance"));
          v100 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v69, 2, v26);
          v25 = 0;
          a4 = 0;
          *v88 = v70;
          goto LABEL_71;
        }
        v24 = self;
        v25 = v23;
      }
      else
      {
        v24 = self;
        v25 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientApplicationIDType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v43 = v26;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v80 = *MEMORY[0x1E0D025B8];
              v97 = *MEMORY[0x1E0CB2D50];
              v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("clientApplicationIDType"));
              v98 = v73;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *v88 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v80, 2, v74);

            }
            v27 = 0;
            a4 = 0;
            goto LABEL_71;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString(v26));
          v43 = (id)objc_claimAutoreleasedReturnValue();
        }
        v27 = v43;
      }
      else
      {
        v27 = 0;
      }
      v71 = objc_msgSend(v87, "intValue");
      LODWORD(v79) = objc_msgSend(v27, "intValue");
      a4 = -[BMCameraCaptureAutoFocusROI initWithPortType:focusRegionType:topLeftCornerRow:topLeftCornerColumn:width:height:luxLevel:subjectDistance:clientApplicationIDType:](v24, "initWithPortType:focusRegionType:topLeftCornerRow:topLeftCornerColumn:width:height:luxLevel:subjectDistance:clientApplicationIDType:", v95, v71, v93, v94, v92, v91, v85, v25, v79);
      v24 = (BMCameraCaptureAutoFocusROI *)a4;
LABEL_71:

      self = v24;
      v7 = v83;
      goto LABEL_72;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v92 = v20;
      goto LABEL_25;
    }
    if (a4)
    {
      v44 = a4;
      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v105 = *MEMORY[0x1E0CB2D50];
      v47 = v10;
      v48 = objc_alloc(MEMORY[0x1E0CB3940]);
      v77 = objc_opt_class();
      v49 = v48;
      v10 = v47;
      v91 = (id)objc_msgSend(v49, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v77, CFSTR("width"));
      v106 = v91;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v46;
      v16 = v89;
      v51 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v50, 2, v21);
      v92 = 0;
      a4 = 0;
      *v44 = v51;
      v32 = v84;
      self = v17;
LABEL_74:
      v8 = v95;
LABEL_75:

LABEL_76:
      v34 = v93;
      goto LABEL_77;
    }
    v92 = 0;
    v32 = v84;
LABEL_83:
    self = v17;
    v8 = v95;
    goto LABEL_76;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v12 = a4;
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0D025B8];
    v113 = *MEMORY[0x1E0CB2D50];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("portType"));
    v114[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2, v9);
    v8 = 0;
    a4 = 0;
    *v12 = v15;
LABEL_79:

    goto LABEL_80;
  }
  v8 = 0;
LABEL_80:

  return (BMCameraCaptureAutoFocusROI *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[9];
  _QWORD v35[11];

  v35[9] = *MEMORY[0x1E0C80C00];
  -[BMCameraCaptureAutoFocusROI portType](self, "portType");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCameraCaptureAutoFocusROI focusRegionType](self, "focusRegionType"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMCameraCaptureAutoFocusROI hasTopLeftCornerRow](self, "hasTopLeftCornerRow"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerRow](self, "topLeftCornerRow"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMCameraCaptureAutoFocusROI hasTopLeftCornerColumn](self, "hasTopLeftCornerColumn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI topLeftCornerColumn](self, "topLeftCornerColumn"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMCameraCaptureAutoFocusROI hasWidth](self, "hasWidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI width](self, "width"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMCameraCaptureAutoFocusROI hasHeight](self, "hasHeight"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI height](self, "height"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  if (-[BMCameraCaptureAutoFocusROI hasLuxLevel](self, "hasLuxLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMCameraCaptureAutoFocusROI luxLevel](self, "luxLevel"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  if (!-[BMCameraCaptureAutoFocusROI hasSubjectDistance](self, "hasSubjectDistance")
    || (-[BMCameraCaptureAutoFocusROI subjectDistance](self, "subjectDistance"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMCameraCaptureAutoFocusROI subjectDistance](self, "subjectDistance");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMCameraCaptureAutoFocusROI subjectDistance](self, "subjectDistance");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCameraCaptureAutoFocusROI clientApplicationIDType](self, "clientApplicationIDType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("portType");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v12;
  v35[0] = v12;
  v34[1] = CFSTR("focusRegionType");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v35[1] = v13;
  v34[2] = CFSTR("topLeftCornerRow");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v3;
  v26 = (void *)v14;
  v35[2] = v14;
  v34[3] = CFSTR("topLeftCornerColumn");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v4;
  v25 = (void *)v15;
  v35[3] = v15;
  v34[4] = CFSTR("width");
  v16 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v5;
  v35[4] = v16;
  v34[5] = CFSTR("height");
  v17 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v6;
  v35[5] = v17;
  v34[6] = CFSTR("luxLevel");
  v19 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v7;
  v35[6] = v19;
  v34[7] = CFSTR("subjectDistance");
  v21 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[7] = v21;
  v34[8] = CFSTR("clientApplicationIDType");
  v22 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[8] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_40;
  }
  else
  {

    if (v10)
      goto LABEL_40;
  }

LABEL_40:
  if (!v32)

  if (!v33)
  if (!v20)

  if (!v18)
  if (v29)
  {
    if (v30)
      goto LABEL_50;
LABEL_55:

    if (v31)
      goto LABEL_51;
LABEL_56:

    goto LABEL_51;
  }

  if (!v30)
    goto LABEL_55;
LABEL_50:
  if (!v31)
    goto LABEL_56;
LABEL_51:

  return v23;
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
  BOOL v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  int v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMCameraCaptureAutoFocusROI portType](self, "portType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portType");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMCameraCaptureAutoFocusROI portType](self, "portType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "portType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_39;
    }
    v13 = -[BMCameraCaptureAutoFocusROI focusRegionType](self, "focusRegionType");
    if (v13 == objc_msgSend(v5, "focusRegionType"))
    {
      if (!-[BMCameraCaptureAutoFocusROI hasTopLeftCornerRow](self, "hasTopLeftCornerRow")
        && !objc_msgSend(v5, "hasTopLeftCornerRow")
        || -[BMCameraCaptureAutoFocusROI hasTopLeftCornerRow](self, "hasTopLeftCornerRow")
        && objc_msgSend(v5, "hasTopLeftCornerRow")
        && (v14 = -[BMCameraCaptureAutoFocusROI topLeftCornerRow](self, "topLeftCornerRow"),
            v14 == objc_msgSend(v5, "topLeftCornerRow")))
      {
        if (!-[BMCameraCaptureAutoFocusROI hasTopLeftCornerColumn](self, "hasTopLeftCornerColumn")
          && !objc_msgSend(v5, "hasTopLeftCornerColumn")
          || -[BMCameraCaptureAutoFocusROI hasTopLeftCornerColumn](self, "hasTopLeftCornerColumn")
          && objc_msgSend(v5, "hasTopLeftCornerColumn")
          && (v15 = -[BMCameraCaptureAutoFocusROI topLeftCornerColumn](self, "topLeftCornerColumn"),
              v15 == objc_msgSend(v5, "topLeftCornerColumn")))
        {
          if (!-[BMCameraCaptureAutoFocusROI hasWidth](self, "hasWidth") && !objc_msgSend(v5, "hasWidth")
            || -[BMCameraCaptureAutoFocusROI hasWidth](self, "hasWidth")
            && objc_msgSend(v5, "hasWidth")
            && (v16 = -[BMCameraCaptureAutoFocusROI width](self, "width"), v16 == objc_msgSend(v5, "width")))
          {
            if (!-[BMCameraCaptureAutoFocusROI hasHeight](self, "hasHeight")
              && !objc_msgSend(v5, "hasHeight")
              || -[BMCameraCaptureAutoFocusROI hasHeight](self, "hasHeight")
              && objc_msgSend(v5, "hasHeight")
              && (v17 = -[BMCameraCaptureAutoFocusROI height](self, "height"),
                  v17 == objc_msgSend(v5, "height")))
            {
              if (!-[BMCameraCaptureAutoFocusROI hasLuxLevel](self, "hasLuxLevel")
                && !objc_msgSend(v5, "hasLuxLevel")
                || -[BMCameraCaptureAutoFocusROI hasLuxLevel](self, "hasLuxLevel")
                && objc_msgSend(v5, "hasLuxLevel")
                && (v18 = -[BMCameraCaptureAutoFocusROI luxLevel](self, "luxLevel"),
                    v18 == objc_msgSend(v5, "luxLevel")))
              {
                if (!-[BMCameraCaptureAutoFocusROI hasSubjectDistance](self, "hasSubjectDistance")
                  && !objc_msgSend(v5, "hasSubjectDistance")
                  || -[BMCameraCaptureAutoFocusROI hasSubjectDistance](self, "hasSubjectDistance")
                  && objc_msgSend(v5, "hasSubjectDistance")
                  && (-[BMCameraCaptureAutoFocusROI subjectDistance](self, "subjectDistance"),
                      v20 = v19,
                      objc_msgSend(v5, "subjectDistance"),
                      v20 == v21))
                {
                  v22 = -[BMCameraCaptureAutoFocusROI clientApplicationIDType](self, "clientApplicationIDType");
                  v12 = v22 == objc_msgSend(v5, "clientApplicationIDType");
LABEL_40:

                  goto LABEL_41;
                }
              }
            }
          }
        }
      }
    }
LABEL_39:
    v12 = 0;
    goto LABEL_40;
  }
  v12 = 0;
LABEL_41:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)portType
{
  return self->_portType;
}

- (int)focusRegionType
{
  return self->_focusRegionType;
}

- (unsigned)topLeftCornerRow
{
  return self->_topLeftCornerRow;
}

- (BOOL)hasTopLeftCornerRow
{
  return self->_hasTopLeftCornerRow;
}

- (void)setHasTopLeftCornerRow:(BOOL)a3
{
  self->_hasTopLeftCornerRow = a3;
}

- (unsigned)topLeftCornerColumn
{
  return self->_topLeftCornerColumn;
}

- (BOOL)hasTopLeftCornerColumn
{
  return self->_hasTopLeftCornerColumn;
}

- (void)setHasTopLeftCornerColumn:(BOOL)a3
{
  self->_hasTopLeftCornerColumn = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (BOOL)hasWidth
{
  return self->_hasWidth;
}

- (void)setHasWidth:(BOOL)a3
{
  self->_hasWidth = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (BOOL)hasHeight
{
  return self->_hasHeight;
}

- (void)setHasHeight:(BOOL)a3
{
  self->_hasHeight = a3;
}

- (unsigned)luxLevel
{
  return self->_luxLevel;
}

- (BOOL)hasLuxLevel
{
  return self->_hasLuxLevel;
}

- (void)setHasLuxLevel:(BOOL)a3
{
  self->_hasLuxLevel = a3;
}

- (double)subjectDistance
{
  return self->_subjectDistance;
}

- (BOOL)hasSubjectDistance
{
  return self->_hasSubjectDistance;
}

- (void)setHasSubjectDistance:(BOOL)a3
{
  self->_hasSubjectDistance = a3;
}

- (int)clientApplicationIDType
{
  return self->_clientApplicationIDType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
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

    v4 = -[BMCameraCaptureAutoFocusROI initByReadFrom:]([BMCameraCaptureAutoFocusROI alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("portType"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("focusRegionType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("topLeftCornerRow"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("topLeftCornerColumn"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("width"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("height"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("luxLevel"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subjectDistance"), 1, 0, 8, 1, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientApplicationIDType"), 0, 0, 9, 4, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E730;
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
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("portType"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("focusRegionType"), 2, 4, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topLeftCornerRow"), 3, 4, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topLeftCornerColumn"), 4, 4, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("width"), 5, 4, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("height"), 6, 4, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("luxLevel"), 7, 4, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subjectDistance"), 8, 1, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientApplicationIDType"), 9, 4, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
