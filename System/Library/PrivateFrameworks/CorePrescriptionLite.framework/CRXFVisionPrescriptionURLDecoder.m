@implementation CRXFVisionPrescriptionURLDecoder

- (CRXFVisionPrescriptionURLDecoder)initWithDeviceModel:(id)a3
{
  id v4;
  CRXFVisionPrescriptionURLDecoder *v5;
  os_log_t v6;
  OS_os_log *log;
  uint64_t v8;
  NSString *deviceModel;
  void *v10;
  uint64_t v11;
  HKQuantityRange *sphereRange;
  void *v13;
  uint64_t v14;
  HKQuantityRange *cylinderRange;
  void *v16;
  uint64_t v17;
  HKQuantityRange *axisRange;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRXFVisionPrescriptionURLDecoder;
  v5 = -[CRXFVisionPrescriptionURLDecoder init](&v20, sel_init);
  if (v5)
  {
    v6 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v8 = objc_msgSend(v4, "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD4048], "diopterUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKQuantityRangeInclusive();
    v11 = objc_claimAutoreleasedReturnValue();
    sphereRange = v5->_sphereRange;
    v5->_sphereRange = (HKQuantityRange *)v11;

    objc_msgSend(MEMORY[0x24BDD4048], "diopterUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKQuantityRangeInclusive();
    v14 = objc_claimAutoreleasedReturnValue();
    cylinderRange = v5->_cylinderRange;
    v5->_cylinderRange = (HKQuantityRange *)v14;

    objc_msgSend(MEMORY[0x24BDD4048], "degreeAngleUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKQuantityRangeInclusive();
    v17 = objc_claimAutoreleasedReturnValue();
    axisRange = v5->_axisRange;
    v5->_axisRange = (HKQuantityRange *)v17;

  }
  return v5;
}

- (id)prescriptionFromURL:(id)a3 withDescription:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  id v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *log;
  void *v53;
  void *v54;
  uint64_t v55;
  NSString *deviceModel;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  CRXFVisionPrescriptionURLDecoder *v71;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  unsigned __int16 v78;
  char v79;
  void *v80;
  __CFString *v81;
  unint64_t v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  CRXFVisionPrescriptionURLDecoder *v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[6];
  _QWORD v102[6];
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  int v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (__CFString *)a4;
  v83 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:].cold.1();
    v51 = 0;
    goto LABEL_73;
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  objc_msgSend(v8, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
  v94 = self;
  v81 = v7;
  if (!v11)
  {
    v47 = 0;
    v48 = 0;
    v92 = 0;
    v49 = 0;
    v50 = 0;
    v85 = 0;
    v86 = 0;
    v82 = 0;
    v89 = 1;
    v84 = 1;
LABEL_51:

    goto LABEL_53;
  }
  v12 = v11;
  v80 = v9;
  v79 = 0;
  v13 = 0;
  v82 = 0;
  v78 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v90 = 0;
  v92 = 0;
  v93 = 0;
  v96 = 0;
  v14 = *(_QWORD *)v98;
  v84 = 1;
  v89 = 1;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v98 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v15);
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("ls")))
        {
          v19 = (void *)MEMORY[0x24BDD3E50];
          objc_msgSend(MEMORY[0x24BDD4048], "diopterUnit");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[HKQuantityRange containsQuantity:](self->_sphereRange, "containsQuantity:", v21))
          {
            v22 = v21;

            v96 = v22;
          }
          goto LABEL_25;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("lc")))
        {
          v23 = (void *)MEMORY[0x24BDD3E50];
          objc_msgSend(MEMORY[0x24BDD4048], "diopterUnit");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v23, "quantityWithUnit:doubleValue:", v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          self = v94;
          if (-[HKQuantityRange containsQuantity:](v94->_cylinderRange, "containsQuantity:", v21))
          {
            v25 = v21;

            v93 = v25;
          }
          goto LABEL_25;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("la")))
        {
          objc_msgSend(v18, "doubleValue");
          if (v26 != 0.0)
          {
            v27 = v26;
            v28 = (void *)MEMORY[0x24BDD3E50];
            objc_msgSend(MEMORY[0x24BDD4048], "degreeAngleUnit");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "quantityWithUnit:doubleValue:", v29, v27);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            self = v94;
            if (-[HKQuantityRange containsQuantity:](v94->_axisRange, "containsQuantity:", v21))
            {
              v30 = v21;

              v92 = v30;
            }
            else
            {
              v89 = 0;
            }
            goto LABEL_25;
          }
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("rs")))
        {
          v31 = (void *)MEMORY[0x24BDD3E50];
          objc_msgSend(MEMORY[0x24BDD4048], "diopterUnit");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          self = v94;
          if (-[HKQuantityRange containsQuantity:](v94->_sphereRange, "containsQuantity:", v21))
          {
            v33 = v21;

            v90 = v33;
          }
        }
        else
        {
          if (!objc_msgSend(v17, "isEqualToString:", CFSTR("rc")))
          {
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("ra")))
            {
              objc_msgSend(v18, "doubleValue");
              if (v37 != 0.0)
              {
                v38 = v37;
                v39 = (void *)MEMORY[0x24BDD3E50];
                objc_msgSend(MEMORY[0x24BDD4048], "degreeAngleUnit");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "quantityWithUnit:doubleValue:", v40, v38);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                self = v94;
                if (-[HKQuantityRange containsQuantity:](v94->_axisRange, "containsQuantity:", v21))
                {
                  v41 = v21;

                  v85 = v41;
                }
                else
                {
                  v84 = 0;
                }
                goto LABEL_25;
              }
            }
            else if (objc_msgSend(v17, "isEqualToString:", CFSTR("acc")))
            {
              if (objc_msgSend(v18, "length") == 38 || objc_msgSend(v18, "length") == 32)
              {
                objc_msgSend(MEMORY[0x24BDBCE50], "crxu_dataWithHexString:", v18);
                v42 = objc_claimAutoreleasedReturnValue();

                v86 = (void *)v42;
              }
            }
            else if (objc_msgSend(v17, "isEqualToString:", CFSTR("cc")))
            {
              v82 = strtoul((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), 0, 10);
            }
            else if (objc_msgSend(v17, "isEqualToString:", CFSTR("c")))
            {
              objc_msgSend(v80, "queryItems");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "count") - 1;

              if (v13 == v44)
              {
                v78 = strtoul((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), 0, 16);
                v79 = 1;
              }
            }
LABEL_26:
            ++v13;
            goto LABEL_27;
          }
          v34 = (void *)MEMORY[0x24BDD3E50];
          objc_msgSend(MEMORY[0x24BDD4048], "diopterUnit");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v34, "quantityWithUnit:doubleValue:", v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          self = v94;
          if (-[HKQuantityRange containsQuantity:](v94->_cylinderRange, "containsQuantity:", v21))
          {
            v36 = v21;

            v87 = v36;
          }
        }
LABEL_25:

        goto LABEL_26;
      }
LABEL_27:

      ++v15;
    }
    while (v12 != v15);
    v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
    v12 = v45;
  }
  while (v45);

  if ((v79 & 1) != 0)
  {
    objc_msgSend(v83, "absoluteString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "substringToIndex:", objc_msgSend(v46, "length") - 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v80;
    v7 = v81;
    v47 = v96;
    v48 = v93;
    v49 = v90;
    if (-[CRXFVisionPrescriptionURLDecoder computeCRC16ForString:](self, "computeCRC16ForString:", v10) == v78)
    {
      v50 = v87;
      goto LABEL_51;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:].cold.3();

    v51 = 0;
    v53 = v86;
    v70 = v87;
    v68 = v85;
LABEL_71:
    v69 = v92;
    goto LABEL_72;
  }
  v9 = v80;
  v7 = v81;
  v47 = v96;
  v48 = v93;
  v49 = v90;
  v50 = v87;
LABEL_53:
  log = self->_log;
  v96 = v47;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v73 = v50;
    v74 = (void *)MEMORY[0x24BDD16E0];
    v75 = log;
    objc_msgSend(v74, "numberWithBool:", v89 & 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v84 & 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136317186;
    v104 = "-[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:]";
    v105 = 1024;
    v106 = 246;
    v107 = 2112;
    v108 = v48;
    v109 = 2112;
    v110 = v47;
    v111 = 2112;
    v112 = v73;
    v113 = 2112;
    v114 = v49;
    v115 = 2112;
    v116 = v86;
    v117 = 2112;
    v118 = v76;
    v7 = v81;
    v119 = 2112;
    v120 = v77;
    _os_log_debug_impl(&dword_239FC4000, v75, OS_LOG_TYPE_DEBUG, "%s @%d: lc: %@, ls: %@, rc: %@, rs: %@, acc: %@, la: %@, ra: %@", buf, 0x58u);

    v50 = v73;
    self = v94;

  }
  v53 = v86;
  if (!v48 || !v47 || !v50 || !v49 || !v86 || ((v89 ^ 1) & 1) != 0 || ((v84 ^ 1) & 1) != 0)
  {
    v71 = self;
    v70 = v50;
    if (os_log_type_enabled((os_log_t)v71->_log, OS_LOG_TYPE_DEBUG))
      -[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:].cold.2();
    v51 = 0;
    v68 = v85;
    v53 = v86;
    goto LABEL_71;
  }
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C10]), "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v49, v50, v85, 0, 0, 0, 0, 0);
  v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3C10]), "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v47, v48, v92, 0, 0, 0, 0, 0);
  v55 = *MEMORY[0x24BDD4430];
  v101[0] = *MEMORY[0x24BDD4418];
  v101[1] = v55;
  deviceModel = self->_deviceModel;
  v102[0] = v86;
  v102[1] = deviceModel;
  v101[2] = *MEMORY[0x24BDD4420];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v82);
  v57 = objc_claimAutoreleasedReturnValue();
  v88 = v50;
  v58 = (void *)v57;
  v59 = CFSTR("Lenses");
  v60 = *MEMORY[0x24BDD31A0];
  if (v7)
    v59 = v7;
  v102[2] = v57;
  v102[3] = v59;
  v61 = *MEMORY[0x24BDD3210];
  v101[3] = v60;
  v101[4] = v61;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "UUIDString");
  v91 = v49;
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v101[5] = *MEMORY[0x24BDD3218];
  v102[4] = v63;
  v102[5] = &unk_250B0AAC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 6);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x24BDD3C18];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "prescriptionWithRightEyeSpecification:leftEyeSpecification:dateIssued:expirationDate:device:metadata:", v54, v95, v66, 0, v67, v64);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v85;
  v7 = v81;

  v69 = v92;
  v49 = v91;
  v70 = v88;
LABEL_72:

LABEL_73:
  return v51;
}

- (unsigned)computeURLChecksum:(id)a3
{
  void *v4;
  unsigned __int16 v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "length") >= 7)
  {
    objc_msgSend(v4, "substringWithRange:", objc_msgSend(v4, "length") - 7, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("&c=")))
    {
      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 7);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    v5 = -[CRXFVisionPrescriptionURLDecoder computeCRC16ForString:](self, "computeCRC16ForString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)computeCRC16ForString:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int16 v8;
  int v9;
  unsigned int v10;

  v3 = a3;
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  if (v6 < 1)
  {
    v8 = -1;
  }
  else
  {
    v7 = &v5[v6];
    v8 = -1;
    do
    {
      v9 = *v5++;
      v10 = v9 ^ HIBYTE(v8) ^ ((v9 ^ HIBYTE(v8)) >> 4);
      v8 = (v10 | (v8 << 8)) ^ ((_WORD)v10 << 12) ^ (32 * v10);
    }
    while (v5 < v7);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisRange, 0);
  objc_storeStrong((id *)&self->_cylinderRange, 0);
  objc_storeStrong((id *)&self->_sphereRange, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)prescriptionFromURL:withDescription:.cold.1()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 59;
  _os_log_error_impl(&dword_239FC4000, v0, OS_LOG_TYPE_ERROR, "%s @%d: Can't get query items.", (uint8_t *)v1, 0x12u);
}

- (void)prescriptionFromURL:withDescription:.cold.2()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 250;
  _os_log_debug_impl(&dword_239FC4000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: Invalid or missing RX values", (uint8_t *)v1, 0x12u);
}

- (void)prescriptionFromURL:withDescription:.cold.3()
{
  int v0;
  int v1;
  os_log_t v2;
  _WORD v3[10];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v3[7] = 239;
  v3[9] = 1026;
  v4 = v0;
  v5 = 1026;
  v6 = v1;
  _os_log_debug_impl(&dword_239FC4000, v2, OS_LOG_TYPE_DEBUG, "%s @%d: checksum failed: %{public}04x vs %{public}04x", (uint8_t *)v3, 0x1Eu);
}

@end
